Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E3DE388C40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 13:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241079AbhESLB4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 07:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbhESLBz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 07:01:55 -0400
Received: from the.earth.li (the.earth.li [IPv6:2a00:1098:86:4d:c0ff:ee:15:900d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70603C06175F;
        Wed, 19 May 2021 04:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
         s=the; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject
        :Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=cEL+S5BBsjl3bRxdIpO4xrtFYv5ZClHANR3l6kfeTgg=; b=iEkidWTvaJCpDJldks0VJKqeOD
        KHAC5YqNa4sb7PoHDpA4Kn6k3hHyYihvnjiUbwOCjd1F6+EZCOwSnQrvx3ZEh+90d7XfSn0WJxt+d
        TrpMjmcwezfw4BPP4J/mrlCVKAX/WgcfYxHVpt7xkkyF/z4FZBkrplZPpAU93izFqYjLjXTMerxUO
        Sy9b5XP+gf6z+EXbnqOqVk0v95uPoR6+1s8ep/tq5s3x2/EOm+3v2A5C2t0Uc0MTkNhqTky8NC4N2
        dxtXS4dYvySmZEJxTRPQ6pYNXs0s4LZLWLVATi4guypstVG1JflKSVNp4MezVB6+iREvvvU6Yze39
        x0BMTP/w==;
Received: from noodles by the.earth.li with local (Exim 4.92)
        (envelope-from <noodles@earth.li>)
        id 1ljJwG-0002Co-FG; Wed, 19 May 2021 12:00:32 +0100
Date:   Wed, 19 May 2021 12:00:32 +0100
From:   Jonathan McDowell <noodles@earth.li>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] ARM: dts: qcom: Add tsens details to ipq806x
Message-ID: <20210519110032.GQ11733@earth.li>
References: <cover.1621097174.git.noodles@earth.li>
 <cbcac8439d3fcaaf17df041cab12d904c8058189.1621097174.git.noodles@earth.li>
 <YKI6amMC8Rg6Kb1I@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKI6amMC8Rg6Kb1I@vkoul-mobl.Dlink>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 17, 2021 at 03:12:02PM +0530, Vinod Koul wrote:
> On 15-05-21, 17:52, Jonathan McDowell wrote:
> 
> >  		gcc: clock-controller@900000 {
> > -			compatible = "qcom,gcc-ipq8064";
> > +			compatible = "qcom,gcc-ipq8064", "syscon";
> 
> Does this belong here

No, not sure how that slipped in, will remove for v2.

> >  			reg = <0x00900000 0x4000>;
> >  			#clock-cells = <1>;
> >  			#reset-cells = <1>;
> > +			#power-domain-cells = <1>;
> > +
> > +			tsens: thermal-sensor@900000 {
> > +				compatible = "qcom,ipq8064-tsens";
> > +
> > +				nvmem-cells = <&tsens_calib>, <&tsens_calib_backup>;
> > +				nvmem-cell-names = "calib", "calib_backup";
> > +				interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
> > +				interrupt-names = "uplow";
> > +
> > +				#qcom,sensors = <11>;
> > +				#thermal-sensor-cells = <1>;
> > +			};
> 
> We have sensor under gcc node..?

Weirdly, yes, that seems to be where it lives for the 8064.

J.

-- 
I'm dangerous when I know what I'm doing.
