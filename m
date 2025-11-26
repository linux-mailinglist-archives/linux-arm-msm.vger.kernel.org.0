Return-Path: <linux-arm-msm+bounces-83372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A38D0C88205
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 06:14:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 900B334B6E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 05:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB00F311C01;
	Wed, 26 Nov 2025 05:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="okWJ+TiI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MjBAQXyd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80A027A91D
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 05:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764134023; cv=none; b=YaUHo6CMvG2GjQ0Wb/HtYSa2mLZ7vIyc/ZUD8iUYdLu9Oz39x/kTCZaNMIX93lutU7Cmd4cD8pY3h2m2EILh301T27r5ZqEIvtb+yr5e9uEzZ7uEk9Z0m7xCA8Nje8l6F3AdeaLuIina6v6EIdIDNJFKNhnsuRZc7ZbgKCu0hXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764134023; c=relaxed/simple;
	bh=GW8yLc2UIqjqkfPJhp8MpdHcNkEAEEJ1L7xbZycQk24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BAH/0AwIbVF3717zli6QcLNkwwV5+KimvINJw6boQmoccK1uhnS25+Jmf2USVvg58kxWBj5zC2tQM97YZu0YThXz7/uaNSsSdKVnytCJ+nWBewz+VaEn10A75kx1Zn2V79/SyRXH6M2aR/8okorNMCT5fOsEf4YWS5INoQfFKW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=okWJ+TiI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MjBAQXyd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APGFINK2655531
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 05:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q8BIinWaA4NqNTmmossUuPpNPktueVgjDEDuDc86/kk=; b=okWJ+TiIH21LcqTa
	KefR6vBu55cmXpa0aPCVzGprE7lu7D0yJRWR1tr9+K4imfDZ9W8ndysFxyeCcoCq
	xzhswQtW3K+tFx6lq+3DD09GcVQKjHa2ZkHFKBua2j6XPnf5lZS9+b9c+m5F/OGC
	TsmJbZcHVZSaXPJa3JG4p0BMbbYAXwuiWz/j59D3Kh2Fu7+XlHouNCbjIWW1kxTe
	XnUJmDFmoLtqw7Xhzj/BATWowH1UlUei/QHOlL95GQmXARZ72GXK2m3L/+59bNwv
	6pyoDxQCN9w1Og+G+nJGdYeczKBm7yhsPG0x7NxFZdpg78YemtuAQYow56ZKmBOe
	wsnesA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an9fxu3wt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 05:13:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29806c42760so245426785ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 21:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764134017; x=1764738817; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q8BIinWaA4NqNTmmossUuPpNPktueVgjDEDuDc86/kk=;
        b=MjBAQXydXk0MnULxVWJr4EHjg53I0FDnMqX62FIOryEPFwDSD5mDHb2DPzbCsNibie
         Ti9rB1Knas0tp2XpoYKvt/jrW0tSPNBALWgMUMpBUY7CSBJrams+7CERH+Uo/E3A6rv6
         y49ix7JCtVatt1OGnPlPSxxJ7NZi742oa6qmuTjGMQwl9m2XsaePKqHtE+pVwsm0eLDI
         +kW5JGm2GWPiwF5/lta6K/NZq9VEarvIa+Db+cEIJKfFxNjydhR9tydLhnSzMni8DfL/
         V9eK31V+uwn7isCC58TNjO/cgF6XLM3ui0o86IlY1kQTcjsNgVekiZ1Z+nlTnaB1kvO0
         fGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764134017; x=1764738817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q8BIinWaA4NqNTmmossUuPpNPktueVgjDEDuDc86/kk=;
        b=Ksa4at/oB4qe2mAtTxAHUhLYVoVeV+spYUZ2weSo3AjzERCS23CLXYloXZQz+8NPuK
         Bpu/nwdrCbOCDEalRpruBDiKaflFNiRBAUJHm1qBczv67AxBl5i3EiCTz9bCjO1QjhIx
         yA/sKyMIsB1f/0QwY5kNsTY1qQ32Fs/jWJTVFDEAdB1wOY285Z8QRUEhbjJMlSrnFjj/
         NLDQBRBLPH3dQf8bfNZ4P9b/PHA2PXjv7CoBNPyx9cro7+Ky1aWES0Xccte4IQ3uaXdF
         w0USAxZlwOfobfjcys9SUvG3xPPSCbFg8wiww103HBTX9K8ct24Rs7tnU4ptnYe872D1
         l7LA==
