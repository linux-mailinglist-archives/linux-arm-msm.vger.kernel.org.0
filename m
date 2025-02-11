Return-Path: <linux-arm-msm+bounces-47514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E108EA30363
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 07:21:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24B60188A6D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 06:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F72F1E9B2A;
	Tue, 11 Feb 2025 06:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eigp1VWp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0733F1E9B22
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 06:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739254832; cv=none; b=kQK9zHEe8EOh1mcJKsBYwidXJAq3p+1LKk3rhmf51hfx7FcA1eOefE7kovllW9bvGt/01bC1fvNVUV0QEygExcez87AV7H2PSN80LwSSSJs/5NTSucJHh9nLJVwl36UVA+vTPAyE0ERlyjBCX4ywTblOr40EzNZAfTg5E0E5UHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739254832; c=relaxed/simple;
	bh=h0hJF4T3/oSEYNKk/aj1H9voaMafKE7snd34cEzv3xg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ib3Fu2N+aF7Pu7xStTqlezpRva1K8WTCHatDge2fAUtK1yVZVzT4pk1iq1KPhruI8hbHZSL/cQHOmojA+SFBpQKNT8kVN1U7Bn2O/6m3mrY/9DX7ch+Q23xgKvEJuCswQR2NZayXOX322k70GqDvB3K53RKreKUM5l81pZKSczM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eigp1VWp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AKKnGS017425
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 06:20:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PmfoLsnHoO6ugPoCT2FbLQfUxlVhokGzSc2
	sK0KEJls=; b=eigp1VWp5nVTf0KQP6yjFDkyyX5X5U06pT4TJeXqO5lv+B6HlpR
	uJfHxALBL9C7eR/WArTvQBXcPmQHPMswTtJQrBFJfQ8GXTyl675ZwCzI9fKqHj57
	wIO28zez1tv8OytZY+vmk0o1do9qARFop098Df2qFHwmmnEFpR+e4wYZV8QBxf3p
	xbKkxgziB+diQC4h14QZW2/NO/ry+Vy3XTG2p3YTRgeDdVKZR2/nRhebMrAbLMpx
	ht6PLEclxIPtb+4ZIgxh/V2zFK8IKfgM6wT+ryTFigx2sklbO263uzrflAl9oE+l
	4Asm2zIbyj+Jx9mZr+VLlf5757Hw4eeLTUw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0guxpr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 06:20:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-21f5060ef10so134209525ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 22:20:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739254827; x=1739859627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PmfoLsnHoO6ugPoCT2FbLQfUxlVhokGzSc2sK0KEJls=;
        b=CBOP+3VklvDKF5n8wA/UVUFLfu4OKCAUeIknfvY3P0MGmVyT673bR6QikeXlKn4zEw
         HorNc8b8SdVZmd3usGtlb9lCM13PvdCWZt78jEwIsC7pyfcqKVn69ASy2W6cR0h0y/0c
         FrMC052sP2rPYxTOSQy5uni0ViaO9WZf31MKvqpTG98xyEwEG3bRn3soGhjd1hO9ogon
         2/HCnpCtuvwHxqxc3lzOLZF+xwecUogLy+UunpCEkGzDFPoYKx/uDsPo2ztRGgzktvhy
         TwFfHGI4t8ckceXB3xGUXWlYYoZbHah2iW7NWYNNzgOpiKcPIuz1Ov+NFFfDao4PYsa2
         t8uQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdZ+mvbf6WpzLpRAXippRTjgF7+hHj+E+m1YqHoxj1LEeZw4F9VF1KE3ZSEqcnwHqnfIv5R8LuOMbqsjN/@vger.kernel.org
X-Gm-Message-State: AOJu0YyffJpIsVEojEeb2g4BNCD1q7mtg/H+72EEkmk51zaDoynWCLY7
	Ishh9e9lSUptadW6vUmKAFkvrEdosIupwA+BpBrCQQLgALrHF32JXN/NsRAyGGN2CEJ47F2R3TP
	h6Uepf6Q4+q+xNBxPRz6nLi5lpUy5gY9m2cmi+f/s8E/7llvEzjlSBTY8xhoJ9GA8
