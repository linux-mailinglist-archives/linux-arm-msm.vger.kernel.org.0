Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1550FD8AC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2019 10:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727618AbfJPIYh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Oct 2019 04:24:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:57242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726583AbfJPIYh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Oct 2019 04:24:37 -0400
Received: from localhost (unknown [171.76.123.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 687CC2168B;
        Wed, 16 Oct 2019 08:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571214276;
        bh=IxPyrpg38PJziATCOYL6nZm4RoXdvyA8pevxa0Wx8F8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OFRbWt0u3Pf9P5XshzO6/imdTXolcSXfSP5i1Fv4t23h7/LAFwzvXo9l+VWuaoDJp
         X78eE1gHcoUzTRRYilhLuPD8GwnHZhGPaCsps83Uw1UyPSScV5mr01yYP2ZXS6HUp9
         9Kb5bYn9XiWJz9EU26BZWLs5yEvZhiZKpP59BwMg=
Date:   Wed, 16 Oct 2019 13:54:32 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: sc7180: Add minimal dts/dtsi files for
 SC7180 soc
Message-ID: <20191016082432.GL2654@vkoul-mobl>
References: <20191015103358.17550-1-rnayak@codeaurora.org>
 <20191015103358.17550-2-rnayak@codeaurora.org>
 <20191016052535.GC2654@vkoul-mobl>
 <89225569-1cd3-ae0e-94ed-bbb2b3dd8e9c@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89225569-1cd3-ae0e-94ed-bbb2b3dd8e9c@codeaurora.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16-10-19, 13:22, Taniya Das wrote:
> Hi Vinod,
> 
> On 10/16/2019 10:55 AM, Vinod Koul wrote:
> > On 15-10-19, 16:03, Rajendra Nayak wrote:
> > 
> > > +	timer {
> > > +		compatible = "arm,armv8-timer";
> > > +		interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
> > > +			     <GIC_PPI 2 IRQ_TYPE_LEVEL_LOW>,
> > > +			     <GIC_PPI 3 IRQ_TYPE_LEVEL_LOW>,
> > > +			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
> > > +	};
> > > +
> > > +	clocks {
> > 
> > Can we have these sorted alphabetically please
> > 
> > > +		xo_board: xo-board {
> > > +			compatible = "fixed-clock";
> > > +			clock-frequency = <38400000>;
> > > +			clock-output-names = "xo_board";
> > > +			#clock-cells = <0>;
> > > +		};
> > > +
> > > +		sleep_clk: sleep-clk {
> > > +			compatible = "fixed-clock";
> > > +			clock-frequency = <32764>;
> > > +			clock-output-names = "sleep_clk";
> > > +			#clock-cells = <0>;
> > > +		};
> > > +
> > > +		bi_tcxo: bi_tcxo {
> > 
> > why is this a clock defined here? Isnt this gcc clock?
> 
> This is a RPMH-controlled clock and not from GCC. It is the parent clock for
> GCC RCGs/PLLs.

Yes right!

> Once the RPMH clock support is added these would be removed.

Wont it make sense to keep this bit not upstream and then remove that
part when you have rpmh support available. Reduces the churn upstream!

The parent can be xo_board till then!

-- 
~Vinod
