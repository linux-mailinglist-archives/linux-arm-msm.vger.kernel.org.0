Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55EEF14F2C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 20:32:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbgAaTcb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 14:32:31 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:38380 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726907AbgAaTcb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 14:32:31 -0500
Received: by mail-vk1-f194.google.com with SMTP id w4so791551vkd.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2020 11:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0AtmJu7hXFUNe9U3goH8OgcFhymU6r5KbMZh3chCyp8=;
        b=Y42wNtuXU4P+de/Vgcp5OnUMD4nNFqiqVgdYLDKU/FTQidGg4kPiTTzI8D6unCgDlW
         cRSrOjeeXtsMZH6UH3U+QQTa6XgYTE6sgdc4JM6qyisI4VC+P2DdvkbY/pqjavthdmkC
         SW/yx5sMjogM1mA2XWGieJw1nmxFxRYeTplAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0AtmJu7hXFUNe9U3goH8OgcFhymU6r5KbMZh3chCyp8=;
        b=rD4urLCam0e8N32dVwhd7HPetbbFZH0Q9L1L/3FTjmHqk5b9poI9CwHXu2KpjRHobJ
         bql2w51A+ePjMM2cSLn9ftD1ZOocnwFkuNXbx7iFgmI4Tk7DUUKM63Ibi9f/4rzsJILt
         2S4ugj+syIfYyupVn+mmVPy3XaQDrVBrBQ/Z+fwPYjzV+sq5rh2sbwicT+9gPpbe4BLs
         ++h/kErJRFqCh0GHS8uuOfLQyhdvTqkOLrEoUttheJPOOz3bZA5BiOJ3Tx5Q/s7PZ7mL
         EuuGi5FS09nFromy/kgjys3hoxDjq0ZK18L/snZ7SomOItL/kQ0DlQNvUb44B8pGe9A0
         bx0w==
X-Gm-Message-State: APjAAAWn/LiFS9SaGX9BVYXTLS7yajK8h52YKkdU8sJVhDzrcG0tSn7s
        T39ipXt7YhotFMMo0YWq3/iSlLoTeFo=
X-Google-Smtp-Source: APXvYqzjjvrRuByUkfva+YfTKDsErbo7QfwYm4FE7L8T7IeNlYgn/SsBCQF2xN9NbOeDJ66TkQTRpw==
X-Received: by 2002:a1f:ea04:: with SMTP id i4mr7216018vkh.94.1580499148126;
        Fri, 31 Jan 2020 11:32:28 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 41sm2365506uaf.8.2020.01.31.11.32.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2020 11:32:27 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id 73so2994257uac.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2020 11:32:27 -0800 (PST)
X-Received: by 2002:ab0:724c:: with SMTP id d12mr7404736uap.0.1580499146366;
 Fri, 31 Jan 2020 11:32:26 -0800 (PST)
