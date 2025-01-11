Return-Path: <linux-arm-msm+bounces-44812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7784A0A5F6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 21:43:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA5AC3A85C8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 20:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD3F1B87D8;
	Sat, 11 Jan 2025 20:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s9rHLbgo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9350114A0B3;
	Sat, 11 Jan 2025 20:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736628229; cv=none; b=toMFucm6b3ZwbwK9Ct/Lg50SgU7IBdb3YEKIHNA4zmiaSu8GU8uy3umbw5Go9qUR6oj2dJdB0Rr0rlgfV1cuuCDHTRdK9WwTJ9vW2RWQznvE5zUBVrDXnZ9gokxJiUaCy3sQfTeIrKCcK1Qgyzc0UJMHRSYHvGV410O6dFKSYMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736628229; c=relaxed/simple;
	bh=2grMNWnL4UO/kcHh8hOfSSDvbTSwytg068prNiChZ+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kZDEig4jr4CNLxkVt8Oomp7mfj8f/bQHm/hO//vF8z273ZVEFTvZdroiNke1Qcv7hvfDXIQOMs99uNu5FFUNvWQQlGcmTKQ3Jd6RMKcWM+F0xj2vX8hD10rhrsik9jo0tddtXt8j/COyx6T8wSHKRZGR4hG/JGiuAQmuBmzvwts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s9rHLbgo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7189C4CED2;
	Sat, 11 Jan 2025 20:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736628229;
	bh=2grMNWnL4UO/kcHh8hOfSSDvbTSwytg068prNiChZ+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s9rHLbgozr9JZ+Fp8Zl5BFGMS8mVEbJV+RkUxNIhAId5HkOZOd71cxKwK2bH0pa6E
	 uHXDr8TFBt741F9DI+PJckKcKIaATZ32nmWPLkvZVrAuS//DHe/pSfBTwYUt1WdHdZ
	 Plcm7X+xn6PhjXISAz3if1mxNlZy8ze3QfoVJWidOO2/fQrZ7d2t+MeoGRR/+Zuw+y
	 ICEymySOJEhvWS/SoikaLm+3IDHalYEiT3x4KKtnGmvgIZb5GsgkWDC46PZHP16tna
	 5jYE9NX7AiCur4riYEds5n2PUytjWnoTCrO5GxUH81FLSIxXmJTzYGfViFab0/3Iqi
	 1Y7mcD/AeoXGA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 0/2] Some X1 fixups for sleep
Date: Sat, 11 Jan 2025 14:43:44 -0600
Message-ID: <173662822230.416676.5788076941426106152.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250111-topic-x1e_fixups-v1-0-77dc39237c12@oss.qualcomm.com>
References: <20250111-topic-x1e_fixups-v1-0-77dc39237c12@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 11 Jan 2025 17:54:17 +0100, Konrad Dybcio wrote:
> Found some trivial things that need fixing, with patch 1 specifically
> the GPU is once again functional without clk_ignore_unused.
> 
> This series DOES NOT fix all the issues related to sleep, but solves
> real bugs that prevent us from achieving it.
> 
> 
> [...]

Applied, thanks!

[1/2] clk: qcom: gcc-x1e80100: Unregister GCC_GPU_CFG_AHB_CLK/GCC_DISP_XO_CLK
      commit: 50d09211f99bec0cda785c7aaa1d985d236e1dc4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

