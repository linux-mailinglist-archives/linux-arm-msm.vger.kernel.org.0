Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 584932D66D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 20:42:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393458AbgLJTmO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 14:42:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390360AbgLJTmL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 14:42:11 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41D4FC0613D6
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 11:41:31 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id w3so6027434otp.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 11:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JN4/Fm+8U9SI+kX9bCbLCSg5K15G0HtIVWmrlY8LuvM=;
        b=JANoz0BtCwZWxuCH2BcRX5JBP/t1T8H8VFPIG0Ix86kkoeHfGHbsjRApcP2w7ANxIv
         E0zm+yN0Af3J7vZZ+20JkvGC+Iqbgs1pJC3G8uW34FIRLBtvgjTVapxLONIwvTrJAqMc
         Gxe6KuglLOSfD9WtchW/Zo1eLQ/pn0PDkOvpoY24hya6GyS8UE43zvhFf21yFIGAC/VA
         MqxM5kRgGW1iA2x4hnLhj95aXI+WFiQ4UMdX3JFEobcr8jhyFhPOSVC1wZ89ublrTT77
         0A32Ufrtbb/OyUNWNUL3hM1p4LInGzuA5dAYRuSzX3Tj03kwgBx+m1oYbgywvwPLyCqw
         7MHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JN4/Fm+8U9SI+kX9bCbLCSg5K15G0HtIVWmrlY8LuvM=;
        b=rD8FgzMYUUVlXRTxpgmMQScrXQAGPlkIs3WnGwSX0l5avBrFm/aA1YhDA6g30jdQmx
         UCDLvfOCHMQCiOauhtjMBEFPDQ+zdpH8cN+MIhLH7s40wTBNmNQBZVCGYoHPYzkeJC53
         vztzj3QhTzqbyE2Ro8Xsp3jXYLdLpziw9YQKWIqcEPK4pCSgULrfTH1HMuxH4cJG7HBf
         JB2ro3QeCyqrLzcHGgfOVSBGZYIVrk3xfiGWbQmP0XDpGWShD0EAq+tPgHJgC2ZM0Y5t
         TiQImAKi7CJL+ADiKEBXiP+p//rwm+DWDzSKdtNByn3PPLNO9Fx1+MGYPFkeE2oDnSu7
         Jm8w==
X-Gm-Message-State: AOAM532NCEybcl2glqBknnxjKOPRF/ZF74SHQMlW76l3+pTXEqWRDUkz
        l2DYuTZqH9QSPftn0zTZmpqE3Rj3IpZLpA==
X-Google-Smtp-Source: ABdhPJxTimt6EeZGz64PjKtcl1R7C8gwZv5awFJmIjFwUadEevx9fUq/aZvejFfQHFQKTiNFXdiYYg==
X-Received: by 2002:a05:6830:11d1:: with SMTP id v17mr2359962otq.307.1607629290654;
        Thu, 10 Dec 2020 11:41:30 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x31sm1293353otb.4.2020.12.10.11.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 11:41:29 -0800 (PST)
Date:   Thu, 10 Dec 2020 13:41:28 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Taniya Das <tdas@codeaurora.org>,
        vbadigan@codeaurora.org, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: gcc-sc7180: Add 50 MHz clock rate for SDC2
Message-ID: <X9J56AdPINezgSNG@builder.lan>
References: <20201210102234.1.I096779f219625148900fc984dd0084ed1ba87c7f@changeid>
 <20201210102234.2.I26dcc0cee374f5571d9929c9985f463773167e68@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201210102234.2.I26dcc0cee374f5571d9929c9985f463773167e68@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 10 Dec 12:22 CST 2020, Douglas Anderson wrote:

> 50 MHz is an incredibly common clock rate for SD cards to run at.
> It's "high speed" mode in SD (not very fast these days, but it used to
> be) or:
>   #define HIGH_SPEED_MAX_DTR	50000000
> 
> If we don't support this then older "high speed" cards can only run at
> 25 MHz or at half their normal speed.  There doesn't seem to be any
> reason to skip this clock rate, so add it.
> 
> Fixes: 17269568f726 ("clk: qcom: Add Global Clock controller (GCC) driver for SC7180")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> 
>  drivers/clk/qcom/gcc-sc7180.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
> index b080739ab0c3..d82d725ac231 100644
> --- a/drivers/clk/qcom/gcc-sc7180.c
> +++ b/drivers/clk/qcom/gcc-sc7180.c
> @@ -651,6 +651,7 @@ static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src[] = {
>  	F(9600000, P_BI_TCXO, 2, 0, 0),
>  	F(19200000, P_BI_TCXO, 1, 0, 0),
>  	F(25000000, P_GPLL0_OUT_EVEN, 12, 0, 0),
> +	F(50000000, P_GPLL0_OUT_EVEN, 6, 0, 0),
>  	F(100000000, P_GPLL0_OUT_EVEN, 3, 0, 0),
>  	F(202000000, P_GPLL7_OUT_MAIN, 4, 0, 0),
>  	{ }
> -- 
> 2.29.2.576.ga3fc446d84-goog
> 
