Return-Path: <linux-arm-msm+bounces-74625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD847B9AF0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 18:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 787C716EA3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 16:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18C3314B73;
	Wed, 24 Sep 2025 16:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JXNf2Wap"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9920A314B79
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758733092; cv=none; b=LiRyezqA4ncA6Spum/ZtS2tFrjmo25fhth0OLUF/cErziOf+u4kRwIcGlMQPGaXia802a8lM/tfEJLklSvMwFlB/YcqJ1kscch//UkvQQBTUhqu1U/QdxGIk7mJ7Ety3ku9zHn0LQmLlpuvIdoV+iGGXbwAgK7Vd01MRLx8pxRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758733092; c=relaxed/simple;
	bh=GW+CsQcDv9aEIAXsFqtODB4PIHMg+RXSOdxUSwcpj2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cRBdmFy3knBQrY8BaOXYbJatEfZn30MV2eVMIZY7Q6N7nb8CKJCA1nKfjQR7TcSjYriVF7XfREsh43tVUsnf5YjTyx7CK2zSKhotV+5z/tuC0Hj9tG14gjIyVAyJQiXVqJlTN6Teqt70mwMw3FpuSP/toLKmb3iUVw+fZUhGHuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JXNf2Wap; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODkrCV001919
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OMXCPIMsWRznXvlemM7WjO4HBGTtJU4cZ9nQCIg1OaI=; b=JXNf2WapcKYn5LYC
	exZoKlUCmFm6EMeezumEVj9+46tNv93k8MHLKNcN6QPIFHChl/gt1yZg/ezlfFZ5
	HFmdvQX5Fw1JqjwObMkYyv1T//0uBZycNYh4CihpJ2ha3pcuOeL9UP/DB/w5lN6n
	GLNF3fs3WcQlTR3v2j9P1biC0NP5q58LWL9KRXRr2MumFlKWrF6Y3AQU5VXK620B
	LA2pL9K6T40qT6P4W312waj5GPUHELWJKYAylE1uHbZLdV5BCibULU6Qv4dkqnb3
	PQ1TuHIIX5Nrq1g4am0S3K+t25ieyyehIIjp0K6zUG9By2aVotyYbMKWp3Betz3+
	mEA00A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98n44p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:58:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24458345f5dso101835ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 09:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758733088; x=1759337888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OMXCPIMsWRznXvlemM7WjO4HBGTtJU4cZ9nQCIg1OaI=;
        b=vyudEu5iR2szlRec9kiMn3xnMWownhpjd9CK9BsNWVFhHCejFOB8V61sFCsC5+ObFr
         ZJTBXrIVbghsfKCdGismqTzyK1IAh4pGcgNvi5OzHLcbL5vjiiR6LjPkLOo6CncbT2Dz
         qovZh2h2E+YDghKVkaDOCaeZEyrjK4WEw/NmnEbe95YuKrFaGrgKQZ3qJdHw6tSEGNkH
         KyMSXMqQaL63Zsp4CE+rMn7RjFddGigDWUptHws2/bTeiPZmngbEVe4n4tCoAdhXjfR4
         e8ylUf/aC1uvCs5Hr+ybVyPoQsah8cc617a5czumstOKWap2xvIMHooqntaD+ZaADtko
         hlOQ==
X-Gm-Message-State: AOJu0YxWjEVmCPFtE9ykp2Jqqbdm3l10/SijpAsIi+/nh0EVOVA7/T9P
	B3+1ksgtfslTQ4+rEnqBrYxvdXlv7qAURqLrKnJ+2LwTofacuwodj61Fq4zimI9QoV/A2raJcPZ
	3j5sZyIP6fjZcx+xkh8yqWP+VSG1gfoGQurK5VZC3TJdD2alYQ+Edzir3xbPPqjMa+6yt
