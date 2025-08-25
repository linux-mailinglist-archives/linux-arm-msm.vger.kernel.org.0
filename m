Return-Path: <linux-arm-msm+bounces-70609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F64B33C6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 12:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF741166CE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 10:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F8B221726;
	Mon, 25 Aug 2025 10:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ncOGF7u0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B512C08DA
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756117189; cv=none; b=uOYsn7UOqvutCkkCYwXKyNTkXirK6AldyWDQKsGTdnmesdWCJ7DbRi5EgyCH0JUvhP9KDTsSbvAgs91SOLof1WA/lFEuoBxCSDROw8qxuv7fRtb1eLDcba3MJrUXaTVyn2rGLXlzjhfSe9XpOGue542SSI5u7YDiJfHDqDZQs28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756117189; c=relaxed/simple;
	bh=UYKhgbavyEXzQWuwLPYtyxTt2K9T0zQEPnGRjJgKg10=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sGsiXxmVkt20C4O/q7a6Gnz+uAI43CX+fzxTDkATjrNYYMz1IuhjcwlKuouv4Z6HPPQnBFnSsDFBwiI3N6JAUyyDgsTQVrhR+69169yVQCX7+XIgP4/KkldyN512k0P4jELuePp6MPXn655GIdEDtjeMdz39Xm/6+eVh9I2KKFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ncOGF7u0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P9HpGJ019199
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qm4JOaHmsSD
	VZ1N0K3z0jYUy9bdJyV3wIY9fk8ejoQc=; b=ncOGF7u0pJSzEC6yXqobDjs8r9Q
	ke4WTHA61o17NoHZZfl0uaBSGEL1BbgrG+Gd1+hxUtFqAt29AX4m8/B4Te5W45w7
	ozRyd8f/lUw/wwwsYdgPfHEmTXl4pSRbZmCMLTZPOHh23l/8QzLLI5lAuD3/Y5iS
	xrkmdbqYqhNgSyiFSngLpkW27I/JPnOFyObFcd7wGzUKAQ0uwIAvlDzBCj8CpeXj
	6wkYZG0ZqdB6gjvlxAR2mmRX+E2gcDzUYeMyNPQmCwbj37+tkXJ87nzNVBPlGLwY
	Vcnb5/oHBuvBQqiwDaibbLaVbMjrLEmbMjDwEbU8Vh+Zeu9BScVIRbGDCWg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5uc4mj2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:19:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24457ef983fso88163985ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756117184; x=1756721984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qm4JOaHmsSDVZ1N0K3z0jYUy9bdJyV3wIY9fk8ejoQc=;
        b=Mw8KwVN0nrdPKXK6ufKykXR0YsvQlnYxcB37dHRNTrYc4ZYNcl53uLWhsldpqeEnOc
         /3evoMgM1FyhiD2e0FJEr3YxgJMt2F6fGMz/RvaRLOzEForB9kGDV8M6J5rhi3p0JU/Q
         53QRgktn9DGGXzjoxPdYCC6jk4f8yyaJv1W8edweSK9ph2Mb7qYKhYjVP7y0jH1wjV8L
         sfjjTR7ZoTw0h7ghLcc//fjTAqS6D0FaBmKMw4U36Q70yVIKL5K7sEpGS1Gef1D3NbH/
         3BaLTRgwZPX43CERcQfgyDI2miGXCESBtNs7kNDBOG/ofySy7xHAZ7t0Wgnj+wcXs7SX
         SBIw==
X-Forwarded-Encrypted: i=1; AJvYcCV7ARLiUyt2JH7m0Zo2Wm5gQy9inyAtwUOhSSO3ohoPg0bCHQLPAnpktEEUux+oE+/niBQokYOS2I7CeZk1@vger.kernel.org
X-Gm-Message-State: AOJu0YwVlJUTC7hp0tfYaVB3xBoNJuJwMux25V/Z4RsLFF4zhD7r3d3I
	/QZbAtZ1kGWi5Q0anUOpJCkBhqICyYBkB+NBjcwStyGekzJGd50Q/G2fATuyun8HvKr1ULlIg6H
	7NkXuFtJ0/KamdZptyLxtIsomWVgvZr+DzpOss14ziV9sgKsQdHHxNK6NZRlOsHto/tXj1M6EWx
	+d
X-Gm-Gg: ASbGncu/FHPurpOYvvgzm+bVQE36ICg/Kl0HfWoNNhuI6962pTF6CHMI0PdFlq8Olm0
	rOvkU3MbkYQONJtUMoqqgP3ZHUC5VfxGrWIMW41ovbsKjC0KaNp2tF4hc15p20NWPYOhiWZgzfu
	Nlvf2uSYDcITP0krHHSLkWyajkiTOGkeXDssLGPGHZPHU7kQUCX0M27t1FboNKlblXzY/2qPBWf
	Ky5QRciP8uBn/xGOHjP0kB+SbcsIqzTeK8HKtz/W/qLIq9kVybIq8OMtEj93AbMmZ7XuXMUm/qW
	cjutufm9vxpgspzwMSeQu6CNc+VZGEYRZJadsPj30H0/chsRYZE4BFstWprlrlBy7Iv8xQ==
