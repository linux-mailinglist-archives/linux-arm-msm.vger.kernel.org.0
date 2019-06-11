Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D71B6416CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2019 23:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407061AbfFKVWQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jun 2019 17:22:16 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:37514 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406946AbfFKVWQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jun 2019 17:22:16 -0400
Received: by mail-ed1-f66.google.com with SMTP id w13so22240755eds.4;
        Tue, 11 Jun 2019 14:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZvDeGR/wNqT7nOMQkm0Ei6/MAhF95DsutBrwnh8cH3s=;
        b=Q7z3Fh5fzWq9bcK4IP/8MEwMrSw8CW0m7n3nOqyj5bzdr0meeKA1JdnRjaTCDY8ozs
         o32BW+ApvBxoHTCj3wsx9vCMp+ivoKBfeVU857s1PhLu5E3xTUulMKuhAI5o9LabLFiE
         ia/0b2DfvFn0f1YNanuJMHPmAK/4X66ZPjtKm06tH6s5hG1V94fV63uidPpoXSt29xEy
         mSpvR3OsffwH0PLg7/t5oAKU2Njg2hmKaTcCkFr0UvVIbzmilRgIwoVPNyLY031Wvdhi
         QPK3GM5A5vAPA3TO5W3bElsXvjFUaVPnxkZpaor1xWUYXIaQj4kgK/xEdUfse4eassQU
         bb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZvDeGR/wNqT7nOMQkm0Ei6/MAhF95DsutBrwnh8cH3s=;
        b=Jw7e0MbexpnODuuVgQ2M4pGp58NC2w9ch2NLXL67eJDdR1SONlqqiqNNbU3XTMAGGz
         e0ZP9S3+7JTd2ncI3k86xwXtUvhaynnH2eircd1N9CKns/PmB2lBdFvOq2IJxbYhWDqx
         gNAhrnnyt99b0Vzhie+q75b/V+xzdUNx3dWXtbuxCm34ZQKLwEjc6Ix03+Oguttl1ySE
         qsbif5OiuUsIXEvVqNVW6jagxH6nu0wlFkQrs+Ve7g/9k8w76Fn2LXFMMeRBUH5RXApg
         p06+1/ZjE96GY0yqcge7fKxM2LaG9tbTli8a4qXVXLJFg6c5szg3u2wvylD5z+apLYpb
         CqcA==
X-Gm-Message-State: APjAAAUwefGzqGwXRsIGqPwFw2BvtOo5mz6e3lqXkI1kWSrIURkp4b72
        ZEcyXZfcnd/NI6mSNgQf4xilrHI/wDQ//Q==
X-Google-Smtp-Source: APXvYqxeTYD5ov8U36NvA1MemZk0d8Py+wZARKkwyKdpkG6LnIiBUf8EIK3irjPOL1rbqjsNMT6HTg==
X-Received: by 2002:a50:a96d:: with SMTP id m42mr7027965edc.74.1560288134405;
        Tue, 11 Jun 2019 14:22:14 -0700 (PDT)
Received: from archlinux-epyc ([2a01:4f9:2b:2b15::2])
        by smtp.gmail.com with ESMTPSA id m21sm3961069edv.83.2019.06.11.14.22.13
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 14:22:13 -0700 (PDT)
Date:   Tue, 11 Jun 2019 14:22:11 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Nathan Huckleberry <nhuck@google.com>
Cc:     agross@kernel.org, david.brown@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH] clk: qcom: Fix -Wunused-const-variable
Message-ID: <20190611212211.GA6815@archlinux-epyc>
References: <20190611211134.96159-1-nhuck@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611211134.96159-1-nhuck@google.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 11, 2019 at 02:11:34PM -0700, Nathan Huckleberry wrote:
> Clang produces the following warning
> 
> drivers/clk/qcom/gcc-msm8996.c:133:32: warning: unused variable
> 'gcc_xo_gpll0_gpll2_gpll3_gpll0_early_div_map' [-Wunused-const-variable]
> static const struct
> parent_map gcc_xo_gpll0_gpll2_gpll3_gpll0_early_div_map[] =
> { ^drivers/clk/qcom/gcc-msm8996.c:141:27: warning: unused variable
> 'gcc_xo_gpll0_gpll2_gpll3_gpll0_early_div' [-Wunused-const-variable] static
> const char * const gcc_xo_gpll0_gpll2_gpll3_gpll0_early_div[] = { ^
> drivers/clk/qcom/gcc-msm8996.c:187:32: warning: unused variable
> 'gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll4_gpll0_early_div_map'
> [-Wunused-const-variable] static const struct parent_map
> gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll4_gpll0_early_div_map[] = { ^
> drivers/clk/qcom/gcc-msm8996.c:197:27: warning: unused variable
> 'gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll4_gpll0_early_div'
> [-Wunused-const-variable] static const char * const
> gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll4_gpll0_early_div[] = {
> 
> It looks like these were never used.
> 
> Fixes: b1e010c0730a ("clk: qcom: Add MSM8996 Global Clock Control (GCC) driver")
> Cc: clang-built-linux@googlegroups.com
> Link: https://github.com/ClangBuiltLinux/linux/issues/518
> Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>

LGTM, this doesn't introduce any warnings/errors on arm32 or arm64 for
me.

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
>  drivers/clk/qcom/gcc-msm8996.c | 36 ----------------------------------
>  1 file changed, 36 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
> index d2f39a972cad..d004cdaa0e39 100644
> --- a/drivers/clk/qcom/gcc-msm8996.c
> +++ b/drivers/clk/qcom/gcc-msm8996.c
> @@ -130,22 +130,6 @@ static const char * const gcc_xo_gpll0_gpll4_gpll0_early_div[] = {
>  	"gpll0_early_div"
>  };
>  
> -static const struct parent_map gcc_xo_gpll0_gpll2_gpll3_gpll0_early_div_map[] = {
> -	{ P_XO, 0 },
> -	{ P_GPLL0, 1 },
> -	{ P_GPLL2, 2 },
> -	{ P_GPLL3, 3 },
> -	{ P_GPLL0_EARLY_DIV, 6 }
> -};
> -
> -static const char * const gcc_xo_gpll0_gpll2_gpll3_gpll0_early_div[] = {
> -	"xo",
> -	"gpll0",
> -	"gpll2",
> -	"gpll3",
> -	"gpll0_early_div"
> -};
> -
>  static const struct parent_map gcc_xo_gpll0_gpll1_early_div_gpll1_gpll4_gpll0_early_div_map[] = {
>  	{ P_XO, 0 },
>  	{ P_GPLL0, 1 },
> @@ -184,26 +168,6 @@ static const char * const gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll2_early_gpll0_early
>  	"gpll0_early_div"
>  };
>  
> -static const struct parent_map gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll4_gpll0_early_div_map[] = {
> -	{ P_XO, 0 },
> -	{ P_GPLL0, 1 },
> -	{ P_GPLL2, 2 },
> -	{ P_GPLL3, 3 },
> -	{ P_GPLL1, 4 },
> -	{ P_GPLL4, 5 },
> -	{ P_GPLL0_EARLY_DIV, 6 }
> -};
> -
> -static const char * const gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll4_gpll0_early_div[] = {
> -	"xo",
> -	"gpll0",
> -	"gpll2",
> -	"gpll3",
> -	"gpll1",
> -	"gpll4",
> -	"gpll0_early_div"
> -};
> -
>  static struct clk_fixed_factor xo = {
>  	.mult = 1,
>  	.div = 1,
> -- 
> 2.22.0.rc2.383.gf4fbbf30c2-goog
> 
