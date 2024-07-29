Return-Path: <linux-arm-msm+bounces-27280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4980C93FB66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 18:39:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8034B2189B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 16:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D872715B555;
	Mon, 29 Jul 2024 16:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="nbteJh+U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8442D77119;
	Mon, 29 Jul 2024 16:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.87.146.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722271164; cv=none; b=BIFh9RV0bk0QjyXCxncPC891QoUp/HHqUeNwQXEMZsTJNC8SGcKQfw3pukFGf88UugoH1r85M+V6Gx2yEcuTHfzBpeNxzXLSB6Wi5u9Z+u5Df1AEWLgs8Vy5HSUEQvYT1/osQ+flg4eUgL1g676v2a9AAyLdrClvuWUA5KJOOxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722271164; c=relaxed/simple;
	bh=FAbRNVpCO1ITKEgOSyglG2qcgHQaWnmO55noNiqHbME=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O34CkdrFvgkPbbm66LR5Mw6fmEwQ5T0AU9mttIh6Gu6t5qM2EeP0/AqN9KmCZwFkZOI5iP3sQroB4LDU0wNFlagA/68rs8l3eGToyi1d6IJEJQm6FZG1eJ73VRsCm2yCvVdeUd+iRbGvitMxF7xx4bTqios/sMbM2r4OAP4Dm4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=nbteJh+U; arc=none smtp.client-ip=194.87.146.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 56E77401C4;
	Mon, 29 Jul 2024 21:39:11 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1722271152; bh=FAbRNVpCO1ITKEgOSyglG2qcgHQaWnmO55noNiqHbME=;
	h=From:Subject:Date:To:Cc:From;
	b=nbteJh+USwCQLVKtgi4RUBNdAOCm674lrWzuXW3Y5HIlEEEHSbZFTxKNDQ6Tr7vJz
	 5qZl2ldAmQYl4ZjRq4OGOti/O3YZVJk2wv8vs6bF4R1jrR2cQ7EWjZlv8/mVIZfHpX
	 +kq7fk2FPFYVgP/wD7MzP9EPtDUqUok2W8mhslhQsUlHe/7raJk0ZCPK/zZf6/BEIu
	 HHdBnBCYY7kvlEw5iro4K42auVfdXUDI+8nCc/6FijQG0nzjnXjg26uM6++PkSI4Qd
	 HVlHVU620tVkmgddrLActbNOs09TG5pKRfWy2gl4cy8pDqT6RAAe/9hp+OEfzZlOUa
	 geaPf42EoPPGQ==
From: Nikita Travkin <nikita@trvn.ru>
Subject: [PATCH v3 0/3] Introduce msm8916/39 based Lenovo devices
Date: Mon, 29 Jul 2024 21:38:46 +0500
Message-Id: <20240729-msm89xx-wingtech-init-v3-0-32c35476f098@trvn.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJbFp2YC/3XNQQ6CMBCF4auQrq1pB5DiynsYF7QMMAuqaWvFE
 O5uITG6Yfm/ZL6ZmUdH6Nk5m5nDSJ7uNkV+yJgZGtsjpzY1AwGFqKTgox9VPU38RbYPaAZOlgJ
 HUYm6RNCAhqXbh8OOps293lIP5MPdvbc3Ua7rV4QdMUou+KnoiqaRqhK6vQQX7dE92epF+DNg1
 4BkCFMrqbUpIVc/Y1mWD/vp00H8AAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Nikita Travkin <nikita@trvn.ru>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Anton Bambura <jenneron@postmarketos.org>, 
 Stephan Gerhold <stephan@gerhold.net>, 
 =?utf-8?q?Adam_S=C5=82abo=C5=84?= <asaillen@protonmail.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2213; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=FAbRNVpCO1ITKEgOSyglG2qcgHQaWnmO55noNiqHbME=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBmp8Wrl7EuQXrXs9X63mx91zknNz1hq0llFP0VZ
 eNPUNHxVkSJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZqfFqwAKCRBDHOzuKBm/
 dQ2GEACIxXBgQ+Jch/ykzKaEapSVlPlpRyT0MPW5PeK9FAo3dwYoUr5EPkIY7nY78HtuNcnhfW/
 hPktWvXelPTqKNax/CRx18Zw6u0K6URyspkhU0UyV9gMfvqGYgfcD1DG1WZBejMUq4xgIKoi0cb
 2UOcY8NaB80gUelKAPkj9jMeECXj2qaDwSnGB61xc9/ZMKMvzKZvvjwNHvt/5yWz2a99krk2Yck
 Zqsa+4iMZkYKnw9yk8DsI/zeajhsFEZHBe8ufGRleKkr75rz5qJSa2rGrRN4KksCzZzZ5/OBmm7
 /i+4eR1NAQwDa789J8K/JdlqgBjcGjllEJLpvHJFA+ZmuoUiBR2XOVpCWQeKy0KK7vw2Zyr2eFE
 kOXd0KpUTxLHZiT52D188iLoPNbwyUeLnMbWefjS5DCxvEoMCaBNg3Ga5qliLLrTOUBdCXwRr0l
 sCwxzPNWEMYaNgRAcQDP4OyVS27VAIDvDjsrf4ODlDRJ/oNgjGAIABhpsjU6clegj7827M4nYSV
 ea4JLJIuZ+hAk/aBuzP+MpU2IIPOh/VrOmli9OxG/ulfdgXoDOo5+49Xjmf8rxBULuFDpeyu6r9
 vK307+QeH18DzWeaaZygQTenuhRDjK4Ln3Yz/lXHrFHpmpQZGdtk9BfPRJsC6djtWt6nUzJc9ua
 6krreKq4R64vGRg==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

