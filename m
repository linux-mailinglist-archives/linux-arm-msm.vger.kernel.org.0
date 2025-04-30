Return-Path: <linux-arm-msm+bounces-56204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB57EAA4433
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 09:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC2ED1BA7A2A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 07:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94E720C461;
	Wed, 30 Apr 2025 07:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A8Xyozun"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEFC1EA7C8;
	Wed, 30 Apr 2025 07:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745998999; cv=none; b=caBf22pocYVOd4kt2h83Mf8/N40Nc77Y33oRD+bCCuCOIhj6MxJct37tyBhJeB8VDLwHudh1rDWUmELU/tLz+IY06ogLXZxam2EBoB3n0CV527zsTop4xDBK2wTHXP4x4V728ccdAn30kc7HaZlh5eh4xPlutsIpNROnlsuHbEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745998999; c=relaxed/simple;
	bh=gExrTVlcnDRsT84V3QRuYfykoVMoGAR/wS6ItbhLn+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtOq0WWu+b86TQsHIeW3RHez9lqsW/R2VrzS1vaXoXfzNu3LJ5X3+RjKikj/wNRVvHatD8XAV+ZB+k2lw9jlMkxYplH5g7r623wlwd6BTeh9EFYG2+0Fjm/F5c/ViIEIHC1Tm0/6+jZEq8q3COwN+mRT2rqv5PtQifW4NRYzck8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A8Xyozun; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDF8EC4CEE9;
	Wed, 30 Apr 2025 07:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745998999;
	bh=gExrTVlcnDRsT84V3QRuYfykoVMoGAR/wS6ItbhLn+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A8XyozunY9KfI/jWcSc7MBnMr/Kf4SDZWTl8wYF0aP3bD84wVy3Q981cvOTWZRchw
	 W44IeVBYWhlqp1UfVzv4CxaitJL8KHxK96xGyX3W3cS0aOfpISEErviIcsHEMxO8jN
	 ufO7OZF7NVZRMhw2FeuG42pUG5qv6mo/eAwLLXdQpP+xQl+PqRiR8M1fzDJntjJCad
	 bdMV4fS+ml9aXSQCcuKxd1wzMtR2P4+Qa0jl5ItXVKNTPCFqjEJ7yHhgzjcUcUocPj
	 JFxTLvBXTPZ1AqwLqQNdOLKzFXlqOyxPIYZ+CF6LA4E/tw0Ghm2N811XNkF1vIiH58
	 KdWV3hcm6Z4EQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uA26D-000000008WT-1rDN;
	Wed, 30 Apr 2025 09:43:21 +0200
Date: Wed, 30 Apr 2025 09:43:21 +0200
From: Johan Hovold <johan@kernel.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
	will@kernel.org, linux-arm-kernel@lists.infradead.org,
	andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com,
	quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
	quic_cang@quicinc.com
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-qcp: Add qref supply
 for PCIe PHYs
Message-ID: <aBHUmXx6N72_sCH9@hovoldconsulting.com>
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
 <20250425092955.4099677-5-quic_wenbyao@quicinc.com>
 <aAtbFQIQMJO-BYe_@hovoldconsulting.com>
 <e82eda3b-b27f-4584-ad23-562ca4b22847@oss.qualcomm.com>
 <aAt54vikoREWZyGY@hovoldconsulting.com>
 <17a1a4d9-fdc5-477a-bf4e-91cae5a62479@oss.qualcomm.com>
 <c4115bbc-e120-4a20-b6ad-a0d5266319d3@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4115bbc-e120-4a20-b6ad-a0d5266319d3@quicinc.com>

[ Qiang, it seems you mail client is removing newlines from your quoted
  replies which makes it hard to read the context. I've tried to add
  them back below, but please try to fix that up. ]

On Wed, Apr 30, 2025 at 12:15:56PM +0800, Qiang Yu wrote:
> On 4/26/2025 6:48 PM, Konrad Dybcio wrote:
> > On 4/25/25 2:02 PM, Johan Hovold wrote:
> >> On Fri, Apr 25, 2025 at 12:03:06PM +0200, Konrad Dybcio wrote:
> >>> On 4/25/25 11:51 AM, Johan Hovold wrote:

> >>>> AFAIU the PHYs do not use this qref supply directly so it does not
> >>>> belong in the PHY node (but possibly in the tcsr node that provides the
> >>>> refclk).
> >>>>
> >>>> Since commit 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100
> >>>> qref supplies") it also won't have any effect for pcie4 and pcie6.

> >>> QREF is a separate hw block distributing the reference clocks across
> >>> certain on-SoC peripherals
> >>>
> >>> If its power goes out, I don't think much of the platform would be
> >>> functional anyway, so it's redundant here..
> >>>
> >>> It doesn't have its own single register region and it's frankly
> >>> one-shot-configured way before Linux starts up, so there should be
> >>> no need of describing it at all.

> >> Then it sounds like the qref supplies should be marked as always-on. Can
> >> they be disabled at all?

> > The best answer I can say is "maybe". I would (without knowing any better)
> > assume RPMh wouldn't let you turn them off. QREF predictably takes VDD_CX/MX
> > and some additional lines

> The vdda-qref power supply feeds the QREF clocks, which are consumed by 
> PCIe, UFS, USB and display on X1e80100.
> For PCIe, QREF clks are provided by the TCSR device with the following 
> bindings on X1E80100:
> #define TCSR_PCIE_2L_4_CLKREF_EN
> #define TCSR_PCIE_2L_5_CLKREF_EN
> #define TCSR_PCIE_8L_CLKREF_EN
> #define TCSR_PCIE_4L_CLKREF_EN
> 
> These QREF clocks are not enabled all the time and are disabled during 
> PHY deinit. Hence, vdda-qref should not be an always-on power supply. It 
> should be turned off when the QREF clocks are disabled.
> 
> Describing vdda-qref in the PHY device tree node is reasonable, as it 
> allows the vdda-qref power supply to be enabled or disabled along with 
> the QREF clocks during PHY init/deinit.

It may work, but it seems more reasonable to have the TCSR clock
controller manage them even if that isn't necessarily an entirely
accurate description of the hw either.

On the T14s (X1E), we have the following QREF supplies:

	VDD_A_QREFS_1P2_A
	VDD_A_QREFS_1P2_B

	VDD_A_QREFS_0P875_A
	VDD_A_QREFS_0P875_B
	VDD_A_QREFS_0P875_0
	VDD_A_QREFS_0P875_2
	VDD_A_QREFS_0P875_3

which does not seem to map directly to the three PCIe PHYs (and other
consumers).

Johan

