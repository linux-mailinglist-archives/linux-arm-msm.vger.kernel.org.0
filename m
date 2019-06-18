Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2861B4A8E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 19:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729642AbfFRRzl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 13:55:41 -0400
Received: from foss.arm.com ([217.140.110.172]:52732 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729285AbfFRRzl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 13:55:41 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30238344;
        Tue, 18 Jun 2019 10:55:40 -0700 (PDT)
Received: from fuggles.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B30693F738;
        Tue, 18 Jun 2019 10:55:38 -0700 (PDT)
Date:   Tue, 18 Jun 2019 18:55:36 +0100
From:   Will Deacon <will.deacon@arm.com>
To:     Vivek Gautam <vivek.gautam@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        david.brown@linaro.org
Subject: Re: [PATCH v3 1/4] firmware: qcom_scm-64: Add atomic version of
 qcom_scm_call
Message-ID: <20190618175536.GI4270@fuggles.cambridge.arm.com>
References: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
 <20190612071554.13573-2-vivek.gautam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190612071554.13573-2-vivek.gautam@codeaurora.org>
User-Agent: Mutt/1.11.1+86 (6f28e57d73f2) ()
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 12, 2019 at 12:45:51PM +0530, Vivek Gautam wrote:
> There are scnenarios where drivers are required to make a
> scm call in atomic context, such as in one of the qcom's
> arm-smmu-500 errata [1].
> 
> [1] ("https://source.codeaurora.org/quic/la/kernel/msm-4.9/commit/
>       drivers/iommu/arm-smmu.c?h=CogSystems-msm-49/
>       msm-4.9&id=da765c6c75266b38191b38ef086274943f353ea7")
> 
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/firmware/qcom_scm-64.c | 136 ++++++++++++++++++++++++++++-------------
>  1 file changed, 92 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
> index 91d5ad7cf58b..b6dca32c5ac4 100644
> --- a/drivers/firmware/qcom_scm-64.c
> +++ b/drivers/firmware/qcom_scm-64.c
> @@ -62,32 +62,71 @@ static DEFINE_MUTEX(qcom_scm_lock);
>  #define FIRST_EXT_ARG_IDX 3
>  #define N_REGISTER_ARGS (MAX_QCOM_SCM_ARGS - N_EXT_QCOM_SCM_ARGS + 1)
>  
> -/**
> - * qcom_scm_call() - Invoke a syscall in the secure world
> - * @dev:	device
> - * @svc_id:	service identifier
> - * @cmd_id:	command identifier
> - * @desc:	Descriptor structure containing arguments and return values
> - *
> - * Sends a command to the SCM and waits for the command to finish processing.
> - * This should *only* be called in pre-emptible context.
> -*/
> -static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
> -			 const struct qcom_scm_desc *desc,
> -			 struct arm_smccc_res *res)
> +static void __qcom_scm_call_do(const struct qcom_scm_desc *desc,
> +			       struct arm_smccc_res *res, u32 fn_id,
> +			       u64 x5, u32 type)
> +{
> +	u64 cmd;
> +	struct arm_smccc_quirk quirk = {.id = ARM_SMCCC_QUIRK_QCOM_A6};
> +
> +	cmd = ARM_SMCCC_CALL_VAL(type, qcom_smccc_convention,
> +				 ARM_SMCCC_OWNER_SIP, fn_id);
> +
> +	quirk.state.a6 = 0;
> +
> +	do {
> +		arm_smccc_smc_quirk(cmd, desc->arginfo, desc->args[0],
> +				    desc->args[1], desc->args[2], x5,
> +				    quirk.state.a6, 0, res, &quirk);
> +
> +		if (res->a0 == QCOM_SCM_INTERRUPTED)
> +			cmd = res->a0;
> +
> +	} while (res->a0 == QCOM_SCM_INTERRUPTED);
> +}
> +
> +static void qcom_scm_call_do(const struct qcom_scm_desc *desc,
> +			     struct arm_smccc_res *res, u32 fn_id,
> +			     u64 x5, bool atomic)
> +{

Maybe pass in the call type (ARM_SMCCC_FAST_CALL vs ARM_SMCCC_STD_CALL)
instead of "bool atomic"? Would certainly make the callsites easier to
understand.

> +	int retry_count = 0;
> +
> +	if (!atomic) {
> +		do {
> +			mutex_lock(&qcom_scm_lock);
> +
> +			__qcom_scm_call_do(desc, res, fn_id, x5,
> +					   ARM_SMCCC_STD_CALL);
> +
> +			mutex_unlock(&qcom_scm_lock);
> +
> +			if (res->a0 == QCOM_SCM_V2_EBUSY) {
> +				if (retry_count++ > QCOM_SCM_EBUSY_MAX_RETRY)
> +					break;
> +				msleep(QCOM_SCM_EBUSY_WAIT_MS);
> +			}
> +		}  while (res->a0 == QCOM_SCM_V2_EBUSY);
> +	} else {
> +		__qcom_scm_call_do(desc, res, fn_id, x5, ARM_SMCCC_FAST_CALL);
> +	}

Is it safe to make concurrent FAST calls?

Will
