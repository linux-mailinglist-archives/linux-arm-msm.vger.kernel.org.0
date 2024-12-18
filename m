Return-Path: <linux-arm-msm+bounces-42691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C86A99F6BA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 17:58:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82A06189108C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 16:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 288311F8909;
	Wed, 18 Dec 2024 16:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="DjJl4g8W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC4E1F76C4;
	Wed, 18 Dec 2024 16:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734541076; cv=none; b=Ug8K+XleqTHDehPji2rPuRhIx0zOJKINnwXZ4L3g5gENB1YMqQh4NoEsulGjL8h9AJ6dm9mUZnElNdM61X1TPBBGl6N/VWJvFZwto/xxRQZysy3T9Xz9RIzhlhJmdpiwS4n5N8oZOjLkxpjakUBJusSbSbTez71Z8FBAznT6z2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734541076; c=relaxed/simple;
	bh=KV8ou//Sa6v3jLTAYIJ9bJcbxMO3+EDoGYPwxAHxI/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=njqsi56Vw0uL3KX6+pqGC3kTg/1UpvwpPPuTrh8kbaY7jdn+csVtHmXNUWRMeceC96byLHT4IIRGICQgPHrukBXCk+0uHjiSL11VPOIc6b0IjJJQ6yeMpHKC9nYB/mtCEIOg0sCb7Z76Mv77ZtI0rAiT3tmG2nnJ25Py4yMysx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=DjJl4g8W; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=/4crNdIxVVaUUjGou9fiNxKR1h+u/fftUOeCRlzjhXo=; b=DjJl4g8WqzlEX8kt+gIn+DeK1o
	k2ynJY9DxnnNia07FbZuXcsgYXTZfWDd/9RNJ45aZESIqeK2xmJsl4bsjRubIMBO0o6TEiGiTItTV
	E3RTaHpW4uDWXbCsDjA3If2p2LcRGvH69nEnJaJrBf89fq9y+UlxC+NoLyrmZwsQU+Sg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tNxMo-001L2B-IE; Wed, 18 Dec 2024 17:57:46 +0100
Date: Wed, 18 Dec 2024 17:57:46 +0100
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
Message-ID: <2b6cd2b8-1738-4131-abfe-4ab35de70c8d@lunn.ch>
References: <4a6a6697-a476-40f4-b700-09ef18e4ba22@lunn.ch>
 <441f37f5-3c33-4c62-b3fe-728b43669e29@quicinc.com>
 <4287c838-35b2-45bb-b4a2-e128b55ddbaf@lunn.ch>
 <2e518360-be24-45d8-914d-1045c6771620@quicinc.com>
 <31a87bd9-4ffb-4d5a-a77b-7411234f1a03@lunn.ch>
 <581776bc-f3bc-44c1-b7c0-4c2e637fcd67@quicinc.com>
 <174bd1a3-9faf-4850-b341-4a4cce1811cb@lunn.ch>
 <d711ee4b-b315-4d34-86a6-1f1e2d39fc8d@quicinc.com>
 <8acf4557-ac10-43f1-b1ab-7ae63f64401f@lunn.ch>
 <aa1dcdf6-94a0-4922-83f0-3cf49516ac4f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa1dcdf6-94a0-4922-83f0-3cf49516ac4f@quicinc.com>

> Okay, I will follow your instructions:
> 1. Change the phy-mode to 'rgmii-id'.
> 2. Add the delay in the MAC driver.
> 3. Mask the phy-mode before passing it to the PHY.

Good.

> 
> > 
> > But i assume Qualcomm RDKs always make use of a Qualcomm PHY, there is
> > special pricing if you use the combination, so there is probably
> > little incentive to use somebody elses PHY. And i assume you can
> > quickly check all Qualcomm PHYs support RGMII delays. PHYs which don't
> > support RGMII delays are very rare, it just happened that one vendors
> > RDK happened to use one, so they ended up with delays in the MAC being
> > standard for their boards.
> > 
> 
> Most Qualcomm MAC applications are actually paired with a third-party PHY.

I'm not sure the QCA8K, IPC and old Atheros people would agree with
you.

But since you don't have any behaviour change, you are not asking the
PHY to insert the delays, you should be safe in your part of the
Qualcomm world.

	Andrew

