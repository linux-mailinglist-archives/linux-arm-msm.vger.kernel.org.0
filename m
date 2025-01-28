Return-Path: <linux-arm-msm+bounces-46396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DB1A20B7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 14:45:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2933D3A39D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 13:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8FE51A704B;
	Tue, 28 Jan 2025 13:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zSUAzy5a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BACF27442
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 13:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738071923; cv=none; b=OxBoa3hmTz6AjVmXUHeOqQoS5yAQjUDv8F0bbqZj4CNUOAqoDOCOBLTvHgdM348Dw/WFk5DXwrNSfVFa8p2bGFcafC178jisYHkVvJLSF5gF0c0hPS67E13UPbQ7mtqFYBZ//hFkTx83kBBFu1iwvuxjMjfp3FPKUJ2y5D7faQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738071923; c=relaxed/simple;
	bh=ILBl5rlQAw5zuB8HiQS7Lwzcq0akIj6qnlEG9+oewB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bn+Y6vPdC6VjzMxYjC72ynGYTTj1gu8x/1tyPnYpGkSOtKCWDznz9kO8mi90iWga4LgaEMPxqbBeLwePWZkzOiw4OxPJYy8xYhHhx3fxWTQmMv7ziNrYB4t6+jiUBu5pw8PHlAFb6mnMCr2IKmgiVdFNvS1dypRuL9OEwbQsotM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zSUAzy5a; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ef6c56032eso7522161a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 05:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738071920; x=1738676720; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OH8zou6tiMlTZPkG0CATI8/MEL7cw17wOVzxgUD8Gn0=;
        b=zSUAzy5a9DjFEnA+C6q2CC6Ox2itOCyWesCI82aWurDeV0groRrmFgvr1fcF7eh+nh
         8+7CWh3AjDKncqIgu3S5K3yE39tJdzBduBea+xq3vr7vIM8v8Nv5C/ARgDKoPsBJaXyT
         p1BGUYcpaKNAC2lXkaD032KRuO6RK4YESrWP5sEPLJBTAwHQ/gCSu6C+fu2W5kNiy/YG
         jxyqeW9giRPa453Urz4gUkkyxOGAj4ldR/glps2SO235cwc+AVJ2o6+JFV/eG9UeCmer
         Jfdx+rdISEiOuDXcWRTqtiVvjBgU8FKFdW1viKdiPxS2DUWdFU/L9ClEypRLkxXMy7HC
         F7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738071920; x=1738676720;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OH8zou6tiMlTZPkG0CATI8/MEL7cw17wOVzxgUD8Gn0=;
        b=eZ7XRVZm0rxLkzLyAU9bEClzpDzh1/761+Ld6EJzO+mo1iQC7o1DA/w2HprN42xAbx
         Y42Ciw9c4Tp5w13WApTExZoeFJNbsg/fRFALGWhDc/ZAYoj2wrcNTVm8OTy2NNwq2rkm
         9dQLMEWxwxyEqeJ+/vCj+05Py/tWjKrEKaxP8oReEAmy6fCX3eKPvJv5NIE0+fh+Xfh0
         F1gxAyEhNU2HUgadKkbN9WmD70kDPcA63xx6wWPWZMOAps9gYtXYcx73IrYvewBPi5L7
         IgwoMwDa6nIxdTVlFEe7eis6xXJoHUs4o+F7S71QJX0k3m2kFkH7Q/6BnzL49nEjuwkv
         GhVg==
X-Forwarded-Encrypted: i=1; AJvYcCWlfQE116LeKi+3kfRJ3BiMTAAOHDt2K9x2kUP9BSE/0he+0cjydEVYJwXxsLNOLJH3V5suhYDGghmfJ0VA@vger.kernel.org
X-Gm-Message-State: AOJu0YwqHre0USoQTZIwpkLvzsEmRT2vBrgwQHEYoPCfP9jYsizzSgYL
	gnnvCeYsoxFnOcFGDyD/oaLG1p9Qw7/OzE/3xbWvH8x9UsorxnM7oofZa2sdHA==
X-Gm-Gg: ASbGncv4AisK1U2qmgQBpoyHIN40xi2/p5PKIW/OWJdP2b09DP5WyBOfmxY8daDCu8k
	qzO55DJmqF9lRwaZdfI79StMOCndSpfcQj9jAVsuZc3lk9GHCp7GA0buClrgMJoC9Vbb/8ZJfQW
	swCex/SOCdag7YmlNqBBhIfx4sJJQh+ykrXQ9N5u8ym3g8pACg3cdM3e7cy9fw6Q0IOJBl0dGBn
	B0YNoqTrIX5kjV73IhN97N+iee09Ne4m7SXT9bLzqC/0tMc8cEN0N3QjCNlqCBPLWmfDpaUZUtf
	H1fD1auZ+nluP6zgqOjbuDJwwXI=