MIME-Version: 1.0
References: <1580217884-21932-1-git-send-email-harigovi@codeaurora.org>
In-Reply-To: <1580217884-21932-1-git-send-email-harigovi@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 31 Jan 2020 11:32:14 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XwbHyYSCCqjgHoqQcRAwwekFYZbM-Mh1o=f0z+_W8ukw@mail.gmail.com>
Message-ID: <CAD=FV=XwbHyYSCCqjgHoqQcRAwwekFYZbM-Mh1o=f0z+_W8ukw@mail.gmail.com>
Subject: Re: [v4] arm64: dts: sc7180: add display dt nodes
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>, nganji@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jan 28, 2020 at 5:25 AM Harigovindan P <harigovi@codeaurora.org> wrote:
>
> Add display, DSI hardware DT nodes for sc7180.
>
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
>
> Changes in v1:
>         -Added display DT nodes for sc7180
> Changes in v2:
>         -Renamed node names
>         -Corrected code alignments
>         -Removed extra new line
>         -Added DISP AHB clock for register access
>         under display_subsystem node for global settings
> Changes in v3:
>         -Modified node names
>         -Modified hard coded values
>         -Removed mdss reg entry
> Changes in v4:
>         -Reverting mdp node name
>         -Setting status to disabled in main SOC dtsi file
>         -Replacing _ to - for node names
>         -Adding clock dependency patch link
>         -Splitting idp dt file to a separate patch
>
> This patch has dependency on the below series
> https://lkml.org/lkml/2019/12/27/73
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 128 +++++++++++++++++++++++++++++++++++
>  1 file changed, 128 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 3bc3f64..c3883af 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1184,6 +1184,134 @@
>                         #power-domain-cells = <1>;
>                 };
>
> +               mdss: mdss@ae00000 {
> +                       compatible = "qcom,sc7180-mdss";
> +                       reg = <0 0x0ae00000 0 0x1000>;
> +                       reg-names = "mdss";
> +
> +                       power-domains = <&dispcc MDSS_GDSC>;
> +
> +                       clocks = <&gcc GCC_DISP_AHB_CLK>,
> +                                <&gcc GCC_DISP_HF_AXI_CLK>,
> +                                <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +                       clock-names = "iface", "gcc_bus", "ahb", "core";

The clock "ahb" is not in your bindings.  If it is truly needed,
please update your bindings.

The clock "gcc_bus" is just called "bus" in the bindings.  Assuming
this is the same clock, please use the name from the bindings.


> +                       assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +                       assigned-clock-rates = <300000000>;
> +
> +                       interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-controller;
> +                       #interrupt-cells = <1>;
> +
> +                       iommus = <&apps_smmu 0x800 0x2>;
> +
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
> +                       ranges;

Do we need a:
  status = "disabled";

I noticed that in sdm845 the top-level mdss node _does_ have that.  If
someone was building a board with your chip and they had no display at
all, would they want this node disabled?  If so then it should be
disabled by default and boards should opt-in.


> +                       mdss_mdp: mdp@ae01000 {
> +                               compatible = "qcom,sc7180-dpu";
> +                               reg = <0 0x0ae01000 0 0x8f000>,
> +                                     <0 0x0aeb0000 0 0x2008>,
> +                                     <0 0x0af03000 0 0x16>;
> +                               reg-names = "mdp", "vbif", "disp_cc";

Did I already ask why you need the "disp_cc" register space?  If I
didn't, can I ask now?  This is not in the bindings and I can't think
of why you'd want it.  Does the code use it?  It doesn't seem to...


> +                               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_ROT_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                               clock-names = "iface", "rot", "lut", "core",
> +                                             "vsync";

Your bindings doc says that "bus" is required, yet you don't pass it.
Should you?

Your bindings doc says nothing about "rot" and "lut".  Presumably
those should be added if they are actually needed?


> +                               assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                                                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                               assigned-clock-rates = <300000000>,
> +                                                      <19200000>;
> +
> +                               interrupt-parent = <&mdss>;
> +                               interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;

Do we need a:
  status = "disabled";

I noticed that in sdm845 the mdss_mdp node _does_ have that.  NOTE:
you'd only want to add it if it ever made sense to turn on the
top-level mdss node but not this one.  If this should always be
enabled at the exact same time as the top-level mdss node then there's
no need to add the 'status = "disabled";'

If you decide that you don't need to add this, maybe you can submit a
separate patch to remove it from sdm845?


> +                               ports {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +
> +                                       port@0 {
> +                                               reg = <0>;
> +                                               dpu_intf1_out: endpoint {
> +                                                       remote-endpoint = <&dsi0_in>;
> +                                               };
> +                                       };
> +                               };
> +                       };
> +
> +                       dsi_controller: dsi-controller@ae94000 {

nit: Though "dsi-controller" is a sensible name, current binding
examples show "dsi", not "dsi-controller".  The name "dsi" seems
blessed by Rob Herring since it came from commit a3c463e0961c
("dt-bindings: msm/dsi: Some binding doc cleanups") which has his Ack,
so I'd rather go with that.


> +                               compatible = "qcom,mdss-dsi-ctrl";
> +                               reg = <0 0x0ae94000 0 0x400>;
> +                               reg-names = "dsi_ctrl";
> +
> +                               interrupt-parent = <&mdss>;
> +                               interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_ESC0_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                        <&gcc GCC_DISP_HF_AXI_CLK>;

Comparing with sdm845 I notice that the last clock used to come from
dispcc.  Now you're getting it from gcc.  Did the architecture
actually change or are you working around a clock that should be
exported by the dispcc but hasn't been finished yet?


> +                               clock-names = "byte",
> +                                             "byte_intf",
> +                                             "pixel",
> +                                             "core",
> +                                             "iface",
> +                                             "bus";

Your bindings doc says this about which clocks you need:

- clock-names: the following clocks are required:
  * "mdp_core"
  * "iface"
  * "bus"
  * "core_mmss"
  * "byte"
  * "pixel"
  * "core"
  For DSIv2, we need an additional clock:
   * "src"
  For DSI6G v2.0 onwards, we need also need the clock:
   * "byte_intf"

...seems like either the binding is wrong or you're missing a few
clocks.  Which is it?


> +                               phys = <&dsi_phy>;
> +                               phy-names = "dsi";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +
> +                               ports {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +
> +                                       port@0 {
> +                                               reg = <0>;
> +                                               dsi0_in: endpoint {
> +                                                       remote-endpoint = <&dpu_intf1_out>;
> +                                               };
> +                                       };
> +
> +                                       port@1 {
> +                                               reg = <1>;
> +                                               dsi0_out: endpoint {
> +                                               };
> +                                       };
> +                               };
> +                       };
> +
> +                       dsi_phy: dsi-phy@ae94400 {
> +                               compatible = "qcom,dsi-phy-10nm";
> +                               reg = <0 0x0ae94400 0 0x200>,
> +                                     <0 0x0ae94600 0 0x280>,
> +                                     <0 0x0ae94a00 0 0x1e0>;
> +                               reg-names = "dsi_phy",
> +                                           "dsi_phy_lane",
> +                                           "dsi_pll";
> +
> +                               #clock-cells = <1>;
> +                               #phy-cells = <0>;
> +
> +                               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>;
> +                               clock-names = "iface";

Your bindings say:

- clock-names: the following clocks are required:
  * "iface"
  * "ref" (only required for new DTS files/entries)

I think you qualify as a "new" DTS file, so you should be providing "ref".


> +                               status = "disabled";

Bindings list "power-domains" as a required property.  Should the
bindings be updated to make this optional, or should you be adding it?


> +                       };
> +               };
> +
>                 pdc: interrupt-controller@b220000 {

nit: your sorting is still slightly off.  I can certainly apply your
patch atop the dispcc device tree patch [1] now, which is good.  But
the context clue in your patch that your stuff comes right before the
'pdc: interrupt-controller@b220000' means that you are being placed
_after_ 'dispcc: clock-controller@af00000'.  You should be before it
since ae00000 < af00000.

...this may sound like making a big deal out of nothing, but keeping
things sorted correctly is the best way to reduce merge conflicts when
landing patches and that's a big deal.

--

Also, in response to your last patch [2] I said:

> ...speaking of which, can you please change your patch to replace the
> bogus <0> in the dispcc for the DSI PHY, providing the clocks for
> "dsi_phy_pll_byte" and "dsi_phy_pll_pixel"?  See
> <https://crrev.com/c/2017974/3>

It doesn't appear that you've done this.  Can you?


NOTE: as you can probably guess, my review was mostly this:
- Compare your nodes with the nodes in a similar SoC (sdm845).
- Compare your nodes with the examples in the bindings.
- Compare your nodes with the text of the bindings.

Those are good things for you to do before you send out future patches
to help make sure you didn't miss anything.


-Doug

[1] https://lore.kernel.org/r/20200130131220.v3.15.I1a4b93fb005791e29a9dcf288fc8bd459a555a59@changeid
[2] https://lore.kernel.org/r/CAD=FV=WKVGq+x1XFvZQvBcKVPdcVxQWJJmsqpAxY3t4dorvMYg@mail.gmail.com/
