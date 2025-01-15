Return-Path: <linux-arm-msm+bounces-45150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C7714A12A57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 18:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 163AF7A035D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 17:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D561C4A1C;
	Wed, 15 Jan 2025 17:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QeH99s6q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB845223
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 17:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736963966; cv=none; b=Y7KfaGyM6aGDk1HpE/DHOKiW8nIeU953Z+xUttxb1Zdbt556nRrjYkRHl8RAyaiGUMPkrd/fl1tH1UfMv1ayvAXOKjbcLwsfIpjdRLQLqao4Dm5beoT9gIcTF9zCahPmTkybJbLvzfqAuB0mSjqf0d0RgbwPfdzRfuhwiX5rcY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736963966; c=relaxed/simple;
	bh=0XF6AGXXrv4izUShp7bl3QhTzHJ8GeGT+h5WPgAX7Mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mbQXcfvVwi4ZE0/qdlVRqt4/SMuzsIK8ssEJaqxnE4ubTwzv4q28zA823Z15btWhUhpQB7Y2seyyWnJfVwLX+kU6X/GbEKQ2AiFCWzR9RYsq8UhUEejp21e28AJCa2wYGjWj3+yXE4NsjUKMXgq78PytvTHfpB06ZKxFS6iAfJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QeH99s6q; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ee8aa26415so168552a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 09:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736963964; x=1737568764; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8VJH4VFiRTn9OeLQPcwDEkCbtfq+0UgIn9jBAW5TE18=;
        b=QeH99s6qOvp53A384NHDYa3rtQN57BodKbIc3wCppWpYVuPu0Hj8VC/lReBWMH8xww
         ktKCNzIru/hOpQhz2lLTwbBCas6V1gQ6QbQQlw/HBHn1s/vcWZs/+yiL8bb3p+2gMzwN
         kvpNi0YXAI3W1W+cEO/ZaOJKZcQ9Sx2Z+cHst0++pl7jBWjYqd/htdfoaOq0VRBtH+MQ
         n5Oi8JoifnOVQc6nmJ0t3ZrIt7Z3gilrKI0HumrBdOnZc91IwhCE7R6BlZZuzoF83HYT
         khmgdSSLb2mgbpZ6AgfykUVN1Ui1q1IF43lgtp3Pn5iMx6Gn8qAifj7IE9RX3c5KsPBf
         oPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736963964; x=1737568764;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8VJH4VFiRTn9OeLQPcwDEkCbtfq+0UgIn9jBAW5TE18=;
        b=YgEB6MnBWbpXozQ0yy1pTB+CfibCq7Ijo6KFZLFC/JlKEVg78v6+jJIkEwI5E0ahYh
         Kjy27p7KWu4Xiy+fK+ZBmcshbkwQVs5K77J293w8tjjslAj/K35gDhauLjYpe8fqQln4
         yJd6JHVrj9PioxcB/Ikt5Wc04ZPDAbmwPoMSQapO43pj7Ota3V2MnhOiLRdKI6oAGoPa
         2K/m0IksT2iLfD97d0D6sYfdNH+QBv+KPmcVsSCjIMdD+axjSuEWcmelikFT/RIi8ZOC
         UB36jTL7c2v0MP7BrbUcW+gu3dS1NKKShwA/1ScvwJlB6Ur6TmwGruheaX5hqu1ffnwf
         4jSw==
X-Forwarded-Encrypted: i=1; AJvYcCWXob5CXzg5i2yESZvvj6m/P1vB7b8z5eMII0Q0qXUKM8cPDHnf1pXhrPCcoa28XnbLOrNDk3rzFEnBTqIG@vger.kernel.org
X-Gm-Message-State: AOJu0YynfHpfSVmuqynmSiET38rxTwgyAqdxZmchGPrbrqK1IRsFjUwM
	sl+E7D51DOZG8Q93oy9sc3P76LIfGl9hWRWOE6yHKkFkWOLaaUlKmJrDk6N2Lw==
X-Gm-Gg: ASbGncv4IqMMXykIRoZzVC5qkUy04Zn8nWRrkf6CmLEBD9JhHCY3qD2Jl9mQSHUMDNV
	9Oeu0QzPDgoNWmIdIvwf/Kd6ef9s6xu5LAXUcS1PXzpOWa1Ix/5MJuHvW4Ufgeu4gwtxRI8mbpf
	VC8obNPAQZz0TYktMMXglKMkFgFrXsK68jgxFnaZ6VXjiXpPIs+9nvaOkjKNVKl6MJ5NVaRhLvf
	W+5FT/BPX1cVE1pXcm5hOC/adWJlSRz5BRtOdDFp82KXCp6aHZNRvN28vlcIwG5LD8=
X-Google-Smtp-Source: AGHT+IE5blw3FMb3ljdd3kHkWkKmAdKfyBh5X8RTvU3lw1z6/+38ZRm9KrcHUA8urKiqj6wR/34VjA==
X-Received: by 2002:a17:90a:dfcb:b0:2ea:5054:6c49 with SMTP id 98e67ed59e1d1-2f548da510amr51438800a91.0.1736963963689;
        Wed, 15 Jan 2025 09:59:23 -0800 (PST)
