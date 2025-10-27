Return-Path: <linux-arm-msm+bounces-78938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3DAC0E5A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:18:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 783274E0F6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399E030C601;
	Mon, 27 Oct 2025 14:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bVzZxIJ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCC3306B1A;
	Mon, 27 Oct 2025 14:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761573997; cv=none; b=UVckN32p6CaovnF/JPLCluz1VpHc31aMlfzPI9pj0SpFfVw5QEGk8rT3a/pQVqB1Qaw2EIolocFB9YYVsOFRiawKMbDoNGIQOkucKpkoffQaIhoeSynjWsVpK621U2uVwHJUSZfjl18xEQTDEYrTQmI6QpwuWZ0H+AAsTqmpX8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761573997; c=relaxed/simple;
	bh=RC/N8kYs/btrHrDEGthc/bqFWFgmuClfeq+/3MsnWJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fukBcaTpRDqBb5OzvBzuTImtkRN7sc8PZFxxIp+9bE1lzrqiLT5o3ClTCbID3gxulOKFM4Y32nSvEKnblcQlBYdqE6AgCUq+6/hCtd0y/lTP2godV9yVcFJLbo+22I4n7XqTeLf2ZH8Syuinp6BBNb8rItKVX0Pw+oWnJoDIQMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bVzZxIJ+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD6F3C4CEFF;
	Mon, 27 Oct 2025 14:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761573996;
	bh=RC/N8kYs/btrHrDEGthc/bqFWFgmuClfeq+/3MsnWJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bVzZxIJ+/XQuFEu9q85eRiTCAseNuQW2TJIcyFHoVZ+H4Wk2VFy9hULJcb+pmSqk3
	 V8jpIwqvW1zjKITcZPormIGR/UvI9SkKzn7Xs1okCKQ3hoirqUI3jedDjmdLZ7VKMN
	 hGXmZO/veFqPI2e8E6jIMK++fCaE/yfDcEWcYEwaqkrrUzO+RKSfshWwTc8aPTLgw2
	 cm4qnM0ss+rcdrYwslLyoYyBNqJP9P4NeLGVPnv9NSUGhQ7GrSrAlwlao7WFSOEBp1
	 /A1fiAXbztXvbCPV7gMEhtLZt0P+4OakSiVcXcaacV8BA1q521/XTQJ9ZbcvW6WuSr
	 3Ekr48ta1di7g==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Danila Tikhonov <danila@jiaxyga.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix Agera PLL config of CAMCC for SM6350 & SM7150
Date: Mon, 27 Oct 2025 09:09:11 -0500
Message-ID: <176157405463.8818.13339628165200674226.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021-agera-pll-fixups-v1-0-8c1d8aff4afc@fairphone.com>
References: <20251021-agera-pll-fixups-v1-0-8c1d8aff4afc@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 21 Oct 2025 20:08:53 +0200, Luca Weiss wrote:
> On SM6350 I noticed that CAMCC_MCLK* refuses to turn on (being stuck on
> off). The cause seems that PLL2 (of type Agera) is not configured
> correctly due to the implementation in clk-alpha-pll.c differing between
> downstream (e.g. msm-4.19) and upstream, and therefore the USER_CTL
> value is not configured.
> 
> While looking around, it looks like camcc-sm7150.c has exactly the same
> issue, so fix that one as well.
> 
> [...]

Applied, thanks!

[1/2] clk: qcom: camcc-sm6350: Fix PLL config of PLL2
      commit: ab0e13141d679fdffdd3463a272c5c1b10be1794
[2/2] clk: qcom: camcc-sm7150: Fix PLL config of PLL2
      commit: 415aad75c7e5cdb72e0672dc1159be1a99535ecd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

