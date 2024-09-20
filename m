Return-Path: <linux-arm-msm+bounces-32101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2763B97D83B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 18:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C25A1C22E6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 16:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E418517E46E;
	Fri, 20 Sep 2024 16:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wfiDAwPX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B49C17BB11
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2024 16:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726849252; cv=none; b=mynvDn/RUHYst/MV9biFqmmiAIhcYwwLSQYm1v4bp1SBPqw8KQ423a89FP4/FRksyFQ+WvZsJSJjwboi6EeStba589cJnVIc/eS9xaubdN3zbhd+kUIcUOCPa+l3qGwzSvO7R/DWsxoA50DW/uHmU4KhqJvFuQ47d4vkrCKAHLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726849252; c=relaxed/simple;
	bh=6eKgFgJf42pu/lKMuVHL2+tqfDtjlOjjL7VlY21WaD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ur3sCIB8F+lLyD8Vh8VMQgDaInaCwhz5/WjmXEeAfgH26Di2HuHZRMCJ828wZJ0skIn9nD9P+Bq/8U2eiZDFWNN6mdB10YqtkoHWJD2x4DprLWXeIVSFD8YvpcOa3E+MUcbhnz1LB39SNsJ8Y3GRHRRxyK5A++U3n2xgi68fDkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wfiDAwPX; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53654e2ed93so2737416e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2024 09:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726849249; x=1727454049; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oGooyg5nMtcSZswOs44H9PRNk+nCm/4lfki5MlJ1BHQ=;
        b=wfiDAwPXkQYJxyteXwtvfj6gcM5JqCUwGMBEaRa5vOKKgaYzw1i09yT12n4JBhktfa
         E+W656jotop2Yd+dI1nng/CjQCs514Su6w8nnEdCbsQrzrCsWscaT9M7DRnd7gHi264M
         tyT7VHeI+GAPx1v4ZQ3YnaEaggTTCIJXnBSyTOGA2HpTGRqIHocxbdvqtfuAvJ/qR47U
         03bO9yIz4CT+55JiGe2jjWmCzzvNVBia6osj5k9kDb6PpvNuyGqJFg8i3T2LaDitsQft
         GRVKo83rmLcDthqnVadApwfnmI7TZVR/wX9hGhoa8vOA0FGeUwrc8lgTbUwApTkxATgi
         GctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726849249; x=1727454049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGooyg5nMtcSZswOs44H9PRNk+nCm/4lfki5MlJ1BHQ=;
        b=X4oIi2Mk4hHBXakNIRvQJBb/ggL6SQDglqsFqyE5izpvDqb+EYpoHUZtbRjO9Sibui
         BxZUgyP7fy1PtVFFbD2KbwMR7iUAyZzb/6fb4mMW/P6/vJ2jTjEFpsc4+KM4Z7RGzyjZ
         MAit/HcOw7Xza1HsieHFZKokADoo67CUMDaHuQ+3T/ipJvwwkemUhT/U1t9wXOdBZi3A
         BVDGcpTt3OPKBRvuCoEGFhG90aBy6dT/CFTjG32DLsI0VIxgHO8sP9rItdZ5wf7EQ4MW
         QF8KgjcRSjBWt35ShPAxgpFEWY4WHpPVSAHiCeKpJvYN377W4oAaV7C0sbtSlSWsyMM1
         l+tw==
X-Forwarded-Encrypted: i=1; AJvYcCVut+FFxoeFl7m6MVftMg0V+5vO3aW3kS6BU4pBDJERzWJqiCrV8jmu0FqVC0wiklZDTIbKQr6ShLEekRlE@vger.kernel.org
X-Gm-Message-State: AOJu0YyVuc0BJZ0MW7SoSpbE/MViI/GY65BdQts75wHqtzRlf+PzYFBN
	lLC+FBVNT6NHCgLBW3Dz/8VY3MsGHGkRSsY7Ol5pZUo2WztcWQMACzJ/n5WEW8c=
