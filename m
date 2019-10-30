Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0B6E9DAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2019 15:37:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbfJ3OhD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Oct 2019 10:37:03 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43166 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726137AbfJ3OhD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Oct 2019 10:37:03 -0400
Received: by mail-pg1-f196.google.com with SMTP id l24so1600143pgh.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2019 07:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:subject:to:cc:user-agent:date;
        bh=OnvHWKf31kU5T7G+GRyW8KQ7oVqd5iVGELerKYGud0Q=;
        b=Elp7O9BUncdP/kE50ELNV29c9NTF1imKvURZMH5sXZIfYxerNFW5ykpzny2RkydmGC
         BOv+NV204Y2aYpqRFT+f/3TKiNyPH1T5LdYJJ15VZ4XW5D0XZlBfIzsy3T80zkSyl/mf
         w4xHnpNIIYyzH55a3XtRaOmRlzzLYRj+CyW0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:subject:to:cc
         :user-agent:date;
        bh=OnvHWKf31kU5T7G+GRyW8KQ7oVqd5iVGELerKYGud0Q=;
        b=WPYR4lK5Qt5BWTQ8/sAKtN0YNNDaRdgYMY0Ji+QSALiUyX0t3VtiyH26QjRaUuh7Wc
         Q3znEFmgcYFpg3ir/RCjSzX6ykruHQ9obUMa6uche9wPGta4v7cOy9C0beWbO6vhru7s
         0LGh1wrcQB8AQz+mLRpzMz8udPKdMm+3GHpHXp3NiKhRfY+0yqahGRe8jjEb+4JSeRJa
         BqozE1XQ7rW47xSgeAVls1SbHoaUwDN1EJxRAzOjkLkj1Md8ixP/7PxtHjxiO5fBVzfY
         Phyj/LH+T4/GsfRMMgbRIGa6eBKK8eMbTcxWPtLfRKPyyv2XiS52Bq37feXAJ06eQOmT
         PuVQ==
X-Gm-Message-State: APjAAAWrX6DK4NN/05KvJRGIRhdz/xrauEPTxvLBWWyPpJ2/RfKCBNf7
        HJUhLMohfL3f4yx0H5Co8GgA7w==
X-Google-Smtp-Source: APXvYqwAOaDPJE9YX0kurT2C1478bGKudWPZUacz2albpuYXmSsOk433FmVtr64ecIfiXAWfaWF9DQ==
X-Received: by 2002:aa7:8421:: with SMTP id q1mr34967091pfn.174.1572446222424;
        Wed, 30 Oct 2019 07:37:02 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id e8sm128023pga.17.2019.10.30.07.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 07:37:01 -0700 (PDT)
Message-ID: <5db9a00d.1c69fb81.c3df6.04eb@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <78809ef8464c46018f3803454c1165ab@codeaurora.org>
References: <20191023090219.15603-1-rnayak@codeaurora.org> <20191023090219.15603-8-rnayak@codeaurora.org> <5db86bb1.1c69fb81.dc254.ec0b@mx.google.com> <78809ef8464c46018f3803454c1165ab@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 07/11] arm64: dts: qcom: sc7180: Add SPMI PMIC arbiter device
To:     kgunda@codeaurora.org
Cc:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org
User-Agent: alot/0.8.1
Date:   Wed, 30 Oct 2019 07:37:00 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting kgunda@codeaurora.org (2019-10-29 23:06:43)
> On 2019-10-29 22:11, Stephen Boyd wrote:
> > Quoting Rajendra Nayak (2019-10-23 02:02:15)
> >> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi=20
> >> b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> >> index 04808a07d7da..6584ac6e6c7b 100644
> >> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> >> @@ -224,6 +224,25 @@
> >>                         };
> >>                 };
> >>=20
> >> +               spmi_bus: spmi@c440000 {
> >> +                       compatible =3D "qcom,spmi-pmic-arb";
> >> +                       reg =3D <0 0xc440000 0 0x1100>,
> >=20
> > Please pad out the registers to 8 numbers. See sdm845.
> Ok.. Will address it in the next series.
> >=20
> >> +                             <0 0xc600000 0 0x2000000>,
> >> +                             <0 0xe600000 0 0x100000>,
> >> +                             <0 0xe700000 0 0xa0000>,
> >> +                             <0 0xc40a000 0 0x26000>;
> >> +                       reg-names =3D "core", "chnls", "obsrvr", "intr=
",=20
> >> "cnfg";
> >> +                       interrupt-names =3D "periph_irq";
> >> +                       interrupts-extended =3D <&pdc 1=20
> >> IRQ_TYPE_LEVEL_HIGH>;
> >=20
> > This is different than sdm845. I guess pdc is working?
> >=20
> Yes. For SDM845 pdc controller support was not yet added. That's why=20
> still the GIC interrupt is used.
> Where as for SC7180 the same is added with=20
> https://lore.kernel.org/patchwork/patch/1143335/.
>=20
> Yes. pdc is working.

Cool. The patch that adds pdc to the DT should come before this one
then. In reality, it would be better if it was all squashed down into
one big commit that just introduces the SoC file and one commit for
PMICs and then one commit for the idp board. Then we don't have this
ordering problem.

