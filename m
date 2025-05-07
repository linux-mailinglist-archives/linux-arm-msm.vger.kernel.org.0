Return-Path: <linux-arm-msm+bounces-57164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FD0AAE2CC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 16:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53278188B7E9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 14:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8688B289E0A;
	Wed,  7 May 2025 14:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="lkIbSxKq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E869289839;
	Wed,  7 May 2025 14:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746627464; cv=none; b=azjWyjwGrGEUfF9VTZiKBteoR2SsY197zuQfe0TSdZ3KarDgGlzVYnX0d1lSPcxeJkr2VFO3eY8Gq9VuDkayPIskJubaeuEdCuRiqWz8403mI7W51xeDY+AJfEFCrqvtcwG1P39RLzmhSy/j3jO+pLnwJYWtSxD8N7mSnlJL42A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746627464; c=relaxed/simple;
	bh=PtB5Usi8xLaJmNGDACycIzyHJbkLqaznxmbCpeinUIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+c4ulPne4CBL5wCTCLKKrux7cetiJXtSkYMnSKBCEObU0Pd/3OXVo8isVMwrwQwco47LHbsIA3DG1+ZEcbJluN5vo5eJQkf7RHC5ap4xfgGnURGXSRKCiJwZM4/9tDLl72FuyYt4IZQWtvlHlE+Ykf5Jr51KneifxzILAyUNqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=lkIbSxKq; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=riPhI6Eapns1oW9Gn4OqspYK1Wq/yqbnDVBWZAn6+N8=; b=lkIbSxKqLABQ9AeH01kNU+Ma68
	D2Qc2irMyCeY79HtU6uyKbwy9YC2uBNN6XuJkfxzXiF7IXvaz7ddDFy4VlqK9JaYSN7o/mA9LEiM0
	JO6jfOniUqp8quI+9Z7OjGhmrJgow+qL/essHLdqatkcyaSOh/DLqaGSqaMfs1waDT08=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uCfac-00BtMw-8e; Wed, 07 May 2025 16:17:38 +0200
Date: Wed, 7 May 2025 16:17:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	kernel@quicinc.com, kernel@oss.qualcomm.com
Subject: Re: [PATCH 0/8] qcom: Refactor sa8775p/qcs9100 based ride boards
Message-ID: <d87d203c-cd81-43c6-8731-00ff564bbf2f@lunn.ch>
References: <20250507065116.353114-1-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507065116.353114-1-quic_wasimn@quicinc.com>

> Ethernet card:
>   - There are two variants of ethernet card each with different capabilities:
>     - [Ethernet-v1] card contains:
>       - 2x 1G RGMII phy, 2x 1G SGMII phy(enabled currently)
>       - Total 4 phy supported, only 2 phy are enabled and it is used in ride.
>     - [Ethernet-v2] card contains:
>       - 2x 1G RGMII phy, 2x 2.5G HSGMII(enabled currently) & 10G PCIe
>         based MAC+PHY controller
>       - Total 5 phy supported, only 2 phy are enabled and it is used
>         in ride-r3.
>   - Either [Ethernet-v1] or [Ethernet-v2] is connected to backplain
>     board via B2B connector.

Is it possible to identify the card, e.g. does it have an I2C EEPROM,
or some strapping resistors on the B2B bus?

I'm just wondering if DT overlays would be a better solution.

	Andrew

