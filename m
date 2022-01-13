Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C13E48E112
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 00:40:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238298AbiAMXk3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jan 2022 18:40:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238317AbiAMXkZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jan 2022 18:40:25 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D4FC06174E;
        Thu, 13 Jan 2022 15:40:25 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id c66so4956246wma.5;
        Thu, 13 Jan 2022 15:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=RV5F3FqCXi+NwINgWAYn5+b4Y9WVF4vPA6sEn9RTVx4=;
        b=fMUmrcUPjnemWFIHY+nKdlAj0nlLxUChgPYcmPCS8uV9/o5dKPx54z3kSf6ZoiwFRD
         C3+id1E2Um24sE0NGjbl49Wlr+70CnR6c4Eq09rejhELq87eZI9pSNskULnFmKjMH+Wn
         VPVDr4UwCwDuTKhjKCRtCLcBt+HN294MxAvlYcmN5CUTX6njPtt0jnZHyshvXkBKuLwX
         Oit8UKzP9ABEo2+fSjRu8bEgM8Hwtq7pRcKMM85xJZyELiBnmLanYu5Flx5Mf6Djf6Uu
         QMdX81/jPDEKwVdB3d3ChZfo7y4slcXnxXQiRFlWE01C5+UZVO7s3FH/4wYm42zPraPZ
         y5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=RV5F3FqCXi+NwINgWAYn5+b4Y9WVF4vPA6sEn9RTVx4=;
        b=eF4lQf77HIhjoiQvSiitl8tm1PkIzkrNt/WCDZ/U+13YmSIb1emDostf9IG6kAPmyM
         qLFVmGblgSUGQhp0RuD8IsWKlETxKpEOtkQfNmrW+KDkyCUS1N2W9JOpif0PvKrRebnZ
         8OqODc2fAXDjrcwql4Z0JyPA1zcC+k8crf4Ob/rYidG4j8DlbpyKwBg1dXtPVBpanLwr
         I2zUUgDzrdrr/YQQSnCwRmCAZLnv2kxBUZsxYnh8RkaAZGBHV8FgImFtH080Wfqb9neF
         uO1KjJnyo+LgnT7PK76HaDDhVtfBn5QAOnDMr1M9KfjbjYSNhs96K1ALw1Jnq8ZRIYBr
         xfjg==
X-Gm-Message-State: AOAM533VkqwoevAkddPhq6bLrfIcvd1Gny2uh3djVJvgOOjUL1dHYUsY
        6Lf9PJ2/EPw+v+Wm/Pe/IJY9WvC2w3dD5g==
X-Google-Smtp-Source: ABdhPJzqh0OdeDN1zK0eU9F1rckK5M6NB/sULPhRONZMZSuXZbk3qlsrlqjYWiiW93cbVyfhhVfVRw==
X-Received: by 2002:a7b:cbc3:: with SMTP id n3mr6026265wmi.12.1642117223715;
        Thu, 13 Jan 2022 15:40:23 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id d22sm3762191wrb.83.2022.01.13.15.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 15:40:23 -0800 (PST)
Date:   Fri, 14 Jan 2022 00:40:19 +0100
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Jean Thomas <virgule@jeanthomas.me>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Taniya Das <tdas@codeaurora.org>, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: msm8994-huawei-angler: Add
 sdhc{1,2} definitions
Message-ID: <YeC4Y+rZrNpubxhR@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20220113233358.17972-1-petr.vorel@gmail.com>
 <20220113233358.17972-6-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113233358.17972-6-petr.vorel@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi all,

> Although downstream supports HS400, there are overclocking warnings when
> using mmc-hs400-1_8v:

> mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
> mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
> mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
> mmc0: Card appears overclocked; req 400000000 Hz, actual 768000000 Hz
> mmc0: Card appears overclocked; req 400000000 Hz, actual 768000000 Hz
> mmc0: new HS400 MMC card at address 0001

> Using HS200 (i.e. mmc-hs200-1_8v or mmc-ddr-1_8v) would reduce them:

> mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
> mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
> mmc0: new HS200 MMC card at address 0001

> But as the problem is probably elsewhere (bullhead behaves the same),
> keep mmc-hs400-1_8v.

> Angler does not have SD card, thus explicitly disable sdhc2.

> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  .../dts/qcom/msm8994-huawei-angler-rev-101.dts   | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

> diff --git a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
> index 0e3dd48f0dbf..5ce3dc169bb4 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
> @@ -7,6 +7,7 @@
>  /dts-v1/;

>  #include "msm8994.dtsi"
> +#include <dt-bindings/gpio/gpio.h>

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
This is a left over from experimenting with mmc-ddr-1_8v.
But maybe it can stay (unless I manage solve the problem).

Kind regards,
Petr

> +&sdhc1 {
> +	status = "okay";
> +
> +	mmc-hs400-1_8v;
> +};
> +
> +/* Angler does not have SD card */
> +&sdhc2 {
> +	status = "disabled";
> +};
