Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B04294BF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2019 19:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727653AbfHSRow (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Aug 2019 13:44:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:37930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726959AbfHSRow (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Aug 2019 13:44:52 -0400
Received: from localhost (unknown [122.182.221.154])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8C7A222CE9;
        Mon, 19 Aug 2019 17:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566236691;
        bh=rPPSTeREMOhM63OX8aLIOnM2/PMOvXNBAI0oNNX3lOw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WdDYjY24LNIR7Pu5+mFd2nykuuMNPakuP2uc743zn72ovmdu4/5T87rsuGW9Faa/g
         u48DyNjZ6BHeVxMuEPwpkDiiRu4gws8CrSj0N9dCNZIDt1dPCQF3w3BaAy7w+XRjH0
         kObAyXSKUDaRHoWFmj4y8fvDr7kEkvuFN+MwChGE=
Date:   Mon, 19 Aug 2019 23:13:31 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        sibis@codeaurora.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/22] arm64: dts: qcom: pm8150b: Add pon and adc nodes
Message-ID: <20190819174331.GN12733@vkoul-mobl.Dlink>
References: <20190814125012.8700-1-vkoul@kernel.org>
 <20190814125012.8700-11-vkoul@kernel.org>
 <20190814170803.DEFCC214DA@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190814170803.DEFCC214DA@mail.kernel.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14-08-19, 10:08, Stephen Boyd wrote:
> Quoting Vinod Koul (2019-08-14 05:50:00)
> > Add the pon and adc nodes found in pm8150b PMIC.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  arch/arm64/boot/dts/qcom/pm8150b.dtsi | 54 +++++++++++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> 
> Squash?

Ok

> 
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> > index c0a678b0f159..846197bd65cd 100644
> > --- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> > @@ -2,6 +2,7 @@
> >  // Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
> >  // Copyright (c) 2019, Linaro Limited
> >  
> > +#include <dt-bindings/iio/qcom,spmi-vadc.h>
> >  #include <dt-bindings/interrupt-controller/irq.h>
> >  #include <dt-bindings/spmi/spmi.h>
> >  
> > @@ -11,6 +12,59 @@
> >                 reg = <0x2 SPMI_USID>;
> >                 #address-cells = <1>;
> >                 #size-cells = <0>;
> > +
> > +               pon@800 {
> 
> Maybe pon node name should be 'key' or 'power-on'?

pon stands for power on device. See Documentation/devicetree/bindings/power/reset/qcom,pon.txt

> 
> > +                       compatible = "qcom,pm8916-pon";
> > +                       reg = <0x0800>;
> > +               };
> > +
> > +               adc@3100 {
> > +                       compatible = "qcom,spmi-adc5";
> > +                       reg = <0x3100>;
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +                       #io-channel-cells = <1>;
> > +                       interrupts = <0x2 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
> > +
> > +                       ref-gnd@0 {
> > +                               reg = <ADC5_REF_GND>;
> > +                               qcom,pre-scaling = <1 1>;
> > +                               label = "ref_gnd";
> > +                       };
> > +
> > +                       vref-1p25@1 {
> > +                               reg = <ADC5_1P25VREF>;
> > +                               qcom,pre-scaling = <1 1>;
> > +                               label = "vref_1p25";
> > +                       };
> > +
> > +                       die-temp@6 {
> > +                               reg = <ADC5_DIE_TEMP>;
> > +                               qcom,pre-scaling = <1 1>;
> > +                               label = "die_temp";
> > +                       };
> > +
> > +                       chg-temp@9 {
> > +                               reg = <ADC5_CHG_TEMP>;
> > +                               qcom,pre-scaling = <1 1>;
> > +                               label = "chg_temp";
> > +                       };
> > +
> > +                       smb1390-therm@14 {
> > +                               reg = <ADC5_AMUX_THM2>;
> > +                               qcom,hw-settle-time = <200>;
> > +                               qcom,pre-scaling = <1 1>;
> > +                               label = "smb1390_therm";
> > +                       };
> > +
> > +                       smb1355-therm@78 {
> > +                               reg = <ADC5_AMUX_THM2_100K_PU>;
> > +                               qcom,ratiometric;
> > +                               qcom,hw-settle-time = <200>;
> > +                               qcom,pre-scaling = <1 1>;
> > +                               label = "smb1355_therm";
> > +                       };
> 
> Again, are these board level details? Maybe should be provided here with
> status = "disabled" and then added by the boards that use these ADCs.

Sure I will update these

-- 
~Vinod
