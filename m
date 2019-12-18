Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23E30123FA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 07:32:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbfLRGcC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Dec 2019 01:32:02 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:38189 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbfLRGcC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Dec 2019 01:32:02 -0500
Received: by mail-pj1-f66.google.com with SMTP id l35so400741pje.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2019 22:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oEVE507JdfKug+x814O3ZP8pBC3owXqUqbJxxCBNBvo=;
        b=R9jQoqseeYK48O/sdtRMi8vavijIpzlbU7qFX1dMNArz5MkqCSMv5RU+LSR9NsjjW7
         l2457GFxJiGjJa4DwPEeW04D4cv5FOgbrnhf8Y+PI/V7xFwXh5tLChAPlrPrPGVbqdu1
         3tvIEmL7kkn8hivOsaZFmNy3n0jw4MSbYMHepmHAUxVhWYt1YqTHgbeasw8fd04Si7WY
         27HyDqVMXVuriIMZG7fy5PvnJABJDCEdib28SsvekU+iSTBE0mxqXr5w1kaqIFSYl+T4
         mGk3Kw3czfbbumrHiVxYhLRQSCl1iFQrrlMA52voavpzrtLpvl3qHDqcJ7QH9dJQfrPL
         gufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oEVE507JdfKug+x814O3ZP8pBC3owXqUqbJxxCBNBvo=;
        b=hh7UszSAiA5lZNgnzo1Er3zJyRNBu8YtAsRL9vVJe+Sm3e6FfJwkmbuKY289esaMD6
         M1GgUO0thcYQtXF+Sq+5YSS0ELNjBl3WzOrJY1p20aAZtwfboALrIucDeVm5Q3D3duyL
         HXXj1ngWMnh+Z2MdByEoxjVUZet/cMuHMclp5c/xLMg873qOGS/3dmdlOuJlnLkUAYqF
         bLjELXiujJJkHb89XtfDLE2I82ys2N34oytrROWHQGTF8GzwgdKrOsGhqqFYHn9nu8wp
         u0YBHWavgHD+oe2s9ZCibmv7SkpIBSPa7All72wegfrNIFuzNNpHPV08TPBSRoDJTaJP
         1X4A==
X-Gm-Message-State: APjAAAU+rDH2IEDfUymnLY3r6NwPxml/RUX0+ddRXQ9wF26hA32utiIk
        Sms6LaNsLYi4wCcy61E65enRDg==
X-Google-Smtp-Source: APXvYqyWK8BUSpd73OSUhdZscPaP5aEVoYA4pdHgRb/W77IJSvAhof2kqD/T+bYLU3CLQybiJ6P84A==
X-Received: by 2002:a17:90a:ac0f:: with SMTP id o15mr830043pjq.133.1576650721351;
        Tue, 17 Dec 2019 22:32:01 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k23sm1234264pgg.7.2019.12.17.22.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 22:32:00 -0800 (PST)
Date:   Tue, 17 Dec 2019 22:31:58 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, andy.gross@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: smd: Add missing bimc clock
Message-ID: <20191218063158.GD3755841@builder>
References: <20191217165409.4919-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191217165409.4919-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 17 Dec 08:54 PST 2019, Jeffrey Hugo wrote:

> It turns out booting the modem is dependent on a bimc vote from Linux on
> msm8998.  To make the modem happy, add the bimc clock to rely on the
> default vote from rpmcc.  Once we have interconnect support, bimc should
> be controlled properly.
> 
> Fixes: 6131dc81211c ("clk: qcom: smd: Add support for MSM8998 rpm clocks")

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 930fa4a4c52a..e5c3db11bf26 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -648,6 +648,7 @@ static const struct rpm_smd_clk_desc rpm_clk_qcs404 = {
>  };
>  
>  /* msm8998 */
> +DEFINE_CLK_SMD_RPM(msm8998, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
>  DEFINE_CLK_SMD_RPM(msm8998, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
>  DEFINE_CLK_SMD_RPM(msm8998, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
>  DEFINE_CLK_SMD_RPM(msm8998, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
> @@ -671,6 +672,8 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk2_pin, rf_clk2_a_pin, 5);
>  DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, rf_clk3, rf_clk3_a, 6);
>  DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk3_pin, rf_clk3_a_pin, 6);
>  static struct clk_smd_rpm *msm8998_clks[] = {
> +	[RPM_SMD_BIMC_CLK] = &msm8998_bimc_clk,
> +	[RPM_SMD_BIMC_A_CLK] = &msm8998_bimc_a_clk,
>  	[RPM_SMD_PCNOC_CLK] = &msm8998_pcnoc_clk,
>  	[RPM_SMD_PCNOC_A_CLK] = &msm8998_pcnoc_a_clk,
>  	[RPM_SMD_SNOC_CLK] = &msm8998_snoc_clk,
> -- 
> 2.17.1
> 
