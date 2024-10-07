Return-Path: <linux-arm-msm+bounces-33303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EF19922AD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 04:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 980EB281923
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 01:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C358EE552;
	Mon,  7 Oct 2024 01:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W/YRTW6Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FD0BA42;
	Mon,  7 Oct 2024 01:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728266394; cv=none; b=FhHnFmpjKk4SA2ZbngvO3cuHhOEsoclHEPLoG7U0/qm+olFPp/q+tE1uBmNuW+Un29EbLlOp7q5uWqRXlbGxNLgEhE4wVE7sydByvhDHb26E8mqn02XIF/0AShG3fWX6r+xMsT6/qV9hd+nSZwXnP1ck89/FhX8INVBW32Srmlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728266394; c=relaxed/simple;
	bh=ExxtH7dra2T7yWVOykrnM1zK/vpjxSTT2zmx3/p/GeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TyVqmCsAVLOOJ6tbX5AFAs0oiWF1HQDj/Co18p3jnw+pUY+8df1smfr9D6sRavpnJvVixFI5zQoTTPu9kdrVKfsnYUwsHIQuB2AlE6i55YK4pdk7JfKqEFzCJysFFy7R5S6+DXoyPIu0APuJhFV031EapOxEEx4W8A20iJxk+lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W/YRTW6Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF77C4CEC5;
	Mon,  7 Oct 2024 01:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728266394;
	bh=ExxtH7dra2T7yWVOykrnM1zK/vpjxSTT2zmx3/p/GeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W/YRTW6QsLCy6JD32IM/kLUYkuuJD8dl7X7wlCNDagTovAlt9LwOS1gCW9kp7fb46
	 bG2jt9RxvX5pOG+f2uBh8xfirF48wOgXD5G4mU8896tNcBVLsfSniMTeMwi7qMZyLG
	 UDYSkaIF6iJ2H0Na8bAOnH3MzGL5fYf+GmAXaKVC+Q4UzPORO1JhgtnH8WTCAPLZyQ
	 jQAhbl2psD6PdhwDNAHZ0hhy7b4iFCQIwxoe9f/xtTWQ+z65tnflQQB5fBNAo+FKAv
	 oQcSYgZTON2yCw1OCOnQj9giwtv/3iWKO6P2brSI8EOSnc4dBQYSuxsDyv3RLxxaBg
	 V/8BF40xzjmpw==
Date: Sun, 6 Oct 2024 20:59:51 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Subramanian Ananthanarayanan <quic_skananth@quicinc.com>
Cc: krzk+dt@kernel.org, quic_krichai@quicinc.com, 
	quic_vbadigan@quicinc.com, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] arm64: dts: qcom: sa8775p: Update iommu-map entry
Message-ID: <qzvnggl2tmgk7qny6y45nleyk557twr2tpvtnej7pmrurcida6@o6g5wckoia4w>
References: <20241001114601.1097618-1-quic_skananth@quicinc.com>
 <zd6hff2oun3dgte75sl4jbtqvkgaohxfdkaei7wgmxbqljzx5u@htzwhxectc6i>
 <52d6f8d1-a624-4b91-8c75-9bc7e9c76b32@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52d6f8d1-a624-4b91-8c75-9bc7e9c76b32@quicinc.com>

On Thu, Oct 03, 2024 at 03:57:11PM GMT, Subramanian Ananthanarayanan wrote:
> 
> On 10/2/2024 7:48 AM, Bjorn Andersson wrote:
> > On Tue, Oct 01, 2024 at 05:16:01PM GMT, Subramanian Ananthanarayanan wrote:
> > > SA8775P has only support for SMMU v2, due to this PCIe has limited
> > > SID entries to enable dynamic IOMMU mapping in the driver, hence
> > > we are updating static entries.
> > > 
> > > iommu-map entries are added to support more PCIe device like switch
> > > attach, SRIOV capable devices.
> > > 
> > Is there a reason for this to be specific to sa8775p-ride? Will other
> > boards have different iommu-maps?
> > 
> > Regards,
> > Bjorn
> 
> These settings are specific to ride board which has SRIOV usecase, in all
> other
> cases we expect only direct attach where the main DT is sufficent.
> 

What would the drawback be of adding this in the dtsi? I understand that
you currently don't have any other boards with this setup today, but I
hope that will change.

Anyway, the problem you're describing above is that SA8775P only
support SMMU v2, that it has limited SID entries etc. These might be
facts (well, "support" seems like the wrong word), but they don't
explain why you add the iommu-map on this device.

Please update the commit message to explain to future readers why
iommu-map is populated like this, and why it's not done in the platform
dtsi. It's useful for the review, but it's going to be very useful for
future dts authors (who will turn to git log to figure out why
sa8775p-ride.dtsi looks like this).

Regards,
Bjorn

