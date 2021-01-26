Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5389303F99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 15:05:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405682AbhAZODk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 09:03:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405648AbhAZODI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jan 2021 09:03:08 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19BF6C0611C2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jan 2021 06:02:20 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id i25so7127587oie.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jan 2021 06:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=iCgywgUomaAnl88OTPiAxB3oreK05N2B2YVxS1nEzMQ=;
        b=Wk6YedfYeIdh3B/aXqkiWd6jXJC/L9Xs3uQZxUwft+3BQ/Peu2TtUYn/LXjc3bmDOI
         eQcZRP7RseyuMJItspflzmBA6VeOCkUF1Q+3HpVlWu4sMQLZk9zh3qShDXc67Z9ohYdD
         146HJSTmJhzeeSVorlgOGJ84lTurhdCK+koPVctLPOysU3HzWAL6H+hYO8H+iS3cQ/wN
         3hriQJkXOT2X6hv6fC5DUj9sfTGWcnU9HEMU7plJuNsOGFtPmkwxWa/qR9oxzfzlaskd
         OPb4GIERodd0JzJ9Amq9lYVV4WychNCeruHndm8LtHuciHoNnYEFdrKYBaIIAxL0ulGs
         e6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=iCgywgUomaAnl88OTPiAxB3oreK05N2B2YVxS1nEzMQ=;
        b=IQA8RjgZq7P9hMt768J3csqL5mCk8xj3TeODQJIIMrZnuXQ93SKKZQlFaKGVbH54kZ
         GPq3hvKaPf0QegMz8VvYYcLlnNlH48Un1FxLxJJRcgnrB8AbUfUtbXEZadEOSDt6tpkb
         9QGEHxFmKAMTUrrKiPVGg8q0kYUr/VMPXHo4MTSDXeVonP7cEMj2DddnLT61Hrv0x6io
         INMg4a8QzhIzWNY0gyLxW/XTd5XCBes62Omr1swweXUgTy9mJ3AfoDcCPUAlbJI+KyWf
         hUqy1tqlRUnvznf5K4QnuAVKdosawvXRvX4sD3wIMBuwUw/bIJ2uGQOXIm7UrrpYphRJ
         Ga9Q==
X-Gm-Message-State: AOAM533Gox5MAVMqZR0FIrfr2PNHXWQwHynBFLtCzNUNCD1Oyw+E7/Vz
        uE92zUKCSLzug1sq/OHD+f2wViYyiwqZ7A==
X-Google-Smtp-Source: ABdhPJzDn0bV0+wpWfja0pZ8iNnsNPS2Q3XwgFVEL9ZYwqbfqGSwQGCMQiH9Kc8zeSchbksBkWNR+A==
X-Received: by 2002:aca:4e4f:: with SMTP id c76mr3280084oib.167.1611669739503;
        Tue, 26 Jan 2021 06:02:19 -0800 (PST)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a188sm1902234oif.11.2021.01.26.06.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:02:18 -0800 (PST)
Date:   Tue, 26 Jan 2021 08:02:17 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 16/21] clk: qcom: mmcc-msm8974: Remove unused static
 const tables 'mmcc_xo_mmpll0_1_2_gpll0{map}'
Message-ID: <20210126140217.GE1241218@yoga>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
 <20210126124540.3320214-17-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210126124540.3320214-17-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 26 Jan 06:45 CST 2021, Lee Jones wrote:

> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/clk/qcom/mmcc-msm8974.c:85:27: warning: ‘mmcc_xo_mmpll0_1_2_gpll0’ defined but not used [-Wunused-const-variable=]
>  drivers/clk/qcom/mmcc-msm8974.c:77:32: warning: ‘mmcc_xo_mmpll0_1_2_gpll0_map’ defined but not used [-Wunused-const-variable=]
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
>  drivers/clk/qcom/mmcc-msm8974.c | 16 ----------------
>  1 file changed, 16 deletions(-)
> 
> diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
> index 015426262d080..a1552b6771bc6 100644
> --- a/drivers/clk/qcom/mmcc-msm8974.c
> +++ b/drivers/clk/qcom/mmcc-msm8974.c
> @@ -74,22 +74,6 @@ static const char * const mmcc_xo_mmpll0_dsi_hdmi_gpll0[] = {
>  	"dsi1pll",
>  };
>  
> -static const struct parent_map mmcc_xo_mmpll0_1_2_gpll0_map[] = {
> -	{ P_XO, 0 },
> -	{ P_MMPLL0, 1 },
> -	{ P_MMPLL1, 2 },
> -	{ P_GPLL0, 5 },
> -	{ P_MMPLL2, 3 }
> -};
> -
> -static const char * const mmcc_xo_mmpll0_1_2_gpll0[] = {
> -	"xo",
> -	"mmpll0_vote",
> -	"mmpll1_vote",
> -	"mmss_gpll0_vote",
> -	"mmpll2",
> -};
> -
>  static const struct parent_map mmcc_xo_mmpll0_1_3_gpll0_map[] = {
>  	{ P_XO, 0 },
>  	{ P_MMPLL0, 1 },
> -- 
> 2.25.1
> 
