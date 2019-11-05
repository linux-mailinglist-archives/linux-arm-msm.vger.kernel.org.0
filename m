Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 979F1EF23E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 01:49:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729443AbfKEAtr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 19:49:47 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:33308 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729829AbfKEAtr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 19:49:47 -0500
Received: by mail-pl1-f196.google.com with SMTP id ay6so1518762plb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2019 16:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:subject:from:to:user-agent:date;
        bh=JfcIcSlDhogLygSQexDsTs+N54I38tq29If96lMWiUI=;
        b=XryGOxOtH+eztv4HRtsQXmCgTewugkTPGeQZmxUzBYLkQf5mg/i1bCeS1jj5e9Wc8S
         jOG9SUQst6GgRbT/CJJ9MmvgjF5Hxt4ic2ZXuhLs+PqjAJt/1OcQNExxXblKQw4ge7SB
         FoBcie8tE6qfVdybFJJHQ+sRnmkO1X7pY8zf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:subject:from:to
         :user-agent:date;
        bh=JfcIcSlDhogLygSQexDsTs+N54I38tq29If96lMWiUI=;
        b=t20Mw4cMeq4Qimi5WFyARrsfVsAjIG0MubvTwKHEOY8yDCRbxY2onay3kKwVhwYYdL
         e4MSZOMhw05kugnCoe+zW3prVkqBlgtXd3Nt8+DMPEKwtz4uH54YLN5xv5+N+LYKQycG
         ZAytlQ7HaoztjsVnBITnCkHJxvPwCUN5HCCzdYqao1B31Yo0tP5MzaFy/rSgObQo7WPq
         sKm8bCqRNCa45llxv2wehkuTLKsdJ4o+B6+sHgdpubWS9doUCG9/VquCHEqhDiFnJN/h
         Q5wNrPjaZQ0NxrT1/fC+NtBVCDVdpYCW8k+SObEVc/UtAncjcDPwWAihIOrFmtwuVh48
         5AEw==
X-Gm-Message-State: APjAAAXByYZ3gGUGbQ0v5Uq36mU2lzhYc03HiFCYuVq/RUuMWAB1cKBw
        LGexLPXXD7yZH/l/8TMLbjzl4sadIeCaDQ==
X-Google-Smtp-Source: APXvYqydh8wiGjD4B4RIwh/9Ka0U7RW6feS+QAYqyMGvCeKmZsf7oPx/9mnCJHqVYDNc6UGDpiaqqQ==
X-Received: by 2002:a17:902:9042:: with SMTP id w2mr31225637plz.323.1572914986166;
        Mon, 04 Nov 2019 16:49:46 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id z2sm17577555pgo.13.2019.11.04.16.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 16:49:45 -0800 (PST)
Message-ID: <5dc0c729.1c69fb81.4575.3392@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1572529762-31256-2-git-send-email-sanm@codeaurora.org>
References: <1572529762-31256-1-git-send-email-sanm@codeaurora.org> <1572529762-31256-2-git-send-email-sanm@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH 1/1] arm64: dts: qcom: sc7180: Add USB related nodes
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, sanm@codeaurora.org
User-Agent: alot/0.8.1
Date:   Mon, 04 Nov 2019 16:49:44 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2019-10-31 06:49:22)
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dt=
s/qcom/sc7180-idp.dts
> index 189254f..aecc994 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -400,3 +400,28 @@
>                         bias-pull-up;
>                 };
>  };
> +
> +&usb_1 {
> +       status =3D "okay";
> +};
> +
> +&usb_1_dwc3 {
> +       dr_mode =3D "host";
> +};
> +
> +&usb_1_hsphy {
> +       status =3D "okay";
> +       vdd-supply =3D <&vreg_l4a_0p8>;
> +       vdda-pll-supply =3D <&vreg_l11a_1p8>;
> +       vdda-phy-dpdm-supply =3D <&vreg_l17a_3p0>;
> +       qcom,imp-res-offset-value =3D <8>;
> +       qcom,hstx-trim-value =3D <QUSB2_V2_HSTX_TRIM_21_6_MA>;
> +       qcom,preemphasis-level =3D <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
> +       qcom,preemphasis-width =3D <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
> +};
> +
> +&usb_1_qmpphy {
> +       status =3D "okay";
> +       vdda-phy-supply =3D <&vreg_l3c_1p2>;
> +       vdda-pll-supply =3D <&vreg_l4a_0p8>;
> +};
> \ No newline at end of file

