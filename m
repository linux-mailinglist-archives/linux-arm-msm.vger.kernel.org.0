Return-Path: <linux-arm-msm+bounces-45746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4D9A1882D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 00:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F4193A4508
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 23:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4C31F8ADD;
	Tue, 21 Jan 2025 23:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TBWVX3xm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5799554764;
	Tue, 21 Jan 2025 23:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737501093; cv=none; b=GftaVWitXdd8LZfbWYQzVjbrMViO1I3AhA4PaTmMqmjFyIc86T2na0FcURLPbLmpcpcc4ZWbh8aBB8uGFB+LIohBPNCeruHDeOvIV6rRRYRBZohdjCdirIbHaeQxq8EBncCRPznqw/TrSsR51rmxDHJwo+ejaRB0cdGdPdsmgdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737501093; c=relaxed/simple;
	bh=zZSINEPZzqM8Mt9OhG5M2OkXDH1RF2bDf5jiszECFCo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=XkCzywfl3W9xEQH+0XZ5DB+7P6qsuAThgtrulnYAw62+K7e9oob5oJr3PyJr/tkpziqvPi2yucGPJOzxTjqcA1ZtbUhjZIFz7kkhepop0ns7VhVTEnBUyOsVkOeTiI20BogInoYizwLb3iqWxuMtlZbpy56dWBviPI0gvrnhZkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TBWVX3xm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE328C4CEDF;
	Tue, 21 Jan 2025 23:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737501093;
	bh=zZSINEPZzqM8Mt9OhG5M2OkXDH1RF2bDf5jiszECFCo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=TBWVX3xm7rhxupv47RiLyM4sk3O3t+IAzV+psMEeiLcmyvHt1Qf9ifRRayBhu4Vjb
	 ZQKMOSgqlfpFjUmILAQyqZxNl6+g3v3aGLt6IrrO4BOPb4FeeFP2XxX8aKn8E/0pqt
	 j8e3xd8Y/xGQVtW/Y6Ume5zslkxTW5oPMt/6mOSiD0peITKBhg2bQqF2oWrXX7Upul
	 QG9dqTAmdWvG9EUDc99gDNtBEZSkFOohSOJtXT2c4Tsx7DpI0WifmJgeDuqoVVD7cK
	 zFDWNWR+EpLAn+DtwTHN3ubCNk+7/+noqm0dnhoZ+8kRUI0v54TSmFDzSyQYMed7t3
	 G+NOwQ27rPT6Q==
Date: Tue, 21 Jan 2025 17:11:31 -0600
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
Message-ID: <20250121231131.GA996473@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250119152534.d6berucbb2wbbi3z@thinkpad>

