Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A875E18AA03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2020 01:48:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgCSAsb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Mar 2020 20:48:31 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:33548 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbgCSAsb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Mar 2020 20:48:31 -0400
Received: by mail-pj1-f65.google.com with SMTP id dw20so1620438pjb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2020 17:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=F+8qEsHCihA/upFwOD+n8Z89QlpcvWA6YcIP6FiyIoc=;
        b=VkoPAWn0qesYDAbxC1oYgdt4t23xU93ASnUrOEzIVDz7DwrrJRC7CRZixF02Zaq1Hf
         URtR5bq6tPIL9xxM9xcfEJNQcMLTREuWUjeNci/RYqb1Mg34of6J6zJYUAAseMu7B+Th
         7OfRvHJmElKv6Bd24PgkYXsT8dM7iBtFMNLlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=F+8qEsHCihA/upFwOD+n8Z89QlpcvWA6YcIP6FiyIoc=;
        b=pthen5z+kHseXN90hQOxgcKT7Ivh/ynMnhRZXuZEG5A+ReNLlyd3jLS5bBZOxOOXaI
         Nf/aCJ62R3UFFACfyD9AUuyraNjiVOetmmPzUY/xcGqXGRRt7Ldyg/65ozP/5bbIrWvc
         T5DRSbHD6G3tCwK+CHyFJeoChEqWjzbTLt4RDR6CJRlHB2Ddob8sbQx4Uib3rHVD2753
         l8MnD2cjZpXHBacAasJKqBlnCPTgXWuSzpzgbNuzYJZRAXyLXmWzYaxivNjQomUvzmV9
         G8X4z5E5RXrLARnJxRh8cxxP2cCGLVQi9klLBxTlZltxv6CAsFTn9po3diIB2wWGeOV/
         DGQQ==
X-Gm-Message-State: ANhLgQ1Cz47W5w1LPC616B82i4DvCvPtJ4M4D9Ip8RL2BUpqmhMVI9rp
        6DmerVECIAzP7W28Sw866X4tXg==
X-Google-Smtp-Source: ADFU+vtVYKkYoVSkfz07Z51dcbgiu1tVxz7OmrUvw2lFgRn0Eyh21JwVpHZFtfagLGHImd52mO8l2Q==
X-Received: by 2002:a17:902:8d89:: with SMTP id v9mr760736plo.83.1584578909331;
        Wed, 18 Mar 2020 17:48:29 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id p5sm189144pfn.182.2020.03.18.17.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 17:48:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1583367028-19979-2-git-send-email-varar@codeaurora.org>
References: <1583367028-19979-1-git-send-email-varar@codeaurora.org> <1583367028-19979-2-git-send-email-varar@codeaurora.org>
Subject: Re: [DPU PATCH v4 1/5] dt-bindings: msm/dp: add bindings of DP/DP-PLL driver for Snapdragon
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Chandan Uddaraju <chandanu@codeaurora.org>, robdclark@gmail.com,
        abhinavk@codeaurora.org, nganji@codeaurora.org,
        jsanka@codeaurora.org, hoegsberg@google.com,
        aravindh@codeaurora.org, dri-devel@lists.freedesktop.org,
        Vara Reddy <varar@codeaurora.org>
To:     Vara Reddy <varar@codeaurora.org>, devicetree@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        seanpaul@chromium.org
Date:   Wed, 18 Mar 2020 17:48:27 -0700
Message-ID: <158457890765.152100.17742965907717707149@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vara Reddy (2020-03-04 16:10:24)
> From: Chandan Uddaraju <chandanu@codeaurora.org>
>=20
> Add bindings for Snapdragon DisplayPort and
> display-port PLL driver.
>=20
> Changes in V2:
> Provide details about sel-gpio
>=20
> Changes in V4:
> Provide details about max dp lanes
> Change the commit text
>=20
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> Signed-off-by: Vara Reddy <varar@codeaurora.org>
> ---
>  .../devicetree/bindings/display/msm/dp.txt         | 252 +++++++++++++++=
++++++
>  .../devicetree/bindings/display/msm/dpu.txt        |  16 +-
>  2 files changed, 264 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dp.txt

Having this in YAML will certainly make it easier to review. Please do
that as Rob H has asked.

