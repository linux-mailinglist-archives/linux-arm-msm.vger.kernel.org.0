Return-Path: <linux-arm-msm+bounces-28575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1B79527AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 03:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CEA6280F35
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 01:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1C017C9;
	Thu, 15 Aug 2024 01:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y7xiJc69"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA042566;
	Thu, 15 Aug 2024 01:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723686861; cv=none; b=VMdxI1FaCYN1G3hXfvUI/MWHR+xjeQJoyCgHjawhsPjRG7XuFA7eGVGAAK5DQqeyTJGzP19DdEchdj9Q7yalzSeT2qFEglM6HYSDBXw+ZlDURYgo168bw4IpPnreIpfmp2Y03NBXT8BWlb1EQdLnFE0QWb5uDsjpWn5mZ0vDH7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723686861; c=relaxed/simple;
	bh=d3sfWeHxva1JfLaQJzj6iXdO0zdjlM4Noz+FAhMcASs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eTvbx7aaOK+6ycmS91fBGBpwmy93gJDnre3v+4a/eFGNfzh/1CSiD3QXUUWZ8LdwunRZLgSO4O+4k2VMNUepY9SSYdjsGLN3WVa4oYFBqBNNvSewEgmXC1YZYLiXLq1wH8Wn3J1S2PSTqSynL7rW2WelQP1TfsTTQtpgkjkr8X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y7xiJc69; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 556D2C116B1;
	Thu, 15 Aug 2024 01:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723686861;
	bh=d3sfWeHxva1JfLaQJzj6iXdO0zdjlM4Noz+FAhMcASs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y7xiJc69pPg//0RljRGwFYP8X81e64inreUMz39L86yVktJHUJbOeLMM/2ehlgi8z
	 RF5K7uJIuIrqfQfl1dqQOpiVu/qPQQHjqlL/uOrkuMX3fus8IwO91qxMFWoGUFabI4
	 SSLmTeOaZ3NKpD/zKbrYnAayIvMPfyfu35MapAhS92W+Y5gnRHR7svAA/IrMMjA6pF
	 2Qx0a2EE76eCm0ded6rMMZa/Kwf/QV3X0sXcgxCk9Tzr+Fr/NaiIw951dJSO9vOy1q
	 hOqntWDHNggZZ1MaCnskAyNZ7BnXyrbK+0NWIY+AjLT1x1sRTRPBnc7xAw6HvbjQQ6
	 i4XSuiTO+LPXw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Fix USB 0 and 1 PHY GDSC pwrsts flags
Date: Wed, 14 Aug 2024 18:58:37 -0700
Message-ID: <172368711404.4025076.14228696784117021827.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240801-x1e80100-clk-gcc-fix-usb-phy-gdscs-pwrsts-v1-1-8df016768a0f@linaro.org>
References: <20240801-x1e80100-clk-gcc-fix-usb-phy-gdscs-pwrsts-v1-1-8df016768a0f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 01 Aug 2024 13:21:07 +0300, Abel Vesa wrote:
> Allowing these GDSCs to collapse makes the QMP combo PHYs lose their
> configuration on machine suspend. Currently, the QMP combo PHY driver
> doesn't reinitialise the HW on resume. Under such conditions, the USB
> SuperSpeed support is broken. To avoid this, mark the pwrsts flags with
> RET_ON. This is in line with USB 2 PHY GDSC config.
> 
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gcc-x1e80100: Fix USB 0 and 1 PHY GDSC pwrsts flags
      commit: f4c16a7cdbd2edecdb854f2ce0ef07c6263c5379

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

