Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD4AA1520DF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 20:14:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbgBDTOL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 14:14:11 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:42078 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727331AbgBDTOK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 14:14:10 -0500
Received: by mail-vs1-f65.google.com with SMTP id b79so12101032vsd.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 11:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c05eGhfP62oyJ4uJzi+JFgkkWqqqI9hWVBoKeCjxm4w=;
        b=AZCPqV89v+hOzNtfW2saXZP0Q0an/t7IFjgge833KWWdrveSw7azdc6LDMxtiZJlJl
         e8z5D6BlfIf8VfNzB2FQSUlkfkMVb6p3A2wpczyjxmVzvbV84dk2tbFhyF/lLh+K21yA
         Uz0UcBE3wLwBuTZqVZiA41SK93XAiADvPM6X0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c05eGhfP62oyJ4uJzi+JFgkkWqqqI9hWVBoKeCjxm4w=;
        b=pBwuIkdPvKq2ulvpnNeWl4B8U6mJdi+GHOB1el3XLXJ9UY+cCkccVZHyOfROsaj4Dh
         umlnuF/TblE/ChXEWn7N3QnfWuIg5sMgg+sLQL4whmX9UM2DzasIFvL3y6AQeTJV15IM
         shawNMgPv9Hu/mZCnOMq85soy4Yc7wWrDtOWb07XCX9fQYBNqt1Xkbv52nLC8ArNw7tp
         tznbfN4XxenTyFuBfli7uRo23IM7ioLUtCeLkRpuOPfT8RPXhMjfuIftWdJ3UtBaAViQ
         sR7IZjx0JeUAseFhaxBBPZYSKYaovzAwU7VcemeV1Ar15bfrdkqJI9GzYERMfkoiBPLY
         7fBg==
X-Gm-Message-State: APjAAAWOCPydqzfUdwIq/+CIZ3suAJ0HylcSSAneTRsICLPkq4S40+ku
        7WDAWMmWpe3D7AMDCO+gtVJNAxnAmeI=
X-Google-Smtp-Source: APXvYqyakXP82rkUbmYBTl/D1JySDbCe/6lARep6iTQLpr4jV/1H2XZ3VmLVCnuKAtPIP9klkxzuxw==
X-Received: by 2002:ab0:6902:: with SMTP id b2mr18280508uas.32.1580843648632;
        Tue, 04 Feb 2020 11:14:08 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id h139sm7565291vke.34.2020.02.04.11.14.07
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 11:14:07 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id t12so12107548vso.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 11:14:07 -0800 (PST)
X-Received: by 2002:ab0:30c2:: with SMTP id c2mr18396778uam.8.1580843646821;
 Tue, 04 Feb 2020 11:14:06 -0800 (PST)
MIME-Version: 1.0
References: <1580825707-27115-1-git-send-email-harigovi@codeaurora.org>
In-Reply-To: <1580825707-27115-1-git-send-email-harigovi@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 4 Feb 2020 11:13:54 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U5DPxR54YM38w4_QVp24VorQ2eYDGq2GXScAs9APTygA@mail.gmail.com>
Message-ID: <CAD=FV=U5DPxR54YM38w4_QVp24VorQ2eYDGq2GXScAs9APTygA@mail.gmail.com>
Subject: Re: [v5] arm64: dts: sc7180: add display dt nodes
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>, nganji@codeaurora.org,
        Taniya Das <tdas@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Feb 4, 2020 at 6:15 AM Harigovindan P <harigovi@codeaurora.org> wrote:
>
> Add display, DSI hardware DT nodes for sc7180.
>
> Co-developed-by: Kalyan Thota <kalyan_t@codeaurora.org>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
>
> Changes in v1:
>         - Added display DT nodes for sc7180
> Changes in v2:
>         - Renamed node names
>         - Corrected code alignments
>         - Removed extra new line
>         - Added DISP AHB clock for register access
>           under display_subsystem node for global settings
> Changes in v3:
>         - Modified node names
>         - Modified hard coded values
>         - Removed mdss reg entry
> Changes in v4:
>         - Reverting mdp node name
>         - Setting status to disabled in main SOC dtsi file
>         - Replacing _ to - for node names
>         - Adding clock dependency patch link
>         - Splitting idp dt file to a separate patch
> Changes in v5:
>         - Renaming "gcc_bus" to "bus" as per bindings (Doug Anderson)
>         - Making status as disabled for mdss and mdss_mdp by default (Doug Anderson)
>         - Removing "disp_cc" register space (Doug Anderson)
>         - Renaming "dsi_controller" to "dsi" as per bindings (Doug Anderson)
>         - Providing "ref" clk for dsi_phy (Doug Anderson)
>         - Sorting mdss node before dispcc (Doug Anderson)
>
> This patch has dependency on the below series
> https://lkml.org/lkml/2019/12/27/73

You should have probably pointed to [1] which is a much newer version.


>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 136 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 134 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index bd2584d..3ac1b87 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1173,13 +1173,145 @@
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
> +                       clock-names = "iface", "bus", "ahb", "core";
> +
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
> +
> +                       status = "disabled";
> +
> +                       mdp: mdp@ae01000 {
> +                               compatible = "qcom,sc7180-dpu";
> +                               reg = <0 0x0ae01000 0 0x8f000>,
> +                                     <0 0x0aeb0000 0 0x2008>;
> +                               reg-names = "mdp", "vbif";
> +
> +                               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_ROT_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                               clock-names = "iface", "rot", "lut", "core",
> +                                             "vsync";
> +                               assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                                                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                               assigned-clock-rates = <300000000>,
> +                                                      <19200000>;
> +
> +                               interrupt-parent = <&mdss>;
> +                               interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               status = "disabled";
> +
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
> +                       dsi0: dsi@ae94000 {
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
> +                               clock-names = "byte",
> +                                             "byte_intf",
> +                                             "pixel",
> +                                             "core",
> +                                             "iface",
> +                                             "bus";
> +
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
> +                               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                        <&rpmhcc RPMH_CXO_CLK>;
> +                               clock-names = "iface", "ref";
> +
> +                               status = "disabled";
> +                       };
> +               };
> +
>                 dispcc: clock-controller@af00000 {
>                         compatible = "qcom,sc7180-dispcc";
>                         reg = <0 0x0af00000 0 0x200000>;
>                         clocks = <&rpmhcc RPMH_CXO_CLK>,
>                                  <&gcc GCC_DISP_GPLL0_CLK_SRC>,
> -                                <0>,
> -                                <1>,
> +                                <&dsi_phy 0>,
> +                                <&dsi_phy 1>,
>                                  <0>,
>                                  <0>;
>                         clock-names = "xo", "gpll0",

Thanks for adding this bit in v5.  What you end up with is good, but
I'm slightly confused by your baseline and that makes it hard for git
to automatically apply your patch.  Specifically:

* I don't think I ever sent out a patch where "<1>" was a
bogus/placeholder phandle.  Where did you get that from?
* On the newest version of my patch [1] the clock names were
"bi_tcxo", "gcc_disp_gpll0_clk_src", etc.  Not "xo", "gpll0", ....
Presumably you're applying atop an older version?

NOTE: it's not actually that hard to resolve this manually, so unless
Bjorn / Andy requests it you probably don't need a v6.  How I applied
it if it's helpful [2].


I see that you're working to fix the bindings [3].  Seems like that
still needs to be spun a bit more, but I think in general I'm
convinced that what you're got in the dts is OK for sc7180 while that
spins.  It's not like the bindings were in amazing shape to start
with.  Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>

[1] https://lore.kernel.org/r/20200203103049.v4.15.I1a4b93fb005791e29a9dcf288fc8bd459a555a59@changeid
[2] https://crrev.com/c/2020394/4
[3] https://lore.kernel.org/r/1580825737-27189-1-git-send-email-harigovi@codeaurora.org



-Doug