>=20
> diff --git a/Documentation/devicetree/bindings/display/msm/dp.txt b/Docum=
entation/devicetree/bindings/display/msm/dp.txt
> new file mode 100644
> index 0000000..1a4e17f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dp.txt
> @@ -0,0 +1,252 @@
> +Qualcomm Technologies, Inc.
> +DP is the master Display Port device which supports DP host controllers =
that are compatible with VESA Display Port interface specification.
> +DP Controller: Required properties:
> +- compatible:           Should be "qcom,dp-display".
> +- reg:                  Base address and length of DP hardware's memory =
mapped regions.
> +- cell-index:           Specifies the controller instance.
> +- reg-names:            A list of strings that name the list of regs.
> +                       "dp_ahb" - DP controller memory region.
> +                       "dp_aux" - DP AUX memory region.
> +                       "dp_link" - DP link layer memory region.
> +                       "dp_p0" - DP pixel clock domain memory region.
> +                       "dp_phy" - DP PHY memory region.
> +                       "dp_ln_tx0" - USB3 DP PHY combo TX-0 lane memory =
region.
> +                       "dp_ln_tx1" - USB3 DP PHY combo TX-1 lane memory =
region.
> +                       "dp_mmss_cc" - Display Clock Control memory regio=
n.
> +                       "qfprom_physical" - QFPROM Phys memory region.
> +                       "dp_pll" - USB3 DP combo PLL memory region.
> +                       "usb3_dp_com" - USB3 DP PHY combo memory region.
> +                       "hdcp_physical" - DP HDCP memory region.

A handful of these register properties overlap with the USB PHY region.
I suspect the existing qcom,sc7180-qmp-usb3-phy USB PHY binding that we
have is wrong. It should describe both the USB part and the DP part of
the combo PHY. Probably the DP part can be a subnode like how the
superspeed PHY is a child node of the wrapper node. Then we'll have to
figure out how to coordinate the access to usb3_dp_com (which I presume
corresponds to the dp_com region in the usb3-phy binding) so that the
USB and DP PHY drivers can figure out how to configure the "type-c" pins
on the SoC to be 2 lanes DP and 2 lanes USB or 4 lanes USB or 4 lanes DP.

> +- interrupt-parent     phandle to the interrupt parent device node.
> +- interrupts:          The interrupt signal from the DP block.
> +- clocks:               Clocks required for Display Port operation. See =
[1] for details on clock bindings.
> +- clock-names:          Names of the clocks corresponding to handles. Fo=
llowing clocks are required:
> +                       "core_aux_clk", "core_usb_ref_clk_src","core_usb_=
ref_clk", "core_usb_cfg_ahb_clk",
> +                       "core_usb_pipe_clk", "ctrl_link_clk", "ctrl_link_=
iface_clk", "ctrl_crypto_clk",
> +                       "ctrl_pixel_clk", "pixel_clk_rcg", "pixel_parent".

Please remove _clk suffix on all clock names. It's redundant.

> +- pll-node:            phandle to DP PLL node.
> +- vdda-1p2-supply:             phandle to vdda 1.2V regulator node.
> +- vdda-0p9-supply:             phandle to vdda 0.9V regulator node.
> +- qcom,aux-cfg0-settings:              Specifies the DP AUX configuratio=
n 0 settings. The first
> +                                       entry in this array corresponds t=
o the register offset
> +                                       within DP AUX, while the remainin=
g entries indicate the
> +                                       programmable values.
> +- qcom,aux-cfg1-settings:              Specifies the DP AUX configuratio=
n 1 settings. The first
> +                                       entry in this array corresponds t=
o the register offset
> +                                       within DP AUX, while the remainin=
g entries indicate the
> +                                       programmable values.
> +- qcom,aux-cfg2-settings:              Specifies the DP AUX configuratio=
n 2 settings. The first
> +                                       entry in this array corresponds t=
o the register offset
> +                                       within DP AUX, while the remainin=
g entries indicate the
> +                                       programmable values.
> +- qcom,aux-cfg3-settings:              Specifies the DP AUX configuratio=
n 3 settings. The first
> +                                       entry in this array corresponds t=
o the register offset
> +                                       within DP AUX, while the remainin=
g entries indicate the
> +                                       programmable values.
> +- qcom,aux-cfg4-settings:              Specifies the DP AUX configuratio=
n 4 settings. The first
> +                                       entry in this array corresponds t=
o the register offset
> +                                       within DP AUX, while the remainin=
g entries indicate the
> +                                       programmable values.
> +- qcom,aux-cfg5-settings:              Specifies the DP AUX configuratio=
n 5 settings. The first
> +                                       entry in this array corresponds t=
o the register offset
> +                                       within DP AUX, while the remainin=
g entries indicate the
> +                                       programmable values.
> +- qcom,aux-cfg6-settings:              Specifies the DP AUX configuratio=
n 6 settings. The first
> +                                       entry in this array corresponds t=
o the register offset
> +                                       within DP AUX, while the remainin=
g entries indicate the
> +                                       programmable values.
> +- qcom,aux-cfg7-settings:              Specifies the DP AUX configuratio=
n 7 settings. The first
> +                                       entry in this array corresponds t=
o the register offset
> +                                       within DP AUX, while the remainin=
g entries indicate the
> +                                       programmable values.
> +- qcom,aux-cfg8-settings:              Specifies the DP AUX configuratio=
n 8 settings. The first
> +                                       entry in this array corresponds t=
o the register offset
> +                                       within DP AUX, while the remainin=
g entries indicate the
> +                                       programmable values.
> +- qcom,aux-cfg9-settings:              Specifies the DP AUX configuratio=
n 9 settings. The first
> +                                       entry in this array corresponds t=
o the register offset
> +                                       within DP AUX, while the remainin=
g entries indicate the
> +                                       programmable values.

