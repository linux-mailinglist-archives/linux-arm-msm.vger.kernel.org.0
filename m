Return-Path: <linux-arm-msm+bounces-85243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD589CBDDB1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 13:42:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6918D300985B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 12:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC532F12BB;
	Mon, 15 Dec 2025 12:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ho8yBMVw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADF82C0F90;
	Mon, 15 Dec 2025 12:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765802545; cv=none; b=pMbGEZgS47cb95NqitO66ZDC9GlQ9b5QSHBxQ2LDKT2ytEWjqqSZyVzeMkHqCKe7y0XW3eca5HAb3iy2HzhFHWbRxs5ie1anWMjFzYYXVGT2D1vurnWmffkg869IbLAzAhQ1RTTwq2L/Efxn4g19EXzxOtMtkVoxMIxNaL5f8t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765802545; c=relaxed/simple;
	bh=10CZqebEtg+gOGFXtLgkn73E6zcRHsYDLNCwoPZ4hH4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dHoJTejTEwooa9BfcigF5GLGo3C286LuunfoYGECLaAEAOwX/U6/d3tXUQdoSIZON1I7OG8PK9GSsFpuUwQm7yTXFLG6EDdX8ktCxnDM5NQ72Ic8zkDSr8J+uXTCeBtVzh1hZhgxLRXejnTy7cq3erOqJe4ShukgJe1fud7z2+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ho8yBMVw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52325C4CEF5;
	Mon, 15 Dec 2025 12:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765802545;
	bh=10CZqebEtg+gOGFXtLgkn73E6zcRHsYDLNCwoPZ4hH4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Ho8yBMVw6PTS+DekAQdi2ancB6S0mNL9F2hpW7fYk2FcF4Wmc+2FqHcH90JBI+oZb
	 C520hO0p8QZBmb0HZjTUX39WgHxoCYvrIR0eH2YigioveJo1OVYwwX0eJXsKZl9bk+
	 JKjjnzI9ZlEYsHDp++u3Wk0SlfMK+QFuG47thAQSbR0f2hpnwnsyQwFm8g9P7AqsQb
	 zrp/6EIXrzdo0PMGsEMxGVZAKWkw5iEqZNbsNhVwJ840Bd6Q3ej1FWO9XCf7v2tbOa
	 Mn/GZWQRoHlpKPQSTtK9B+JlV5KaSIHzgh3TrtcONkr/WkUGWxbjL0UHbtZWe7DY/+
	 6Tq/XiLxxseUA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 349A9D5B16F;
	Mon, 15 Dec 2025 12:42:25 +0000 (UTC)
From: Xiangxu Yin via B4 Relay <devnull+xiangxu.yin.oss.qualcomm.com@kernel.org>
Subject: [PATCH v8 00/12] Add DisplayPort support for QCS615 platform
Date: Mon, 15 Dec 2025 20:41:56 +0800
Message-Id: <20251215-add-displayport-support-for-qcs615-platform-v8-0-cbc72c88a44e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABcCQGkC/5XRy4oCMRAF0F+RrCeSqrxd+R/DLNJ5jAG1H9FmR
 Pz3SQuDLqYXWYWbgnsK6k5KnHIsZLe5kynOueT+XIP52BB/cOfvSHOomSBDySxY6kKgIZfh6G5
 DP11ouQ7PN/UTHX1RIGmdXWo80WSMlFZ3XGpOauMwxZR/ntrnV82HXC79dHviMyy/iyMAsM2Zg
 TLKrBOcm2B5TPvxmn0++63vT2SRZvxrl0wjtrVjbRfYCcY1aEhm35eyHa/uWNtPL4K/CIOsjeC
 VqOt3AWX03PoVQrwIC9BGiEqgZtiF4EDEsELId6LxDLIS0UWlDCTBGK4Q6o1A2Uao5RZgU5RWc
 QN2hdDvhGojdCWClzE455XH7h/i8Xj8Aq1h+jg6AwAA
X-Change-ID: 20250919-add-displayport-support-for-qcs615-platform-f885597b3573
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com, 
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765802541; l=5408;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=10CZqebEtg+gOGFXtLgkn73E6zcRHsYDLNCwoPZ4hH4=;
 b=2mSbf0am4SyiEPKLQhcY/ElGZXLNJhEfWeadXax+hWL6NfhjTFhvcP3V8vXQqNBk0ACBSWBOr
 1kwwjdrfiyrCYdiVtWS9ShCOvqIf3uV4zB1rDv4asL0SsKVxSpc6u53
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Endpoint-Received: by B4 Relay for xiangxu.yin@oss.qualcomm.com/20241125
 with auth_id=542
X-Original-From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Reply-To: xiangxu.yin@oss.qualcomm.com

This series aims to extend the USB-C PHY to support DP mode and enable
DisplayPort on the Qualcomm QCS615 platform.

