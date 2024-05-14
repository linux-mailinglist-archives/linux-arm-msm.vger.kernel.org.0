Return-Path: <linux-arm-msm+bounces-19856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BAD8C5DA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 00:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70C33281C2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 22:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E19181D19;
	Tue, 14 May 2024 22:30:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E1E1DDEE
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 May 2024 22:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715725818; cv=none; b=VE+sv1ze0Ysjs4kHR3TEQG9VOUkCx20il7Pn1boiwcM7iZLcE4eJWenhH5WGi8vIVifHJwYLrQxtnxxd41Dk0H706N1Le+lXeolstCJG5K9cj5Jzgr0pLtHGtJQTGWfk9+kw75j7HTtVMEQ99u180WS4CfriXyFyvnM8YgONRCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715725818; c=relaxed/simple;
	bh=q9mwPbcMcpcNLUMsp2wXl0vnEpFK6Aj1RmaicPJb9K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sbtDaxhKtjlQJf+B6ZpOTL+nOV37leE366xcjL1twkIcLvjSb8HxEwrrkWF+CxlTlq4enkml8pXoqI3yYAy9lPMNuEIfa+hvZp10xxeLxpsg63ureBcdQvaVjbUzWwcwbwiSfyNHqbYOLEhtdhOwgZ1NuTjxttnSx6bxJy22dCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id DCAC5206DE;
	Wed, 15 May 2024 00:13:51 +0200 (CEST)
Date: Wed, 15 May 2024 00:13:50 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	MSM <linux-arm-msm@vger.kernel.org>, freedreno@lists.freedesktop.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bryan O Donoghue <bryan.odonoghue@linaro.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
	Arnaud Vrac <avrac@freebox.fr>
Subject: Re: [PATCH] arm64: dts: qcom: msm8998: enable adreno_smmu
Message-ID: <bm6joejl755ynmiqdfhm3godxhfwzb7vvlb5l2vou5p2wkkfgv@4mapycyt3zzb>
References: <1ba7031f-c97c-41f1-8cbc-d99f1e848e76@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ba7031f-c97c-41f1-8cbc-d99f1e848e76@freebox.fr>

How about appending "by default" to the title?

On 2024-05-14 19:04:04, Marc Gonzalez wrote:
> Right now, GPU init fails:
> 
> [    2.756363] [drm:adreno_bind] Found GPU: 5.4.0.1
> [    2.767183] [drm:a5xx_gpu_init]
> [    2.767422] [drm:adreno_gpu_init] fast_rate=710000097, slow_rate=27000000
> [    3.003869] [drm:msm_gpu_init] ebi1_clk: fffffffffffffffe
> [    3.004002] adreno 5000000.gpu: supply vdd not found, using dummy regulator
> [    3.008463] [drm:msm_gpu_init] gpu_reg: ffff0000819e4000
> [    3.015105] adreno 5000000.gpu: supply vddcx not found, using dummy regulator
> [    3.020702] [drm:msm_gpu_init] gpu_cx: ffff0000819e4180
> [    3.028173] [drm:adreno_iommu_create_address_space]
> [    3.054552] [drm:msm_gpu_init] gpu->aspace=ffffffffffffffed
> [    3.058112] [drm:a5xx_destroy] 5.4.0.1
> [    3.065922] [drm:msm_gpu_cleanup] 5.4.0.1
> [    3.074237] msm_dpu c901000.display-controller: failed to load adreno gpu
> [    3.082412] msm_dpu c901000.display-controller: failed to bind 5000000.gpu (ops a3xx_ops): -19
> [    3.088342] msm_dpu c901000.display-controller: [drm:drm_managed_release] drmres release begin
> ...
> [    3.197694] [drm:drm_managed_release] drmres release end
> [    3.204009] msm_dpu c901000.display-controller: adev bind failed: -19

This whole log is a tad spammy, do maintainers think that's worth having in the
commit or should it be moved below the cut (---), in favour of a more clear and
elaborate patch justification?
(Seems some logs are custom local changes, how about that?)

> 
> adreno_smmu is required, so it must be enabled.

Required for what?  This is not providing much if any context whatsoever, nor
justifying the change.  Adreno is disabled by default, so it's fine to have the
corresponding Adreno SMMU disabled by default too.

Instead, why not copy-paste the justification that was helpfully provided to
you in IRC?  At least three reasons popped up that could be used to fill up the
patch description:
- No other SoC disables adreno_smmu in DTSI;
- Nodes are typically only disabled if enabling them requires additional **board
  specific** configuration (regulators, firmware paths, ...);
- Nodes are typically also disabled if they are optional and not used on every board
  (wled and vibrator PMIC nodes were brought up).

> 
> [    3.220381] msm_dpu c901000.display-controller: bound 5000000.gpu (ops a3xx_ops)
> [    3.235503] [drm:dpu_kms_hw_init:1053] dpu hardware revision:0x30000000

And this is the expected log when it works?  You should annotate that.

The change itself is good to have.

> Fixes: 87cd46d68aeac8 ("Configure Adreno GPU and related IOMMU")

This isn't fixing any buggy behaviour, just lining up the DTSI to be more alike
the other SoCs.  I'd drop this line.

- Marijn

> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index 3d3b1f61c0690..edf379c28e1e1 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -1580,7 +1580,6 @@ adreno_smmu: iommu@5040000 {
>  			 * SoC VDDMX RPM Power Domain in the Adreno driver.
>  			 */
>  			power-domains = <&gpucc GPU_GX_GDSC>;
> -			status = "disabled";
>  		};
>  
>  		gpucc: clock-controller@5065000 {
> -- 
> 2.34.1
> 