X-Google-Smtp-Source: AGHT+IFdCcmTtqmqomK0sEI35/rVqAWrJW5uXepKNk/H8es87n2uQEQ7plX41BbzPLePnxWiyWJiCQ==
X-Received: by 2002:a05:6512:3044:b0:530:ad7d:8957 with SMTP id 2adb3069b0e04-536ad3d4864mr2118426e87.49.1726849249157;
        Fri, 20 Sep 2024 09:20:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870a8772sm2213395e87.234.2024.09.20.09.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 09:20:48 -0700 (PDT)
Date: Fri, 20 Sep 2024 19:20:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: robdclark@gmail.com, will@kernel.org, robin.murphy@arm.com, 
	joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org, 
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 4/5] iommu/arm-smmu: introduction of ACTLR for custom
 prefetcher settings
Message-ID: <hdel47qqf4tto34a5atbjyukameoweudywixuj24aisqoikhcq@v523pootitbg>
References: <20240920155813.3434021-1-quic_bibekkum@quicinc.com>
 <20240920155813.3434021-5-quic_bibekkum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920155813.3434021-5-quic_bibekkum@quicinc.com>

On Fri, Sep 20, 2024 at 09:28:12PM GMT, Bibek Kumar Patro wrote:
> Currently in Qualcomm  SoCs the default prefetch is set to 1 which allows
> the TLB to fetch just the next page table. MMU-500 features ACTLR
> register which is implementation defined and is used for Qualcomm SoCs
> to have a custom prefetch setting enabling TLB to prefetch the next set
> of page tables accordingly allowing for faster translations.
> 
> ACTLR value is unique for each SMR (Stream matching register) and stored
> in a pre-populated table. This value is set to the register during
> context bank initialisation.
> 
> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 26 ++++++++++++++++++++++
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  1 +
>  2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 38ac9cab763b..4ac272d05843 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -252,6 +252,20 @@ static bool qcom_adreno_can_do_ttbr1(struct arm_smmu_device *smmu)
>  	return true;
>  }
> 
> +static void qcom_smmu_set_actlr_dev(struct device *dev, struct arm_smmu_device *smmu, int cbndx,
> +		const struct of_device_id *client_match)
> +{
> +	const struct of_device_id *match =
> +			of_match_device(client_match, dev);
> +
> +	if (!match) {
> +		dev_notice(dev, "no ACTLR settings present\n");

dev_dbg() or even dev_vdbg(), please. We do not want to spam people with
messages about a perfectly normal behaviour.

LGTM otherwise.


> +		return;
> +	}
> +
> +	arm_smmu_cb_write(smmu, cbndx, ARM_SMMU_CB_ACTLR, (u64)match->data);
> +}
> +
>  static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>  		struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
>  {
> @@ -316,8 +330,20 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
>  static int qcom_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>  		struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
>  {
> +	struct arm_smmu_device *smmu = smmu_domain->smmu;
> +	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
> +	const struct of_device_id *client_match;
> +	int cbndx = smmu_domain->cfg.cbndx;
> +
>  	smmu_domain->cfg.flush_walk_prefer_tlbiasid = true;
> 
> +	client_match = qsmmu->data->client_match;
> +
> +	if (!client_match)
> +		return 0;
> +
> +	qcom_smmu_set_actlr_dev(dev, smmu, cbndx, client_match);
> +
>  	return 0;
>  }
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> index b55cd3e3ae48..8addd453f5f1 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> @@ -28,6 +28,7 @@ struct qcom_smmu_match_data {
>  	const struct qcom_smmu_config *cfg;
>  	const struct arm_smmu_impl *impl;
>  	const struct arm_smmu_impl *adreno_impl;
> +	const struct of_device_id * const client_match;
>  };
> 
>  irqreturn_t qcom_smmu_context_fault(int irq, void *dev);
> --
> 2.34.1
> 

-- 
With best wishes
Dmitry

