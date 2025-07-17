Return-Path: <linux-arm-msm+bounces-65344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F904B0839D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 05:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4EA077A0860
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 03:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A12A81EB9E1;
	Thu, 17 Jul 2025 03:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TZc6t/iO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7965835957;
	Thu, 17 Jul 2025 03:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752724728; cv=none; b=pj4bEEBAJ3sTgDxxWILvqsTDXGQzTIevSrC/ptJmQgPrkM9SEqxSpsBe6P3KoP+SwAYw4sBZa5VZxT51yh4gQ1/itG0mELqAxBTNe9ur5Iom6Grcr9ziMJZ7xPbUu5EfV3S+c80U6evba85snNjCRmnYULslxSvoA8WrnV9IpJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752724728; c=relaxed/simple;
	bh=OuzF5v3J010RWFCaX1BImq3F2ytx3Yt7cAPBVFMCgwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mORScHO55ImCrWwqa91lZfRGnMpqUUMb56PNRqhcqCETJSdyuPJk6u/9iqesaEZMHB8/zNGFEwFDEn0/fn9nA21Q5DxJGdwpnd3RNrPwpBVl6wbAuN6sJAADdCd+tXIlsS2aVhKfEcb0uuidNTP8YYfFHwupiuvU2HtJGvg+Ymo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TZc6t/iO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E08C4CEE3;
	Thu, 17 Jul 2025 03:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752724728;
	bh=OuzF5v3J010RWFCaX1BImq3F2ytx3Yt7cAPBVFMCgwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TZc6t/iOUPrx1jgNt6AXw3o4wPg1rnkVvRyhIbCAqIENC21mapwgWhtL0CRwS9Tdp
	 osMfg81OVk1GlQ7YpnH/1b62mNW/JONAZsLyKLv6oEpkWPa4wpN8elDO6Nsj47AhK2
	 zlBJuwMbLh/GiDesEYM98Nplw5bqxwvldyVQx4jRlxOHmkD80Yds5OSVs7t29INr7x
	 p4mr+sAAcPF/IggBgdEAueqZr062YbKGHCzWDw3NldjkCa73n4CZiTXjr/88voHI8S
	 UKdKAbElEjp1fLMJSCL6zSUWNsH37e7IphDxFQsF0rgxebYqCSNlsAYb6zrGx36iPF
	 dVOoKtlvAXjKw==
Date: Wed, 16 Jul 2025 22:58:45 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: ubwc: provide no-UBWC configuration
Message-ID: <i3fezbte3sdfs4sjbf3bahooodx3u5dyiiqee5cvns2xpbjhoy@cs2eyiwfpagk>
References: <20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com>

On Sun, Jul 06, 2025 at 02:01:03PM +0300, Dmitry Baryshkov wrote:
> After the commit 45a2974157d2 ("drm/msm: Use the central UBWC config
> database") the MDSS driver errors out if UBWC database didn't provide it
> with the UBWC configuration. Make UBWC database return zero data for
> MSM8916 / APQ8016, MSM8974 / APQ8074, MSM8226 and MSM8939.
> 
> Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Acked-by: Bjorn Andersson <andersson@kernel.org>

> ---
> Note: the driver is a part of drivers/soc, but as it got merged through
> drm/msm tree, this fix should also go through the drm/msm tree.
> ---
>  drivers/soc/qcom/ubwc_config.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> index bd0a98aad9f3b222abcf0a7af85a318caffa9841..df074520a8cae1a202a14ca094903bb1e7389066 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -12,6 +12,10 @@
>  
>  #include <linux/soc/qcom/ubwc.h>
>  
> +static const struct qcom_ubwc_cfg_data no_ubwc_data = {
> +	/* no UBWC, no HBB */
> +};
> +
>  static const struct qcom_ubwc_cfg_data msm8937_data = {
>  	.ubwc_enc_version = UBWC_1_0,
>  	.ubwc_dec_version = UBWC_1_0,
> @@ -215,11 +219,17 @@ static const struct qcom_ubwc_cfg_data x1e80100_data = {
>  };
>  
>  static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
> +	{ .compatible = "qcom,apq8016", .data = &no_ubwc_data },
> +	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
>  	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
> +	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
> +	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
>  	{ .compatible = "qcom,msm8917", .data = &msm8937_data },
>  	{ .compatible = "qcom,msm8937", .data = &msm8937_data },
> +	{ .compatible = "qcom,msm8939", .data = &no_ubwc_data },
>  	{ .compatible = "qcom,msm8953", .data = &msm8937_data },
>  	{ .compatible = "qcom,msm8956", .data = &msm8937_data },
> +	{ .compatible = "qcom,msm8974", .data = &no_ubwc_data },
>  	{ .compatible = "qcom,msm8976", .data = &msm8937_data },
>  	{ .compatible = "qcom,msm8996", .data = &msm8998_data },
>  	{ .compatible = "qcom,msm8998", .data = &msm8998_data },
> 
> ---
> base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
> change-id: 20250706-ubwc-no-ubwc-3c5919273e03
> 
> Best regards,
> -- 
> With best wishes
> Dmitry
> 