X-Google-Smtp-Source: AGHT+IFkxcto66tjHJWY1Iz2ZAgA3EEV7E8M2CepzPbBZJG9iHHIusEEKCZF0PYG9LxlSW3PxhHA4Q==
X-Received: by 2002:a17:90b:4ec8:b0:2ea:3f34:f18f with SMTP id 98e67ed59e1d1-2f782ca2c76mr60929605a91.19.1738071920273;
        Tue, 28 Jan 2025 05:45:20 -0800 (PST)
Received: from thinkpad ([120.60.131.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa44cb8sm9180368a91.6.2025.01.28.05.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 05:45:19 -0800 (PST)
Date: Tue, 28 Jan 2025 19:15:14 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH v2 01/21] arm64: dts: qcom: sm8250: Add PCIe bridge node
Message-ID: <20250128134514.u7mgxzwxqohzy5oj@thinkpad>
References: <20250119152534.d6berucbb2wbbi3z@thinkpad>
 <20250121231131.GA996473@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250121231131.GA996473@bhelgaas>

On Tue, Jan 21, 2025 at 05:11:31PM -0600, Bjorn Helgaas wrote:
> On Sun, Jan 19, 2025 at 08:55:34PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Jan 15, 2025 at 12:13:40PM -0600, Bjorn Helgaas wrote:
> > > On Wed, Jan 15, 2025 at 11:29:18PM +0530, Manivannan Sadhasivam wrote:
> > > > On Wed, Jan 15, 2025 at 11:42:10AM -0600, Bjorn Helgaas wrote:
> > > > > On Wed, Jan 15, 2025 at 04:24:31PM +0530, Manivannan Sadhasivam wrote:
> > > > > > On Mon, Jan 06, 2025 at 05:07:05PM -0600, Bjorn Helgaas wrote:
> > > > > > > On Sun, Jan 05, 2025 at 03:46:12PM +0530, Manivannan Sadhasivam wrote:
> > > > > > > > On Fri, Jan 03, 2025 at 03:05:31PM -0600, Bjorn Helgaas wrote:
> > > > > > > > > On Thu, Mar 21, 2024 at 04:46:21PM +0530, Manivannan Sadhasivam wrote:
> > > > > > > > > > On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
> > > > > > > > > > for each controller instance. Hence, add a node to represent the bridge.
> > > > > > > > > > 
> > > > > > > > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > > > > > > > ---
> > > > > > > > > >  arch/arm64/boot/dts/qcom/sm8250.dtsi | 30 ++++++++++++++++++++++++++++++
> > > > > > > > > >  1 file changed, 30 insertions(+)
> > > > > > > > > > 
> > > > > > > > > > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > > > > > > > > index 39bd8f0eba1e..fe5485256b22 100644
> > > > > > > > > > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > > > > > > > > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > > > > > > > > @@ -2203,6 +2203,16 @@ pcie0: pcie@1c00000 {
> > > > > > > > > >  			dma-coherent;
> > > > > > > > > >  
> > > > > > > > > >  			status = "disabled";
> > > > > > > > > > +
> > > > > > > > > > +			pcie@0 {
> > > > > > > > > > +				device_type = "pci";
> > > > > > > > > > +				reg = <0x0 0x0 0x0 0x0 0x0>;
> > > > > > > > > > +				bus-range = <0x01 0xff>;
> > > > > > > > > 
> > > > > > > > > Hi Mani, most or all of the patches in this series add this
> > > > > > > > > "bus-range" property.  IIUC, these are all Root Ports and hence the
> > > > > > > > > secondary/subordinate bus numbers should be programmable.
> > > > > > > > 
> > > > > > > > Right. It is not a functional dependency.
> > > > > > > > 
> > > > > > > > > If that's the case, I don't think we need to include "bus-range" in DT
> > > > > > > > > for them, do we?
> > > > > > > > 
> > > > > > > > We mostly include it to silence the below bindings check for the
> > > > > > > > endpoint device node:
> > > > > > > > 
> > > > > > > > Warning (pci_device_bus_num): /soc@0/pcie@1c00000/pcie@0/wifi@0: PCI bus number 1 out of range, expected (0 - 0)
> > > > > > > > 
> > > > > > > > DTC check is happy if the 'bus-range' property is absent in the
> > > > > > > > bridge node. But while validating the endpoint node (if defined), it
> > > > > > > > currently relies on the parent 'bus-range' property to verify the
> > > > > > > > bus number provided in the endpoint 'reg' property.
> > > > > > > > 
> > > > > > > > I don't know else the check can verify the correctness of the
> > > > > > > > endpoint bus number. So deferring to Rob here.
> > > > > > > 
> > > > > > > I should know more about how this works in DT, but I don't.
> > > > > > > 
> > > > > > > I guess https://git.kernel.org/linus/83d2a0a1e2b9 ("arm64: dts: qcom:
> > > > > > > sm8250: Add PCIe bridge node") added this (subsequently renamed to
> > > > > > > "pcieport0"):
> > > > > > > 
> > > > > > >   +			pcie@0 {
> > > > > > >   +				device_type = "pci";
> > > > > > >   +				reg = <0x0 0x0 0x0 0x0 0x0>;
> > > > > > >   +				bus-range = <0x01 0xff>;
> > > > > > > 
> > > > > > > which is used at places like
> > > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts?id=v6.12#n788:
> > > > > > > 
> > > > > > >   &pcieport0 {
> > > > > > > 	  wifi@0 {
> > > > > > > 		  compatible = "pci17cb,1101";
> > > > > > > 		  reg = <0x10000 0x0 0x0 0x0 0x0>;
> > > > > > > 
> > > > > > > Based on
> > > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pci/pci.txt?id=v6.12#n46
> > > > > > > (which is written for Root Ports and Switch Ports, but presumably
> > > > > > > applies to endpoints like wifi as well), "reg" contains the device's
> > > > > > > bus/device/function:
> > > > > > > 
> > > > > > >   - reg:
> > > > > > >      Identifies the PCI-PCI bridge. As defined in the IEEE Std 1275-1994
> > > > > > >      document, it is a five-cell address encoded as (phys.hi phys.mid
> > > > > > >      phys.lo size.hi size.lo). phys.hi should contain the device's BDF as
> > > > > > >      0b00000000 bbbbbbbb dddddfff 00000000. The other cells should be zero.
> > > > > > > 
> > > > > > > So 0x10000 would decode to 01:00.0, which matches the <1 1> bus-range.
> > > > > > > 
> > > > > > > I don't know the reason for requiring the BDF there, but the venerable
> > > > > > > https://www.devicetree.org/open-firmware/bindings/pci/pci2_1.pdf, sec
> > > > > > > 4.1.1, says "reg" is mandatory for PCI Child Nodes, and the first
> > > > > > > entry must be the config space address (bus/device/function).
> > > > > > > 
> > > > > > > I suppose maybe the BDF is needed to associate the properties with the
> > > > > > > correct device, and if the OS were to reprogram the bridge secondary
> > > > > > > bus number, it would have to remember the original value to preserve
> > > > > > > this association.  I don't think Linux *does* remember that, but it
> > > > > > > also generally leaves the bridge bus numbers alone.
> > > > > > 
> > > > > > Device drivers need to parse the properties defined in the device DT
> > > > > > node. And the only way to identify the node is by using its 'reg'
> > > > > > property which has the BDF identifier. This is common to other
> > > > > > busses where the device address is encoded in the 'reg' property.
> > > > > 
> > > > > Does this assume there is some firmware to configure these bridges
> > > > > before Linux boots?
> > > > 
> > > > No.
> > > > 
> > > > >  If bridges are completely unconfigured after
> > > > > power-on, their secondary and subordinate bus numbers will be zero, so
> > > > > a bus-range property for the bridge can only be an assumption about
> > > > > what Linux will do.
> > > > 
> > > > Secondary bus number for sure is not an assumption as it depends on
> > > > the hardware topology which linux would know from DT. But
> > > > subordinate number could be considered as an assumption.
> > > 
> > > If there's no firmware and the secondary bus number is 0 when Linux
> > > enumerates the bridge, does Linux know how to get the bus-range from
> > > DT and program the bridge's secondary bus?
> > 
> > Linux doesn't seem to make use of the secondary bus number from DT node of a
> > bridge, but there is no guarantee that other OSes making use of DT won't do.
> > 
> > > And does Linux know how to update the subordinate bus number in the
> > > case where several Root Ports specify 0xff in bus-range?
> > 
> > Same answer as above.
> 
> Let me back up; I don't think we're understanding each other.  This
> DT:
> 
>   pcie@0 {
>     bus-range = <0x01 0xff>;
> 
>     &pcieport0 {
>       wifi@0 {
> 	reg = <0x10000 0x0 0x0 0x0 0x0>;
> 
> says that wifi@0 is at 01:00.0, which is only true if the pcie@0
> secondary bus number is 01.  The power-up default is 00, so it's only
> 01 if either firmware or Linux has programmed it that way.
> 
> I claim this DT assumes the pcie@0 secondary bus number is programmed
> either by firmware or Linux.  This makes me a bit nervous because
> AFAIK there's nothing that guarantees Linux would choose bus 01.
> 

Why do you think so? PCI devices are scanned in a depth-first manner, so the
bus number should match the DT order. Like, while scanning the bus under pcie@0,
it should use 01 as the secondary bus number as it is going to be the first bus
after the root bus. I don't know how linux or any other OS would end up using a
different bus number.
 
Also, do note that the bus numbering also takes into account of the domain
number which is different for each controller instance.

Please let me know if my understanding is wrong.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

