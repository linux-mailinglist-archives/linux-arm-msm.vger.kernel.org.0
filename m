Return-Path: <linux-arm-msm+bounces-60591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30405AD1CF7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 14:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26FA53AC416
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 12:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25D0F2566E9;
	Mon,  9 Jun 2025 12:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="O8DCTvUA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8ED253F1E;
	Mon,  9 Jun 2025 12:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749471388; cv=none; b=I4zDgBQ3Io4EEv2zVuPmh3QzKaOmU//vuOmRs+PViEfDCMfy9edaSYoqdLAui5Fh11Aq7bN99da0nbk1k2vfnjLbV0j+DG1bl0wz2eOIqPik36XUDrf/qD7uJGaVP+kA2djB5tczOQhcqns7VoNMuscX4xwv9ok0c7n/PC3yF7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749471388; c=relaxed/simple;
	bh=zlhMzS1dNDm4+twZV8FdiFuIsRgvrGoLgdUTyedqKYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DXE8YVj8l+xpMFYl+91eQsdAxzcbLLiDHFN9wdqhYWyLHocXy2rdnZVRSx6dwk6BAYK+5RIW8jBmepOWwNoaJA84dKyMiR8hbVgC0WikiBKMLlAETj0zhseNGJzzb/M94Asn+kQsE1Ey1HSL+O2PD7Cg/iz6v0PMreGjpndhDFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=O8DCTvUA; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xZ8VkTY6ypJSXCk+Hz7uCo3eSGgDAR8exyMJTsBLtnU=; b=O8DCTvUApTGLf07xMb/apcXz+a
	aAVMaJDmyTfy7vxzmsf5d5O9R1gfDj4FeOQica38teS7riBpoSlZSvmAZgAzosAFSozB0JW1nlfEE
	tgsa9saywwKybrYFyIXIB0FQTg40KFJ96rIl9plZw+u4PGmJ00Y43uLJJDeBJ6Abk/bM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uObQF-00F9EB-Hy; Mon, 09 Jun 2025 14:16:15 +0200
Date: Mon, 9 Jun 2025 14:16:15 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: george.moussalem@outlook.com
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 2/5] dt-bindings: net: qca,ar803x: Add IPQ5018
 Internal GE PHY support
Message-ID: <6bf839e4-e208-458c-a3d1-f03b47597347@lunn.ch>
References: <20250609-ipq5018-ge-phy-v4-0-1d3a125282c3@outlook.com>
 <20250609-ipq5018-ge-phy-v4-2-1d3a125282c3@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-ipq5018-ge-phy-v4-2-1d3a125282c3@outlook.com>

> +  - |
> +    #include <dt-bindings/reset/qcom,gcc-ipq5018.h>
> +
> +    mdio {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        /* add alias to set qcom,dac-preset-short-cable on boards that need it */
> +        ge_phy: ethernet-phy@7 {
> +            compatible = "ethernet-phy-id004d.d0c0";
> +            reg = <7>;
> +
> +            resets = <&gcc GCC_GEPHY_MISC_ARES>;

What do you mean by 'alias' here?

	Andrew

