Return-Path: <linux-arm-msm+bounces-87951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 667C1CFFA5E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 20:07:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 27FED30185E3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 19:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0073341072;
	Wed,  7 Jan 2026 18:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o9s2CUzG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25DC3A0B20;
	Wed,  7 Jan 2026 18:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767811107; cv=none; b=IdA1w55eXqyb//yiIuUBlAzSAm9o9XVf+nBogWmCTj1qOAYHW9K77l+urv1KmQs1rcjeF6foq8MAUuw8X35uxNbDFDD41RuNGBpIK3I07VGJYgGyQfldqqFnvO8dh8g6m9RlKtelQxABwVOQ2ZxzgiZImtkJcY0ZteNuFIjz7ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767811107; c=relaxed/simple;
	bh=oyvNuXb7taYW8VLoMJoGgmNG+UIKqDnWUMoNNAUQEa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YRoD8uaSlWrGXba9Cc1Yxz/q1vOLfy4T48Ujy77+GcJhZ5y9ZedcZXEc1pxga/33hE16CE2g0M+FfCT3Pie3e8x7/yIQfLe99P0OlBrWCbKoU2Uxrwpt73KbTfmUKs2olCc3SeI+dohOVOY9O542bVD07nAA1nHLb4BCJPOMtkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o9s2CUzG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC0BC4CEF1;
	Wed,  7 Jan 2026 18:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767811107;
	bh=oyvNuXb7taYW8VLoMJoGgmNG+UIKqDnWUMoNNAUQEa4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o9s2CUzGnHtfrNJIqX9PiY+Lszwi4Hwsc9KRXUTHerIvb1l0+LiN2pHQV4+a9Wltp
	 sV5j0X4UcuniG0sqs5Q5zcH5QUdjuOCsecRaHiorMyyHVvJi/1bNGgxNamVUoCxkXe
	 O+1FnWI9LSFTLtxvlqAzfYM4EG2p1fI5r/cZ6ef4vYwh980ZCcFUaE6nT53Egs/gAv
	 IqAurX+hhyBMq4l3RebhAFX+loEC92dUUVV6FJXNnW+slTDqiEcO+ZZgbrntbw7vjx
	 zmvX3UfXrqemL5YKioIFsGyfkFx40cllWXIYjqb7ocAeLHsVsvrX5B2Mahd3aOsFLd
	 bExdywyjgvaOQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sireesh Kodali <sireeshkodali@protonmail.com>,
	Adam Skladowski <a_skl39@protonmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Lypak <junak.pub@gmail.com>,
	=?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] MSM8917/MSM8953 Remove ALWAYS_ON flag from cpp_gdsc
Date: Wed,  7 Jan 2026 12:38:16 -0600
Message-ID: <176781109961.3262943.7043862169715494791.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251117-fix-gdsc-cpp-msm8917-msm8953-v1-0-db33adcff28a@mainlining.org>
References: <20251117-fix-gdsc-cpp-msm8917-msm8953-v1-0-db33adcff28a@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 17 Nov 2025 18:58:46 +0100, Barnabás Czémán wrote:
> cpp_gdsc should not be always on, ALWAYS_ON flag was set accidentally.
> The flags were used for debugging purpose and they were left as always on
> at the gcc drivers submissions.
> 
> 

Applied, thanks!

[1/2] clk: qcom: gcc-msm8953: Remove ALWAYS_ON flag from cpp_gdsc
      commit: 5f613e7034187179a9d088ff5fd02b1089d0cf20
[2/2] clk: qcom: gcc-msm8917: Remove ALWAYS_ON flag from cpp_gdsc
      commit: e4eb42f290aecac0ba355b1f8d7243be6de11f32

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

