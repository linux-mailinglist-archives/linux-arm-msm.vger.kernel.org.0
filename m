Return-Path: <linux-arm-msm+bounces-43318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 498949FC62E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Dec 2024 18:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15D8A1883271
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Dec 2024 17:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06D613B2AF;
	Wed, 25 Dec 2024 17:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="YJoq34KN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9801DA21;
	Wed, 25 Dec 2024 17:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735148961; cv=none; b=kvaLs82b2BxDAEy9rXCEYmVO+JUa0WES5y0wfzk28EbWwQ8/3563DFoXEf0BlCUQuFayIY3QUJvBPStm4ppUZBeVizsakejSxv68UL+kc/kHHq6Tk5FWV6hG6jF+Z1yPjte/iBx72kjqNC6okd/h0XXf54KxNRjnC1oiZJ13+Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735148961; c=relaxed/simple;
	bh=y5PYsydG1igDU8Yg8aoBFjC9tb+E0FuE8joHiUCAVdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rzOEfDsX8z5Q6tkeVNe22jhyU20aaKwhER76gyaiWSBFIU6v9He8YpKHZLMxMGM0hnwIJn+NkamvUuiiFIi3g6vQIt8MrbCfmZmClQ8yXxyQePhnKJzf0qNakeWQb2SWgZgZ8zNMGREmsFPcNDEeNP0FE0LzUA5wPeJkHw/WQx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=YJoq34KN; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7zaH4j7WopmuTe39LdIt9zVEEoEXcU6yeHbphF4jg2w=; b=YJoq34KNP2+1yE2R1bC3Z857m7
	rfpQM73OR8kzfsg3OVDTB601+xgq6RysfZwZduP/8V9OiO+ry/C+UX/EcJX4SWUU2NlAzz4fZ6eka
	GYSliQW+wBPLL91KDsIvnf250jzDQU+RDIJ+mxpPV9G5jipTdWl5MVD5lVdUuOQrfy84=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tQVVL-00GA3K-A7; Wed, 25 Dec 2024 18:49:07 +0100
Date: Wed, 25 Dec 2024 18:49:07 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] Support tuning the RX sampling swap of the MAC.
Message-ID: <6dcfdb0b-c1ec-49f7-927e-531b20264d68@lunn.ch>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>

On Wed, Dec 25, 2024 at 06:04:44PM +0800, Yijie Yang wrote:
> The Ethernet MAC requires precise sampling times at Rx, but signals on the
> Rx side after transmission on the board may vary due to different hardware
> layouts. The RGMII_CONFIG2_RX_PROG_SWAP can be used to switch the sampling
> occasion between the rising edge and falling edge of the clock to meet the
> sampling requirements.

The RGMII specification says that RD[3:0] pins are sampled on the
rising edge for bits 3:0 and falling edge for bits 7:4.

Given this is part of the standard, why would you want to do anything
else?

Is this maybe another symptom of having the RGMII delays messed up?

Anyway, i don't see a need for this property, unless you are working
with a PHY which breaks the RGMII standard, and has its clock
reversed?

	Andrew

