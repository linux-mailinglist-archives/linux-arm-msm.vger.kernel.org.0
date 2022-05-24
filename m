Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D73065321CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 May 2022 05:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234086AbiEXD4G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 May 2022 23:56:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233309AbiEXDzy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 May 2022 23:55:54 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA99D19C39;
        Mon, 23 May 2022 20:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1653364553; x=1684900553;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DGcCckkF61WltcMI0jqjRYtrSETEtm9cvQ4zcqOtcFk=;
  b=RV9lpIQKg8UArEAMrMQp7wlCVnCPAfezDxkEUBuGB7yt7ZWv6llZjECT
   lefJ3PMCPgOCxQShIvSkTL1MR2qPTDy40/4MMgzJBOO//eoqy1fxmBsxv
   dUGbLL6CaDhP7A7G8HJ/CrzOyZB8ILAiGqZ0dE8JkCZnrW9sjJC8EJW7r
   M=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 23 May 2022 20:55:52 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2022 20:55:52 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 23 May 2022 20:55:51 -0700
Received: from [10.50.42.127] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 23 May
 2022 20:55:48 -0700
Message-ID: <28d8529c-28bb-a97a-b421-fcf83760788a@quicinc.com>
Date:   Tue, 24 May 2022 09:25:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Add debug support for TLB sync
 timeouts
