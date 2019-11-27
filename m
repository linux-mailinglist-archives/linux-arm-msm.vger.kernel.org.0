Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E14C610B3D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2019 17:50:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727138AbfK0QuA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Nov 2019 11:50:00 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:40898 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727111AbfK0Qt7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Nov 2019 11:49:59 -0500
Received: by mail-pj1-f67.google.com with SMTP id ep1so10273635pjb.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2019 08:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XP8xQxHYdgThc9Zld1p2KHyvVQHdtDNpRupwHh4QK1c=;
        b=E9tB3Qhfa0XrmfAUm3gCKwGioDLD3EWQViXM4CPXKKihXTIM5RXvsirNPtUfcAGO2f
         Syy1YIo3f8NqeITx6v6UkzSMoJFXLq9KT7arLZmSs/hYRAqz+ODuBSK/jnptHFTW+Uvw
         f9p3FFG+1KiyyLtqO8tUMsmjJGF8m7haGeg4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XP8xQxHYdgThc9Zld1p2KHyvVQHdtDNpRupwHh4QK1c=;
        b=LsiJwGoZqUNONGzPYS+ex/YjfsWuflNBNxjo17e+q3G/ZFoUcyFMctA6F0HIWAZprE
         pWCD8MdvLIiAPumeKXO0Gww9mHtBzmKDGpU7RqppQqv2RGYM1KGFPG+dwnNgNNq5TU7b
         TZVdwKkdVb9Ku0UPSoCNmSQi2ui4cydstcG0dnBcEYUtCGFwG5uw523zAM7HlxnmAXBj
         5oXKPoNjwA4gBe18B5myOB5/CshADCo8rcHAW5OhArIyTKMzH5B7nLRg15SV8165Wb8T
         1LEsU8syISc0sPlqL+mYVs3BMZTdWfbpbkAY3RrSH7SkLjSVsujzryJ8kJ9ljl1BADTX
         xtOg==
X-Gm-Message-State: APjAAAX92zwROwxCnl+gPOGKFa/x0iJV7Y9wjZ8OIg1LJWWmUu2rmW8R
        iFRSEmoJfwzIBnDUehSSzX9Utw==
X-Google-Smtp-Source: APXvYqxA46ZEzE7Yv0U5LCXa9yNAl9DXPjMZ1oVoUL9L8QN5BgQiB0NTSIzl+FZG32FuOR1hC6qStQ==
X-Received: by 2002:a17:902:bf0c:: with SMTP id bi12mr4773061plb.98.1574873398528;
        Wed, 27 Nov 2019 08:49:58 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id k29sm4509575pfh.104.2019.11.27.08.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2019 08:49:57 -0800 (PST)
Date:   Wed, 27 Nov 2019 08:49:56 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v3 1/1] arm64: dts: qcom: sc7180: Add USB related nodes
Message-ID: <20191127164956.GF228856@google.com>
References: <1573795421-13989-1-git-send-email-sanm@codeaurora.org>
 <1573795421-13989-2-git-send-email-sanm@codeaurora.org>
 <20191122005117.GM27773@google.com>
 <0101016eac17bc4a-9bcb2dd5-bcb0-4532-84ff-c423179bfec4-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0101016eac17bc4a-9bcb2dd5-bcb0-4532-84ff-c423179bfec4-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 27, 2019 at 09:01:07AM +0000, Sandeep Maheswaram (Temp) wrote:
> Hi Matthias,
> 
> Thanks for the review.
> 
> On 11/22/2019 6:21 AM, Matthias Kaehlcke wrote:
> > Hi Sandeep,
> > 
> > On Fri, Nov 15, 2019 at 10:53:41AM +0530, Sandeep Maheswaram wrote:
> > > Add nodes for DWC3 USB controller, QMP and QUSB PHYs.
> > > 
> > > Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > ---
> > >   arch/arm64/boot/dts/qcom/sc7180-idp.dts |  25 ++++++++
> > >   arch/arm64/boot/dts/qcom/sc7180.dtsi    | 105 ++++++++++++++++++++++++++++++++
> > >   2 files changed, 130 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > index 666e9b9..2c7dbdc 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > 
> > > ...
> > > 
> > > +		usb_1: usb@a6f8800 {
> > > +			compatible = "qcom,sc7180-dwc3", "qcom,dwc3";
> > > +			reg = <0 0x0a6f8800 0 0x400>;
> > > +			status = "disabled";
> > > +			#address-cells = <2>;
> > > +			#size-cells = <2>;
> > > +			ranges;
> > > +			dma-ranges;
> > > +
> > > +			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
> > > +				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> > > +				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
> > > +				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> > > +				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>;
> > > +			clock-names = "cfg_noc", "core", "iface", "mock_utmi",
> > > +				      "sleep";
> > > +
> > > +			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> > > +					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
> > > +			assigned-clock-rates = <19200000>, <150000000>;
> > > +
> > > +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>;
> > > +			interrupt-names = "hs_phy_irq", "ss_phy_irq",
> > > +					  "dm_hs_phy_irq", "dp_hs_phy_irq";
> > > +
> > > +			power-domains = <&gcc USB30_PRIM_GDSC>;
> > > +
> > > +			resets = <&gcc GCC_USB30_PRIM_BCR>;
> > > +
> > > +			usb_1_dwc3: dwc3@a600000 {
> > > +				compatible = "snps,dwc3";
> > > +				reg = <0 0x0a600000 0 0xe000>;
> > > +				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> > > +				iommus = <&apps_smmu 0x540 0>;
> > > +				snps,dis_u2_susphy_quirk;
> > > +				snps,dis_enblslpm_quirk;
> > > +				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
> > > +				phy-names = "usb2-phy", "usb3-phy";
> > > +			};
> > I see the following message at boot:
> > 
> > [    4.248436] dwc3 a600000.dwc3: Failed to get clk 'ref': -2
> > 
> > Apparently the driver is operational regardless, however the binding lists
> > the clocks as required:
> > 
> >    Required properties:
> >     ...
> >     - clock-names: should contain "ref", "bus_early", "suspend"
> >     - clocks: list of phandle and clock specifier pairs corresponding to
> >               entries in the clock-names property.
> > 
> >    [Documentation/devicetree/bindings/usb/dwc3.txt]
> > 
> > The driver code also has a comment stating that the clocks should be
> > specified:
> > 
> >    /*
> >     * Clocks are optional, but new DT platforms should support all
> >     * clocks as required by the DT-binding.
> >     */
> > 
> >    [drivers/usb/dwc3/core.txt]
> We are implenting all the required clocks in glue driver
> drivers/usb/dwc3/dwc3-qcom.c.
> 
> Also there is exception for qcom,dwc3 in documentation
> 
> Documentation/devicetree/bindings/usb/dwc3.txt
> 
> 
> Exception for clocks:
> 
> clocks are optional if the parent node (i.e. glue-layer) is compatible to
> one of the following:
> "amlogic,meson-axg-dwc3"
> "amlogic,meson-gxl-dwc3"
> "cavium,octeon-7130-usb-uctl"
> "qcom,dwc3"
> "samsung,exynos5250-dwusb3"
> "samsung,exynos5433-dwusb3"
> "samsung,exynos7-dwusb3"
> "sprd,sc9860-dwc3"
> "st,stih407-dwc3"
> "ti,am437x-dwc3"
> "ti,dwc3"
> "ti,keystone-dwc3"
> "rockchip,rk3399-dwc3"
> "xlnx,zynqmp-dwc3"

ah, I missed this, thanks for the pointer!
