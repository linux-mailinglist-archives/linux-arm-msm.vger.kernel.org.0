Return-Path: <linux-arm-msm+bounces-64767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 115A9B037C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 09:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB08F7A4085
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 07:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE37233701;
	Mon, 14 Jul 2025 07:21:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF4D22F772;
	Mon, 14 Jul 2025 07:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752477689; cv=none; b=oMkif9mwfFpoqiqAOOTBG0SybMNCxtuFr7WMLeIQc22BZv/rbMR4is80oTRaJuJIvo5h0mFwv9ja/kn/CJ6dW0BSL4WMrqOurHATLUjyyw5fXjy1e0fSKiCANrgU33IqC8apuEUHHtCApXN8VKpW060UxXmbjsaBMgD4VpLiHUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752477689; c=relaxed/simple;
	bh=31zPVtFzDYB0pfKAV+z+qFaQhpWSePR/M/ur2bh52hY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p33i9/B1ZGeW7SxBmjxszQA3tT3fgKMO8LmxVOx7SvaZX10IpzpJfaZ5DXiZFNroAPKLc9ltITpF6i2Km5WseCzKo1qzTLIijkcsfKpt4/3936FEGd94fiRNoN/y7y+8T93FkdOfD/bS8bzuzO+U0J8kRZYSrQDpqL8zwBRenLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A213C4CEF5;
	Mon, 14 Jul 2025 07:21:29 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 6D3BD5FE7F;
	Mon, 14 Jul 2025 15:21:26 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@redhat.com>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
Subject: Re: (subset) [PATCH 00/10] clk: convert drivers from deprecated
 round_rate() to determine_rate()
Message-Id: <175247768644.1732129.7805401715825787511.b4-ty@csie.org>
Date: Mon, 14 Jul 2025 15:21:26 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Thu, 03 Jul 2025 19:22:24 -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() ops, so let's go ahead and convert some of the
> outstanding bcm, qcom, and sunxi drivers that have a round_rate()
> implementation over to determine_rate() using the Coccinelle semantic
> patch posted below.
> 
> This Coccinelle semantic patch is able to automatically convert ~95% of
> the clk drivers, and I can clean up the remaining ones by hand. I'll
> initially post some small changes to get feedback about the approach,
> and I can post some larger series by submaintainer once we get
> agreement that the approach looks good.
> 
> [...]

Applied to sunxi/clk-for-6.17 in local tree, thanks!

[07/10] clk: sunxi-ng: ccu_gate: convert from round_rate() to determine_rate()
        commit: ee9c15ca0f628435334afef74d2ff03112d80bf0
[08/10] clk: sunxi-ng: ccu_nk: convert from round_rate() to determine_rate()
        commit: 2b0d4f1b3f8524b413208d47099c445eaf7c18f5
[09/10] clk: sunxi-ng: ccu_nkmp: convert from round_rate() to determine_rate()
        commit: 8bc614c6ac3c97cef385aebc6520ddcfa0fca8f7
[10/10] clk: sunxi-ng: ccu_nm: convert from round_rate() to determine_rate()
        commit: 80395c3b47577c12121d4e408e7b9478f7f88d02

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