X-Gm-Message-State: AOJu0YyoNzqyeacEsvvTZR8sDplHIbQ7YITLqhzKlVAXrvNrWUsxERoM
	XyAA93itmwpRpBuXi85URSvmEnTb/KMSjIVOmcKNFGelCOs2UTQUGTH0TMBlauhJchhRHCSF2CY
	rhFdAyfyxhBgVMW32lEOMVPGSSImkENFfNKkyZ675qth/YkMwk5QQpRus4+71DhPezj56
X-Gm-Gg: ASbGncsFHhNzpE6Zg3B/GfW9BF4RM4U4EBzFbujvIXp8EE3PAJQEWL1Z+7Xj4a8q4n3
	TenDRYCfeIsTPI+JKq3NFyTI8wBd1Pei1J25gutPtZfUE2yyVYDlyZT3WNNyjanLgoCn6BR0qAv
	36EOBUOj0NiPEMCkalXq4Dy4DozEXME/9H4cPn4ILIpsrLrXrY2ANCYeky1mCdSyNYGD9aeTX5S
	m86E1Io1AduIRLcf6sk+gPznQ4qoXWH/09sPkgIHPNu4TAkeWogO0zROhEU2leHp5m1YPJixU1Z
	ARldUNKCSvp1AkWFbGOteoW7yA+FYzGkxRuOsZ/xtaw7hJmQQz9qvT4SVvEhx5CE1Wpvz02Px41
	85Fz0LU99scr1GzRQ3+54d4dAnySDiQp8yFBevpPIKUqW
X-Received: by 2002:a17:903:1248:b0:290:b53b:7456 with SMTP id d9443c01a7336-29baae3d5c6mr61466405ad.5.1764134017126;
        Tue, 25 Nov 2025 21:13:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJ/mICK1p5OtI5F6UBy7XoeMlP0++jnbft3UIeGaH9XzGWPJuZd/xAHxnVydMluNIccJi2mw==
X-Received: by 2002:a17:903:1248:b0:290:b53b:7456 with SMTP id d9443c01a7336-29baae3d5c6mr61466025ad.5.1764134016574;
        Tue, 25 Nov 2025 21:13:36 -0800 (PST)
Received: from hu-jprakash-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13a870sm183591315ad.34.2025.11.25.21.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 21:13:36 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 10:42:55 +0530
Subject: [PATCH v5 3/3] spmi: spmi-pmic-arb: add support for PMIC arbiter
 v8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-pmic_arb_v8-v5-3-4dd8dc5dc5a1@oss.qualcomm.com>
References: <20251126-pmic_arb_v8-v5-0-4dd8dc5dc5a1@oss.qualcomm.com>
In-Reply-To: <20251126-pmic_arb_v8-v5-0-4dd8dc5dc5a1@oss.qualcomm.com>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        aiqun.yu@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764133999; l=20139;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=h0ku4FNo/2pHvhHTLCHbgaiuFPsCdnGG9TKf5qkx7p4=;
 b=ufsxgR34VDqIySiarfJ3/sr7HToZyUD/vmY4gP47u035CV6oIy6WwDt5ttmxSseUByPPqtJGH
 wxWpCjNOveFAjC4z7XkORG2fdTs16VjXjld38zNJAAieLz8FW/S4Rx+
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=I6tohdgg c=1 sm=1 tr=0 ts=69268c82 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=MIFvKxIP_Cdm49Cuf3gA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA0MCBTYWx0ZWRfXyUA2WhVow1MF
 7V7d6OZnX+Y9hT50kzR1/0w2yP4VFA5I9lrX6FL+NJDKAPP1VjJas/UpDJl/vm2o9GDifnSkC6G
 SMOv1bCn4zGynl/gKg89wigF/ssDpPOKjV96VGIjhUMGPerDyRdllP0aEBR0mTPjEqzMtkWclSp
 auFBZdBMc2JSTfLaO1wa5OaJ1yENGqIVhr2sz+VgitKtvSPGvBwYVRL38XVegX4Y3U+/UxF6luB
 yRwHcrrwbqj/03zURrG9O2Z+kkF3WMNH2tzysCZL6sdIlr0DdX5o9cfonmhShcmN/9EtgxFrxZd
 m/4B5dpylmD3vJR75C+XUpvfqW93JyiS4LUWtZ7FQ==
