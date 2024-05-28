Return-Path: <linux-arm-msm+bounces-20679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8858D12A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 05:34:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8A9C1F2265D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 03:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DB7745C14;
	Tue, 28 May 2024 03:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EFitBGUI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7043945978;
	Tue, 28 May 2024 03:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716867166; cv=none; b=B9Xnlowp/sb7orX+LbeOeVbZPEpJaaEUki3GRwUSA4L7do916bIPHdNoPho/Kd1xKFjbET1ldjrcK2F5JDqF7Rm+KaOdEhKngylssx3I/3IgMqvbk+6K4i96irQcnL3IcjHd1BnmnEnCrzoI2zXUXNBnMAkRCIB0kY6/zpbhy0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716867166; c=relaxed/simple;
	bh=FEMqyikHlnfufx3BpNvl4Twes2fwF1iFzs/RrCB2nx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sz2XF+65viAJtnlqhKYYFN4HpPidFT1eN92+o6/xPlDoPWrJoKjnCrTZf9fimgIwhtXuk93JGng3h4YAymbV1MLbbo3izccYbPBUjJlNU6xAyXV8+ySSjxfH15Ecq5HybSqfPAFGfn3bYDAws9EZIq2UnV57Mccn+WfuZPzQoMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EFitBGUI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C467C4AF0A;
	Tue, 28 May 2024 03:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716867166;
	bh=FEMqyikHlnfufx3BpNvl4Twes2fwF1iFzs/RrCB2nx8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EFitBGUIr+QzdgHOKU9R3nyC6icSjerZy1f7XBSLOdKBpNH/rbjHfFvsA50y8PUpw
	 2bh8FV1gZ+Jrezb3z79S7EEK7Gypt+37DPUtGjMLZJihmIk36L+J0M80mVV4QRP21X
	 Ad/QqYFOb1X7UglY0j3AfdUViESQA+4F1aezfaU5OSyuLiCSKvpOre9/TKzQ4ez9oV
	 3HTIhkIQpArbFZQ0YEanhW5EGADGOUFjAhz8dLK3T/18IglOlfGkPwcpEDo/lgvAh/
	 BDoP95D+3bibWKMyH5fb3m0cuxX6pmpf0k7Xp5EwItM97ejLAsiEKYxRj4HDenFWgx
	 6zAaNqkjsKPVw==
From: Bjorn Andersson <andersson@kernel.org>
To: konrad.dybcio@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	david@mainlining.org,
	adrian@travitia.xyz,
	Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/8] Add dispcc, videocc and camcc for SM7150.
Date: Mon, 27 May 2024 22:32:12 -0500
Message-ID: <171686715162.523693.3154527617909497285.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240505201038.276047-1-danila@jiaxyga.com>
References: <20240505201038.276047-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 05 May 2024 23:10:30 +0300, Danila Tikhonov wrote:
> This series adds dispcc, videocc and camcc support for SM7150. This series
> also introduces various fixes for sm7150-gcc.
> 
> David Wronek and Jens Reidel were added as maintainers. These people will
> be able to test new features at any time or make fixes if necessary.
> 
> Changes in v3:
> - Split patch 1 into two patches (patch 1 and patch 2) (Konrad)
> - Drop CLK_GET_RATE_NOCACHE from dispcc (Konrad)
> - Fix DisplayPort clocks (based on a series of patches from Dmitry Baryshkov):
> https://lore.kernel.org/all/20240424-dispcc-dp-clocks-v2-0-b44038f3fa96@linaro.org/
> - Fix typo in cover-letter-v2
> - Link to v2:
> https://lore.kernel.org/all/20240321202814.59835-1-danila@jiaxyga.com/
> 
> [...]

Applied, thanks!

[1/8] clk: qcom: Fix SM_GCC_7150 dependencies
      commit: 97cf92963aeff328829007dd1f5ba51e815438d0
[2/8] clk: qcom: gcc-sm7150: constify clk_init_data structures
      commit: 734b6e7a3b947c045ba9e5f853f6ea33bd78d097
[3/8] dt-bindings: clock: qcom: Add SM7150 DISPCC clocks
      commit: ca3a91063acc3abc0fb233591d8cda4b37dc39ac
[4/8] clk: qcom: Add Display Clock Controller driver for SM7150
      commit: 3829c412197e14b8cac445d0e3a76c7cd5fff064
[5/8] dt-bindings: clock: qcom: Add SM7150 CAMCC clocks
      commit: 0fd2a048368ea99feccd7dfd6a5f42f6d011f10f
[6/8] clk: qcom: Add Camera Clock Controller driver for SM7150
      commit: 9f0532da42261476561c0a683097f6de82e7c3ed
[7/8] dt-bindings: clock: qcom: Add SM7150 VIDEOCC clocks
      commit: a4be1860b9319e9e55eaa9e28e35e7b19128060c
[8/8] clk: qcom: Add Video Clock Controller driver for SM7150
      commit: aa9fc5c90814fcb9ecabbb505e097ff05abf962e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

