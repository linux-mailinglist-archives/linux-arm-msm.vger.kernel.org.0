Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84649396747
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 19:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232171AbhEaRkk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 13:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233343AbhEaRkb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 13:40:31 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 451E9C068EE1;
        Mon, 31 May 2021 09:55:33 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id r13so6099563wmq.1;
        Mon, 31 May 2021 09:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=k4kwuOCZ4AS0IPCFeEWIC95/IyuH+wsdSfZ/orNlOfE=;
        b=HNrCHF5CQaEGu4U6ukxXcvdTna+z7TT39i/g2Z50ib1+wS6/OjC175H5M1NdnaOmmo
         PBtChXK0PUxaUJEi3Si4ypBLN+1RnkLaVWzwXQ9UYBgbRxtpk2+1xjjodKbuO7OQY3CZ
         ax9OoOarj0Omq4+Ih18u+gAiUacR/6zsDfh/Njnt0IPkdfXNJJmHWdy81c6hN1sBD/zj
         HgVccEnMsX6zTm8TzXAJcR/yayB1OKtaRGHVBBmPhUtT/Y335kvCdE0rp3ChKrEuXkDK
         PZh+z7MKJ7FnY3y4fJb732iCS85LZRSzsThm0YYt68Yc0HmQdoCKoELODmPEnmqDubOO
         OONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=k4kwuOCZ4AS0IPCFeEWIC95/IyuH+wsdSfZ/orNlOfE=;
        b=MLGinH7J9rMwPYqhnzXh7kpPPxEVIXk2MHV6DuSRpP1l6PNyahr+cnkM0rejWTaGDS
         /cGdKOUqMp3Ik7hsqA0MlbeakFbQaKp+OCqY9sszvM9T1juVZoGuWyi7cpaeQdAHkeZH
         mmAVMEgmmtuWg5kr+/y8aCEkJWluBC7lLrmaXpMvwFM6GQehz8whoAwY82y3Ab1rmgoo
         WPctWDczhHAADNpJNjBr8ucLok0aNCoXtndld7lLAGTB3ERLWAQcQ2QxMhVblDSx6hfx
         wo8FfVOI6tFxqNpRjOouBG4CGtqFbLhEbPYVckifgpByPZJh6Nvh1xDBF/ItgNxTTu41
         5bsw==
X-Gm-Message-State: AOAM531vQcjRdC2HyI5FgBnsCkEY7ZlSSu8pINLGHLmLB5siwY9ha2nw
        n+J4GfpKkuzlvBkHOLeU2ea5lRszRY5zag==
X-Google-Smtp-Source: ABdhPJykiI/bCS+pYezEUbkauSuLKKQt0hITbgGBozAeIo1j4UfoGRs7SXq7kTtWabFerHolfpqcyw==
X-Received: by 2002:a1c:6a0b:: with SMTP id f11mr63513wmc.114.1622480131896;
        Mon, 31 May 2021 09:55:31 -0700 (PDT)
Received: from pevik ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id a1sm275660wrg.92.2021.05.31.09.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 09:55:31 -0700 (PDT)
Date:   Mon, 31 May 2021 18:55:29 +0200
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH v4 1/1] arm64: dts: qcom: msm8994-angler: Fix
 gpio-reserved-ranges 85-88
Message-ID: <YLUVARo3FoQ1LHTP@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20210415193913.1836153-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415193913.1836153-1-petr.vorel@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

ping please. Anything block this to get merged?

Kind regards,
Petr

> Reserve GPIO pins 85-88 as these aren't meant to be accessible from the
> application CPUs (causes reboot). Yet another fix similar to
> 9134586715e3, 5f8d3ab136d0, which is needed to allow angler to boot after
> 3edfb7bd76bd ("gpiolib: Show correct direction from the beginning").

> Fixes: feeaf56ac78d ("arm64: dts: msm8994 SoC and Huawei Angler (Nexus 6P) support")

> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Changes v3->v4:
> * Fix patch title

> Sorry for so much noise with this simple patch.

> Kind regards,
> Petr

>  arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts | 4 ++++
>  1 file changed, 4 insertions(+)

> diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> index baa55643b40f..ffe1a9bd8f70 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> @@ -32,3 +32,7 @@ serial@f991e000 {
>  		};
>  	};
>  };
> +
> +&tlmm {
> +	gpio-reserved-ranges = <85 4>;
> +};
