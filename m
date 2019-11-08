Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34090F4030
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 07:04:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbfKHGEP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 01:04:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:51582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725802AbfKHGEP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 01:04:15 -0500
Received: from localhost (unknown [106.200.194.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9C939214DB;
        Fri,  8 Nov 2019 06:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573193053;
        bh=o3o84dh6SX5JsYrh3wowPyPZg6S30bJetGCU8Hk+g6o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R2LvwRcRtxTSNRrp1AMC2ZMlWFihEMqvPQwjp91Vnolgo2K6CFIADIn6D1yQjTlEu
         Ujsiy1pstR3XZqc7/V6+Q50eOT8GEjTnSUnwnGfMdNp3smfOMznMjJJmQPdqTFj8NS
         jczooZyWu0kTqA8YOopjh3OgRyXdz5kD/wHw9rq0=
Date:   Fri, 8 Nov 2019 11:34:09 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Elliot Berman <eberman@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org, tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/17] firmware: qcom_scm-64: Move svc/cmd/owner into
 qcom_scm_desc
Message-ID: <20191108060409.GZ952516@vkoul-mobl>
References: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
 <1572917256-24205-6-git-send-email-eberman@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1572917256-24205-6-git-send-email-eberman@codeaurora.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04-11-19, 17:27, Elliot Berman wrote:
> Service, command, and owner IDs are all part of qcom_scm_desc struct and
> have no special reason to be a function argument (or hard-coded in the
> case of owner). Moving them to be part of qcom_scm_desc struct improves
> readability.
> 
> Signed-off-by: Elliot Berman <eberman@codeaurora.org>
> ---
>  drivers/firmware/qcom_scm-64.c | 192 +++++++++++++++++++++++++----------------
>  1 file changed, 120 insertions(+), 72 deletions(-)
> 
> diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
> index ead0b5f..76412a5 100644
> --- a/drivers/firmware/qcom_scm-64.c
> +++ b/drivers/firmware/qcom_scm-64.c
> @@ -46,8 +46,11 @@ enum qcom_scm_arg_types {
>   * @res:	The values returned by the secure syscall
>   */
>  struct qcom_scm_desc {
> +	u32 svc;
> +	u32 cmd;
>  	u32 arginfo;
>  	u64 args[MAX_QCOM_SCM_ARGS];
> +	u32 owner;
>  };
>  
>  static u64 qcom_smccc_convention = -1;
> @@ -62,14 +65,16 @@ static DEFINE_MUTEX(qcom_scm_lock);
>  #define SMCCC_N_EXT_ARGS	(MAX_QCOM_SCM_ARGS - SMCCC_N_REG_ARGS + 1)
>  
>  static void __qcom_scm_call_do_quirk(const struct qcom_scm_desc *desc,
> -			       struct arm_smccc_res *res, u32 fn_id,
> -			       u64 x5, u32 type)
> +			       struct arm_smccc_res *res, u64 x5, u32 type)
>  {
>  	u64 cmd;
>  	struct arm_smccc_quirk quirk = { .id = ARM_SMCCC_QUIRK_QCOM_A6 };
>  
> -	cmd = ARM_SMCCC_CALL_VAL(type, qcom_smccc_convention,
> -				 ARM_SMCCC_OWNER_SIP, fn_id);
> +	cmd = ARM_SMCCC_CALL_VAL(
> +		type,
> +		qcom_smccc_convention,
> +		desc->owner,
> +		SMCCC_FUNCNUM(desc->svc, desc->cmd));
>  
>  	quirk.state.a6 = 0;
>  
> @@ -85,22 +90,19 @@ static void __qcom_scm_call_do_quirk(const struct qcom_scm_desc *desc,
>  }
>  
>  static void qcom_scm_call_do_smccc(const struct qcom_scm_desc *desc,
> -			     struct arm_smccc_res *res, u32 fn_id,
> -			     u64 x5, bool atomic)
> +			     struct arm_smccc_res *res, u64 x5, bool atomic)
>  {
>  	int retry_count = 0;
>  
>  	if (atomic) {
> -		__qcom_scm_call_do_quirk(desc, res, fn_id, x5,
> -					 ARM_SMCCC_FAST_CALL);
> +		__qcom_scm_call_do_quirk(desc, res, x5, ARM_SMCCC_FAST_CALL);
>  		return;
>  	}
>  
>  	do {
>  		mutex_lock(&qcom_scm_lock);
>  
> -		__qcom_scm_call_do_quirk(desc, res, fn_id, x5,
> -					 ARM_SMCCC_STD_CALL);
> +		__qcom_scm_call_do_quirk(desc, res, x5, ARM_SMCCC_STD_CALL);
>  
>  		mutex_unlock(&qcom_scm_lock);
>  
> @@ -112,13 +114,12 @@ static void qcom_scm_call_do_smccc(const struct qcom_scm_desc *desc,
>  	}  while (res->a0 == QCOM_SCM_V2_EBUSY);
>  }
>  
> -static int ___qcom_scm_call_smccc(struct device *dev, u32 svc_id, u32 cmd_id,
> +static int ___qcom_scm_call_smccc(struct device *dev,
>  				  const struct qcom_scm_desc *desc,
>  				  struct arm_smccc_res *res, bool atomic)
>  {
>  	int arglen = desc->arginfo & 0xf;
>  	int i;
> -	u32 fn_id = SMCCC_FUNCNUM(svc_id, cmd_id);
>  	u64 x5 = desc->args[SMCCC_N_REG_ARGS - 1];
>  	dma_addr_t args_phys = 0;
>  	void *args_virt = NULL;
> @@ -157,7 +158,7 @@ static int ___qcom_scm_call_smccc(struct device *dev, u32 svc_id, u32 cmd_id,
>  		x5 = args_phys;
>  	}
>  
> -	qcom_scm_call_do_smccc(desc, res, fn_id, x5, atomic);
> +	qcom_scm_call_do_smccc(desc, res, x5, atomic);
>  
>  	if (args_virt) {
>  		dma_unmap_single(dev, args_phys, alloc_len, DMA_TO_DEVICE);
> @@ -180,12 +181,11 @@ static int ___qcom_scm_call_smccc(struct device *dev, u32 svc_id, u32 cmd_id,
>   * Sends a command to the SCM and waits for the command to finish processing.
>   * This should *only* be called in pre-emptible context.
>   */
> -static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
> -			 const struct qcom_scm_desc *desc,
> +static int qcom_scm_call(struct device *dev, const struct qcom_scm_desc *desc,
>  			 struct arm_smccc_res *res)
>  {
>  	might_sleep();
> -	return ___qcom_scm_call_smccc(dev, svc_id, cmd_id, desc, res, false);
> +	return ___qcom_scm_call_smccc(dev, desc, res, false);
>  }
>  
>  /**
> @@ -199,11 +199,11 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
>   * Sends a command to the SCM and waits for the command to finish processing.
>   * This can be called in atomic context.
>   */
> -static int qcom_scm_call_atomic(struct device *dev, u32 svc_id, u32 cmd_id,
> +static int qcom_scm_call_atomic(struct device *dev,
>  				const struct qcom_scm_desc *desc,
>  				struct arm_smccc_res *res)
>  {
> -	return ___qcom_scm_call_smccc(dev, svc_id, cmd_id, desc, res, true);
> +	return ___qcom_scm_call_smccc(dev, desc, res, true);
>  }
>  
>  /**
> @@ -248,7 +248,11 @@ void __qcom_scm_cpu_power_down(u32 flags)
>  
>  int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
>  {
> -	struct qcom_scm_desc desc = {0};
> +	struct qcom_scm_desc desc = {
> +		.svc = QCOM_SCM_SVC_BOOT,
> +		.cmd = QCOM_SCM_BOOT_SET_REMOTE_STATE,
> +		.owner = ARM_SMCCC_OWNER_SIP,

Does this not leave some fields of desc uninitialized? Would it make
sense to do memset here first and then initialize. And since this
pattern seems used repeatedly, why not do:

        struct qcom_scm_desc desc;
        ...
        ACOM_INIT_SCM_DESC(desc, QCOM_SCM_SVC_BOOT,
                           QCOM_SCM_BOOT_SET_REMOTE_STATE,
                           ARM_SMCCC_OWNER_SIP);

Where:

#define ACOM_INIT_SCM_DESC(_desc, arg1, arg2, arg3)             \
        {                                                       \
                memset(_desc, 0, sizeof(*_desc));               \
                desc->svc = arg1;                               \
                desc->cmd = arg2;                               \
                desc->wner = arg3;                              \
        }

Or a function to do so...

-- 
~Vinod
