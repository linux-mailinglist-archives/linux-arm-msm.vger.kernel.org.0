Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 440D746A113
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Dec 2021 17:17:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357476AbhLFQVK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Dec 2021 11:21:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353085AbhLFQU7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Dec 2021 11:20:59 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26F13C061746
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Dec 2021 08:17:30 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id g17so32628383ybe.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Dec 2021 08:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ab6y7Qd/4ZmggRJljJmRlXHqMCde+8hb4OflbprAwok=;
        b=jHmG0n0IXvKPDCYB612UXT2bfxLlP7VKzUzEUsFrA/y+3swLCx2UA4TvUoCyEXJ5DS
         QCaUaHkDMf8OwjSlI8qG2cUOqth1kjQPQS09SwyvpcKZH3WL/nwadDL8xo3UT+lVbltd
         qpIDl9KIygJqqDit3siJj3+aajOrztCuR6NxD3mRxce+lvw6+lLpKV7GBIf827pq0NiL
         /QWTUDjBUujynDE/OVnIIDLVHexYCkrz2XRvtptXTHoyzE/hYA+0KEv/XC4oDWlp2ADJ
         UP7QqZ2T1kd5CJS3hlvEQL/7qG5FI5GEoLC0AfaHKI++BnPDBfjfA/KYgIjC4y6ezd8q
         6OHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ab6y7Qd/4ZmggRJljJmRlXHqMCde+8hb4OflbprAwok=;
        b=YeXgBp7th1qfFdrM7N0AcoL+KJilvNjno2DLFcX0kP3/T2fUcJJL6S98OEdibArs8n
         pP8z0ys2WuBNAg57yU0UezQG8hEAb330NP75/xDtNc1XoOoQKiCEJSHSYMvp6eYCAQXe
         QlVEvulzJZd97+YfK5E1rjXkp1Q7o82vWgqbs5NuqbdYLXbURx/KFXheZ4qA+Oo3mjdZ
         6DOBQ7zVfKj7E2TMDNbzibiRR3skO8m98fTEvfs7iepZd3TC88XhrTyxJvPt/JDWIW6W
         MpGMKycwSwOjInWwt+if/caeiZz0sJK/aeSgn2q3+yVr2e/2Yu9qPPNQ1IY0PVojJaRo
         RKaw==
X-Gm-Message-State: AOAM530Rq+onDPe/gzLKV5HfwddPiOqsr/gjUfKNQKcQX9z+c9Acm1Bg
        hC42gv18ApLLRWNhLU2mFO+ObExZFnlVew==
X-Google-Smtp-Source: ABdhPJxSl+B6hJMfpl8OQNxuJMuTbUZ6z3G9DZNePSTV+nh0S//5reDmAFW4aePjKrHJeuEund/Iuw==
X-Received: by 2002:a9d:1727:: with SMTP id i39mr29932941ota.48.1638807146111;
        Mon, 06 Dec 2021 08:12:26 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j187sm2705481oih.5.2021.12.06.08.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 08:12:25 -0800 (PST)
Date:   Mon, 6 Dec 2021 10:12:20 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/2] clk: qcom: Add MSM8226 Multimedia Clock Controller
 support
Message-ID: <Ya42ZAKupwKiWpJf@builder.lan>
References: <20211113015844.92762-1-bartosz.dudziak@snejp.pl>
 <20211113015844.92762-2-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211113015844.92762-2-bartosz.dudziak@snejp.pl>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 12 Nov 19:58 CST 2021, Bartosz Dudziak wrote:
> diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
[..]
>  static int mmcc_msm8974_probe(struct platform_device *pdev)
>  {
>  	struct regmap *regmap;
> +	const struct of_device_id *match;
> +
> +	match = of_match_device(mmcc_msm8974_match_table, &pdev->dev);

Could you please use of_device_get_match_data() instead?

> +	if (!match)

As a general suggestion; I don't see how we would end up here with
!match, but if we somehow do it would be during development and you
would have an easier time debugging this by hitting a NULL pointer
dereference with a callstack, than tracking down why your clocks are
missing...

Thanks,
Bjorn

> +		return -ENODEV;
>  
> -	regmap = qcom_cc_map(pdev, &mmcc_msm8974_desc);
> +	regmap = qcom_cc_map(pdev, match->data);
>  	if (IS_ERR(regmap))
>  		return PTR_ERR(regmap);
>  
> -	clk_pll_configure_sr_hpm_lp(&mmpll1, regmap, &mmpll1_config, true);
> -	clk_pll_configure_sr_hpm_lp(&mmpll3, regmap, &mmpll3_config, false);
> +	if (match->data == &mmcc_msm8974_desc) {
> +		clk_pll_configure_sr_hpm_lp(&mmpll1, regmap, &mmpll1_config, true);
> +		clk_pll_configure_sr_hpm_lp(&mmpll3, regmap, &mmpll3_config, false);
> +	} else {
> +		msm8226_clock_override();
> +	}
>  
> -	return qcom_cc_really_probe(pdev, &mmcc_msm8974_desc, regmap);
> +	return qcom_cc_really_probe(pdev, match->data, regmap);
>  }
>  
>  static struct platform_driver mmcc_msm8974_driver = {
> -- 
> 2.25.1
> 
