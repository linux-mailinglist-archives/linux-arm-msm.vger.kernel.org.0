Return-Path: <linux-arm-msm+bounces-44657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BC1A07F6B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 18:59:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C34016984A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 17:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB15199E9A;
	Thu,  9 Jan 2025 17:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F3Pku27G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7615F18A95A;
	Thu,  9 Jan 2025 17:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736445532; cv=none; b=JMIZgCJFL0QyBXOIMTt6/v+nIyl0diYG4RRznwWWCKvT1KAEs0AYvU49ljUpg1jwJya39IiYxC1ehtHt/jAcvsQuiAZl+fcpXvPaDeSBFXQPdteMwQ0WeG0cAAtxc8CyTaPUUvVR5es7s3fDtpmqit/YQUtowWBSVtuNYKc5XDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736445532; c=relaxed/simple;
	bh=i/EX3nPq/Ou47OOgaeLSbL3N79V+/FztDEfbO/RVafQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=snH+lo6iE6vavxu7yA0UHpKrFKucoBli+qY8VHrcC6aN/s5zethZj15qUE2XtWCAlanh+yaQVgI8/EhQTVMaF3sb9oXHOuQGICRMy7shX+JR80h73Rm+oIogAQvBxjNcX6BsZY6sYrvBl1X0WG3ZxhwBseYotxkAg0GSToxyvpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F3Pku27G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470F2C4CEDF;
	Thu,  9 Jan 2025 17:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736445532;
	bh=i/EX3nPq/Ou47OOgaeLSbL3N79V+/FztDEfbO/RVafQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F3Pku27G5WSFIYBA4kK5PXdeEPxHwBnAjY0vVs2DUuU7Il64ojL48VVPk4S2lhl9f
	 qM+rKlyytwGfc+IIdJcwnmsvE5Xi9FY4fHcCXMnaNMrracU+4y6Z+tqlrJ/GOLRhMj
	 gYrRh4v+VWYEKXBT957dDbSc5043jezv2+EeRJFXRooZXKyOlTd759EoT4ZumtxDm5
	 ulaFxduAgk57V1vtTKfkU6mGLaIbAU2eYiYJNJ+skwyf2q64EWgg1jmUDRKAIT5o0F
	 7vsOre7c/YQOY9gXaaGLksXlpF78tVN+VTaOR+2mi3R3E9pNos+7KZWnRAQlZ6+pLd
	 CCBNZMbKUwrYg==
Date: Thu, 9 Jan 2025 17:58:45 +0000
From: Simon Horman <horms@kernel.org>
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
	Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org,
	quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
	srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org,
	john@phrozen.org
Subject: Re: [PATCH net-next v2 08/14] net: ethernet: qualcomm: Initialize
 PPE service code settings
Message-ID: <20250109175845.GQ7706@kernel.org>
References: <20250108-qcom_ipq_ppe-v2-0-7394dbda7199@quicinc.com>
 <20250108-qcom_ipq_ppe-v2-8-7394dbda7199@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108-qcom_ipq_ppe-v2-8-7394dbda7199@quicinc.com>

On Wed, Jan 08, 2025 at 09:47:15PM +0800, Luo Jie wrote:
> PPE service code is a special code (0-255) that is defined by PPE for
> PPE's packet processing stages, as per the network functions required
> for the packet.
> 
> For packet being sent out by ARM cores on Ethernet ports, The service
> code 1 is used as the default service code. This service code is used
> to bypass most of packet processing stages of the PPE before the packet
> transmitted out PPE port, since the software network stack has already
> processed the packet.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>

...

> diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.h b/drivers/net/ethernet/qualcomm/ppe/ppe_config.h

...

> +/**
> + * struct ppe_sc_bypss - PPE service bypass bitmaps

nit: struct ppe_sc_bypass

> + * @ingress: Bitmap of features that can be bypassed on the ingress packet.
> + * @egress: Bitmap of features that can be bypassed on the egress packet.
> + * @counter: Bitmap of features that can be bypassed on the counter type.
> + * @tunnel: Bitmap of features that can be bypassed on the tunnel packet.
> + */
> +struct ppe_sc_bypass {
> +	DECLARE_BITMAP(ingress, PPE_SC_BYPASS_INGRESS_SIZE);
> +	DECLARE_BITMAP(egress, PPE_SC_BYPASS_EGRESS_SIZE);
> +	DECLARE_BITMAP(counter, PPE_SC_BYPASS_COUNTER_SIZE);
> +	DECLARE_BITMAP(tunnel, PPE_SC_BYPASS_TUNNEL_SIZE);
> +};

...

