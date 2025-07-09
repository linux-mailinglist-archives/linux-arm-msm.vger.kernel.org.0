Return-Path: <linux-arm-msm+bounces-64239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CF2AFE977
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 14:55:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EF16566E20
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 12:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D852DA779;
	Wed,  9 Jul 2025 12:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/vc0fqB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B431D2D9EFE;
	Wed,  9 Jul 2025 12:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752065723; cv=none; b=LIilXGlONMc8bfYLBwylPvhYyikvZ9+UlxvwRu/p3fhVN/LuecL2kgsv7wN4OU0yMto3E2CXbfilB0lWBKngYZogm96bUbpsi3IPy5ewHU+pT1VbnmUCJQ0fmcOUigRfwx9KMk4a1R4jM1mfiv428eYU5TuHeCaabcQu1dmPGj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752065723; c=relaxed/simple;
	bh=Zh8LvONHdmGvRE4Yc4ww2qFIsqRlv00+9BzFh1Du8ig=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=CukU/KnLXeEOqaqj0OQUKPWCCWE2aBBE6FSQw3JQBBG5RGgAcXE4VE7cwNqbN6o8yYfDroq8nxmk6amwn6AG+YD4g89i94uHH4fKwctGgM/L9TZJ+zui7i/QrRqicp0GNGbgRV1K4at7ReiJxiVZW8RFZWzbQXlNjiPDcAJ/P/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/vc0fqB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC35C4CEEF;
	Wed,  9 Jul 2025 12:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752065723;
	bh=Zh8LvONHdmGvRE4Yc4ww2qFIsqRlv00+9BzFh1Du8ig=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=l/vc0fqB0pDvdv2oHRma7pF8ljkaepoQK96Vw0Nro6kSZq4CFQT8aSJIXj5onFI/2
	 HMGg8fVQNUlDMsmKXU8AtbKHtmOyoExKr6yTE9eYUkfoP4BC+KHApx7YjkZBhzbP5j
	 qERNKlPKSBtmwjd6KQ793pR4F7Dyg97XAjf7pRMZPLqXD1CNgm4btk2h5SGS6EGUWY
	 BOiYRsJomBp7DtzmBTAui0C8qrQ93d8vRJkaBdT4E6rc2RvH9lS7rcbyOrROEsKg3U
	 o7iHH4mxYuXbxgq0BD/O32Nre6aH02zsVpS9+Q2F/pYsAalja3ofF2zjTjc4ckSbvF
	 +pdr2pNGm+QRw==
Message-ID: <b1bd9768ffec3f6f5d48e9148e8872ba@kernel.org>
Date: Wed, 09 Jul 2025 12:55:20 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Brian Masney" <bmasney@redhat.com>
Subject: Re: [PATCH 02/10] clk: qcom: gcc-ipq4019: convert from round_rate()
 to determine_rate()
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-2-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-2-3a8da898367e@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, "Bjorn
 Andersson" <andersson@kernel.org>, "Broadcom internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "Chen-Yu
 Tsai" <wens@csie.org>, "Florian Fainelli" <florian.fainelli@broadcom.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Maxime Ripard" <mripard@kernel.org>, "Maxime
 Ripard" <mripard@redhat.com>, "Michael Turquette" <mturquette@baylibre.com>, "Ray
 Jui" <rjui@broadcom.com>, "Samuel Holland" <samuel@sholland.org>, "Scott
 Branden" <sbranden@broadcom.com>, "Stephen Boyd" <sboyd@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

On Thu, 3 Jul 2025 19:22:26 -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

