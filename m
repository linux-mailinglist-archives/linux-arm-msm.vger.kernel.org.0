Return-Path: <linux-arm-msm+bounces-64240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37215AFE979
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 14:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9065E5800EC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 12:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3218F2DA779;
	Wed,  9 Jul 2025 12:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h0vmTSF6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BDE2D9EFE;
	Wed,  9 Jul 2025 12:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752065754; cv=none; b=Ng/XUXKRaIuChLzaY1iDvP5f9gTMoX6OaqayA7ktXEqf6VEMNdXjM315LGgeM70iWffmF063WB8K76vrPPWA5rsr4QX+vUF5k80uwFO87GKjI8X+GW2htOV2m6J2h+vKhQV38pTJZ9/fbo1njIbL+IPn912rgG8eS7/4tSQ56wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752065754; c=relaxed/simple;
	bh=qfvfN9HqncnRD9mLmFdxPNtB3Y1t4uk1+PKJGdZGCjs=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=UmN5aJVtTw6QkKv3Mi0MFsZ8a1Ks787nUIayzLQTLWJQhc9Zsy7LL9sTByjkgRe/6e9lZd9U/zjHiZdhnuxMoVi/1um1VYKl8mnyl9QUtcJPrTzQ/zO9LNY6NGG83BZSTkuXr19wcsfQw1bqVlQqFLPkIRo4EdWaXxmMvTWknWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h0vmTSF6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30BE7C4CEEF;
	Wed,  9 Jul 2025 12:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752065753;
	bh=qfvfN9HqncnRD9mLmFdxPNtB3Y1t4uk1+PKJGdZGCjs=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=h0vmTSF6R6KDUgBJ4nXYA/5Dekeg7WMqU0Cp3RD9bEWQy8RZSTkeqXHuMM6owHm8v
	 GCPmi1hIwXA5M0OKWhBVBgKTKZjmtS9/K7w9HLAh/dcFl8EU/Z5PQTydpJYi5DpVpQ
	 IOcjYmLuK3seTkkxqP5h8i6PuYvtlCTFYsxOL5ArY/0v9Ra9eWW2UiuuefSoLgNpCq
	 dkL9TdOrMdc8k+1xKiiYMSTH3Vak2+lape7+eEeSNAjIAG87q9Bm6aO8Fo2N9eZja1
	 0EQTAvOK95DAF8MZbzTpisGR0bfMJdzBid/giv/pmS1LN9xKhNK+FG1OHnHuVxhL9A
	 k5g2xHWPmcFXQ==
Message-ID: <65fc4a7a9a5dab16cf3c599f93404d04@kernel.org>
Date: Wed, 09 Jul 2025 12:55:51 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Brian Masney" <bmasney@redhat.com>
Subject: Re: [PATCH 07/10] clk: sunxi-ng: ccu_gate: convert from
 round_rate() to determine_rate()
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-7-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-7-3a8da898367e@redhat.com>
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

On Thu, 3 Jul 2025 19:22:31 -0400, Brian Masney wrote:
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

