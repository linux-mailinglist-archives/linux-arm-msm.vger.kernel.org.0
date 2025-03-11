Return-Path: <linux-arm-msm+bounces-51038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2FDA5CE3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 19:53:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC6397A4668
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 18:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7242627F7;
	Tue, 11 Mar 2025 18:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3EdhOlY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03854260375;
	Tue, 11 Mar 2025 18:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741719177; cv=none; b=hwM6/3z4Oh4/4hKyyy4+2ek4Mzx9Xt6kvDijmoUUvDPDhwaPvTqIjuSZekV0HvDTdVEFEViXWuLgVDNq3AhIbyDPVB7dijMgsOaOUkB+Zh4zmZ4FYpbsDC07bOjjXUYSsJ/orQV96mstavuPQQt9POzlBRi02XQnulgovXpJr2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741719177; c=relaxed/simple;
	bh=k8MfRkuQVtNg/Whp5KqW04/5VaX4YAL8LC6xTwCfixc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=amGq7sdnMfCdKN+qJExSIlzqGBBI07arPsYxS1pEx12fYG49ulc/LPWezPVkzYS8FTg7j+UHowRqqlcPze7Oya6fzylb/JfPVbGm17Ss20z5kwtbu676oSoznF9JlkF7mLPbUDLnQH9hED+H0w48B25PJP5BeN3Tkuefea2gLC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3EdhOlY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB04C4CEE9;
	Tue, 11 Mar 2025 18:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741719176;
	bh=k8MfRkuQVtNg/Whp5KqW04/5VaX4YAL8LC6xTwCfixc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I3EdhOlYj005iywEv7h8Yi7UH2k8LzKHIV2MjxFB5TLpJ2amc+PGLk+ZyAk3d0tVw
	 OhyBphnk3V1oiPPtClm0UI4WytsnvUSLNjtzUpxkK71YuREPmEjnLnd+rmT7dBdGaD
	 mD/3USPdtjZhXSH98gl2AUPmhjOQrjZhHR1uv53ZLuDMt6y4VIqpwu6S3MezOEctDm
	 npWvxG+Lmuzt6j4vmF1aLNJxlz2WUQiBIKUYD54x0VYZNIqO6/bBSSUt4qYDNcqLOB
	 tNB6QeW2IG+LfivLSJY/dul5SxAT+2QSnyqjbjYscr4s3Xfa7iFuXnwA8dqPYybWVQ
	 Jyb1oLP5SAqig==
Date: Tue, 11 Mar 2025 20:52:52 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm interconnects as
 built-in
Message-ID: <vjkdwjudqsgcq2leabscnb2r5dbtztgfq3jlkfowcauslaymkp@qsxnpis3ksp6>
References: <20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-v1-1-675b6bc57176@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-v1-1-675b6bc57176@linaro.org>

On Tue, Mar 11, 2025 at 07:02:56PM +0100, Christopher Obbard wrote:
> Currently some Qualcomm interconnect drivers are enabled
> as modules which isn't overly useful since the interconnects
> are required to be loaded during early boot.
> 
> Loading the interconnects late (e.g. in initrd or as module)
> can cause boot issues, such as slowdown or even not booting
> at all (since the interconnect would be required for storage
> devices).

This is not a good justification. It should be perfectly fine to load
block drivers (including their dependencies) from the initramfs.

Up to now we have been enabling only those interconnect (and pinctrl,
btw) drivers, which are required to be able to open the consoe (thanks,
systemd).

> 
> Be consistent and enable all of the Qualcomm interconnect
> drivers as built-in to the kernel image.
> 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 219ef05ee5a757c43a37ec9f8571ce9976354830..6582baee2ab02ecb2ff442c6e73aa6a23fee8d7f 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1656,11 +1656,11 @@ CONFIG_INTERCONNECT_IMX8MN=m
>  CONFIG_INTERCONNECT_IMX8MQ=m
>  CONFIG_INTERCONNECT_IMX8MP=y
>  CONFIG_INTERCONNECT_QCOM=y
> -CONFIG_INTERCONNECT_QCOM_MSM8916=m
> +CONFIG_INTERCONNECT_QCOM_MSM8916=y
>  CONFIG_INTERCONNECT_QCOM_MSM8996=y
> -CONFIG_INTERCONNECT_QCOM_OSM_L3=m
> +CONFIG_INTERCONNECT_QCOM_OSM_L3=y

This is the memory / L3 / cpufreq interconnect, it has nothing to do
with the block devices.

>  CONFIG_INTERCONNECT_QCOM_QCM2290=y
> -CONFIG_INTERCONNECT_QCOM_QCS404=m
> +CONFIG_INTERCONNECT_QCOM_QCS404=y
>  CONFIG_INTERCONNECT_QCOM_QCS615=y
>  CONFIG_INTERCONNECT_QCOM_QCS8300=y
>  CONFIG_INTERCONNECT_QCOM_QDU1000=y
> 
> ---
> base-commit: b098bcd8278b89cb3eb73fdb6e06dc49af75ad37
> change-id: 20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-258fcc961b11
> 
> Best regards,
> -- 
> Christopher Obbard <christopher.obbard@linaro.org>
> 

-- 
With best wishes
Dmitry