X-Received: by 2002:a17:903:19e8:b0:246:de7a:c713 with SMTP id d9443c01a7336-246de7ac7fbmr32898795ad.53.1756117183635;
        Mon, 25 Aug 2025 03:19:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxHRBEw6OhWAai1YaYqxcZtljwSbT+B3wTmXlTIEu0QFfopJ9BGPzm4dxDnWe221J5VVSd2Q==
X-Received: by 2002:a17:903:19e8:b0:246:de7a:c713 with SMTP id d9443c01a7336-246de7ac7fbmr32898225ad.53.1756117182704;
        Mon, 25 Aug 2025 03:19:42 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246687cedb2sm64540585ad.68.2025.08.25.03.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:19:42 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 04/12] drivers: accel: Register Qualcomm AIC specific image tables with Sahara.
Date: Mon, 25 Aug 2025 15:49:18 +0530
Message-Id: <20250825101926.2160554-5-kishore.batta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX12P2cjFJTEk1
 HHZNWvRLkwyVhVOWnGFa7niQJcLvYVjWxuySG22AxRLRStwUy0ARnVoGkIGrWxgVhwXmUdnirPv
 NaAmZ1jtoLAKGUUjNmk657oeOSM7c8QNbQvM/9v3koXd+VN3LkwswpvKy2ygv2uwQ8ETQI5kx5T
 sUBiTIZZ8QtRIixqhHbSbcWBZqkNcQhVBxo2BYfPhT1iP5ZUlPTU6iXp6gfyn0iMfG/SqIk6Z4J
 yIqvIx27O5XUq4MJwmcD6bS4nMlYrru65GT6eNJhYo78XZ54gdQyDSB4agnVOVj+I68Fpuk1KUR
 xNgmDz8PQs10hgNPtK5cRfPGSjsvCEIo8bJFoRoFrvuUKsm/AxmdfjpuUYmh+daawVNv1JRugBU
 WLnt2ZCm
X-Proofpoint-ORIG-GUID: iI6EMmrZuoysZBkUsUOgS6ShFy7DOUAQ
X-Authority-Analysis: v=2.4 cv=I85lRMgg c=1 sm=1 tr=0 ts=68ac38c1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=jb32xPpbzDC1FHL_gjsA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: iI6EMmrZuoysZBkUsUOgS6ShFy7DOUAQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230032

Register Qualcomm AIC-specific image tables with the Sahara protocol.
The Sahara protocol provides a method for client drivers to register
device-specific image tables, which is mandatory for firmware transfer.
During QAIC device initialization, the QAIC driver must register the
image table information with the Sahara protocol for firmware transfer
to occur. Once the device is probed, it sends the required Sahara packets
to the host. Based on the connected device, Sahara selects the appropriate
image table and sends the firmware image data back to the device.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/accel/qaic/mhi_controller.c | 57 +++++++++++++++++++++++++++--
 drivers/accel/qaic/mhi_controller.h |  2 +
 drivers/accel/qaic/qaic_drv.c       |  7 ++++
 drivers/accel/qaic/sahara.c         | 17 +++++----
 drivers/accel/qaic/sahara.h         |  6 ---
 5 files changed, 73 insertions(+), 16 deletions(-)

diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
index 5cc7994f4809..16c346e0e3b5 100644
--- a/drivers/accel/qaic/mhi_controller.c
+++ b/drivers/accel/qaic/mhi_controller.c
@@ -13,6 +13,7 @@
 
 #include "mhi_controller.h"
 #include "qaic.h"
+#include "sahara_image_table_ops.h"
 
 #define MAX_RESET_TIME_SEC 25
 
@@ -801,8 +802,6 @@ const char * const aic100_image_table[] = {
 	[10] = "qcom/aic100/fw10.bin",
 };
 
