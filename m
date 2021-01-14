Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2465B2F59D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 05:14:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725846AbhANENk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 23:13:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbhANENk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 23:13:40 -0500
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D686C061786
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jan 2021 20:12:54 -0800 (PST)
Received: by mail-oo1-xc30.google.com with SMTP id y14so1085630oom.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jan 2021 20:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=c73p4iFi0Q4U6X5NbGGn9k41F/L4Lk8wfqm/4PninLU=;
        b=INTuPcVHDsUWuflSn5Z0i6gGnCcj6jTNyKM4RhhyIfbRrMNo6p8zXsBcj1glWYgOcw
         gDTq0L0gqQCBQqFElQx8LP97F6yOOrZKPdIgBnhNRVeyYOq8BceczVKRm2sChWThHJ4j
         C95zVjOXhBkHkpJG04sNXSnv1FtVjY57iw9rKvFCPVg4igtjqODj6bdulQR6T/cKNb5W
         pCxSaXG4fnHkLMhrV42/wNN1Jo7ASLE+rpk7YD+jakPCUKSvwDH4MHbUt0L3e4K9Gh0S
         aBePRNKG+T1bcgQoS27bsZu8gOTnXMonXEOKPmMj93v3kgQcXB9ux85+hppvCBX78sn6
         FKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c73p4iFi0Q4U6X5NbGGn9k41F/L4Lk8wfqm/4PninLU=;
        b=VdZmNDST34qscbOgKXmqDPEavbmTFwpEbkFCDLR4SHzM7ofvmc5Zsu1FoFj5+aS3gp
         gw9LhtU+2hZAv9YkRvn/6hBcs7LUSFhByvHU1vWMtxwUn8JcScHtENx0Rm+idtutfG+4
         65NlEZSGHxoR+x8fI+3hx1K0TsfchxpZlX1Ve7ErHbFWAeEZNalPdpTyyxZ2HSF41ms4
         FZsBvFGf5Zhnhfgj2S9mRGHJRBM0fUwgqlIwgMBvJYgLllqulyefDx/SYKoIJfmwQuXw
         tY21lamaha94Q9uAKJIKZGYSOzuFQ5QRlPHlnLzbfZCP+UjPgP04tGYxa+96+/kWxHY7
         beag==
X-Gm-Message-State: AOAM5303098UUhoRA/QJmH1CYLnBxhWHdS4TUAPvGW7yMhf3XEMj3m9a
        4JT2aRywJQ5FW7bNgmAkSQc3v6WUKZRXsg==
X-Google-Smtp-Source: ABdhPJyWaqSmUExzgj1VXGHKe8YoRl2GN66reGihgmJtgpFfMzwZkhqpUitHsF3EqStTldzT4ENfNQ==
X-Received: by 2002:a05:6820:30e:: with SMTP id l14mr3492445ooe.38.1610597573822;
        Wed, 13 Jan 2021 20:12:53 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m22sm844424otr.79.2021.01.13.20.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 20:12:53 -0800 (PST)
Date:   Wed, 13 Jan 2021 22:12:51 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: geni: shield ICC calls for ACPI boot
Message-ID: <X//Ew1EvY47UgTf9@builder.lan>
References: <20201228135625.4971-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201228135625.4971-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 28 Dec 07:56 CST 2020, Shawn Guo wrote:

> Currently, GENI devices like i2c-qcom-geni fails to probe in ACPI boot,
> if interconnect support is enabled.  That's because interconnect driver
> only supports DT right now.  As interconnect is not necessarily required
> for basic function of GENI devices, let's shield those ICC calls to get
> GENI devices probe for ACPI boot.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  drivers/soc/qcom/qcom-geni-se.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index f42954e2c98e..9feb1d78a5df 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -760,6 +760,9 @@ int geni_icc_get(struct geni_se *se, const char *icc_ddr)
>  	int i, err;
>  	const char *icc_names[] = {"qup-core", "qup-config", icc_ddr};
>  
> +	if (has_acpi_companion(se->dev))
> +		return 0;
> +
>  	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
>  		if (!icc_names[i])
>  			continue;
> @@ -785,6 +788,9 @@ int geni_icc_set_bw(struct geni_se *se)
>  {
>  	int i, ret;
>  
> +	if (has_acpi_companion(se->dev))

Can't we simply rely on the fact that icc_set_bw(), icc_enable() and
icc_disable() all return successfully when passed a path of NULL?

That would reduce this patch to only modifying geni_icc_get(), which
presumably would be the place the modify once there is a mechanism to
acquire paths in ACPI (if that ends up look anything like the of-based
case).

Regards,
Bjorn

> +		return 0;
> +
>  	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
>  		ret = icc_set_bw(se->icc_paths[i].path,
>  			se->icc_paths[i].avg_bw, se->icc_paths[i].avg_bw);
> @@ -803,6 +809,9 @@ void geni_icc_set_tag(struct geni_se *se, u32 tag)
>  {
>  	int i;
>  
> +	if (has_acpi_companion(se->dev))
> +		return;
> +
>  	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++)
>  		icc_set_tag(se->icc_paths[i].path, tag);
>  }
> @@ -813,6 +822,9 @@ int geni_icc_enable(struct geni_se *se)
>  {
>  	int i, ret;
>  
> +	if (has_acpi_companion(se->dev))
> +		return 0;
> +
>  	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
>  		ret = icc_enable(se->icc_paths[i].path);
>  		if (ret) {
> @@ -830,6 +842,9 @@ int geni_icc_disable(struct geni_se *se)
>  {
>  	int i, ret;
>  
> +	if (has_acpi_companion(se->dev))
> +		return 0;
> +
>  	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
>  		ret = icc_disable(se->icc_paths[i].path);
>  		if (ret) {
> -- 
> 2.17.1
> 
