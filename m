Return-Path: <linux-arm-msm+bounces-78066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C928EBF4344
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 02:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4EB774EF3CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 00:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F8520102B;
	Tue, 21 Oct 2025 00:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KHLMJ6Ey"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEA51A2392;
	Tue, 21 Oct 2025 00:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761008052; cv=none; b=jiPDvXveFm+PIqdyBd4FinzmOsMhAoR00+IpCBejvAUebSbDfp9bX+Avfiniv1gAx7GllANrWtExKxFFBRes7PEmRAv7CrnUcj1qtjpqEUMongb9Is8wOfNgDP3JSFjwXOV6WmYpHyluGkzhzIlIrAXmxApbv47PEKgaXG4C3so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761008052; c=relaxed/simple;
	bh=GWRxTbKMIALWDNujjpFEp+EgSzbDooDkX5Xj1E6/bxg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ILf+Z23c5nElSjDhxG1Y6tn0vSb8aT1yq8YIhgPWmDnbNkgwKf0rnFuNcSmATGgo+8bAIyJ58bbtT6lNQDTPfV//+KGeLqW8eFD/2WH2bUI0LvV5GlNtHhwDVjknifaKAK7xBN4R/CbrgCPXGjAitA76RLD2TPEPLWBeCN6LROo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KHLMJ6Ey; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F40AC4CEFB;
	Tue, 21 Oct 2025 00:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761008051;
	bh=GWRxTbKMIALWDNujjpFEp+EgSzbDooDkX5Xj1E6/bxg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KHLMJ6EyXs5/HPdCNWAj9X+qWyC60ZpVLNY2gqzR2nIfMD7otI0SfuiVYZ8jLavEV
	 I0ElnaL32TSpS9VKMeZfyOoVVw+F7WM6w3/NBaPsjjxdfmiqNGvnBeOEIAghgsxX/9
	 QY0Q16Ta26AdMpn+NpjO48Y8fTgmzgBHB3iWZpM6h5PZ8n10U7X4PLNYrceGxODVEh
	 S/C9zssq5qdlAKcR560nunNsBjDCNmhc9OGkgxfbbyVHdOWrMc5DQe+IK4EGEx9Tx+
	 i48tm5NU7Dbs7vyEkml57TR+QJTe+kZSS+5fNJPIklFpleWDWgPdQaVoCbpTXBfL96
	 M5ioOAewcz9JA==
Date: Mon, 20 Oct 2025 17:54:09 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@csie.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jan Petrous
 <jan.petrous@oss.nxp.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
 s32@nxp.com, Samuel Holland <samuel@sholland.org>, Thierry Reding
 <thierry.reding@gmail.com>, Vinod Koul <vkoul@kernel.org>, Vladimir
 Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH net-next] net: stmmac: replace has_xxxx with core_type
Message-ID: <20251020175409.5098acd4@kernel.org>
In-Reply-To: <E1v9gFI-0000000Azbb-44bh@rmk-PC.armlinux.org.uk>
References: <E1v9gFI-0000000Azbb-44bh@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 17 Oct 2025 09:55:32 +0100 Russell King (Oracle) wrote:
> Replace the has_gmac, has_gmac4 and has_xgmac ints, of which only one
> can be set when matching a core to its driver backend, with an
> enumerated type carrying the DWMAC core type.

Looks like this also conflicts with the just-applied PCS series?
Either way - doesn't seem to apply for me :(
-- 
pw-bot: cr

