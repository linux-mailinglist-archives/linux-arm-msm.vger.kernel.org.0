Return-Path: <linux-arm-msm+bounces-75534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABD2BAB6B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 06:49:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11AE01925A35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 04:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 533F7263C9E;
	Tue, 30 Sep 2025 04:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="fPzIVZPn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m19731102.qiye.163.com (mail-m19731102.qiye.163.com [220.197.31.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74142638BF
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 04:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759207724; cv=none; b=NFmx/QC5GsBYJpHkSmA3Y7ZuBlhI2IpQNxvrJy4kDbmNNhbIRL1FPy955LM+cC9CsVVcxscES+4pGamymovlAzDhlgHb1rHlIIB+NR4nkMmygkPvhiuLh4n3UH03sMoUz70wgfyw2fZRJN4DS3LvjeHB6iETwDZaJTdmNolKXjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759207724; c=relaxed/simple;
	bh=gcseWkJ56ic38Sp15u5Kilxk8GvgoaXFEcb/i203lJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uRSHS3vGrJcCSp5t1F70hKjByTYZHYKzl7FtQH4xBLcOz3GcQdS/yscchG5FJjrfsHpVVVohh2+DmeaAI+07B6Nmq+SQE70Ctb0ppq2rFyLQ05rZg1FF/BZlWcZo7MkrF6m/PM9iTHbU6zdK0L73/BsN1r7JJJ8uqxDsO0yZ+/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=fPzIVZPn; arc=none smtp.client-ip=220.197.31.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from ROG.lan (unknown [113.235.126.201])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2489e0101;
	Tue, 30 Sep 2025 12:33:15 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: linux-arm-msm@vger.kernel.org
Cc: casey.connolly@linaro.org,
	christopher.obbard@linaro.org,
	loic.minier@oss.qualcomm.com,
	andersson@kernel.org,
	Hongyang Zhao <hongyang.zhao@thundersoft.com>
Subject: [PATCH v4 0/2] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3 board dts
Date: Tue, 30 Sep 2025 12:32:50 +0800
Message-ID: <20250930043258.249641-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9998e5689009d5kunmc5095b342ecbdd
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCS04ZVklPSBpDGUhKQksYQ1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkhVSUhOVUpJTVVJS0pZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=fPzIVZPn3bVNPA90i0FcJl9qdIpxttSv4VGKW01bGCUk3zfXXCy+a5yo4Hd9E26f7Q9wZHTV+c6qcf0+4e0G++0a5ip+1a4gbTSLeewjhU2k0RlgR4448fxgQWIU7FSUxM0H9/IH0Qt9BrpwfUuxtP59tUkaXdLg3IQ1jbVCdDY=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=EyagTCNnvSrYtJs+HhDP14kwAZyYyd4NDxazsYua3os=;
	h=date:mime-version:subject:message-id:from;

RUBIK Pi 3 (https://rubikpi.ai/), a lightweight development board based on
Qualcomm Dragonwing™ QCS6490 platform, is the first Pi built on

This commit enables the following features:
- Wi-Fi (AP6256)
- Bluetooth (AP6256)
- Ethernet (AX88179B connected to UPD720201)
- USB Type-C
- USB Type-A 2.0 port
- Two USB Type-A 3.0 ports (UPD720201 connected to PCIe0)
- M.2 M-Key 2280 PCIe 3.0
- RTC
- 40PIN: I2C x1, UART x1

---
Changes in v4:
- Enable PCIe0 node
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
 .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 1410 +++++++++++++++++
 3 files changed, 1412 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts

-- 
2.43.0


