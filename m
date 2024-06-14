Return-Path: <linux-arm-msm+bounces-22685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1439086FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 11:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F783283C0E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 09:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E67CD192B66;
	Fri, 14 Jun 2024 09:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oG2pHHwC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78EC183071;
	Fri, 14 Jun 2024 09:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718355819; cv=none; b=Gg8B7Y7aT1o18o2rdootvFeKI+egznasLxBcWnZ3bjSKg9vR7DuhHZM8PjVt+/Cz8WScmW1XWTnOWpv9UETEV0mdzHXpETCiqReAoHtjhqa/4JrH7CxdIGObNv9qJse4FdU5BGBMNqMIjzPz7O2MnptLg+ly5zoBu5a/nhHSPWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718355819; c=relaxed/simple;
	bh=3t9DzPWLlAcCmcURr2lL4fnr3j8tvmwpRlWuhyHQQg4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=M/Sh/yMd481C2L1Ql25O4X16L24rnF1JFkDyzYq+7fG8N8JqXZenFUCm8uyOeCXSKC1ECSyJwTVudgJjAa+ZP8UST8ySwRfyjtf71SvYZesFKbkSoRe1dOcCygSJPEK2rALSw+6ecf/7mcLx+wS+HgM6pUbXxo0RQF2y7yRgvHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oG2pHHwC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5593CC32786;
	Fri, 14 Jun 2024 09:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718355819;
	bh=3t9DzPWLlAcCmcURr2lL4fnr3j8tvmwpRlWuhyHQQg4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oG2pHHwCOaYFrGa8eiEPt3t6JMpQ/smA7JHWd0mRhhnJd1moUjobtFBeRF28YKyNR
	 zK14cM1mdfw9TgqRzlOlIHTs1pxnhHn7RJkGeqOsEyU0dTtjnOl7IoGhaceGzO2VgS
	 kmDXh6KCDtwMM0pcHnt4Ty+v9nkd/CCH5vCb6sR9jdkyUf4o8zuunIBsXF5j1bBQyA
	 WCX0jd1vAsU2XtJWHegfP43NAqlvpENwrs8FEuDlO0j8NA/psOrTABH3zM3k+P3HyH
	 GEfqcTj8xLqmFXYB7EQE2lb5/ROUP5kibkDu1DuXGAXQV2rG1xVEorgltdB7h9v81v
	 kblFQ3HdW6nUw==
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Johan Hovold <johan+linaro@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Stephen Boyd <swboyd@chromium.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240608155526.12996-1-johan+linaro@kernel.org>
References: <20240608155526.12996-1-johan+linaro@kernel.org>
Subject: Re: (subset) [PATCH v3 00/12] arm64: dts: qcom: sc8280xp-x13s:
 enable pm8008 camera pmic
Message-Id: <171835581609.3023088.11085327166664609877.b4-ty@kernel.org>
Date: Fri, 14 Jun 2024 10:03:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

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

[01/12] dt-bindings: mfd: pm8008: Add reset gpio
        commit: 0682cfa3325fefe8a3cb1c02854135ee73b8ae16
[02/12] mfd: pm8008: Fix regmap irq chip initialisation
        commit: 6ad7f80b53251dbbca81e18a17cf6f8bcd34cb20
[03/12] mfd: pm8008: Deassert reset on probe
        commit: c251befb097ef1ebb509d48bb3e1181b94fd4d2a
[04/12] mfd: pm8008: Mark regmap structures as const
        commit: 742bdd99aa9acace13385b66c6f3946f26b109fe
[05/12] mfd: pm8008: Use lower case hex notation
        commit: a4b3225f06e4f8fa7266236407ab7de34b66f044
[06/12] mfd: pm8008: Rename irq chip
        commit: 3162cd961eba14fbb377d4f13c853c586cd5d063
[07/12] mfd: pm8008: Drop unused driver data
        commit: 40ac32d19985836348313b7087c8f37232084c54
[08/12] dt-bindings: mfd: pm8008: Drop redundant descriptions
        commit: 8643ef1213eeaf99ee529f35a6c2976ea1e316bc
[09/12] dt-bindings: mfd: pm8008: Rework binding
        commit: 8c72db5884a3c821de6ba9c387c8fe52e13e5a34
[10/12] mfd: pm8008: Rework to match new DT binding
        commit: 288b550463cf5dd21ad34f736b8c5ccb7ff69ceb
[11/12] regulator: add pm8008 pmic regulator driver
        commit: 11d861d227ed1c4068597289267247aac5ac50fa

--
Lee Jones [李琼斯]


