Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19348144822
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2020 00:16:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbgAUXQU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jan 2020 18:16:20 -0500
Received: from mail-pf1-f174.google.com ([209.85.210.174]:34766 "EHLO
        mail-pf1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727847AbgAUXQT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jan 2020 18:16:19 -0500
Received: by mail-pf1-f174.google.com with SMTP id i6so2293301pfc.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2020 15:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:cc:subject:to:user-agent:date;
        bh=gk/+cR1Uh1x2DHe/9AsJJHsSZHNN3UqDGvYH0Xb+zh8=;
        b=O79JN3kfznrn5eDqAjPiKLeDDyICkKbjMMxe1z4CkxRlkDvUL25WwtzsL8ATud3/0S
         vIkxXjbW39ptw0hpyird4o0jXonSy2LL5ov8w4SvjmdmvVKMK3OEfiUeikilFqXoamkO
         A8UZj9KyXGoRqivE5Z0YbU+yLPIi0wgQyo89E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:cc:subject:to
         :user-agent:date;
        bh=gk/+cR1Uh1x2DHe/9AsJJHsSZHNN3UqDGvYH0Xb+zh8=;
        b=K6On29OqPwxXgbTgvO/sf8BlwtTtrKo0nefbTJJaPi3qnp67bXU4/oTKFZVclTdVGM
         ipV11bltQwoNKPUJtthbfD//hPCIoEgOK4H2/TICSmU9+4h89hth5kmyaD+oJcVQOd9j
         GZIkqx+nhNL6bgzOxKsOEvJGz65sxOrmAnRLTXfQHts9AZRwXa4Hpfk+fmkeZjyZ2c8M
         AYt5DCzAH86LPakia5t0zqbZaziIygxIJctRZ0/AUizV1R0oPFwmaVnt0V2YenhbMh4F
         SlzbWX11i4qrLmNTAojxyaF8rsIfXqeCl9PwrnLA3qhJGF9caPY2eeavdidKOnJv725F
         keyw==
X-Gm-Message-State: APjAAAXOmMQ6ahYFLrMd8VHBhLvQ/X5yzHQ8P0jPDp4ZCKxG7hFObRme
        3ByK0m/CN2jMJvpq/5Vam4Vy0Q==
X-Google-Smtp-Source: APXvYqzc5YyY9m9Z4aytEaUg9NesrLmumCIMVJQdqT2tTi4c8P468lTNoYuY+PzXEggedpkJhGWNrQ==
X-Received: by 2002:a63:d66:: with SMTP id 38mr7812028pgn.233.1579648578855;
        Tue, 21 Jan 2020 15:16:18 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id u20sm41961955pgf.29.2020.01.21.15.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 15:16:18 -0800 (PST)
Message-ID: <5e278642.1c69fb81.5a8db.80b4@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1579621928-18619-1-git-send-email-harigovi@codeaurora.org>
References: <1579621928-18619-1-git-send-email-harigovi@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Harigovindan P <harigovi@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        kalyan_t@codeaurora.org, nganji@codeaurora.org
Subject: Re: [v1] arm64: dts: sc7180: add display dt nodes
To:     Harigovindan P <harigovi@codeaurora.org>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Tue, 21 Jan 2020 15:16:17 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Harigovindan P (2020-01-21 07:52:08)
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/q=
com/sc7180.dtsi
> old mode 100644
> new mode 100755
> index 8011c5f..963f5c1
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1151,6 +1151,131 @@
>                         };
>                 };
> =20
> +               mdss: mdss@ae00000 {

Is there a better node name for this? display-subsystem perhaps?

> +                       compatible =3D "qcom,sc7180-mdss";
> +                       reg =3D <0 0x0ae00000 0 0x1000>;
> +                       reg-names =3D "mdss";
> +
> +                       power-domains =3D <&dispcc MDSS_GDSC>;
> +
> +                       clocks =3D <&gcc GCC_DISP_AHB_CLK>,
> +                                <&gcc GCC_DISP_HF_AXI_CLK>,
> +                                <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +                       clock-names =3D "iface", "gcc_bus", "core";
> +
> +                       assigned-clocks =3D <&dispcc DISP_CC_MDSS_MDP_CLK=
>;
> +                       assigned-clock-rates =3D <300000000>;
> +
> +                       interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-controller;
> +                       #interrupt-cells =3D <1>;
> +
> +                       iommus =3D <&apps_smmu 0x800 0x2>;
> +
> +                       #address-cells =3D <2>;
> +                       #size-cells =3D <2>;
> +                       ranges;
> +
> +                       mdss_mdp: mdp@ae01000 {

Is there a better node name for this? display-controller perhaps? Also,
first reg property is supposed to be the one after the @ sign. In this
case that would be ae00000.

> +                               compatible =3D "qcom,sc7180-dpu";
> +                               reg =3D <0 0x0ae00000 0 0x1000>,
> +                                     <0 0x0ae01000 0 0x8f000>,
> +                                     <0 0x0aeb0000 0 0x2008>,
> +                                     <0 0x0af03000 0 0x16>;
> +                               reg-names =3D "mdss","mdp", "vbif", "disp=
_cc";

                                                    ^
Nitpick: Add a space here after the comma.

> +
> +                               clocks =3D <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_ROT_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_MDP_LUT_CL=
K>,
> +                                        <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                               clock-names =3D "iface", "rot", "lut", "c=
ore",
> +                                               "vsync";

Nitpick: Tabbing seems weird here. The clocks property is aligned but
not the clock-names.

> +                               assigned-clocks =3D <&dispcc DISP_CC_MDSS=
_MDP_CLK>,
> +                                                 <&dispcc DISP_CC_MDSS_V=
SYNC_CLK>;
> +                               assigned-clock-rates =3D <300000000>,
> +                                                      <19200000>;
> +
> +                               interrupt-parent =3D <&mdss>;
> +                               interrupts =3D <0 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               ports {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +
> +                                       port@0 {
> +                                               reg =3D <0>;
> +                                               dpu_intf1_out: endpoint {
> +                                                       remote-endpoint =
=3D <&dsi0_in>;
> +                                               };
> +                                       };
> +                               };
> +                       };
> +
> +                       dsi0: qcom,mdss_dsi_ctrl0@ae94000 {

Is there a better node name for this? dsi-controller perhaps?

> +                               compatible =3D "qcom,mdss-dsi-ctrl";
> +                               reg =3D <0 0x0ae94000 0 0x400>;
> +                               reg-names =3D "dsi_ctrl";
> +
> +                               interrupt-parent =3D <&mdss>;
> +                               interrupts =3D <4 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks =3D <&dispcc DISP_CC_MDSS_BYTE0_CL=
K>,
> +                                       <&dispcc DISP_CC_MDSS_BYTE0_INTF_=
CLK>,
> +                                       <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
> +                                       <&dispcc DISP_CC_MDSS_ESC0_CLK>,
> +                                       <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                       <&gcc GCC_DISP_HF_AXI_CLK>;
> +                               clock-names =3D "byte",
> +                                              "byte_intf",
> +                                              "pixel",
> +                                              "core",
> +                                              "iface",
> +                                              "bus";

Nitpick: Tabbing is all of here too.

> +
> +                               phys =3D <&dsi0_phy>;
> +                               phy-names =3D "dsi";
> +
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               ports {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +
> +                                       port@0 {
> +                                               reg =3D <0>;
> +                                               dsi0_in: endpoint {
> +                                                       remote-endpoint =
=3D <&dpu_intf1_out>;
> +                                               };
> +                                       };
> +
> +                                       port@1 {
> +                                               reg =3D <1>;
> +                                               dsi0_out: endpoint {
> +                                               };
> +                                       };
> +                               };
> +                       };
> +
> +                       dsi0_phy: dsi-phy0@ae94400 {

Just call it 'dsi-phy' or 'phy' please. The address differentiates it and
the phandle can call it 0.

> +                               compatible =3D "qcom,dsi-phy-10nm";
> +                               reg =3D <0 0x0ae94400 0 0x200>,
> +                                     <0 0x0ae94600 0 0x280>,
> +                                     <0 0x0ae94a00 0 0x1e0>;
> +                               reg-names =3D "dsi_phy",
> +                                           "dsi_phy_lane",
> +                                           "dsi_pll";
> +
> +                               #clock-cells =3D <1>;
> +                               #phy-cells =3D <0>;
> +
> +                               clocks =3D <&dispcc DISP_CC_MDSS_AHB_CLK>;

Do you need the XO or reference clk here too? So that the PLL can generate =
a clk with
the reference clk?

> +                               clock-names =3D "iface";
> +

Nitpick: Why the extra newline? Please remove.

> +                       };
> +               };
> +
>                 pdc: interrupt-controller@b220000 {
>                         compatible =3D "qcom,sc7180-pdc", "qcom,pdc";
>                         reg =3D <0 0x0b220000 0 0x30000>;
