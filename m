Return-Path: <linux-arm-msm+bounces-4740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E42D812E50
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 12:14:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B10451F21A4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 11:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B55C3F8D3;
	Thu, 14 Dec 2023 11:14:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750B23E483;
	Thu, 14 Dec 2023 11:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 508ABC433C7;
	Thu, 14 Dec 2023 11:14:21 +0000 (UTC)
Date: Thu, 14 Dec 2023 16:44:09 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org,
	konrad.dybcio@linaro.org, vkoul@kernel.org, sboyd@kernel.org,
	mturquette@baylibre.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Shazad Hussain <quic_shazhuss@quicinc.com>, quic_cang@quicinc.com
Subject: Re: [PATCH 00/16] Fix Qcom UFS PHY clocks
Message-ID: <20231214111409.GB48078@thinkpad>
References: <20231214091101.45713-1-manivannan.sadhasivam@linaro.org>
 <ZXrVxmxY6wZprbBa@hovoldconsulting.com>
 <20231214103907.GL2938@thinkpad>
 <ZXrgWK5wZz6dAkKP@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZXrgWK5wZz6dAkKP@hovoldconsulting.com>

+ Can

On Thu, Dec 14, 2023 at 12:00:40PM +0100, Johan Hovold wrote:
> [ +CC: Shazad ]
> 
> On Thu, Dec 14, 2023 at 04:09:07PM +0530, Manivannan Sadhasivam wrote:
> > On Thu, Dec 14, 2023 at 11:15:34AM +0100, Johan Hovold wrote:
> > > On Thu, Dec 14, 2023 at 02:40:45PM +0530, Manivannan Sadhasivam wrote:
> > > 
> > > > This series fixes the clocks supplied to QMP PHY IPs in the Qcom SoCs. All
> > > > of the Qcom SoCs except MSM8996 require 3 clocks for QMP UFS:
> > > > 
> > > > * ref - 19.2MHz reference clock from RPM/RPMh
> > > > * ref_aux - Auxiliary reference clock from GCC
> > > > * qref - QREF clock from GCC or TCSR (TCSR since SM8550)
> > > > 
> > > > MSM8996 only requires 'ref' and 'qref' clocks.
> > > > 
> > > > Hence, this series fixes the binding, DT and GCC driver to reflect the
> > > > actual clock topology.
> > > 
> > > Is this based on documentation for all the SoCs or on inference from the
> > > current (upstream and downstream) devicetrees?
> > 
> > It is based on the internal documentation. Even downstream devicetrees are
> > wrong. I should've mentioned it in the cover letter.
> > 
> > > Are you sure that you should not just describe that some of these UFS
> > > reference clocks are sourced from CXO in the clock driver instead?
> > 
> > I don't get your comment fully. Could you please elaborate?
> 
> Unless the PHY consumes CXO directly, it should not be included in the
> binding as you are suggesting here.
> 

PHY is indeed directly consuming CXO. That's why I included it in the binding.

> We discussed this at some length at the time with Bjorn and Shazad who
> had access to the documentation and the conclusion was that, at least on
> sc8280xp, the PHY does not use CXO directly and instead it should be
> described as a parent to the UFS refclocks in the clock driver:
> 
> 	https://lore.kernel.org/lkml/Y2OEjNAPXg5BfOxH@hovoldconsulting.com/
> 
> The downstream devicetrees have a bad habit of including parent clocks
> directly in the consumer node instead of modelling this in clock driver
> also for other peripherals.
>  

No, I can assure that you got the wrong info. UFS PHY consumes the clock
directly from RPMh. It took me several days to dig through the UFS and PHY docs
and special thanks to Can Guo from UFS team, who provided much valuable
information about these clocks.

> > > Take a look at commits
> > > 
> > > 	f446022b932a ("arm64: dts: qcom: sc8280xp: fix UFS reference clocks")
> > > 	f6abcc21d943 ("clk: qcom: gcc-sc8280xp: add cxo as parent for three ufs ref clks")
> > 
> > Btw, these commits are not accurate. In all the SoCs before SM8550, reference
> > clock for the UFS device comes from the UFS controller. There is a dedicated
> > register in UFSHC memory map that is being toggled by the driver to
> > enable/disable reference clock for the UFS device.
> >
> > Since SM8550, reference clock is directly sourced from RPMh. I'm preparing a
> > series to fix it.
> 
> What exactly is wrong with those commits? We know that the controller
> does not consume GCC_UFS_REF_CLKREF_CLK directly, but describing that as
> such for now was a deliberate choice:
> 
> 	GCC_UFS_REF_CLKREF_CLK is the clock to the devices, but as we
> 	don't represent the memory device explicitly it seems suitable
> 	to use as "ref_clk" in the ufshc nodes - which would then match
> 	the special handling of the "link clock" in the UFS driver.
>  

No, GCC_UFS_REF_CLKREF_CLK is _not_ the clock to UFS devices. I haven't found
information about this specific register in GCC. Initially I thought this is for
enabling QREF clocks for the UFS MEM phy, but I haven't found the answer yet.

But as I said earlier, reference clock to UFS devices comes directly from the
controller and there is a specfic register for controlling that. Starting from
SM8550, reference clock comes from RPMh.

> > Unfortunately, this information is not depicted correctly in the downstream
> > devicetrees.
> 
> I was hoping the information that those commits are based on would be
> correct as it came from Qualcomm and Bjorn. I have no illusions about
> the downstream devicetrees being correct. :)
> 

Unfortunately, you got inaccurate information. But that's very common, since
these kind of info are buried down in some docs and people's mind :)

- Mani

> Johan

-- 
மணிவண்ணன் சதாசிவம்

