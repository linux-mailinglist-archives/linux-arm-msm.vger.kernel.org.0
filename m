Return-Path: <linux-arm-msm+bounces-33384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBCA992F14
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 16:26:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 848A8285E0D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562151D798C;
	Mon,  7 Oct 2024 14:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iGDOepA6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F9D1D6DB9;
	Mon,  7 Oct 2024 14:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728311174; cv=none; b=nMrghC8pmNTDR74b/BKcEOF8O6vXVqREf1fwzapTm5Q+wU89bbktVzG4jz7NU9lUezV9YRVK2clNGIoA4TS9EU6Uq3mjlUx6RqtcCNdH53cVe8jLkWooR4ZqSuuUIU09ihKzXIoi/pUw8H76OQa1oGcAV9qlOIvS6USnMXGXsCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728311174; c=relaxed/simple;
	bh=u/loiK1Q7VjFVy+f5V2Y/h6o9JbiLQB6m8f71HOvrCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fP+YT7W40bOBiKqOS+k9Lg7phd/0MOMY0J85a/thh7i69xLivA0m9JnN/nvcCBKVhaP2xI8wReYMjP2ZkW1LDrYGClfqXd3rnHxLXlvsQTl+sT6S1Y2RwYGzw7XgaiHyYIkoJ6BT+uNY+083o/sIu9yDGh/ZB2u1NOU+lVGgaX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iGDOepA6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E1AC4CED2;
	Mon,  7 Oct 2024 14:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728311173;
	bh=u/loiK1Q7VjFVy+f5V2Y/h6o9JbiLQB6m8f71HOvrCY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iGDOepA6cNHi9+54pr4vXCbAfNbJZtHXJCTrcGAWazEiJ25Hq/9fEeMMFIdUCkgj3
	 RYF0l5HF23D1/Oa8B4VERAxIDXHjDSfUGt+EYW6CDVng5AlFu0ZTGhYDy16qZUI2Ae
	 JzccB9iSCPaKZIskX9HrAc+tvUec4U5nPYZ89dtT8nfewESZNyMekfzkBKyI7hhUxR
	 ppIIsJOghYiXK6+NsDZLDVKdauIg3yTaIPrcu3Dzi3k89l/wOOw0JXytB1bMqanHzE
	 QzCBNxw8DKtIW95akFATEKrbhEWqOV6zbp9dSn7HA1pvcIiR/IgH9UvK9jirAdATtQ
	 1p9j1P5dlcO0A==
From: Bjorn Andersson <andersson@kernel.org>
To: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Sagar Dharia <sdharia@codeaurora.org>,
	Evan Green <evgreen@chromium.org>,
	Andy Gross <andy.gross@linaro.org>,
	Girish Mahadevan <girishm@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: geni-se: fix array underflow in geni_se_clk_tbl_get()
Date: Mon,  7 Oct 2024 09:25:48 -0500
Message-ID: <172831116177.468342.8898139480339823363.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <8cd12678-f44a-4b16-a579-c8f11175ee8c@stanley.mountain>
References: <8cd12678-f44a-4b16-a579-c8f11175ee8c@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 30 Sep 2024 10:51:31 +0300, Dan Carpenter wrote:
> This loop is supposed to break if the frequency returned from
> clk_round_rate() is the same as on the previous iteration.  However,
> that check doesn't make sense on the first iteration through the loop.
> It leads to reading before the start of these->clk_perf_tbl[] array.
> 
> 

Applied, thanks!

[1/1] soc: qcom: geni-se: fix array underflow in geni_se_clk_tbl_get()
      commit: 78261cb08f06c93d362cab5c5034bf5899bc7552

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

