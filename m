Return-Path: <linux-arm-msm+bounces-103708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FDgD2nu5WnxpAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:14:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7038428B95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EDD53034E09
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6656238AC65;
	Mon, 20 Apr 2026 09:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nha/IYrH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECEF386551;
	Mon, 20 Apr 2026 09:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776676398; cv=none; b=OpZNSsDeRX5Z5DAKfiQ0PVP5anmS3CWVB9HKsAQaIHV+dZsH+Euw9zkc4Hg3WdtGXIeKZ3XhCLRxp61LKTGF86fYAdQ+hgs53G3red0HPOIL+IV+Hb3oOFCzErMhFC02um6eyrEuZU2Mxoyz7E1lbsuWiLQk7fuHkBh9e53KBmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776676398; c=relaxed/simple;
	bh=8SBhTU2OOi12EWCM5Hj3umAGo+5riQev7UW56BMZGNg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jAjja/UHdFD8YEXqiRm/iOkxua0t8aRbHSQZewr2JCeJX6YF0zpOxYPYKiKFAJOI8LWS0gF2Vtnxlw+q9BTN1Qbz2Fmb18iuPmAg2fBkUID+7Nt9x3t1xWjKa67o9xqMPGlP6VXGxpNMpwWcYY7G2ZBkg37s8xqsJkdd+KfNruk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nha/IYrH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0C22C19425;
	Mon, 20 Apr 2026 09:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776676397;
	bh=8SBhTU2OOi12EWCM5Hj3umAGo+5riQev7UW56BMZGNg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=nha/IYrHbFVwGUtzDjzng3DAZ/3NXkCFa0JcDHEaGO7gyxSSjvXD1RnQAZABBveLl
	 yvjGDdriYLSM5x9je8/AyUcOs3Ep4WYsGTgm9wbfFCohum48iS5D41yOEfYodHJ5sH
	 6cVXuHf+vDTm/vo5yytHpUMNo7M91yc0cPXYSjeF20HwdelLrXw0te7T1FMkqXuCdf
	 m0BtVTAYqOZIdzZzRKN/k/NQA9umHCnCUJkA2ECzDmkiqH39XNCRjTlb+SL6LapEqz
	 8+qBSCw1F5yww4Zgl3Fniiij6zWFuESWHgAhAFGhZctAX9YkaTMgoc6tZOIXDNWdU0
	 E0NcnJvb1hRVA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF7BBF557E2;
	Mon, 20 Apr 2026 09:13:17 +0000 (UTC)
From: Joe Sandom via B4 Relay <devnull+jsandom.axon.com@kernel.org>
Subject: [PATCH v4 0/5] arm64: dts: qcom: add QCS8550 RB5Gen2 support
Date: Mon, 20 Apr 2026 10:13:12 +0100
Message-Id: <20260420-rb5gen2-dts-v4-0-b461909c2de8@axon.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACnu5WkC/23MsQ6DIBSF4VcxzKVBuIh26ns0HQQuylBtwBAb4
 7sXnbTpeE7y/QuJGDxGcisWEjD56MchD7gUxPTt0CH1Nm/CGa8YMKBByw4HTu0UaVkzY5FpVVa
 GZPEO6Py81x7PvHsfpzF89ngqt/d/J5WU0bqRrnYGGnDm3s7jcDXji2yZxI9UnSnP1DKjHIBCV
 OKHiiNtzlRkqjOphJQWNBzouq5fXjQQ7xsBAAA=
X-Change-ID: 20260404-rb5gen2-dts-180cde0b716c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joe Sandom <jsandom@axon.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776676395; l=4255;
 i=jsandom@axon.com; s=20260319; h=from:subject:message-id;
 bh=8SBhTU2OOi12EWCM5Hj3umAGo+5riQev7UW56BMZGNg=;
 b=bDMGvn5FqPPNXAuR8ddCJxgw39OiLl1cDJUGAF6kBPgBgahhbvSVtx1ChIEESkEEOG1GzgI+g
 WImeSR97oTUCIxmDzbv2z72udtq5balLem5682xFs3luCWa4Rr+6UmN
X-Developer-Key: i=jsandom@axon.com; a=ed25519;
 pk=Q/yflwj2WhkgBVTskrS9Vl5oScD0Bp3vTzDi+OxskTo=
X-Endpoint-Received: by B4 Relay for jsandom@axon.com/20260319 with
 auth_id=687