Received: from thinkpad ([120.60.139.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c335093sm1672211a91.48.2025.01.15.09.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 09:59:23 -0800 (PST)
Date: Wed, 15 Jan 2025 23:29:18 +0530
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
Message-ID: <20250115175918.2isv2at337cfgvjd@thinkpad>
References: <20250115105431.gw34xgta2lmgjqva@thinkpad>
 <20250115174210.GA537839@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250115174210.GA537839@bhelgaas>

On Wed, Jan 15, 2025 at 11:42:10AM -0600, Bjorn Helgaas wrote:
> On Wed, Jan 15, 2025 at 04:24:31PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Jan 06, 2025 at 05:07:05PM -0600, Bjorn Helgaas wrote:
> > > On Sun, Jan 05, 2025 at 03:46:12PM +0530, Manivannan Sadhasivam wrote:
> > > > On Fri, Jan 03, 2025 at 03:05:31PM -0600, Bjorn Helgaas wrote:
> > > > > On Thu, Mar 21, 2024 at 04:46:21PM +0530, Manivannan Sadhasivam wrote:
> > > > > > On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
> > > > > > for each controller instance. Hence, add a node to represent the bridge.
> > > > > > 
> > > > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > > > ---
> > > > > >  arch/arm64/boot/dts/qcom/sm8250.dtsi | 30 ++++++++++++++++++++++++++++++
> > > > > >  1 file changed, 30 insertions(+)
> > > > > > 
> > > > > > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > > > > index 39bd8f0eba1e..fe5485256b22 100644
> > > > > > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > > > > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > > > > @@ -2203,6 +2203,16 @@ pcie0: pcie@1c00000 {
> > > > > >  			dma-coherent;
> > > > > >  
> > > > > >  			status = "disabled";
> > > > > > +
> > > > > > +			pcie@0 {
> > > > > > +				device_type = "pci";
> > > > > > +				reg = <0x0 0x0 0x0 0x0 0x0>;
> > > > > > +				bus-range = <0x01 0xff>;
> > > > > 
> > > > > Hi Mani, most or all of the patches in this series add this
> > > > > "bus-range" property.  IIUC, these are all Root Ports and hence the
> > > > > secondary/subordinate bus numbers should be programmable.
> > > > 
> > > > Right. It is not a functional dependency.
> > > > 
> > > > > If that's the case, I don't think we need to include "bus-range" in DT
> > > > > for them, do we?
> > > > 
> > > > We mostly include it to silence the below bindings check for the
> > > > endpoint device node:
> > > > 
> > > > Warning (pci_device_bus_num): /soc@0/pcie@1c00000/pcie@0/wifi@0: PCI bus number 1 out of range, expected (0 - 0)
> > > > 
> > > > DTC check is happy if the 'bus-range' property is absent in the
> > > > bridge node. But while validating the endpoint node (if defined), it
> > > > currently relies on the parent 'bus-range' property to verify the
> > > > bus number provided in the endpoint 'reg' property.
> > > > 
> > > > I don't know else the check can verify the correctness of the
> > > > endpoint bus number. So deferring to Rob here.
> > > 
> > > I should know more about how this works in DT, but I don't.
> > > 
> > > I guess https://git.kernel.org/linus/83d2a0a1e2b9 ("arm64: dts: qcom:
> > > sm8250: Add PCIe bridge node") added this (subsequently renamed to
> > > "pcieport0"):
> > > 
> > >   +			pcie@0 {
> > >   +				device_type = "pci";
> > >   +				reg = <0x0 0x0 0x0 0x0 0x0>;
> > >   +				bus-range = <0x01 0xff>;
> > > 
> > > which is used at places like
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts?id=v6.12#n788:
> > > 
> > >   &pcieport0 {
> > > 	  wifi@0 {
> > > 		  compatible = "pci17cb,1101";
> > > 		  reg = <0x10000 0x0 0x0 0x0 0x0>;
> > > 
> > > Based on
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pci/pci.txt?id=v6.12#n46
> > > (which is written for Root Ports and Switch Ports, but presumably
> > > applies to endpoints like wifi as well), "reg" contains the device's
> > > bus/device/function:
> > > 
> > >   - reg:
> > >      Identifies the PCI-PCI bridge. As defined in the IEEE Std 1275-1994
> > >      document, it is a five-cell address encoded as (phys.hi phys.mid
> > >      phys.lo size.hi size.lo). phys.hi should contain the device's BDF as
> > >      0b00000000 bbbbbbbb dddddfff 00000000. The other cells should be zero.
> > > 
> > > So 0x10000 would decode to 01:00.0, which matches the <1 1> bus-range.
> > > 
> > > I don't know the reason for requiring the BDF there, but the venerable
> > > https://www.devicetree.org/open-firmware/bindings/pci/pci2_1.pdf, sec
> > > 4.1.1, says "reg" is mandatory for PCI Child Nodes, and the first
> > > entry must be the config space address (bus/device/function).
> > > 
> > > I suppose maybe the BDF is needed to associate the properties with the
> > > correct device, and if the OS were to reprogram the bridge secondary
> > > bus number, it would have to remember the original value to preserve
> > > this association.  I don't think Linux *does* remember that, but it
> > > also generally leaves the bridge bus numbers alone.
> > 
> > Device drivers need to parse the properties defined in the device DT
> > node. And the only way to identify the node is by using its 'reg'
> > property which has the BDF identifier. This is common to other
> > busses where the device address is encoded in the 'reg' property.
> 
> Does this assume there is some firmware to configure these bridges
> before Linux boots?

No.

>  If bridges are completely unconfigured after
> power-on, their secondary and subordinate bus numbers will be zero, so
> a bus-range property for the bridge can only be an assumption about
> what Linux will do.
> 

Secondary bus number for sure is not an assumption as it depends on the hardware
topology which linux would know from DT. But subordinate number could be
considered as an assumption.

FWIW, DT is not tied to any OS. So linux assumption doesn't really matter even
though it is the most commonly used reference.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

