Return-Path: <linux-arm-msm+bounces-45116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA35A12146
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 11:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEE6B168A5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 10:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E612248BDE;
	Wed, 15 Jan 2025 10:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yZSyE5CA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AF91E7C02
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 10:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736938490; cv=none; b=Q7ZVtaXiGD6KX8rQ0brGlMzFAnYXGTF3i737Uzrf6oxZfsPYjt8UeBHz3dNno4v93jEVN8KL6dYYCZOKnyzVfV0AUzLxInVe91LMQljoAlOxNuMwc3SkaS1xmlDhNoHLvKfblD2GXflVnDyx7krIt3wlaoGkXDO2IouoUd5w10M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736938490; c=relaxed/simple;
	bh=evSVf9A8RAMJFID55PVqbvdXrYIaH+IlNw8I/KeFD5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PmOaCrg7hN5/NvRSut7etR95osiM2GuTjj5s6wCMFYAnZ9E8Y2bjv/4JQ8vDqLhW7FyKULAZ1K69ft8P/3eiKhT34UW52vLtvzcgciZLlIeE7j7Y7d0sVNaxK/hc/RaQ6//zuEE/F2VQyOxUSLxeB1KX6H7g3fhvkKGf3Y9oX1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yZSyE5CA; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-216426b0865so115437585ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 02:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736938488; x=1737543288; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uLShVIQL/QTp6sJ0A6x0KhG3HT/hVJ8Re2oAFX3+03k=;
        b=yZSyE5CA+H74HUcjBotdxxeQMz/eMs40yohHngdt0yEHR4XdPAp+lGjz6efyhBac+q
         u2HjqMM81V9ocYaYjbNvMHvbs4IO64WEGlyOZCcAWoba/2XEqLSOnq28R59+/E7OYWAq
         HFdvfiQg+0V57C0/6HwFi4IdyxWqkoRtKf7ktn2kfuOptJjf6SVtmXYd3OpIFKDfuVVJ
         bVIJpRF9dIH6lmPY0Gsj+koUwatbgljOr30NiYZ/Vr6GTmY0aKaOAThRgwV5kVLSoYnw
         XNYtdQQ6IiOdG4XsAHRS203Xq5mB0cUsD4pS2g81sRsIJOgJmKFeMTUhWHU9rwpDOrZM
         dqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736938488; x=1737543288;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uLShVIQL/QTp6sJ0A6x0KhG3HT/hVJ8Re2oAFX3+03k=;
        b=EqAZxcHkefP8+55LkPZ2sxAAhMJ1Jeth8ZM3mnZArPmqHNKdK3VVGTNfkEvdmYGI+K
         q/PUTMNCFhUs7MMQbPFYT3BNW0Yd6tYYx3w/He23Dlp/iTh8qCyrc77IZXYKzsDEY+tK
         ohHQc2greXQY9V3HxBdAEZ8ml/6ZcbmdYHHpz/3o8XSqf+ga6rLQqd78SGCWO7LQA9Ma
         5RErw8IMS6G/9a3hk9ECFbCS+YR3UvmVu10ED/XWHvWvzaLvYnigxZPsAjOXKmL0TM5E
         7bhaZqZQxhNgQkFT/G5IZN7CkRLdboP2tcnRE7gWbqK1Hm+wHBDd5azQrjEsLTPtTxIX
         cmWg==
X-Forwarded-Encrypted: i=1; AJvYcCX0ezXJk0fwQ3T8SWotTb770qxvt1e2YSdKRuiRGazD8h83c1Wl7ejo59QmYTo5/qDYGLGm5WSuwnHsbVQd@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq/A37uuganyrGEKuh54PyAAjI28UDayj9LZO/pgFLU2zr/4Qr
	49wglXAGAbSoJkqi/6xW4zbdlK0MTvRN63R5f2BC9QR8S57a2Z37twilssrn1w==
X-Gm-Gg: ASbGncuEXwp78z67QO64SidtJONeB3UTE2zbXicgrJP5B52uLSwM3HOs9p74cGlD/ea
	YQzomCsHhka1YNCPd2dsJLoUx//GKAQKxzfrUC/niaxq7JvwyGQKeU9EAVI/MLNkxetCRyYjxbZ
	s4ygnz0F5wknfUFLTkelspnDDi+6BQRMLNJujZBIpx8I2xBc3Ucy9uQbEaIJ5T5T+GRfy3YwBuD
	76TG2LamwHfASXCkGb8pLjsnP7Lo5y187XVEHNk04qbDODssTSz8XgqGKY1Nl05W3k=
X-Google-Smtp-Source: AGHT+IEROJu6RiYDzk2wsYnV9ElHsGb48DA5kHvABhWQg6HYAKDSUAP/J/ns9UtNQZDxdOFdWZefew==
X-Received: by 2002:a05:6a21:2d85:b0:1e1:bd5b:b82a with SMTP id adf61e73a8af0-1e88d0ddc13mr46860273637.40.1736938487775;
        Wed, 15 Jan 2025 02:54:47 -0800 (PST)
