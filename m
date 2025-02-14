Return-Path: <linux-arm-msm+bounces-48078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52881A36883
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 23:41:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E4E41897C15
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 22:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D11771FFC46;
	Fri, 14 Feb 2025 22:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aniUOtTA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54451FDE12;
	Fri, 14 Feb 2025 22:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739572716; cv=none; b=fPo1iNXGkz7HwrgviVC6yCBZRShK8tG5zLnqiPEQnat0d4ce/nlkXBOgrpfchYuDvgpZzBSbt/eOXl6VZwsiyZjgGgomYCeg/VGzv6Lqx78kEseNHL2DEYVFSy+YxOhimNmkDYMcm+PNoMEKYQdVC+AGZ5n2kumvp0VCbPFZaSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739572716; c=relaxed/simple;
	bh=4yHkwkKj9M0QV9AprHUcYQE3bNeQAm06ac1aIuXsJrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kqm81hEim12IyWjCPkrA+JAn2G3LHsqNj8OVpl2lHiy20c2ZiD2NmncKnL8oS5S+44T6WL/eZ5u5tveGRjX/j6wcsCCk4nVTQoLiZiTHZ7l0xdQvMVIq9FB8cNpzNOhAWLKVlDpEZfgdUenaqX36tBw2g4o4hgPoSCM/YfqxGu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aniUOtTA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A95C4CEE7;
	Fri, 14 Feb 2025 22:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739572716;
	bh=4yHkwkKj9M0QV9AprHUcYQE3bNeQAm06ac1aIuXsJrU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aniUOtTAaAxaidtslRdeA8xpPCS1A3taQjAkVAjysBsObyey8QqQsi70Maz6MeyLh
	 pmDMkKfUdGHmTMVCuGBqDIoZZed9gapqY3Pk056HI5bHKGfuv1xXvGt3Z0naf/rXUB
	 jrikhV6OJ1zxcXYbagurCSPMMKSuXmt3VsMSlqBxjbUQ0KCSG+Oy6TmlQbABbkH0FS
	 yGDISe1Rx9tH4IyN8N5aGYb06CSYiMJLL5AHbzkezr3GpPdYinP5Q4mr+OnOJIoAtL
	 uC53qXIdgJIJWvRa+SbQpaPX2lNHSkr2SX3mpRgdbSE6HzhaZjB3/V7NdQerTVArdQ
	 v0iyoaBt96DQw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taniya Das <quic_tdas@quicinc.com>
Subject: Re: [PATCH v3 0/3] clk: qcom: few old cleanups
Date: Fri, 14 Feb 2025 16:38:19 -0600
Message-ID: <173957268921.110887.3554063219285073793.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212-b4-clk-qcom-clean-v3-0-499f37444f5d@linaro.org>
References: <20250212-b4-clk-qcom-clean-v3-0-499f37444f5d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 12 Feb 2025 21:01:34 +0100, Krzysztof Kozlowski wrote:
> Change in v3:
> 1. Patch #3: Drop change to dispcc-sm4450.c
> 
> Previous changelogs:
> https://lore.kernel.org/all/20241209111315.60776-1-krzysztof.kozlowski@linaro.org/
> https://lore.kernel.org/all/20241203105707.34996-1-krzysztof.kozlowski@linaro.org/
> 
> [...]

Applied, thanks!

[1/3] clk: qcom: clk-alpha-pll: Do not use random stack value for recalc rate
      commit: 7a243e1b814a02ab40793026ef64223155d86395
[2/3] clk: qcom: Drop unused header includes
      commit: 691621dfadbf0f2afa34dbfe24b54c1fa5c33473
[3/3] clk: qcom: Add missing header includes
      commit: 1e9f7d9169c55c06e84cdd33bc1107e873910d94

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

