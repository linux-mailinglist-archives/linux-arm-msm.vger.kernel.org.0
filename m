Return-Path: <linux-arm-msm+bounces-40297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EE79E3E75
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 16:38:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF4C3164304
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 15:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C1620B817;
	Wed,  4 Dec 2024 15:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="02rvrkDS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E471182D9;
	Wed,  4 Dec 2024 15:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733326699; cv=none; b=fqYgU6Vkl8utRQ3lsur3bUsD8ERtlO1Fu8vLHDxaGvIxtnRWHSbET5YSM8jZVytqL0ld7kSfZ4OtWrQzDJX7TJhpqwcqVJCt+WPdzl6Bzs1d2ZYPWWVW4WKx7t2TUgWM9ferJzJBeFC2A+7EMNSim7qJ5BnaTrRjpfUJi6iU70U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733326699; c=relaxed/simple;
	bh=aLTGmo+zw8z6O/58DWYLUBRS/El7YvYIzfUNwf8G+3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mp0FRydZgDBvYf2NCwNx1+qk+72HRn4lGlPKA6o165UJXrAIT/FlJmrfmZH9Y4aoIDXYycQghUgVahB36MxFx8HHakZAq1iSOQawcZpNxcB07mfJYLBPyrTS/vjSAEft6rCr4hHbY/cyv1f1T2kYgXr+2Ink+Eymi3Ikn5RTEso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=02rvrkDS; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=y+7N7+5QStwcc/a083bbUwTVwKjG0kqhPvCzgW5P96c=; b=02rvrkDSQ9aAS5MdtVQ9x3/LTf
	PZlFa5m+RlE1GJAUGW9mwJGNwO7LSPcON+LNivBhGKLdZ0Gc2PfRMAnbxFjQiwLiaTewptOokwC79
	b7u5AYaAGixlisI48ZNLtOcXjLFyRzGEeiqggG/X+G4yEUeXww3Bnw6JvTox95NwXOaqq8pkvggxs
	uErG0xPiPZFZIgK6CvFH3wUt6cCRqfMIznBbl31AZmaa1a8ZRNNadiFRsDRHaRXzIxdO2PdYLJSC0
	pq+r/mkCesXufVhMDXbnjtl2+GTMNX4bjSjNo9ulekn8IlEfh9GYYpwCfehOIYS82s074ZGoOha7B
	6WKlaPjQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48622)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tIrS2-0003Wg-0Y;
	Wed, 04 Dec 2024 15:38:06 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tIrRz-0005e9-36;
	Wed, 04 Dec 2024 15:38:03 +0000
Date: Wed, 4 Dec 2024 15:38:03 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Lei Wei <quic_leiwei@quicinc.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com,
	quic_pavir@quicinc.com, quic_linchen@quicinc.com,
	quic_luoj@quicinc.com, srinivas.kandagatla@linaro.org,
	bartosz.golaszewski@linaro.org, vsmuthu@qti.qualcomm.com,
	john@phrozen.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH net-next v2 4/5] net: pcs: qcom-ipq9574: Add USXGMII
 interface mode support
Message-ID: <Z1B3W94-8qjn17Sj@shell.armlinux.org.uk>
References: <20241204-ipq_pcs_rc1-v2-0-26155f5364a1@quicinc.com>
 <20241204-ipq_pcs_rc1-v2-4-26155f5364a1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204-ipq_pcs_rc1-v2-4-26155f5364a1@quicinc.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Dec 04, 2024 at 10:43:56PM +0800, Lei Wei wrote:
> +static int ipq_pcs_link_up_config_usxgmii(struct ipq_pcs *qpcs, int speed)
> +{
...
> +	/* USXGMII only support full duplex mode */
> +	val |= XPCS_DUPLEX_FULL;

Again... this restriction needs to be implemented in .pcs_validate() by
knocking out the half-duplex link modes when using USXGMII mode.

.pcs_validate() needs to be implemented whenever the PCS has
restrictions beyond what is standard for the PHY interface mode.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

