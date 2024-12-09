Return-Path: <linux-arm-msm+bounces-40937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FD19E8973
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 04:13:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A31251645FB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 03:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D9842070;
	Mon,  9 Dec 2024 03:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="K+jQJJsH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4947A42AA4;
	Mon,  9 Dec 2024 03:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733713999; cv=none; b=R7Kr6ITey1I+ZOc4z7SYbRMSse27xcymH5IHpgnz/9AsZPEX/BBuv3nH33ZCqaa/zLFtOK1xelIfi+6cXSZMr53doVFlS9asgq6HVY15Y7Esc4RFNOyC1m0QQf3pjX8J9RNN977lDwWuMXQnc3v0XJNl9M1Jd1H9/q/YqlNuy3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733713999; c=relaxed/simple;
	bh=mmGrFDAhdv3eTyd/mSMRyL+QMooMk1YbUbR+Efz7JAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oe4HPL7fmQjc4v4Ch+GfO1UVEkoCEKmmx+17Ra9DXArRPu8LbAZlseNL69laHBLOvysEg2MEiBphm9UWsrlCFL/tFK9NU87wLK+h+SsnQ4Y6l0QCBfSsvjItYvM+0S9zTp0hgp0Zwd5U+zSw1bADd8V4wwuBDSB9M0vkftLC6UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=K+jQJJsH; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=88hQB4j7kUiotkmkgkgByRkhQv0eIn7O2Y7qAPWY/ZU=; b=K+jQJJsHHuF3lBAjvZgqMSa3Bf
	Zhe9FMBv8V6ad4i7a05BBLuaXo9dgNylVUELZQU5DwjRug4JNe0OG/rAWMlndChKNHvTttLc67DUt
	9nbrqFbwVCrT8sq5GS/3Lmu2q8mrMqDRNBeyoazSbfqWLA3dyqjedDwLO389D7GFn4oc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tKUCr-00Fbvt-4J; Mon, 09 Dec 2024 04:13:09 +0100
Date: Mon, 9 Dec 2024 04:13:09 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs615-ride: Enable ethernet
 node
Message-ID: <4287c838-35b2-45bb-b4a2-e128b55ddbaf@lunn.ch>
References: <20241118-dts_qcs615-v2-0-e62b924a3cbd@quicinc.com>
 <20241118-dts_qcs615-v2-2-e62b924a3cbd@quicinc.com>
 <ececbbe1-07b3-4050-b3a4-3de9451ac7d7@lunn.ch>
 <89a4f120-6cfd-416d-ab55-f0bdf069d9ce@quicinc.com>
 <c2800557-225d-4fbd-83ee-d4b72eb587ce@oss.qualcomm.com>
 <3c69423e-ba80-487f-b585-1e4ffb4137b6@lunn.ch>
 <2556b02c-f884-40c2-a0d4-0c87da6e5332@quicinc.com>
 <75fb42cc-1cc5-4dd3-924c-e6fda4061f03@quicinc.com>
 <4a6a6697-a476-40f4-b700-09ef18e4ba22@lunn.ch>
 <441f37f5-3c33-4c62-b3fe-728b43669e29@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <441f37f5-3c33-4c62-b3fe-728b43669e29@quicinc.com>

On Mon, Dec 09, 2024 at 10:11:23AM +0800, Yijie Yang wrote:
> 
> 
> On 2024-11-29 23:29, Andrew Lunn wrote:
> > > I was mistaken earlier; it is actually the EMAC that will introduce a time
> > > skew by shifting the phase of the clock in 'rgmii' mode.
> > 
> > This is fine, but not the normal way we do this. The Linux preference
> > is that the PHY adds the delays. There are a few exceptions, boards
> > which have PHYs which cannot add delays. In that case the MAC adds the
> > delays. But this is pretty unusual.
> 
> After testing, it has been observed that modes other than 'rgmii' do not
> function properly due to the current configuration sequence in the driver
> code.

O.K, so now you need to find out why.

It not working probably suggests you are adding double delays, both in
the MAC and the PHY. Where the PHY driver add delays is generally easy
to see in the code. Just search for PHY_INTERFACE_MODE_RGMII_ID. For
the MAC driver you probably need to read the datasheet and find
registers which control the delay.

> > If you decided you want to be unusual and have the MAC add the delays,
> > it should not be hard coded. You need to look at phy-mode. Only add
> 
> Are you suggesting that 'rgmii' indicates the delay is introduced by the
> board rather than the EMAC?

Yes.

> But according to the
> Documentation/devicetree/bindings/net/ethernet-controller.yaml, this mode
> explicitly states that 'RX and TX delays are added by the MAC when
> required'. That is indeed my preference.

You need to be careful with context. If the board is not adding
delays, and you pass PHY_INTERFACE_MODE_RGMII to the PHY, the MAC must
be adding the delays, otherwise there will not be any delays, and it
will not work.

> > delays for rgmii-id. And you then need to mask the value passed to the
> > PHY, pass PHY_INTERFACE_MODE_RGMII, not PHY_INTERFACE_MODE_RGMII_ID,
> > so the PHY does not add delays as well.

	Andrew