Content-Language: en-US
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel" <joro@8bytes.org>
CC:     <iommu@lists.linux-foundation.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@chromium.org>, <quic_guptap@quicinc.com>
References: <20220523171847.21929-1-quic_saipraka@quicinc.com>
From:   Sai Prakash Ranjan <quic_saipraka@quicinc.com>
In-Reply-To: <20220523171847.21929-1-quic_saipraka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/23/2022 10:48 PM, Sai Prakash Ranjan wrote:
> TLB sync timeouts can be due to various reasons such as TBU power down
> or pending TCU/TBU invalidation/sync and so on. Debugging these often
> require dumping of some implementation defined registers to know the
> status of TBU/TCU operations and some of these registers are not
> accessible in non-secure world such as from kernel and requires SMC
> calls to read them in the secure world. So, add this debug support
> to dump implementation defined registers for TLB sync timeout issues.
>
> Signed-off-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 50 ++++++++++++++++++++++
>   drivers/iommu/arm/arm-smmu/arm-smmu.c      |  2 +
>   drivers/iommu/arm/arm-smmu/arm-smmu.h      |  4 ++
>   3 files changed, 56 insertions(+)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 7820711c4560..22e9a0085475 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -5,11 +5,19 @@
>   
>   #include <linux/acpi.h>
>   #include <linux/adreno-smmu-priv.h>
> +#include <linux/delay.h>
>   #include <linux/of_device.h>
>   #include <linux/qcom_scm.h>
>   
>   #include "arm-smmu.h"
>   
> +#define QCOM_DUMMY_VAL	-1
> +
> +/* Implementation Defined Register Space 0 registers */
> +#define QCOM_SMMU_STATS_SYNC_INV_TBU_ACK	0x5dc
> +#define QCOM_SMMU_TBU_PWR_STATUS		0x2204
> +#define QCOM_SMMU_MMU2QSS_AND_SAFE_WAIT_CNTR	0x2670
> +
>   struct qcom_smmu {
>   	struct arm_smmu_device smmu;
>   	bool bypass_quirk;
> @@ -22,6 +30,46 @@ static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>   	return container_of(smmu, struct qcom_smmu, smmu);
>   }
>   
> +static void qcom_smmu_tlb_sync(struct arm_smmu_device *smmu, int page,
> +				int sync, int status)
> +{
> +	u32 sync_inv_ack, sync_inv_progress, tbu_pwr_status;
> +	unsigned int spin_cnt, delay;
> +	u32 reg;
> +	int ret;
> +
> +	arm_smmu_writel(smmu, page, sync, QCOM_DUMMY_VAL);
> +	for (delay = 1; delay < TLB_LOOP_TIMEOUT; delay *= 2) {
> +		for (spin_cnt = TLB_SPIN_COUNT; spin_cnt > 0; spin_cnt--) {
> +			reg = arm_smmu_readl(smmu, page, status);
> +			if (!(reg & ARM_SMMU_sTLBGSTATUS_GSACTIVE))
> +				return;
> +			cpu_relax();
> +		}
> +		udelay(delay);
> +	}
> +
> +	sync_inv_ack = arm_smmu_readl(smmu, ARM_SMMU_IMPL_DEF0,
> +				      QCOM_SMMU_STATS_SYNC_INV_TBU_ACK);

Sorry, this doesn't work always, looks like on earlier chipsets this is a secure register and
reading it from non-secure world would probably blow. Also this register can be in other
implementation defined space for different chipsets. So I think we can use SCM call here
and have a device specific data based on already existing compatible for QCOM SoCs to
identify IMP_DEF space used.

> +	ret = qcom_scm_io_readl(smmu->ioaddr + QCOM_SMMU_TBU_PWR_STATUS,
> +				&tbu_pwr_status);
> +	if (ret)
> +		dev_err_ratelimited(smmu->dev,
> +				    "Failed to read TBU power status: %d\n", ret);
> +
> +	ret = qcom_scm_io_readl(smmu->ioaddr + QCOM_SMMU_MMU2QSS_AND_SAFE_WAIT_CNTR,
> +				&sync_inv_progress);
> +	if (ret)
> +		dev_err_ratelimited(smmu->dev,
> +				    "Failed to read SAFE WAIT counter: %d\n", ret);
> +
> +	dev_err_ratelimited(smmu->dev,
> +			    "TLB sync timed out -- SMMU may be deadlocked\n"
> +			    "TBU: sync_inv_ack %#x power_status %#x sync_inv_progress %#x\n",
> +			    sync_inv_ack, tbu_pwr_status, sync_inv_progress);
> +}
> +
>   static void qcom_adreno_smmu_write_sctlr(struct arm_smmu_device *smmu, int idx,
>   		u32 reg)
>   {
> @@ -374,6 +422,7 @@ static const struct arm_smmu_impl qcom_smmu_impl = {
>   	.def_domain_type = qcom_smmu_def_domain_type,
>   	.reset = qcom_smmu500_reset,
>   	.write_s2cr = qcom_smmu_write_s2cr,
> +	.tlb_sync = qcom_smmu_tlb_sync,
>   };
>   
>   static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
> @@ -382,6 +431,7 @@ static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
>   	.reset = qcom_smmu500_reset,
>   	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
>   	.write_sctlr = qcom_adreno_smmu_write_sctlr,
> +	.tlb_sync = qcom_smmu_tlb_sync,
>   };
>   
>   static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 2ed3594f384e..4c5b51109835 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -2099,6 +2099,8 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>   	if (IS_ERR(smmu->base))
>   		return PTR_ERR(smmu->base);
>   	ioaddr = res->start;
> +	smmu->ioaddr = ioaddr;
> +
>   	/*
>   	 * The resource size should effectively match the value of SMMU_TOP;
>   	 * stash that temporarily until we know PAGESIZE to validate it with.
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index 2b9b42fb6f30..8cf6567d970f 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -278,6 +278,7 @@ struct arm_smmu_device {
>   	struct device			*dev;
>   
>   	void __iomem			*base;
> +	phys_addr_t			ioaddr;
>   	unsigned int			numpage;
>   	unsigned int			pgshift;
>   
> @@ -502,6 +503,9 @@ static inline void arm_smmu_writeq(struct arm_smmu_device *smmu, int page,
>   
>   #define ARM_SMMU_GR0		0
>   #define ARM_SMMU_GR1		1
> +
> +#define ARM_SMMU_IMPL_DEF0	2
> +
>   #define ARM_SMMU_CB(s, n)	((s)->numpage + (n))
>   
>   #define arm_smmu_gr0_read(s, o)		\

