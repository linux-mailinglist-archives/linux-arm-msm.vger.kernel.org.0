Return-Path: <linux-arm-msm+bounces-43701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D139FECEC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 06:10:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8EA21882865
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 05:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9FA21552FC;
	Tue, 31 Dec 2024 05:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="dFRB7LdF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4A07BAEC;
	Tue, 31 Dec 2024 05:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735621823; cv=none; b=ion4mAiyaWt0Y0+wSt/ctQ3stMvSTKnuj58QrqyEnYMstKMHMopPyI8dXLC55kUC/gVqixo740vZThgFM6koY2b2ROm42iouVTautbYskocXgb0THhs2yjzBJLLzyOFzIzbUvIBDOvEb+AGI5GXq7uM0oJPbf7Kk8eMTL7Hczmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735621823; c=relaxed/simple;
	bh=ZkNvSHhenb3SM3Z5KwDWR53tKOXT7ezmzkg0QP1EbEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBnjiL4pewT7v3IogSV16DBSOpvwkoVRbdu4nziEeVAoRXHIIlb+cl0s7xVy0XmFzDIiWCPk5VomZR9rP+PjW2stiLQZ0vlpJ/8K9dEAXmBWqpeOLdmJBzyAJ8PfroRnOroNCglfs456nMB1eaoEJQ3za93Fy3T56BRCVsvuCiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=dFRB7LdF; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hEIr7uKQr/8GkDDoxG9e26ThDBwdEqVjueY03fe5/JI=; b=dFRB7LdFj4z0+/+bES7lzBuS+j
	ZQx7zFEhWZs3Ow4UimMfsoXiBUHNAWdF5fcNutvEA58bqDOGUf3uygFLmcRluv6XoUiGfKU14ouJA
	yW5m0tBwScWjakiRTKjhJznlh0BEhGDwFTX2szWi6A2jnHkOIm81T/w3xMMev2c7E97U=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tSUWF-0008RM-Gb; Tue, 31 Dec 2024 06:10:15 +0100
Date: Tue, 31 Dec 2024 06:10:15 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Wasim Nazir <quic_wasimn@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@quicinc.com
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: Add support for QCS9075 Ride &
 Ride-r3
Message-ID: <f44b98c2-a0b5-4aec-a84e-683d4576a70e@lunn.ch>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-6-quic_wasimn@quicinc.com>
 <7de40e71-e2e5-49fd-93a3-245afdef8188@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7de40e71-e2e5-49fd-93a3-245afdef8188@oss.qualcomm.com>

> > +&ethernet0 {
> > +	phy-mode = "2500base-x";
> > +};
> > +
> > +&ethernet1 {
> > +	phy-mode = "2500base-x";
> > +};
> > +
> > +&mdio {
> > +	compatible = "snps,dwmac-mdio";
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +
> > +	sgmii_phy0: phy@8 {
> > +		compatible = "ethernet-phy-id31c3.1c33";
> > +		reg = <0x8>;
> > +		device_type = "ethernet-phy";
> > +		interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
> > +		reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
> > +		reset-assert-us = <11000>;
> > +		reset-deassert-us = <70000>;
> > +	};
> > +
> > +	sgmii_phy1: phy@0 {

SGMII is 10/100/1000. You have a phy-mode of 2500base-x, which is only
2500. So calling this sgmii_phy is wrong. Just call it phy1: phy@0.

	Andrew

