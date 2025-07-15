Return-Path: <linux-arm-msm+bounces-65103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF48DB068E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 23:59:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06E5656582D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 21:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30D92C158D;
	Tue, 15 Jul 2025 21:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kIChHQip"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9604E2BEC59;
	Tue, 15 Jul 2025 21:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752616766; cv=none; b=Y+C18sxogYgVAeoWtoXlk6M1dA0iNQgTSm7Qghq+eI0XrLOWHSLY6j9aWivKRFhLQxkMMBxntWfJg6IT65Gml9rTcYKBobagESYaJ6vrbKY/0u1tLgS1b9cedWMrYu/32m/03UAz4gstRRgHkXCo4A9CDYDloEdh3Vm9V1BWVfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752616766; c=relaxed/simple;
	bh=N9jjdpE0NCKGhFiG+0EPBEYGW5wRusUBEHZWfy3k6IQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RLwKtUtzhtXnK6Uhn8LZa7XQd07+y5EAIPUk+VU1R4KRCy7uf4cK9nzHi//gZm4DZrAJG51LQekNAe7CasT1tZekp0I/8nXI5GKkq9c2J6/68P11mSxaEG29xWGkAOMcZS2CLUAOZLrpSYEikfVJ839KwnBtguPLubaN93OwKaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kIChHQip; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 121ECC4CEE3;
	Tue, 15 Jul 2025 21:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752616766;
	bh=N9jjdpE0NCKGhFiG+0EPBEYGW5wRusUBEHZWfy3k6IQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kIChHQip3Umr7rsQsoecE/9m8ciNv9ay1Y/DEufvNkCNYnXGm5dJCMFWpHjZZ28/2
	 YgRTIOyeximpUzRK2z/8olSuAFQoyc4Ze//SPTEFVpyaHJqc4dwrZ9IaXO/0LV90jZ
	 tATnqAK5aQ/RH8POJToVQQA7q8edMB7rtug/5SgrlOPrw9cvBCiPNqzAxywK2Ahusj
	 T/tY+PdnczBJEVD0tN29ACKbWOW53wRgeupn1UQP8xUjdi3Rbm9tPaTVKkaSH6me/9
	 v0dNdVq4o5wnOLbjFbuQhYco20MhrloY+efRZ3njXSMUVtnkCk+UfhYmfQhmYYMzPb
	 Tm74VwxWaUsnQ==
Date: Tue, 15 Jul 2025 16:59:25 -0500
From: Rob Herring <robh@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/21] arm64: dts: qcom: sm8250: Add PCIe bridge node
Message-ID: <20250715215925.GA2084021-robh@kernel.org>
References: <20240321-pcie-qcom-bridge-dts-v2-1-1eb790c53e43@linaro.org>
 <20250103210531.GA3252@bhelgaas>
 <20250105101612.t6c4pw5uxhb5rdde@thinkpad>
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

On Sun, Jan 05, 2025 at 03:46:12PM +0530, Manivannan Sadhasivam wrote:
> Hi Bjorn,
> 
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
> > 
> 
> Right. It is not a functional dependency.
> 
> > If that's the case, I don't think we need to include "bus-range" in DT
> > for them, do we?
> > 
> 
> We mostly include it to silence the below bindings check for the endpoint device
> node:
> 
> Warning (pci_device_bus_num): /soc@0/pcie@1c00000/pcie@0/wifi@0: PCI bus number 1 out of range, expected (0 - 0)

The mistake is using bus number 1 instead of 0.

> DTC check is happy if the 'bus-range' property is absent in the bridge node. But
> while validating the endpoint node (if defined), it currently relies on the
> parent 'bus-range' property to verify the bus number provided in the endpoint
> 'reg' property.
> 
> I don't know else the check can verify the correctness of the endpoint bus
> number. So deferring to Rob here.

Sorry I'm late to the party, but found this from another thread 
today[1]. More details there.

You should not have 'bus-range' at all in your DT and the bus for every 
BDF address should be 0. You only need 'bus-range' if your h/w is 
broken.

Rob

[1] https://lore.kernel.org/all/CAL_Jsq+z+5_=YXiyCW1sbKDe0cjGNG7Qk=uRQ3efAFTd1J2ayQ@mail.gmail.com/

> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

