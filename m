Return-Path: <linux-arm-msm+bounces-38849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 688B99D5FA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 14:19:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05A291F22151
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 13:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287481DE2BD;
	Fri, 22 Nov 2024 13:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="5MnakZMB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3251632C2;
	Fri, 22 Nov 2024 13:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732281589; cv=none; b=mMuIHJbMdTZNGshOdNrTacPVOEvg/UikmqdU5X3hMkxTH66Hw4Qwa1pS/uI0PWSw2t+k9CirRRcnWD2CK7JNr9k9gLsDzHn5dP5GCZJ6ejD/a1y53slQdirl3I8MxVJk4VFpY6bVo2SX2A1PBkx5DYhf0///58GoPwjhpJrDt1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732281589; c=relaxed/simple;
	bh=jZ6S1WK8YmZkVXiT9kTeI1z3ZyzV2vRLZ4LQj4aPOUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fXHpK0vHQ2Gmsbp6cJAVgTmmhrKBnV2dlNhetz0waAhJM1n3AFC6VNFXUPxcIfmngNfwSyjio4WLOPumcHgnIjOPLWzO+KaNYizMP4yeiTXN+ARMDRWxPNq8AgoI1YzBR02C8fMKU58WXC6GK13y2mCLzyytf7esAehCzaBChtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=5MnakZMB; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=eibJPlT+++EK0KY6sKsvkPD5fXWfg8lbgWv1SoyKd4c=; b=5M
	nakZMB+C0LHteb7UKXpBGXACC86WRgeHRU5jTGKz0Yt9bGNGQ2Mc6FBircag6xamWOijvICpJa6v4
	/2qp4bzT2ua6yT4tL5tlKUzEuOlBZzTkOYzC95Bvv+68b6lwILEfplMWVgGyfooiB9Dy1LnPnkl/b
	HoEvk/JwUoAwiEA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tETZV-00E8jb-KJ; Fri, 22 Nov 2024 14:19:41 +0100
Date: Fri, 22 Nov 2024 14:19:41 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Yijie Yang <quic_yijiyang@quicinc.com>,
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
Message-ID: <3c69423e-ba80-487f-b585-1e4ffb4137b6@lunn.ch>
References: <20241118-dts_qcs615-v2-0-e62b924a3cbd@quicinc.com>
 <20241118-dts_qcs615-v2-2-e62b924a3cbd@quicinc.com>
 <ececbbe1-07b3-4050-b3a4-3de9451ac7d7@lunn.ch>
 <89a4f120-6cfd-416d-ab55-f0bdf069d9ce@quicinc.com>
 <c2800557-225d-4fbd-83ee-d4b72eb587ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c2800557-225d-4fbd-83ee-d4b72eb587ce@oss.qualcomm.com>

> >>>   +&ethernet {
> >>> +    status = "okay";
> >>> +
> >>> +    pinctrl-0 = <&ethernet_defaults>;
> >>> +    pinctrl-names = "default";
> >>> +
> >>> +    phy-handle = <&rgmii_phy>;
> >>> +    phy-mode = "rgmii";
> >>
> >> That is unusual. Does the board have extra long clock lines?
> > 
> > Do you mean to imply that using RGMII mode is unusual? While the EMAC controller supports various modes, due to hardware design limitations, only RGMII mode can be effectively implemented.
> 
> Is that a board-specific issue, or something that concerns the SoC itself?

Lots of developers gets this wrong.... Searching the mainline list for
patchs getting it wrong and the explanation i have given in the past
might help.

The usual setting here is 'rgmmii-id', which means something needs to
insert a 2ns delay on the clock lines. This is not always true, a very
small number of boards use extra long clock likes on the PCB to add
the needed 2ns delay.

Now, if 'rgmii' does work, it means something else is broken
somewhere. I will let you find out what.

> >>> +    max-speed = <1000>;
> >>
> >> Why do you have this property? It is normally used to slow the MAC
> >> down because of issues at higher speeds.
> > 
> > According to the databoot, the EMAC in RGMII mode can support speeds of up to 1Gbps.
> 
> I believe the question Andrew is asking is "how is that effectively
> different from the default setting (omitting the property)?"

Correct. If there are no issues at higher speeds, you don't need
this. phylib will ask the PHY what it is capable of, and limit the
negotiated speeds to its capabilities. Occasionally you do see an
RGMII PHY connected to a MII MAC, because a RGMII PHY is cheaper...

	Andrew