Continuing the work of upstreaming the various msm8916 devices from the
backlog, this series introduces few 8916 and 8939 Lenovo/Wingtech
devices (where Wingtech is the ODM for these designs).

Included devices are:

- Lenovo A6000 (Wingtech WT86518)
- Lenovo A6010 (Wingtech WT86528)
- Lenovo Vibe K5 (Wingtech WT82918)
- Lenovo Vibe K5 (HD) (Wingtech WT82918hd)

Note that "HD" variant of K5 is based on msm8929 which is a lower bin
of msm8939 SoC. A simple dtsi is added for this soc along with the new
devices.

Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
Changes in v3:
- Minor styling cleanup (Konrad)
- Link to v2: https://lore.kernel.org/r/20240722-msm89xx-wingtech-init-v2-0-0c981bbc5238@trvn.ru

Changes in v2:
- Reorder pinctrl properties (Konrad)
- Convert msm8929.dtsi to be more in line with other soc dtsi (Krzysztof, Dmitry)
- Link to v1: https://lore.kernel.org/r/20240712-msm89xx-wingtech-init-v1-0-64f4aa1870bd@trvn.ru

---
Adam Słaboń (1):
      arm64: dts: qcom: msm8939-wingtech-wt82918: Add Lenovo Vibe K5 devices

Anton Bambura (1):
      arm64: dts: qcom: msm8916-wingtech-wt865x8: Add Lenovo A6000/A6010

Nikita Travkin (1):
      dt-bindings: arm: qcom: Add msm8916/39 based Lenovo devices

 Documentation/devicetree/bindings/arm/qcom.yaml    |   9 +
 arch/arm64/boot/dts/qcom/Makefile                  |   5 +
 .../boot/dts/qcom/msm8916-wingtech-wt86518.dts     |  87 +++++++
 .../boot/dts/qcom/msm8916-wingtech-wt86528.dts     | 158 +++++++++++++
 .../boot/dts/qcom/msm8916-wingtech-wt865x8.dtsi    | 215 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8929-pm8916.dtsi       | 162 +++++++++++++
 .../boot/dts/qcom/msm8929-wingtech-wt82918hd.dts   |  17 ++
 arch/arm64/boot/dts/qcom/msm8929.dtsi              |   7 +
 .../boot/dts/qcom/msm8939-wingtech-wt82918.dts     |  17 ++
 .../boot/dts/qcom/msm8939-wingtech-wt82918.dtsi    | 252 +++++++++++++++++++++
 .../boot/dts/qcom/msm8939-wingtech-wt82918hd.dts   |  17 ++
 11 files changed, 946 insertions(+)
---
base-commit: 931a3b3bccc96e7708c82b30b2b5fa82dfd04890
change-id: 20240710-msm89xx-wingtech-init-e07095e2b2ec

Best regards,
-- 
Nikita Travkin <nikita@trvn.ru>


