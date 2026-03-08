Return-Path: <linux-arm-msm+bounces-96096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGw9DFwIrmkN/AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 00:38:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 869D6232BBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 00:38:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21C6C303983F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 23:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91911DFE22;
	Sun,  8 Mar 2026 23:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XkfLzJxs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="khw8r5U8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABA5359A9B
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Mar 2026 23:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773013030; cv=none; b=bSQlEAlE/uxmpCsQ4TWiMo5QVRiEkMYtSb4RAcPFkXrzbT/P0CR89DjN0iC4i5rrNkQ+GyWaSf5dEx0F+PO74VoQeJ0TxHOMiRjiWRAzn51yVx62MwjcI/tzmFndoq7fG9UJ/IfEIjKaviQ5+PgArMnSZ2ggQw+H49rcLD4lK5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773013030; c=relaxed/simple;
	bh=NeFNgY/1CISlZqb5qAwIsbmw/PwVcvAWH5UWqp9FXVQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f/Wg9HYmJ6FRxsfPnGmi2CuRMAa/y1itd4NfuIqDJx4t8h3jh7AP5j1aGFlaSHVbRRHTSwFWhzB0BcGYbIROveLFqttzavqUazC6aCVzSQpeezP5ieQCXRMQRDcqvGnykBmkaM+Hne9yFt0ZJQif7NIXRi3Etm0l94L38ose/F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XkfLzJxs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=khw8r5U8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628IwrWL2611534
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Mar 2026 23:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KeBlbGD06U4
	T94u6N4uQjVh9W8cLtIdvmvHffe79Fg4=; b=XkfLzJxsLaehZYLG6EaCqJnDp1B
	lP9TYC2o5KmjtklOtpGnq6k5Mf0uru0XoF0Tmq8zZI6F+vP7flmNzLfRktUd/56A
	rR9tXj3mBwN1n1kErTDavKCBr5V4Z0dhOx1cz3V/6YZuq8gBO9kzWGVcvn+CVdqT
	ENNg4z/B0sJ/ngAwlqIJjwiWheqwdC3xAr1R0w+a4eBwMNo15CXIP11bdx1uBRY/
	5/5lEjB4JpQnfsIGRMq0CiDpcnwnuWHDhLpslSxlRqQU3dF5qlTwWYyTO0NMs3uP
	ePUrElKYBp0iga4RiOoyPziIDYTUXeK8Dd2kGERK5dNrvkEW76X6cBwByxQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc83b949-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 23:37:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae4af66f40so82340885ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 16:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773013026; x=1773617826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KeBlbGD06U4T94u6N4uQjVh9W8cLtIdvmvHffe79Fg4=;
        b=khw8r5U8StKUd74BQ3HycjS9s0/XfiV8OVZmX3ofxHn3DHQOIieZPWKBDl/E0OFDSi
         iAzHUfOh8tgQlreS73mLQjv0K1WFtEZG8xpKLe1WHLBBVy3qGbmLNTACbDZOqawS5+Zh
         nkmk8mf8sa+s3fzPqIDpRsWHXx8Lcb8OrmIwrI6DQFgsA2oUEY72RpLIE4GaWPZJha52
         biFfMxpKLUj80PA21pi+rlTo7yLweGLkzm/5KOwyW51cSdB3oIaYnIieoltYp8fJPkZh
         njO8tnOcvCxBez2H2cCzzpUi/LxwDawfI5zcoO+Ti7luXz/kPgWkhHHIKfUzi+Lc/qgv
         Rp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773013026; x=1773617826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KeBlbGD06U4T94u6N4uQjVh9W8cLtIdvmvHffe79Fg4=;
        b=BVaxWVvfQB65ibRP3J4g+kWhPKep8x3caYwMECzwBuP8jKFzsnrp4mKfeIYG2Svcey
         T/hQXkmcH9n7QIh8dhvBZMY1eUsqT6UUamitG8D77q5W4x8AdrVDsQ8164oFkqdZqQ8G
         MTLwRRpWCAqcRUjoMNdSYe20rwvVFdCeGazVFbOyWobGapE60e2VuWOoG2cW2koVjHF6
         LOww3RkjFeoICwMxM/tLsMKmAmYj3UHmGI5usfCwl4mAs1EMjdAuLRwwMnomM5yUh35Y
         FPyYlKnqS4cGyUQr5wJvPFHfg1Zq4TLMZcQdPCrASYDKZ7yamwV4CaqWg7w3vKyt6+ca
         hlrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWenwB94tIH3gC34+bsnew2ssSy4mgJU60XP9XdeBCLE3c5Ys5iwVjYsM/KaV2DaA24m2uLtgO3VyjvOKhg@vger.kernel.org
