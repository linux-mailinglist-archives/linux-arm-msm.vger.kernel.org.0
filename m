Return-Path: <linux-arm-msm+bounces-43396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F131F9FCCD0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:31:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1051E163131
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03D941DD884;
	Thu, 26 Dec 2024 18:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BicnnEWB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6EB1DD867;
	Thu, 26 Dec 2024 18:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237651; cv=none; b=nZFVxr04ZTbYvGnLW5WbTMcpANmP8z3ocizHNjTlEs3wqQJtg/Bqn1XEtMGAeBURrTfXNE5O7hMj7XYUOAnlSFlN7t2+XEn2hIjHTz+PeViQTtBk8/f19wTv139kwRiFQH9/zi8QyRfJDYbQ8l2sZG5UIp4POkVG4NHSsKXP31g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237651; c=relaxed/simple;
	bh=cZ/wRP8jq1Nbg+yg2cXwCcnW41Z4fVTy7Wm64hE/5+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GV5m2/LJGOr8etnudFAhVmCnGoGgolWoumK4ytBmP9mgFriwZY1TuRSeONgi0axAhw3k062SKJFv6pNZ8p4BLQXplMF91oRKwA/XYwRSDmla9yoqh6MNz3Cd52ulvx35daFppwQlPGDr4ap/NVjQBWAWhIInA9pt9uMzhvSY17k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BicnnEWB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DC49C4CEDE;
	Thu, 26 Dec 2024 18:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237651;
	bh=cZ/wRP8jq1Nbg+yg2cXwCcnW41Z4fVTy7Wm64hE/5+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BicnnEWBWZ9WTcrswrZu+NkVnmcPsQFj7D8or/DHtCILUp1Z4VlZOEHwm/fJWVSoj
	 3BtfNQCvijofIZK+HeaRxbRKU04GCcsxnaVsFnPOwJU/f6s6hbeKt+n2cPIwLjpCJz
	 brp3x2WGHp1nmxAmcdhQy7cuLXrINXdg6IX074S6fEzriw4CNYkhUE7SXCvtZH72bA
	 tIT0cI1BM6LTrSam5SnszX51bHp85PAp+diLMI7eDorUAUbOUoid74lyyT4yr+L4YU
	 tzHOkokEZyj9tvJs5vM40E2FIkKl5r9iSB7sbU0ZACULgxREczOoAlaCRXGkqs/8CN
	 Mt+X7Fs09VCgQ==
From: Bjorn Andersson <andersson@kernel.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: (subset) [PATCH 1/2] clk: qcom: gcc-sm8550: Do not turn off PCIe GDSCs during gdsc_disable()
Date: Thu, 26 Dec 2024 12:26:49 -0600
Message-ID: <173523761377.1412574.15694387383996577078.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241219170011.70140-1-manivannan.sadhasivam@linaro.org>
References: <20241219170011.70140-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 19 Dec 2024 22:30:10 +0530, Manivannan Sadhasivam wrote:
> With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
> can happen during scenarios such as system suspend and breaks the resume
> of PCIe controllers from suspend.
> 
> So use PWRSTS_RET_ON to indicate the GDSC driver to not turn off the GDSCs
> during gdsc_disable() and allow the hardware to transition the GDSCs to
> retention when the parent domain enters low power state during system
> suspend.
> 
> [...]

Applied, thanks!

[1/2] clk: qcom: gcc-sm8550: Do not turn off PCIe GDSCs during gdsc_disable()
      commit: 967e011013eda287dbec9e8bd3a19ebe730b8a08
[2/2] clk: qcom: gcc-sm8650: Do not turn off PCIe GDSCs during gdsc_disable()
      commit: a57465766a91c6e173876f9cbb424340e214313f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

