Return-Path: <linux-arm-msm+bounces-65367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC45EB08410
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 06:35:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4890EA47D64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 04:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E542264CC;
	Thu, 17 Jul 2025 04:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Met08Opl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FD42264BF;
	Thu, 17 Jul 2025 04:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752726702; cv=none; b=rAuhNhxeCPFpCLSXY+gnIXKNYqzJGcxko1yZRjb1IDF/pi/ulZYzXW1xappmWyuWfrRoOdw4TgsVowINypI7StN3XF7tfxO1rfnLHe3x6ge6vtOlo9FDvuAsfdh7vOIEqUCvhMFLt3CWJOj5DK/MaRtXlWz/E72IN9jepibofYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752726702; c=relaxed/simple;
	bh=VeFRuYupKLcjFc39elDZ2HRJdfczcogieCJnVXSgiHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e55qUjqvNjkrn1ftiNXb949P4p3pK5gB4NhEew1x0sgB+DVsCgq4j98b6Jk6iewffTkuXN3wnZjpYYmi7k5m1V43cSe3RxXrA5z5VVK94Ul3eFm+DJv+RNUF4aV8kDUotd8uHfKeO0lcLGQUrSdSO4UbddxPrZTyxC1dDMF6I8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Met08Opl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0784CC4CEED;
	Thu, 17 Jul 2025 04:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752726702;
	bh=VeFRuYupKLcjFc39elDZ2HRJdfczcogieCJnVXSgiHE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Met08OplqU/9posGy57wS2Fp5rrCqg+Kp8PRTNX3kk5SfAfHlYpM8DAshwkwQCMeD
	 m4S2YSqP4hHnzHclRs9kjyTjYvCMxdfEZlThqDzuY6Ia2l0QZLw2Q4f8ta/qrrjs2d
	 jroFaw0BT/UznR0CYppJ+vLu/AZ/IV4+M0QQ1WoqS0PK5n6p1EE4KogV3uAQgTVAem
	 gRc1dKewarTWKPvo5vB8cXvpBHo+89gtend+k5QalB4XyUjLSvxbmipo1XYnjVhb2y
	 5MIK3KC24DU37pLUB5s3TIHsxPxgnZ7EK/MndhA/s53x6ke1d8ZzrbEEGTX+7HgHm1
	 cCR4NnUGW04xw==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/6] clk: qcom: Add video clock controller and resets for X1E80100
Date: Wed, 16 Jul 2025 23:31:13 -0500
Message-ID: <175272667154.130869.9756259311071682258.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250709-x1e-videocc-v2-0-ad1acf5674b4@linaro.org>
References: <20250709-x1e-videocc-v2-0-ad1acf5674b4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 09 Jul 2025 12:08:52 +0200, Stephan Gerhold wrote:
> In preparation of adding iris (video acceleration) for Qualcomm X1E80100,
> enable support for the video clock controller and additional needed reset
> controls. Since iris in X1E is largely identical to SM8550, reuse the
> existing videocc-sm8550 driver with slightly adjusted PLL frequencies and
> adapt the reset definitions from the SM8550 GCC driver.
> 
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: clock: qcom,sm8450-videocc: Document X1E80100 compatible
      commit: 3b4e2820e1a5889c3eff274780137c61cecdab2b
[2/6] clk: qcom: videocc-sm8550: Allow building without SM8550/SM8560 GCC
      commit: b7b0799f0d9f4c6f5ca8b1ee63bc9e961a326f9c
[3/6] clk: qcom: videocc-sm8550: Add separate frequency tables for X1E80100
      commit: 92640a6d4a4f59137867b7025d54cbbf7f23f89e
[4/6] dt-bindings: clock: qcom,x1e80100-gcc: Add missing video resets
      commit: d0b706509fb04449add5446e51a494bfeadcac10
[5/6] clk: qcom: gcc-x1e80100: Add missing video resets
      commit: eb1af6ee4874dd15e52f38216dfd6a2b12d595da

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

