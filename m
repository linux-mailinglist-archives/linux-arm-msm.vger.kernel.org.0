Return-Path: <linux-arm-msm+bounces-87495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4E8CF4146
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F259530312D3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC16333C194;
	Mon,  5 Jan 2026 14:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m1RISvcF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE8A3195E8;
	Mon,  5 Jan 2026 14:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622125; cv=none; b=SHrNAXLIv9F0BUXJukLMH7ZUWctyTJ5eTsKjLahLu6X8PAAaPumddsOUb9WdwnRrOA37JR2B6VCKOaLijas3srmUssVM6GOyJuKfCjp/YcHfJx3NbJpVnaOdNV1Tb0QmAGftFFPO+Jz0Zvng/8JF6yKjDwwhyJn7T3vsihlz2ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622125; c=relaxed/simple;
	bh=FwlatwWwhf0j0Y/c0cpnobxyOHFmby7rIDXpobArU1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NggcQasvkxByYoKdiPwM+fy7IZiKwkD2ydAAZJnJlYiYYMaibMJ7hbXG11rc+bysg/l3Pz9eQ5F91BaJdH3ZQN5wpuhVSgHPhFYUu3hjHkNjhMrr12/OGWNHh9qZzTvTYQ9w9dxPmPohnPGDxc/zxqPu+oydLz8vuIsX1Nw3yJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m1RISvcF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1250C16AAE;
	Mon,  5 Jan 2026 14:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622123;
	bh=FwlatwWwhf0j0Y/c0cpnobxyOHFmby7rIDXpobArU1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m1RISvcFPcrVrw4O9LlhP6dtkdNs0gk2ZpzQZGnFceyVaeP+Evwbl9C4luZOqVKFJ
	 Fr0lo3bRlusiW4pKOaLGVesMtLwrwHQYxhJVZKbPnnq6GfDD8ZtHbNWDZyqQHsCkJZ
	 QW+gYeApPkyIkBvIlxTzk3BWVZSgcufv4hGeGyymOc0yx6GmL1b4FDOM27gP9kS/Mb
	 yNCO2dnfKJBwESn/4LLSS13XIvpoY4NXa25ztz5BfpraDP8D53UqtEoR4w7SzokE21
	 P16QOf1r3DEReP0AQ05GWUEevjhaAqsjMc/KQVsbmDZ00DMUWu36rYfJtbE3anNyvK
	 DiqjZYgFwrTrQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH 0/2] clk: qcom: gcc-sm8x50: Use floor ops for SDCC RCGs
Date: Mon,  5 Jan 2026 08:07:42 -0600
Message-ID: <176762206408.2923194.11853047530908161551.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251124212012.3660189-1-vladimir.zapolskiy@linaro.org>
References: <20251124212012.3660189-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 24 Nov 2025 23:20:10 +0200, Vladimir Zapolskiy wrote:
> In line with commit a27ac3806b0a ("clk: qcom: gcc-sm8450: Use floor ops
> for SDCC RCGs") done to fix issues with overclocked SD cards on SM8450
> powered boards set floor clock operations for SDCC RCGs on SM8550 and
> SM8650 powered boards, tested on SM8550-HDK and SM8650-HDK respectively.
> 
> This change fixes initialization of some SD cards, where the problem
> is manifested by the SDHC driver:
> 
> [...]

Applied, thanks!

[1/2] clk: qcom: gcc-sm8550: Use floor ops for SDCC RCGs
      commit: 1c06e3956054fb5a0930f07b02726b1774b6c700
[2/2] clk: qcom: gcc-sm8650: Use floor ops for SDCC RCGs
      commit: 8c4415fd17cd5979c31a4bf303acc702e9726033

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