X-Proofpoint-ORIG-GUID: LDCDEEU4wrnxFlRMW2tz6A-aloUQcswb
X-Proofpoint-GUID: LDCDEEU4wrnxFlRMW2tz6A-aloUQcswb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260040

From: David Collins <david.collins@oss.qualcomm.com>

PMIC arbiter v8 supports up to 4 SPMI buses and up to 8192 PMIC
peripherals.  Its register map differs from v7 as several fields
increased in size. Add support for PMIC arbiter version 8.

Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/spmi/spmi-pmic-arb.c | 304 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 255 insertions(+), 49 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 91581974ef84..69f8d456324a 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -2,6 +2,8 @@
 /*
  * Copyright (c) 2012-2015, 2017, 2021, The Linux Foundation. All rights reserved.
  */
+
+#include <linux/bitfield.h>
 #include <linux/bitmap.h>
 #include <linux/delay.h>
 #include <linux/err.h>
@@ -25,12 +27,12 @@
 #define PMIC_ARB_VERSION_V3_MIN		0x30000000
 #define PMIC_ARB_VERSION_V5_MIN		0x50000000
 #define PMIC_ARB_VERSION_V7_MIN		0x70000000
+#define PMIC_ARB_VERSION_V8_MIN		0x80000000
 #define PMIC_ARB_INT_EN			0x0004
 
 #define PMIC_ARB_FEATURES		0x0004
 #define PMIC_ARB_FEATURES_PERIPH_MASK	GENMASK(10, 0)
-
-#define PMIC_ARB_FEATURES1		0x0008
+#define PMIC_ARB_FEATURES_V8_PERIPH_MASK	GENMASK(12, 0)
 
 /* PMIC Arbiter channel registers offsets */
 #define PMIC_ARB_CMD			0x00
@@ -50,9 +52,11 @@
 #define SPMI_MAPPING_BIT_IS_1_RESULT(X)	(((X) >> 0) & 0xFF)
 
 #define SPMI_MAPPING_TABLE_TREE_DEPTH	16	/* Maximum of 16-bits */
-#define PMIC_ARB_MAX_PPID		BIT(12) /* PPID is 12bit */
+#define PMIC_ARB_MAX_PPID		BIT(13)
 #define PMIC_ARB_APID_VALID		BIT(15)
-#define PMIC_ARB_CHAN_IS_IRQ_OWNER(reg)	((reg) & BIT(24))
+#define PMIC_ARB_CHAN_IS_IRQ_OWNER_MASK	BIT(24)
+#define PMIC_ARB_V8_CHAN_IS_IRQ_OWNER_MASK	BIT(31)
+
 #define INVALID_EE				0xFF
 
 /* Ownership Table */
@@ -96,30 +100,37 @@ enum pmic_arb_channel {
 	PMIC_ARB_CHANNEL_OBS,
 };
 
-#define PMIC_ARB_MAX_BUSES		2
+#define PMIC_ARB_MAX_BUSES		4
 
 /* Maximum number of support PMIC peripherals */
 #define PMIC_ARB_MAX_PERIPHS		512
 #define PMIC_ARB_MAX_PERIPHS_V7		1024
+#define PMIC_ARB_MAX_PERIPHS_V8		8192
 #define PMIC_ARB_TIMEOUT_US		1000
 #define PMIC_ARB_MAX_TRANS_BYTES	(8)
 
 #define PMIC_ARB_APID_MASK		0xFF
