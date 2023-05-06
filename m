Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2547D6F91AF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 May 2023 13:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231996AbjEFLsx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 May 2023 07:48:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231915AbjEFLsw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 May 2023 07:48:52 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1513C9036
        for <linux-arm-msm@vger.kernel.org>; Sat,  6 May 2023 04:48:49 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so18038257276.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 May 2023 04:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683373728; x=1685965728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xXhdre3g6H6MxYfxQGqp7f/RjF8xgr6/bS/OJWM+1K0=;
        b=MQA9OcXbL/XwwsogkZ4TESHUPK3/H6PVWHQbaJBYohKYAbVa9divMjrh24i5VM3qlu
         VPoFQx/k3xzIqtyQ1BD8ubBNoG0tNDyLQWbhJtJ6EwuDXMu3etuDWilDOvrKP4cBD7mR
         8wwAlR9LG/gDlSBzpKvq7noxAXE3s2BzAeR9I0DRZ54nIkBzDcmyjt9hijysM+XtnQ7h
         Ou6nUtUiPCpSLHpUy2FzLO2W/Ddxzj2/ui8x3Tnvgzh4IFOglLN9td/lNPzKYQFa+/pP
         BOfEAfWhE6rL6tUmZo5Q/gStZl/1ezuiY2C+D5lYWzFvcSm3zewWWNJnSjzw6olfQdYq
         M9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683373728; x=1685965728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xXhdre3g6H6MxYfxQGqp7f/RjF8xgr6/bS/OJWM+1K0=;
        b=SeIN0MqvtzFFtjkORXqJdyHci56k96BCFA76Xav8Cn8M3gGgHSw3UhEZe8SH05xs3D
         GnZAsUR9wQES4idAHlHLyffGMpwUVpK72Jq5WoEzYc0uCqxXJ4zEhRiNMO31LeqaxmPH
         ccQffHq/Xqi3MempQBDZirNlTALAlXvh9RWCFMpGFCH5GmSCnVXBhO9/2op8PloLfXHN
         AS/rTKQhYB4/HFLo+rUnqd+pXviXCrjchlfjLm3gOdrAK9CBvn6KJ5N8WDtIn54G3mgM
         D4W6A3pHJmUlAkYHsYcB3vghDeiBtGGJ9c38SPC3vNjoo+qP0ou9J5XlcIvXXZHHnZeZ
         7znw==
X-Gm-Message-State: AC+VfDx01NuwGDq8/0EGPKh5b0VTDLqr2LXHIVUkGoO5KuFMw/dTksvm
        zI98fO76duhoeD80BjcycY4QcRInjzW/XtXKnd9fyg==
X-Google-Smtp-Source: ACHHUZ5SDRauCpEt7XaCf+06S56cEsOSrg/dB2Z2CGa/crPII7bRor+mCq0qb5hLwv8tjTALyOdssnJyVVCTIB9bjVQ=
X-Received: by 2002:a0d:e812:0:b0:559:deee:be50 with SMTP id
 r18-20020a0de812000000b00559deeebe50mr4862100ywe.21.1683373728242; Sat, 06
 May 2023 04:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230505-fxtec-pro1x-support-v2-0-0ea2378ba9ae@riseup.net>
 <20230505-fxtec-pro1x-support-v2-1-0ea2378ba9ae@riseup.net> <abae55ef-172b-036f-40a9-b27c38e850ec@linaro.org>
In-Reply-To: <abae55ef-172b-036f-40a9-b27c38e850ec@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 6 May 2023 14:48:37 +0300
Message-ID: <CAA8EJprxyHSQqoeNpiLGbx7v+CUgh7Tezw8D3RRY01izywckBg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: Add Fxtec Pro1X (QX1050) DTS
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Dang Huynh <danct12@riseup.net>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 5 May 2023 at 21:41, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 5.05.2023 19:12, Dang Huynh wrote:
> > The F(x)tec Pro1X is a mobile phone released by FX Technologies Ltd
> > in 2022.
> >
> > The phone is exactly the same as the Pro1 released in 2019 with some
> > changes:
> > - MSM8998 -> SM6115
> > - Camera button is no longer multistate
> > - Only one 48MP back camera
> > - A new keyboard layout picked by the community.
> >
> > This commit has the following features working:
> > - Display (using simplefb)
> > - UFS
> > - Power and volume buttons
> > - Pinctrl
> > - RPM Regulators
> > - USB (Device Mode)
> >
> > To get a successful boot run:
> >
> > cat arch/arm64/boot/Image.gz arch/arm64/boot/dts/qcom/\
> > sm6115-fxtec-pro1x.dtb  > .Image.gz-dtb
> >
> > mkbootimg --kernel .Image.gz-dtb \
> > --ramdisk initrd.img \
> > --base 0x0 \
> > --kernel_offset 0x8000 \
> > --ramdisk_offset 0x1000000 \
> > --second_offset 0xf00000 \
> > --tags_offset 0x100 \
> > --pagesize 4096 \
> > --cmdline "CMDLINE HERE" \
> > -o qx1050-boot.img
> >
> > fastboot flash boot qx1050-boot.img
> > fastboot erase dtbo
> > fastboot reboot
> >
> > Signed-off-by: Dang Huynh <danct12@riseup.net>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile               |   1 +
> >  arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 248 ++++++++++++++++++++++++
> >  2 files changed, 249 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index d42c59572ace..e311ba675f35 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -174,6 +174,7 @@ dtb-$(CONFIG_ARCH_QCOM)   += sdm845-shift-axolotl.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      += sdm850-lenovo-yoga-c630.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      += sdm850-samsung-w737.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      += sm4250-oneplus-billie2.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)      += sm6115-fxtec-pro1x.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      += sm6115p-lenovo-j606f.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      += sm6125-sony-xperia-seine-pdx201.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      += sm6125-xiaomi-laurel-sprout.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
> > new file mode 100644
> > index 000000000000..a9ff1d9534ae
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
> > @@ -0,0 +1,248 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> I'm not a licensing expert, but fyi sm6115.dtsi uses (GPL2+ & BSD3)

Yes, we usually ask for the DTs to be dual-licensed, since they may be
e.g. used or distributed as a part of the bootloader.

>

[skipped]

> > +
> > +&rpm_requests {
> > +     pm6125-regulators {
> > +             compatible = "qcom,rpm-pm6125-regulators";
> > +
> > +             vreg_s6a: s6 {
> You can keep the PMIC name apparent by renaming vreg_s6a to
> pm6125_s6 etc.

Hmm, we were usually using the resource-name here, so vreg_s6a is fine
(usually it would be vreg_s6a_0p3 or vreg_s6a_1p5).

>
> Konrad
> > +                     regulator-min-microvolt = <304000>;
> > +                     regulator-max-microvolt = <1456000>;
> > +             };

-- 
With best wishes
Dmitry
