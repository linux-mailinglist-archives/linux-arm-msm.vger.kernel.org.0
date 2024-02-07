Return-Path: <linux-arm-msm+bounces-10038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4764084C3DC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 05:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBB2C1F26E82
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 04:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C9015E97;
	Wed,  7 Feb 2024 04:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EeA9viT4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EB91CFBE;
	Wed,  7 Feb 2024 04:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707281212; cv=none; b=uTOLFVIrurjS4AYU0iM0pchvy6WNzv3Nn2WqVBWPPISlFaY/m45xsY02xkiieE6szbmfxAGvBg4kjjxMrwwyBXqOCuMrHr/VJqCRM3ZoCfxPJb9uUOvlFdB9dpIp74HP1oCxNIF7rWNcl5EiarNFSv1pHEwY+QK63nwfGI82C1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707281212; c=relaxed/simple;
	bh=+PcPMrYqbpZDP4a5pqh7NUFtht2b/c/evlo1yaTO20k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VfT/pjTkHezCEN1JKKWaLpF3oMXvQ2RmH4pIYQiVaHhTqjBhfw0s2+fOqaA3lQwnJIOEWYZK3wRv8pJAjhDGapKA3WjYpL60z/EWPTWSZuU4mijHIxZArQzWTMdGT3DTD9oho3bAQ8qCLIVAIJtA4HzhRIEgmejP/aBVfI2LUas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EeA9viT4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54ED6C43141;
	Wed,  7 Feb 2024 04:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707281211;
	bh=+PcPMrYqbpZDP4a5pqh7NUFtht2b/c/evlo1yaTO20k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EeA9viT4UmySX9ZjYOn9VZnNPqqeb4QHeKWTsnv9ZSN2gLhaGtMnrrs8Pej0EepYD
	 8iw6LOyuB45hWVU6rdYlKHW6G9bsfvN13JO2rX+rpy3ss9YwUWryn8i5qEjda8JVTP
	 3SsY4UnPpfFJukVuh108eSiw0U+QtHvo8XQWiL+WDrij5cX3V/+rVR16YPjNtwScE/
	 ZiSiZf5kkxtryuha1tIAx4FK7610kZtuFdNyrmzs6xHa44KO8ErPNx05b7cgofayXQ
	 YKWFuDdOD47PEI8C8sA+KUBbrGlbUe+0qnMlUBVEqA3QKrB3zjcauDsYDa02HfBnJ1
	 GC9SZAW1Tw/1w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/4] clk: qcom: use module_platform_driver() to register drivers
Date: Tue,  6 Feb 2024 22:46:15 -0600
Message-ID: <170728117675.479358.3901878809237532059.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206-clk-module-platform-driver-v1-0-db799bd2feeb@linaro.org>
References: <20240206-clk-module-platform-driver-v1-0-db799bd2feeb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 06 Feb 2024 17:25:11 +0200, Dmitry Baryshkov wrote:
> Several Qualcomm clock controller drivers use subsys_initcall to
> register the driver early. This makes sense for GCC or TCSRcc. However
> there is no need to register camera, display, GPU or venus clocks
> earlier. Shift registration to driver init level, where they belong.
> 
> Note, I didn't touch lpass clock drivers, they need to be analysed
> separately.
> 
> [...]

Applied, thanks!

[1/4] clk: qcom: camcc-*: switch to module_platform_driver
      commit: 0ac31d8c2bb90312071e299a23b3299adde13736
[2/4] clk: qcom: dispcc-*: switch to module_platform_driver
      commit: f4ccb184940247c784e229a739344678e487046d
[3/4] clk: qcom: gpucc-*: switch to module_platform_driver
      commit: a5119f7dbf90d12d169f3e3088908ead1955c1b0
[4/4] clk: qcom: videocc-*: switch to module_platform_driver
      commit: 95dd41487aecd1e8feeca9e10c6b28243b2f6145

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

