Return-Path: <linux-arm-msm+bounces-44054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB431A03328
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 00:07:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD64216380A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 23:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6611DFD84;
	Mon,  6 Jan 2025 23:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ed9AvVRl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE25B1DA614;
	Mon,  6 Jan 2025 23:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736204828; cv=none; b=YD6sz2GxMfiwc7qtP2nn/S50A/oqeq9WF3mAsr+T/Q2RPRUPKr2jsQMWpPAc3jrNiU/32Q9KrlZYXnk+6JeXMFfCNq35/DwFnhF8dDLZInOYBCn139VZTe/SmMiCXTUMBuL2JCl9avY8U6GDPm2aGIz5OiuDYUtpPQzEsjYVvuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736204828; c=relaxed/simple;
	bh=hqi9o03baLfK6/OiEtJweD7rltsfckOcB8sqd2412yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=b52UQ4ACJriGXpOCIylvDuP+NTIs6QKMD9cbUFzvJhR8UNNGAMU251puZUofC7MaAoYBHD9IMkyP064hlmXOE6+1HfpnbljewFE8hwVtW6/NbiXFtIAipYPNFbNpZu6NOtzdRxaolMAuJ8K1HN/LedqxYzI1jZ9hee8a/ceRS5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ed9AvVRl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46DC2C4CEDD;
	Mon,  6 Jan 2025 23:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736204827;
	bh=hqi9o03baLfK6/OiEtJweD7rltsfckOcB8sqd2412yQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ed9AvVRlbXLkbmMdTAk14dey89WEA/0jocOB8APWJ8glD8Zg4kdBZd1x8EHd7muqg
	 1Es6Oc3KbTHu+HvhcHQZONEgrlSXf/W9rFqTe3socUbAWBr2aYKTKjT/r5+lLkpCTt
	 jJLFZrZDvCfmsdmjkwSIH470zxE5VyieMcNoZ/1HXOznYOGTp4ljtOZ80pHYsvVx5g
	 xXB8HbyaOy6KeGgWLVEDI7Ws1yeKs+UmBmW6338Bso63ql8QmmjPHo8L1fbytHCwAf
	 lLwgyDXpfS+PBXxJErFbWb61hDq86aA90WFxne/kH8etfNaRh5nYF1Dnma9se3PCXK
	 zP7fNi8Y6GK1g==
Date: Mon, 6 Jan 2025 17:07:05 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH v2 01/21] arm64: dts: qcom: sm8250: Add PCIe bridge node
Message-ID: <20250106230705.GA132316@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250105101612.t6c4pw5uxhb5rdde@thinkpad>

[+cc Nícolas]

On Sun, Jan 05, 2025 at 03:46:12PM +0530, Manivannan Sadhasivam wrote:
> On Fri, Jan 03, 2025 at 03:05:31PM -0600, Bjorn Helgaas wrote:
> > On Thu, Mar 21, 2024 at 04:46:21PM +0530, Manivannan Sadhasivam wrote:
> > > On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
> > > for each controller instance. Hence, add a node to represent the bridge.
> > > 
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/sm8250.dtsi | 30 ++++++++++++++++++++++++++++++
> > >  1 file changed, 30 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > index 39bd8f0eba1e..fe5485256b22 100644
> > > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > @@ -2203,6 +2203,16 @@ pcie0: pcie@1c00000 {
> > >  			dma-coherent;
> > >  
> > >  			status = "disabled";
> > > +
> > > +			pcie@0 {
> > > +				device_type = "pci";
> > > +				reg = <0x0 0x0 0x0 0x0 0x0>;
> > > +				bus-range = <0x01 0xff>;
> > 
> > Hi Mani, most or all of the patches in this series add this
> > "bus-range" property.  IIUC, these are all Root Ports and hence the
> > secondary/subordinate bus numbers should be programmable.
> 
> Right. It is not a functional dependency.
> 
> > If that's the case, I don't think we need to include "bus-range" in DT
> > for them, do we?
> 
> We mostly include it to silence the below bindings check for the
> endpoint device node:
> 
> Warning (pci_device_bus_num): /soc@0/pcie@1c00000/pcie@0/wifi@0: PCI bus number 1 out of range, expected (0 - 0)
> 
> DTC check is happy if the 'bus-range' property is absent in the
> bridge node. But while validating the endpoint node (if defined), it
> currently relies on the parent 'bus-range' property to verify the
> bus number provided in the endpoint 'reg' property.
> 
> I don't know else the check can verify the correctness of the
> endpoint bus number. So deferring to Rob here.

I should know more about how this works in DT, but I don't.

I guess https://git.kernel.org/linus/83d2a0a1e2b9 ("arm64: dts: qcom:
sm8250: Add PCIe bridge node") added this (subsequently renamed to
"pcieport0"):

  +			pcie@0 {
  +				device_type = "pci";
  +				reg = <0x0 0x0 0x0 0x0 0x0>;
  +				bus-range = <0x01 0xff>;

which is used at places like
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts?id=v6.12#n788:

  &pcieport0 {
	  wifi@0 {
		  compatible = "pci17cb,1101";
		  reg = <0x10000 0x0 0x0 0x0 0x0>;

Based on
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pci/pci.txt?id=v6.12#n46
(which is written for Root Ports and Switch Ports, but presumably
applies to endpoints like wifi as well), "reg" contains the device's
bus/device/function:

  - reg:
     Identifies the PCI-PCI bridge. As defined in the IEEE Std 1275-1994
     document, it is a five-cell address encoded as (phys.hi phys.mid
     phys.lo size.hi size.lo). phys.hi should contain the device's BDF as
     0b00000000 bbbbbbbb dddddfff 00000000. The other cells should be zero.

So 0x10000 would decode to 01:00.0, which matches the <1 1> bus-range.

I don't know the reason for requiring the BDF there, but the venerable
https://www.devicetree.org/open-firmware/bindings/pci/pci2_1.pdf, sec
4.1.1, says "reg" is mandatory for PCI Child Nodes, and the first
entry must be the config space address (bus/device/function).

I suppose maybe the BDF is needed to associate the properties with the
correct device, and if the OS were to reprogram the bridge secondary
bus number, it would have to remember the original value to preserve
this association.  I don't think Linux *does* remember that, but it
also generally leaves the bridge bus numbers alone.

Bjorn

