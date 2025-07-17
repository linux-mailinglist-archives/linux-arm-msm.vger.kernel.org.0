Return-Path: <linux-arm-msm+bounces-65487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E72BAB08E6C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 15:39:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2351F1888106
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 13:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271122EBDE6;
	Thu, 17 Jul 2025 13:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Q+KJh1Wq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6F42EBDC6;
	Thu, 17 Jul 2025 13:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752759545; cv=none; b=cZRAnmILLx+mEx4KcekwF8MQDMY2bwD2pxVVnhfV6/4SOMzZ1BWc0CXAfaw8hIxt2I+w2QaxQAQS2vvVRobnOkzocs8uGiDr7bB+tKRuK73BD7dglvvSRcL5leFLR1VROm9kFL30uGxD2rHesLdYodilvlo+rdFyfiFNvbe9Z4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752759545; c=relaxed/simple;
	bh=yLN7VF//2CVZZPmoMJ7VBKPuAA7aA4dv0y6POh5P3tM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nwgVbnsNUoq2oQaXMw2DjU31zXzTKf1L9ZCuH7TaGYBPEJNLqx2b88oD18zyn3Nec45vQqGJGZ+xcNC6njW2Ai1rbEsR+LinfYuCFe4XvpbTbsdjxxYEk7Nvvs2eQRPDwW0fK435KoHPzd6AjaGe9W4VmDSo2IRhcweu0sv6cKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Q+KJh1Wq; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lfFBam5+7+XtNm3Zq2vi9q8MGJfF20M+DYWOSgZx/tw=; b=Q+KJh1WqNBwy2WWan3Kc7Aj2yo
	rAwNzQN0U4ZpVzpocnC7ExYI46KBa7Arun4/bG7JTVA/RIatOEG4UBaREuYWToLZoyKyRKD5qaABD
	rToD3q+xu/avOqwMy8RTYPoWBLrRvTpukCshNTCkODKC8R6/9iS7Zec5Hr5BNkIZ8ddM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ucOov-001tOr-Un; Thu, 17 Jul 2025 15:38:45 +0200
Date: Thu, 17 Jul 2025 15:38:45 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 1/3] net: phy: qcom: Add PHY counter support
Message-ID: <a19b72e5-bcee-46c8-9c6e-234af9b103b9@lunn.ch>
References: <20250715-qcom_phy_counter-v3-0-8b0e460a527b@quicinc.com>
 <20250715-qcom_phy_counter-v3-1-8b0e460a527b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715-qcom_phy_counter-v3-1-8b0e460a527b@quicinc.com>

On Tue, Jul 15, 2025 at 07:02:26PM +0800, Luo Jie wrote:
> Add PHY counter functionality to the shared library. The implementation
> is identical for the current QCA807X and QCA808X PHYs.
> 
> The PHY counter can be configured to perform CRC checking for both received
> and transmitted packets. Additionally, the packet counter can be set to
> automatically clear after it is read.
> 
> The PHY counter includes 32-bit packet counters for both RX (received) and
> TX (transmitted) packets, as well as 16-bit counters for recording CRC
> error packets for both RX and TX.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