X-Gm-Gg: ASbGncuoSLkRoRUGitgVZwrwbxutmBB/4TfNY/f4+FHDK4dSgxm2wGZ3XctFRIaePHe
	iXZnr2IEXWQVEMcabDuSwdObfWTCQZTIoiOV50jnCwqnS6xCtb8d6qnc3KNlCMtMx6q7zE1FohB
	MhxTvKavDG/GOXsrIub5dCK3UGgqM8w4hsof5/JUr1RvwgzyKLY7Alfi/AhoBy2y42q7qbQUXp8
	UklPETeJG3ycO+fJ6nIXiP92r4F2qduMFNKWRj5bl4OSzKRGQSRFOS3xcEnBVglQxphOcT1KxhI
	ch9YDPC84d8A5LVl2NHpC7Jgn/CCyi4Y5ogBmhFbRVviYcj5rTO7EPK1MWKT
X-Received: by 2002:a17:902:c94a:b0:21f:8099:72d9 with SMTP id d9443c01a7336-21f8099743emr141631535ad.27.1739254827009;
        Mon, 10 Feb 2025 22:20:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8R2QdzknMDBUU94uiL8esTvNXjuwN7R3CfQRpNwhxgCNE7bLwMl3dtL8F/4NjvQMUdhd4iw==
X-Received: by 2002:a17:902:c94a:b0:21f:8099:72d9 with SMTP id d9443c01a7336-21f8099743emr141631165ad.27.1739254826545;
        Mon, 10 Feb 2025 22:20:26 -0800 (PST)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368cf7fcsm88738405ad.249.2025.02.10.22.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 22:20:25 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] Coresight: Improve the method for passing through perf handle
Date: Tue, 11 Feb 2025 14:20:21 +0800
Message-Id: <20250211062021.7013-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: K9KTVh3ik8TiSsYZ-p-Lq_YWLcejJf10
X-Proofpoint-GUID: K9KTVh3ik8TiSsYZ-p-Lq_YWLcejJf10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_02,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=858 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502110036

From: James Clark <james.clark@linaro.org>

Currently, the perf handle is being passed to the sink device as a void
parameter with additional type conversion. Improve the method for
passing perf handle parameter to make the code more readable.

Signed-off-by: James Clark <james.clark@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
prerequisite-message-id: <20250207064213.2314482-5-quic_jiegan@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-core.c    |  8 ++++----
 drivers/hwtracing/coresight/coresight-dummy.c   |  2 +-
 drivers/hwtracing/coresight/coresight-etb10.c   |  7 +++----
 drivers/hwtracing/coresight/coresight-priv.h    |  2 +-
 drivers/hwtracing/coresight/coresight-tmc-etf.c |  8 ++++----
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 11 +++++------
 drivers/hwtracing/coresight/coresight-tmc.h     |  2 +-
 drivers/hwtracing/coresight/coresight-tpiu.c    |  2 +-
 drivers/hwtracing/coresight/coresight-trbe.c    |  3 +--
 drivers/hwtracing/coresight/ultrasoc-smb.c      |  7 +++----
 include/linux/coresight.h                       |  2 +-
 11 files changed, 25 insertions(+), 29 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 3bdd6ebd4b6e..9246b46bdc3b 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -272,9 +272,9 @@ void coresight_add_helper(struct coresight_device *csdev,
 EXPORT_SYMBOL_GPL(coresight_add_helper);
 
 static int coresight_enable_sink(struct coresight_device *csdev,
-				 enum cs_mode mode, void *data)
+				 enum cs_mode mode, struct perf_output_handle *handle)
 {
-	return sink_ops(csdev)->enable(csdev, mode, data);
+	return sink_ops(csdev)->enable(csdev, mode, handle);
 }
 
 static void coresight_disable_sink(struct coresight_device *csdev)
@@ -448,7 +448,7 @@ static int coresight_enable_helpers(struct coresight_device *csdev,
 }
 
 int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
