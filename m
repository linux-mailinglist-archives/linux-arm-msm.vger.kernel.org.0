Return-Path: <linux-arm-msm+bounces-109695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBn/MpXHFGrrQAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 00:05:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E045CEF88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 00:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 687A73007A7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 22:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51AC1C5D5E;
	Mon, 25 May 2026 22:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdvilLCN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B92156F45
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 22:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779746699; cv=none; b=b5FIu9v3i6rkq7CjXY0cxIwUwiRERQuJ82JmXp7hxsXdQvjnSjQ1MXZv7ITzqt2uZnkJksgHrM7e4HtNNyOA4wdpo+WOtoHGHOdNGCRYFwv9d1Fow8DScr3RWtnhGFe7WY33Sb9EhXB8VYGrq8leVYfAXar2GLA3ssi6PbLgLVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779746699; c=relaxed/simple;
	bh=aDCY8rIyfNXGhl9fcMVCN3vBmy/jQmgI93lxgOq2G54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O5nLXOznOzUrqm27wwRr1chz9wF+669rHTUTmw8/Flom7zpcnpcuVXBShSLZyOdjg1cytupv73fF3oEmiXXKeSjisox9awupxAOchj3/5YhUFIR0P8vD1/qQtj5Q3Ox2iGSC619CxdnXdu3bo4p7qHi+hJOZhiM+9WxFOohiIOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IdvilLCN; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-83d31ac4017so4903218b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 15:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779746698; x=1780351498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mBQlDE/oPG8Oa8LMhICFf6T3R2ocVR1ZCsXAU07kKso=;
        b=IdvilLCNblUHYW+RyCUZkRulJ6fGcjbm8RLIDHivRKaX4bREVjVK19UqA708fNsGg4
         fznUhgsSos8NY3kxmKM+p+M45AZXL7GHGLZgv47Dv+aS+d9wkHvFJMcX9Fh8nrqjlMVI
         opTKBPyAaErJ1woCxRNwb07t47c8cx7ac5H7+AbVquysTPfN/P1kJJs8ttvdIix4XwH3
         72qhPySldqdHwaRprqz1CLHYRLsYREMWHZKWDe3rjsB/6GxDcFfOATmddLNcaMH7KWMo
         3aZmFKcPSE9OAMLpgjC3HePN18Me+W2b27mr+Lf9k525L+oepEToLt5Q+aV/iLMhmCGW
         /hTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779746698; x=1780351498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBQlDE/oPG8Oa8LMhICFf6T3R2ocVR1ZCsXAU07kKso=;
        b=MZTfPwHTG2vMn1HTZ68QgA4+tkXULZwIJrAP68AyAD8b+qtIMCW8R/iK5o50RYK8Dl
         xcLvMKO+bDmbFvvu5gQx1bYay4uPGZ6ONkLUFxm/iOHKgYA3stbDchACd13/r8pGpwii
         YUD88KySwSPUcH646Tet14cW7YSi8PnWCw0RlV+N78Ue5SSu4RIIEPDEXMDLmJKjeFl7
         esD67NxUejBYdtOe0ltsq+7cSfVrNYaLb1eJYqtobUCjpsFwnbbS8ZnR6f03dBPhYEl0
         P1LMTpV7CDgVC/fXaLs5FZuG1O1iBOSeAKBbxOYp5M2+o4aKb5iBK/lAzNAt45lyp47/
         PpkQ==
X-Forwarded-Encrypted: i=1; AFNElJ/QC2TaJ/L3vWBkVm70Pt3BFpHHparwavw/aN+BsGpUmQljCUPF8aG+aIbozm8xiF9LfNtCyzXoNoe0y63I@vger.kernel.org
X-Gm-Message-State: AOJu0YxhMweg9521LzB1hOBRBgvYpWf49B2H0WfgUdkfGnjewO2DpXXK
	JmB7WvBa8DudRJxmphY2Gaxxksr8UImSQ5Xh6fcGs1qHlHv7G5ifh6Lr
X-Gm-Gg: Acq92OFhXOTbUw4qHXZMY0wOYK5J05Rsf8+0aODK81oLpuVOPXuIIGMWPNks1vDkRSz
	MTfidxC9dg47PgaRnRf07O1GI89D+5EusWJiY7g2LR0BmBn53Piebyd/tfIzlPdfCKo3IdfWLbP
	V5Y7c7rRp0NGQ12vf5rn+MPsUiATrWnNdlCQTcv3WeNDOJcFqcnAQCINrAetfuuVB1eYh6idQf0
	emcdBjrJRO48fRzdiei1XMRDcli2UtYJ34V/OFpS7DI9uZkj8RrZTcCJanBwS9GFsSuST5qmHUE
	DF8Zdjrrv5Fe17RTyDPSsH2CC5ZRo2u8/GYqXREg5pDbSbqa/y/HVd4rcRvMGKLjARfB3TOrCFM
	C32fGeAUt2jbP9aAw8RgC1pp/jaVCf6ErMinbSIsL7H+fcwy7iBcfN7hfnhN4/BhwH1o2JBRYCz
	+Hii+WzmRASLz+6gvUFVHwOeIaxeSy+Lys8y6J8I9W1qDTtb0p5xtA+VB0gVE0mF7KXV6wybPlj
	6mWPjPCn0k0IEqZJfbp6fNTRnmoh7qoJYJK/8FobuWKig==
