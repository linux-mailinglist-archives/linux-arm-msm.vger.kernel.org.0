Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26E9F11BD0E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 20:33:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728074AbfLKTdY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 14:33:24 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:34631 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727002AbfLKTdY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 14:33:24 -0500
Received: by mail-il1-f193.google.com with SMTP id w13so20518627ilo.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 11:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x0GnCXUP/rt2kD7SVBsnLqKTMBM6DXMgVGMRet+WNr4=;
        b=aRzrM9CHup/vwOWQgB4+u1rnO1ABVJfcbsE8w13cgufyfGcV6028CEkXri0+4Znwxa
         mZcZ3AlduhOY2l13Ol/SkGjN1xyLKL8qx0qqk2yeYbGcN0b4ly2EXf/7GFORCQb2GMJH
         gzHi0u6pL4qxuSBGh6FaOen+F48Cm3jRMRIo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x0GnCXUP/rt2kD7SVBsnLqKTMBM6DXMgVGMRet+WNr4=;
        b=JmhgIyDyyk7DzAm4oi7aTNSOo90tdhAMp+PfJ952UKoJ5FN2bn3JTLUX+UXavmNmJO
         wp+i5jJWTR1f9uFM4t5vhY9Z/XQ11hUEJ2cRChczN0Mg7nm3QM/Ff4MuRIjQseKTDVvI
         8TTNgZ59yFSaSP/glpV1oESFIasGh/tgd6PCSJ30UTm3b/FhRLPe4DvkTWDQUS/b66y4
         BLAB6/4Rqt72cpUP/YF56O4f3qoygANicYhVhMiYnrI4yluh+Urnmsus9FFu5iqVcckP
         Xe0AMejcjuLWTHT06zlWEouv7mFZghYJBfqpWWU2LlJNBWWW9DhnmSq7TNUAateKDFMH
         ppDA==
X-Gm-Message-State: APjAAAU13qATpaDOGNYahXtM558zrrOnhA5pydUfLOpPc2k1RAabJudJ
        cBj+Q5YQXBgnZmRcM+/pc8E3nhck7C0=
X-Google-Smtp-Source: APXvYqwAaShv4HUNec3mny4+A0BrR3B5MNj0o2tgXPa+RITI5B1b+Cb5pvzwMTrtFC0hEfmfms0gRg==
X-Received: by 2002:a92:6b01:: with SMTP id g1mr4552904ilc.54.1576092803645;
        Wed, 11 Dec 2019 11:33:23 -0800 (PST)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com. [209.85.166.176])
        by smtp.gmail.com with ESMTPSA id n12sm300870ioa.68.2019.12.11.11.33.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 11:33:22 -0800 (PST)
Received: by mail-il1-f176.google.com with SMTP id b15so20483516ila.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 11:33:22 -0800 (PST)
X-Received: by 2002:a92:911b:: with SMTP id t27mr4697277ild.142.1576092802436;
 Wed, 11 Dec 2019 11:33:22 -0800 (PST)
MIME-Version: 1.0
References: <1574934847-30372-1-git-send-email-rkambl@codeaurora.org> <1574934847-30372-2-git-send-email-rkambl@codeaurora.org>
In-Reply-To: <1574934847-30372-2-git-send-email-rkambl@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 11 Dec 2019 11:33:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UtHebABCpJo1QUc6C2v2iZq2rFL+pTMx=EHBL+7d=jTQ@mail.gmail.com>
Message-ID: <CAD=FV=UtHebABCpJo1QUc6C2v2iZq2rFL+pTMx=EHBL+7d=jTQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: sc7180: Add device node support
 for TSENS in SC7180
To:     Rajeshwari <rkambl@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        sivaa@codeaurora.org, sanm@codeaurora.org,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Nov 28, 2019 at 1:55 AM Rajeshwari <rkambl@codeaurora.org> wrote:
>
> Add TSENS node and user thermal zone for TSENS sensors in SC7180.
>
> Signed-off-by: Rajeshwari <rkambl@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 527 +++++++++++++++++++++++++++++++++++
>  1 file changed, 527 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 666e9b9..6656ffc 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -911,6 +911,26 @@
>                         status = "disabled";
>                 };
>
> +               tsens0: thermal-sensor@c263000 {
> +                       compatible = "qcom,sc7180-tsens","qcom,tsens-v2";
> +                       reg = <0 0x0c263000 0 0x1ff>, /* TM */
> +                               <0 0x0c222000 0 0x1ff>; /* SROT */
> +                       #qcom,sensors = <15>;
> +                       interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "uplow";

Can you also send a patch to match Amit's ("arm64: dts: sdm845:
thermal: Add critical interrupt support") [1].  If I'm reading things
correctly it should be 508 for tsens0 and 509 for tsens1 just like on
sdm845.

[1] https://lore.kernel.org/r/c536e9cdb448bbad3441f6580fa57f1f921fb580.1573499020.git.amit.kucheria@linaro.org

-Doug
