Return-Path: <linux-arm-msm+bounces-75768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D94BB26B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 05:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B65EB426165
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 03:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A86323D287;
	Thu,  2 Oct 2025 03:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lOlGvqys"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F3512CD88;
	Thu,  2 Oct 2025 03:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759374838; cv=none; b=m3FPxp0mPeeDJSxTfXjqMYLpS1rQQ1EoPE3luToY40wrlGWHFUXOiKN193+ZhkRyBLUZn0sVsti+18BZbXTn5DC706O1g57PZAOhP42lpU2IwglDBefada6EqPJVEPOrLAQNSklptjUs3autwkwFAQMAAPZJBWsow6sgJrn3LKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759374838; c=relaxed/simple;
	bh=l6DKU3jOvwkc7QxfzHHokqyxey5/Ta2kSsnhWRBArHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AmKtoh0Vvb7ZZUh5wzAOzBl7CW1Ke8a3aerKqUYUb+2CrqP87GlC43Pwg5gyJpsvazgibcRueTixwW7kZIqnKP9SkbiukB0v3wBgzOgFvmZ96h7WG7753OmOICxrTDAT6humgteRiHOhQ0LcRywNa3BmqvDG27BHjijtpxHLdKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lOlGvqys; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E16A1C4CEF9;
	Thu,  2 Oct 2025 03:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759374838;
	bh=l6DKU3jOvwkc7QxfzHHokqyxey5/Ta2kSsnhWRBArHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lOlGvqys8z4meU7BNOtxcyxLhCaDyM6ykdSbFYjaixlrArbFEfuoQUqhnemn3mfpF
	 ryr3vFucB1BC/0tfQ/tdoY0WwH7c/CQNFtmCRta4PL2EjHmRojGmnJO11W1EG5s8XK
	 XB8mlM2XkCeNS0Ze0Sh9vPWyW1z58AjQ7sZ0UJ9Cz8itXSiMEshlw9wMVwqJEfXBZ+
	 oubYLEE+64ABF95Fd6Tp/ODx2YwtYLnhcKWxy9DEuXyCnIkA3g/gB43feVY/9KG0lk
	 Vple+kh0lErWwY9CTCuiRDT0wEM07Nr1+7NYj2k9k+RF2t/OYmDH9q9VS2yPILW8lA
	 0bxTaBLu/QvPw==
Date: Wed, 1 Oct 2025 22:13:56 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: ice: Set ICE clk to turbo on probe
Message-ID: <ep5x4ehq4gcyk67s7fwzcothgqyso4ltt2dd6fi6qdyvodz5mx@gvwmkkslvsw7>
References: <20251001-set-ice-clock-to-turbo-v1-1-7b802cf61dda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001-set-ice-clock-to-turbo-v1-1-7b802cf61dda@oss.qualcomm.com>

On Wed, Oct 01, 2025 at 05:44:32PM +0530, Abhinaba Rakshit wrote:
> Set ICE core clock to turbo (max freq) provided by dt
> entry at ice device probe.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
> MMC controller lacks a clock scaling mechanism, unlike the UFS
> controller. By default, the MMC controller is set to TURBO mode
> during probe, but the ICE clock remains at XO frequency,
> leading to read/write performance degradation on eMMC.
> 
> To address this, set the ICE clock to TURBO during probe to
> align it with the controller clock. This ensures consistent
> performance and avoids mismatches between the controller
> and ICE clock frequencies.

I think this (the snippet between the "---" lines) looks like a quite
good commit message; but it's below the first "---" and as such not
actually part of the commit message and will be ignored by the tools.

At the same time, the actual commit message ("Set ICE core...") isn't
very good at all, it completely lacks the problem description you
provide here.

Please use this for your commit message instead.

> ---
>  drivers/soc/qcom/ice.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index ec8d6bb9f426deee1038616282176bfc8e5b9ec1..eee06c499dc36a6bf380361f27e938331f1fcb10 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -535,6 +535,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>  	struct qcom_ice *engine;
>  	const __be32 *prop;
>  	int len;
> +	int err;
>  
>  	if (!qcom_scm_is_available())
>  		return ERR_PTR(-EPROBE_DEFER);
> @@ -577,6 +578,13 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>  	if (!qcom_ice_check_supported(engine))
>  		return ERR_PTR(-EOPNOTSUPP);
>  
> +	/* Set the ICE clk rate to TURBO */
> +	if (engine->core_clk && engine->max_freq) {
> +		err = clk_set_rate(engine->core_clk, engine->max_freq);
> +		if (err)
> +			dev_err(dev, "Failed setting the clk to TURBO\n");
> +	}
> +
>  	dev_dbg(dev, "Registered Qualcomm Inline Crypto Engine\n");
>  
>  	return engine;
> 
> ---
> base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
> change-id: 20251001-set-ice-clock-to-turbo-ecab9ea46a89
> prerequisite-change-id: 20251001-enable-ufs-ice-clock-scaling-9c55598295f6:v1
> prerequisite-patch-id: d66f521e5e625b295a1c408cdfce9bd9524ae3ba
> prerequisite-patch-id: 23934f3fee5aabe4a2324130ed02909352b5cf61

We do have plenty of platforms that run the upstream kernel without any
changes, so please test your patch on a clean upstream kernel tree.

Thanks,
Bjorn

> 
> Best regards,
> -- 
> Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> 

