Return-Path: <linux-arm-msm+bounces-44432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 955B7A06261
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 17:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7D643A7013
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 16:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D3E201017;
	Wed,  8 Jan 2025 16:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Aue5RTW/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914C4201016;
	Wed,  8 Jan 2025 16:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736354593; cv=none; b=o+EYZLBYmJ6sqSBbQD2EVMT4aUJB2AwCjrqmOZPAoqlFygPlzSRh4+5hTj12bPNjzzgoKLk/qFDPsWKRcIggMbvmLiL+ullb5ohOeQdRUYMO8r2V3GQRGkekmlWh310llj9tJ93nriQknfzOHeZu5oMGlO41k1Ic7l7ESZWb/JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736354593; c=relaxed/simple;
	bh=hQvQMET/3fr5IjS0P9okiq/xS0jqWcPR4ECdpbV3R+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJ2g4ISJN0LY5vv61SD8OXJjRDch0oByT5bDEwad/YoC4/B8aSVbxzh2hKSfsExXcMX4JNcwqimFpMGqNXStGIT4bJ/J/Aj4dfQdaEaBg3SBK+hJMeh+aUkeZaZjL0QaFi/MVoG7+YFnNkQNWcl3injotFfgMpkdu6TShlKY1Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Aue5RTW/; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=pGcQEno8XQ/vawtezA0YaGrFogSeZqRRS52ggPsIZdc=; b=Aue5RTW/C09oCt6oSyug5ETfAD
	IjqWp+maV0Y5XLvEoxJRTC1GEVfhjr/YKNGndzP27C5dDeg2PBGChVT0qJVyCkejpml2ebsCFOx7J
	m/y6CzUFB7BpMkJL2QiBkHbddJbjRrk5wW500Cfos50EqpQUud3kQ6Zeq2MIZTXJCFwc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tVZ93-002cp8-0T; Wed, 08 Jan 2025 17:43:01 +0100
Date: Wed, 8 Jan 2025 17:43:00 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lei Wei <quic_leiwei@quicinc.com>,
	Suruchi Agarwal <quic_suruchia@quicinc.com>,
	Pavithra R <quic_pavir@quicinc.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org,
	quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
	srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org,
	john@phrozen.org
Subject: Re: [PATCH net-next v2 13/14] net: ethernet: qualcomm: Add PPE
 debugfs support for PPE counters
Message-ID: <f47e5292-667e-4662-8cc2-5167da538ad4@lunn.ch>
References: <20250108-qcom_ipq_ppe-v2-0-7394dbda7199@quicinc.com>
 <20250108-qcom_ipq_ppe-v2-13-7394dbda7199@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108-qcom_ipq_ppe-v2-13-7394dbda7199@quicinc.com>

On Wed, Jan 08, 2025 at 09:47:20PM +0800, Luo Jie wrote:
> The PPE hardware packet counters are made available through
> the debugfs entry "/sys/kernel/debug/ppe/packet_counters".

Why?

Would it not be better to make them available via ethtool -S ?

You should justify not using standard statistics APIs for what look
like statistic counters. Maybe these don't fit the existing API, and
if so, you should explain why.

	Andrew

