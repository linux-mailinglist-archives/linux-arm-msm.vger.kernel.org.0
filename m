Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4965F388BAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 12:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347976AbhESKar (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 06:30:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232734AbhESKar (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 06:30:47 -0400
Received: from the.earth.li (the.earth.li [IPv6:2a00:1098:86:4d:c0ff:ee:15:900d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81046C06175F;
        Wed, 19 May 2021 03:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
         s=the; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject
        :Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=P0f/xHsdJvpYvUTSUpkG4r+MlZ24cqpkzU7nLM36Ol8=; b=DIr/Q7HWJW/sQWVWirz2I7MIZ+
        xJCAjodebXn+fI+JJ9t/nZGlvHR3ZVs4QOTf9l6ykNJksvqG+lMSY1NRuBhUrpmRB27/46Q4TpT38
        7htFPXgQfok1qA7TjimLISZB7uUNeSn0/XVxQi1w/vA5rwqn6DoJNTfgzzAKLIyRNm7o/OIFGIVYG
        zU97wIUvmJ6G8xxDB+VXiqorRbapSX+CIcn1eqnwQ8zeeQASUaVLWf7ud8Zlfr9Uks7gCX52I14UP
        bpk+5qKafRxFe1JVJd0hANOTn/+n0yq5TK4L34pwEFq/jwgWZdrFGuTbDSMq9bD7XxebWqvNszEA1
        ele3X7mA==;
Received: from noodles by the.earth.li with local (Exim 4.92)
        (envelope-from <noodles@earth.li>)
        id 1ljJS5-0000xu-Pg; Wed, 19 May 2021 11:29:21 +0100
Date:   Wed, 19 May 2021 11:29:21 +0100
From:   Jonathan McDowell <noodles@earth.li>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] ARM: dts: qcom: Add ADM DMA + NAND definitions to
 ipq806x
Message-ID: <20210519102921.GP11733@earth.li>
References: <cover.1621097174.git.noodles@earth.li>
 <fb8b3df3a25120cb1ae9adfd25c754334e8eaf4e.1621097174.git.noodles@earth.li>
 <YKI6GxlSSSv2q03g@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKI6GxlSSSv2q03g@vkoul-mobl.Dlink>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 17, 2021 at 03:10:43PM +0530, Vinod Koul wrote:
> On 15-05-21, 17:52, Jonathan McDowell wrote:
> > Now the ADM driver is in mainline add the appropriate definitions for it
> > and the NAND controller to get NAND working on IPQ806x platforms,
> > 
> > Signed-off-by: Jonathan McDowell <noodles@earth.li>
> > ---
> >  arch/arm/boot/dts/qcom-ipq8064.dtsi | 67 +++++++++++++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> > index 98995ead4413..aaab3820ab0b 100644
> > --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> > +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> > @@ -185,6 +185,31 @@
> >  					bias-pull-up;
> >  				};
> >  			};
> > +
> > +			nand_pins: nand_pins {
> > +				mux {
> > +					pins = "gpio34", "gpio35", "gpio36",
> > +					       "gpio37", "gpio38", "gpio39",
> > +					       "gpio40", "gpio41", "gpio42",
> > +					       "gpio43", "gpio44", "gpio45",
> > +					       "gpio46", "gpio47";
> > +					function = "nand";
> > +					drive-strength = <10>;
> > +					bias-disable;
> > +				};
> > +
> > +				pullups {
> > +					pins = "gpio39";
> > +					bias-pull-up;
> > +				};
> > +
> > +				hold {
> > +					pins = "gpio40", "gpio41", "gpio42",
> > +					       "gpio43", "gpio44", "gpio45",
> > +					       "gpio46", "gpio47";
> > +					bias-bus-hold;
> > +				};
> > +			};
> >  		};
> >  
> >  		intc: interrupt-controller@2000000 {
> > @@ -226,6 +251,26 @@
> >  			reg = <0x02098000 0x1000>, <0x02008000 0x1000>;
> >  		};
> >  
> > +		adm_dma: dma@18300000 {
> 
> dma-controller@...

Thanks, will fix for v2.

J.

-- 
"Remind me never to buy software from you." -- Geraint Jones, marking
an Operating Systems question.
