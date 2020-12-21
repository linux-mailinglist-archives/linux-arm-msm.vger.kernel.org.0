Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8CB2DF87B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Dec 2020 06:02:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725899AbgLUFA0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Dec 2020 00:00:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgLUFA0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Dec 2020 00:00:26 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DA54C061282
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Dec 2020 20:59:45 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id x13so7819583oto.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Dec 2020 20:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wWEd+TxYdAPpu8bXys3dBLACeriF2mvf//pdErslYdo=;
        b=fsvC0lRr9040uKgjfwIxdY5FblJVUz3r3vxNxL/TytM/xLfLMlIRXdUWAcIEA6uapV
         A7pyAdobCwrZRjyYMcfN2VCZUKf1fD//dEBgvP/+J7bM+jGfQ1CdSOHgRCX3gFuZHHEX
         ulLYrMcUfxutFHegle1CFISmppUrBIAUwsRVB0MDJgP8Ez+bhM7KZuVEIZnXWKVNzY9t
         SClqxerz90aFmSPDlIcV22/V6uh9KpKNtjMRkLHNWbJG8lWhMqGaxjaKwBUfw2T7dps9
         NfEmAgJRKXI5WbMlb14g14b3seIghHoIb9RhUC0txCYo5aToI0e0YNw4yrgxy1XhCbCE
         O3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wWEd+TxYdAPpu8bXys3dBLACeriF2mvf//pdErslYdo=;
        b=Ekvhfc7qEicGYiLUenNY2agGjY4Hsp4WtY3Z5lftPeKcrPUO/bJpHMyd01hyskB9kx
         x7et45FeVYxPiMWr9Dktmhm/ysJOeVwfsrtdO9MqN6n22YM8cnC+bbV5+78DqqQ9gqqB
         NVcQgifTSJ7CO4sGxJjj2Ma6I3OC2HQrUxrSW6EmP8z9yPnCWSqkWXAfAfd5alx2t7fh
         ezHeeSodY7jj5oj0dF+QNvi22M6uxV5C5Ifj46spbcRnj3snA/Cxcf/L5uIbQxjIi6NP
         0fl3D08UN2q/lnQcD/24mjJPDxpnMPgDYM7R/CqvbOXMOY/d4ahSy/i5ZDmNNXufPFBA
         cKsw==
X-Gm-Message-State: AOAM532beahHF0ddEQXLgR/LcZI/qq50WM5f97L2rfkgrBUMQ2I60i0s
        pjM5dCJ7I4H3F2LhybJjC93DgAQFmxeIxQ==
X-Google-Smtp-Source: ABdhPJxq9/CFGCuX1W08nV7vtLJy7F85mt6X2DfoEUGGeEK1nGnoLCHycUC54CMScahha32mvW2NrA==
X-Received: by 2002:a05:6830:1493:: with SMTP id s19mr10850044otq.175.1608522817719;
        Sun, 20 Dec 2020 19:53:37 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s26sm3600580otd.8.2020.12.20.19.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Dec 2020 19:53:37 -0800 (PST)
Date:   Sun, 20 Dec 2020 19:54:21 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: sdm845-db845c: Fix reset-pin of
 ov8856 node
Message-ID: <X+Acbf5Ks7R+M6ZW@ripper>
References: <20201217151200.1179555-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201217151200.1179555-1-robert.foss@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 17 Dec 07:12 PST 2020, Robert Foss wrote:

> Switch reset pin of ov8856 node from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW,
> this issue prevented the ov8856 from probing properly as it does not respond
> to I2C messages.
> 
> Fixes: d4919a44564b ("arm64: dts: qcom: sdm845-db845c: Add ov8856 & ov7251
> camera nodes")
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index 7cc236575ee2..a943b3f353ce 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -1112,11 +1112,11 @@ camera@10 {
>  		reg = <0x10>;
>  
>  		// CAM0_RST_N
> -		reset-gpios = <&tlmm 9 0>;
> +		reset-gpios = <&tlmm 9 1>;

Please do use GPIO_ACTIVE_LOW as the argument...

Regards,
Bjorn

>  		pinctrl-names = "default";
>  		pinctrl-0 = <&cam0_default>;
>  		gpios = <&tlmm 13 0>,
> -			<&tlmm 9 0>;
> +			<&tlmm 9 1>;
>  
>  		clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
>  		clock-names = "xvclk";
> -- 
> 2.27.0
> 
