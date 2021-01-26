Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55158303F91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 15:03:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392693AbhAZOC7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 09:02:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392676AbhAZOCN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jan 2021 09:02:13 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10C25C0611BD
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jan 2021 06:01:33 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id e70so16197340ote.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jan 2021 06:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=NHa1jl4XStlNfdm47A2wF7pRtMVv0tqg694ijeAKGgo=;
        b=g48UNgtY8ZF9l+UqD4BTLmVeRhst8Pa1/qJsYTnCprsve24Bn1PuxRDF408fhTOAbc
         RDSGqwKhkI0m1sWgZpdMYR6G5g9COhZWbrxvhynGVEkweBtuS61qb3dshLM7n5vLNFEl
         fZ1z/YV7IUR6SItFyy7ksH/+qhQrj25o0ximz3dvVuIPI/SMDHFRMMU6h1aj+vPqkkOD
         JfJrNIoGO3a2bkNf/RH/rke1zU+HKGnW9yR8ycGO7PicvIQMNM1yl9JFLdHL8Kn1nh4B
         55bCIPhPhTBpY5aZPfU3eJNmbZoF2df8+bRnUnw9M3OuMtmZCcTf1lvedvRh6J7lxehw
         zy0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=NHa1jl4XStlNfdm47A2wF7pRtMVv0tqg694ijeAKGgo=;
        b=HwrebYv/oQth7RmrlUq9ixFFaK2acQI9mZwNtvEI32n2Yz0BQaTR/4DCCGe8Nz2OZv
         W42RWQ7/o8E0c7HTz45HJU5eUvAwhUZ7eQudXEGTVosmRnYBCwfL6t5KBNY/FBbyiLQ+
         03SpRx5WKcsoJQxxO2zOUPKQxCo0maZAyS/LTrT6m+44MBwxzKHJncHncQjLWhWUYWeK
         PVLmS4aoImzl3qDhJh77xBvsn9XtloW8IxrdvkXjtQIQ+R8xNI82qAcjUliNzkgeTjG1
         V1vCfOEnYO19nOQOpnPdWw6WZTJPstUezJ0cPE/u27yTRzaT8j1KJ977niqNMTbfUfN3
         N7yw==
X-Gm-Message-State: AOAM533rJFEcJ1CcvHkonobQo5C6Ifmy3UBsMTsqXAVDigTthpiynpfw
        1qqaLeCJCnJsIkY1zGyu0gpClg==
X-Google-Smtp-Source: ABdhPJx8qKP3uJzg1vWvJWHFk8p3ugyjVEg/omR7n0I6N2mia7sWVH4kq6wxy0T3NTsKCzKM1uieYw==
X-Received: by 2002:a05:6830:1041:: with SMTP id b1mr3997810otp.335.1611669692143;
        Tue, 26 Jan 2021 06:01:32 -0800 (PST)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z8sm3858515oon.10.2021.01.26.06.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:01:31 -0800 (PST)
Date:   Tue, 26 Jan 2021 08:01:29 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 13/21] clk: qcom: gcc-ipq4019: Remove unused variable
 'ret'
Message-ID: <20210126140129.GD1241218@yoga>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
 <20210126124540.3320214-14-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210126124540.3320214-14-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 26 Jan 06:45 CST 2021, Lee Jones wrote:

> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/clk/qcom/gcc-ipq4019.c: In function ‘clk_cpu_div_set_rate’:
>  drivers/clk/qcom/gcc-ipq4019.c:1279:6: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
> 
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/clk/qcom/gcc-ipq4019.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
> index ef5137fd50f3f..8abad4032de71 100644
> --- a/drivers/clk/qcom/gcc-ipq4019.c
> +++ b/drivers/clk/qcom/gcc-ipq4019.c
> @@ -1276,16 +1276,15 @@ static int clk_cpu_div_set_rate(struct clk_hw *hw, unsigned long rate,
>  	struct clk_fepll *pll = to_clk_fepll(hw);
>  	const struct freq_tbl *f;
>  	u32 mask;
> -	int ret;
>  
>  	f = qcom_find_freq(pll->freq_tbl, rate);
>  	if (!f)
>  		return -EINVAL;
>  
>  	mask = (BIT(pll->cdiv.width) - 1) << pll->cdiv.shift;
> -	ret = regmap_update_bits(pll->cdiv.clkr.regmap,
> -				 pll->cdiv.reg, mask,
> -				 f->pre_div << pll->cdiv.shift);
> +	regmap_update_bits(pll->cdiv.clkr.regmap,
> +			   pll->cdiv.reg, mask,
> +			   f->pre_div << pll->cdiv.shift);
>  	/*
>  	 * There is no status bit which can be checked for successful CPU
>  	 * divider update operation so using delay for the same.
> -- 
> 2.25.1
> 
