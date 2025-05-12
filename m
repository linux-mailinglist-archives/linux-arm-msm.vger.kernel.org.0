Return-Path: <linux-arm-msm+bounces-57605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB4FAB35F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 13:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 311D4189DD67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 11:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD9BA279330;
	Mon, 12 May 2025 11:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=true.cz header.i=@true.cz header.b="m/gUtI0C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out.xnet.cz (smtp-out.xnet.cz [178.217.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55E7258CD5
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 11:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.217.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747049767; cv=none; b=X2ax9IX9+5fqITY4tkA+W2gl0Zqo8ZTFL+dfeXIRCGQTQV/Pu3lAhb0Kxw8qTn2gXq88Dd9efLxw0++wJO4U+TgXby7xjwD9hoJTwjJOkRNDkb06qV1VgZGcgxxO36B+eXKtdZaRaRWAOttBTowLMKjyl74DGwWKOirWyy34uLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747049767; c=relaxed/simple;
	bh=iVTBOXxvgPgujQbdQwE1Bnn2aTxP3mvQKNzNPYroeg4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=NY5ZT7cirr5HCDoSqSO62cA4CBb9xNG2uaa8avsOrF5UM1tx8Ouof/5cuk3WwZP7BoyhVV3R6F0KIDjfguInXrdhTNODG/I/tqzImPQxZI4o1Tu55TQXip0X0VJ1UGRHy/aPvJE+aLHFvF76y75SmipTQCh4vXbw8RI0Sk3pSaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=true.cz; spf=pass smtp.mailfrom=true.cz; dkim=fail (0-bit key) header.d=true.cz header.i=@true.cz header.b=m/gUtI0C reason="key not found in DNS"; arc=none smtp.client-ip=178.217.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=true.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=true.cz
Received: from meh.true.cz (meh.true.cz [108.61.167.218])
	(Authenticated sender: petr@true.cz)
	by smtp-out.xnet.cz (Postfix) with ESMTPSA id 98E2A3FF3;
	Mon, 12 May 2025 13:26:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=true.cz; s=xnet;
	t=1747049211; bh=iVTBOXxvgPgujQbdQwE1Bnn2aTxP3mvQKNzNPYroeg4=;
	h=From:To:Cc:Subject:Date;
	b=m/gUtI0CdznrNvA2LalrQ2QyCgUc9uaVayWO0GeSDFcv3RM/QVGYYuuyx8v+piEB/
	 Icu3DhzFp6WbsAg6gC3VbciTKQuW3HKSSCqj5iEnG8CVLWpSAnK2W7W3p+NGtpjAqD
	 j4csMVuxhix2d16Uiqzbow42olmpff7ZhZhVy7RU=
Received: 
	by meh.true.cz (OpenSMTPD) with ESMTP id bce9b1a0;
	Mon, 12 May 2025 13:26:41 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	=?UTF-8?q?Duke=20Xin=20=28=E8=BE=9B=E5=AE=89=E6=96=87=29?= <duke_xinanwen@163.com>
Cc: Chris Webb <chris@arachsys.com>,
	=?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>,
	Manivannan Sadhasivam <mani@kernel.org>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] bus: mhi: host: pci_generic: add support for Quectel RM520N-GL 0x5201 variant
Date: Mon, 12 May 2025 11:26:31 +0000
Message-Id: <20250512112631.2477075-1-ynezz@true.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Chris Webb <chris@arachsys.com>

I have a router board with a Quectel RM520N-GL 5G module that speaks
either USB or PCIe. When switched to PCIe mode, the modem present itself
on PCI bus with following IDs:

  0003:01:00.0 Unassigned class [ff00]: Qualcomm Technologies, Inc Device [17cb:0308]
    Subsystem: Qualcomm Technologies, Inc Device [17cb:5201]

and is currently being wrongly detected by the kernel as:

  mhi-pci-generic 0000:01:00.0: MHI PCI device found: qcom-sdx65m

which results into wrong modem configuration and thus missing wwanX
netdev. So lets fix it by adding a new device entry for this 0x5201 variant.

Link: https://lore.kernel.org/mhi/ZqllDCWfiKravZAo@arachsys.com/T/#u
Fixes: 1cad976a1be9 ("bus: mhi: host: pci_generic: Add support for Quectel RM520N-GL modem")
Signed-off-by: Chris Webb <chris@arachsys.com>
Signed-off-by: Petr Štetiar <ynezz@true.cz>
---
 drivers/bus/mhi/host/pci_generic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 03aa88795209..0db9543a7edc 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -818,6 +818,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn980_hw_v1_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
+	/* RM520N-GL variant with Qualcomm vendor and subvendor ID */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_QCOM, 0x5201),
+		.driver_data = (kernel_ulong_t) &mhi_quectel_rm5xx_info },
 	/* Telit FN990 */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2010),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },

