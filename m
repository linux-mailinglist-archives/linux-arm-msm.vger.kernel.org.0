Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D258A4A5287
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jan 2022 23:43:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234441AbiAaWni (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 17:43:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234425AbiAaWni (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 17:43:38 -0500
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E383C061714
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 14:43:38 -0800 (PST)
Received: by mail-oo1-xc2a.google.com with SMTP id v17-20020a4ac911000000b002eac41bb3f4so3576515ooq.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 14:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yX/YWQ2F2e81Xwl7jttAWwJX0hjqq2GEo6RpoBFupaE=;
        b=vfFnO0qBgoNjcKKMsAi/QdbQDYRqVl+e0ovhz1YJEmfDXIJTHFLajFCfy4a/29VKiK
         dCquWo1ULDCUPxTlldxNc+tt8SXRztecqlSswaH+6ta/g8TxE6LAX7cOpYyDMx3Ux8wF
         PDdy0mfS4w2MZfWV94dvZWPDCavyZ8a92IzrMJ2BxgXKKmEcYLtELACElRAkkVagd0AE
         3oWAuqlMHxwy/xFshv34BToc/9x2Aw7b14u2szcGtcqrrxYDbtBHgMTxV7BRFy9iVC70
         +u4Claci5p6RTS3K8Ow4IpkFMs/Ah+9lnAMG30eqGldxYGVp3V6NZiUD+cBE+akEEurO
         c39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yX/YWQ2F2e81Xwl7jttAWwJX0hjqq2GEo6RpoBFupaE=;
        b=WIzDEeU9AGBGkrNyNmJZyynsY2VWG+XJaN9YebUJ4TORcQWWkp0G3dsREyjABUtbAv
         5/SsAeSgWljXQKyKyyE2QhOOW6JhzQNurWjijTtWyznwBODH2MfraRm1aO4DR6mVCwip
         PtpIlhlFut4G/NQh9QQbKG5bAP7YfhbsjuP0Tov7ccEI3HwR2P29QNuR4SthOoNjGsIZ
         gpN17Q9WaggkcEpehnabEQEwWIjquwwV5eBGlE0i0DFpTq7e0S8BgU2wgh54DBCSyhRn
         VNmiGUs4mjiyq8VrjtK6fUxOjVw22lWSXE8Mpbg+3hT8KjzpujljV2uKRNxDEyjAmDMz
         Y/AA==
X-Gm-Message-State: AOAM533pxuTkYoF/7u3nxENBE4Ozc2rIfJcBXDRFSs+LaeJ7RJX7qA4l
        HwHQN96kYuRT9hABInV6qZftPw==
X-Google-Smtp-Source: ABdhPJw0/vA1k6EMzBnpDb3zSUhXhlmDS2Ml8ZV6QIGWT9ZbfXaCadYTGpIHmQ2Vbq0owZnAxdAkEA==
X-Received: by 2002:a4a:e0d8:: with SMTP id e24mr11256827oot.56.1643669017662;
        Mon, 31 Jan 2022 14:43:37 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id c26sm7516092otn.34.2022.01.31.14.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 14:43:37 -0800 (PST)
Date:   Mon, 31 Jan 2022 16:43:35 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Petr Vorel <petr.vorel@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konradybcio@gmail.com>,
        Jean Thomas <virgule@jeanthomas.me>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Taniya Das <tdas@codeaurora.org>, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: msm8994-huawei-angler: Add
 sdhc{1,2} definitions
Message-ID: <YfhmF6FKV9/6YfAL@builder.lan>
References: <20220113233358.17972-1-petr.vorel@gmail.com>
 <20220113233358.17972-6-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113233358.17972-6-petr.vorel@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 13 Jan 17:33 CST 2022, Petr Vorel wrote:

> Although downstream supports HS400, there are overclocking warnings when
> using mmc-hs400-1_8v:
> 
> mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
> mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
> mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
> mmc0: Card appears overclocked; req 400000000 Hz, actual 768000000 Hz
> mmc0: Card appears overclocked; req 400000000 Hz, actual 768000000 Hz
> mmc0: new HS400 MMC card at address 0001
> 
> Using HS200 (i.e. mmc-hs200-1_8v or mmc-ddr-1_8v) would reduce them:
> 
> mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
> mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
> mmc0: new HS200 MMC card at address 0001
> 
> But as the problem is probably elsewhere (bullhead behaves the same),
> keep mmc-hs400-1_8v.
> 
> Angler does not have SD card, thus explicitly disable sdhc2.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  .../dts/qcom/msm8994-huawei-angler-rev-101.dts   | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
> index 0e3dd48f0dbf..5ce3dc169bb4 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
> @@ -7,6 +7,7 @@
>  /dts-v1/;
>  
>  #include "msm8994.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
>  
>  /* Angler's firmware does not report where the memory is allocated */
>  /delete-node/ &cont_splash_mem;
> @@ -41,3 +42,18 @@ serial@f991e000 {
>  &tlmm {
>  	gpio-reserved-ranges = <85 4>;
>  };
> +
> +/*
> + * Although downstream supports also HS400 there are fewer overclocking
> + * warnings when used DDR, also LK bootloader reports DDR mode.
> + */
> +&sdhc1 {
> +	status = "okay";
> +
> +	mmc-hs400-1_8v;
> +};
> +
> +/* Angler does not have SD card */
> +&sdhc2 {

But isn't &sdhc2 already disabled from msm8992.dtsi and msm8994.dtsi?

Regards,
Bjorn

> +	status = "disabled";
> +};
> -- 
> 2.34.1
> 