X-Received: by 2002:a05:6a00:808b:b0:824:afe1:f7e3 with SMTP id d2e1a72fcca58-8415f5d1d8emr15278895b3a.15.1779746697873;
        Mon, 25 May 2026 15:04:57 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164b0963asm10065750b3a.25.2026.05.25.15.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 15:04:57 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	linusw@kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-arm-msm@vger.kernel.org (open list:QUALCOMM NAND CONTROLLER DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: rawnand: qcom: embed nand_controller into qcom_nand_controller
Date: Mon, 25 May 2026 15:04:40 -0700
Message-ID: <20260525220440.94639-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109695-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: D7E045CEF88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The qcom_nand_controller had a struct nand_controller *controller
pointer that was assigned to (struct nand_controller *)&nandc[1],
with the allocation oversized by sizeof(*controller) to make room.
get_qcom_nand_controller() then walked backwards from chip->controller
using sizeof()-based arithmetic to recover the enclosing nandc.

Embed the nand_controller directly into qcom_nand_controller and use
container_of() in get_qcom_nand_controller(). The header now needs
the full rawnand.h definition rather than a forward declaration.

Assisted-by: Claude:Opus-4.7
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c    | 16 ++++++----------
 include/linux/mtd/nand-qpic-common.h |  4 +++-
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index b7e79b76654d..4b80ce084d9a 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -128,8 +128,8 @@ static struct qcom_nand_host *to_qcom_nand_host(struct nand_chip *chip)
 static struct qcom_nand_controller *
 get_qcom_nand_controller(struct nand_chip *chip)
 {
-	return (struct qcom_nand_controller *)
-		((u8 *)chip->controller - sizeof(struct qcom_nand_controller));
+	return container_of(chip->controller, struct qcom_nand_controller,
+			    controller);
 }
 
 static u32 nandc_read(struct qcom_nand_controller *nandc, int offset)
@@ -2034,8 +2034,8 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 {
 	u32 nand_ctrl;
 
-	nand_controller_init(nandc->controller);
-	nandc->controller->ops = &qcom_nandc_ops;
+	nand_controller_init(&nandc->controller);
+	nandc->controller.ops = &qcom_nandc_ops;
 
 	/* kill onenand */
 	if (!nandc->props->nandc_part_of_qpic)
@@ -2175,7 +2175,7 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 	chip->legacy.block_bad		= qcom_nandc_block_bad;
 	chip->legacy.block_markbad	= qcom_nandc_block_markbad;
 
-	chip->controller = nandc->controller;
+	chip->controller = &nandc->controller;
 	chip->options |= NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA |
 			 NAND_SKIP_BBTSCAN;
 
@@ -2256,21 +2256,17 @@ static int qcom_nandc_parse_dt(struct platform_device *pdev)
 static int qcom_nandc_probe(struct platform_device *pdev)
 {
 	struct qcom_nand_controller *nandc;
-	struct nand_controller *controller;
 	const void *dev_data;
 	struct device *dev = &pdev->dev;
 	struct resource *res;
 	int ret;
 
-	nandc = devm_kzalloc(&pdev->dev, sizeof(*nandc) + sizeof(*controller),
-			     GFP_KERNEL);
+	nandc = devm_kzalloc(&pdev->dev, sizeof(*nandc), GFP_KERNEL);
 	if (!nandc)
 		return -ENOMEM;
-	controller = (struct nand_controller *)&nandc[1];
 
 	platform_set_drvdata(pdev, nandc);
 	nandc->dev = dev;
-	nandc->controller = controller;
 
 	dev_data = of_device_get_match_data(dev);
 	if (!dev_data) {
diff --git a/include/linux/mtd/nand-qpic-common.h b/include/linux/mtd/nand-qpic-common.h
index e8201d1b7cf9..006ca8c978a9 100644
--- a/include/linux/mtd/nand-qpic-common.h
+++ b/include/linux/mtd/nand-qpic-common.h
@@ -9,6 +9,8 @@
 #ifndef __MTD_NAND_QPIC_COMMON_H__
 #define __MTD_NAND_QPIC_COMMON_H__
 
+#include <linux/mtd/rawnand.h>
+
 /* NANDc reg offsets */
 #define	NAND_FLASH_CMD			0x00
 #define	NAND_ADDR0			0x04
@@ -394,7 +396,7 @@ struct qcom_nand_controller {
 
 	const struct qcom_nandc_props *props;
 
-	struct nand_controller *controller;
+	struct nand_controller controller;
 	struct qpic_spi_nand *qspi;
 	struct list_head host_list;
 
-- 
2.54.0


