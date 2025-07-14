Return-Path: <linux-arm-msm+bounces-64753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBB3B0371A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 08:31:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C90951749BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 06:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91A3E22836C;
	Mon, 14 Jul 2025 06:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EydcAQoW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D493D226D03
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752474686; cv=none; b=tSNNq2ouA1+XLl7aTmk3keCbNSMyM3wqy6uA8FHsrS1flw3b6jppJ7fciiQDBoMFErUZp978ibTQDz9S9r8F9XQoxVQw37wBjOOldmpQ15MDZ5ZgaZkqTNf0irouazK+LaSsgIk+vcapwooZbPcv22/1hkzRaC9q5jq5tyZw1EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752474686; c=relaxed/simple;
	bh=WgNB8JtNu/qnxzLII17QZyIYVM1aQeVHuPJM2eBUR+g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o2yXw9QzScARkbbEYds3foyXCu09eG/kL78E40c6oCQQQ4BnbQi5WzyoA8aoleNYNEs6g6WB4liOCvQp2Ov/UzwRYCv6cukleAQAB/FEKddno12FLrX11CR/e2cQfEyiSOeFKAjHx1kP9Lz1cz/8Vs9QWqYec4UjbMpP7vnfzwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EydcAQoW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DMu3G7027809
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TlagnvE3DvQ
	Djl8NoW2g4NISDOA+5IeFliGdXmFMGmQ=; b=EydcAQoWsQEBxP6FdYgKjseL38I
	fxMHjTEaQ2QfOtVpm/IyxhqDcIc7M3kfeWf3o63w4PQMqOo01PDV4WgOjdkk4MZa
	wRHQCP7o+opE9Cb+C5F2N8huhmJ7Hr64aNO2aucATCjbFp5Ir2GyYlV2SSchm56w
	vgy/cC9NYtp+F3rvX2NY4AtzDGpLmxHkt//IQvlLDtB3x4bJ4v9pHnPJorQvMndr
	f5gVfftXQzhtZN6FhoUtyBKPmVlyXsop+Dlh/7b+gS0QusBlfnqH/I3wli+Exk6P
	Iofqsy74fdXKTl1HkeP0TzZoZaRjTjV5mVDc8pfCEuvThvgntr33iRhAkow==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug37ufdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:31:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23689228a7fso58330825ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 23:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752474682; x=1753079482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TlagnvE3DvQDjl8NoW2g4NISDOA+5IeFliGdXmFMGmQ=;
        b=X6An2bAA8Er4gcwrfq+s8AWxnTbO7tktFI2MXLPbnxQ6rVH8lOBCzI00RthKHpEqn6
         EFYooPv8IhHvs9rPISrbFzJaIUhJiiNPEEfwkQgUf6ZUuM5FjycmJuzhhvE2hl2J7V5G
         gTLnj0CoU/R4yi68EMDllPbZmkP9HK8uWOzQmLHwPOM1/gCSgK17NJkOBhdbhhhXxmR9
         ITxfEyPCc/rfr6T/GCyLp64cVWMNhx00pEEIkrsmznfqiacSXufSCy0AAMs1Y52PFPvu
         gIL6uJHkELBXT8RE/q+bLmNeTc+KJAKZerJotPzACK7RUAqSejIQuB1mjbEh/TNHaivN
         Jivw==
X-Forwarded-Encrypted: i=1; AJvYcCWYrlMT9yiKOhlaGJFw9u90f9XZjfrjHriBbFQqAPmKxSJS5tyX32dIywVNn+Kc2YE5aPgyr4FUgwCDgsOD@vger.kernel.org
X-Gm-Message-State: AOJu0YzvKo1iAkD71rk7zdMr+Mc9MyV7Ju7CwbuAiZHMXFGZJnGnt6e8
	gq1mnK2cmE1MaOUz4qH5cZc4yPfOFJx2qeBYWSxAx3JVXYSUpUgEiJ+QyLeKvKbrjZ53ZRyONpx
	UeRKrX1WqCBF0qUUZ0ncQJMupfQWG3zX1LE2VQ476ewscOZcU0Qo85LPFBHUZ725wQ0ua
X-Gm-Gg: ASbGncsI3ZkpSVXxGaDYt3XbLUXFPQRGi6G4JIOv+4JTw2YYiatdExilk+ZBXWzhbEl
	Gfe6td5U8H9SG/kpBlqiycXW9i/WPzwptnw5UuE4fLRewhrlMySi++rk8/RkdTRpB09Y6Op35G+
	50ebTnWO+V+0JlvJSlOX7DaShvcdnYiiF5/s1hl5Pa9GXxVd7eaDhYsuasjRm2y4fUnnNcyzpVs
	BnPQP+/edKekLmRVsTJ01midqfmflbLQl/hLyecl7VZwg67ccRJqAu8PWfqlGvIZ+hChtDmWPqE
	9g27jKXtYp/v3ocDeRadRe+6zuhODZaAspqjIeHvh7b7dw8EcOYUJHH2FCVdNKVO6UK8IZfTIzh
	NwWwCe8mWJrfvvUseSUPT