-			  void *sink_data)
+			  struct perf_output_handle *handle)
 {
 	int ret = 0;
 	u32 type;
@@ -478,7 +478,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 
 		switch (type) {
 		case CORESIGHT_DEV_TYPE_SINK:
-			ret = coresight_enable_sink(csdev, mode, sink_data);
+			ret = coresight_enable_sink(csdev, mode, handle);
 			/*
 			 * Sink is the first component turned on. If we
 			 * failed to enable the sink, there are no components
diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
index d9a811d44885..42de46949d73 100644
--- a/drivers/hwtracing/coresight/coresight-dummy.c
+++ b/drivers/hwtracing/coresight/coresight-dummy.c
@@ -51,7 +51,7 @@ static int dummy_source_trace_id(struct coresight_device *csdev, __maybe_unused
 }
 
 static int dummy_sink_enable(struct coresight_device *csdev, enum cs_mode mode,
-				void *data)
+				struct perf_output_handle *handle)
 {
 	dev_dbg(csdev->dev.parent, "Dummy sink enabled\n");
 
diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index aea9ac9c4bd0..e373b0f590bf 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -167,13 +167,12 @@ static int etb_enable_sysfs(struct coresight_device *csdev)
 	return ret;
 }
 
-static int etb_enable_perf(struct coresight_device *csdev, void *data)
+static int etb_enable_perf(struct coresight_device *csdev, struct perf_output_handle *handle)
 {
 	int ret = 0;
 	pid_t pid;
 	unsigned long flags;
 	struct etb_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct perf_output_handle *handle = data;
 	struct cs_buffers *buf = etm_perf_sink_config(handle);
 
 	spin_lock_irqsave(&drvdata->spinlock, flags);
@@ -224,7 +223,7 @@ static int etb_enable_perf(struct coresight_device *csdev, void *data)
 }
 
 static int etb_enable(struct coresight_device *csdev, enum cs_mode mode,
-		      void *data)
+		      struct perf_output_handle *handle)
 {
 	int ret;
 
@@ -233,7 +232,7 @@ static int etb_enable(struct coresight_device *csdev, enum cs_mode mode,
 		ret = etb_enable_sysfs(csdev);
 		break;
 	case CS_MODE_PERF:
-		ret = etb_enable_perf(csdev, data);
+		ret = etb_enable_perf(csdev, handle);
 		break;
 	default:
 		ret = -EINVAL;
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index c10dd3643854..eca06a89843f 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -134,7 +134,7 @@ static inline void CS_UNLOCK(void __iomem *addr)
 
 void coresight_disable_path(struct coresight_path *path);
 int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
-			  void *sink_data);
+			  struct perf_output_handle *handle);
 struct coresight_device *coresight_get_sink(struct coresight_path *path);
 struct coresight_device *coresight_get_sink_by_id(u32 id);
 struct coresight_device *
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index d4f641cd9de6..fdf1c2511d67 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -244,13 +244,13 @@ static int tmc_enable_etf_sink_sysfs(struct coresight_device *csdev)
 	return ret;
 }
 
-static int tmc_enable_etf_sink_perf(struct coresight_device *csdev, void *data)
+static int tmc_enable_etf_sink_perf(struct coresight_device *csdev,
+				    struct perf_output_handle *handle)
 {
 	int ret = 0;
 	pid_t pid;
 	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct perf_output_handle *handle = data;
 	struct cs_buffers *buf = etm_perf_sink_config(handle);
 
 	spin_lock_irqsave(&drvdata->spinlock, flags);
@@ -302,7 +302,7 @@ static int tmc_enable_etf_sink_perf(struct coresight_device *csdev, void *data)
 }
 
 static int tmc_enable_etf_sink(struct coresight_device *csdev,
-			       enum cs_mode mode, void *data)
+			       enum cs_mode mode, struct perf_output_handle *handle)
 {
 	int ret;
 
@@ -311,7 +311,7 @@ static int tmc_enable_etf_sink(struct coresight_device *csdev,
 		ret = tmc_enable_etf_sink_sysfs(csdev);
 		break;
 	case CS_MODE_PERF:
-		ret = tmc_enable_etf_sink_perf(csdev, data);
+		ret = tmc_enable_etf_sink_perf(csdev, handle);
 		break;
 	/* We shouldn't be here */
 	default:
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index a48bb85d0e7f..2d0bd06bab2a 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1252,9 +1252,8 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
 }
 
 struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
-				   enum cs_mode mode, void *data)
+				   enum cs_mode mode, struct perf_output_handle *handle)
 {
-	struct perf_output_handle *handle = data;
 	struct etr_perf_buffer *etr_perf;
 
 	switch (mode) {
@@ -1642,13 +1641,13 @@ tmc_update_etr_buffer(struct coresight_device *csdev,
 	return size;
 }
 
-static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
+static int tmc_enable_etr_sink_perf(struct coresight_device *csdev,
+				    struct perf_output_handle *handle)
 {
 	int rc = 0;
 	pid_t pid;
 	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct perf_output_handle *handle = data;
 	struct etr_perf_buffer *etr_perf = etm_perf_sink_config(handle);
 
 	spin_lock_irqsave(&drvdata->spinlock, flags);
@@ -1696,13 +1695,13 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
 }
 
 static int tmc_enable_etr_sink(struct coresight_device *csdev,
-			       enum cs_mode mode, void *data)
+			       enum cs_mode mode, struct perf_output_handle *handle)
 {
 	switch (mode) {
 	case CS_MODE_SYSFS:
 		return tmc_enable_etr_sink_sysfs(csdev);
 	case CS_MODE_PERF:
-		return tmc_enable_etr_sink_perf(csdev, data);
+		return tmc_enable_etr_sink_perf(csdev, handle);
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 2671926be62a..e991afd43742 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -336,7 +336,7 @@ struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);
 struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
-				   enum cs_mode mode, void *data);
+				   enum cs_mode mode, struct perf_output_handle *handle);
 extern const struct attribute_group coresight_etr_group;
 
 #endif
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index 97ef36f03ec2..ccf463ac7bf5 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -75,7 +75,7 @@ static void tpiu_enable_hw(struct csdev_access *csa)
 }
 
 static int tpiu_enable(struct coresight_device *csdev, enum cs_mode mode,
-		       void *__unused)
+		       struct perf_output_handle *__unused)
 {
 	struct tpiu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index fff67aac8418..a0914d10ed47 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1011,11 +1011,10 @@ static int __arm_trbe_enable(struct trbe_buf *buf,
 }
 
 static int arm_trbe_enable(struct coresight_device *csdev, enum cs_mode mode,
-			   void *data)
+			   struct perf_output_handle *handle)
 {
 	struct trbe_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
-	struct perf_output_handle *handle = data;
 	struct trbe_buf *buf = etm_perf_sink_config(handle);
 
 	WARN_ON(cpudata->cpu != smp_processor_id());
diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.c b/drivers/hwtracing/coresight/ultrasoc-smb.c
index dc3c9504dd7c..1574b5067206 100644
--- a/drivers/hwtracing/coresight/ultrasoc-smb.c
+++ b/drivers/hwtracing/coresight/ultrasoc-smb.c
@@ -213,10 +213,9 @@ static void smb_enable_sysfs(struct coresight_device *csdev)
 	coresight_set_mode(csdev, CS_MODE_SYSFS);
 }
 
