Return-Path: <linux-arm-msm+bounces-23506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E693F911B08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 08:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EC4C1F23698
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 06:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8C916B396;
	Fri, 21 Jun 2024 06:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T1X41ZdR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DA7169AD2;
	Fri, 21 Jun 2024 06:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718950298; cv=none; b=DRwfsQZ5gC6v9O0B/HwwTZOSItj+V7FP9GJ4rotsCBGSrzrWzrr50kb4+C+/IeAT1/udZybvKrJtJLHvnDwQwFYOdFRXTPiIzEurGi3StyVfS5qQo0ymF9DJMTl3GRa0oH8hhhNHLOU5Ri0PkkjrlUpEmeEsZOig8gWTwhencXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718950298; c=relaxed/simple;
	bh=BZt+veMvicZfg+/3LjHj50ESYAj5EfFKkBhsDDQKDsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sTJUOFxbHw1R8742HiSp4ZXrgQjuoQPfM11Kss0c2b7oG9kwok/+gDZbICL5OniI7sAGmOBD4l9dR2YdmIpX4a4esY7dIN1fDFTVPWThmDRc4pxhxf9oiN/dcFrj9sqVLUCsIBPuMUZQVZiZD8bLvo+3oifBTaJLoV3byJZekJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T1X41ZdR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFFEAC2BBFC;
	Fri, 21 Jun 2024 06:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718950297;
	bh=BZt+veMvicZfg+/3LjHj50ESYAj5EfFKkBhsDDQKDsA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T1X41ZdROeZbyntrDazXGXDHy3njqXwIheBOhXhfmtuMjk872ItZ4WR6A1dp2JLNz
	 Xiu8AhlNTNv61CTbEApCgikUak2FziMI8GDKDKOLGMPbMiJ9vrKeNdSUAEqmWBQaNd
	 SnKjESgw8acVqAQpS2q5Bb+M1QePma4ykhPoehIZyOqr4IKPyHCmZ6AMlAh4Su6gaZ
	 fSrFAJsmGoPxCJIzF5XYAEYJIf47dwS8ZxOTh6atZM1/UxVTdFrcJcZ5J0Urix56CY
	 KbHRMRkqWEMBjh2DNFZngRXHZkCR1KD/q76JQkh5Z5BAtBFX7SOrGSWn2yzk+VXvRe
	 N+RKzTlEUtkYA==
From: Bjorn Andersson <andersson@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 00/12] arm64: dts: qcom: sc8280xp-x13s: enable pm8008 camera pmic
Date: Fri, 21 Jun 2024 01:11:19 -0500
Message-ID: <171895028814.12506.2554893315123333787.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240608155526.12996-1-johan+linaro@kernel.org>
References: <20240608155526.12996-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 08 Jun 2024 17:55:14 +0200, Johan Hovold wrote:
> The Qualcomm PM8008 PMIC is a so called QPNP PMIC with seven LDO
> regulators, a temperature alarm block and two GPIO pins (which are also
> used for interrupt signalling and reset).
> 
> Unlike previous QPNP PMICs it uses an I2C rather than SPMI interface,
> which has implications for how interrupts are handled.
> 
> [...]

Applied, thanks!

[12/12] arm64: dts: qcom: sc8280xp-x13s: enable pm8008 camera pmic
        commit: b5477d5f5272a079e2ddeffd00490528884f5aa5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

