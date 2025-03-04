Return-Path: <linux-arm-msm+bounces-50103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BAEA4D263
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 05:10:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADF41171630
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 04:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B280D1F237D;
	Tue,  4 Mar 2025 04:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GIabnGAM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875FA1F03EE;
	Tue,  4 Mar 2025 04:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741061384; cv=none; b=meumSOlnB/P7a/Mc5fxZgWhvqNFZVLv7sEagHJCzwlKLkGlHvoWe1Q4sxix5UslfobRCA2T789bZQbBJa0kc6qghtlY+erT0U9O9T+ydQymovDouIbFe8EQZDyfrVAL6BQBcANi2UFSO/0xW/Mfh+lNzAUAqz0XwNPPG95J+QeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741061384; c=relaxed/simple;
	bh=syIdLpCJWVBcGCAZBQ+VYIF0MGuaIBWI4fi5pFzAmKA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PVzw6DBFdN/I99fYATGwkrcZLU5LwdOlS33PRV+EZu16S8A2hOQDPltfj0EWXcgqmyJC/wOM2lfWUlQWitvKH1nDX7wvFUpdr9TImQl8u5wpV6o3ZFVhH0bD4BwjcEdL7yQ418p9eKEbsRTh1g3SqmsjhNeGZnpci6y+mJStTxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GIabnGAM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F7EC4CEE8;
	Tue,  4 Mar 2025 04:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741061384;
	bh=syIdLpCJWVBcGCAZBQ+VYIF0MGuaIBWI4fi5pFzAmKA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GIabnGAM9pVYc852fc8WWCm2RGNHABkN76Nca3XivkgkvzEBS8uYuT1IY8/oCslb3
	 UkssSc/Z1KUvm4GblYc9En9WUb8BYmY8p4V0lYLjLjoI5zaINtHbMHOJrMbATYxAA/
	 sA2hdE4yzAw+aCFeixwlLuPJyDDkYljyZQmiK+9HFtzP9xI9+wi/Y29YTo0nJYwtmn
	 lx4ITo4BzxGPyRdamMYtITdS/0oA+CoqUUUlFjryOG4x5eMRi/arJ9bn9HWl3n/yeP
	 shme2fDGG8e8OaF1Zpckh8ilufWcX7iMrfMUokzrbovmmd+yrwjBXvW7XTr6PMLUz6
	 8uta/QN7aUCpA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] clk: qcom: dispcc-sm8750: Drop incorrect CLK_SET_RATE_PARENT on byte intf parent
Date: Mon,  3 Mar 2025 22:09:40 -0600
Message-ID: <174106137701.690572.12789649327185591563.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129154519.209791-1-krzysztof.kozlowski@linaro.org>
References: <20250129154519.209791-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 29 Jan 2025 16:45:19 +0100, Krzysztof Kozlowski wrote:
> The parent of disp_cc_mdss_byte0_intf_clk clock should not propagate up
> the rates, because this messes up entire clock hierarchy when setting
> clock rates in MSM DSI driver.
> 
> The dsi_link_clk_set_rate_6g() first sets entire clock hierarchy rates
> via dev_pm_opp_set_rate() on byte clock and then sets individual clock
> rates, like pixel and byte_intf clocks, to proper frequencies.  Having
> CLK_SET_RATE_PARENT caused that entire tree was re-calced and the byte
> clock received halved frequency.  Drop CLK_SET_RATE_PARENT to fix this
> and align with SM8550 and SM8650.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: dispcc-sm8750: Drop incorrect CLK_SET_RATE_PARENT on byte intf parent
      commit: 787289a1d13d50ff4ce0f496947f8817ef3fdea9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

