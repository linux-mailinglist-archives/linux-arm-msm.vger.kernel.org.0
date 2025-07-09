Return-Path: <linux-arm-msm+bounces-64243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7DFAFE985
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 15:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC7F91C80D84
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 13:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD0126B763;
	Wed,  9 Jul 2025 13:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZvXiYa6r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6FA1FF1A1;
	Wed,  9 Jul 2025 13:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752066023; cv=none; b=K67RDCyLRmHJGY76Zk6jYBnRkzCVPi3WirloHIPi5Oex/XsrHxUp9NxqsBoqS2mSkME+2JGoBg+rQ7QaWbrFJpoE8psknF+ULmaNfP0L0ZUQNG2O6QYn5WHVx7Q7BkfkTX0tdTgfjrAtv6AuXsbsJqa7S4W9WTC9GQX9OQ7cl68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752066023; c=relaxed/simple;
	bh=zjN1EqSs5feHJcr9hvhBaKcrFYs+69j1nCzHmIv8uzg=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=R3FwalpeajWgOEbWSWErpg2V80tPEn4W8Oq1Tx6a630VCF3br42YoeoPZlBsdriK2bdmow0HLn/YZKUcLaZR6GaP0Re7ovn80DOak3ESeXe2q81GS4CZWX6pRqqmI9WkE1z8xqnDcRb21DCBlnXawhW2MDrmzOG6A8SZRHHnJUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZvXiYa6r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64AAEC4CEEF;
	Wed,  9 Jul 2025 13:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752066022;
	bh=zjN1EqSs5feHJcr9hvhBaKcrFYs+69j1nCzHmIv8uzg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=ZvXiYa6rJqLev/o0yZg+TY9cbsmCPtJJMP11X9Jgw7ypTIu09pi12WmKm/709Q88K
	 lwWVH/wf7rX2RR5P/eG9P0xIdM5E/4eoWjfjdJu3/k9ldQ4cQnXws19Z9TAbDnUiLt
	 vP94LkIIM6rmTv29DC5zqyUOwLymn4FU51ksCcDpPKqvyLrYBqmoezZfXQJuAL/+Ka
	 GpolKroKTkoJbW26qcugH5d7GGPZewiOHUw5EJ79ZRNdf/n/U1TMozosyc7qSI9B4M
	 lRtZfNDIWrT4W1G0YXFmwp99DJ7sRdMOFBkMADnjF4Cc0EMAh8IwI/oaBLiXdDimUi
	 RWPXgXHmyHlGw==
Message-ID: <dbe4b2308a70dfc86a89c65f518fdc69@kernel.org>
Date: Wed, 09 Jul 2025 13:00:20 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Brian Masney" <bmasney@redhat.com>
Subject: Re: [PATCH 10/10] clk: sunxi-ng: ccu_nm: convert from round_rate()
 to determine_rate()
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-10-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-10-3a8da898367e@redhat.com>
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

On Thu, 3 Jul 2025 19:22:34 -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> I manually fixed up one minor formatting issue that occurred after
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