-#define PMIC_ARB_PPID_MASK		0xFFF
+#define PMIC_ARB_PPID_MASK		GENMASK(11, 0)
+#define PMIC_ARB_V8_PPID_MASK		GENMASK(12, 0)
 
 /* interrupt enable bit */
 #define SPMI_PIC_ACC_ENABLE_BIT		BIT(0)
 
+#define HWIRQ_SID_MASK	GENMASK(28, 24)
+#define HWIRQ_PID_MASK	GENMASK(23, 16)
+#define HWIRQ_IRQID_MASK	GENMASK(15, 13)
+#define HWIRQ_APID_MASK	GENMASK(12, 0)
+
 #define spec_to_hwirq(slave_id, periph_id, irq_id, apid) \
-	((((slave_id) & 0xF)   << 28) | \
-	(((periph_id) & 0xFF)  << 20) | \
-	(((irq_id)    & 0x7)   << 16) | \
-	(((apid)      & 0x3FF) << 0))
+	(FIELD_PREP(HWIRQ_SID_MASK, (slave_id))  | \
+	 FIELD_PREP(HWIRQ_PID_MASK, (periph_id)) | \
+	 FIELD_PREP(HWIRQ_IRQID_MASK, (irq_id))  | \
+	 FIELD_PREP(HWIRQ_APID_MASK, (apid)))
 
-#define hwirq_to_sid(hwirq)  (((hwirq) >> 28) & 0xF)
-#define hwirq_to_per(hwirq)  (((hwirq) >> 20) & 0xFF)
-#define hwirq_to_irq(hwirq)  (((hwirq) >> 16) & 0x7)
-#define hwirq_to_apid(hwirq) (((hwirq) >> 0)  & 0x3FF)
+#define hwirq_to_sid(hwirq)  FIELD_GET(HWIRQ_SID_MASK, (hwirq))
+#define hwirq_to_per(hwirq)  FIELD_GET(HWIRQ_PID_MASK, (hwirq))
+#define hwirq_to_irq(hwirq)  FIELD_GET(HWIRQ_IRQID_MASK, (hwirq))
+#define hwirq_to_apid(hwirq) FIELD_GET(HWIRQ_APID_MASK, (hwirq))
 
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
+ *			particular SPMI bus instance
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
@@ -913,7 +932,8 @@ static int qpnpint_irq_domain_translate(struct irq_domain *d,
 		return -EINVAL;
 	if (fwspec->param_count != 4)
 		return -EINVAL;
-	if (intspec[0] > 0xF || intspec[1] > 0xFF || intspec[2] > 0x7)
+	if (intspec[0] > FIELD_MAX(HWIRQ_SID_MASK) || intspec[1] > FIELD_MAX(HWIRQ_PID_MASK) ||
+	    intspec[2] > FIELD_MAX(HWIRQ_IRQID_MASK))
 		return -EINVAL;
 
 	ppid = intspec[0] << 8 | intspec[1];
@@ -1160,7 +1180,9 @@ static int pmic_arb_ppid_to_apid_v2(struct spmi_pmic_arb_bus *bus, u16 ppid)
 	return apid_valid & ~PMIC_ARB_APID_VALID;
 }
 
