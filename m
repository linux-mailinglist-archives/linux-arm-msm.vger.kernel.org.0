Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5F7265B81
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 10:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725824AbgIKIZy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 04:25:54 -0400
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56]:51770
        "EHLO a27-56.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725798AbgIKIZs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 04:25:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599812746;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=yX4fvAPceX5+/piaZQeXdCCWrW97OFOzIlS8MV7usjE=;
        b=Skfsz4zzk8lxCh+e4DpGXxDOwvY5knhVZZcafi0GlqaPgDliHuhr0LVOHauU2vWi
        6OD5MnXshbEcjeuVU57OJRvBwsreKDILbSPPmTWbZuMqA7SE8F4xm91lZzSC6phRTOA
        Y5yi2C2aTibGP7eEkiTjy676JErpwyX1Tgo0pGzI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599812746;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=yX4fvAPceX5+/piaZQeXdCCWrW97OFOzIlS8MV7usjE=;
        b=Dx0JeaT7BoVECxLHCh0iWtpzBADGHpgeXjvZtaXVS/vQ0sNBc6p6MDPMKjOmKNPi
        AaieeJ81qwMKmPvw+wjqndsZvUaJU6MxaR4IIEjWPz//yNrZr6kkT3At+UBur0qZh4g
        MVtQiB7YtfByj4NIlGQT9AzeyjEiDXoDS2HtMNq0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 11 Sep 2020 08:25:46 +0000
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 4/8] iommu/arm-smmu-qcom: Emulate bypass by using
 context banks
In-Reply-To: <20200904155513.282067-5-bjorn.andersson@linaro.org>
References: <20200904155513.282067-1-bjorn.andersson@linaro.org>
 <20200904155513.282067-5-bjorn.andersson@linaro.org>
Message-ID: <010101747c453de8-892b662e-2836-4c7e-a61d-07b0542e8111-000000@us-west-2.amazonses.com>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.11-54.240.27.56
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-04 21:25, Bjorn Andersson wrote:
> Some firmware found on various Qualcomm platforms traps writes to S2CR
> of type BYPASS and writes FAULT into the register. In particular, this
> prevents us from marking the streams for the display controller as
> BYPASS to allow continued scanout of the screen through the
> initialization of the ARM SMMU.
> 
> This adds a Qualcomm specific cfg_probe function, which probes for the
> broken behavior of the S2CR registers and implements a custom
> alloc_context_bank() that when necessary allocates a context bank
> (without translation) for these domains as well.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v2:
> - Move quirk from arm_smmudevice to qcom_smmu, as we localize the quirk
>   handling to the Qualcomm specific implemntation.
> 
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 52 ++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 229fc8ff8cea..284761a1cd8e 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -11,8 +11,14 @@
> 
>  struct qcom_smmu {
>  	struct arm_smmu_device smmu;
> +	bool bypass_broken;
>  };
> 
> +static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
> +{
> +	return container_of(smmu, struct qcom_smmu, smmu);
> +}
> +
>  #define QCOM_ADRENO_SMMU_GPU_SID 0
> 
>  static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
> @@ -162,6 +168,50 @@ static const struct of_device_id
> qcom_smmu_client_of_match[] __maybe_unused = {
>  	{ }
>  };
> 
> +static int qcom_smmu_alloc_context_bank(struct arm_smmu_domain 
> *smmu_domain,
> +					struct arm_smmu_device *smmu,
> +					struct device *dev, int start)
> +{
> +	struct iommu_domain *domain = &smmu_domain->domain;
> +	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
> +
> +	/* Keep identity domains as bypass, unless bypass is broken */
> +	if (domain->type == IOMMU_DOMAIN_IDENTITY && !qsmmu->bypass_broken)
> +		return ARM_SMMU_CBNDX_BYPASS;
> +
> +	/*
> +	 * The identity domain to emulate bypass is the only domain without a
> +	 * dev, use the last context bank for this to avoid collisions with
> +	 * active contexts during initialization.
> +	 */
> +	if (!dev)
> +		start = smmu->num_context_banks - 1;
> +
> +	return __arm_smmu_alloc_bitmap(smmu->context_map, start,
> smmu->num_context_banks);
> +}
> +
> +static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
> +{
> +	unsigned int last_s2cr = ARM_SMMU_GR0_S2CR(smmu->num_mapping_groups - 
> 1);
> +	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
> +	u32 reg;
> +
> +	/*
> +	 * With some firmware writes to S2CR of type FAULT are ignored, and
> +	 * writing BYPASS will end up as FAULT in the register. Perform a 
> write
> +	 * to S2CR to detect if this is the case with the current firmware.
> +	 */
> +	reg = FIELD_PREP(ARM_SMMU_S2CR_TYPE, S2CR_TYPE_BYPASS) |
> +	      FIELD_PREP(ARM_SMMU_S2CR_CBNDX, 0xff) |
> +	      FIELD_PREP(ARM_SMMU_S2CR_PRIVCFG, S2CR_PRIVCFG_DEFAULT);
> +	arm_smmu_gr0_write(smmu, last_s2cr, reg);
> +	reg = arm_smmu_gr0_read(smmu, last_s2cr);
> +	if (FIELD_GET(ARM_SMMU_S2CR_TYPE, reg) != S2CR_TYPE_BYPASS)
> +		qsmmu->bypass_broken = true;
> +

Clever :)

Reviewed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
