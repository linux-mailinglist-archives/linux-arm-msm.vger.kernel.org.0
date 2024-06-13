Return-Path: <linux-arm-msm+bounces-22629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0096907A1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 19:44:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 844101F259A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 17:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B6E14A0A8;
	Thu, 13 Jun 2024 17:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKChHbCS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B03E441D;
	Thu, 13 Jun 2024 17:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718300671; cv=none; b=b3rkbGFTTg39SUMYv/p3L4roZvgkLNbacpvtA4sbs7KymzWyzfy2RlT6zFfkPEODvu4gA3woBK8t6URTuHkjMSZngQavqShomAaKK7FyTniav2Oqt7Yf01nASe6Nb/UVcEya5VN+rGKgELdD3+99+8WUz5wzXyumRrE5+3+RWzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718300671; c=relaxed/simple;
	bh=6ApbTuiYjW+p/zfFUWaeoQanCLRt7mrUEvmeVLsb/rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rV60okjT8/F2JEpJGaDwhk3s0Hxowze/G0E9vvj+8zdA/5CkPB15CbE7Bggy3YA7JuIbhmFF5l121FuUxr7uOy/CpAhHUXNKXFN7uTFxLH8P4v1mYQSW/n6U3P64rOTkU3ymZGU65X7BtU68jN9bHsa1AelkR9msT2VcSWdU+V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKChHbCS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE759C3277B;
	Thu, 13 Jun 2024 17:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718300671;
	bh=6ApbTuiYjW+p/zfFUWaeoQanCLRt7mrUEvmeVLsb/rk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XKChHbCS7wUWsaL5Ru5xevc/3sDXVrO8o/9VY+yqP7gmnDhU3Jl+78tJKwJNKJix0
	 Is6yexTc1H3ln0KnL+GvCJZOaN2qHPVq723nrug14KdyNZjx6wlZDE1EEEhdaVugKr
	 qjITTxvJz6l5EBr3L5ye9xvA2DVIovFM5sK83bNuk0H4pxuAM48ft7IxWtr5WQrgcE
	 YY4d0BB6UpEB7+bboYzHnzTLV/fsyWVlKJSlcmInrM5SXw1NkAV07RuGgBPHMEcWoH
	 F/Y9lCaNG2ong5OjCD6LeW11qYYlRiyr8+F5Tu7r7HjbQW7J2E0iHfvoFz8/gl/pzk
	 AwvqprBRhKMxg==
Date: Thu, 13 Jun 2024 18:44:25 +0100
From: Lee Jones <lee@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
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
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/12] arm64: dts: qcom: sc8280xp-x13s: enable pm8008
 camera pmic
Message-ID: <20240613174425.GV2561462@google.com>
References: <20240608155526.12996-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240608155526.12996-1-johan+linaro@kernel.org>

On Sat, 08 Jun 2024, Johan Hovold wrote:

> The Qualcomm PM8008 PMIC is a so called QPNP PMIC with seven LDO
> regulators, a temperature alarm block and two GPIO pins (which are also
> used for interrupt signalling and reset).

[...]

> Johan
> 
> [1] https://lore.kernel.org/all/1655200111-18357-1-git-send-email-quic_c_skakit@quicinc.com
> [2] https://lore.kernel.org/lkml/20231003152927.15000-3-johan+linaro@kernel.org
> [3] https://lore.kernel.org/r/20220828132648.3624126-3-bryan.odonoghue@linaro.org
> 
> 
> Changes in v3
>  - capitalise MFD commit summaries
>  - drop pinctrl patches which have been applied for 6.10
>  - amend binding commit message to clarify that the binding is unused
>  - move pinctrl subschema under pinctrl node in binding
> 
> Changes in v2
>  - use IRQ_TYPE_SENSE_MASK in regmap_irq table
>  - add post-reset delay
>  - reorder pinctrl binding and driver update
>  - split out binding cleanups
>  - use platform_device_id matching
>  - replace underscore in supply names with dash
>  - use more fine-grained includes in regulator driver
>  - rework regulator driver and update authorship
> 
> 
> Johan Hovold (12):
>   dt-bindings: mfd: pm8008: Add reset gpio
>   mfd: pm8008: Fix regmap irq chip initialisation
>   mfd: pm8008: Deassert reset on probe
>   mfd: pm8008: Mark regmap structures as const
>   mfd: pm8008: Use lower case hex notation
>   mfd: pm8008: Rename irq chip
>   mfd: pm8008: Drop unused driver data
>   dt-bindings: mfd: pm8008: Drop redundant descriptions
>   dt-bindings: mfd: pm8008: Rework binding
>   mfd: pm8008: Rework to match new DT binding
>   regulator: add pm8008 pmic regulator driver
>   arm64: dts: qcom: sc8280xp-x13s: enable pm8008 camera pmic
> 
>  .../devicetree/bindings/mfd/qcom,pm8008.yaml  | 144 +++++++------
>  .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 123 +++++++++++
>  drivers/mfd/Kconfig                           |   1 +
>  drivers/mfd/qcom-pm8008.c                     | 169 ++++++++++-----
>  drivers/regulator/Kconfig                     |   7 +
>  drivers/regulator/Makefile                    |   1 +
>  drivers/regulator/qcom-pm8008-regulator.c     | 198 ++++++++++++++++++
>  include/dt-bindings/mfd/qcom-pm8008.h         |  19 --
>  8 files changed, 532 insertions(+), 130 deletions(-)
>  create mode 100644 drivers/regulator/qcom-pm8008-regulator.c
>  delete mode 100644 include/dt-bindings/mfd/qcom-pm8008.h

Applied patches 1-11 and submitted for build testing.

Once complete, I'll get the pull-request out for Mark.

-- 
Lee Jones [李琼斯]

