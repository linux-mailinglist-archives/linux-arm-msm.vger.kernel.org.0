Return-Path: <linux-arm-msm+bounces-44890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3544A0B859
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 14:38:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2BAD3A1AB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 13:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF57B230D3D;
	Mon, 13 Jan 2025 13:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="w7vN9zyB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AED125B2;
	Mon, 13 Jan 2025 13:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736775491; cv=none; b=VX7U5qNfDMeHumokBhi7W3vfXTit0lYTZKL9ARRtbZYxZnuvFtrPS/cUnI8yenvl0jdbaFkLc1je9DtA/47p1pSXqa9WBykxbwaYyVdpgQTco8r//mWc4x8mZI8dRj22ABoffAjiaeLP1rsQ0zT9boC+Ec6wrFuRCgKmrJeAnyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736775491; c=relaxed/simple;
	bh=nHN3ZaTTiEw6x6KDpMqEEiPy8Os0si5mupUZrQsZhAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=um6hO14BRtsGZsEY2I4uGLyyT/CNnNQkcYjIQ9GwiT0gTh6aA9VeOMANWSHK94dmLcY/8XZ+IWz2u1tZu/uq6itHgC7M2iS2lnURqKI2UGQwJWFd2ocihl4jAgjRco5rujm/2SbQF1xMAnywToz29Du9rvwAdA2u5HLon264nPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=w7vN9zyB; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=K3/LnQGpJFz1AF0FoQuzUY+SDS8BerFJpfW2HEfDwmg=; b=w7vN9zyBghaON2SXZA2zkbWGCK
	ioUyHajgaWLXq1Ib45mo9URWcz+QYj2uk2rSGyvvWk6gKSlh0xAGaFn+/vYKTPPEjQBBTKotFLOHf
	7yrV/eE6KxMgDbDc5GoZh9aJ+iqrDhXSEKiWxY0AIjoNPJKWgcbSqy/1Y+DUVUxnkAQU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tXKdd-0046S9-3A; Mon, 13 Jan 2025 14:37:53 +0100
Date: Mon, 13 Jan 2025 14:37:53 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lei Wei <quic_leiwei@quicinc.com>
Cc: Luo Jie <quic_luoj@quicinc.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
Message-ID: <8bdde187-b329-480d-a745-16871276a331@lunn.ch>
References: <20250108-qcom_ipq_ppe-v2-0-7394dbda7199@quicinc.com>
 <20250108-qcom_ipq_ppe-v2-12-7394dbda7199@quicinc.com>
 <4dbf1550-32e9-4cce-bf0c-8b92dbd49b50@lunn.ch>
 <c67f4510-e71b-4211-8fe2-35dabfc7b44e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c67f4510-e71b-4211-8fe2-35dabfc7b44e@quicinc.com>

> > Why is learning needed on physical ports? In general, switches forward
> > unknown destination addresses to the CPU. Which is what you want when
> > the ports are isolated from each other. Everything goes to the
> > CPU. But maybe this switch does not work like this?
> > 
> 
> L2 forwarding can be disabled in PPE in two ways:
> 
> 1.) Keep the learning enabled (which is the default HW setting) and
> configure the FDB-miss-action to redirect to CPU.
> 
> This works because even if FDB learning is enabled, we need to represent
> the bridge and the physical ports using their 'virtual switch instance'
> (VSI) in the PPE HW, and create the 'port membership' for the bridge VSI
> (the list of slave ports), before FDB based forwarding can take place. Since
> we do not yet support switchdev, these VSI are not created and packets are
> always forwarded to CPU due to FDB miss.
> 
> (or)
> 
> 2.) Explicitly disable learning either globally or on the ports.
> 
> With method 1 we can achieve packet forwarding to CPU without explicitly
> disabling learning. When switchdev is enabled later, L2 forwarding can be
> enabled as a natural extension on top of this configuration. So we have
> chosen the first approach.

How does ageing work in this setup? Will a cable unplug/plug flush all
the learned entries? Is ageing set to some reasonable default in case
a MAC address moves?

	Andrew

