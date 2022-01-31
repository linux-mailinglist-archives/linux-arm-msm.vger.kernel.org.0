Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 784564A5291
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jan 2022 23:47:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234734AbiAaWq7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 17:46:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234138AbiAaWq6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 17:46:58 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 782B1C061714;
        Mon, 31 Jan 2022 14:46:58 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a8so47578068ejc.8;
        Mon, 31 Jan 2022 14:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=MIJF9PMHei+gU84wXljWgPX+FCJkqv51JTonhsdd7mU=;
        b=HL8PJ/RQQ1SfpMA0hvEAt3kC/ALs15+JUOnMq4CRnxjD/LdncB4+eGzcNzM3qDsri5
         Dk3jby0FeIYX9OT27kVfxJI0DXYNF2sXqh9++K3NK4PE6fR8Yz8292mL2FFg7fKHee6y
         3EwPKuLfiZaLYGm3m51qaUXAYzOuwYavHcCN3aEJEnzKRTDT1S3TeQkgpg/ycbAS2ipd
         szSTNHotdj/FiHa4Yv9NQin2rA6oqcTZMcPJzrC6yuRz6cI9VPagqMSfL44HSVeRyLbg
         GX3dj8MDGJCZHLFtX0pE4l7YRcAOYorNHXF0EwwhiGZ8r56xUbivRUPVZ8VtVvmaCzyg
         ZDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=MIJF9PMHei+gU84wXljWgPX+FCJkqv51JTonhsdd7mU=;
        b=Nso3IVV3ZFW/yKB2DDNxWY3IIf3p8NMkgP1FfMD2NQIhVH5t9D8WNrmCaps4ECNxTG
         5EQpZpHG5pNYgemuVTP4u1O22bQQ1b98ehFnj0Q6CXpyZ4fg5UR628elCoSB09QXq8Z9
         ljrbRtARm2R3L8LJWJdxG32nZrexT54fDTMya1rmIUiTG1Ed+mZK0nw4repBbyAhoo9s
         mdyAKFDvdlUqh2a4Nzqkq7R5UYde6+ys+K12I9lnRQ6r+JkwEauqnCSxOOeoiyqVkPA+
         iHF4l3Nwsx+O2f5CV8Sxo/91R/Ope09h+tubk0aJlAzVe0oStUN5k0dlRvPN7HWP6v16
         BpTA==
X-Gm-Message-State: AOAM531PtCi/a0qD58tUhk5HnaxZCU/HwKRixArWxuXmXwGcVKILfK/B
        s5EROp2coivOhZ1w0f6PdcY=
X-Google-Smtp-Source: ABdhPJyETVBxZ9jlV5H5rIieiwcpEXnUqiAwLq1cKF2Sc8is9RFgQ193GqJPsskLcNWl2xvNhDoFTg==
X-Received: by 2002:a17:907:16a2:: with SMTP id hc34mr19443000ejc.330.1643669216978;
        Mon, 31 Jan 2022 14:46:56 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id f11sm18204895edv.29.2022.01.31.14.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 14:46:56 -0800 (PST)
Date:   Mon, 31 Jan 2022 23:46:54 +0100
From:   Petr Vorel <petr.vorel@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
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
Message-ID: <Yfhm3opZCtAxMwrY@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20220113233358.17972-1-petr.vorel@gmail.com>
 <20220113233358.17972-6-petr.vorel@gmail.com>
 <YfhmF6FKV9/6YfAL@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfhmF6FKV9/6YfAL@builder.lan>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

> On Thu 13 Jan 17:33 CST 2022, Petr Vorel wrote:

> > Although downstream supports HS400, there are overclocking warnings when
> > using mmc-hs400-1_8v:

> > mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
> > mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
> > mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
> > mmc0: Card appears overclocked; req 400000000 Hz, actual 768000000 Hz
> > mmc0: Card appears overclocked; req 400000000 Hz, actual 768000000 Hz
> > mmc0: new HS400 MMC card at address 0001

> > Using HS200 (i.e. mmc-hs200-1_8v or mmc-ddr-1_8v) would reduce them:

> > mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
> > mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
> > mmc0: new HS200 MMC card at address 0001

> > But as the problem is probably elsewhere (bullhead behaves the same),
> > keep mmc-hs400-1_8v.

> > Angler does not have SD card, thus explicitly disable sdhc2.

> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > ---
> >  .../dts/qcom/msm8994-huawei-angler-rev-101.dts   | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)

> > diff --git a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
> > index 0e3dd48f0dbf..5ce3dc169bb4 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
> > +++ b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
> > @@ -7,6 +7,7 @@
> >  /dts-v1/;

> >  #include "msm8994.dtsi"
> > +#include <dt-bindings/gpio/gpio.h>

> >  /* Angler's firmware does not report where the memory is allocated */
> >  /delete-node/ &cont_splash_mem;
> > @@ -41,3 +42,18 @@ serial@f991e000 {
> >  &tlmm {
> >  	gpio-reserved-ranges = <85 4>;
> >  };
> > +
> > +/*
> > + * Although downstream supports also HS400 there are fewer overclocking
> > + * warnings when used DDR, also LK bootloader reports DDR mode.
> > + */
> > +&sdhc1 {
> > +	status = "okay";
> > +
> > +	mmc-hs400-1_8v;
> > +};
> > +
> > +/* Angler does not have SD card */
> > +&sdhc2 {

> But isn't &sdhc2 already disabled from msm8992.dtsi and msm8994.dtsi?

Yes it's disabled, thus this is not needed.
I'll send v2 of this, where I remove this.

Kind regards,
Petr

> Regards,
> Bjorn