Received: from thinkpad ([120.60.139.68])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31d5047e79sm9551531a12.53.2025.01.15.02.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 02:54:47 -0800 (PST)
Date: Wed, 15 Jan 2025 16:24:31 +0530
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
Message-ID: <20250115105431.gw34xgta2lmgjqva@thinkpad>
References: <20250105101612.t6c4pw5uxhb5rdde@thinkpad>
 <20250106230705.GA132316@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250106230705.GA132316@bhelgaas>

On Mon, Jan 06, 2025 at 05:07:05PM -0600, Bjorn Helgaas wrote:
> [+cc Nícolas]
> 
> On Sun, Jan 05, 2025 at 03:46:12PM +0530, Manivannan Sadhasivam wrote:
> > On Fri, Jan 03, 2025 at 03:05:31PM -0600, Bjorn Helgaas wrote:
> > > On Thu, Mar 21, 2024 at 04:46:21PM +0530, Manivannan Sadhasivam wrote:
> > > > On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
> > > > for each controller instance. Hence, add a node to represent the bridge.
> > > > 
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/sm8250.dtsi | 30 ++++++++++++++++++++++++++++++
> > > >  1 file changed, 30 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > > index 39bd8f0eba1e..fe5485256b22 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > > @@ -2203,6 +2203,16 @@ pcie0: pcie@1c00000 {
> > > >  			dma-coherent;
> > > >  
> > > >  			status = "disabled";
> > > > +
> > > > +			pcie@0 {
> > > > +				device_type = "pci";
> > > > +				reg = <0x0 0x0 0x0 0x0 0x0>;
> > > > +				bus-range = <0x01 0xff>;
> > > 
> > > Hi Mani, most or all of the patches in this series add this
> > > "bus-range" property.  IIUC, these are all Root Ports and hence the
> > > secondary/subordinate bus numbers should be programmable.
> > 
> > Right. It is not a functional dependency.
> > 
> > > If that's the case, I don't think we need to include "bus-range" in DT
> > > for them, do we?
> > 
> > We mostly include it to silence the below bindings check for the
> > endpoint device node:
> > 
> > Warning (pci_device_bus_num): /soc@0/pcie@1c00000/pcie@0/wifi@0: PCI bus number 1 out of range, expected (0 - 0)
> > 
> > DTC check is happy if the 'bus-range' property is absent in the
> > bridge node. But while validating the endpoint node (if defined), it
> > currently relies on the parent 'bus-range' property to verify the
> > bus number provided in the endpoint 'reg' property.
> > 
> > I don't know else the check can verify the correctness of the
> > endpoint bus number. So deferring to Rob here.
> 
> I should know more about how this works in DT, but I don't.
> 
> I guess https://git.kernel.org/linus/83d2a0a1e2b9 ("arm64: dts: qcom:
> sm8250: Add PCIe bridge node") added this (subsequently renamed to
> "pcieport0"):
> 
>   +			pcie@0 {
>   +				device_type = "pci";
>   +				reg = <0x0 0x0 0x0 0x0 0x0>;
>   +				bus-range = <0x01 0xff>;
> 
> which is used at places like
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts?id=v6.12#n788:
> 
>   &pcieport0 {
> 	  wifi@0 {
> 		  compatible = "pci17cb,1101";
> 		  reg = <0x10000 0x0 0x0 0x0 0x0>;
> 
> Based on
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pci/pci.txt?id=v6.12#n46
> (which is written for Root Ports and Switch Ports, but presumably
> applies to endpoints like wifi as well), "reg" contains the device's
> bus/device/function:
> 
>   - reg:
>      Identifies the PCI-PCI bridge. As defined in the IEEE Std 1275-1994
>      document, it is a five-cell address encoded as (phys.hi phys.mid
>      phys.lo size.hi size.lo). phys.hi should contain the device's BDF as
>      0b00000000 bbbbbbbb dddddfff 00000000. The other cells should be zero.
> 
> So 0x10000 would decode to 01:00.0, which matches the <1 1> bus-range.
> 
> I don't know the reason for requiring the BDF there, but the venerable
> https://www.devicetree.org/open-firmware/bindings/pci/pci2_1.pdf, sec
> 4.1.1, says "reg" is mandatory for PCI Child Nodes, and the first
> entry must be the config space address (bus/device/function).
> 
> I suppose maybe the BDF is needed to associate the properties with the
> correct device, and if the OS were to reprogram the bridge secondary
> bus number, it would have to remember the original value to preserve
> this association.  I don't think Linux *does* remember that, but it
> also generally leaves the bridge bus numbers alone.
> 

Device drivers need to parse the properties defined in the device DT node. And
the only way to identify the node is by using its 'reg' property which has the
BDF identifier. This is common to other busses where the device address is
encoded in the 'reg' property.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

