Return-Path: <linux-arm-msm+bounces-22123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6DF90127B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 17:57:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3CCF5B21958
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 15:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589F317B427;
	Sat,  8 Jun 2024 15:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACKCeqlE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2185A179675;
	Sat,  8 Jun 2024 15:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717862241; cv=none; b=arJ82nhTFtWWm/X6ekRt6BuDedH0MZQWEySzG4WZdHxkBuYUEXB4PhfKmhZ/rHvWMv+z+hcIHDpOXc9j7YwqJDvgTar1P9jPCe4MuXE76Hwjt/gXuI4J/nFZUGFRjEeRNchwErICJoyUSpXHVOnYhcJCgF0kzgPUnijomBS67uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717862241; c=relaxed/simple;
	bh=/Jh9coYaFc0rLGi3MqirZcpVzbXxOvXrtbExwDZaIe8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PqC6zMX4zo377K64OQp9AnA95YlUybtImJjKXLn0RMBc2rpDzTUFnVdKHI0yhRwUsyYcw8xAqhCJPUXdrX6BFH3nvoMDWHO/Q7mvfYc8BQdrSoOgp2+PqOhpryaGCE8Tc6WHGeGPxQeUgbFK7MQ2bhvlC5O4paWotKStV8snDHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACKCeqlE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A4E5C2BD11;
	Sat,  8 Jun 2024 15:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717862240;
	bh=/Jh9coYaFc0rLGi3MqirZcpVzbXxOvXrtbExwDZaIe8=;
	h=From:To:Cc:Subject:Date:From;
	b=ACKCeqlExhFq0tP9Q7S+1+C/4VZ42RoWjecWt98hJZWUQmHUYQIrzovZpCrf57ttG
	 yWADOKeNiCOOeM/K7BS/wZklCpq8tBwVMVNf4ya6dh2AGG13iqYXLJn2W69zd4K/OC
	 QAjJyaJ2Hubmdsia1UNQXtQdpPxFpSsL7trQ+I+quId1+TIKGstArQwvQpyv1HyG0m
	 BYa+O22P3BlY+IfY6nAFmnKgTHrLlfVqXPSGfUaqkC+PUCS5Kt2CcVn02fBwIdSb5/
	 I8QAcc2fGso1Kl44X3+6q6JixNHp84WaFpqU4KdQAAIJ/msxOxRYNWvl5k+HFg18p0
	 CuV0Tuz4EX1VQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sFyRT-000000003Pr-20mQ;
	Sat, 08 Jun 2024 17:57:19 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
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
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v3 00/12] arm64: dts: qcom: sc8280xp-x13s: enable pm8008 camera pmic
Date: Sat,  8 Jun 2024 17:55:14 +0200
Message-ID: <20240608155526.12996-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Qualcomm PM8008 PMIC is a so called QPNP PMIC with seven LDO
regulators, a temperature alarm block and two GPIO pins (which are also
used for interrupt signalling and reset).

Unlike previous QPNP PMICs it uses an I2C rather than SPMI interface,
which has implications for how interrupts are handled.

A previous attempt by Qualcomm to upstream support for PM8008 stalled
two years ago at version 15 after a lot of back and forth discussion on
how best to describe this device in the devicetree. [1]

After reviewing the backstory on this and surveying the current SPMI
PMIC bindings and implementation, I opted for a new approach that does
not describe internal details like register offsets and interrupts in
the devicetree.

The original decision to include registers offsets and internal
interrupts for SPMI PMICs has led to a number of PMIC dtsi being created
to avoid copying lots of boiler plate declarations. This in turn causes
trouble when the PMIC USID address is configurable as the address is
included in every interrupt specifier.

The current SPMI bindings still do not describe the devices fully and
additional data is therefore already provided by drivers (e.g.
additional register blocks, supplies, additional interrupt specifiers).

The fact that PMICs which use two USIDs (addresses) are modelled as two
separate devices causes trouble, for example, when there are
dependencies between subfunctions. [2]

