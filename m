Return-Path: <linux-arm-msm+bounces-20456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 587818CF0AE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 19:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0AC71F215E8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 17:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B591272C7;
	Sat, 25 May 2024 17:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBmneknL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F723A1C9;
	Sat, 25 May 2024 17:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716659949; cv=none; b=nTBVflWTdt2adyUvNoFwROJmGMzGkszoPMHvNVgCmZ9pxvjjbNi+/gd38siY59fjieSEbALbK7gzIgNfI1ps8A/g7ZX+keQdpYN4BoduWMk896U8vwX2/y1KjHIMewc5+725m1I7LYz7gqiz3gsFk/yVXRgGfDQV8hhcqYDgmNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716659949; c=relaxed/simple;
	bh=D+M5uC/gLzRtwYP8kRKD2zieRkaDxcHiXzI6VKM923E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hmc74j4RnrYGzCTp67hsnWPaCcQtW1mflPFNfFKAi4ql9Iy3BjBT7/D48qgVaVXLXdWLzRwreKwhpi3EClvvJSLRdbxPqUO5X9KSYF0blcy96raMfnDwihCKE2mV12IkJS8Fb68E3HBCApFEc4nm3sX9jKuNcImGoKEaasML7p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QBmneknL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9CC9C2BD11;
	Sat, 25 May 2024 17:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716659948;
	bh=D+M5uC/gLzRtwYP8kRKD2zieRkaDxcHiXzI6VKM923E=;
	h=From:Subject:Date:To:Cc:From;
	b=QBmneknLLtl4Pb9C54CyKSYirsSIUkfWLTaivAUcgoKnCROBDNg1dJV6qTnb3GJJG
	 SnROZcHiP4KWR/7zgp+01Lq5ftBjJFmEfbmcJorQUdQRwDVdCdiGqrkTQsyN5aynkF
	 l5a7gOCCCmn4BRDnVoOqf9tG7BrIWSgyJJG0ogKYTQkGyQodQGDmxnEoKQZJlR7RY9
	 EXJRiLeXIKL/XamFQGW2GF2ZDg+1yMRiiPMt7SP9LFeiQ5GjgLLAHllfJc4UJh8C8f
	 YB99eKZGKnQyZRgSRHTtfzS8WxRQ1q9H8vCJ3Wc9XrMNoeNJNmGx1grJPQYw3qR/Ym
	 v4KG3hRSHe0nw==
From: Bjorn Andersson <andersson@kernel.org>
Subject: [PATCH 00/10] arm64: dts: qcom: sc8180x: Enable the USB multiport
 controller
Date: Sat, 25 May 2024 11:03:53 -0700
Message-Id: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAkoUmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUyMT3eJkC0MLgwrd0uIk3dwCXZPUJCNzi5Q089Q0QyWgpoKi1LTMCrC
 B0bG1tQD35vd1YAAAAA==
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-usb@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1715;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=D+M5uC/gLzRtwYP8kRKD2zieRkaDxcHiXzI6VKM923E=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmUigMuXpF5bHXK2P2/HJqaYU/pcjYTCVfnLLc8
 1gUlADCE2SJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZlIoDBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWE1BAAipMBeEOeI+AJ7au7JeaOu0DBn7s4jXiS84x5qzv
 CPSqza4RbM3FtKrwSQs23BfOJFV9S/ZLrjO+zW4daRJJ5XOAKRCywrgcuhct2Arf/ZzNnd29kvz
 4e2LJAmPSh6oyESHvPHNz+MO9ZVvARzysIdk0JUvMmkyUJdryS+yxD17Y/1QCwUQQeful+fWV3f
 WJNw1s4qDi+9zaKnuOG54Gx1Ead/QdOko02hME3OONx9iicRjXMHA64Hy9RKn+TWBpTwC3B52Jb
 qL8+R0ku/W43FDuM3VHyidN2i3hKSZlOiMOc9fZa5AHZRRYzVr6hZLX/EgrMHmfoAtW+P03fDAY
 ub3chdOWDzHt8OAbyujHu+6e6dYJ49FpiEb2h8sMWC3xaWHBbmrgSQhblXpCw88jRSG5yfBMen3
 rpZWhZNs3j06tD+R7GnqyFmSBd9McbGbmY7dzRCNGwXmEnZi9qp6SjWC4GCjHLEbJzCydyA+ugy
 dMC2NtNU1oLwa3znMUp+P8/GyOzKp6dc9IT9NyWrODwr3XF1ej8TtzE4LwBwRM0mK8KSU1LH/12
 Iw+8e3DPp6yOOUPdwq4CCn3/30LDbz5oCGTO6ef2z1orwIhsDSU6y00Ub3+pmGFhG0rBFIN6XqU
 uqX9+hycBFYnLrUYkCAG/dZb9bcg+NY9yH8Bm17094KM=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

The USB multiport controller found in SC8180X is used to driver the
camera in the Lenovo Flex 5G, and a couple of additional USB ports on
the Primus AUX board.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
Bjorn Andersson (10):
      dt-bindings: phy: qcom,sc8280xp-qmp-usb3-uni: Add sc8180x USB3 compatible
      phy: qcom-qmp-usb: Add sc8180x USB UNIPHY
      dt-bindings: clock: qcom: Add missing USB MP resets
      clk: qcom: gcc-sc8180x: Add missing USB MP resets
      dt-bindings: usb: qcom,dwc3: Add SC8180X compatibles
      arm64: dts: qcom: sc8180x-pmics: Add second PMC8180 GPIO
      arm64: dts: qcom: sc8180x: Align USB nodes with binding
      arm64: dts: qcom: sc8180x: Add USB MP controller and phys
      arm64: dts: qcom: sc8180x-primus: Enable the two MP USB ports
      arm64: dts: qcom: sc8180x-lenovo-flex-5g: Enable USB multiport controller

 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        |   3 +
 .../devicetree/bindings/usb/qcom,dwc3.yaml         |  29 ++++
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts |  32 ++++
 arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi        |  16 +-
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts        |  60 +++++++
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 175 +++++++++++++++++++--
 drivers/clk/qcom/gcc-sc8180x.c                     |   4 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            |   3 +
 include/dt-bindings/clock/qcom,gcc-sc8180x.h       |   4 +
 9 files changed, 312 insertions(+), 14 deletions(-)
---
base-commit: 3689b0ef08b70e4e03b82ebd37730a03a672853a
change-id: 20240524-sc8180x-usb-mp-4eb278df7ef1

Best regards,
-- 
Bjorn Andersson <quic_bjorande@quicinc.com>


