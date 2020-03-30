Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 248971985A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2020 22:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727750AbgC3Uly (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Mar 2020 16:41:54 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:39790 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728267AbgC3Ulx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Mar 2020 16:41:53 -0400
Received: by mail-pj1-f66.google.com with SMTP id z3so108378pjr.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2020 13:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gXEgQyqWtKi/deTewfCdJW+6ZT9gmXPBY4cz60z4Xy8=;
        b=AGTm306RJBiq5wiPFYYs+svTnvzhqu8DEigXSeSwdj1zoVBse4dqbtUOYKdltzDXqz
         p4vvvr7IShB+YHYr5KXFPGYkym6x9qpuivr42F00SQVzjCMVRcfOonGa7MWLjNy8U3/q
         vbMvPM5LyFPT5fWdps4R3EBDBordMJKu7f/8xsWgCjyJtAQB5rc1yhvneDrAmbozsAXT
         u6DRqPdRNCCK/yT5/3dsHdVLRPvEMKu4IU1SXoaXAW6fjXatvZSL0SQnCcVXMMfqDtno
         mxvssvsxOKx2ESRz9yN1fyUa/JbWWj8QzEeZ0EsTYDNlmRVIifKslkKIUpalekX02QT7
         4vkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gXEgQyqWtKi/deTewfCdJW+6ZT9gmXPBY4cz60z4Xy8=;
        b=fNL5ly7NvtXscEAwqCGorw8ukVBVTjJuVBYBhY8lJtSGt8eLZAfGf3Zvg7jzJ34Bp4
         tjW/ZqyO0yL+shbXB/cSLoOwQpmXbzjMoq49Acdh869sexMjSnvpi/8yG/MZZbp8TmKp
         OcKc6l29xeDGGkFIndXfX5LxRwU7AUWbTJ6zOv95E3RY4hbG5Qy2cuhL3HXQnYaaQD1u
         1MsT1MAzHDj9xtTUgku5bboHOksRaWWfoLjp68y3dqvI2ee0FINmooAODbyo63DnGzwI
         wBNS56igr/Uw8DPuzNHdij3KO3ywVz2l1djgH9K2heMb3ilrLoiIeBHek8FLrgp6KmZC
         chZA==
X-Gm-Message-State: ANhLgQ2CzEq+GNjPL9OAqoGqPs2QHw8bY+2blwrrUytNkffYlC57p5DD
        fqWR/2AAr+77Hu+LuV3i04H9DuEXZQ0=
X-Google-Smtp-Source: ADFU+vtRCLcMPMcubA8fte342DE9ReO2pbWBwxx+giULxWdYaHRK2nOzSEa0w9mTNXIoG6UmIXTTFg==
X-Received: by 2002:a17:902:ec03:: with SMTP id l3mr12435349pld.73.1585600912095;
        Mon, 30 Mar 2020 13:41:52 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h198sm10837425pfe.76.2020.03.30.13.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 13:41:51 -0700 (PDT)
Date:   Mon, 30 Mar 2020 13:41:49 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: qcom: msm8916: Fix the address location of
 pll->config_reg
Message-ID: <20200330204149.GA215915@minitux>
References: <20200329124116.4185447-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200329124116.4185447-1-bryan.odonoghue@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 29 Mar 05:41 PDT 2020, Bryan O'Donoghue wrote:

> During the process of debugging a processor derived from the msm8916 which
> we found the new processor was not starting one of its PLLs.
> 
> After tracing the addresses and writes that downstream was doing and
> comparing to upstream it became obvious that we were writing to a different
> register location than downstream when trying to configure the PLL.
> 

Good catch.

> This error is also present in upstream msm8916.
> 
> As an example clk-pll.c::clk_pll_recalc_rate wants to write to
> pll->config_reg updating the bit-field POST_DIV_RATIO. That bit-field is
> defined in PLL_USER_CTL not in PLL_CONFIG_CTL. Taking the BIMC PLL as an
> example
> 

For some reason we don't specify pll->post_div_width for anything but
ipq806x, so the post_div is not considered for other platforms. This
might be a bug, but in addition to updating the config_reg address
post_div_width would have to be specified for the change to affect
clk_pll_recalc_rate().

More disturbing though is the clk_pll_set_rate() implementation, which
just writes ibits to the entire config_reg. But given that we don't have
a freq_tbl for any of these plls the function will return -EINVAL
earlier.

Lastly is clk_pll_configure() which would need this, but we don't call
it from msm8916 at this point.


So while your change is correct, afaict it's a nop unless you fill out
the other fields as well.

Regards,
Bjorn

> lm80-p0436-13_c_qc_snapdragon_410_processor_hrd.pdf
> 
> 0x01823010 GCC_BIMC_PLL_USER_CTL
> 0x01823014 GCC_BIMC_PLL_CONFIG_CTL
> 
> This pattern is repeated for gpll0, gpll1, gpll2 and bimc_pll.
> 
> This error is likely not apparent since the bootloader will already have
> initialized these PLLs.
> 
> This patch corrects the location of config_reg from PLL_CONFIG_CTL to
> PLL_USER_CTL for all relevant PLLs on msm8916.
> 
> Fixes commit 3966fab8b6ab ("clk: qcom: Add MSM8916 Global Clock Controller support")
> 
> Cc: Georgi Djakov <georgi.djakov@linaro.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/clk/qcom/gcc-msm8916.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
> index 4e329a7baf2b..17e4a5a2a9fd 100644
> --- a/drivers/clk/qcom/gcc-msm8916.c
> +++ b/drivers/clk/qcom/gcc-msm8916.c
> @@ -260,7 +260,7 @@ static struct clk_pll gpll0 = {
>  	.l_reg = 0x21004,
>  	.m_reg = 0x21008,
>  	.n_reg = 0x2100c,
> -	.config_reg = 0x21014,
> +	.config_reg = 0x21010,
>  	.mode_reg = 0x21000,
>  	.status_reg = 0x2101c,
>  	.status_bit = 17,
> @@ -287,7 +287,7 @@ static struct clk_pll gpll1 = {
>  	.l_reg = 0x20004,
>  	.m_reg = 0x20008,
>  	.n_reg = 0x2000c,
> -	.config_reg = 0x20014,
> +	.config_reg = 0x20010,
>  	.mode_reg = 0x20000,
>  	.status_reg = 0x2001c,
>  	.status_bit = 17,
> @@ -314,7 +314,7 @@ static struct clk_pll gpll2 = {
>  	.l_reg = 0x4a004,
>  	.m_reg = 0x4a008,
>  	.n_reg = 0x4a00c,
> -	.config_reg = 0x4a014,
> +	.config_reg = 0x4a010,
>  	.mode_reg = 0x4a000,
>  	.status_reg = 0x4a01c,
>  	.status_bit = 17,
> @@ -341,7 +341,7 @@ static struct clk_pll bimc_pll = {
>  	.l_reg = 0x23004,
>  	.m_reg = 0x23008,
>  	.n_reg = 0x2300c,
> -	.config_reg = 0x23014,
> +	.config_reg = 0x23010,
>  	.mode_reg = 0x23000,
>  	.status_reg = 0x2301c,
>  	.status_bit = 17,
> -- 
> 2.25.1
> 