The devicetree modification for DisplayPort on QCS615 will be provided
in a future patch.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
Changes in v8:
- Fix `--strict` nits: indent alignment in v7[04/14]; extra blank line in v7[06/14]
- Link to v7: https://lore.kernel.org/r/20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com

Changes in v7:
- Fix QSERDES_V2_TX_LANE_MODE_1 configuration from COM init table to configure_dp_tx().
- Link to v6: https://lore.kernel.org/r/20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com

Changes in v6:
- Move usb3dpphy_reset_l definition to the patch adding compatible and related config data. [Dmitry]
- Add NOTE about SW_PORTSELECT/orientation handling. [Dmitry]
- Use C99-style loop variable declaration in msm_dp_link_lane_map. [Rob]
- Update commit msg with issue description for [05/14, 06/14, 07/14，12/14].
- Link to v5: https://lore.kernel.org/r/20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com

Changes in v5:
- Add new patch to introduce QSERDES v2 COM/TXRX register headers.
- Restore legacy reset & clock register logic. [Dmitry]
- Update phy_xlate() to return ERR_PTR(-ENODEV) when dp_phy is NULL. [Dmitry]
- Rename helper from qmp_check_mutex_phy() to qmp_usbc_check_phy_status(). [Dmitry]
- Drop storing struct device *dev in dp_link as it is only used once. [Dmitry]
- Add robust lane mapping: default 1:1, complete partial configs. [Dmitry]
- Reorganize sub-patches v5[07/14， 08/14, 11/14， 12/14] as suggested.
- Link to v4: https://lore.kernel.org/all/20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com/

Changes in v4:
- Drop patch v3[01/14 & 13/14], will sutbmit new patchsets based mst dt binding series.
- Update maintainer of qcom,qcs615-qmp-usb3dp-phy.yaml to myself.
- Add missing aux and pipe clocks. [Dmitry]
- Drop second TCSR phandle; register offsets are described directly. [Dmitry]
- Add USBC PHY series related init_load_uA configs. [Dmitry]
- Drop v3[04/14] qmp_phy_usbc_type define and use dp_serdes offsets to confirm DP capability [Dmitry]
- Reorganize sub-patches as suggested.
- Link to v3: https://lore.kernel.org/all/20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com/

Changes in v3:
- Renamed qcom,qcs615-qmp-dp-phy.yaml in v2 to qcom,qcs615-qmp-dp-phy.yaml in v3 for QCS615 USB3+DP PHY.
- Updated patch v3[02/14] to revise binding title, description, and property order. [Krzysztof]
- Updated commit messages in patch v3[01/14] and [13/14] to reflect the DTSI rename and clarify compatibility. [Krzysztof]
- Added USB3+DP mode implementation in patches v3 [003–012], organized in logical chunks. [Dmitry]
- Dropped patch v2[03/13] to maintain full backward compatibility with USBC.
- Link to v2: https://lore.kernel.org/all/20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com/

Changes in v2:
- Add new binding qcom,qcs615-qmp-dp-phy.yaml for QCS615 standalone DP
- Split DP PHY driver into patches 4-11 by logical chunks [Dmitry]
- Update DP PHY configuration flow to align with QMP Combo PHY implementation [Dmitry]
- Update all hex values to lowercase [Dmitry]
- Remove redundant comments in DP PHY driver [Krzysztof]
- Remove invalid USBC type define [Dmitry]
- Move lane_map， max_dp_lanes， max_dp_link_rate parsing logic to dp_link [Dmitry]
- Add TCSR-based mutex logic for DP and USB PHY coexistence [Dmitry]
- Drop patches 6–8 and remove related binding properties as rejected upstream
- Link to v1: https://lore.kernel.org/all/20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com/

---
Xiangxu Yin (12):
      dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
      phy: qcom: qmp-usbc: Rename USB-specific ops to prepare for DP support
      phy: qcom: qmp-usbc: Add DP-related fields for USB/DP switchable PHY
      phy: qcom: qmp-usbc: Add regulator init_load support
      phy: qcom: qmp-usbc: Move reset config into PHY cfg
      phy: qcom: qmp-usbc: add DP link and vco_div clocks for DP PHY
      phy: qcom: qmp-usbc: Move USB-only init to usb_power_on
      phy: qcom: qmp-usbc: Add TCSR parsing and PHY mode setting
      phy: qcom: qmp-usbc: Add DP PHY ops for USB/DP switchable Type-C PHYs
      phy: qcom: qmp-usbc: Add USB/DP exclude handling
      phy: qcom: qmp: Add DP v2 PHY register definitions
      phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY config and DP mode support

 .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   |  111 ++
 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h      |   21 +
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v2.h |  106 ++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h    |   68 ++
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           | 1071 ++++++++++++++++++--
 drivers/phy/qualcomm/phy-qcom-qmp.h                |    3 +
 6 files changed, 1289 insertions(+), 91 deletions(-)
---
base-commit: 4a5663c04bb679631985a15efab774da58c37815
change-id: 20250919-add-displayport-support-for-qcs615-platform-f885597b3573

Best regards,
-- 
Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>



