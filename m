Return-Path: <linux-arm-msm+bounces-64241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFCAAFE97E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 14:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8383F5801DC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 12:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633A72D9EFE;
	Wed,  9 Jul 2025 12:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GgeIWIRy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3396822DFB6;
	Wed,  9 Jul 2025 12:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752065823; cv=none; b=UIF4ljZedfMZx/RJBbeaXzT4Ewo9O0rMU46R51jQZYjqfwy8xOAE0GhpMpzrWxQ2+FvOiUz9/xeNUqTHRHcK6pw986qcwUk7JcmTMR/XJJWGZHa9ChEXG7v8rqqM+4V+J2TQT/AeGVdXarpoqCjwbVupMiEkheIzSmTH4N0IG7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752065823; c=relaxed/simple;
	bh=2/FdBoueMUahpft/Utcj50C7B9vm91jFr9cMwoTzFto=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=YPQVJ0e+24HsbyWdYJZfqxLWJk2iaEDiN/VnQD1lhBtjClz9xMlS9H00gtPal0fXG9rJF+PNA+nsTUg9sTUzfmxsz1cki/RgAChmh2ocAoOP73y/rZ5F6E2tE+Dj6+l/WI5uDmP5MMeSGF/Rm1xhNMefp5KH5T0mYFFC1Eyv8EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GgeIWIRy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B542C4CEEF;
	Wed,  9 Jul 2025 12:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752065823;
	bh=2/FdBoueMUahpft/Utcj50C7B9vm91jFr9cMwoTzFto=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=GgeIWIRyEhmPGo+uq97DiBEXkAL9cTo1o6wcJR0pHiNKyD1LxfF3wOj87znI8LzEX
	 g1PsjCNChh0Fjrx6EDUvOlnIQotWl0pojaXTki7JidrRVTvVpDmi6aEx7krfWD5B1v
	 p8TOXofq1H+zvzIbGEb7TrG42bXl0kHAJ46or1Wg1OQkZiEh/aT31Jrs1BwEpvbqry
	 HA5HCEOzTjm0lk7q5ATIOMfKDQRRQ5aZSLPpDs1nYUcwPWUxpc8k+VG9g6q8dYM/El
	 Lj1En8q8TkoCzvKbYmNJGSKeD+lohstXPYA+6IdjciQTPuUWQR0ozXq6DsV+2n8DXs
	 ruDUWPDfTcHEQ==
Message-ID: <543e6dbe26b751c6d9b69ca2137a2d50@kernel.org>
Date: Wed, 09 Jul 2025 12:57:00 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Brian Masney" <bmasney@redhat.com>
Subject: Re: [PATCH 08/10] clk: sunxi-ng: ccu_nk: convert from round_rate()
 to determine_rate()
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-8-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-8-3a8da898367e@redhat.com>
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

On Thu, 3 Jul 2025 19:22:32 -0400, Brian Masney wrote:
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