X-Original-From: Joe Sandom <jsandom@axon.com>
Reply-To: jsandom@axon.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103708-lists,linux-arm-msm=lfdr.de,jsandom.axon.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[jsandom@axon.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[axon.com:email,axon.com:replyto,axon.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D7038428B95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds device tree support for the Thundercomm RB5Gen2
development kit, based on the Qualcomm QCS8550 chipset.

Patches 1-3 prepares for the RB5gen2 device tree by adding MHI register
regions and port labels to the PCIe controller nodes, as well as moving
common IPA properties into sm8550.dtsi. Then update the existing HDK
and QRD board files accordingly.

Patches 4-5 add the dt-bindings documentation and the board device tree
for the RB5Gen2. This initial submission covers the main board; the vision
mezzanine will be supported in a follow-up series.

Product page:
https://www.thundercomm.com/product/qualcomm-rb5-gen-2-development-kit

Signed-off-by: Joe Sandom <jsandom@axon.com>
---
Changes in v4:
- Renamed LT9611 regulator nodes from lt9611-regulator-* to
  regulator-lt9611-* to follow standard naming convention
- Moved pmic-glink node before regulators to match alphabetical
  ordering used by sm8550-hdk.dts
- Reordered sound dai-link sub-nodes: codec before cpu
- Added comma separation between pinctrl-0 phandle references
  (lt9611 and tc9563 entries)
- Changed firmware paths from qcom/qcs8550/ to qcom/sm8550/ for
  adsp, cdsp, modem, IPA and GPU to keep all firmware in the same
  subdirectory
- Link to v3: https://lore.kernel.org/r/20260409-rb5gen2-dts-v3-0-be736355d4b4@axon.com

Changes in v3:
- Reworded MHI commit message to describe actual usage (debugfs
  link_transition_count) per Neil's feedback
- Reordered pinctrl-0 before pinctrl-names file-wide per Konrad's
  feedback
- Removed output-high from lt9611_rst_pin since the driver handles
  reset sequencing
- Reordered tlmm pinctrl entries by GPIO number
- Changed bias-pull-up to bias-disable for regulator enable pins
  (upd_1p05_en, upd_3p3_en) since these are active-high enables
- Added comments for gpio-reserved-ranges explaining GPIOs 32-35
  are for NFC secure element and 36-39 for fingerprint sensor
- Removed max-sd-hs-hz override since upstream clock driver already
  provides the correct 37.5MHz frequency
- Updated msi-map deletion rationale with root cause: Gunyah limits
  ITS device mappings to two per root complex on SM8550
- Link to v2: https://lore.kernel.org/r/20260407-rb5gen2-dts-v2-0-d0c7f447ee73@axon.com

Changes in v2:
- Lowercase hex in MHI region definitions for pcie0 and pcie1 nodes +
  vertical alignment
- Change pcie0 and pcie1 reg-names for one entry per line
- Ensured pcie port labels + changes to sm8550-hdk.dts and sm8550-qrd.dts
  are done in a single commit
- Moved IPA gsi-loader and memory-region to sm8550.dtsi since they are common
  properties. Reflect changes in sm8550-hdk.dts and sm8550-qrd.dts
- Removed usbhub_reset since this is not required
- Added swctrl-gpios property to wcn7850-pmu
- Split sw_ctrl_default gpio from bt_default grouping and referenced the
  pinctrl separately
- Replaced upd_reset regulator-fixed with pinctrl and vddpe-3v3-supply
  on pcie0
- Aligned firmware-name values vertically on the quote mark
- Changed cdsp, adsp and modem remoteprocs to .mbn file type instead of
  .mdt
- Added remark in rb5gen2 dts commit explaining the rationale for
  deleting msi-map in pcie0 and pcie1 nodes
- Link to v1: https://lore.kernel.org/r/20260404-rb5gen2-dts-v1-0-895f8fc494fc@axon.com

---
Joe Sandom (5):
      arm64: dts: qcom: sm8550: add PCIe MHI register regions
      arm64: dts: qcom: sm8550: add PCIe port labels
      arm64: dts: qcom: sm8550: move IPA properties to SoC device tree
      dt-bindings: arm: qcom: document QCS8550 RB5Gen2 board
      arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2 board support

 Documentation/devicetree/bindings/arm/qcom.yaml |    6 +
 arch/arm64/boot/dts/qcom/Makefile               |    1 +
 arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts    | 1573 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts         |    4 +-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts         |    4 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi            |   26 +-
 6 files changed, 1602 insertions(+), 12 deletions(-)
---
base-commit: af241225893ac4933bb8f0615f2dfda8ea2326ce
change-id: 20260404-rb5gen2-dts-180cde0b716c

Best regards,
-- 
Joe Sandom <jsandom@axon.com>