X-Gm-Gg: ASbGncse0UiQ1ioIKc5QyFxzXGIpnZ2eOXRxh1MtjFSm6VyOdZ4xAplsXqpddtPXbxE
	Cnlg1Eirmdzq0TX/XIOmZ0/COg0d4uLZ+iUnxJY9/X07rTxeV0ft7N17ZhDkWX1MkTlgNnHT4Tc
	pQvUhSSi9m89pGtltYra3UgYCCddL5vu8FaNhROsDMFG/iZl87j6LSJ6jQ1YfGnGiE7p26ot9VQ
	SESbl/z8BX/bmYOluQTG0HNNwZ6UEjZIVhjdlfrnMUyqw9/6GFZjKl89T8f8/2XPe6j/9AWj7iR
	FaUezyVCehPWiPnCKmMD8l486Yk3ivfB/Gn15ZlJZfG3jrYgwtgLEL4/s8Nba0O04jZvxFU3eBh
	fDrleXiz9AkkVZUvcd1cLGQj0Jg==
X-Received: by 2002:a17:902:dace:b0:24a:fab6:d15a with SMTP id d9443c01a7336-27ed49ff533mr5635485ad.20.1758733087955;
        Wed, 24 Sep 2025 09:58:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5zNTc1/FlNBbfQ4JfPD56w4dMj0Qef96J3yy7lK3T1dcv6rklwwd5tfo7CidiSWdv7yfenQ==
X-Received: by 2002:a17:902:dace:b0:24a:fab6:d15a with SMTP id d9443c01a7336-27ed49ff533mr5634595ad.20.1758733086797;
        Wed, 24 Sep 2025 09:58:06 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980053078sm197415895ad.10.2025.09.24.09.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 09:58:06 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 22:27:34 +0530
Subject: [PATCH v2 2/2] spmi: spmi-pmic-arb: add support for PMIC arbiter
 v8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-glymur-spmi-v8-v2-2-202fc7a66a97@oss.qualcomm.com>
References: <20250924-glymur-spmi-v8-v2-0-202fc7a66a97@oss.qualcomm.com>
In-Reply-To: <20250924-glymur-spmi-v8-v2-0-202fc7a66a97@oss.qualcomm.com>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758733076; l=19332;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=I+nUG0xTzbNbMKIoorWMg8OTuVUmq0PvZOYU3WR6+eM=;
 b=qECM7OrXHQpPDWCgbVDIMOgBkIOzDXU6OM/KPBwhah+m8YB0HH1UVObRkGpjlsHg+rEu6+TDb
 nc7DtsYTTIiA+Thf8WPuoyG501ZLpszEyUUHhYV/SDdKWHjpkOWaOLd
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Proofpoint-GUID: cLdqFbEMZTm55qpEobWClTCpLMfowT1P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX6A0E6CSOpzLm
 Iy+RnjAAStUr1MbOD2MECU+PRYpv47B7pjas9n4iM9G+rrYjdooGBm2XWNov0tCrwx8asiJGmKf
 mlUAYaLZm8G5ljMIZpTgGt8H+SBBtIiPx+XBLmYKaX1npPfgTrCMM3+53iIoP9hPCjLWrSKAoxA
 cpl7zb4DbB5sELKTmwKPPR21gT09m18UngJPPKt60GyiZOmyNIk5HlG9SrIFzVY/bJZPTyrWNEZ
 RQB1CJADNga6YyVBD/Pp+oy9UO0FdPgekkd4TNZbJ6kXnZajrvD2up7oNtzKh/CCPehXzFwLA8r
 yPiorSuGz3+z8jFMkGsaipXw7GPEuTxNvWvJ/FqCGFtlOULC1yO7FccUwXtukmC3paD1Jocc4z3
 RoEeAbno
X-Proofpoint-ORIG-GUID: cLdqFbEMZTm55qpEobWClTCpLMfowT1P
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d42321 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Ik5BXOhrgj9YKjSFxXcA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

From: David Collins <david.collins@oss.qualcomm.com>

PMIC arbiter v8 supports up to 4 SPMI buses and up to 8192 PMIC
peripherals.  Its register map differs from v7 as several fields
increased in size. Add support for PMIC arbiter version 8.

Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 drivers/spmi/spmi-pmic-arb.c | 328 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 298 insertions(+), 30 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 91581974ef84ea49f2b9c64846634ee2da8df2bb..eefa1d776bf3c306a6d2c580ce8b055279294dc8 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2012-2015, 2017, 2021, The Linux Foundation. All rights reserved.
  */
 #include <linux/bitmap.h>
