Return-Path: <linux-arm-msm+bounces-47582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD842A30CA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 14:15:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7692E3A6FB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 13:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E4C221D8B;
	Tue, 11 Feb 2025 13:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ecphhuHC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF9821D00B;
	Tue, 11 Feb 2025 13:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739279705; cv=none; b=ovYDr7OerlvBqSImepisoR1CAGJFXnBJbrLvT+rtakRxEncEWSXMX0RAVMqvFMgiGtia6XEzCiitnzBAgq2e6qynVkkWMVKCXhQL2A+pjpQhgNckWIdTD2PTLnEae8DFjq7ibVV0TWD3EtGF2lYTA91mGtGRUhvkOJCQaLt5/nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739279705; c=relaxed/simple;
	bh=9A59qM/qw0l02R/clbPT49PZoQ0cDLl+GY/1uFLeQ9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qeoS792d8dT2LzrV+w2jLfan5druBBKTCSsIf71pxNgwmYoH57SrWLhsiJvIqszjUnd4vl7an/pO4x7NZw77XNbLkZmpopoNhGGuQoKl9KsRZun+d5+cfp9jc4CfoQyLB3CSMaksdPgjqDr5lphqFhVMiQSQ/13l0dl5vegt8T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ecphhuHC; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=r9ceLtlRJhS6F2F2NWLhZNuEBw0qSXHcZnna8TM1i58=; b=ecphhuHCYVnh2jgdAqTnarz0qn
	MoiZ/LfXKYKy6M8WNWpqpRelLktMDLTRsbErd+YIGi/32nZlOZe/37nMm+G7FiH4JRUbnW19WRANV
	V+VRYeRvehrtc50M3XTGUf91C4wzS0bVfqxtcC2WQHZBC1HlX8JixDHCSTJIeR8ioZPo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1thq6J-00D41o-CR; Tue, 11 Feb 2025 14:14:55 +0100
Date: Tue, 11 Feb 2025 14:14:55 +0100
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
Subject: Re: [PATCH net-next v3 04/14] net: ethernet: qualcomm: Initialize
 PPE buffer management for IPQ9574
Message-ID: <17d9f02c-3eb3-4bae-8a2c-0504747de6f2@lunn.ch>
References: <20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com>
 <20250209-qcom_ipq_ppe-v3-4-453ea18d3271@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209-qcom_ipq_ppe-v3-4-453ea18d3271@quicinc.com>

> +/* Assign the share buffer number 1550 to group 0 by default. */
> +static const int ipq9574_ppe_bm_group_config = 1550;

To a large extent, the comment is useless. What should be in the
comment is why, not what.

	Andrew