Why is there no newline at end of file?

> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/q=
com/sc7180.dtsi
> index cb623b7..7ee068f 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/phy/phy-qcom-qusb2.h>

Sort includes?

> =20
>  / {
>         interrupt-parent =3D <&intc>;
> @@ -184,6 +185,17 @@
>                         #power-domain-cells =3D <1>;
>                 };
> =20
> +               qfprom@784000 {
> +                       compatible =3D "qcom,qfprom";
> +                       reg =3D <0 0x00784000 0 0x8ff>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +
> +                       qusb2p_hstx_trim: hstx-trim-primary@25b {
> +                               reg =3D <0x25b 0x1>;
> +                               bits =3D <1 3>;
> +                       };
> +               };

Add newline here?

>                 pdc: interrupt-controller@b220000 {
>                         compatible =3D "qcom,sdm845-pdc";
>                         reg =3D <0 0xb220000 0 0x30000>;
> @@ -913,6 +925,98 @@
>                         status =3D "disabled";
>                 };
> =20
> +               usb_1_hsphy: phy@88e3000 {
> +                       compatible =3D "qcom,sc7180-qusb2-phy";
> +                       reg =3D <0 0x088e3000 0 0x400>;
> +                       status =3D "disabled";
> +                       #phy-cells =3D <0>;
> +                       clocks =3D <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> +                       <&rpmhcc RPMH_CXO_CLK>;

Nitpick: Can you indent this to align with clocks above?

> +                       clock-names =3D "cfg_ahb","ref";
> +                       resets =3D <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> +
> +                       nvmem-cells =3D <&qusb2p_hstx_trim>;
> +               };
> +
> +               usb_1_qmpphy: phy@88e9000 {
> +                       compatible =3D "qcom,sc7180-qmp-usb3-phy";
> +                       reg =3D <0 0x088e9000 0 0x18c>,
> +                             <0 0x088e8000 0 0x38>;
> +                       reg-names =3D "reg-base", "dp_com";
> +                       status =3D "disabled";
> +                       #clock-cells =3D <1>;
> +                       #address-cells =3D <2>;
> +                       #size-cells =3D <2>;
> +                       ranges;
> +
> +                       clocks =3D <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
> +                                <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> +                                <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
> +                                <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
> +                       clock-names =3D "aux", "cfg_ahb", "ref", "com_aux=
";
> +
> +                       resets =3D <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
> +                                <&gcc GCC_USB3_PHY_PRIM_BCR>;
> +                       reset-names =3D "phy", "common";
> +
> +                       usb_1_ssphy: lanes@88e9200 {
> +                               reg =3D <0 0x088e9200 0 0x128>,
> +                                     <0 0x088e9400 0 0x200>,
> +                                     <0 0x088e9c00 0 0x218>,
> +                                     <0 0x088e9600 0 0x128>,
> +                                     <0 0x088e9800 0 0x200>,
> +                                     <0 0x088e9a00 0 0x18>;
> +                               #phy-cells =3D <0>;
> +                               clocks =3D <&gcc GCC_USB3_PRIM_PHY_PIPE_C=
LK>;
> +                               clock-names =3D "pipe0";
> +                               clock-output-names =3D "usb3_phy_pipe_clk=
_src";

Does this clock go somewhere? Like GCC?

> +                       };
> +               };
> +
