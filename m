Return-Path: <linux-arm-msm+bounces-44434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A4DA062C9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 18:00:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D0193A748F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 17:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74161FFC65;
	Wed,  8 Jan 2025 17:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="pcYKJSqo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2F81FF7B4;
	Wed,  8 Jan 2025 17:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736355605; cv=none; b=YVRJvDv0YETAR9kuvp6zqqGaAJkpwUpEMq29XyJuczHbyTY5eYIT2HWq+Q4wJNknZ2EzPfS8iNHvidgfoyxJ7MeMB+vGbR6T5sXaEWl1fjchtTO3jI+gDrEMMZcTfQEaiwnrqvY574r9xUSJYqlVULNmARvyBofLoyXD2GweyQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736355605; c=relaxed/simple;
	bh=HFVc8oLbaMpPOiOm4hXv8z+FIyZjllGwd4MTZEyB5Os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sn+1smZGLZH7rOfojRaHkAXec4Sh0Jq6gLkORipM5fkEkGd8DTPr5v20hNI2ExRpch/39UzkOsgCV0FKgRwk74To08NAzPuG3k4T7KdgkVLOAixYStxFAPOaeQSNrGK58/m0YsL+0m0c6FVrpGxUXQUHvmAKcha2lJxLUUhb3jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=pcYKJSqo; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KlH41KXb6DEhXWYu4j1AZW/YcnxDGl2H1tPl1BECyjA=; b=pcYKJSqo34eAhorobLO7X0ODm2
	xLDLot5xhhBbBJxp75+mj8A+HY4rltgVpkUrxJ5d0Ritf/lHp/KdQ5w1UmIhgkb//hvNHt/maTze5
	tolADuZJKquheTQUa1yRbaR0lZojJoQukvNaHrG0xqpceAqfxtH/8Kdp2/p55DqQLgQ8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tVZPP-002dK9-Gt; Wed, 08 Jan 2025 17:59:55 +0100
Date: Wed, 8 Jan 2025 17:59:55 +0100
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
Subject: Re: [PATCH net-next v2 12/14] net: ethernet: qualcomm: Initialize
 PPE L2 bridge settings
Message-ID: <4dbf1550-32e9-4cce-bf0c-8b92dbd49b50@lunn.ch>
References: <20250108-qcom_ipq_ppe-v2-0-7394dbda7199@quicinc.com>
 <20250108-qcom_ipq_ppe-v2-12-7394dbda7199@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108-qcom_ipq_ppe-v2-12-7394dbda7199@quicinc.com>

On Wed, Jan 08, 2025 at 09:47:19PM +0800, Luo Jie wrote:
> From: Lei Wei <quic_leiwei@quicinc.com>
> 
> Configure the default L2 bridge settings for the PPE ports to
> enable L2 frame forwarding between CPU port and PPE Ethernet
> ports.

It would be good to have an 'only' in there:

> to _only_
> enable L2 frame forwarding between CPU port and PPE Ethernet
> ports

That makes it clear there is no port to port forwarding, the ports are
isolated.

> The per-port L2 bridge settings are initialized as follows:
> For PPE CPU port, the PPE bridge TX is enabled and FDB learn is
> disabled. For PPE physical port, the PPE bridge TX is disabled
> and FDB learn is enabled by default and the L2 forward action
> is initialized as forward to CPU port.

Why is learning needed on physical ports? In general, switches forward
unknown destination addresses to the CPU. Which is what you want when
the ports are isolated from each other. Everything goes to the
CPU. But maybe this switch does not work like this?

	Andrew


