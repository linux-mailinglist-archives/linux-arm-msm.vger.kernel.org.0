Return-Path: <linux-arm-msm+bounces-55993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 696CEA9FE20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 02:11:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 766CB3AA942
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 00:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002FB5223;
	Tue, 29 Apr 2025 00:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nVzw2KSq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C251017E0;
	Tue, 29 Apr 2025 00:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745885464; cv=none; b=osAySNKIGGDlc0rEC6kasrDpju+9rRGg5sFFolBZvUuz8qRjD9l4+NefO1y4fWkDYYj1Xx1hCDf/3+UAP4vqlzsm2gngeZ24ZkuFcncwhp8EnTwKMnWutjjxh984VHDJlxyRpT0VfAqdvt7ACV8em5+HNxAAzZ0ard5xZDTW7vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745885464; c=relaxed/simple;
	bh=5zj2bRvcVKwzFXAjzx5+hMgde9R+CAg9YuVsrQbGPBw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bbW35+n1G+0RH7IhYhv1kqJrHJ75kh9wFJOxEO8jwvckXI+zq4+1kydaaFJqG2bylYvGYHlZZvra8T6rz5/GwLvkrN4PXF5d2m4Vy7HCbGUoI4cUDQbY5LQgaIP4fdr1OHCOYDBeEP4S1xiPRsTNAN93DmXuqozC6uVfu7EdOMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nVzw2KSq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72C8AC4CEE4;
	Tue, 29 Apr 2025 00:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745885464;
	bh=5zj2bRvcVKwzFXAjzx5+hMgde9R+CAg9YuVsrQbGPBw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nVzw2KSqDjUoqKs1cAAXKGh4vf7eL7KCO9GSAzzjLWFJKhDVc1gEw6twpxcI+e/5Z
	 is7sStvKDKRkEVeoFrzXz0j4vJaORosmLdjEuSQu/mXXgiy78abWBl3G8ekl2Wit0I
	 JHGW5SIs8KIwG1pj7iJm4ur2UcLX2Nj4WllGG1rlrqrNMZZcrTdhVBbNr+U7oBeLiw
	 ZiLr25mLNsRM+9qM6FNy9ycDxKpUzMFqytUuv1PQn5Mn0qZM4QomaVXL38yE3sHLLd
	 akJgefoPqmarrQoSpWL//6SW6jv88XzE9lchzBKYp3kssGiULSWpdLl/KxpX7JkaxM
	 7GeFWvQkdqKgw==
Date: Mon, 28 Apr 2025 17:11:02 -0700
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
Subject: Re: [PATCH net-next v5 03/14] net: phy: Introduce PHY ports
 representation
Message-ID: <20250428171102.37455ad6@kernel.org>
In-Reply-To: <20250425141511.182537-4-maxime.chevallier@bootlin.com>
References: <20250425141511.182537-1-maxime.chevallier@bootlin.com>
	<20250425141511.182537-4-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 25 Apr 2025 16:14:56 +0200 Maxime Chevallier wrote:
> +/**
> + * phy_port_get_type: get the PORT_* attribut for that port.
> + */
> +int phy_port_get_type(struct phy_port *port)

Bunch of missing argument descriptions in the kdoc in this patch.