-static int pmic_arb_read_apid_map_v5(struct spmi_pmic_arb_bus *bus)
+static int _pmic_arb_read_apid_map(struct spmi_pmic_arb_bus *bus,
+				   void __iomem *ppid_base, unsigned long ppid_mask,
+				   u8 ppid_shift, unsigned long irq_owner_mask)
 {
 	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
 	struct apid_data *apidd;
@@ -1171,7 +1193,7 @@ static int pmic_arb_read_apid_map_v5(struct spmi_pmic_arb_bus *bus)
 
 	/*
 	 * In order to allow multiple EEs to write to a single PPID in arbiter
-	 * version 5 and 7, there is more than one APID mapped to each PPID.
+	 * version 5,7 and 8, there can be more than one APID mapped to each PPID.
 	 * The owner field for each of these mappings specifies the EE which is
 	 * allowed to write to the APID.  The owner of the last (highest) APID
 	 * which has the IRQ owner bit set for a given PPID will receive
@@ -1183,19 +1205,30 @@ static int pmic_arb_read_apid_map_v5(struct spmi_pmic_arb_bus *bus)
 	 * APID = N to N+M-1 are assigned to the secondary bus
 	 * where N = number of APIDs supported by the primary bus and
 	 *       M = number of APIDs supported by the secondary bus
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
 	 */
+
 	apidd = &bus->apid_data[bus->base_apid];
 	apid_max = bus->base_apid + bus->apid_count;
 	for (i = bus->base_apid; i < apid_max; i++, apidd++) {
 		offset = pmic_arb->ver_ops->apid_map_offset(i);
 		if (offset >= pmic_arb->core_size)
 			break;
-
-		regval = readl_relaxed(pmic_arb->core + offset);
+		regval = readl_relaxed(ppid_base + offset);
 		if (!regval)
 			continue;
-		ppid = (regval >> 8) & PMIC_ARB_PPID_MASK;
-		is_irq_ee = PMIC_ARB_CHAN_IS_IRQ_OWNER(regval);
+		ppid = (regval >> ppid_shift) & ppid_mask;
+		is_irq_ee = regval & irq_owner_mask;
 
 		regval = readl_relaxed(pmic_arb->ver_ops->apid_owner(bus, i));
 		apidd->write_ee = SPMI_OWNERSHIP_PERIPH2OWNER(regval);
@@ -1237,6 +1270,12 @@ static int pmic_arb_read_apid_map_v5(struct spmi_pmic_arb_bus *bus)
 	return 0;
 }
 
+static int pmic_arb_read_apid_map_v5(struct spmi_pmic_arb_bus *bus)
+{
+	return _pmic_arb_read_apid_map(bus, bus->pmic_arb->core, PMIC_ARB_PPID_MASK,
+				       8, PMIC_ARB_CHAN_IS_IRQ_OWNER_MASK);
+}
+
 static int pmic_arb_ppid_to_apid_v5(struct spmi_pmic_arb_bus *bus, u16 ppid)
 {
 	if (!(bus->ppid_to_apid[ppid] & PMIC_ARB_APID_VALID))
@@ -1345,37 +1384,46 @@ static int pmic_arb_get_core_resources_v7(struct platform_device *pdev,
 	return pmic_arb_get_obsrvr_chnls_v2(pdev);
 }
 
-/*
- * Only v7 supports 2 buses. Each bus will get a different apid count, read
- * from different registers.
- */
-static int pmic_arb_init_apid_v7(struct spmi_pmic_arb_bus *bus, int index)
+static int _pmic_arb_init_apid_v7(struct spmi_pmic_arb_bus *bus, int index,
+				  int max_buses, unsigned long periph_mask)
 {
 	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
-	int ret;
+	int i;
 
-	if (index == 0) {
-		bus->base_apid = 0;
-		bus->apid_count = readl_relaxed(pmic_arb->core + PMIC_ARB_FEATURES) &
-						   PMIC_ARB_FEATURES_PERIPH_MASK;
-	} else if (index == 1) {
-		bus->base_apid = readl_relaxed(pmic_arb->core + PMIC_ARB_FEATURES) &
-						  PMIC_ARB_FEATURES_PERIPH_MASK;
-		bus->apid_count = readl_relaxed(pmic_arb->core + PMIC_ARB_FEATURES1) &
-						   PMIC_ARB_FEATURES_PERIPH_MASK;
-	} else {
-		dev_err(&bus->spmic->dev, "Unsupported buses count %d detected\n",
-			bus->id);
+	if (index < 0 || index >= max_buses) {
+		dev_err(&bus->spmic->dev, "Unsupported bus index %d detected\n",
+			index);
 		return -EINVAL;
 	}
 
-	if (bus->base_apid + bus->apid_count > pmic_arb->max_periphs) {
-		dev_err(&bus->spmic->dev, "Unsupported APID count %d detected\n",
+	bus->base_apid = 0;
+	bus->apid_count = 0;
+	for (i = 0; i <= index; i++) {
+		bus->base_apid += bus->apid_count;
+		bus->apid_count = readl_relaxed(pmic_arb->core +
+						PMIC_ARB_FEATURES + i * 4) &
+						periph_mask;
+	}
+
+	if (bus->apid_count == 0) {
+		dev_err(&bus->spmic->dev, "Bus %d not implemented\n", index);
+		return -EINVAL;
+	} else if (bus->base_apid + bus->apid_count > pmic_arb->max_periphs) {
+		dev_err(&bus->spmic->dev, "Unsupported max APID %d detected\n",
 			bus->base_apid + bus->apid_count);
 		return -EINVAL;
 	}
 
-	ret = pmic_arb_init_apid_min_max(bus);
+	return pmic_arb_init_apid_min_max(bus);
+}
+
+/*
+ * Arbiter v7 supports 2 buses. Each bus will get a different apid count, read
+ * from different registers.
+ */
+static int pmic_arb_init_apid_v7(struct spmi_pmic_arb_bus *bus, int index)
+{
+	int ret = _pmic_arb_init_apid_v7(bus, index, 2, PMIC_ARB_FEATURES_PERIPH_MASK);
 	if (ret)
 		return ret;
 
@@ -1424,6 +1472,102 @@ static int pmic_arb_offset_v7(struct spmi_pmic_arb_bus *bus, u8 sid, u16 addr,
 	return offset;
 }
 
+static int pmic_arb_get_core_resources_v8(struct platform_device *pdev,
+					  void __iomem *core)
+{
+	struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
+
+	pmic_arb->apid_map = devm_platform_ioremap_resource_byname(pdev, "chnl_map");
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
+	return _pmic_arb_read_apid_map(bus, bus->pmic_arb->apid_map,
+				       PMIC_ARB_V8_PPID_MASK, 0,
+				       PMIC_ARB_V8_CHAN_IS_IRQ_OWNER_MASK);
+}
+
+/*
+ * Arbiter v8 supports up to 4 buses. Each bus will get a different apid count, read
+ * from different registers.
+ */
+static int pmic_arb_init_apid_v8(struct spmi_pmic_arb_bus *bus, int index)
+{
+	int ret = _pmic_arb_init_apid_v7(bus, index, 4,
+					 PMIC_ARB_FEATURES_V8_PERIPH_MASK);
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
@@ -1490,6 +1634,14 @@ pmic_arb_acc_enable_v7(struct spmi_pmic_arb_bus *bus, u16 n)
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
@@ -1516,6 +1668,14 @@ pmic_arb_irq_status_v7(struct spmi_pmic_arb_bus *bus, u16 n)
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
@@ -1542,6 +1702,14 @@ pmic_arb_irq_clear_v7(struct spmi_pmic_arb_bus *bus, u16 n)
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
@@ -1557,6 +1725,12 @@ static u32 pmic_arb_apid_map_offset_v7(u16 n)
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
@@ -1564,7 +1738,7 @@ pmic_arb_apid_owner_v2(struct spmi_pmic_arb_bus *bus, u16 n)
 }
 
 /*
- * For arbiter version 7, APID ownership table registers have independent
+ * For arbiter version 7 and 8, APID ownership table registers have independent
  * numbering space for each SPMI bus instance, so each is indexed starting from
  * 0.
  */
@@ -1574,6 +1748,12 @@ pmic_arb_apid_owner_v7(struct spmi_pmic_arb_bus *bus, u16 n)
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
@@ -1654,6 +1834,23 @@ static const struct pmic_arb_ver_ops pmic_arb_v7 = {
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
@@ -1731,6 +1928,12 @@ static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
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
@@ -1825,8 +2028,10 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
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
@@ -1875,6 +2080,7 @@ static void spmi_pmic_arb_remove(struct platform_device *pdev)
 static const struct of_device_id spmi_pmic_arb_match_table[] = {
 	{ .compatible = "qcom,spmi-pmic-arb", },
 	{ .compatible = "qcom,x1e80100-spmi-pmic-arb", },
+	{ .compatible = "qcom,glymur-spmi-pmic-arb", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, spmi_pmic_arb_match_table);

-- 
2.25.1


