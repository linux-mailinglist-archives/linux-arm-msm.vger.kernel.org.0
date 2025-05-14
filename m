Return-Path: <linux-arm-msm+bounces-57999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE9FAB77A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 23:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C8FE1BA5C34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA5D297106;
	Wed, 14 May 2025 21:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d00Kcvhi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9B929671C;
	Wed, 14 May 2025 21:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747256690; cv=none; b=Rds1+OfBG4JMU86cOCtsLTYprkCr1yrkBGZYxT3N9dkqNMq5OlzjxGhc36mKBv1BIzQx+jB2eJ2OBvDgnYMZRLowV7Bohas9BCezJWJocZhQCrfdQLrR6qEMbpJIBmGki3DvppOSat4FU7W+yPtZbtl5FblN5kFXq5Bb6F4dg48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747256690; c=relaxed/simple;
	bh=8dAQlNr8wkgJPQta9+l99fjn6mNBAmRuVHQnNcWtNzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jJcAa3WhGO1HcD0pFIHF+9/LjVIInJS75NVQbMzld11Xh8z846xZCljUarY+ZY0+PhsRZQhRAaFXkqML+6EVMq9Pr2U9/UbZhUx+qgd0zcQjQ4NcK60XdN4W9xy31n+GOKR+J1h9ZpteawCprJq81uuOeOgi89F6jSd8lzN4UVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d00Kcvhi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A315C4CEED;
	Wed, 14 May 2025 21:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747256690;
	bh=8dAQlNr8wkgJPQta9+l99fjn6mNBAmRuVHQnNcWtNzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d00KcvhiXjEAzWfLLrt3KzUd4TOeDwFaA4bsZqNf8mKj3+iEYHcVCsK9vPTUfyLep
	 NstKMFFAuvOvWDV7ovwUkIZX8du1j4elV0jCSWsqmnAmMC6dm5lVoog8p9rGhty7LD
	 Fk0eLwo2Mftov3omlga1lQOt1AuZhPKKxQArZg4gygiNWSK5YtRlMceyCx34mak6vx
	 eQEGPvRdnIV5dDYz7XIBmoyzXcoaXO5WTZlF1DsTwnY49BW5yfQEc7H2SQS1dnxSyf
	 JtgZ379wlEhWLacBf1q7k+QdOIi/WEV/Y8IjJ1WJS6GOIJLp1I3PnCWuBDpryg61U1
	 wTSuKqbCAGdfw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawn.guo@linaro.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>
Cc: Stephan Gerhold <stephan@gerhold.net>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH RESEND2 v2] clk: qcom: gcc-msm8939: Fix mclk0 & mclk1 for 24 MHz
Date: Wed, 14 May 2025 22:03:53 +0100
Message-ID: <174725663058.90041.15815541810993408682.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414-gcc-msm8939-fixes-mclk-v2-resend2-v2-1-5ddcf572a6de@mailoo.org>
References: <20250414-gcc-msm8939-fixes-mclk-v2-resend2-v2-1-5ddcf572a6de@mailoo.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 14 Apr 2025 18:45:12 +0200, Vincent Knecht wrote:
> Fix mclk0 & mclk1 parent map to use correct GPLL6 configuration and
> freq_tbl to use GPLL6 instead of GPLL0 so that they tick at 24 MHz.
> 
> 

Applied, thanks!

[1/1] clk: qcom: gcc-msm8939: Fix mclk0 & mclk1 for 24 MHz
      commit: 9e7acf70cf6aa7b22f67d911f50a8cd510e8fb00

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

