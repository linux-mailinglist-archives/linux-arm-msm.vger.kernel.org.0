Return-Path: <linux-arm-msm+bounces-64242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB071AFE981
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 14:59:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EA63566924
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 12:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FBA32DAFD2;
	Wed,  9 Jul 2025 12:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rEkQUPEE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AEC2DA75A;
	Wed,  9 Jul 2025 12:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752065988; cv=none; b=AxuRZOLDdb3O4JPUNdBzXU0lDNGPVaA1HkLunsG6AlpSo28scA+p2PyAyWmhr77sWjhuawS7g10e7gYc+56p2pvMB6cetL42OTaWMf3wyr4ifu3lvZgFi1z+Q8tzKWTBje6pzMg5yTnI9ZJyD/QYp7nFskTcsIxQ3KJagzgz0pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752065988; c=relaxed/simple;
	bh=ycNsgGVeVycZicAllgUYY8qE+864AV0icVjw8hF9IbU=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=NJsipsAVpwshnTshdOB2htKdttLraTAqHGuw19IFL6Fa39kB/7kZZBaD/clo/WuG/b+1rfWHjOmC1RBGLgWWlgMGtJzFhgX8NyX6nLpyE5IGyL/rTScngealEObPGWfrIxlnKrUCnxqsgiQ3aXqOhIuoEzwPsK5NNcB3+NX5BCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rEkQUPEE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E44CAC4CEEF;
	Wed,  9 Jul 2025 12:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752065987;
	bh=ycNsgGVeVycZicAllgUYY8qE+864AV0icVjw8hF9IbU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=rEkQUPEE+PMftE6ooVo3j+a/qVNlBZ70AZ0RXxDR7+YgvvKswVDkdVvTCxj18Xnd9
	 3uNhd4XMgzPoy41Al45tUyoOmY+EUDTT8Kio3ugifbEYU6X0uAswgx1Ix12Lcm1j3V
	 O4940QibzqRMWmF+x0vw0F1JsGCqpv0NsuPOB04GZ8pmFdpFJbVZNh5fqHzrqH5gEG
	 WwpCGZC5qZlmWP42D7xV8c6RngJtV3zznU4sQtnCewlRQdqSjeC2ewEXTAJH3nTPNh
	 5d/GqTjx9onv7aVXHfJnTdjgS8u95/XjcZ1fnCl5X9du+H/5BqNF9E0PKTNWi51SWq
	 jDGSGgb8oUuTA==
Message-ID: <b5b8a7a1dec9e470d7c6f41ec5e23f25@kernel.org>
Date: Wed, 09 Jul 2025 12:59:44 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Brian Masney" <bmasney@redhat.com>
Subject: Re: [PATCH 09/10] clk: sunxi-ng: ccu_nkmp: convert from
 round_rate() to determine_rate()
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-9-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-9-3a8da898367e@redhat.com>
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

On Thu, 3 Jul 2025 19:22:33 -0400, Brian Masney wrote:
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