-static int smb_enable_perf(struct coresight_device *csdev, void *data)
+static int smb_enable_perf(struct coresight_device *csdev, struct perf_output_handle *handle)
 {
 	struct smb_drv_data *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct perf_output_handle *handle = data;
 	struct cs_buffers *buf = etm_perf_sink_config(handle);
 	pid_t pid;
 
@@ -240,7 +239,7 @@ static int smb_enable_perf(struct coresight_device *csdev, void *data)
 }
 
 static int smb_enable(struct coresight_device *csdev, enum cs_mode mode,
-		      void *data)
+		      struct perf_output_handle *handle)
 {
 	struct smb_drv_data *drvdata = dev_get_drvdata(csdev->dev.parent);
 	int ret = 0;
@@ -261,7 +260,7 @@ static int smb_enable(struct coresight_device *csdev, enum cs_mode mode,
 		smb_enable_sysfs(csdev);
 		break;
 	case CS_MODE_PERF:
-		ret = smb_enable_perf(csdev, data);
+		ret = smb_enable_perf(csdev, handle);
 		break;
 	default:
 		ret = -EINVAL;
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 55bb825d509e..937a8d4f815b 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -363,7 +363,7 @@ enum cs_mode {
  */
 struct coresight_ops_sink {
 	int (*enable)(struct coresight_device *csdev, enum cs_mode mode,
-		      void *data);
+		      struct perf_output_handle *handle);
 	int (*disable)(struct coresight_device *csdev);
 	void *(*alloc_buffer)(struct coresight_device *csdev,
 			      struct perf_event *event, void **pages,
-- 
2.34.1