It would be better if these properties were understandable by us mere
kernel developers out there. Is it possible to make them into standalone
properties that control certain configuration tunings? Are any of these
not variable per-board and can be hardcoded based on the SoC into the
driver?

> +- qcom,max-pclk-frequency-khz:         An integer specifying the maximum=
. pixel clock in KHz supported by Display Port.

This can't be detected at runtime?

> +- qcom,max-lanes-for-dp:               Maximum number of lanes that can =
be used for Display port.

This can come from an of graph walk to figure out how many possible
lanes are connected? Or some more standard property that describes
logical to physical lane mapping, like data-lanes?

> +- qcom,<type>-supply-entries:          A node that lists the elements of=
 the supply used by the a particular "type" of DP module. The module "types"
> +                                       can be "core", "ctrl", and "phy".=
 Within the same type,
> +                                       there can be more than one instan=
ce of this binding,
> +                                       in which case the entry would be =
appended with the
> +                                       supply entry index.
> +                                       e.g. qcom,ctrl-supply-entry@0
> +                                       -- qcom,supply-name: name of the =
supply (vdd/vdda/vddio)
> +                                       -- qcom,supply-min-voltage: minim=
um voltage level (uV)
> +                                       -- qcom,supply-max-voltage: maxim=
um voltage level (uV)
> +                                       -- qcom,supply-enable-load: load =
drawn (uA) from enabled supply
> +                                       -- qcom,supply-disable-load: load=
 drawn (uA) from disabled supply
> +                                       -- qcom,supply-pre-on-sleep: time=
 to sleep (ms) before turning on
> +                                       -- qcom,supply-post-on-sleep: tim=
e to sleep (ms) after turning on
> +                                       -- qcom,supply-pre-off-sleep: tim=
e to sleep (ms) before turning off
> +                                       -- qcom,supply-post-off-sleep: ti=
me to sleep (ms) after turning off

All these regulator properties look like things that should be handled
by board constraints on certain supplies, not by this binding or the
driver that matches this binding.

> +- pinctrl-names:       List of names to assign mdss pin states defined i=
n pinctrl device node
> +                                       Refer to pinctrl-bindings.txt
> +- pinctrl-<0..n>:      Lists phandles each pointing to the pin configura=
tion node within a pin
> +                                       controller. These pin configurati=
ons are installed in the pinctrl
> +                                       device node. Refer to pinctrl-bin=
dings.txt

These two properties aren't needed.

> +DP Endpoint properties:
> +  - remote-endpoint: For port@0, set to phandle of the connected panel/b=
ridge's
> +    input endpoint. For port@1, set to the DPU interface output. See [2]=
 for
> +    device graph info.
> +
> +Optional properties:
> +- qcom,aux-en-gpio:            Specifies the aux-channel enable gpio.
> +- qcom,aux-sel-gpio:           Specifies the mux-selection that might be=
 needed for aux interface.

