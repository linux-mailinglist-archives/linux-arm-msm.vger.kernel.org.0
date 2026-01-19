Return-Path: <linux-arm-msm+bounces-89625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFCFD3A71B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D0BE3057469
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6213148CF;
	Mon, 19 Jan 2026 11:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AX92Hd0n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483291D5147;
	Mon, 19 Jan 2026 11:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768822952; cv=none; b=Zn4LKK31DOAfV3dCkfTXBuuVvpFd5WB1P4mIKv+/1vU+yt9GdL9yQho9Dn1Kdn6A/LxYkpsdeAF83aznsawtyPOw/AC69SgjnmO6OI7Xx/OlswATVn5sjh8iY4PpkiKGprusG9m2pPY/JUcLWiChRWKSBCX1sS9D0sfDsMX3YGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768822952; c=relaxed/simple;
	bh=S/Xsn0iEiIB89OrYGZHlcfZzurtqDy/Bb7hF3brG90I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=a46yX/6EvZIAZEdLQ+AB4Z6jcqhw6V+oEXt9Kg7UFZALGQRwJloDRuaznJLvawtYrmVmt7NpnvbSaWKs28MIUM8PNyiblg4MeOdIa4ty8byAOfAT8puLLzApVR5ObKSdkh0SfvzsqeGfgTvexNFFPg12fFQy/6fiUvbmy+tEKEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AX92Hd0n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE80C116C6;
	Mon, 19 Jan 2026 11:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768822951;
	bh=S/Xsn0iEiIB89OrYGZHlcfZzurtqDy/Bb7hF3brG90I=;
	h=From:Subject:Date:To:Cc:From;
	b=AX92Hd0nprF6RKkvN957Umb2S/e5a0zFl6Ni++f3P1CJMinJpvtTP6xB63K+D4qBT
	 nCRnVB7uum9YcrHf2gmgAJHFB/5Mze8RVrdKEW7Bp+CsueWi3jIE0dqvrcmBeXGm97
	 QmPQGlaqxpyrpg2aobasga5s8SW8B1aG6hbW1sS0PL5WsgyQIK2QsDAtieRYa8nWcE
	 ehJ1heH3jdDpvlWErWKcm0BSn/RcpMSUgjOdFKQJXjj5PVqXJWZwkMKdMbDyj5UstG
	 KF/gyxs+H1zXVt2/+KOYnnug1Nxsy9M6DEHLVgmd13tDoOdwQvCXXgdJ8AhwSQIRK1
	 Cb+Gyu788IxKQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 00/10] Fix up WCN6855 RFA power supply name
Date: Mon, 19 Jan 2026 12:42:22 +0100
Message-Id: <20260119-topic-wcn6855_pmu_dtbdings-v2-0-6d1c75608bbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32OQQ6DIBREr2JYFwNYKO2q92iMsYD6kwoKaNsY7
 16qi+66meTNYt4sKBgPJqBLtiBvZgjgbAJ2yJDqatsaDDoxYoRxShjB0Q2g8FNZITmvhn6qdLx
 rsG3AZ6blseCSKVOgNDB408BrG7+VO3szTskRf2UHITr/3g7M9NvuLkb4P9dMMcFUcEFpI+RJy
 asLIR+n+qFc3+cpULmu6wdLGDVz4AAAAA==
X-Change-ID: 20251020-topic-wcn6855_pmu_dtbdings-92d843582ce3
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768822946; l=2710;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=S/Xsn0iEiIB89OrYGZHlcfZzurtqDy/Bb7hF3brG90I=;
 b=JjmCwqDVHRoGal9Gpj2wskZ58TyKIUDuCEJGrEMXdfCdJ/TjhTyF+nGlyj74i42JpsW+BHtYJ
 SQ4vaVOU3FsCXa/haYtld3dK6oOFkXJhys7l+g0G39HmAnSB/9bFN2A
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Commit 5f4f954bba12 ("dt-bindings: bluetooth: bring the HW description
closer to reality for wcn6855") renamed the supply representing the
VDD17_PMU_RFA leg to mention "1p8" instead.

While the supply's voltage is normally 1.8 V, the bindings should
reflect the actual naming of the pin. Moreover, almost all DTs define
the output as 1p7, so that ends up looking a little odd..

Ultimately, this is a "fake" regulator that is consumed for the sake
of DT sanity and this series is meant to bring uniformity and squash
checker errors.

The last patch fixes up a less-trivial warning.
sc8280xp-microsoft-arcata is left out because I don't know whether the
mounting of the chip is on-board or as an M.2-y card (although I would
guesstimate the prior).

Depends on the long-ready-for-the-merge series by Krzysztof (per-chip
bindings split of qualcomm-bluetooth.yaml), mentioned below

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v2:
- Rebase, drop dependency (in -next now), pick up tags
- Link to v1: https://lore.kernel.org/r/20251205-topic-wcn6855_pmu_dtbdings-v1-0-165611f687c8@oss.qualcomm.com

---
Konrad Dybcio (10):
      dt-bindings: net: bluetooth: qualcomm: Fix WCN6855 regulator names
      arm64: dts: qcom: qcs615-ride: Fix BT RFA supply name
      arm64: dts: qcom: sc8280xp-crd: Fix BT RFA supply name
      arm64: dts: qcom: sc8280xp-gaokun3: Fix BT RFA supply name
      arm64: dts: qcom: sc8280xp-x13s: Fix BT RFA supply name
      arm64: dts: qcom: sc8280xp-blackrock: Fix BT RFA supply name
      arm64: dts: qcom: sm8450-hdk: Fix BT RFA supply name
      arm64: dts: qcom: x1-omnibook-x14: Fix BT RFA supply name
      arm64: dts: qcom: x1-zenbook-a14: Fix BT RFA supply name
      arm64: dts: qcom: lemans-ride-common: Fix up WCN power grid

 .../bindings/net/bluetooth/qcom,wcn6855-bt.yaml    |  7 ++---
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi   | 32 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  2 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |  2 +-
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      |  2 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  2 +-
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts |  2 +-
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |  2 +-
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   |  2 +-
 .../boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi   |  2 +-
 10 files changed, 42 insertions(+), 13 deletions(-)
---
base-commit: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
change-id: 20251020-topic-wcn6855_pmu_dtbdings-92d843582ce3

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


