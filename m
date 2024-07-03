Return-Path: <linux-arm-msm+bounces-24957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D25CE924FB1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 05:38:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88CE41F2436D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 03:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A4F17BD6;
	Wed,  3 Jul 2024 03:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KqOPsf5W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3671D1C695;
	Wed,  3 Jul 2024 03:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719977860; cv=none; b=Ekv7DH178nh9ZOk6UQOecwWgvkO4nzKvSJw/J8LRKw4whHGqXfIH0O9qwiKcGNaOBd10CL0eoy2MsAC7jxtNsdFKVwQTVSICp4CDU/5CzLyq1uZE+933dd82sLz+mmMGygm7guuAi3BPrsls9l7gWn8m3YUGzLOzNmyY0kYgU1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719977860; c=relaxed/simple;
	bh=Ez+eV0V0DrQQfhrWhQA2Uf+BD+kPy5iUHMofS5U/TUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gtYlmxz+c7+gmnSfkq/yP/68I+W3rqVCrAk4govg0l+z6tUZFxdhM1Ja0LHOO8kB2HJz1o6+3JxIpIrbf0D6mm2AA7VCnGZr5bMLurwyNowguyA4/Uk/+E2/bUa0B3hHNgQA8Dn0xhRQNMPXQXhmF2+FMjgsq10j3W+TXJOATAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KqOPsf5W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E7EC4AF0F;
	Wed,  3 Jul 2024 03:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719977859;
	bh=Ez+eV0V0DrQQfhrWhQA2Uf+BD+kPy5iUHMofS5U/TUg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KqOPsf5WUPXWkWt07V3lIT+K4ZzLRTy9vl4mbKxCDa1WKVofYZvbccu/MYa4bAQsu
	 ddcu+pwa7mNKE/1QsVVJP3ChvDU/Zk+7DW2kfMlFKXwOZWNPyZPB9iF7YxRc0v6xoA
	 6rXZCRIwNTI929q7wuI+7iU4bGM4T/O0SzFROlOM8UboeJItM9+fYijJFNOX8tgvLr
	 Dxshqs1HaaaOzC+4nKw+4ByV1YeKuzoRCJMCBUrUWGfYsltkjVTghBa+iHkrrclqYZ
	 wJv9oIjowciRohOAF+QR48W3bJh2nfO9B5vrQd9HsBpfIzeKWbsI1gmDcTuI1MgScF
	 hK1eyMl4aSXaA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: Taniya Das <quic_tdas@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: gcc-x1e80100: Fix halt_check for all pipe clocks
Date: Tue,  2 Jul 2024 22:37:22 -0500
Message-ID: <171997785359.348959.10008197640965780250.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628-x1e80100-clk-gcc-fix-halt-check-for-usb-phy-pipe-clks-v2-1-db3be54b1143@linaro.org>
References: <20240628-x1e80100-clk-gcc-fix-halt-check-for-usb-phy-pipe-clks-v2-1-db3be54b1143@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 28 Jun 2024 11:08:00 +0300, Abel Vesa wrote:
> In case of all pipe clocks, there is a QMP PHY clock that is feeding them.
> If, for whatever reason, the clock from the PHY is not enabled, halt bit
> will not get set, and the clock controller driver will assume the clock
> is stuck in a specific state. The way this is supposed to be properly
> fixed is to defer the checking of the halt bit until after the PHY clock
> has been initialized, but doing so complicates the clock controller
> driver. In fact, since these pipe clocks are consumed by the PHY, while
> the PHY is also the one providing the source, if clock gets stuck, the PHY
> driver would be to blame. So instead of checking the halt bit in here,
> just skip it and assume the PHY driver is handling the source clock
> correctly.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gcc-x1e80100: Fix halt_check for all pipe clocks
      commit: f27e42c7d3ff8ddfc57273efd1e8642ea89bad90

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