Please use the normal '<your name here>-gpios' property for gpios.
> +
> +
> +DP PLL: Required properties:
> +- compatible:           Should be "qcom,dp-pll-10nm".
> +- reg:                  Base address and length of DP hardware's memory =
mapped regions.
> +- cell-index:           Specifies the PLL instance.
> +- reg-names:            A list of strings that name the list of regs.
> +                       "pll_base" - DP PLL memory region.
> +                       "phy_base" - DP PHY memory region.
> +                       "ln_tx0_base" - USB3 DP PHY combo TX-0 lane memor=
y region.
> +                       "ln_tx1_base" - USB3 DP PHY combo TX-1 lane memor=
y region.

This was in the other node binding. Probably the only reg property
required here is pll_base?

> +                       "gdsc_base" - gdsc memory region.
> +- interrupt-parent     phandle to the interrupt parent device node.
> +- interrupts:          The interrupt signal from the DP block.
> +- clocks:               Clocks required for Display Port operation. See =
[1] for details on clock bindings.
> +- clock-names:          Names of the clocks corresponding to handles. Fo=
llowing clocks are required:
> +                       "iface_clk", "ref_clk", cfg_ahb_clk", "pipe_clk".
> +- clock-rate:           Initial clock rate to be configured. For the sha=
red clocks, the default value                       is set to zero so that =
minimum clock value is configured. Non-zero clock

We have assigned-clock-rates for this.