X-Gm-Message-State: AOJu0YwfayBXlls2tFTnCuhxDrz9AIsknuH1DDb9nzu5I1QzOYk1l89R
	xeTRi0NwWa5toiydOkAj42ZXAd/HBHUk5mViSKkdqaO77FzR8xrPxvnbFvpScE8qSsSOwlpt3eL
	cMRdJtv0i42N5kSBZoX9yDvcmqjoimoyvkuZsW8wWXeNjsnoiVXnidEHL4w5dC8z3NFOr
X-Gm-Gg: ATEYQzxGdjn1jYAsWagz84GC/122I0ZK3eiXvsVT5vbJDqhRHYA79ZeLf+PI+wKLiTW
	294F4otuNLt1/Rn3ive8SQFLMcDPvWah0eBh8mUF5KnD64CdJcyEvFMLR2FrTQntokvX3S+Xv+E
	SkMhIuxpr1P/Tz2N4Q2jmlPohAIh4PoTuheQgLdv9jzo2Cwpn25Sl2Ncr/y4EWO9Ux4Hl1mVBVF
	+8g/BbmshVqNswFB57WvqgKwjRutYue7mERpgC18bB7ID1SqB0t4SDjesfhnOpuKufqsuZ3hu8c
	bau5/Z2wro2jwZoyvwxaOhZ8LknjFtbbsXG4ktbSltXS60znG9iZA6DyCZBqmWldnEz/Cpd/hGw
	WzuUib67qdOIXGdwr01h1lQxmTx5ROFzzQ2L05duW1X6VNpjK93suuM/udYicwQbX8VZn87+I9T
	ZJ6q/Othtn+4efsk0DoMxTAftj41UDtVWlyvhC
X-Received: by 2002:a17:902:ec87:b0:2ae:5a70:4786 with SMTP id d9443c01a7336-2ae823a958fmr93968565ad.25.1773013026066;
        Sun, 08 Mar 2026 16:37:06 -0700 (PDT)
X-Received: by 2002:a17:902:ec87:b0:2ae:5a70:4786 with SMTP id d9443c01a7336-2ae823a958fmr93968335ad.25.1773013025523;
        Sun, 08 Mar 2026 16:37:05 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e9ad26sm114274845ad.28.2026.03.08.16.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 16:37:04 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        ilpo.jarvinen@linux.intel.com, hansg@kernel.org
Cc: conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>
Subject: [PATCH V3 2/5] platform: arm64: Add driver for EC found on Qualcomm reference devices
Date: Mon,  9 Mar 2026 05:06:43 +0530
Message-Id: <20260308233646.2318676-3-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
References: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=R9UO2NRX c=1 sm=1 tr=0 ts=69ae0823 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=E2FcRaxJAAAA:8 a=689zGLOwWasileE73dUA:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=Yev8HTsh1NrKSfoOyGCL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDIxOCBTYWx0ZWRfXxrjBfVD7Tast
 LoTRXOIGTidvslpsEntcphGhEnck45IenCPu8VfgwvJTp79qXFAmkvsiyZTPZZLNmcVllmrgS6V
 ArQrmfhxpWqIsXiSlm8SMccxsBs9Iv3cG6ulB2s7YITPhjvdOieH0pxzEvBJ3nzVqsTx3SRdyQs
 cxyLaKf2Lz266xGBBgMZphZOMCnFazlYRP+612N6uHRMIRVsBglA+iXS7WfXga8Ovbs5BccOo+O
 knayBL4Vxjib+Trcp2q+9xCYjhtqDAJKrTYZeorlmZpOONhC64hYebXsqmVObpBuj4CRFSRCYBD
 mo4GdcfeHSxP8u+mC28uFy2a+OAnZFkk3Bb3D9EyegiPHbvDNW+GEotCki3mp16TUJk8d870AFS
 gAXs8b0mz7bSB513IWCPGXL1qyZhGW07Py1nn2OHjk6OQfYXEaDFtXPY3H1KydKhfXmOlJ17uW9
 GyU2BYAUoxdS+I6L5OQ==
