Return-Path: <linux-arm-msm+bounces-65347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A30FBB083CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 06:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F8BB1C20EE1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 04:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB861202983;
	Thu, 17 Jul 2025 04:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PDiskj3p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA960201269;
	Thu, 17 Jul 2025 04:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752726680; cv=none; b=QGAaLmTSfla+ls5lY4nYRerAFReVmncm+SuGFz9C0gpfMyzXIVbcbzkCNmTnjBiQUxo+GEps+AlL81HFaggEARxBxwT0gyVJkQltd/yHdmqqZUeVHaUHqicsA+WDFZ0N6JtJRxZGELfjtxeC2SsniCjnjLXht0AhOOOCbKw9Bis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752726680; c=relaxed/simple;
	bh=IM68S//NvUk9WOnAVFcOtxIP85pYqJsXzJfP01d3rmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q1y3SNTfarUHqchGxJ1qhOFRlOBUYe7Amvhv8q2pKUyGm/1fo75eyGiyG3pNcif6AG3XwzZF17aKhYqh1PXWBRZuxeOIVtVsZgsr+6/3Vke5cgCNvI/ZSsacuRkyNbSfLPsbb9Yw0kS9cJrANszDdFebyEJfqeWXTBZDKvevdqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PDiskj3p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB0DC4CEF8;
	Thu, 17 Jul 2025 04:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752726680;
	bh=IM68S//NvUk9WOnAVFcOtxIP85pYqJsXzJfP01d3rmY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PDiskj3pbtFFwWBsuiRXKd7QTukP+bg9n/LtZzr4+kMf8kZLpvFnCR1B5ePhqXRC0
	 v/pPAjZ/En2daNHaSWiK22g8MBKKI/3IzaTtDKGTNiNNBp+Ixt2aluhMVezkqGqOWH
	 ujyplu5d2UlgNap9+SBtTrTFtW00963rjBWlcplLNsAK+YqEeEAVQwRYl/Z5kvk1cy
	 eoAO6lIbhJ0PAcTUU7WJr49iDDrjKp+BC7SwfXeLQgX5ba4AaXa0Tk/6l1dHK7kDF5
	 GnaHkbBuZ2UBCtE0WeOwcRNo2MkhoKYphbhefkdDZFSBpTkcExnO9siG13/eVe38AK
	 oMimYhtWBMudQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@redhat.com>,
	Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: Re: (subset) [PATCH 00/10] clk: convert drivers from deprecated round_rate() to determine_rate()
Date: Wed, 16 Jul 2025 23:30:53 -0500
Message-ID: <175272667152.130869.11156864283181133253.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


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

Applied, thanks!

[02/10] clk: qcom: gcc-ipq4019: convert from round_rate() to determine_rate()
        commit: 3ebefed3d3afbda632b5647a06598e1bad1baeb6
[03/10] clk: qcom: rpm: convert from round_rate() to determine_rate()
        commit: 120c4b7a35a2e2414fc3e35b34526b60ac54515d
[04/10] clk: qcom: rpmh: convert from round_rate() to determine_rate()
        commit: 2c0dce7392fdc0fcca1f133114c7c4295ac69233
[05/10] clk: qcom: smd-rpm: convert from round_rate() to determine_rate()
        commit: 11add2107c04bdcfb499cdb96ab156a4646ec9e1
[06/10] clk: qcom: spmi-pmic-div: convert from round_rate() to determine_rate()
        commit: ebec04773bf313280fe1cd9c0877c73660e69a10

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