> +                       value can be used to configure DP pixel clock.
> +
> +
> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> +[2] Documentation/devicetree/bindings/graph.txt
> +
> +Example:
> +       msm_dp: dp_display@ae90000{

No underscores in node names. It should also be somewhat generic like
'display-controller' or 'displayport-controller' and the first reg
property should match the unit address after the at sign (@).

> +               cell-index =3D <0>;
> +               compatible =3D "qcom,dp-display";
> +
> +               reg =3D   <0 0x90000 0x0dc>,
> +                       <0 0x90200 0x0c0>,
> +                       <0 0x90400 0x508>,
> +                       <0 0x90a00 0x094>,
> +                       <1 0xeaa00 0x200>,
> +                       <1 0xea200 0x200>,
> +                       <1 0xea600 0x200>,
> +                       <2 0x02000 0x1a0>,
> +                       <3 0x00000 0x621c>,
> +                       <1 0xea000 0x180>,
> +                       <1 0xe8000 0x20>,
> +                       <4 0xe1000 0x034>;
> +               reg-names =3D "dp_ahb", "dp_aux", "dp_link",
> +                       "dp_p0", "dp_phy", "dp_ln_tx0", "dp_ln_tx1",
> +                       "dp_mmss_cc", "qfprom_physical", "dp_pll",
> +                       "usb3_dp_com", "hdcp_physical";
> +
> +               interrupt-parent =3D <&display_subsystem>;
> +               interrupts =3D <12 0>;
> +
> +               extcon =3D <&usb_1_ssphy>;

Please no extcon

> +               clocks =3D  <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> +                       <&rpmhcc RPMH_CXO_CLK>,
> +                       <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
> +                       <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> +                       <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>,
> +                       <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> +                       <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> +                       <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
> +                       <&dispcc DISP_CC_MDSS_DP_CRYPTO_CLK>,
> +                       <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> +               clock-names =3D "core_aux_clk", "core_ref_clk_src",
> +                       "core_usb_ref_clk", "core_usb_cfg_ahb_clk",
> +                       "core_usb_pipe_clk", "ctrl_link_clk",
> +                       "ctrl_link_iface_clk", "ctrl_pixel_clk",
> +                       "crypto_clk", "pixel_clk_rcg";
> +
> +               pll-node =3D <&dp_pll>;
> +               vdda-1p2-supply =3D <&vreg_l3c_1p2>;
> +               vdda-0p9-supply =3D <&vreg_l4a_0p8>;
> +               qcom,aux-cfg0-settings =3D [20 00];
> +               qcom,aux-cfg1-settings =3D [24 13 23 1d];
> +               qcom,aux-cfg2-settings =3D [28 24];
> +               qcom,aux-cfg3-settings =3D [2c 00];
> +               qcom,aux-cfg4-settings =3D [30 0a];
> +               qcom,aux-cfg5-settings =3D [34 26];
> +               qcom,aux-cfg6-settings =3D [38 0a];
> +               qcom,aux-cfg7-settings =3D [3c 03];
> +               qcom,aux-cfg8-settings =3D [40 bb];
> +               qcom,aux-cfg9-settings =3D [44 03];
> +
> +               qcom,max-pclk-frequency-khz =3D <675000>;
> +               qcom,max-lanes-for-dp =3D <2>;
> +
> +               qcom,ctrl-supply-entries {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       qcom,ctrl-supply-entry@0 {
> +                               reg =3D <0>;
> +                               qcom,supply-name =3D "vdda-1p2";
> +                               qcom,supply-min-voltage =3D <1200000>;
> +                               qcom,supply-max-voltage =3D <1200000>;
> +                               qcom,supply-enable-load =3D <21800>;
> +                               qcom,supply-disable-load =3D <4>;
> +                       };
> +               };
> +
> +               qcom,phy-supply-entries {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       qcom,phy-supply-entry@0 {
> +                               reg =3D <0>;
> +                               qcom,supply-name =3D "vdda-0p9";
> +                               qcom,supply-min-voltage =3D <880000>;
> +                               qcom,supply-max-voltage =3D <880000>;
> +                               qcom,supply-enable-load =3D <36000>;
> +                               qcom,supply-disable-load =3D <32>;
> +                       };
> +               };
> +
> +               ports {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       port@0 {
> +                               reg =3D <0>;
> +                               dp_in: endpoint {
> +                                       remote-endpoint =3D <&dpu_intf0_o=
ut>;
> +                               };
> +                       };
> +
> +                       port@1 {
> +                               reg =3D <1>;
> +                               dp_out: endpoint {
> +                               };
> +                       };
> +               };
> +       };
> +
> +       dp_pll: dp-pll@c011000 {
> +               compatible =3D "qcom,dp-pll-10nm";
> +               label =3D "DP PLL";
> +               cell-index =3D <0>;
> +               #clock-cells =3D <1>;
> +
> +               reg =3D <1 0xea000 0x200>,
> +                     <1 0xeaa00 0x200>,
> +                     <1 0xea200 0x200>,
> +                     <1 0xea600 0x200>,
> +                     <2 0x03000 0x8>;
> +               reg-names =3D "pll_base", "phy_base", "ln_tx0_base",
> +                       "ln_tx1_base", "gdsc_base";
> +
> +               clocks =3D <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                        <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
> +                        <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> +                        <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +               clock-names =3D "iface_clk", "ref_clk",
> +                       "cfg_ahb_clk", "pipe_clk";
> +               clock-rate =3D <0>;
> +

Remove this extra newline.

> +       };
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Docu=
mentation/devicetree/bindings/display/msm/dpu.txt
> index 551ae26..7e99e45 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
> @@ -63,8 +63,9 @@ Required properties:
>         Documentation/devicetree/bindings/graph.txt
>         Documentation/devicetree/bindings/media/video-interfaces.txt
> =20
> -       Port 0 -> DPU_INTF1 (DSI1)
> -       Port 1 -> DPU_INTF2 (DSI2)
> +       Port 0 -> DPU_INTF0 (DP)

Why is port 0 changed to be DP? Can't we add DP to the end so that older
DTs remain compatible?

> +       Port 1 -> DPU_INTF1 (DSI1)
> +       Port 2 -> DPU_INTF2 (DSI2)
> =20
>  Optional properties:
>  - assigned-clocks: list of clock specifiers for clocks needing rate assi=
gnment
> @@ -125,13 +126,20 @@ Example:
> =20
>                                 port@0 {
>                                         reg =3D <0>;
> -                                       dpu_intf1_out: endpoint {
> -                                               remote-endpoint =3D <&dsi=
0_in>;
> +                                       dpu_intf0_out: endpoint {
> +                                               remote-endpoint =3D <&dp_=
in>;
>                                         };
>                                 };
> =20
>                                 port@1 {
>                                         reg =3D <1>;
> +                                       dpu_intf1_out: endpoint {
> +                                               remote-endpoint =3D <&dsi=
0_in>;
> +                                       };
> +                               };
> +
> +                               port@2 {
> +                                       reg =3D <2>;
>                                         dpu_intf2_out: endpoint {
>                                                 remote-endpoint =3D <&dsi=
1_in>;
>                                         };
> --=20
> $(echo -e 'The Qualcomm Innovation Center, Inc. is a member of the Code A=
urora Forum,

You should fix your signature :)
