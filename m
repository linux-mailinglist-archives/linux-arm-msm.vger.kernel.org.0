Return-Path: <linux-arm-msm+bounces-78778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF73C0905D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 14:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4DA664E16A5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 12:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6118F2222C5;
	Sat, 25 Oct 2025 12:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="MxzDVEhs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m155105.qiye.163.com (mail-m155105.qiye.163.com [101.71.155.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22B82571C3
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Oct 2025 12:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761395635; cv=none; b=h5vQcgS7FJT4T5fO/mwKsUR57uqQWKlzJZjvgpob8dnQaISDyD1ESheQQAvlxXx6ncqca8lt0W2hCP1+aOyau6yNiD0NbNYpGH0ZJUgR9gRmIZqE+2LFnMFY4oeCR/4kWC+y/peQo5s+UNaPKA0JaUNJS4QipH1YuFMUpORNeAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761395635; c=relaxed/simple;
	bh=qXRNNgPpReprE1SlP+5En4ZCS3WcSaIM7Xgi9CwqqQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Bhk55LY00NaIBdyiYxouYM0dNo8TxXsY1vpY3gzYP2mr0oMHjdyf4bKZYpzySl0mO8oTBy3sJhIUHM6Y5u7jOFW2jpW8xuZYfZ4KT5mUgKA+2JkVRWh9Sdogofny1euXwmY/SgmOGlKtKCGeJNSHQeQadzvw3TxWZQw+/GoVTQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=MxzDVEhs; arc=none smtp.client-ip=101.71.155.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from ROG.lan (unknown [42.84.42.192])
	by smtp.qiye.163.com (Hmail) with ESMTP id 272925c51;
	Sat, 25 Oct 2025 20:28:33 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: linux-arm-msm@vger.kernel.org
Cc: casey.connolly@linaro.org,
	christopher.obbard@linaro.org,
	loic.minier@oss.qualcomm.com,
	andersson@kernel.org,
	Hongyang Zhao <hongyang.zhao@thundersoft.com>
Subject: [PATCH v5 0/2] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3 board dts
Date: Sat, 25 Oct 2025 20:27:21 +0800
Message-ID: <20251025122724.633766-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a1b578bdb09d5kunmb045701c5eabbe
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQksaVkIfQx9OQ09DHx5DSFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlPSVVDT1VPSVVKQklZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSktLVU
	pCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=MxzDVEhsVRnWxgUTh4Suy7975A0Y5tp9M59YlApS4Gb6wSvyJNwkdh7Y84GFjIwBcHmZRZ1upW77pgedl+xWLAapDtEK+H0V8IBolDk+RW89R6n2oYeJ1YVyj1WEE2xGP7zEJL+vdfpVau7OlSa9/0mj1qs/YHETRpCheLyIanU=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=dKjoQI8+yu8OxUe+6UhQiMufNnCRGb1sof4a0XYIQgE=;
	h=date:mime-version:subject:message-id:from;

RUBIK Pi 3 (https://rubikpi.ai/), a lightweight development board based on
Qualcomm Dragonwing™ QCS6490 platform, is the first Pi built on Qualcomm
AI platforms for developers.

This commit enables the following features:
    Works:
    - Bluetooth (AP6256)
    - Wi-Fi (AP6256)
    - Ethernet (AX88179B connected to UPD720201)
    - FAN
    - Two USB Type-A 3.0 ports (UPD720201 connected to PCIe0)
    - M.2 M-Key 2280 PCIe 3.0
    - RTC
    - USB Type-C
    - USB Type-A 2.0 port
    - 40PIN: I2C x1, UART x1

---
Changes in v5:
- Fix device tree formatting issues.
- Add fan control that follows CPU0 temperature.
- Link to v4: https://lore.kernel.org/linux-arm-msm/20250930043258.249641-1-hongyang.zhao@thundersoft.com/

Changes in v4:
- Enable PCIe0 node.
- Added AX88179B Ethernet and UPD720201 USBHUB power control.
- Delete the nodes and attributes defined in sc7280.dtsi.
- Modify qcom.yaml to add binding for the Thundercomm RUBIK Pi 3 board.
- Link to v3: https://lore.kernel.org/linux-arm-msm/20250924161120.27051-1-hongyang.zhao@thundersoft.com/

Changes in v3:
- Rebase on linux-next/master.
- Link to v2: https://lore.kernel.org/linux-arm-msm/20250924121541.128582-1-hongyang.zhao@thundersoft.com/

Changes in v2:
- Fix problems found when running device tree check.
- Enable USB2.0 interface.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20250923064330.518784-1-hongyang.zhao@thundersoft.com/
---

Hongyang Zhao (2):
  arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3 board dts
  dt-bindings: arm: qcom: rubikpi3: document rubikpi3 board binding

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 1390 +++++++++++++++++
 3 files changed, 1392 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts


base-commit: 72fb0170ef1f45addf726319c52a0562b6913707
-- 
2.43.0