+#include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
@@ -25,10 +26,12 @@
 #define PMIC_ARB_VERSION_V3_MIN		0x30000000
 #define PMIC_ARB_VERSION_V5_MIN		0x50000000
 #define PMIC_ARB_VERSION_V7_MIN		0x70000000
+#define PMIC_ARB_VERSION_V8_MIN		0x80000000
 #define PMIC_ARB_INT_EN			0x0004
 
 #define PMIC_ARB_FEATURES		0x0004
 #define PMIC_ARB_FEATURES_PERIPH_MASK	GENMASK(10, 0)
+#define PMIC_ARB_FEATURES_V8_PERIPH_MASK	GENMASK(12, 0)
 
 #define PMIC_ARB_FEATURES1		0x0008
 
@@ -50,9 +53,10 @@
 #define SPMI_MAPPING_BIT_IS_1_RESULT(X)	(((X) >> 0) & 0xFF)
 
 #define SPMI_MAPPING_TABLE_TREE_DEPTH	16	/* Maximum of 16-bits */
-#define PMIC_ARB_MAX_PPID		BIT(12) /* PPID is 12bit */
+#define PMIC_ARB_MAX_PPID		BIT(13)
 #define PMIC_ARB_APID_VALID		BIT(15)
 #define PMIC_ARB_CHAN_IS_IRQ_OWNER(reg)	((reg) & BIT(24))
+#define PMIC_ARB_V8_CHAN_IS_IRQ_OWNER(reg)	((reg) & BIT(31))
 #define INVALID_EE				0xFF
 
 /* Ownership Table */
@@ -96,30 +100,37 @@ enum pmic_arb_channel {
 	PMIC_ARB_CHANNEL_OBS,
 };
 
-#define PMIC_ARB_MAX_BUSES		2
+#define PMIC_ARB_MAX_BUSES		4
+#define PMIC_ARB_MAX_BUSES_V8		4
 
 /* Maximum number of support PMIC peripherals */
 #define PMIC_ARB_MAX_PERIPHS		512
 #define PMIC_ARB_MAX_PERIPHS_V7		1024
+#define PMIC_ARB_MAX_PERIPHS_V8		8192
 #define PMIC_ARB_TIMEOUT_US		1000
 #define PMIC_ARB_MAX_TRANS_BYTES	(8)
 
 #define PMIC_ARB_APID_MASK		0xFF
 #define PMIC_ARB_PPID_MASK		0xFFF
+#define PMIC_ARB_V8_PPID_MASK		0x1FFF
 
 /* interrupt enable bit */
 #define SPMI_PIC_ACC_ENABLE_BIT		BIT(0)
 
+/*
+ * hwirq value crosses 32 bits only for platforms with more than 16 PMICs,
+ * none of which happen to support booting Linux in 32-bit mode.
+ */
 #define spec_to_hwirq(slave_id, periph_id, irq_id, apid) \
-	((((slave_id) & 0xF)   << 28) | \
-	(((periph_id) & 0xFF)  << 20) | \
-	(((irq_id)    & 0x7)   << 16) | \
-	(((apid)      & 0x3FF) << 0))
+	(FIELD_PREP(GENMASK(32, 28), (slave_id))  | \
+	FIELD_PREP(GENMASK(27, 20), (periph_id)) | \
+	FIELD_PREP(GENMASK(18, 16), (irq_id))    | \
+	FIELD_PREP(GENMASK(12, 0),  (apid)))
 
-#define hwirq_to_sid(hwirq)  (((hwirq) >> 28) & 0xF)
-#define hwirq_to_per(hwirq)  (((hwirq) >> 20) & 0xFF)
-#define hwirq_to_irq(hwirq)  (((hwirq) >> 16) & 0x7)
-#define hwirq_to_apid(hwirq) (((hwirq) >> 0)  & 0x3FF)
+#define hwirq_to_sid(hwirq)  FIELD_GET(GENMASK(32, 28), (hwirq))
+#define hwirq_to_per(hwirq)  FIELD_GET(GENMASK(27, 20), (hwirq))
+#define hwirq_to_irq(hwirq)  FIELD_GET(GENMASK(18, 16), (hwirq))
+#define hwirq_to_apid(hwirq) FIELD_GET(GENMASK(12, 0), (hwirq))
 
 struct pmic_arb_ver_ops;
 
