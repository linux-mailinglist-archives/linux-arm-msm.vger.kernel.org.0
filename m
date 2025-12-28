Return-Path: <linux-arm-msm+bounces-86761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEEDCE5723
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 21:21:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FD0E3009F9D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 20:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A6E258EDB;
	Sun, 28 Dec 2025 20:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DISBa/r+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24428242D79;
	Sun, 28 Dec 2025 20:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766953261; cv=none; b=P9uwqM5vESZpLEI4Ey2kQpk1H9AirLaecQVs6SPamFBhvsWpNiUTAfr1zDrJQ5tCwaedwDQfkb60rU9XrWe1xdohuQdzt4eEgce2Fi2P1CzOXlYGbrOFq3SAXO1tCSyu+9xK7/xzzUORPGXIJMcphGYh4u1RLo2CMn1+/3TANJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766953261; c=relaxed/simple;
	bh=jkfT8Y5WEeKtdPkROxqVJmvYhof+xpbfEHNcic/Gtx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P2CZqT4YKeB2WeWwXu7U9jOmP24bryI9W00bKeRLsi+s0WZJLC8gd2DV9PTNz7A8eEqV9soe1MKBwYWYxfNUZMDWxkOi4w5Y5WuW6hSCigsQqKmUvqb340Khj2nn1pH9d8PLr+vC7j60R3CcS62c+TWf2anrXJpiZ99K9GqUl/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DISBa/r+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530C4C4CEFB;
	Sun, 28 Dec 2025 20:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766953259;
	bh=jkfT8Y5WEeKtdPkROxqVJmvYhof+xpbfEHNcic/Gtx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DISBa/r+gTCPXaCWjl8eJO+1v1j2Y8wzCdQjo6kXQo5FPMMqq10po37sW+vF9Z7NL
	 iM/pPXDUZ2V3jPWBU5jZr0fSWMkDgnF4kDDSVKd2BRZ4qIW06cSaxDBHhDx5zn2jcf
	 eWvoVPGCO89KzxNR0FqomsJ6se0z8yU62DREIduT2t2c501XxFcDG6iGpTtegzUjcT
	 VIL/Xiz+Zd3bavaL84rRbIzJq7fuXvx4INpcEniy457E4lVCmtqFWfZOrJL44p0vzi
	 oqO8Cd/cGKBlUg/hyYxSwhrfmf1WiD92kydXrHNJCC+/tduCYorfHvqb4ZupBrjg0V
	 qDMNSuHwzSemw==
Date: Sun, 28 Dec 2025 12:20:57 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: adrian.hunter@intel.com, quic_asutoshd@quicinc.com,
	ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] mmc: sdhci-msm: Add quirk to disable CQE for ICE legacy
 mode
Message-ID: <20251228202057.GB2431@quark>
References: <20251224101050.3497746-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224101050.3497746-1-quic_mdalam@quicinc.com>

On Wed, Dec 24, 2025 at 03:40:50PM +0530, Md Sadre Alam wrote:
> Some hosts require Inline Crypto Engine (ICE) to operate in legacy mode
> instead of Command Queue Engine (CQE) mode for platform-specific
> requirements or compatibility reasons. Introduce a host-level quirk
> `host_disable_cqe` to forcefully disable CQE negotiation and allow ICE
> to function through the legacy request path.
> 
> When the device tree omits the "supports-cqe" property, the driver sets
> `host_disable_cqe = true` and avoids enabling MMC_CAP2_CQE during card
> initialization. This ensures that even CQE-capable hardware falls back
> to legacy SDHCI request handling. A minimal `cqhci_disable_ops` is
> provided with `.cqe_enable = cqhci_host_disable` returning -EINVAL to
> force the fallback. Other ops are left NULL for safe defaults.
> 
> For builds without CONFIG_MMC_CRYPTO, the driver uses standard
> sdhci_add_host() to avoid unnecessary CQE infrastructure initialization.
> 
> This allows platforms to forcefully opt out of CQE usage and ensure ICE
> operates reliably in legacy mode, providing stable crypto operations
> without command queuing complexity.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>

I'm confused.  If CQE isn't supported by the hardware, surely it would
make more sense for the driver to not advertise the host as being
CQE-capable at all?  This patch seems to introduce an ambiguous middle
ground, where the host is CQE-capable but not really.

- Eric