X-Proofpoint-ORIG-GUID: z0W6qqC_zKLpSD49v1nQXfXn2VEm0PgA
X-Proofpoint-GUID: z0W6qqC_zKLpSD49v1nQXfXn2VEm0PgA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_07,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080218
X-Rspamd-Queue-Id: 869D6232BBE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-96096-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,quantenna.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
reference boards. It handles fan control, temperature sensors, access
to EC state changes and supports reporting suspend entry/exit to the
EC.

Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 MAINTAINERS                            |   7 +
 drivers/platform/arm64/Kconfig         |  12 +
 drivers/platform/arm64/Makefile        |   1 +
 drivers/platform/arm64/qcom-hamoa-ec.c | 462 +++++++++++++++++++++++++
 4 files changed, 482 insertions(+)
 create mode 100644 drivers/platform/arm64/qcom-hamoa-ec.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 2882a67bdf6d..dc72093375ed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21932,6 +21932,13 @@ S:	Supported
 W:	https://wireless.wiki.kernel.org/en/users/Drivers/wcn36xx
 F:	drivers/net/wireless/ath/wcn36xx/
 
+QUALCOMM HAMOA EMBEDDED CONTROLLER DRIVER
+M:	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
+F:	drivers/platform/arm64/qcom-hamoa-ec.c
+
 QUANTENNA QTNFMAC WIRELESS DRIVER
 M:	Igor Mitsyanko <imitsyanko@quantenna.com>
 R:	Sergey Matyukevich <geomatsi@gmail.com>
diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
index 10f905d7d6bf..025cdf091f9e 100644
--- a/drivers/platform/arm64/Kconfig
+++ b/drivers/platform/arm64/Kconfig
@@ -90,4 +90,16 @@ config EC_LENOVO_THINKPAD_T14S
 
 	  Say M or Y here to include this support.
 
+config EC_QCOM_HAMOA
+	tristate "Embedded Controller driver for Qualcomm Hamoa/Glymur reference devices"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on I2C
+	help
+	  Say M or Y here to enable the Embedded Controller driver for Qualcomm
+	  Snapdragon-based Hamoa/Glymur reference devices. The driver handles fan
+	  control, temperature sensors, access to EC state changes and supports
+	  reporting suspend entry/exit to the EC.
+
+	  This driver currently supports Hamoa/Purwa/Glymur reference devices.
+
 endif # ARM64_PLATFORM_DEVICES
diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
index 60c131cff6a1..7681be4a46e9 100644
--- a/drivers/platform/arm64/Makefile
+++ b/drivers/platform/arm64/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
 obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
 obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
 obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) += lenovo-thinkpad-t14s.o
