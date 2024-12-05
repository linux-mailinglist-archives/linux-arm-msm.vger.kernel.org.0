Return-Path: <linux-arm-msm+bounces-40628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0279E616F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 00:39:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BEB116960C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 23:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A4EC1CD1E1;
	Thu,  5 Dec 2024 23:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="KZK2RFb8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83C91BC063;
	Thu,  5 Dec 2024 23:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733441987; cv=none; b=mXAO4WQ67l/i89w0zQYYgNXNbuouhcbxc6y8ntW5XPLyaabqjkS7RyBZtclnxHPFUsCYtU9cV2w2+vjGhUj4ESOv5go/5cu106Dczhaxworut3CvJjwIRpfzZuVN0VaSQ5SY+aJ74X1JAO7kfPxr1uztvpHX7d5n6duCysAsXBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733441987; c=relaxed/simple;
	bh=oATKnakeOFi/nx9dJZuUUi139Z5LG34N6tAA2sMx800=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGyPej1DXfnfL8ivVEe++7kU+GwQMMU/b3hY92smizOwHGcU33mP7mk6wN5F1dMoDiz4BBVixpk04HQEpiBZ6rgNIv5UY7B8C3MAI7QEyBiWPjnQVEdBau9j3pk4cIqEnBqKav+6R9/U5K02Q/xodCwc4q6RFt6Wb4OaWf03nHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=KZK2RFb8; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ENHBVGpjChQGrf+L4Tqrx2CiudDyXogItlyYZLjOoyk=; b=KZK2RFb8Uu4RCI+AzQHNtC8yp6
	U7eN1Bu3foamnypjPSliuGtDJ+iPTMJSx8ori4OCNH8ePhg8W3jF3AoUsW//1YxvNiOViABSuqdBo
	7EbEnjFEdhWds7qFt74UYW7Rrd8nT91lv6GjS4r0Hn91jrtEdFChhpePasPc8536eyx8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tJLRT-00FMfw-Gi; Fri, 06 Dec 2024 00:39:31 +0100
Date: Fri, 6 Dec 2024 00:39:31 +0100
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
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs8300-ride: enable ethernet0
Message-ID: <4ecd23e2-0975-47cb-a1ea-ef0be25c93c6@lunn.ch>
References: <20241123-dts_qcs8300-v4-0-b10b8ac634a9@quicinc.com>
 <20241123-dts_qcs8300-v4-2-b10b8ac634a9@quicinc.com>
 <cbd696c0-3b25-438b-a279-a4263308323a@lunn.ch>
 <14682c2b-c0bc-4347-bcf2-9e4b243969a7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14682c2b-c0bc-4347-bcf2-9e4b243969a7@oss.qualcomm.com>

> >> +&ethernet0 {
> >> +	phy-mode = "2500base-x";
> >> +	phy-handle = <&sgmii_phy0>;
> > 
> > Nit picking, but your PHY clearly is not an SGMII PHY if it is using
> > 2500base-x. I would call it just phy0, so avoiding using SGMII
> > wrongly, which most vendors do use the name SGMII wrongly.
> 
> Andrew, does that mean the rest of the patch looks ok?
> 
> If so, I don't have any concerns either.

Yes, this is a minor problem, the rest looks O.K, so once this is
fixed it can be merged.

	Andrew

