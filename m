Return-Path: <linux-arm-msm+bounces-4754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6C2812F61
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 12:50:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3108B1F21F93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 11:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DFAA405D5;
	Thu, 14 Dec 2023 11:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uVct52cU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0574B3FE25;
	Thu, 14 Dec 2023 11:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18BF7C433C7;
	Thu, 14 Dec 2023 11:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702554615;
	bh=gBxMWK/BJQIfktDOXVActk5N+GeQbJZMHW0htfkV+oc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uVct52cUOIceKATlABivrxGspm4zxEeI7nJUoPLdOQZrR2QVcd0QbZRuQbc+4/NoO
	 mmlP9blb5sOixsg+eUYJQjaTb9kGqxE5/2q6nw4QaEyTcJvbXPsr1QdJNkMQXFldoW
	 o1hc+4HwmRMMMLCbE8vxfX3Mv2fD6FvdaP6nWmMp6p+n7I4UMcbv/TYOtW4xBrLS7N
	 B/7MCCGYwOQ6coCLo7L5ub/dgdSQIkSGBpuyPTpRnVBaTmrnFxXyo4G53qzLlpGr9i
	 YsQs90tkpRJbXQ3+15OR/d6CdZoeBmpKwrXxNd4f6p5qHTgz/UR9zsbF2Go9UHIIMc
	 PJ1YM/zUZBkDg==
Date: Thu, 14 Dec 2023 17:19:59 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
	sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Shazad Hussain <quic_shazhuss@quicinc.com>, quic_cang@quicinc.com
Subject: Re: [PATCH 00/16] Fix Qcom UFS PHY clocks
Message-ID: <20231214114959.GC48078@thinkpad>
References: <20231214091101.45713-1-manivannan.sadhasivam@linaro.org>
 <ZXrVxmxY6wZprbBa@hovoldconsulting.com>
 <20231214103907.GL2938@thinkpad>
 <ZXrgWK5wZz6dAkKP@hovoldconsulting.com>
 <20231214111409.GB48078@thinkpad>
 <ZXrnZeDYOsteY5zT@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZXrnZeDYOsteY5zT@hovoldconsulting.com>

On Thu, Dec 14, 2023 at 12:30:45PM +0100, Johan Hovold wrote:
> On Thu, Dec 14, 2023 at 04:44:09PM +0530, Manivannan Sadhasivam wrote:
> > + Can
> > 
> > On Thu, Dec 14, 2023 at 12:00:40PM +0100, Johan Hovold wrote:
> > > [ +CC: Shazad ]
> > > 
> > > On Thu, Dec 14, 2023 at 04:09:07PM +0530, Manivannan Sadhasivam wrote:
> > > > On Thu, Dec 14, 2023 at 11:15:34AM +0100, Johan Hovold wrote:
> > > > > On Thu, Dec 14, 2023 at 02:40:45PM +0530, Manivannan Sadhasivam wrote:
> 
> > > Unless the PHY consumes CXO directly, it should not be included in the
> > > binding as you are suggesting here.
> > 
> > PHY is indeed directly consuming CXO. That's why I included it in the binding.
> 
> Ok, good. It's a bit frustrating that people can even seem to agree on
> answers to direct questions about that.
>  

I can understand that.

> > > We discussed this at some length at the time with Bjorn and Shazad who
> > > had access to the documentation and the conclusion was that, at least on
> > > sc8280xp, the PHY does not use CXO directly and instead it should be
> > > described as a parent to the UFS refclocks in the clock driver:
> > > 
> > > 	https://lore.kernel.org/lkml/Y2OEjNAPXg5BfOxH@hovoldconsulting.com/
> > > 
> > > The downstream devicetrees have a bad habit of including parent clocks
> > > directly in the consumer node instead of modelling this in clock driver
> > > also for other peripherals.
> > >  
> > 
> > No, I can assure that you got the wrong info. UFS PHY consumes the clock
> > directly from RPMh. It took me several days to dig through the UFS and PHY docs
> > and special thanks to Can Guo from UFS team, who provided much valuable
> > information about these clocks.
> 
> Sounds like you've done your research.
> 
> > > What exactly is wrong with those commits? We know that the controller
> > > does not consume GCC_UFS_REF_CLKREF_CLK directly, but describing that as
> > > such for now was a deliberate choice:
> > > 
> > > 	GCC_UFS_REF_CLKREF_CLK is the clock to the devices, but as we
> > > 	don't represent the memory device explicitly it seems suitable
> > > 	to use as "ref_clk" in the ufshc nodes - which would then match
> > > 	the special handling of the "link clock" in the UFS driver.
> > >  
> > 
> > No, GCC_UFS_REF_CLKREF_CLK is _not_ the clock to UFS devices. I haven't found
> > information about this specific register in GCC. Initially I thought this is for
> > enabling QREF clocks for the UFS MEM phy, but I haven't found the answer yet.
> 
> Just quoting Bjorn.
> 
> > But as I said earlier, reference clock to UFS devices comes directly from the
> > controller and there is a specfic register for controlling that. Starting from
> > SM8550, reference clock comes from RPMh.
> 
> Sure, but that was only part of what those commits did or claimed. Bjorn
> also explicitly stated that those refclocks were sourced from CXO, even
> though I now see a claim from Shazad in that thread claiming the
> opposite:
> 
> 	https://lore.kernel.org/all/Y2Imnf1+v5j5CH9r@hovoldconsulting.com/

To clarify further, what Shazad said about GCC_UFS_REF_CLKREF_CLK is correct.
This clock is not directly sourced by CXO, so it should be voted by the
_PHY_ driver separately along with CXO (which still feeds PHY). That's what I
represented in the binding.

> 
> Without access to docs I can only ask questions and try to do tedious
> inferences from incomplete open sources (e.g. downstream devicetrees).
> 

That's the life for most of us :) Even with access to internal docs, it is
difficult to find the information we are looking for. Because, a very few people
know where the information is buried.

- Mani

> Johan

-- 
மணிவண்ணன் சதாசிவம்

