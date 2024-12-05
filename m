Return-Path: <linux-arm-msm+bounces-40452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E639E4F82
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 09:16:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AD761683F2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 08:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 730541D416B;
	Thu,  5 Dec 2024 08:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WIgPuRN4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362461D364C;
	Thu,  5 Dec 2024 08:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733386567; cv=none; b=j/aR3Pe4rzwdBmve8mGNdRZXaMYYlFqVqDIq2oYQWEXzIkXL3LmK4jCge4o59FmlPa3Ci0+Q/wfTzR8y7fC/3Y2MSwwOi8IplElNDNVsAUVM2DSe2RUZXMDjrgxDWPLkvXuVU1vLSe7aMf6UWp/8W9SC16obwGwd5/2cnJXXbk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733386567; c=relaxed/simple;
	bh=3FQdoGHbtK4vxVzpu1LkgtvENvTPq08yLxgUVs8oYPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMt7nWh3iHSQRX5vu0erW1to8CGj/6Etu8KcmQ0zAloI6hzSbsIWW59h+lFLAE4sbO4gZ+QcRECpP2Rm5ExxRHjXlCghTSaqM5rS/f0gDLpq6nEFa8rYQgMWsPJF2MIZQxT8/4mtiPPoNJlnReg+7nWha+5gWW/5O5QbgxX8aSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WIgPuRN4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A770FC4CEE1;
	Thu,  5 Dec 2024 08:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733386565;
	bh=3FQdoGHbtK4vxVzpu1LkgtvENvTPq08yLxgUVs8oYPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WIgPuRN4Xrn4bkadyn8DMZ/h9U0a9wSzY3HJyFpYa9fMErDpJhXWuK5tEdnuPwttX
	 vNNF7fxByZr7Kzh1eASsFa5nHv5yWVyuqm+4YxRXxxR7n6zFl+hUygtRpzK1ZMfPPv
	 YJmPFtytJInKofdzmnJWlzc1UVBpZA+sSpHGCYXKL36zGudTTEtLKHvcDaLBaJOVPc
	 IkrpmJ6BaiFkGyqBn/tlANtL/q2emfE+0pNNqupvwUozTQTttLRqTx4kVRvSO0OZtB
	 cgivhs/DQ/b4rTIaYHfMg/0lcOccEqXeRjEJZvBYDyMLdqVMxqw2HpWxvRYPQU+gT7
	 9X/aiHpEdGHeg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tJ71n-000000007QL-2hW1;
	Thu, 05 Dec 2024 09:16:04 +0100
Date: Thu, 5 Dec 2024 09:16:03 +0100
From: Johan Hovold <johan@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Abel Vesa <abel.vesa@linaro.org>,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: Add USB multiport
 fingerprint reader
Message-ID: <Z1FhQ3OUI0t3k1_q@hovoldconsulting.com>
References: <20241118-x1e80100-crd-fp-v1-0-ec6b553a2e53@linaro.org>
 <20241118-x1e80100-crd-fp-v1-1-ec6b553a2e53@linaro.org>
 <Z07bgH5vVk44zuEH@hovoldconsulting.com>
 <d095ae2a-3f9d-464c-9dc8-a3e73eac6598@oss.qualcomm.com>
 <98b2b88b-9690-44a7-9b22-2f23e6606e82@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98b2b88b-9690-44a7-9b22-2f23e6606e82@oss.qualcomm.com>

On Thu, Dec 05, 2024 at 01:32:29PM +0530, Krishna Kurapati wrote:
> On 12/3/2024 6:45 PM, Krishna Kurapati wrote:
> > On 12/3/2024 3:50 PM, Johan Hovold wrote:
> >> On Mon, Nov 18, 2024 at 11:34:29AM +0100, Stephan Gerhold wrote:

> >>> +&usb_mp_dwc3 {
> >>> +    /* Limit to USB 2.0 and single port */
> >>> +    maximum-speed = "high-speed";
> >>> +    phys = <&usb_mp_hsphy1>;
> >>> +    phy-names = "usb2-1";
> >>> +};
> >>
> >> The dwc3 driver determines (and acts on) the number of ports based on
> >> the port interrupts in DT and controller capabilities.
> >>
> >> I'm not sure we can (should) just drop the other HS PHY and the SS PHYs
> >> that would still be there in the SoC (possibly initialised by the boot
> >> firmware).
> > 
> > The DWC3 core driver identifies number of ports based on xHCI registers. 
> > The QC Wrapper reads this number via interrupts. But these two values 
> > are independent of each other. The core driver uses these values to 
> > identify and manipulate phys. Even if only one HS is given in multiport 
> > it would be sufficient if the name is "usb2-1". If the others are 
> > missing, those phys would be read by driver as NULL and any ops to phys 
> > would be NOP.

No, the core driver still acts on these ports (to some extent) even if
there is no PHY specified (e.g. updates DWC3_GUSB2PHYCFG on suspend).

And IIRC I even had to specify more than just the fingerprint reader PHY
on the X13s to get it to enumerate. I never had time to fully determine
why this was the case though.

> However do we need to reduce the number of interrupts used in DTS ?
> We don't need to give all interrupts as there is only one port present.
> We don't want to enable all interrupts when ports are not exposed.

No, the interrupts are still there, wired up in the SoC, so we should
not change that.

With runtime PM eventually enabled and working as it should, the OS
should be able to power down any unused ports. And we could also
consider marking some ports as not physically accessible and not
connected as a further hint to the OS that they can be disabled even
sooner.

Johan