Subfunctions also do not necessarily map neatly onto the 256-register
block partitioning of the SPMI register space, something which has lead
to unresolved inconsistencies in how functions like PWM are described.
[3]

In short, it's a bit of a mess.

With the new style of bindings, by contrast, only essential information
that actually differs between machines would be included in the
devicetree. The bindings would also be mostly decoupled from the
implementation, which has started to leak out into the binding (e.g. how
the QPNP interrupts are handled). This also allows for extending the
implementation without having to update the binding, which is especially
important as Qualcomm does not publish any documentation (e.g. to later
enable regulator over-current protection).

Some PMICs support both I2C and SPMI interfaces (e.g. PM8010) and we
want to be able to reuse the same bindings regardless of the interface.

As a proof concept I have written a new pmc8280 driver for one of the
SPMI PMICs in the Lenovo ThinkPad X13s that uses the new style of
bindings and I've been using that one to control backlight and
peripheral regulators for a while now. Specifically, the gpio and
temperature-alarm blocks can be used with some minor updates to the
current drivers.

That work still needs a bit of polish before posting, but my working PoC
means that I'm confident enough that the new model will work and that we
can go ahead and merge regulator support for the PM8008.

This series is specifically needed for the camera sensors in the X13s,
for which camera subsystem (camss) support has now been merged for 6.10.

The first seven patches are preparatory and can possibly be merged
separately from the rest of the series. The next two patches drop the
broken GPIO support for PM8008 which had already been upstreamed
(dropped in v3). The last five patches rework the binding and MFD
driver, add support for the regulators and enable the camera PMIC on the
X13s.

Johan

[1] https://lore.kernel.org/all/1655200111-18357-1-git-send-email-quic_c_skakit@quicinc.com
[2] https://lore.kernel.org/lkml/20231003152927.15000-3-johan+linaro@kernel.org
[3] https://lore.kernel.org/r/20220828132648.3624126-3-bryan.odonoghue@linaro.org


Changes in v3
 - capitalise MFD commit summaries
 - drop pinctrl patches which have been applied for 6.10
 - amend binding commit message to clarify that the binding is unused
 - move pinctrl subschema under pinctrl node in binding

Changes in v2
 - use IRQ_TYPE_SENSE_MASK in regmap_irq table
 - add post-reset delay
 - reorder pinctrl binding and driver update
 - split out binding cleanups
 - use platform_device_id matching
 - replace underscore in supply names with dash
 - use more fine-grained includes in regulator driver
 - rework regulator driver and update authorship


Johan Hovold (12):
  dt-bindings: mfd: pm8008: Add reset gpio
  mfd: pm8008: Fix regmap irq chip initialisation
  mfd: pm8008: Deassert reset on probe
  mfd: pm8008: Mark regmap structures as const
  mfd: pm8008: Use lower case hex notation
  mfd: pm8008: Rename irq chip
  mfd: pm8008: Drop unused driver data
  dt-bindings: mfd: pm8008: Drop redundant descriptions
  dt-bindings: mfd: pm8008: Rework binding
  mfd: pm8008: Rework to match new DT binding
  regulator: add pm8008 pmic regulator driver
  arm64: dts: qcom: sc8280xp-x13s: enable pm8008 camera pmic

 .../devicetree/bindings/mfd/qcom,pm8008.yaml  | 144 +++++++------
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 123 +++++++++++
 drivers/mfd/Kconfig                           |   1 +
 drivers/mfd/qcom-pm8008.c                     | 169 ++++++++++-----
 drivers/regulator/Kconfig                     |   7 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/qcom-pm8008-regulator.c     | 198 ++++++++++++++++++
 include/dt-bindings/mfd/qcom-pm8008.h         |  19 --
 8 files changed, 532 insertions(+), 130 deletions(-)
 create mode 100644 drivers/regulator/qcom-pm8008-regulator.c
 delete mode 100644 include/dt-bindings/mfd/qcom-pm8008.h

-- 
2.44.1


