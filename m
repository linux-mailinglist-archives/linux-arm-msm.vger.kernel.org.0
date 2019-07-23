Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93F7A7110A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2019 07:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbfGWFPk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jul 2019 01:15:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:34504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725907AbfGWFPk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jul 2019 01:15:40 -0400
Received: from localhost (unknown [106.201.111.135])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6D3E22238E;
        Tue, 23 Jul 2019 05:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563858939;
        bh=usJZ1bRJrEJDFlg8XL703kkMQCrG8lPR8EcTOdlRAIM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Mxe/o6G+L3VwPTin+6ZGAroz2lw7CeeSiYm5KzQ8mw/V1kBQsxuvJQoH1LSw1a1Zu
         HgX6Q8zYq+IPEvxexjh7PX0mbvCa9RiomNS9lBcqtKakEEg0VU2Dwl1aJYdAmOS1zD
         /QDPOJGEjsXbMJgz5MzIYCnt9vQfr1OiyZElQSaY=
Date:   Tue, 23 Jul 2019 10:44:26 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Amit Kucheria <amit.kucheria@verdurent.com>
Cc:     Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sdm845-cheza: remove macro from
 unit name
Message-ID: <20190723051426.GZ12733@vkoul-mobl.Dlink>
References: <20190722123422.4571-1-vkoul@kernel.org>
 <20190722123422.4571-6-vkoul@kernel.org>
 <CAHLCerPC0thO9gsaDAxc+XaexinrzG6JGJ8BhB4bFFuQ-P9Jxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHLCerPC0thO9gsaDAxc+XaexinrzG6JGJ8BhB4bFFuQ-P9Jxg@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23-07-19, 10:38, Amit Kucheria wrote:
> On Mon, Jul 22, 2019 at 6:06 PM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > Unit name is supposed to be a number, using a macro with hex value is
> 
> /s/name/address?

Right, will fix.

> > not recommended, so add the value in unit name.
> >
> > arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:966.16-969.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x4d: unit name should not have leading "0x"
> > arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:971.16-974.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x4e: unit name should not have leading "0x"
> > arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:976.16-979.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x4f: unit name should not have leading "0x"
> > arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:981.16-984.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x50: unit name should not have leading "0x"
> > arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:986.16-989.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x51: unit name should not have leading "0x"
> >
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> > index 1ebbd568dfd7..9b27b8346ba1 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> > @@ -963,27 +963,27 @@ ap_ts_i2c: &i2c14 {
> >  };
> >
> >  &pm8998_adc {
> > -       adc-chan@ADC5_AMUX_THM1_100K_PU {
> > +       adc-chan@4d {
> >                 reg = <ADC5_AMUX_THM1_100K_PU>;
> 
> I'm a little conflicted about this change. If we're replacing the
> address with actual values, perhaps we should do that same for the reg
> property to keep them in sync? Admittedly though, it is a bit easier
> to read the macro name and figure out its meaning.

Well this was how Bjorn suggested, am okay if we do in any
other way. This fixes warning but keeps it bit readable too

Other way would be to make defines decimal values instead of hex

Any better suggestions :)

-- 
~Vinod