> - Subramanian
> 
> > 
> > > Signed-off-by: Subramanian Ananthanarayanan <quic_skananth@quicinc.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 62 ++++++++++++++++++++++
> > >   1 file changed, 62 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > > index 0c1b21def4b6..05c9f572ae42 100644
> > > --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > > @@ -675,6 +675,37 @@ &pcie0 {
> > >   	pinctrl-names = "default";
> > >   	pinctrl-0 = <&pcie0_default_state>;
> > > +	iommu-map = <0x0 &pcie_smmu 0x0000 0x1>,
> > > +		    <0x100 &pcie_smmu 0x0001 0x1>,
> > > +		    <0x101 &pcie_smmu 0x0002 0x1>,
> > > +		    <0x208 &pcie_smmu 0x0003 0x1>,
> > > +		    <0x210 &pcie_smmu 0x0004 0x1>,
> > > +		    <0x218 &pcie_smmu 0x0005 0x1>,
> > > +		    <0x280 &pcie_smmu 0x0006 0x1>,
> > > +		    <0x281 &pcie_smmu 0x0007 0x1>,
> > > +		    <0x282 &pcie_smmu 0x0008 0x1>,
> > > +		    <0x283 &pcie_smmu 0x0009 0x1>,
> > > +		    <0x284 &pcie_smmu 0x000a 0x1>,
> > > +		    <0x285 &pcie_smmu 0x000b 0x1>,
> > > +		    <0x286 &pcie_smmu 0x000c 0x1>,
> > > +		    <0x287 &pcie_smmu 0x000d 0x1>,
> > > +		    <0x288 &pcie_smmu 0x000e 0x1>,
> > > +		    <0x289 &pcie_smmu 0x000f 0x1>,
> > > +		    <0x28a &pcie_smmu 0x0010 0x1>,
> > > +		    <0x28b &pcie_smmu 0x0011 0x1>,
> > > +		    <0x28c &pcie_smmu 0x0012 0x1>,
> > > +		    <0x28d &pcie_smmu 0x0013 0x1>,
> > > +		    <0x28e &pcie_smmu 0x0014 0x1>,
> > > +		    <0x28f &pcie_smmu 0x0015 0x1>,
> > > +		    <0x290 &pcie_smmu 0x0016 0x1>,
> > > +		    <0x291 &pcie_smmu 0x0017 0x1>,
> > > +		    <0x292 &pcie_smmu 0x0018 0x1>,
> > > +		    <0x293 &pcie_smmu 0x0019 0x1>,
> > > +		    <0x300 &pcie_smmu 0x001a 0x1>,
> > > +		    <0x400 &pcie_smmu 0x001b 0x1>,
> > > +		    <0x500 &pcie_smmu 0x001c 0x1>,
> > > +		    <0x501 &pcie_smmu 0x001d 0x1>;
> > > +
> > >   	status = "okay";
> > >   };
> > > @@ -685,6 +716,37 @@ &pcie1 {
> > >   	pinctrl-names = "default";
> > >   	pinctrl-0 = <&pcie1_default_state>;
> > > +	iommu-map = <0x0 &pcie_smmu 0x0080 0x1>,
> > > +		    <0x100 &pcie_smmu 0x0081 0x1>,
> > > +		    <0x101 &pcie_smmu 0x0082 0x1>,
> > > +		    <0x208 &pcie_smmu 0x0083 0x1>,
> > > +		    <0x210 &pcie_smmu 0x0084 0x1>,
> > > +		    <0x218 &pcie_smmu 0x0085 0x1>,
> > > +		    <0x280 &pcie_smmu 0x0086 0x1>,
> > > +		    <0x281 &pcie_smmu 0x0087 0x1>,
> > > +		    <0x282 &pcie_smmu 0x0088 0x1>,
> > > +		    <0x283 &pcie_smmu 0x0089 0x1>,
> > > +		    <0x284 &pcie_smmu 0x008a 0x1>,
> > > +		    <0x285 &pcie_smmu 0x008b 0x1>,
> > > +		    <0x286 &pcie_smmu 0x008c 0x1>,
> > > +		    <0x287 &pcie_smmu 0x008d 0x1>,
> > > +		    <0x288 &pcie_smmu 0x008e 0x1>,
> > > +		    <0x289 &pcie_smmu 0x008f 0x1>,
> > > +		    <0x28a &pcie_smmu 0x0090 0x1>,
> > > +		    <0x28b &pcie_smmu 0x0091 0x1>,
> > > +		    <0x28c &pcie_smmu 0x0092 0x1>,
> > > +		    <0x28d &pcie_smmu 0x0093 0x1>,
> > > +		    <0x28e &pcie_smmu 0x0094 0x1>,
> > > +		    <0x28f &pcie_smmu 0x0095 0x1>,
> > > +		    <0x290 &pcie_smmu 0x0096 0x1>,
> > > +		    <0x291 &pcie_smmu 0x0097 0x1>,
> > > +		    <0x292 &pcie_smmu 0x0098 0x1>,
> > > +		    <0x29d &pcie_smmu 0x0099 0x1>,
> > > +		    <0x300 &pcie_smmu 0x009a 0x1>,
> > > +		    <0x400 &pcie_smmu 0x009b 0x1>,
> > > +		    <0x500 &pcie_smmu 0x009c 0x1>,
> > > +		    <0x501 &pcie_smmu 0x009d 0x1>;
> > > +
> > >   	status = "okay";
> > >   };
> > > -- 
> > > 2.34.1
> > > 