X-Received: by 2002:a17:903:1b63:b0:235:caa8:1a72 with SMTP id d9443c01a7336-23dede81dc8mr190362815ad.30.1752474682374;
        Sun, 13 Jul 2025 23:31:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbnMsrBl15IDIkz0WDEDjeP9KCLJo7QcXtqpG3cv+ngO9fyVjCXyOrc3bIj9AbDNVdOY9SoA==
X-Received: by 2002:a17:903:1b63:b0:235:caa8:1a72 with SMTP id d9443c01a7336-23dede81dc8mr190362215ad.30.1752474681967;
        Sun, 13 Jul 2025 23:31:21 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4334005sm86138255ad.158.2025.07.13.23.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 23:31:21 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Jie Gan <quic_jiegan@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 RESEND 01/10] coresight: core: Refactoring ctcu_get_active_port and make it generic
Date: Mon, 14 Jul 2025 14:31:00 +0800
Message-Id: <20250714063109.591-2-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAzNyBTYWx0ZWRfX7eibZmSirNOT
 alfSW1zInMjbads+eWz34+s/KcdK599YCQR6MnL9OYeXmXYADhvNXEWfivlnBau/squZtBN6Vmn
 E7fSP1LX+MmjJ7x8HfYuzqakQJpEL5F7ho0/T9ckKoPjnKmS2krZRZmj+EOzFFRCG5w2JyO9ukj
 7FSukILlIlgrNnNvIWLza9PX79700LPNmbtXnC9lCeEX3dU4IA6hbha4ORqstnT++okObzfHQXs
 VDvGgzKVuL7gjJ5iQgHOk3HQfFnSnASz74ApFauCLF46iC95p2Q3v7hK6u/2DeJaUaVF2m5sRVj
 VsLU1i6mE4dE5Wnc3FIuFu3f+i60/s5i1S3WiV1+Fzo0f+1po2cJVinC12ZudXy/CkchowK/Fq/
 V+cck5GNKlSPbsM9droiDDwH/rT1r778HA4G+zc8MHi1x28gGh1a2ZItno5gyQmLTrfMPTUt
X-Proofpoint-GUID: z4WwvZuQuqfZp0ADAn9F0x6_2DRrfhZI
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=6874a43b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=UMME_An3wchvczm7DuYA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: z4WwvZuQuqfZp0ADAn9F0x6_2DRrfhZI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140037

Remove ctcu_get_active_port from CTCU module and add it to the core
framework.

The port number is crucial for the CTCU device to identify which ETR
it serves. With the port number we can correctly get required parameters
of the CTCU device in TMC module.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c  | 24 +++++++++++++++++++
 .../hwtracing/coresight/coresight-ctcu-core.c | 19 +--------------
 drivers/hwtracing/coresight/coresight-priv.h  |  2 ++
 3 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 1accd7cbd54b..5297a5ff7921 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -580,6 +580,30 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_port_helper: get the in-port number of the helper device
+ * that is connected to the csdev.
+ *
+ * @csdev: csdev of the device that is connected to helper.
+ * @helper: csdev of the helper device.
+ *
+ * Return: port number upson success or -EINVAL for fail.
+ */
+int coresight_get_port_helper(struct coresight_device *csdev,
+			      struct coresight_device *helper)
+{
+	struct coresight_platform_data *pdata = helper->pdata;
+	int i;
+
+	for (i = 0; i < pdata->nr_inconns; ++i) {
+		if (pdata->in_conns[i]->src_dev == csdev)
+			return pdata->in_conns[i]->dest_port;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_port_helper);
+
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
 	if (!csdev->ea)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index c6bafc96db96..28ea4a216345 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -118,23 +118,6 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
 	return 0;
 }
 
-/*
- * Searching the sink device from helper's view in case there are multiple helper devices
- * connected to the sink device.
- */
-static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
-{
-	struct coresight_platform_data *pdata = helper->pdata;
-	int i;
-
-	for (i = 0; i < pdata->nr_inconns; ++i) {
-		if (pdata->in_conns[i]->src_dev == sink)
-			return pdata->in_conns[i]->dest_port;
-	}
-
-	return -EINVAL;
-}
-
 static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *path,
 				bool enable)
 {
@@ -147,7 +130,7 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 		return -EINVAL;
 	}
 
-	port_num = ctcu_get_active_port(sink, csdev);
+	port_num = coresight_get_port_helper(sink, csdev);
 	if (port_num < 0)
 		return -EINVAL;
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 33e22b1ba043..07a5f03de81d 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -156,6 +156,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_port_helper(struct coresight_device *csdev,
+			      struct coresight_device *helper);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);
-- 
2.34.1


