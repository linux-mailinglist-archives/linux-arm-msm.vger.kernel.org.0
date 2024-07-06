Return-Path: <linux-arm-msm+bounces-25428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA984929578
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jul 2024 00:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1EC1B217D8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 22:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9790113B285;
	Sat,  6 Jul 2024 22:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bRlaiKQS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED8B13AA38;
	Sat,  6 Jul 2024 22:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720303297; cv=none; b=DANMn4OSeWT3eWz0EejmgOPnCuzr8RsDPMadPzRi/StfnUG22PsKZ8+rlbRYjgtAKhyAamN4ul1B7CTcBjzu1Pmnwm1eB7u9tPcyMbW0zJcFVRO1tQRn/1u/P6r89cM66jutzlA7SkD3midR+8Mickguzzt9NePIsgdyvSvRSqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720303297; c=relaxed/simple;
	bh=Qwpc4/efpTqL70IGr9qUPpIjMx5Mgbkh4y5LCEEJGt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jEt2RxOGH2zvaasi0dyv6DA7pHoUvGmMkWz9rka7Yi8WClSGFby7FVHc2ABTWPrt5lmYl9eVZVCVaaiW/MF24qfmLEwCWHQ9oMCRwW9/WEXiDOFGSvDE9PfyXyakBZioemOIHPDv07WUC8iZ0wYllya5LsOsR9GOh33Lmgr2Vts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRlaiKQS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84D1EC4AF10;
	Sat,  6 Jul 2024 22:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720303296;
	bh=Qwpc4/efpTqL70IGr9qUPpIjMx5Mgbkh4y5LCEEJGt0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bRlaiKQS45IlxvihYw/6qmTpqQTSOqxEoGMh2Cr7vlR7QTZ4OetSEYlWVNBURLgRb
	 7gMBFtupFoXogiImboTUhZfeylf8VEteXyzfg/aXrxYRzpdkXsl7SH6oPviNQpvIor
	 s2AQvC8DB1MV+tKdEKqfXf10MSkftXtsfg0x69XxJmgyTocq1N/ZjrQY3tahtYmWz8
	 yF+3wDPq5VmSu9YAStl7XTEU9fHI6YZl2pD0u2orf7Fom/3hd/m5Vh/hM7jsQc0kUG
	 op+1Uw+HWivnDyGqOy/MbBL9oSmPFIXmWFSkXgFd4elpn9IPd+bTm6FGelbYDmYRwj
	 0+iUIFzHafcWQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michal Simek <michal.simek@amd.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: Re: (subset) [PATCH 00/10] clk: constify struct regmap_config
Date: Sat,  6 Jul 2024 17:01:19 -0500
Message-ID: <172030328802.28909.4573550234450892418.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 03 Jul 2024 11:50:13 +0200, Javier Carrasco wrote:
> This series adds the const modifier to the remaining regmap_config
> structs within the clk subsystem that are effectively used as const
> (i.e., only read after their declaration), but kept ad writtable data.
> 
> 

Applied, thanks!

[08/10] clk: qcom: lpasscc-sc8280xp: Constify struct regmap_config
        commit: bd2d330ee608f16a0b93ea753b75c98a1898bdd0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

