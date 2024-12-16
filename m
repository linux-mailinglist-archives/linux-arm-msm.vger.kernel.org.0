Return-Path: <linux-arm-msm+bounces-42318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5565B9F2CC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 10:19:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B460188772B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 09:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E445201010;
	Mon, 16 Dec 2024 09:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="03ecwsz7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77EE20010B;
	Mon, 16 Dec 2024 09:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734340751; cv=none; b=BuPBI/WGGt2TqxheRDa6h919wJyTL7Krt4H3O7YS9Ky9E1hMdbRg2xqp7oSdR0w1qi20GtdjZ61F0Nd4v+GXOXHQKQEkrladet5mwoH2u6f4M/rnpC6c1J15KNOXx8DntQiznmfpcmPkAIx8AVrXTpM98iJ39pXSLw+uWywZta4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734340751; c=relaxed/simple;
	bh=cyEI7rFX85L6elnZUT3sj/WFOyqbLN8x/KoYfojfZUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WLsQA1f5UJfa3PzhGyDsWLd9AQhx8B67vYedSCC9AEsj2ICXHsh4y9KKmqmHjzamjoMQjtRu1zEb3wyhkVRlzSGyCnnpC6AqhnzaNBa4/ApZ9C1v3QbAL7aocLjyc0IT/T9GbUS/QVwKVkBRRrOf6cd4AxdOE7Hak1BCX27Z33U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=03ecwsz7; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lTFZBDDysFLH9aKcaryinIw7pth5qOCs3251eTEudKs=; b=03ecwsz775H10xbhcCRZCyOC+i
	7NrIvILrpeWzt1xTGlJM6tSqLuac3WsyFjSjI1wjVzKKsUylkDimD/sBHD7J2u3Xc7hb/LbVN6xKi
	GzmvnfiB7VwnXUSQWBT8c/xUj339q4T0YjAJkyZ1lh5CvtT39tfnGeQy8Ki5LWHFaClk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tN7Fe-000ZU7-JK; Mon, 16 Dec 2024 10:18:54 +0100
Date: Mon, 16 Dec 2024 10:18:54 +0100
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
Message-ID: <174bd1a3-9faf-4850-b341-4a4cce1811cb@lunn.ch>
References: <c2800557-225d-4fbd-83ee-d4b72eb587ce@oss.qualcomm.com>
 <3c69423e-ba80-487f-b585-1e4ffb4137b6@lunn.ch>
 <2556b02c-f884-40c2-a0d4-0c87da6e5332@quicinc.com>
 <75fb42cc-1cc5-4dd3-924c-e6fda4061f03@quicinc.com>
 <4a6a6697-a476-40f4-b700-09ef18e4ba22@lunn.ch>
 <441f37f5-3c33-4c62-b3fe-728b43669e29@quicinc.com>
 <4287c838-35b2-45bb-b4a2-e128b55ddbaf@lunn.ch>
 <2e518360-be24-45d8-914d-1045c6771620@quicinc.com>
 <31a87bd9-4ffb-4d5a-a77b-7411234f1a03@lunn.ch>
 <581776bc-f3bc-44c1-b7c0-4c2e637fcd67@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <581776bc-f3bc-44c1-b7c0-4c2e637fcd67@quicinc.com>

> I intend to follow these steps. Could you please check if they are correct?
> 1. Add a new flag in DTS to inform the MAC driver to include the delay when
> configured with 'rgmii-id'. Without this flag, the MAC driver will not be
> aware of the need for the delay.

Why do you need this flag?

If the phy-mode is rgmii-id, either the MAC or the PHY needs to add
the delay.

The MAC driver gets to see phy-mode first. If it wants to add the
delay, it can, but it needs to mask out the delays before passing
phy-mode to the PHY. If the MAC driver does not want to add the
delays, pass phy-mode as is the PHY, and it will add the delays.

There is nothing special here, every MAC/PHY pair does this, without
needing additional properties.

	Andrew

