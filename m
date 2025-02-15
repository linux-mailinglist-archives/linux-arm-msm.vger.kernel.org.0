Return-Path: <linux-arm-msm+bounces-48104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AA3A36A52
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2025 01:58:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 806493B1AAB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2025 00:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B350156C79;
	Sat, 15 Feb 2025 00:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sE5KJbIE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C2B154C0B;
	Sat, 15 Feb 2025 00:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739580827; cv=none; b=TxQHavdnyIwIBlqoaxgf/BmtFYotWNF1vI19kHBQo4JbDTt2p4dnWUgtwXC8/BWsyCfNiK+Q/qFGuf1GvrWdDCTWOFE3mCnLGa9MojBEaQ6tntmj9yxNlCxKPu4Uj1ozqwD20K6IOnf/1Nqa01bDspjzMSIfGT2hTNwjTMWt1jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739580827; c=relaxed/simple;
	bh=U2QJb6XIJC6fNter4lBmA14G9QFD+52FUM0I1jZgCx4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MsF1njaWdf61H25YdARdrrsJ8pJIcyT8wNOvHJN+sKMFKXrvl6PRytk0eqM1JAyHsM24ycVk6K8st77yOCqkiUjJeNYoJ/5j4C4tFEj4IU5bzkczYJv8fe9yIrh4E+dJCVkL7axGlckp71bwxXCJ5G7akUthxbg1KMw7p7dzEK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sE5KJbIE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E90C4CEE2;
	Sat, 15 Feb 2025 00:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739580826;
	bh=U2QJb6XIJC6fNter4lBmA14G9QFD+52FUM0I1jZgCx4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sE5KJbIErIEnMN8ssaRMOU7wYVNoq49KmLNBuOhpYT2dC9Qp58XGtuzTjVjfE8v4g
	 MIeHJ9R3ASbAwY59YMeQB58dQgb/7ehBG+RdOt9nLndobnNZcRKdqvLLcDAgF7rEow
	 56ij5RYIxWo5PS9bO1Rj0bRnVRry6lwsPhdxyycJsZfZl19PE5irc2c9d82I9SXjFf
	 vY15DyE4TWVyYOcfOhXXaZ0LeVcSj/HKxM0ep2rfawnO/omKg1ZBAzk7AnVH3S6yk9
	 9hxrMz8+dFD0NjTsNnLK7ta8GhuD7l0xgA7aD+jVdldnpo8siG5+cXOmM6ai9hqF11
	 FI+arOB4Cx7cQ==
Date: Fri, 14 Feb 2025 16:53:45 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell King
 <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner
 Kallweit <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Romain
 Gantois <romain.gantois@bootlin.com>, Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>, Sean Anderson
 <seanga2@gmail.com>
Subject: Re: [PATCH net-next v4 00/15] Introduce an ethernet port
 representation
Message-ID: <20250214165345.6cab996f@kernel.org>
In-Reply-To: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
References: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Feb 2025 11:15:48 +0100 Maxime Chevallier wrote:
> This is V4 of the series introducing the phy_port infrastructure.

FWIW it doesn't seem to apply:

Applying: net: ethtool: Introduce ETHTOOL_LINK_MEDIUM_* values
Applying: net: ethtool: Export the link_mode_params definitions
error: sha1 information is lacking or useless (net/ethtool/common.c).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort".
hint: Disable this message with "git config set advice.mergeConflict false"
Patch failed at 0002 net: ethtool: Export the link_mode_params definitions

-- 
pw-bot: cr

