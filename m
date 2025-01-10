Return-Path: <linux-arm-msm+bounces-44695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E61A084EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 02:38:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3DCF1883626
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 01:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC3542A80;
	Fri, 10 Jan 2025 01:38:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E204C2C9D;
	Fri, 10 Jan 2025 01:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736473125; cv=none; b=BAa0/am0SBwIJMJ5WQ5xsNEegt+TetFb5VZcseZWIr8X+oVfYURZCPGeHyZcaiWRbaAMaLpM+kFdaJG4kNynDt/JwN+3EAOP/8nVVCpTBikHlizicJpYXcnLNoUwaYOX3JlVmEO0jBBjHXJWW4le0dVXLRD1MNUHlFllU5kF3tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736473125; c=relaxed/simple;
	bh=N/fkSfTpPv525nzBXiPAxWNErjJTrH0nc7ei9Yz/eeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JtvWZyvHMZH290eZkw9CKzCIFGt46z2YIrPLZbKYS0QLt25HUX4Yt2m5+ABSJjqhvv8YBCk7cMd7Mg64HCcGXB8d07EdH08oBmz011aWsfLw4fTUv48F8SIvw8cjlqqF4FI7yKjkipmkrtgWGDmrz5NdhQycazVbjcSddGmXJHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1tW3yk-000000003IH-3Wbj;
	Fri, 10 Jan 2025 01:38:26 +0000
Date: Fri, 10 Jan 2025 01:38:22 +0000
From: Daniel Golle <daniel@makrotopia.org>
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
Message-ID: <Z4B6DqpZG55aGVh9@makrotopia.org>
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

Hi Lei,

On Wed, Jan 08, 2025 at 10:50:26AM +0800, Lei Wei wrote:
> ...
> +/**
> + * ipq_pcs_get() - Get the IPQ PCS MII instance
> + * @np: Device tree node to the PCS MII
> + *
> + * Description: Get the phylink PCS instance for the given PCS MII node @np.
> + * This instance is associated with the specific MII of the PCS and the
> + * corresponding Ethernet netdevice.
> + *
> + * Return: A pointer to the phylink PCS instance or an error-pointer value.
> + */
> +struct phylink_pcs *ipq_pcs_get(struct device_node *np)
> +{
> +	struct platform_device *pdev;
> +	struct ipq_pcs_mii *qpcs_mii;
> +	struct ipq_pcs *qpcs;
> +	u32 index;
> +
> +	if (of_property_read_u32(np, "reg", &index))
> +		return ERR_PTR(-EINVAL);
> +
> +	if (index >= PCS_MAX_MII_NRS)
> +		return ERR_PTR(-EINVAL);
> +
> +	/* Get the parent device */
> +	pdev = of_find_device_by_node(np->parent);
> +	if (!pdev)
> +		return ERR_PTR(-ENODEV);
> +
> +	qpcs = platform_get_drvdata(pdev);

What if the node referenced belongs to another driver?

> +	if (!qpcs) {
> +		put_device(&pdev->dev);
> +
> +		/* If probe is not yet completed, return DEFER to
> +		 * the dependent driver.
> +		 */
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	qpcs_mii = qpcs->qpcs_mii[index];
> +	if (!qpcs_mii) {
> +		put_device(&pdev->dev);
> +		return ERR_PTR(-ENOENT);
> +	}
> +
> +	return &qpcs_mii->pcs;
> +}
> +EXPORT_SYMBOL(ipq_pcs_get);

All the above seems a bit fragile to me, and most of the comments
Russell King has made on my series implementing a PCS driver for the
MediaTek SoCs apply here as well, esp.:

"If we are going to have device drivers for PCS, then we need to
seriously think about how we look up PCS and return the phylink_pcs
pointer - and also how we handle the PCS device going away. None of that
should be coded into _any_ PCS driver."

It would hence be better to implement a generic way to get/put
phylink_pcs instances from a DT node, and take care of what happens
if the PCS device goes away.

See also
https://patchwork.kernel.org/comment/25625601/

I've since (unsucessfully) started to work on such infrastructure.
In order to avoid repeating the same debate and mistakes, you may want
to take a look at at:

https://patchwork.kernel.org/project/netdevbpf/patch/ba4e359584a6b3bc4b3470822c42186d5b0856f9.1721910728.git.daniel@makrotopia.org/


Cheers


Daniel

