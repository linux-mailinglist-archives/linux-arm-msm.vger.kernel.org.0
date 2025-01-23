Return-Path: <linux-arm-msm+bounces-46012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28552A1ABD8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 22:23:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18A57188E619
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 21:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C08501C5D5C;
	Thu, 23 Jan 2025 21:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fDU378yG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FABF1CAA63;
	Thu, 23 Jan 2025 21:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737667381; cv=none; b=mryL1R4Y5ADyqC9dP+0BCEjZ4fBDmcin0OKkpsiLWdWaFG2fW0jrQPYYvkj3cSVrpnLtFyokHsiv8GjIRgGFN0xvZAlCmLmG9RDzrJrKQ2Og8oentkol/Klr/1RtM2Q6HSy5dLvBZf/mdcaH/LnV/cPMEqBOBZjQHCRDNv61V7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737667381; c=relaxed/simple;
	bh=Pqn0b9u+oiewcWbHAYxeu1Vc50G/8MYxNovN2Y3irTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJpeypFuTwq7uKqSzd0engaz8WzTeLJRh1pnaMaGJP3erKIAxeMdVSWBWEhhp5CztB46ZXfuurYML3EH+5eX/IpHpv5RvI9cfTQ8sTSx+cZezS5kGcIxoMxfsGW7/GFGm1QACDRRKpco+TzMDgVRDvDvt91DZkh6IEYKfIpBI/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fDU378yG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEE66C4CED3;
	Thu, 23 Jan 2025 21:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737667381;
	bh=Pqn0b9u+oiewcWbHAYxeu1Vc50G/8MYxNovN2Y3irTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fDU378yGsz+RgFBSk/vYkjkT4hMhGrHx/t07ufKOX5hD0/lBUjUAhC224aip1PlJq
	 aZmdhs+x95e3adyGo+K863swSuI0+Xrhz4Uu+wCzH8KjijV8SgC7raU01nMJuBJrDU
	 Mmt/1oQI7DzcJqOuaeK2oVhulbE0iX/UWbUsCHtScvaF5Av5Tzd2xexKT4RD8CNzhK
	 4SUUA4ubrEQ73hhzlNORFB3xfGgNihN9AGVj0BxRKPOQ/dOoVuCBgr276rG4Qb25aG
	 FRvZ2F/dOqcW6k5TnRLDcQ3WrohkkoKmn8yC6zlJTZubiqaaCCd4njviaCxSwYDgyl
	 ZZrl23MNP9NLg==
Date: Thu, 23 Jan 2025 15:22:59 -0600
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Saravana Kannan <saravanak@google.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/12] usb: dwc3: qcom: Flatten dwc3 structure
Message-ID: <20250123212259.GA381176-robh@kernel.org>
References: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
 <20250114174452.GB1414434-robh@kernel.org>
 <srhxu3r4sxy5ntx53nicf7l43sdjpiwavzd2qsgq2ovquzvt3u@cskcthmqznex>
 <CAL_Jsq+4qzfy3kY+8LwPvGs4FkFKoregTAYu4-buJQZHkqJwyA@mail.gmail.com>
 <3kuydb3b3ky4gczh5dyjjdcka2xlzgcv3ged4d432fgrprx7hr@byi7eg5fdvop>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3kuydb3b3ky4gczh5dyjjdcka2xlzgcv3ged4d432fgrprx7hr@byi7eg5fdvop>

On Wed, Jan 22, 2025 at 09:07:43PM -0600, Bjorn Andersson wrote:
> On Wed, Jan 15, 2025 at 12:51:42PM -0600, Rob Herring wrote:
> > On Tue, Jan 14, 2025 at 5:04 PM Bjorn Andersson <andersson@kernel.org> wrote:
> > >
> > > On Tue, Jan 14, 2025 at 11:44:52AM -0600, Rob Herring wrote:
> > > > On Mon, Jan 13, 2025 at 09:11:33PM -0800, Bjorn Andersson wrote:
> > > > > The USB IP-block found in most Qualcomm platforms is modelled in the
> > > > > Linux kernel as 3 different independent device drivers, but as shown by
> > > > > the already existing layering violations in the Qualcomm glue driver
> > > > > they can not be operated independently.
> > > > >
> > > > > With the current implementation, the glue driver registers the core and
> > > > > has no way to know when this is done. As a result, e.g. the suspend
> > > > > callbacks needs to guard against NULL pointer dereferences when trying
> > > > > to peek into the struct dwc3 found in the drvdata of the child.
> > > > >
> > > > > Missing from the upstream Qualcomm USB support is proper handling of
> > > > > role switching, in which the glue needs to be notified upon DRD mode
> > > > > changes. Several attempts has been made through the years to register
> > > > > callbacks etc, but they always fall short when it comes to handling of
> > > > > the core's probe deferral on resources etc.
> > > > >
> > > > > Furhtermore, the DeviceTree binding is a direct representation of the
> > > > > Linux driver model, and doesn't necessarily describe "the USB IP-block".
> > > > >
> > > > > This series therefor attempts to flatten the driver split, and operate
> > > > > the glue and core out of the same platform_device instance. And in order
> > > > > to do this, the DeviceTree representation of the IP block is flattened.
> > > > >
> > > > > To avoid littering the dwc3-qcom driver with the migration code - which
> > > > > we should be able to drop again in a LTS or two - this is now placed in
> > > > > drivers/of/overlays.
> > > > >
> > > > > A patch to convert a single platform - sc8280xp - is included in the
> > > > > series. The broader conversion will be submitted in a follow up series.
> > > >
> > > > Is it not possible to use the same overlays also fixup the .dts files at
> > > > build time?
> > > >
> > >
> > > I presume so. What would the benefit of that be, over fixing up the
> > > source asap?
> > 
> > The overlays would live with all the other dts files (I think kbuild
> > can add built-in dtbs from arch/*/boot/dts/). We can test at build
> > time they actually apply, and ensure the new dtb matches what the
> > fixup overlay creates.
> > 
> 
> That does sounds tempting, in particular since it sounds like it would
> provide  us with dt-validation of the end result.
> 
> But, the build-time overlaid dtb files wouldn't be complete, as I
> programmatically transition some of the properties - to "fix" that I'd
> have to provide an overlay per board.
> 
> Second, it was my intention to transition all the boards to the new
> binding as soon as possible, to avoid adding more overlays when new
> boards are added. So any support-system we build up for this, would be
> immediately obsoleted.

Ok, fair enough.

I would still prefer the overlays live in arch/*/boot/dts/qcom/ even if 
we don't do the rest.

Rob

