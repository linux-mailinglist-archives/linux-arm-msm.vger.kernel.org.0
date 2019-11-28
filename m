Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7BA10CFB2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2019 23:11:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbfK1WL3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Nov 2019 17:11:29 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:42904 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726569AbfK1WL3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Nov 2019 17:11:29 -0500
Received: by mail-pl1-f195.google.com with SMTP id j12so12062312plt.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2019 14:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=F3WzSYZCBNAQFMfIpxWit/sBfadcU2TF991j5V0uaMY=;
        b=nItiA9dRdSrhU4TLi5SiflxS30nTBx3tdVqwK6eOPCMGU1IgMlwfRTMDuhcpJ7a78/
         I7laejhdh4EJM4NgHe6stsW+nqMykAaZ2J414fetIQOyiD/uqCQa88LVQSgaR8jNenXh
         obObZSLXWmFor/Mc9GXwo8GI3NC/oUB/5pk26s3lHpwSvjAgaP+JJ/eK+aqOwatIkqvl
         /drBO6I6927SI1/nsbFrkqBZ09LO1/AZKISNBFsa4stwkhxcoM3cljvGUuB/aacRjiEu
         hxzQ5G7x44OKqR4ay+FYLGNsrDUdNdA/xDSy5LSq/GHrClGgE1fjNpsRF35HvbXkTK+0
         g6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=F3WzSYZCBNAQFMfIpxWit/sBfadcU2TF991j5V0uaMY=;
        b=lB6qX+AW3XLUfcZilUKvbjU+98M12+mgb3SvV/nURhvH6V/Jtyn6lOgmNZLQagZQdm
         dx6L9WgPrZ4HIBMsV1k6xB+GPSMe8HCzzDMzrdpPGLUtpTvnnPmSgxXd1SIwwz2f6Mlh
         IK7BInHJLXno9SEKUODzD8rc12lReZPzLyMCtcAA7ndAPXgN2laZncZndKf0ANQAu0H6
         idgqpQrNWrLpfVp5Q8xw/4hM52OU4txWj4tCxvfF4hbJJ52VFvLngCt8ifCbnPy/uUYG
         u6fPL5GOcpShJlBbuIhz/p7oIpOnfflNV8w0jRk+72rpZB9E4QO7jW5G5Eh/b49hi01Y
         2qlw==
X-Gm-Message-State: APjAAAW/m2s6u7wO4i2Unr93MrXHsRBxnV8ICrLWpf1NW5WD5ZaPB1SU
        Sktg4ko7x7jhj8LpqbvD94lVNQ==
X-Google-Smtp-Source: APXvYqzYIIkSZ8Dv3KYh63pRf7BIWCuo2+7nUUHj+s7Q/KYBwVMm2qSbAGosbfKiJuCnT/K58DMmbA==
X-Received: by 2002:a17:902:6904:: with SMTP id j4mr11241058plk.49.1574979088106;
        Thu, 28 Nov 2019 14:11:28 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s18sm22092805pfm.27.2019.11.28.14.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 14:11:27 -0800 (PST)
Date:   Thu, 28 Nov 2019 14:11:24 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v3 1/1] arm64: dts: qcom: sc7180: Add USB related nodes
Message-ID: <20191128221124.GM82109@yoga>
References: <1573795421-13989-1-git-send-email-sanm@codeaurora.org>
 <1573795421-13989-2-git-send-email-sanm@codeaurora.org>
 <20191122005117.GM27773@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191122005117.GM27773@google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 21 Nov 16:51 PST 2019, Matthias Kaehlcke wrote:

> Hi Sandeep,
> 
> On Fri, Nov 15, 2019 at 10:53:41AM +0530, Sandeep Maheswaram wrote:
> > Add nodes for DWC3 USB controller, QMP and QUSB PHYs.
> > 
> > Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sc7180-idp.dts |  25 ++++++++
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi    | 105 ++++++++++++++++++++++++++++++++
> >  2 files changed, 130 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > index 666e9b9..2c7dbdc 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> >
> > ...
> >
> > +		usb_1: usb@a6f8800 {
> > +			compatible = "qcom,sc7180-dwc3", "qcom,dwc3";
> > +			reg = <0 0x0a6f8800 0 0x400>;
> > +			status = "disabled";
> > +			#address-cells = <2>;
> > +			#size-cells = <2>;
> > +			ranges;
> > +			dma-ranges;
> > +
> > +			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
> > +				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> > +				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
> > +				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> > +				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>;
> > +			clock-names = "cfg_noc", "core", "iface", "mock_utmi",
> > +				      "sleep";
> > +
> > +			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> > +					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
> > +			assigned-clock-rates = <19200000>, <150000000>;
> > +
> > +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "hs_phy_irq", "ss_phy_irq",
> > +					  "dm_hs_phy_irq", "dp_hs_phy_irq";
> > +
> > +			power-domains = <&gcc USB30_PRIM_GDSC>;
> > +
> > +			resets = <&gcc GCC_USB30_PRIM_BCR>;
> > +
> > +			usb_1_dwc3: dwc3@a600000 {
> > +				compatible = "snps,dwc3";
> > +				reg = <0 0x0a600000 0 0xe000>;
> > +				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> > +				iommus = <&apps_smmu 0x540 0>;
> > +				snps,dis_u2_susphy_quirk;
> > +				snps,dis_enblslpm_quirk;
> > +				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
> > +				phy-names = "usb2-phy", "usb3-phy";
> > +			};
> 
> I see the following message at boot:
> 
> [    4.248436] dwc3 a600000.dwc3: Failed to get clk 'ref': -2
> 

dwc3-qcom picks up the clocks per the names of the binding, but then
dwc3 tries to pick up the same clocks based on the generic names.

At some point it would be nice to figure out how to have these two play
nice with each other, but for now it's a "harmless" error print - which
has consumed many hours of unnecessary debugging by various people...

Regards,
Bjorn