On Sun, Jan 19, 2025 at 08:55:34PM +0530, Manivannan Sadhasivam wrote:
> On Wed, Jan 15, 2025 at 12:13:40PM -0600, Bjorn Helgaas wrote:
> > On Wed, Jan 15, 2025 at 11:29:18PM +0530, Manivannan Sadhasivam wrote:
> > > On Wed, Jan 15, 2025 at 11:42:10AM -0600, Bjorn Helgaas wrote:
> > > > On Wed, Jan 15, 2025 at 04:24:31PM +0530, Manivannan Sadhasivam wrote:
> > > > > On Mon, Jan 06, 2025 at 05:07:05PM -0600, Bjorn Helgaas wrote:
> > > > > > On Sun, Jan 05, 2025 at 03:46:12PM +0530, Manivannan Sadhasivam wrote:
> > > > > > > On Fri, Jan 03, 2025 at 03:05:31PM -0600, Bjorn Helgaas wrote:
> > > > > > > > On Thu, Mar 21, 2024 at 04:46:21PM +0530, Manivannan Sadhasivam wrote:
> > > > > > > > > On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
> > > > > > > > > for each controller instance. Hence, add a node to represent the bridge.
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > > > > > > ---
> > > > > > > > >  arch/arm64/boot/dts/qcom/sm8250.dtsi | 30 ++++++++++++++++++++++++++++++
> > > > > > > > >  1 file changed, 30 insertions(+)
> > > > > > > > > 
> > > > > > > > > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > > > > > > > index 39bd8f0eba1e..fe5485256b22 100644
> > > > > > > > > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > > > > > > > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > > > > > > > @@ -2203,6 +2203,16 @@ pcie0: pcie@1c00000 {
> > > > > > > > >  			dma-coherent;
> > > > > > > > >  
> > > > > > > > >  			status = "disabled";
> > > > > > > > > +
> > > > > > > > > +			pcie@0 {
> > > > > > > > > +				device_type = "pci";
> > > > > > > > > +				reg = <0x0 0x0 0x0 0x0 0x0>;
> > > > > > > > > +				bus-range = <0x01 0xff>;
> > > > > > > > 
> > > > > > > > Hi Mani, most or all of the patches in this series add this
> > > > > > > > "bus-range" property.  IIUC, these are all Root Ports and hence the
> > > > > > > > secondary/subordinate bus numbers should be programmable.
> > > > > > > 
> > > > > > > Right. It is not a functional dependency.
> > > > > > > 
> > > > > > > > If that's the case, I don't think we need to include "bus-range" in DT
> > > > > > > > for them, do we?
> > > > > > > 
> > > > > > > We mostly include it to silence the below bindings check for the
> > > > > > > endpoint device node:
> > > > > > > 
> > > > > > > Warning (pci_device_bus_num): /soc@0/pcie@1c00000/pcie@0/wifi@0: PCI bus number 1 out of range, expected (0 - 0)
> > > > > > > 
> > > > > > > DTC check is happy if the 'bus-range' property is absent in the
> > > > > > > bridge node. But while validating the endpoint node (if defined), it
> > > > > > > currently relies on the parent 'bus-range' property to verify the
> > > > > > > bus number provided in the endpoint 'reg' property.
> > > > > > > 
> > > > > > > I don't know else the check can verify the correctness of the
> > > > > > > endpoint bus number. So deferring to Rob here.
> > > > > > 
> > > > > > I should know more about how this works in DT, but I don't.
> > > > > > 
> > > > > > I guess https://git.kernel.org/linus/83d2a0a1e2b9 ("arm64: dts: qcom:
> > > > > > sm8250: Add PCIe bridge node") added this (subsequently renamed to
> > > > > > "pcieport0"):
> > > > > > 
> > > > > >   +			pcie@0 {
> > > > > >   +				device_type = "pci";
> > > > > >   +				reg = <0x0 0x0 0x0 0x0 0x0>;
> > > > > >   +				bus-range = <0x01 0xff>;
> > > > > > 
> > > > > > which is used at places like
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts?id=v6.12#n788:
> > > > > > 
> > > > > >   &pcieport0 {
> > > > > > 	  wifi@0 {
> > > > > > 		  compatible = "pci17cb,1101";
> > > > > > 		  reg = <0x10000 0x0 0x0 0x0 0x0>;
> > > > > > 
> > > > > > Based on
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pci/pci.txt?id=v6.12#n46
> > > > > > (which is written for Root Ports and Switch Ports, but presumably
> > > > > > applies to endpoints like wifi as well), "reg" contains the device's
> > > > > > bus/device/function:
> > > > > > 
> > > > > >   - reg:
> > > > > >      Identifies the PCI-PCI bridge. As defined in the IEEE Std 1275-1994
> > > > > >      document, it is a five-cell address encoded as (phys.hi phys.mid
> > > > > >      phys.lo size.hi size.lo). phys.hi should contain the device's BDF as
> > > > > >      0b00000000 bbbbbbbb dddddfff 00000000. The other cells should be zero.
> > > > > > 
> > > > > > So 0x10000 would decode to 01:00.0, which matches the <1 1> bus-range.
> > > > > > 
> > > > > > I don't know the reason for requiring the BDF there, but the venerable
> > > > > > https://www.devicetree.org/open-firmware/bindings/pci/pci2_1.pdf, sec
> > > > > > 4.1.1, says "reg" is mandatory for PCI Child Nodes, and the first
> > > > > > entry must be the config space address (bus/device/function).
> > > > > > 
> > > > > > I suppose maybe the BDF is needed to associate the properties with the
> > > > > > correct device, and if the OS were to reprogram the bridge secondary
> > > > > > bus number, it would have to remember the original value to preserve
> > > > > > this association.  I don't think Linux *does* remember that, but it
> > > > > > also generally leaves the bridge bus numbers alone.
> > > > > 
> > > > > Device drivers need to parse the properties defined in the device DT
> > > > > node. And the only way to identify the node is by using its 'reg'
> > > > > property which has the BDF identifier. This is common to other
> > > > > busses where the device address is encoded in the 'reg' property.
> > > > 
> > > > Does this assume there is some firmware to configure these bridges
> > > > before Linux boots?
> > > 
> > > No.
> > > 
> > > >  If bridges are completely unconfigured after
> > > > power-on, their secondary and subordinate bus numbers will be zero, so
> > > > a bus-range property for the bridge can only be an assumption about
> > > > what Linux will do.
> > > 
> > > Secondary bus number for sure is not an assumption as it depends on
> > > the hardware topology which linux would know from DT. But
> > > subordinate number could be considered as an assumption.
> > 
> > If there's no firmware and the secondary bus number is 0 when Linux
> > enumerates the bridge, does Linux know how to get the bus-range from
> > DT and program the bridge's secondary bus?
> 
> Linux doesn't seem to make use of the secondary bus number from DT node of a
> bridge, but there is no guarantee that other OSes making use of DT won't do.
> 
> > And does Linux know how to update the subordinate bus number in the
> > case where several Root Ports specify 0xff in bus-range?
> 
> Same answer as above.

Let me back up; I don't think we're understanding each other.  This
DT:

  pcie@0 {
    bus-range = <0x01 0xff>;

    &pcieport0 {
      wifi@0 {
	reg = <0x10000 0x0 0x0 0x0 0x0>;

says that wifi@0 is at 01:00.0, which is only true if the pcie@0
secondary bus number is 01.  The power-up default is 00, so it's only
01 if either firmware or Linux has programmed it that way.

I claim this DT assumes the pcie@0 secondary bus number is programmed
either by firmware or Linux.  This makes me a bit nervous because
AFAIK there's nothing that guarantees Linux would choose bus 01.

Maybe Linux just needs to get smarter and program it based on the
start of the DT bus-range?

