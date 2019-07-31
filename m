Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBF877BB5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2019 10:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726862AbfGaIQd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Jul 2019 04:16:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:37474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726185AbfGaIQc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Jul 2019 04:16:32 -0400
Received: from localhost (unknown [171.76.116.36])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9913620657;
        Wed, 31 Jul 2019 08:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564560992;
        bh=Tu581Sxi2KfCSLBCf35p6bgm0YTSGY4pQYhZtN6cy4o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=taMMxMjqq8Db2B5xb5nNPzq9GGlIHzzbUpoNlC5yvqn/nuxdVHoDEnmchzdz9EcfE
         3pb7VBBjD5e5PozbSOzeuREsRGUAGN8bROKTURhprYvUgoR/OQnlcMfn0nhfnpA+u6
         rCIUXHAephkahOrlBHdiDFi86se0flcnNUCAhOgc=
Date:   Wed, 31 Jul 2019 13:45:18 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Amit Kucheria <amit.kucheria@verdurent.com>
Cc:     Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: pms405: add unit name adc nodes
Message-ID: <20190731081518.GS12733@vkoul-mobl.Dlink>
References: <20190725135150.9972-1-vkoul@kernel.org>
 <20190725135150.9972-2-vkoul@kernel.org>
 <CAHLCerNsAX4raauTjogOpwqAjEWfd+jpaZYsFnC10tcmvnD5cg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHLCerNsAX4raauTjogOpwqAjEWfd+jpaZYsFnC10tcmvnD5cg@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Thanks for the review Amit!

On 30-07-19, 22:05, Amit Kucheria wrote:
> On Thu, Jul 25, 2019 at 7:23 PM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > The adc nodes have reg property but were missing the unit name, so add
> > that to fix these warnings:
> >
> > arch/arm64/boot/dts/qcom/pms405.dtsi:91.12-94.6: Warning (unit_address_vs_reg): /soc@0/spmi@200f000/pms405@0/adc@3100/ref_gnd: node has a reg or ranges property, but no unit name
> > arch/arm64/boot/dts/qcom/pms405.dtsi:96.14-99.6: Warning (unit_address_vs_reg): /soc@0/spmi@200f000/pms405@0/adc@3100/vref_1p25: node has a reg or ranges property, but no unit name
> > arch/arm64/boot/dts/qcom/pms405.dtsi:101.19-104.6: Warning (unit_address_vs_reg): /soc@0/spmi@200f000/pms405@0/adc@3100/vph_pwr: node has a reg or ranges property, but no unit name
> > arch/arm64/boot/dts/qcom/pms405.dtsi:106.13-109.6: Warning (unit_address_vs_reg): /soc@0/spmi@200f000/pms405@0/adc@3100/die_temp: node has a reg or ranges property, but no unit name
> > arch/arm64/boot/dts/qcom/pms405.dtsi:111.27-116.6: Warning (unit_address_vs_reg): /soc@0/spmi@200f000/pms405@0/adc@3100/thermistor1: node has a reg or ranges property, but no unit name
> > arch/arm64/boot/dts/qcom/pms405.dtsi:118.27-123.6: Warning (unit_address_vs_reg): /soc@0/spmi@200f000/pms405@0/adc@3100/thermistor3: node has a reg or ranges property, but no unit name
> > arch/arm64/boot/dts/qcom/pms405.dtsi:125.22-130.6: Warning (unit_address_vs_reg): /soc@0/spmi@200f000/pms405@0/adc@3100/xo_temp: node has a reg or ranges property, but no unit name
> >
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  arch/arm64/boot/dts/qcom/pms405.dtsi | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/pms405.dtsi b/arch/arm64/boot/dts/qcom/pms405.dtsi
> > index 14240fedd916..3c10cf04d26e 100644
> > --- a/arch/arm64/boot/dts/qcom/pms405.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/pms405.dtsi
> > @@ -88,41 +88,41 @@
> >                         #size-cells = <0>;
> >                         #io-channel-cells = <1>;
> >
> > -                       ref_gnd {
> > +                       ref_gnd@0 {
> >                                 reg = <ADC5_REF_GND>;
> >                                 qcom,pre-scaling = <1 1>;
> >                         };
> >
> > -                       vref_1p25 {
> > +                       vref_1p25@1 {
> >                                 reg = <ADC5_1P25VREF>;
> >                                 qcom,pre-scaling = <1 1>;
> >                         };
> >
> > -                       pon_1: vph_pwr {
> > +                       pon_1: vph_pwr@131 {
> >                                 reg = <ADC5_VPH_PWR>;
> >                                 qcom,pre-scaling = <1 3>;
> >                         };
> >
> > -                       die_temp {
> > +                       die_temp@6 {
> >                                 reg = <ADC5_DIE_TEMP>;
> >                                 qcom,pre-scaling = <1 1>;
> >                         };
> >
> > -                       pa_therm1: thermistor1 {
> > +                       pa_therm1: thermistor1@115 {
> 
> s/115/77 ?
> 
> >                                 reg = <ADC5_AMUX_THM1_100K_PU>;
> >                                 qcom,ratiometric;
> >                                 qcom,hw-settle-time = <200>;
> >                                 qcom,pre-scaling = <1 1>;
> >                         };
> >
> > -                       pa_therm3: thermistor3 {
> > +                       pa_therm3: thermistor3@117 {
> 
> s/117/79 ?
> 
> >                                 reg = <ADC5_AMUX_THM3_100K_PU>;
> >                                 qcom,ratiometric;
> >                                 qcom,hw-settle-time = <200>;
> >                                 qcom,pre-scaling = <1 1>;
> >                         };
> >
> > -                       xo_therm: xo_temp {
> > +                       xo_therm: xo_temp@114 {
> 
> s/114/76 ?

Thanks, will fix these and recheck others.

-- 
~Vinod
