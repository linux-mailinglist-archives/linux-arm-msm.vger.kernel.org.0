Return-Path: <linux-arm-msm+bounces-49210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C62C9A432BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 03:01:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFC9617B2DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 02:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A527175AB;
	Tue, 25 Feb 2025 02:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0YNl8hV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3C84C6E;
	Tue, 25 Feb 2025 02:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740448914; cv=none; b=bZEdTlzQrU9/fZwfkvk29rEp27MpBFKd058ASr1gORkjEPhGA26MleaNygvSfcBC1GGdtdMvEhRiy20Tu4DSZVVO/Q2P3KvGUz/5PtfmxnSANOd2R87n6qvN2SH7zCwju3mAAQ27yuiaJlBwL6XUbLshSCdolX4Q3Y7rgJ0obuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740448914; c=relaxed/simple;
	bh=24jiysXyB/JxeRxXGrThD+4qS8hUsrobbYzYvxv5lPA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nb/F8HQjGSNIKbo+oNGT64EdhNuTWa6CB42Y5y+jQuV1vb8nd7J1AZi/Bmuj9KmlRLB4PhB9sJ7/Ffu/eqNjqz7bW6Jp9XmYuWh15fyRlTS+UTGjB3e+qpPMsNUwV+9P9DdkBvDfZMMockxJMIKcDalVquLpb5wCKSe2wnh4PKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0YNl8hV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10831C4CED6;
	Tue, 25 Feb 2025 02:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740448913;
	bh=24jiysXyB/JxeRxXGrThD+4qS8hUsrobbYzYvxv5lPA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=m0YNl8hVNoFUnLUYdBUeOSUQqFi/NzUh2IxX88Qn1nBbE8mqcAfiNoOZbZwaLzQtf
	 l5x0F7/7X7AcH+mJypeRs0RJbWk4GKBbY6AIO6jl0HVx/lGfxwRb30J6dV8DSNTUvL
	 /dihr4AzMzwMmM7oQm30NB9WTrJB9oexReCzvF7N3e7Un4tS79Mu+aSy7P+/j92cGv
	 8dJ9bzyXYG9dQZ9gsOmhikj9CAM0VpjeM8U104aFyOe8Ev3Xy0pRGKBGbLE93lTSpY
	 AzYZISjHKGN3lsKJytI6kyyO3+zdvpZTnws4MYR2waLZtXO1kt2P3TxW5IxtgXXCiD
	 EYgsGn4O28c3g==
Date: Mon, 24 Feb 2025 18:01:52 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
 David Miller <davem@davemloft.net>, Daniel Golle <daniel@makrotopia.org>,
 Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
 <SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH net-next 3/8] net: phy: add getters for public members
 of struct phy_package_shared
Message-ID: <20250224180152.6e0d3a8b@kernel.org>
In-Reply-To: <b505ed6a-533d-42ad-82d0-93315ce27e7f@gmail.com>
References: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
	<b505ed6a-533d-42ad-82d0-93315ce27e7f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 19 Feb 2025 22:04:47 +0100 Heiner Kallweit wrote:
> +struct device_node *phy_package_shared_get_node(struct phy_device *phydev);
> +void *phy_package_shared_get_priv(struct phy_device *phydev);

A bit sad that none of the users can fit in a line with this naming.
Isn't "shared" implied by "package" here ?
How would you feel about phy_package_get_priv() ?

