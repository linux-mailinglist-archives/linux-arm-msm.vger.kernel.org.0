Return-Path: <linux-arm-msm+bounces-44532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F263A07122
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 10:15:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DCD27A2B4C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 09:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16A8215196;
	Thu,  9 Jan 2025 09:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKF36eSW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C28215070;
	Thu,  9 Jan 2025 09:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736414130; cv=none; b=TeS26heAvkoTUbjXj03fxLkyUKHRkwyzHrQYg4T5XxTZyP4dOSWq+cj1M4fn87ynFl3Ou4jh5QtjaPjxJ4Y55ZxD3oihNkhwKDN9xoB2h6W8u9bczlC5D3Trg5qbREuFkWSm22SxGE7lAzZF8P3nRZu4rzUYOUBzGNHtJ3KiZ0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736414130; c=relaxed/simple;
	bh=XonJNleXueCiBlpzejK+vB2VywAex0avXvLejhJ9BKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dADe3ABodLRbJx0NU1gAR5lDMyFPXfP2Wntgu6KzJSHTzJuW9fnJZmlsOkY3YYoggm2D8c6HS7uRT4NBvP6EyjtIYH8/y8W4vLTzjsUAMGB/zf5uJj6LNBIJ+Xn3GjFp4UhxTA6yv66Lvwqlc+UDfQWu6EXIngYhqscKcBVFhDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKF36eSW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B237C4CEDF;
	Thu,  9 Jan 2025 09:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736414130;
	bh=XonJNleXueCiBlpzejK+vB2VywAex0avXvLejhJ9BKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DKF36eSWPanxZKCMweCQnSYx9VcN/32Nol9RpoJsFPW4g2O6Rdrf+tW95FmH7b/hk
	 gYfw650Ox6DZ2HDw1rJKaTUIe0N8cme5Gu2GYl9l6pYkoGHshSgz7eu7vr/kCZ7D0Q
	 FSMqu80ksLLGg+PotK41x26bUFF1j2/L13werB3/d8Ogdi33dgVZvtNVrLZGPPszrv
	 OJ6gIXi5BOSBg3VT1JYAVCy1so4ib7V7BWjQsInL9UVaktBm0ZxiOakZd3+vEkEebN
	 yByxkFuq/05vM90gtR7eb1ZfFChbMqrtntl0na6zuWGQMeOO3b1QRmwEc15A99PKOp
	 u25QGb1TDMoZQ==
Date: Thu, 9 Jan 2025 10:15:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lei Wei <quic_leiwei@quicinc.com>, Suruchi Agarwal <quic_suruchia@quicinc.com>, 
	Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org, 
	quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com, srinivas.kandagatla@linaro.org, 
	bartosz.golaszewski@linaro.org, john@phrozen.org
Subject: Re: [PATCH net-next v2 01/14] dt-bindings: net: Add PPE for Qualcomm
 IPQ9574 SoC
Message-ID: <s7z6d6mza3a6bzmokwnuszpgkjqh2gnnxowdqklewzswogaapn@rhb5uhes7gbw>
References: <20250108-qcom_ipq_ppe-v2-0-7394dbda7199@quicinc.com>
 <20250108-qcom_ipq_ppe-v2-1-7394dbda7199@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108-qcom_ipq_ppe-v2-1-7394dbda7199@quicinc.com>

On Wed, Jan 08, 2025 at 09:47:08PM +0800, Luo Jie wrote:
> +    required:
> +      - clocks
> +      - clock-names
> +      - resets
> +      - interrupts
> +      - interrupt-names
> +
> +  ethernet-ports:

This device really looks like DSA or other ethernet switch, so I would
really expect proper $ref in top-level.

> +    type: object
> +    additionalProperties: false
> +    properties:
> +      '#address-cells':
> +        const: 1
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      "^port@[1-6]$":
> +        type: object
> +        $ref: ethernet-controller.yaml#

Everything here is duplicating DSA or ethernet-switch, so that's
surprising.

> +        unevaluatedProperties: false
> +        description:
> +          PPE port that includes the MAC used to connect the external
> +          switch or PHY via the PCS.

Best regards,
Krzysztof


