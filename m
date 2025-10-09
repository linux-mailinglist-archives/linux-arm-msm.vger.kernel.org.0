Return-Path: <linux-arm-msm+bounces-76714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D389BC9F8D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 18:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A7984257E0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 16:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BEAF2F39C7;
	Thu,  9 Oct 2025 15:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YbplntkQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016992F3607;
	Thu,  9 Oct 2025 15:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760025589; cv=none; b=uAmkyYmbbl0zlWp3WIbz58vd+oR0b5vNptQES7ACNeltXWz5hzzX9jHKjMXPhbrYfhWkl3+lCJ5ikJlI4r3urup28nI4KC/Y3db8TYklGrGNKKyB9HspJ7Bkz/TcysOdhsX8AJXnedI3PWNp6smp6u8eM1KbmVjJthHLbvbdOCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760025589; c=relaxed/simple;
	bh=x7XsPUNyTbcza56IAzRLWYfPOmdRR/G07WqzFH4exMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iHDzyK3e2iTQrq5vqvQFqw9QtPH9IzUXmoXddPukISTRQ7rcb+fnNQmJarInaoF1W+i/t3M27/bbgupAB03XApzFngC7oeo9Ll6VS1HWdsTOlgjQb0+CGfC05bHPItrFDIYK8F6S9ibme0p/WFt87/0+2fdigs0TnwMVwgWMz5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YbplntkQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA87BC4CEF7;
	Thu,  9 Oct 2025 15:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760025588;
	bh=x7XsPUNyTbcza56IAzRLWYfPOmdRR/G07WqzFH4exMY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YbplntkQf3YZZyaoXOWxS9/u5SdS9V6QdzVgSxJh/L/MqY0B7LwRVE/jvmu38sbu7
	 heGht34RAAGrUiK6hkAZY0bcZYIap2yZIq899TA80rDxikk+7Q0YSGwPVdcj8nRJwF
	 5DMYOcnZiuxUM2MBqhqEPLV9w/HoSRMwjX+6ZRlC5rH7YLAUmj/7X+OgzlEoaB2JnF
	 TrZlo4LVbE7B2oJk3neGjyct2dXcJ1cIw//jEUIPfOtiayYmCKNaHYcF5+1KkM0DCP
	 +l+MZbksW9oOJ4NHM1uNarPflhXPQG1W/f1TbAxsQ75wiWIZ4eeeD+nFt8ERk51N5U
	 S/9fZ9e0WyReA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	andersson@kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-5.4] pinctrl: qcom: make the pinmuxing strict
Date: Thu,  9 Oct 2025 11:55:26 -0400
Message-ID: <20251009155752.773732-60-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009155752.773732-1-sashal@kernel.org>
References: <20251009155752.773732-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

[ Upstream commit cc85cb96e2e4489826e372cde645b7823c435de0 ]

The strict flag in struct pinmux_ops disallows the usage of the same pin
as a GPIO and for another function. Without it, a rouge user-space
process with enough privileges (or even a buggy driver) can request a
used pin as GPIO and drive it, potentially confusing devices or even
crashing the system. Set it globally for all pinctrl-msm users.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES – with the prerequisite series in place.

- `drivers/pinctrl/qcom/pinctrl-msm.c:219-227` now turns on `.strict`,
  so once a TLMM pin is muxed to a function it cannot be re-requested as
  a GPIO by a second consumer. This closes the long-standing hole where
  a privileged userspace process (or a misbehaving kernel client) could
  grab an in-use pin via gpiolib and drive it, confusing or crashing
  attached peripherals.

- The pinmux core side already enforces the exclusivity checks: see
  `drivers/pinctrl/pinmux.c:79-143`, where `ops->strict` blocks a second
  claimant unless the current mux function is known to be a GPIO. With
  `.strict` enabled, we finally get the same protection for Qualcomm
  TLMM as many other pinctrl drivers already enjoy.

- Safe backporting absolutely requires the two earlier commits that
  landed right before this one upstream:
  1. `11aa02d6a9c22 ("pinctrl: allow to mark pin functions as
     requestable GPIOs")` adds `PINFUNCTION_FLAG_GPIO` plus the
     `function_is_gpio` hook used to keep GPIO-mode pins requestable
     even under `strict`.
  2. `b65803da894ca ("pinctrl: qcom: add infrastructure for marking pin
     functions as GPIOs")` wires that hook up for TLMM by tagging the
     `msm_mux_gpio` functions and populating `.function_is_gpio` in
     `msm_pinmux_ops`.
  Without these, setting `.strict` would regress every board that
applies a GPIO pinctrl state and then requests the same line through
gpiolib (the common regulator/reset pattern).

- Impact scope is large—the TLMM driver serves virtually every modern
  Qualcomm SoC—but the behaviour now matches core expectations, and
  legitimate GPIO users keep working because the GPIO function is
  flagged appropriately. The only fallout should be catching real
  conflicts (double ownership or debug “pin poking”), which is precisely
  what we want to prevent.

- Change size is tiny, architectural churn is nil, and the fix has
  Reviewed/Tested tags. Risk mainly comes from omitting the
  dependencies; with them backported, this is a low-risk hardening fix.

Given the security and robustness benefits, and provided the two
prerequisite commits are included, this commit is a good candidate for
the stable kernels.

 drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 83eb075b6bfa1..bdce967710a31 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -293,6 +293,7 @@ static const struct pinmux_ops msm_pinmux_ops = {
 	.get_function_groups	= msm_get_function_groups,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
+	.strict			= true,
 };
 
 static int msm_config_reg(struct msm_pinctrl *pctrl,
-- 
2.51.0