+obj-$(CONFIG_EC_QCOM_HAMOA) += qcom-hamoa-ec.o
diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
new file mode 100644
index 000000000000..83aa869fad8f
--- /dev/null
+++ b/drivers/platform/arm64/qcom-hamoa-ec.c
@@ -0,0 +1,462 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Maya Matuszczyk <maccraft123mc@gmail.com>
+ * Copyright (c) 2026, Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pm.h>
+#include <linux/thermal.h>
+
+#define EC_SCI_EVT_READ_CMD	0x05
+#define EC_FW_VERSION_CMD	0x0e
+#define EC_MODERN_STANDBY_CMD	0x23
+#define EC_FAN_DBG_CONTROL_CMD	0x30
+#define EC_SCI_EVT_CONTROL_CMD	0x35
+#define EC_THERMAL_CAP_CMD	0x42
+
+#define EC_FW_VERSION_RESP_LEN	4
+#define EC_THERMAL_CAP_RESP_LEN	3
+#define EC_FAN_DEBUG_CMD_LEN	6
+#define EC_FAN_SPEED_DATA_SIZE	4
+
+#define EC_MODERN_STANDBY_ENTER	0x01
+#define EC_MODERN_STANDBY_EXIT	0x00
+
+#define EC_FAN_DEBUG_MODE_ON    BIT(0)
+#define EC_FAN_ON               BIT(1)
+#define EC_FAN_DEBUG_TYPE_PWM   BIT(2)
+#define EC_MAX_FAN_CNT		2
+#define EC_FAN_NAME_SIZE	20
+#define EC_FAN_MAX_PWM		255
+
+enum qcom_ec_sci_events {
+	EC_FAN1_STATUS_CHANGE_EVT = 0x30,
+	EC_FAN2_STATUS_CHANGE_EVT,
+	EC_FAN1_SPEED_CHANGE_EVT,
+	EC_FAN2_SPEED_CHANGE_EVT,
+	EC_NEW_LUT_SET_EVT,
+	EC_FAN_PROFILE_SWITCH_EVT,
+	EC_THERMISTOR_1_THRESHOLD_CROSS_EVT,
+	EC_THERMISTOR_2_THRESHOLD_CROSS_EVT,
+	EC_THERMISTOR_3_THRESHOLD_CROSS_EVT,
+	/* Reserved: 0x39 - 0x3c/0x3f */
+	EC_RECOVERED_FROM_RESET_EVT = 0x3d,
+};
+
+struct qcom_ec_version {
+	u8 main_version;
+	u8 sub_version;
+	u8 test_version;
+};
+
+struct qcom_ec_thermal_cap {
+#define EC_THERMAL_FAN_CNT(x)		(FIELD_GET(GENMASK(1, 0), (x)))
+#define EC_THERMAL_FAN_TYPE(x)		(FIELD_GET(GENMASK(4, 2), (x)))
+#define EC_THERMAL_THERMISTOR_MASK(x)	(FIELD_GET(GENMASK(7, 0), (x)))
+	u8 fan_cnt;
+	u8 fan_type;
+	u8 thermistor_mask;
+};
+
+struct qcom_ec_cooling_dev {
+	struct thermal_cooling_device *cdev;
+	struct device *parent_dev;
+	u8 fan_id;
+	u8 state;
+};
+
+struct qcom_ec {
+	struct qcom_ec_cooling_dev *ec_cdev;
+	struct qcom_ec_thermal_cap thermal_cap;
+	struct qcom_ec_version version;
+	struct i2c_client *client;
+	/* EC bus transaction lock */
+	struct mutex lock;
+};
+
+static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
+{
+	int ret;
+
+	mutex_lock(&ec->lock);
+	ret = i2c_smbus_read_i2c_block_data(ec->client, cmd, resp_len, resp);
+	mutex_unlock(&ec->lock);
+	if (ret < 0)
+		return ret;
+	else if (ret == 0 || ret == 0xff)
+		return -EOPNOTSUPP;
+
+	if (resp[0] >= resp_len)
+		return -EINVAL;
+
+	return 0;
+}
+
+/*
+ * EC Device Firmware Version:
+ *
+ * Read Response:
+ * ----------------------------------------------------------------------
+ * | Offset	| Name		| Description				|
+ * ----------------------------------------------------------------------
+ * | 0x00	| Byte count	| Number of bytes in response		|
+ * |		|		| (exluding byte count)			|
+ * ----------------------------------------------------------------------
+ * | 0x01	| Test-version	| Test-version of EC firmware		|
+ * ----------------------------------------------------------------------
+ * | 0x02	| Sub-version	| Sub-version of EC firmware		|
+ * ----------------------------------------------------------------------
+ * | 0x03	| Main-version	| Main-version of EC firmware		|
+ * ----------------------------------------------------------------------
+ *
+ */
+static int qcom_ec_read_fw_version(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct qcom_ec *ec = i2c_get_clientdata(client);
+	struct qcom_ec_version *version = &ec->version;
+	u8 resp[EC_FW_VERSION_RESP_LEN];
+	int ret;
+
+	ret = qcom_ec_read(ec, EC_FW_VERSION_CMD, EC_FW_VERSION_RESP_LEN, resp);
+	if (ret < 0)
+		return ret;
+
+	version->main_version = resp[3];
+	version->sub_version = resp[2];
+	version->test_version = resp[1];
+
+	dev_dbg(dev, "EC Version %d.%d.%d\n",
+		version->main_version, version->sub_version, version->test_version);
+
+	return 0;
+}
+
+/*
+ * EC Device Thermal Capabilities:
+ *
+ * Read Response:
+ * ----------------------------------------------------------------------
+ * | Offset	| Name		| Description				|
+ * ----------------------------------------------------------------------
+ * | 0x00	| Byte count	| Number of bytes in response		|
+ * |		|		| (exluding byte count)			|
+ * ----------------------------------------------------------------------
+ * | 0x02 (LSB)	| EC Thermal	| Bit 0-1: Number of fans		|
+ * | 0x3	| Capabilities	| Bit 2-4: Type of fan			|
+ * |		|		| Bit 5-6: Reserved			|
+ * |		|		| Bit 7: Data Valid/Invalid		|
+ * |		|		|	 (Valid - 1, Invalid - 0)
+ * |		|		| Bit 8-15: Thermistor 0 - 7 presence	|
+ * |		|		|	    (0 present, 1 absent)	|
+ * ----------------------------------------------------------------------
+ *
+ */
+static int qcom_ec_thermal_capabilities(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct qcom_ec *ec = i2c_get_clientdata(client);
+	struct qcom_ec_thermal_cap *cap = &ec->thermal_cap;
+	u8 resp[EC_THERMAL_CAP_RESP_LEN];
+	int ret;
+
+	ret = qcom_ec_read(ec, EC_THERMAL_CAP_CMD, EC_THERMAL_CAP_RESP_LEN, resp);
+	if (ret < 0)
+		return ret;
+
+	cap->fan_cnt = max(EC_MAX_FAN_CNT, EC_THERMAL_FAN_CNT(resp[1]));
+	cap->fan_type = EC_THERMAL_FAN_TYPE(resp[1]);
+	cap->thermistor_mask = EC_THERMAL_THERMISTOR_MASK(resp[2]);
+
+	dev_dbg(dev, "Fan count: %d Fan Type: %d Thermistor Mask: %d\n",
+		cap->fan_cnt, cap->fan_type, cap->thermistor_mask);
+
+	return 0;
+}
+
+static irqreturn_t qcom_ec_irq(int irq, void *data)
+{
+	struct qcom_ec *ec = data;
+	struct device *dev = &ec->client->dev;
+	int val;
+
+	mutex_lock(&ec->lock);
+	val = i2c_smbus_read_byte_data(ec->client, EC_SCI_EVT_READ_CMD);
+	mutex_unlock(&ec->lock);
+	if (val < 0) {
+		dev_err(dev, "Failed to read EC SCI Event: %d\n", val);
+		return IRQ_HANDLED;
+	}
+
+	switch (val) {
+	case EC_FAN1_STATUS_CHANGE_EVT:
+		dev_dbg(dev, "Fan1 status changed\n");
+		break;
+	case EC_FAN2_STATUS_CHANGE_EVT:
+		dev_dbg(dev, "Fan2 status changed\n");
+		break;
+	case EC_FAN1_SPEED_CHANGE_EVT:
+		dev_dbg(dev, "Fan1 speed crossed low/high trip point\n");
+		break;
+	case EC_FAN2_SPEED_CHANGE_EVT:
+		dev_dbg(dev, "Fan2 speed crossed low/high trip point\n");
+		break;
+	case EC_NEW_LUT_SET_EVT:
+		dev_dbg(dev, "New LUT set\n");
+		break;
+	case EC_FAN_PROFILE_SWITCH_EVT:
+		dev_dbg(dev, "FAN Profile switched\n");
+		break;
+	case EC_THERMISTOR_1_THRESHOLD_CROSS_EVT:
+		dev_dbg(dev, "Thermistor 1 threshold crossed\n");
+		break;
+	case EC_THERMISTOR_2_THRESHOLD_CROSS_EVT:
+		dev_dbg(dev, "Thermistor 2 threshold crossed\n");
+		break;
+	case EC_THERMISTOR_3_THRESHOLD_CROSS_EVT:
+		dev_dbg(dev, "Thermistor 3 threshold crossed\n");
+		break;
+	case EC_RECOVERED_FROM_RESET_EVT:
+		dev_dbg(dev, "EC recovered from reset\n");
+		break;
+	default:
+		dev_dbg(dev, "Unknown EC event: %d\n", val);
+		break;
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int qcom_ec_sci_evt_control(struct device *dev, bool enable)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct qcom_ec *ec = i2c_get_clientdata(client);
+	u8 control = enable ? 1 : 0;
+	int ret;
+
+	mutex_lock(&ec->lock);
+	ret = i2c_smbus_write_byte_data(client, EC_SCI_EVT_CONTROL_CMD, control);
+	mutex_unlock(&ec->lock);
+
+	return ret;
+}
+
+static int qcom_ec_fan_get_max_state(struct thermal_cooling_device *cdev, unsigned long *state)
+{
+	*state = EC_FAN_MAX_PWM;
+
+	return 0;
+}
+
+static int qcom_ec_fan_get_cur_state(struct thermal_cooling_device *cdev, unsigned long *state)
+{
+	struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
+
+	*state = ec_cdev->state;
+
+	return 0;
+}
+
+/*
+ * Fan Debug control command:
+ *
+ * Command Payload:
+ * ------------------------------------------------------------------------------
+ * | Offset	| Name		| Description					|
+ * ------------------------------------------------------------------------------
+ * | 0x00	| Command	| Fan control command				|
+ * ------------------------------------------------------------------------------
+ * | 0x01	| Fan ID	| 0x1 : Fan 1					|
+ * |		|		| 0x2 : Fan 2					|
+ * ------------------------------------------------------------------------------
+ * | 0x02	| Byte count = 4| Size of data to set fan speed			|
+ * ------------------------------------------------------------------------------
+ * | 0x03	| Mode		| Bit 0: Debug Mode On/Off (0 - OFF, 1 - ON )	|
+ * |		|		| Bit 1: Fan On/Off (0 - Off, 1 - ON)		|
+ * |		|		| Bit 2: Debug Type (0 - RPM, 1 - PWM)		|
+ * ------------------------------------------------------------------------------
+ * | 0x04 (LSB)	| Speed in RPM	| RPM value, if mode selected is RPM		|
+ * | 0x05	|		|						|
+ * ------------------------------------------------------------------------------
+ * | 0x06	| Speed in PWM	| PWM value, if mode selected is PWM (0 - 255)	|
+ * ______________________________________________________________________________
+ *
+ */
+static int qcom_ec_fan_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
+{
+	struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
+	struct device *dev = ec_cdev->parent_dev;
+	struct i2c_client *client = to_i2c_client(dev);
+
+	u8 request[6] = { ec_cdev->fan_id, EC_FAN_SPEED_DATA_SIZE,
+			  EC_FAN_DEBUG_MODE_ON | EC_FAN_ON | EC_FAN_DEBUG_TYPE_PWM,
+			  0, 0, state };
+	int ret;
+
+	ret = i2c_smbus_write_i2c_block_data(client, EC_FAN_DBG_CONTROL_CMD,
+					     sizeof(request), request);
+	if (ret) {
+		dev_err(dev, "Failed to set fan pwm: %d\n", ret);
+		return ret;
+	}
+
+	ec_cdev->state = state;
+
+	return 0;
+}
+
+static const struct thermal_cooling_device_ops qcom_ec_thermal_ops = {
+	.get_max_state = qcom_ec_fan_get_max_state,
+	.get_cur_state = qcom_ec_fan_get_cur_state,
+	.set_cur_state = qcom_ec_fan_set_cur_state,
+};
+
+static int qcom_ec_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct qcom_ec *ec = i2c_get_clientdata(client);
+	int ret;
+
+	mutex_lock(&ec->lock);
+	ret = i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD, EC_MODERN_STANDBY_ENTER);
+	mutex_unlock(&ec->lock);
+
+	return ret;
+}
+
+static int qcom_ec_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct qcom_ec *ec = i2c_get_clientdata(client);
+	int ret;
+
+	mutex_lock(&ec->lock);
+	ret = i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD, EC_MODERN_STANDBY_EXIT);
+	mutex_unlock(&ec->lock);
+
+	return ret;
+}
+
+static int qcom_ec_probe(struct i2c_client *client)
+{
+	struct qcom_ec_cooling_dev *cdev;
+	struct device *dev = &client->dev;
+	struct qcom_ec *ec;
+	int ret, i;
+
+	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
+	if (!ec)
+		return -ENOMEM;
+
+	mutex_init(&ec->lock);
+	ec->client = client;
+
+	ret = devm_request_threaded_irq(dev, client->irq, NULL, qcom_ec_irq,
+					IRQF_ONESHOT, "qcom_ec", ec);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to get irq\n");
+
+	i2c_set_clientdata(client, ec);
+
+	ret = qcom_ec_read_fw_version(dev);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to read ec firmware version\n");
+
+	ret = qcom_ec_thermal_capabilities(dev);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to read thermal capabilities\n");
+
+	ret = qcom_ec_sci_evt_control(dev, true);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to enable SCI events\n");
+
+	ec->ec_cdev = devm_kcalloc(dev, ec->thermal_cap.fan_cnt, sizeof(*ec->ec_cdev), GFP_KERNEL);
+	if (!ec->ec_cdev)
+		return -ENOMEM;
+
+	for (i = 0; i < ec->thermal_cap.fan_cnt; i++) {
+		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
+		char name[EC_FAN_NAME_SIZE];
+
+		snprintf(name, EC_FAN_NAME_SIZE, "qcom_ec_fan_%d", i);
+		ec_cdev->fan_id = i + 1;
+		ec_cdev->parent_dev = dev;
+
+		ec_cdev->cdev = thermal_cooling_device_register(name, ec_cdev,
+								&qcom_ec_thermal_ops);
+		if (IS_ERR(ec_cdev->cdev)) {
+			dev_err_probe(dev, PTR_ERR(cdev),
+				      "Thermal cooling device registration failed\n");
+			ret = -EINVAL;
+			goto unroll_cooling_dev;
+		}
+	}
+
+	return 0;
+
+unroll_cooling_dev:
+	for (i--; i >= 0; i--) {
+		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
+
+		if (ec_cdev->cdev) {
+			thermal_cooling_device_unregister(ec_cdev->cdev);
+			ec_cdev->cdev = NULL;
+		}
+	}
+
+	return ret;
+}
+
+static void qcom_ec_remove(struct i2c_client *client)
+{
+	struct qcom_ec *ec = i2c_get_clientdata(client);
+	struct device *dev = &client->dev;
+	int ret;
+
+	ret = qcom_ec_sci_evt_control(dev, false);
+	if (ret < 0)
+		dev_err(dev, "Failed to disable SCI events: %d\n", ret);
+
+	for (int i = 0; i < ec->thermal_cap.fan_cnt; i++) {
+		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
+
+		if (ec_cdev->cdev) {
+			thermal_cooling_device_unregister(ec_cdev->cdev);
+			ec_cdev->cdev = NULL;
+		}
+	}
+}
+
+static const struct of_device_id qcom_ec_of_match[] = {
+	{ .compatible = "qcom,hamoa-ec" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, qcom_ec_of_match);
+
+static const struct i2c_device_id qcom_ec_i2c_id_table[] = {
+	{ "qcom-hamoa-ec", },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, qcom_ec_i2c_id_table);
+
+static DEFINE_SIMPLE_DEV_PM_OPS(qcom_ec_pm_ops,
+		qcom_ec_suspend,
+		qcom_ec_resume);
+
+static struct i2c_driver qcom_ec_i2c_driver = {
+	.driver = {
+		.name = "qcom-hamoa-ec",
+		.of_match_table = qcom_ec_of_match,
+		.pm = &qcom_ec_pm_ops
+	},
+	.probe = qcom_ec_probe,
+	.remove = qcom_ec_remove,
+	.id_table = qcom_ec_i2c_id_table,
+};
+module_i2c_driver(qcom_ec_i2c_driver);
+
+MODULE_DESCRIPTION("QCOM Hamoa Embedded Controller");
+MODULE_LICENSE("GPL");
-- 
2.34.1


