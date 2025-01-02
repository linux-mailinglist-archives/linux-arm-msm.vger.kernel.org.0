Return-Path: <linux-arm-msm+bounces-43780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B6B9FF876
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2025 11:54:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 495797A0FEB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2025 10:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36051198E60;
	Thu,  2 Jan 2025 10:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="QPcYWPj6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894BF2CA9;
	Thu,  2 Jan 2025 10:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735815264; cv=none; b=eSPJYkutA5mFreBQohU0smsAMs8/qrZBa6x4TExXVdghKMNzFaAYnatgLTABT3A0vdBs+/Aj3OvsRbCY0jFMLwcTIl1kmG2DcyaBDmXIDCRBAmn1481aPERc1B6gJ7OubP2Mhvl/vWsyjw+M4MZ+WKo+d69BnKPtOt1Ecem6uck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735815264; c=relaxed/simple;
	bh=0Rpt7yMFe9eWHazP+kDrk6aUELB1oKw7sDcRPv+Owqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1wPxtI4vRG3ozcNQvn5Avac5llJAE8IbSCjQkMRHQcR87bC7k/Co/mW3C74mgZLQPQ51Yg5cbp0y8ADW2G8xPbiLjVLuIff0g7clyXL9jNW1ZW0VQ7g7IruzYBmV4KTNKN2rJydCwoS2LHxc7Igc5bYM+6rsQe7VVC8DFZM1h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=QPcYWPj6; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sY0n+f+Bbc7kIzhzPEFT5STJFSdVmTvk9y+TqH5KuEQ=; b=QPcYWPj6Fr/2Of9KbSlYgSc/XY
	89JslaJOFR5f5ca9V4yEnjmbtNhDV6E9Za10jBHVA2H8n83tYPznXlJuTujhWADzRtxoXEB9cw7Jt
	IoXWICqMNtXePEDt3G7zEX48ROL6urMrBU0rZ8q42rmlpi8u1bzMxCa8boZbQn/J3r7qyLg/YHiIr
	1u8I/uTaRS1FzGcKiX8CPkvMr5+BIVnmMTaWJpbOrW89VnVc3jMPaVlyABdh/KhvIg9drdmwXDal0
	8hsN6E8DxqE5U5zSr03bNUkkXqzBEdn9AxzPO+Kj50zETFFkq1upwziYoV4xwKeDyeLHos+ojaXii
	5sxNNxOQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41680)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tTIqC-0001uL-09;
	Thu, 02 Jan 2025 10:54:12 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tTIq9-0000DL-11;
	Thu, 02 Jan 2025 10:54:09 +0000
Date: Thu, 2 Jan 2025 10:54:09 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Lei Wei <quic_leiwei@quicinc.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, quic_kkumarcs@quicinc.com,
	quic_suruchia@quicinc.com, quic_pavir@quicinc.com,
	quic_linchen@quicinc.com, quic_luoj@quicinc.com,
	srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org,
	vsmuthu@qti.qualcomm.com, john@phrozen.org
Subject: Re: [PATCH net-next v3 3/5] net: pcs: qcom-ipq9574: Add PCS
 instantiation and phylink operations
Message-ID: <Z3ZwURgIErzpzpEr@shell.armlinux.org.uk>
References: <20241216-ipq_pcs_6-13_rc1-v3-0-3abefda0fc48@quicinc.com>
 <20241216-ipq_pcs_6-13_rc1-v3-3-3abefda0fc48@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-ipq_pcs_6-13_rc1-v3-3-3abefda0fc48@quicinc.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

Hi,

On Mon, Dec 16, 2024 at 09:40:25PM +0800, Lei Wei wrote:
> +static int ipq_pcs_config_sgmii(struct ipq_pcs *qpcs,
> +				int index,
> +				unsigned int neg_mode,
> +				phy_interface_t interface)
> +{
> +	int ret;
> +
> +	/* Access to PCS registers such as PCS_MODE_CTRL which are
> +	 * common to all MIIs, is lock protected and configured
> +	 * only once.
> +	 */
> +	mutex_lock(&qpcs->config_lock);
> +
> +	if (qpcs->interface != interface) {
> +		ret = ipq_pcs_config_mode(qpcs, interface);
> +		if (ret) {
> +			mutex_unlock(&qpcs->config_lock);
> +			return ret;
> +		}
> +	}
> +
> +	mutex_unlock(&qpcs->config_lock);

Phylink won't make two concurrent calls to this function (it's protected
by phylink's state_lock). Since this looks to me like "qpcs" is per PCS,
the lock does nothing that phylink doesn't already do.

> +static const struct phylink_pcs_ops ipq_pcs_phylink_ops = {
> +	.pcs_validate = ipq_pcs_validate,

I would also like to see the recently added .pcs_inband_caps() method
implemented too, so that phylink gets to know whether inband can be
supported by the PCS.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

