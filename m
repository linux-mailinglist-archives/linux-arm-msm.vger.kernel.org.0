Return-Path: <linux-arm-msm+bounces-33386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DBE992F1E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 16:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C78661C2390A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E439F1D88B8;
	Mon,  7 Oct 2024 14:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mv2cjmqu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F6B1D88A2;
	Mon,  7 Oct 2024 14:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728311176; cv=none; b=A2P0vWOX0tBx2vRNX0TGrXxdDRFXy+0SHWjukCkQbY3YOkkPWUfW8p2+V2xxax4v5XOp4PfeDGzKJGf56JkOkqtuphOTC3nlOukc7ICZFTL3pzglK8uHPuhoi9aVKDZDn3HqMwVpfUch+cNa7tgLIMEz2d1QbbRLFCAOoSrJ188=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728311176; c=relaxed/simple;
	bh=G71cJDp1TTQd05RxCRuYohvb/OQiZJ3YQgkvPTHtaU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YaWeUy+hVv2WTq7sjbN3AZpn6K6PJjlq/qP0mVSEhHZmJqs7p7/Al/lLFK4W6/QX2ypS6WvcMzxe0GlPg00IL6fnLrY18IlTZkJvIAbSkKdXDYHC/05ZpEigmybsYMNf0kbr2TnpwpoBspcgumkArWAaK3p1t/1ZS+ckhVjEOdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mv2cjmqu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08307C4CED4;
	Mon,  7 Oct 2024 14:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728311176;
	bh=G71cJDp1TTQd05RxCRuYohvb/OQiZJ3YQgkvPTHtaU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mv2cjmquyYO+BnNxGfsZUu19T0bbcaBfUG+Wk1KEFxOPE9dh7zSqS6Abc4p2dwLse
	 C4LBXpkD1A6T3zlrqo6OMfikdKI/gWqxLb3EVtd9JglXBc34WTTsT949O7Gw/7wfpS
	 /LSmTcBgJKffHo0eQe5J1IwciUOP2zLD/aptiKO8d1DA6sgYZMvfKraoN3BMjQ9t5w
	 fUhz5QAaONqQUwDHBxkNrkl0JdQO8cfdJQeuaH6ZPIjOZWrw2B20tB2Ht93J2T1Mi3
	 2seQy4Yrxmu2RMkgW/j3RZAtxNHmlUBFvEnLqxjDvHrqTtElnuDsuR8i3Qs1FTU0p+
	 IcAQwXk/bNoDQ==
From: Bjorn Andersson <andersson@kernel.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	vladimir.zapolskiy@linaro.org,
	quic_jkona@quicinc.com,
	dmitry.baryshkov@linaro.org,
	konradybcio@kernel.org,
	quic_tdas@quicinc.com,
	Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@mainlining.org
Subject: Re: (subset) [PATCH v2 00/10] Add SM8475 clock controller drivers
Date: Mon,  7 Oct 2024 09:25:50 -0500
Message-ID: <172831116171.468342.11727202774760978131.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240818204348.197788-1-danila@jiaxyga.com>
References: <20240818204348.197788-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 18 Aug 2024 23:43:38 +0300, Danila Tikhonov wrote:
> This series adds support for SM8475 to SM8450 clock controller drivers.
> Was tested on Nothing Phone (2) aka nothing-pong.
> 
> Based on this downstream commit:
> https://git.codelinaro.org/clo/la/kernel/msm-5.10/-/commit/b051ec6bdc4b4884905002b2e75753e6f1238d20
> 
> Changes in v2:
>  - Add prefix to SM8475-specific clocks (Patches 1, 2 - Krzysztof).
>  - Define new PLL configs instead of fixing existing ones (Patches 4, 6,
> 9, 10 - Dmitry).
>  - Drop symlinks to headers (Patches 1, 3, 5, 7, 9 - Krzysztof &
> Vladimir).
>  - Use SM8475 as a prefix at the beginning of structure names for greater
> clarity (Patches 2, 4, 6, 9, 10).
>  - Link to v1:
> https://lore.kernel.org/all/20240731175919.20333-1-danila@jiaxyga.com/
> 
> [...]

Applied, thanks!

[02/10] clk: qcom: gcc-sm8450: Add SM8475 support
        commit: 20e06dc8c97010c36dd608fbfbed07272f621e1a
[04/10] clk: qcom: dispcc-sm8450: Add SM8475 support
        commit: 7c0e8764dc3381bc51e76dea9a430f3330a90b08
[06/10] clk: qcom: gpucc-sm8450: Add SM8475 support
        commit: 0b71e3b03b9625d3ec909b8b1c305bb0ca506558
[08/10] clk: qcom: videocc-sm8450: Add SM8475 support
        commit: f7f4afdd9f8b4aa263a6113dcff7097514ef7894
[10/10] clk: qcom: camcc-sm8450: Add SM8475 support
        commit: b815ccf5bfcf95dc2c0a9a421278e0060df35a63

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

