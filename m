Return-Path: <linux-arm-msm+bounces-65722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDB8B0ACBE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 02:18:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8024585C00
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 00:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 173CB9461;
	Sat, 19 Jul 2025 00:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="brBANwRe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42482110;
	Sat, 19 Jul 2025 00:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752884324; cv=none; b=AmQHQQKYhqFh8agQBvYW268ouT2tCYirKIzEj7uDuTuDcJ+B7ubCfWAPSUxwHXDmo+TP3Ty2BT047I2Hn48/zngsYH1sW7+HLMOGl+V+QRUPXqf9LDjfF5Qxp9XEcbGWjPr19hrNXm9LYiIskpaJyyoQkGy+bS8qTUhs+dZ4aRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752884324; c=relaxed/simple;
	bh=i8kfI0t8YXJOh7Nta4MzjlKHughkKRcvCBx/fiPnVeo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gf7jVPwSAL1oL2Gnft9AuQL7JCgu0VDjwP7jtERTppWXUu7NtbBKjBFm6MR63Rq7DOz6E1KjKFAjIr3TnJ0suQLAaiz1Z9J+wX/QtwzVopcBpppUe4ZrVnx3Fu+BFNFwvCbgzIqkGkyjM7FTt0/zfcITnZmdpN3xqgk6iashVa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=brBANwRe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77940C4CEEB;
	Sat, 19 Jul 2025 00:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752884323;
	bh=i8kfI0t8YXJOh7Nta4MzjlKHughkKRcvCBx/fiPnVeo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=brBANwRehx9lpmB3NmOOG1AesXtgHe4kuApPMYeE2FSONLgLd5na4A6qhLMnrO9q0
	 GxyF/JljKYZJDuLHMuj+8yIHFsdrY4psW3zaZbxCNR1ibtKBXUmelLxYh6hKMwh7HM
	 nkfrCDhgwtyPcKfjIG/IaZJK9iXunMuwJ+GtDi4bxUIbkMb8vMKqelc6UCt55cDDmK
	 rPiGTJHCSaelCPgMw9ypOSEWC6FMWZ/EPN1nFB57NRLXreVkVmz77Iu9BjQrgZUjos
	 XA4T8bHp4WP4iA2l+entG9kIN3eti01D/wKFcGmQJnEXpW5/rM13CFPClMIowxPhbn
	 DUBHlLPqDuUKg==
Date: Fri, 18 Jul 2025 17:18:41 -0700
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
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v9 00/15] net: phy: Introduce PHY ports
 representation
Message-ID: <20250718171841.795daa9b@kernel.org>
In-Reply-To: <20250717073020.154010-1-maxime.chevallier@bootlin.com>
References: <20250717073020.154010-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Jul 2025 09:30:04 +0200 Maxime Chevallier wrote:
> Here's a V9 for the phy port work, that includes some fixes from Rob's
> reviews, by addressing a typo and the mediums item list.

Sorry to report but this doesn't apply any more.
-- 
pw-bot: cr