@@ -138,11 +149,12 @@ struct spmi_pmic_arb;
  * @domain:		irq domain object for PMIC IRQ domain
  * @intr:		address of the SPMI interrupt control registers.
  * @cnfg:		address of the PMIC Arbiter configuration registers.
+ * @apid_owner:		on v8: address of APID owner mapping table registers
  * @spmic:		spmi controller registered for this bus
  * @lock:		lock to synchronize accesses.
- * @base_apid:		on v7: minimum APID associated with the particular SPMI
- *			bus instance
- * @apid_count:		on v5 and v7: number of APIDs associated with the
+ * @base_apid:		on v7 and v8: minimum APID associated with the
+			particular SPMI bus instance
+ * @apid_count:		on v5, v7 and v8: number of APIDs associated with the
  *			particular SPMI bus instance
  * @mapping_table:	in-memory copy of PPID -> APID mapping table.
  * @mapping_table_valid:bitmap containing valid-only periphs
@@ -159,6 +171,7 @@ struct spmi_pmic_arb_bus {
 	struct irq_domain	*domain;
 	void __iomem		*intr;
 	void __iomem		*cnfg;
+	void __iomem		*apid_owner;
 	struct spmi_controller	*spmic;
 	raw_spinlock_t		lock;
 	u16			base_apid;
@@ -181,6 +194,7 @@ struct spmi_pmic_arb_bus {
  * @wr_base:		on v1 "core", on v2 "chnls"    register base off DT.
  * @core:		core register base for v2 and above only (see above)
  * @core_size:		core register base size
+ * @apid_map:		on v8, APID mapping table register base
  * @channel:		execution environment channel to use for accesses.
  * @ee:			the current Execution Environment
  * @ver_ops:		version dependent operations.
@@ -193,6 +207,7 @@ struct spmi_pmic_arb {
 	void __iomem		*wr_base;
 	void __iomem		*core;
 	resource_size_t		core_size;
+	void __iomem		*apid_map;
 	u8			channel;
 	u8			ee;
 	const struct pmic_arb_ver_ops *ver_ops;
@@ -206,6 +221,7 @@ struct spmi_pmic_arb {
  *
  * @ver_str:		version string.
  * @get_core_resources:	initializes the core, observer and channels
+ * @get_bus_resources:	requests per-SPMI bus register resources
  * @init_apid:		finds the apid base and count
  * @ppid_to_apid:	finds the apid for a given ppid.
  * @non_data_cmd:	on v1 issues an spmi non-data command.
@@ -227,6 +243,9 @@ struct spmi_pmic_arb {
 struct pmic_arb_ver_ops {
 	const char *ver_str;
 	int (*get_core_resources)(struct platform_device *pdev, void __iomem *core);
+	int (*get_bus_resources)(struct platform_device *pdev,
+				 struct device_node *node,
+				 struct spmi_pmic_arb_bus *bus);
 	int (*init_apid)(struct spmi_pmic_arb_bus *bus, int index);
 	int (*ppid_to_apid)(struct spmi_pmic_arb_bus *bus, u16 ppid);
 	/* spmi commands (read_cmd, write_cmd, cmd) functionality */
@@ -656,7 +675,7 @@ static int periph_interrupt(struct spmi_pmic_arb_bus *bus, u16 apid)
 	unsigned int irq;
 	u32 status, id;
 	int handled = 0;
-	u8 sid = (bus->apid_data[apid].ppid >> 8) & 0xF;
+	u8 sid = (bus->apid_data[apid].ppid >> 8) & 0x1F;
 	u8 per = bus->apid_data[apid].ppid & 0xFF;
 
 	status = readl_relaxed(pmic_arb->ver_ops->irq_status(bus, apid));
@@ -686,7 +705,7 @@ static void pmic_arb_chained_irq(struct irq_desc *desc)
 	int last = bus->max_apid;
 	/*
 	 * acc_offset will be non-zero for the secondary SPMI bus instance on
-	 * v7 controllers.
+	 * v7 and v8 controllers.
 	 */
 	int acc_offset = bus->base_apid >> 5;
 	u8 ee = pmic_arb->ee;
@@ -913,7 +932,7 @@ static int qpnpint_irq_domain_translate(struct irq_domain *d,
 		return -EINVAL;
 	if (fwspec->param_count != 4)
 		return -EINVAL;
-	if (intspec[0] > 0xF || intspec[1] > 0xFF || intspec[2] > 0x7)
+	if (intspec[0] > 0x1F || intspec[1] > 0xFF || intspec[2] > 0x7)
 		return -EINVAL;
 
 	ppid = intspec[0] << 8 | intspec[1];
@@ -1160,6 +1179,24 @@ static int pmic_arb_ppid_to_apid_v2(struct spmi_pmic_arb_bus *bus, u16 ppid)
 	return apid_valid & ~PMIC_ARB_APID_VALID;
 }
 
+static void pmic_arb_dump_apid_map(struct spmi_pmic_arb_bus *bus)
+{
+	struct apid_data *apidd;
+	u16 apid, ppid;
+
+	/* Dump the mapping table for debug purposes. */
+	dev_dbg(&bus->spmic->dev, "PPID APID Write-EE IRQ-EE\n");
+	for (ppid = 0; ppid < PMIC_ARB_MAX_PPID; ppid++) {
+		apid = bus->ppid_to_apid[ppid];
+		if (apid & PMIC_ARB_APID_VALID) {
+			apid &= ~PMIC_ARB_APID_VALID;
+			apidd = &bus->apid_data[apid];
+			dev_dbg(&bus->spmic->dev, "%#03X %3u %2u %2u\n",
+				ppid, apid, apidd->write_ee, apidd->irq_ee);
+		}
+	}
+}
+
 static int pmic_arb_read_apid_map_v5(struct spmi_pmic_arb_bus *bus)
 {
 	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
@@ -1222,17 +1259,7 @@ static int pmic_arb_read_apid_map_v5(struct spmi_pmic_arb_bus *bus)
 		bus->last_apid = i;
 	}
 
-	/* Dump the mapping table for debug purposes. */
-	dev_dbg(&bus->spmic->dev, "PPID APID Write-EE IRQ-EE\n");
-	for (ppid = 0; ppid < PMIC_ARB_MAX_PPID; ppid++) {
-		apid = bus->ppid_to_apid[ppid];
-		if (apid & PMIC_ARB_APID_VALID) {
-			apid &= ~PMIC_ARB_APID_VALID;
-			apidd = &bus->apid_data[apid];
-			dev_dbg(&bus->spmic->dev, "%#03X %3u %2u %2u\n",
-				ppid, apid, apidd->write_ee, apidd->irq_ee);
-		}
-	}
+	pmic_arb_dump_apid_map(bus);
 
 	return 0;
 }
@@ -1346,7 +1373,7 @@ static int pmic_arb_get_core_resources_v7(struct platform_device *pdev,
 }
 
 /*
- * Only v7 supports 2 buses. Each bus will get a different apid count, read
+ * Arbiter v7 supports 2 buses. Each bus will get a different apid count, read
  * from different registers.
  */
 static int pmic_arb_init_apid_v7(struct spmi_pmic_arb_bus *bus, int index)
@@ -1424,6 +1451,185 @@ static int pmic_arb_offset_v7(struct spmi_pmic_arb_bus *bus, u8 sid, u16 addr,
 	return offset;
 }
 
+static int pmic_arb_get_core_resources_v8(struct platform_device *pdev,
+					  void __iomem *core)
+{
+	struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
+
+	pmic_arb->apid_map = devm_platform_ioremap_resource_byname(pdev,
+								   "chnl_map");
+	if (IS_ERR(pmic_arb->apid_map))
+		return PTR_ERR(pmic_arb->apid_map);
+
+	pmic_arb->core = core;
+
+	pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS_V8;
+
+	return pmic_arb_get_obsrvr_chnls_v2(pdev);
+}
+
+static int pmic_arb_get_bus_resources_v8(struct platform_device *pdev,
+					 struct device_node *node,
+					 struct spmi_pmic_arb_bus *bus)
+{
+	int index;
+
+	index = of_property_match_string(node, "reg-names", "chnl_owner");
+	if (index < 0) {
+		dev_err(&pdev->dev, "chnl_owner reg region missing\n");
+		return -EINVAL;
+	}
+
+	bus->apid_owner = devm_of_iomap(&pdev->dev, node, index, NULL);
+
+	return PTR_ERR_OR_ZERO(bus->apid_owner);
+}
+
+static int pmic_arb_read_apid_map_v8(struct spmi_pmic_arb_bus *bus)
+{
+	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
+	struct apid_data *apidd;
+	struct apid_data *prev_apidd;
+	u16 i, apid, ppid, apid_max;
+	bool valid, is_irq_ee;
+	u32 regval, offset;
+
+	/*
+	 * In order to allow multiple EEs to write to a single PPID in arbiter
+	 * version 8, there can be more than one APID mapped to each PPID.  The
+	 * owner field for each of these mappings specifies the EE which is
+	 * allowed to write to the APID.  The owner of the last (highest) APID
+	 * which has the IRQ owner bit set for a given PPID will receive
+	 * interrupts from the PPID.
+	 *
+	 * In arbiter version 8, the APID numbering space is divided between
+	 * the SPMI buses according to this mapping:
+	 * APID = 0     to N-1       --> bus 0
+	 * APID = N     to N+M-1     --> bus 1
+	 * APID = N+M   to N+M+P-1   --> bus 2
+	 * APID = N+M+P to N+M+P+Q-1 --> bus 3
+	 * where N = number of APIDs supported by bus 0
+	 *       M = number of APIDs supported by bus 1
+	 *       P = number of APIDs supported by bus 2
+	 *       Q = number of APIDs supported by bus 3
+	 */
+	apidd = &bus->apid_data[bus->base_apid];
+	apid_max = bus->base_apid + bus->apid_count;
+	for (i = bus->base_apid; i < apid_max; i++, apidd++) {
+		offset = pmic_arb->ver_ops->apid_map_offset(i);
+		regval = readl_relaxed(pmic_arb->apid_map + offset);
+		if (!regval)
+			continue;
+		ppid = regval & PMIC_ARB_V8_PPID_MASK;
+		is_irq_ee = PMIC_ARB_V8_CHAN_IS_IRQ_OWNER(regval);
+
+		regval = readl_relaxed(pmic_arb->ver_ops->apid_owner(bus, i));
+		apidd->write_ee = SPMI_OWNERSHIP_PERIPH2OWNER(regval);
+
+		apidd->irq_ee = is_irq_ee ? apidd->write_ee : INVALID_EE;
+
+		valid = bus->ppid_to_apid[ppid] & PMIC_ARB_APID_VALID;
+		apid = bus->ppid_to_apid[ppid] & ~PMIC_ARB_APID_VALID;
+		prev_apidd = &bus->apid_data[apid];
+
+		if (!valid || apidd->write_ee == pmic_arb->ee) {
+			/* First PPID mapping or one for this EE */
+			bus->ppid_to_apid[ppid] = i | PMIC_ARB_APID_VALID;
+		} else if (valid && is_irq_ee &&
+			   prev_apidd->write_ee == pmic_arb->ee) {
+			/*
+			 * Duplicate PPID mapping after the one for this EE;
+			 * override the irq owner
+			 */
+			prev_apidd->irq_ee = apidd->irq_ee;
+		}
+
+		apidd->ppid = ppid;
+		bus->last_apid = i;
+	}
+
+	pmic_arb_dump_apid_map(bus);
+
+	return 0;
+}
+
+static int pmic_arb_init_apid_v8(struct spmi_pmic_arb_bus *bus, int index)
+{
+	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
+	int ret, i;
+
+	if (index < 0 || index >= PMIC_ARB_MAX_BUSES_V8) {
+		dev_err(&bus->spmic->dev, "Unsupported bus index %d detected\n",
+			index);
+		return -EINVAL;
+	}
+
+	bus->base_apid = 0;
+	bus->apid_count = 0;
+	for (i = 0; i <= index; i++) {
+		bus->base_apid += bus->apid_count;
+		bus->apid_count = readl_relaxed(pmic_arb->core + PMIC_ARB_FEATURES + i * 4) &
+						PMIC_ARB_FEATURES_V8_PERIPH_MASK;
+	}
+
+	if (bus->apid_count == 0) {
+		dev_err(&bus->spmic->dev, "Bus %d not implemented\n", index);
+		return -EINVAL;
+	} else if (bus->base_apid + bus->apid_count > pmic_arb->max_periphs) {
+		dev_err(&bus->spmic->dev, "Unsupported max APID %d detected\n",
+			bus->base_apid + bus->apid_count);
+		return -EINVAL;
+	}
+
+	ret = pmic_arb_init_apid_min_max(bus);
+	if (ret)
+		return ret;
+
+	ret = pmic_arb_read_apid_map_v8(bus);
+	if (ret) {
+		dev_err(&bus->spmic->dev, "could not read APID->PPID mapping table, rc= %d\n",
+			ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+/*
+ * v8 offset per ee and per apid for observer channels and per apid for
+ * read/write channels.
+ */
+static int pmic_arb_offset_v8(struct spmi_pmic_arb_bus *bus, u8 sid, u16 addr,
+			      enum pmic_arb_channel ch_type)
+{
+	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
+	u16 apid;
+	int rc;
+	u32 offset = 0;
+	u16 ppid = (sid << 8) | (addr >> 8);
+
+	rc = pmic_arb->ver_ops->ppid_to_apid(bus, ppid);
+	if (rc < 0)
+		return rc;
+
+	apid = rc;
+	switch (ch_type) {
+	case PMIC_ARB_CHANNEL_OBS:
+		offset = 0x40000 * pmic_arb->ee + 0x20 * apid;
+		break;
+	case PMIC_ARB_CHANNEL_RW:
+		if (bus->apid_data[apid].write_ee != pmic_arb->ee) {
+			dev_err(&bus->spmic->dev, "disallowed SPMI write to sid=%u, addr=0x%04X\n",
+				sid, addr);
+			return -EPERM;
+		}
+		offset = 0x200 * apid;
+		break;
+	}
+
+	return offset;
+}
+
 static u32 pmic_arb_fmt_cmd_v1(u8 opc, u8 sid, u16 addr, u8 bc)
 {
 	return (opc << 27) | ((sid & 0xf) << 20) | (addr << 4) | (bc & 0x7);
@@ -1490,6 +1696,14 @@ pmic_arb_acc_enable_v7(struct spmi_pmic_arb_bus *bus, u16 n)
 	return pmic_arb->wr_base + 0x100 + 0x1000 * n;
 }
 
+static void __iomem *
+pmic_arb_acc_enable_v8(struct spmi_pmic_arb_bus *bus, u16 n)
+{
+	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
+
+	return pmic_arb->wr_base + 0x100 + 0x200 * n;
+}
+
 static void __iomem *
 pmic_arb_irq_status_v1(struct spmi_pmic_arb_bus *bus, u16 n)
 {
@@ -1516,6 +1730,14 @@ pmic_arb_irq_status_v7(struct spmi_pmic_arb_bus *bus, u16 n)
 	return pmic_arb->wr_base + 0x104 + 0x1000 * n;
 }
 
+static void __iomem *
+pmic_arb_irq_status_v8(struct spmi_pmic_arb_bus *bus, u16 n)
+{
+	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
+
+	return pmic_arb->wr_base + 0x104 + 0x200 * n;
+}
+
 static void __iomem *
 pmic_arb_irq_clear_v1(struct spmi_pmic_arb_bus *bus, u16 n)
 {
@@ -1542,6 +1764,14 @@ pmic_arb_irq_clear_v7(struct spmi_pmic_arb_bus *bus, u16 n)
 	return pmic_arb->wr_base + 0x108 + 0x1000 * n;
 }
 
+static void __iomem *
+pmic_arb_irq_clear_v8(struct spmi_pmic_arb_bus *bus, u16 n)
+{
+	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
+
+	return pmic_arb->wr_base + 0x108 + 0x200 * n;
+}
+
 static u32 pmic_arb_apid_map_offset_v2(u16 n)
 {
 	return 0x800 + 0x4 * n;
@@ -1557,6 +1787,12 @@ static u32 pmic_arb_apid_map_offset_v7(u16 n)
 	return 0x2000 + 0x4 * n;
 }
 
+static u32 pmic_arb_apid_map_offset_v8(u16 n)
+{
+	/* For v8, offset is from "chnl_map" base register, not "core". */
+	return 0x4 * n;
+}
+
 static void __iomem *
 pmic_arb_apid_owner_v2(struct spmi_pmic_arb_bus *bus, u16 n)
 {
@@ -1564,7 +1800,7 @@ pmic_arb_apid_owner_v2(struct spmi_pmic_arb_bus *bus, u16 n)
 }
 
 /*
- * For arbiter version 7, APID ownership table registers have independent
+ * For arbiter version 7 and 8, APID ownership table registers have independent
  * numbering space for each SPMI bus instance, so each is indexed starting from
  * 0.
  */
@@ -1574,6 +1810,12 @@ pmic_arb_apid_owner_v7(struct spmi_pmic_arb_bus *bus, u16 n)
 	return bus->cnfg + 0x4 * (n - bus->base_apid);
 }
 
+static void __iomem *
+pmic_arb_apid_owner_v8(struct spmi_pmic_arb_bus *bus, u16 n)
+{
+	return bus->apid_owner + 0x4 * (n - bus->base_apid);
+}
+
 static const struct pmic_arb_ver_ops pmic_arb_v1 = {
 	.ver_str		= "v1",
 	.get_core_resources	= pmic_arb_get_core_resources_v1,
@@ -1654,6 +1896,23 @@ static const struct pmic_arb_ver_ops pmic_arb_v7 = {
 	.apid_owner		= pmic_arb_apid_owner_v7,
 };
 
+static const struct pmic_arb_ver_ops pmic_arb_v8 = {
+	.ver_str		= "v8",
+	.get_core_resources	= pmic_arb_get_core_resources_v8,
+	.get_bus_resources	= pmic_arb_get_bus_resources_v8,
+	.init_apid		= pmic_arb_init_apid_v8,
+	.ppid_to_apid		= pmic_arb_ppid_to_apid_v5,
+	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
+	.offset			= pmic_arb_offset_v8,
+	.fmt_cmd		= pmic_arb_fmt_cmd_v2,
+	.owner_acc_status	= pmic_arb_owner_acc_status_v7,
+	.acc_enable		= pmic_arb_acc_enable_v8,
+	.irq_status		= pmic_arb_irq_status_v8,
+	.irq_clear		= pmic_arb_irq_clear_v8,
+	.apid_map_offset	= pmic_arb_apid_map_offset_v8,
+	.apid_owner		= pmic_arb_apid_owner_v8,
+};
+
 static const struct irq_domain_ops pmic_arb_irq_domain_ops = {
 	.activate = qpnpint_irq_domain_activate,
 	.alloc = qpnpint_irq_domain_alloc,
@@ -1731,6 +1990,12 @@ static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
 	bus->spmic = ctrl;
 	bus->id = bus_index;
 
+	if (pmic_arb->ver_ops->get_bus_resources) {
+		ret = pmic_arb->ver_ops->get_bus_resources(pdev, node, bus);
+		if (ret)
+			return ret;
+	}
+
 	ret = pmic_arb->ver_ops->init_apid(bus, bus_index);
 	if (ret)
 		return ret;
@@ -1825,8 +2090,10 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 		pmic_arb->ver_ops = &pmic_arb_v3;
 	else if (hw_ver < PMIC_ARB_VERSION_V7_MIN)
 		pmic_arb->ver_ops = &pmic_arb_v5;
-	else
+	else if (hw_ver < PMIC_ARB_VERSION_V8_MIN)
 		pmic_arb->ver_ops = &pmic_arb_v7;
+	else
+		pmic_arb->ver_ops = &pmic_arb_v8;
 
 	err = pmic_arb->ver_ops->get_core_resources(pdev, core);
 	if (err)
@@ -1875,6 +2142,7 @@ static void spmi_pmic_arb_remove(struct platform_device *pdev)
 static const struct of_device_id spmi_pmic_arb_match_table[] = {
 	{ .compatible = "qcom,spmi-pmic-arb", },
 	{ .compatible = "qcom,x1e80100-spmi-pmic-arb", },
+	{ .compatible = "qcom,glymur-spmi-pmic-arb", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, spmi_pmic_arb_match_table);

-- 
2.25.1


