Return-Path: <linux-arm-msm+bounces-44339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 713E9A05791
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 11:04:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C36763A5FAA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 10:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C02661F63DB;
	Wed,  8 Jan 2025 10:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bnv+xc/P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820201E04B8;
	Wed,  8 Jan 2025 10:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736330646; cv=none; b=W6ylagIQQEknSXgN5i92ZMArn1DyEX0et+ZhF7WdpU+MvU9Hpx3Y6plloLBKWxTCX9YWixMM33QP13ZJsYkXD7Q6mMsf4HcSBnyWPIdqHnO7T9RnAfrM7RmBs51ErAqZbdu5LbYoh+IQBLUDUU9zE9FgvWrUXjtgfRssHKq+ms4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736330646; c=relaxed/simple;
	bh=5KwYH4MKyyoitxmJGTPwJ2BwzZVHBvtzdNuUVzIcjq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXGs0ciYDH3NpWSzrLfQ8RcvoS0JuJMcfrv1lej5/PHaFTZX+JU2fqphN8X6XbyjBBi5P8MvUugYMzSW/GBIBvMvTAzd5a2jso/6OK3cji+mvAEbcpcPi+WjPUM1SBPXx3JFA8tsw61EoX/+4TdXe8/e33MPf1GQvPN/Tu8Zwi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bnv+xc/P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84580C4CEE0;
	Wed,  8 Jan 2025 10:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736330645;
	bh=5KwYH4MKyyoitxmJGTPwJ2BwzZVHBvtzdNuUVzIcjq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bnv+xc/PK2FCAs+2GaUvBwd7UbTuU4GQ3MiiHCCsetf986sJfqNJeq7fuB403Yih4
	 8RNw5WADMUesaqrEP9p8FM2i4mTV5LFQWPW1gYvPQzYkD4P3oz5LtKCnOaYAiDtEkZ
	 hA4NRwBFd19NY0pkAHBc1KtrARsO5P9UYWOa+v4VOtIEyGE8Z4cTfGZfZrKb0fBbPj
	 LIGv+24XvoQquUlzBPqEoCPDt9Rrc/HQ7KEGp19qhG3drmCBJrcKuSqwbsbaDCW5ci
	 FxDNF7AhHIP8KhUArRd+viWptL9inElqjWLuaN/n7vIYhcobAOzhdAoff8xiF3oxxY
	 Pbh88EdGBZpWQ==
Date: Wed, 8 Jan 2025 10:03:58 +0000
From: Simon Horman <horms@kernel.org>
To: Lei Wei <quic_leiwei@quicinc.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, quic_kkumarcs@quicinc.com,
	quic_suruchia@quicinc.com, quic_pavir@quicinc.com,
	quic_linchen@quicinc.com, quic_luoj@quicinc.com,
	srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org,
	vsmuthu@qti.qualcomm.com, john@phrozen.org
Subject: Re: [PATCH net-next v4 3/5] net: pcs: qcom-ipq9574: Add PCS
 instantiation and phylink operations
Message-ID: <20250108100358.GG2772@kernel.org>
References: <20250108-ipq_pcs_net-next-v4-0-0de14cd2902b@quicinc.com>
 <20250108-ipq_pcs_net-next-v4-3-0de14cd2902b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108-ipq_pcs_net-next-v4-3-0de14cd2902b@quicinc.com>

On Wed, Jan 08, 2025 at 10:50:26AM +0800, Lei Wei wrote:
> This patch adds the following PCS functionality for the PCS driver
> for IPQ9574 SoC:
> 
> a.) Parses PCS MII DT nodes and instantiate each MII PCS instance.
> b.) Exports PCS instance get and put APIs. The network driver calls
> the PCS get API to get and associate the PCS instance with the port
> MAC.
> c.) PCS phylink operations for SGMII/QSGMII interface modes.
> 
> Signed-off-by: Lei Wei <quic_leiwei@quicinc.com>

...

> +static int ipq_pcs_enable(struct phylink_pcs *pcs)
> +{
> +	struct ipq_pcs_mii *qpcs_mii = phylink_pcs_to_qpcs_mii(pcs);
> +	struct ipq_pcs *qpcs = qpcs_mii->qpcs;
> +	int index = qpcs_mii->index;
> +	int ret;
> +
> +	ret = clk_prepare_enable(qpcs_mii->rx_clk);
> +	if (ret) {
> +		dev_err(qpcs->dev, "Failed to enable MII %d RX clock\n", index);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(qpcs_mii->tx_clk);
> +	if (ret) {
> +		dev_err(qpcs->dev, "Failed to enable MII %d TX clock\n", index);
> +		return ret;

Hi Lei Wei,

I think you need something like the following to avoid leaking qpcs_mii->rx_clk.

		goto err_disable_unprepare_rx_clk;
	}

	return 0;

err_disable_unprepare_rx_clk:
	clk_disable_unprepare(qpcs_mii->rx_clk);
	return ret;
}

Flagged by Smatch.

> +	}
> +
> +	return 0;
> +}

...

-- 
pw-bot: changes-requested

