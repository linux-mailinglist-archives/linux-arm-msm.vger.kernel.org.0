Return-Path: <linux-arm-msm+bounces-81736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BA6C5ABCF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 01:15:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3B0FF4E74B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 00:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD85322B5A5;
	Fri, 14 Nov 2025 00:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqDn9EZC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C5F2264B1;
	Fri, 14 Nov 2025 00:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763079230; cv=none; b=kdyuYn/UASUTyCHj1Q5wYvQmkXfh0qAnsiCCSy1Q3DhIU2GGvCOScWUTHi8Yu3FfjDeCtvNn2g2dVWw3lUUx6JqjJyHtKt0Ql3HHRD3gjBGjEirHTO2Mv9RRuRtZbZIc61Y7oUZ4ACYN6MQcG9ws62UXNcC1quYCC4raNDY0Ras=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763079230; c=relaxed/simple;
	bh=P3HUXF/SRfc/w6BBFx1ytm523NSIHRP74dwlDUpc14Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oQee2yw6IbV3T3xLuYDEc++t0c5N1pX2f/DztTt5JS2PArMWk/WSRzU+7iij9pYvSNfA83/RIgBBGT5VpP9dDA6puEQ/6cgITJ6qX0/p0ycGfuBlN+u4MPRkjCgfZUAnjNStuDMfQauVGpe43BS3htx1nybLsdwYAO+CWeH29Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqDn9EZC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CDB1C4CEF7;
	Fri, 14 Nov 2025 00:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763079230;
	bh=P3HUXF/SRfc/w6BBFx1ytm523NSIHRP74dwlDUpc14Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lqDn9EZCqvRe9Hk+GdQtdvjRkqE+Z4p7CoPCVG9Qx4bBfQuNERQrGWQjWg3qig4Oo
	 i47xDkaGt1bmmb0R/w6xtz12+6OGPYhmrQ5zwIQo7EHeXymo4lc48x/hx16lpzl5Ai
	 Le4bebOzIWUOPKQEbeUPi5g+nJQ0O7ZQbw5qLOBuJaq/ScHbYdS29WCESfus8RaLul
	 UNV2fqBx4LAd9ygSvlSzbZki1PEQEcHGyNHhb2AaFq7ja6AAXjVRzVwqzqSFE8TiZP
	 8VfjPsSroarY5ZRp4knczW4Q3auv7jU7NgtgtiRmUg7u0fjZ45q3MxkNdDHFKWes6l
	 clJ1rebxw0/IA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: use different Kconfig prompts for APSS IPQ5424/6018 drivers
Date: Thu, 13 Nov 2025 18:18:08 -0600
Message-ID: <176307948650.2565969.2719321144890771568.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251113-clk-qcom-apss-ipq-prompt-v1-1-b62cf2142609@gmail.com>
References: <20251113-clk-qcom-apss-ipq-prompt-v1-1-b62cf2142609@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 13 Nov 2025 17:42:52 +0100, Gabor Juhos wrote:
> Both the IPQ_APSS_5424 and IPQ_APSS_6018 symbols are using the same
> prompt which complicates to see that which option corresponds to which
> driver.
> 
> Add a prefix to both prompts to make it easier to differentiate the
> two options.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: use different Kconfig prompts for APSS IPQ5424/6018 drivers
      commit: 4145fc363eb23a1caf14f7ebf6830ab32bcaa50e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

