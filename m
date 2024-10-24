Return-Path: <linux-arm-msm+bounces-35680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E00559AE562
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 14:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C845B21A1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 12:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0BDA1D5ADB;
	Thu, 24 Oct 2024 12:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/sBA5UM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49FC17277F;
	Thu, 24 Oct 2024 12:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729774368; cv=none; b=qJAdyMrtRavhlMKc0GYO3iL62AHk6WJXYY8JktBpUqBF5J115R+OPX1q3tDi1buPETFiTXsz6BVyR7QyC2jMA4bnOVFHwS9wVNoZI0DEa+2YH5KAiHi6GQrH2HLW+rxGGX7+ssRw21WeMip5LzyGwgcWunopiMWp7+Q5C/OZTPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729774368; c=relaxed/simple;
	bh=VZMvfqMs9VK+URQwyF5bu0BC9mH3LnMJpZHC1P4Hkk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Id9F9SZgh6EGfT9y6LCJodCM8BzpVtUdncGtr/hfJTBJFJfUZeD1zaTC0IDPttbr28BQT2hU6xMst+YoV5XpXCL2xhI88PGfoWNawN4dTQsduKtBWIsR1WRhRqWrGnzVqOvcsNENhz6s9S6fJ3oCVL4NHq4uUkZ7ScbE5UhVZVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/sBA5UM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C1EC4CEC7;
	Thu, 24 Oct 2024 12:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729774368;
	bh=VZMvfqMs9VK+URQwyF5bu0BC9mH3LnMJpZHC1P4Hkk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i/sBA5UM6VCbznl1IEyxcuO2JCcxxUb1q6F0qYnGNkVtuzS2Oe/Km11XaTqOjICd+
	 iwK8Y5D3FK4o50bS1M1dgBvKIYl+KCLAjGMeV+b/XF6/8mDjNHqQBqw3lnMWnMsvIg
	 T1R+p39COp9lVxtuBFVF5aLWTqx9h/dJ7Sj8h7pyR9AFB4codMCwLLAt1l077WuvD2
	 l9rb/kEeIVZ26qJ9cQillhMyFE/4EAnQnyYieMFw3Olr/ZfyVsAjAwm3V8YYqVcZYf
	 6mygk27j4xfsssiS2LKjEAuaudfzbW/dOeqpSZXY/hLkMlDsmhRKJ/mbStmTh4hoOC
	 bIW3aXkXH+wnQ==
Date: Thu, 24 Oct 2024 13:52:42 +0100
From: Will Deacon <will@kernel.org>
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: robdclark@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org,
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
	dmitry.baryshkov@linaro.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v16 1/5] iommu/arm-smmu: re-enable context caching in
 smmu reset operation
Message-ID: <20241024125241.GD30704@willie-the-truck>
References: <20241008125410.3422512-1-quic_bibekkum@quicinc.com>
 <20241008125410.3422512-2-quic_bibekkum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008125410.3422512-2-quic_bibekkum@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Oct 08, 2024 at 06:24:06PM +0530, Bibek Kumar Patro wrote:
> Default MMU-500 reset operation disables context caching in
> prefetch buffer. It is however expected for context banks using
> the ACTLR register to retain their prefetch value during reset
> and runtime suspend.
> 
> Replace default MMU-500 reset operation with Qualcomm specific reset
> operation which envelope the default reset operation and re-enables
> context caching in prefetch buffer for Qualcomm SoCs.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 45 ++++++++++++++++++++--
>  1 file changed, 42 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 087fb4f6f4d3..0cb10b354802 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -16,6 +16,16 @@
> 
>  #define QCOM_DUMMY_VAL	-1
> 
> +/*
> + * SMMU-500 TRM defines BIT(0) as CMTLB (Enable context caching in the
> + * macro TLB) and BIT(1) as CPRE (Enable context caching in the prefetch
> + * buffer). The remaining bits are implementation defined and vary across
> + * SoCs.
> + */
> +
> +#define CPRE			(1 << 1)
> +#define CMTLB			(1 << 0)
> +
>  static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>  {
>  	return container_of(smmu, struct qcom_smmu, smmu);
> @@ -396,11 +406,40 @@ static int qcom_smmu_def_domain_type(struct device *dev)
>  	return match ? IOMMU_DOMAIN_IDENTITY : 0;
>  }
> 
> +static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
> +{
> +	int ret;
> +	u32 val;
> +	int i;
> +
> +	ret = arm_mmu500_reset(smmu);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * arm_mmu500_reset() disables CPRE which is re-enabled here.
> +	 * The errata for MMU-500 before the r2p2 revision requires CPRE to be
> +	 * disabled. The arm_mmu500_reset function disables CPRE to accommodate all
> +	 * RTL revisions. Since all Qualcomm SoCs are on the r2p4 revision, where
> +	 * the CPRE bit can be enabled, the qcom_smmu500_reset function re-enables
> +	 * the CPRE bit for the next-page prefetcher to retain the prefetch value
> +	 * during reset and runtime suspend operations.
> +	 */
> +
> +	for (i = 0; i < smmu->num_context_banks; ++i) {
> +		val = arm_smmu_cb_read(smmu, i, ARM_SMMU_CB_ACTLR);
> +		val |= CPRE;
> +		arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_ACTLR, val);
> +	}

If CPRE only needs to be disabled prior to r2p2, then please teach the
MMU-500 code about that instead of adding qualcomm-specific logic here.

Will