-const size_t aic100_image_table_size = ARRAY_SIZE(aic100_image_table);
-
 const char * const aic200_image_table[] = {
 	[5]  = "qcom/aic200/uefi.elf",
 	[12] = "qcom/aic200/aic200-nsp.bin",
@@ -831,7 +830,59 @@ const char * const aic200_image_table[] = {
 	[75] = "qcom/aic200/pvs.bin",
 };
 
-const size_t aic200_image_table_size = ARRAY_SIZE(aic200_image_table);
+static struct sahara_image_table_provider aic100_provider = {
+	.image_table = aic100_image_table,
+	.image_table_size = ARRAY_SIZE(aic100_image_table),
+	.dev_name = "AIC100",
+	.fw_folder_name = "aic100",
+	.list = LIST_HEAD_INIT(aic100_provider.list)
+};
+
+static struct sahara_image_table_provider aic200_provider = {
+	.image_table = aic200_image_table,
+	.image_table_size = ARRAY_SIZE(aic200_image_table),
+	.dev_name = "AIC200",
+	.fw_folder_name = "aic200",
+	.list = LIST_HEAD_INIT(aic200_provider.list)
+};
+
+static struct sahara_image_table_provider *aic_providers[] = {
+	&aic100_provider,
+	&aic200_provider,
+};
+
+int qaic_sahara_register_image_tables(void)
+{
+	int ret;
+
+	for (int i = 0; i < ARRAY_SIZE(aic_providers); i++) {
+		ret = sahara_register_image_table_provider(aic_providers[i]);
+		if (ret) {
+			pr_err("qaic: Failed to register image table %d\n",
+			       ret);
+
+			/* Rollback previously registered providers */
+			while (--i >= 0)
+				sahara_unregister_image_table_provider(aic_providers[i]);
+
+			return ret;
+		}
+	}
+	return 0;
+}
+
+void qaic_sahara_unregister_image_tables(void)
+{
+	int ret;
+
+	for (int i = 0; i < ARRAY_SIZE(aic_providers); i++) {
+		ret = sahara_unregister_image_table_provider(aic_providers[i]);
+		if (ret)
+			pr_err("qaic: Failed to unregister image table %d\n",
+			       ret);
+	}
+}
+
 
 static int mhi_read_reg(struct mhi_controller *mhi_cntrl, void __iomem *addr, u32 *out)
 {
diff --git a/drivers/accel/qaic/mhi_controller.h b/drivers/accel/qaic/mhi_controller.h
index 8939f6ae185e..90c0f07cbdf6 100644
--- a/drivers/accel/qaic/mhi_controller.h
+++ b/drivers/accel/qaic/mhi_controller.h
@@ -12,5 +12,7 @@ struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, voi
 void qaic_mhi_free_controller(struct mhi_controller *mhi_cntrl, bool link_up);
 void qaic_mhi_start_reset(struct mhi_controller *mhi_cntrl);
 void qaic_mhi_reset_done(struct mhi_controller *mhi_cntrl);
+int qaic_sahara_register_image_tables(void);
+void qaic_sahara_unregister_image_tables(void);
 
 #endif /* MHICONTROLLERQAIC_H_ */
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index e31bcb0ecfc9..5c4fab328003 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -688,6 +688,12 @@ static int __init qaic_init(void)
 		goto free_mhi;
 	}
 
+	ret = qaic_sahara_register_image_tables();
+	if (ret) {
+		pr_debug("qaic: Image table registration failed %d\n", ret);
+		goto free_mhi;
+	}
+
 	ret = qaic_timesync_init();
 	if (ret)
 		pr_debug("qaic: qaic_timesync_init failed %d\n", ret);
@@ -727,6 +733,7 @@ static void __exit qaic_exit(void)
 	 * reinitializing the link_up state after the cleanup is done.
 	 */
 	link_up = true;
+	qaic_sahara_unregister_image_tables();
 	qaic_ras_unregister();
 	qaic_bootlog_unregister();
 	qaic_timesync_deinit();
diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
index cf8f8b585223..7eae329396be 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/accel/qaic/sahara.c
@@ -14,6 +14,7 @@
 #include <linux/workqueue.h>
 
 #include "sahara.h"
+#include "sahara_image_table_ops.h"
 
 #define SAHARA_HELLO_CMD		0x1  /* Min protocol version 1.0 */
 #define SAHARA_HELLO_RESP_CMD		0x2  /* Min protocol version 1.0 */
@@ -738,13 +739,15 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 	INIT_WORK(&context->fw_work, sahara_processing);
 	INIT_WORK(&context->dump_work, sahara_dump_processing);
 
-	if (!strcmp(mhi_dev->mhi_cntrl->name, "AIC200")) {
-		context->image_table = aic200_image_table;
-		context->table_size = aic200_image_table_size;
-	} else {
-		context->image_table = aic100_image_table;
-		context->table_size = aic100_image_table_size;
-	}
+	/* Get the image table for a given device name */
+	context->image_table = sahara_get_image_table(mhi_dev->mhi_cntrl->name);
+	if (!context->image_table)
+		return -EINVAL;
+
+	/* Get the image table size for a given device name */
+	context->table_size = sahara_get_image_table_size(mhi_dev->mhi_cntrl->name);
+	if (!context->table_size)
+		return -EINVAL;
 
 	context->active_image_id = SAHARA_IMAGE_ID_NONE;
 	dev_set_drvdata(&mhi_dev->dev, context);
diff --git a/drivers/accel/qaic/sahara.h b/drivers/accel/qaic/sahara.h
index d7fd447ca85b..dde8c736d29e 100644
--- a/drivers/accel/qaic/sahara.h
+++ b/drivers/accel/qaic/sahara.h
@@ -8,10 +8,4 @@
 int sahara_register(void);
 void sahara_unregister(void);
 
-extern const char * const aic200_image_table[];
-extern const size_t aic200_image_table_size;
-
-extern const char * const aic100_image_table[];
-extern const size_t aic100_image_table_size;
-
 #endif /* __SAHARA_H__ */
-- 
2.34.1


