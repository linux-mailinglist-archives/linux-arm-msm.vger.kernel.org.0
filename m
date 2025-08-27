Return-Path: <linux-arm-msm+bounces-71004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D47C7B38063
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 12:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B8D97C015D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 10:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4577434AAFC;
	Wed, 27 Aug 2025 10:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k/fQwBny"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46BA34F463
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 10:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756292161; cv=none; b=lLCiWts9UH9V2eg+CgYVb1yb85aix87bymr8Zk0TUluQ6S4Zek48cu/EFd0nTkNXzwKSXnvjo1Dt2t4XOSjIeXuR/OkJ4i2H0aiTWLnh3ysVpIsLuJBUapxrvL6rci81Vadk6Tl9R9jWVKfzdh7CM17GLB7vUqUqA25ejT1Djp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756292161; c=relaxed/simple;
	bh=1PtJIWLhL4yQWXU3zlGTNITTKz5VrZgF3PzojoCmc58=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C59J6LB1OEcYmLZ0xI8Lh6rPV+zanfwg/z2QBBtfbNdDSjovpp0tZ1arM9ecNsVjzxDWtvMEbzzp/G/cRMBdmM9Z7Kch5WT0KYE7STEsKVN//wHX6X5+CX+p15JLJ35MGYq5DyWg9uz0AxUewwwuKhFPrcEld7/rk/LITobI/yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k/fQwBny; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kgSk009458
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 10:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QrIK6tX2IWK
	GLbKUtBQLQ4aPT6fPCczMhEz00/Q0PUw=; b=k/fQwBnyW9PjS0ma6JrGdD3HiC3
	/Oo34XL1IZJWz3FP68nVd8oRghlU8w8+rRi/DxDOmcYKgfHIv4yc1YwP2PL/gWeL
	baOD7rBbumE4Tqaamwlh3g8hobuwZSlwgCApRj8T4fQlI0GxycGCl3Z4q8ZhR4B/
	JlqI0kQw1/nNit5XZYHKsxpHwRHzZs4wlBjcHg2elko/RwajKTm+RSPucxfgpHw3
	gmPFGxxi3EPKl/Ar15kVCdGaIRHM1nHHQGbAM86PLU9bS5XxCb+alHsJfWC/T82x
	UFwDGdl9/zusH2u/H7opQV1Lg8AGRjHG1SxQDe6gU52HnLqpK37i7HomL6A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48sh8ajm52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 10:55:58 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e2eb787f2so6539207b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 03:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756292157; x=1756896957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QrIK6tX2IWKGLbKUtBQLQ4aPT6fPCczMhEz00/Q0PUw=;
        b=IUYrEVmLmsdib+jrpBtqds0MTC9ZqoC7qtRUVAMQPHgrCuIO9QF0o29A3iAp0hQaLD
         BkhJrmkuQceISOQNzbMO+yM8pQC9zHy4uVo4niHZiHQxHgnyGz4JnRUCWUIG72KtRrTS
         PdO0hrLEfvfhDuTo893TUuW1jXG3x3rObNdM3eLh5QktWRiSrz+U75mgHw8/vmAO+Gt0
         slUjxq1uUbY8thvoqNymQyBl+Z415HGHUaVLWuwC/WPrRtJfthqvkm6ZmSz8Yy1I1E9V
         OlA6FJsJXmHEgS3UWjTmSqBq0t5onvTztRf0nXyLwmuYCcc5zk3GamAyAGKZ/up/GOOq
         eiwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0R0YB9lSoivwNgPs5GxU9+fpmAmvzkUw2kNZfgLdRef4Rjxc+Kl64stMhBdvFj5RVFL1xPZ8cMIHuWI9n@vger.kernel.org
X-Gm-Message-State: AOJu0YwhW0pVZiw/URM7UGUa71c9r4/pT04adk2+Ep56ZBhcjszvs0QG
	QGWanzJTw3z0ANtArBeKwNG5pa2/UUqVufy+vx2P9I/gerj4pKGSpOR63d+M3/CHB0W5esG6gW9
	yxgPWWYOcK/MJ5TdcEwemg0RTiDiBzpwYEg4dCJvdJSRWd0OAuygX0ohFnaQ5nSNneTbS
X-Gm-Gg: ASbGncse/lY4vAKRjPnSbTSfvvi28ov4rFs5ySfLZWP7DCuM43yjufapMO928Oh0sl0
	+Cz4g56FeQxRr0tKgqMD4aNRBR1tykv4m6xWnPqgr9+I3linqACRJzSyVY51ESdJx/4lHIC93Wx
	w1pGqEVdF1BS/ZC9Lyg/0vteL3O6hNtHfxPBDFF/8DhL5j+FwRm6cDEq1B+++0awWEntdv7EymN
	R2Zhfr6YoarhCxbXXGaI2E9RwrWeHQxqBLopwkmV9SezKclvYvM0eObhNvqS32zzeEiyC0f005p
	19iA/bHGstwY9XzkyQwQ0kLlJjR4lS3gvE0fK57aGZWAHj6rA6KgBD24Sp3J2hi2d6M5CISgMmy
	/9Ic7TQ15Sujb6jlb0MbJ
X-Received: by 2002:a05:6a20:7345:b0:240:195a:8333 with SMTP id adf61e73a8af0-24340bff9bfmr31909514637.14.1756292157454;
        Wed, 27 Aug 2025 03:55:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyCThp3Fh3qi/ShzD68kw87pJ8DTWN/foHp2PaSMbiSxKV4gSMLtSUTOVTg8XBGz//N7OcSA==
X-Received: by 2002:a05:6a20:7345:b0:240:195a:8333 with SMTP id adf61e73a8af0-24340bff9bfmr31909480637.14.1756292156944;
        Wed, 27 Aug 2025 03:55:56 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-771f2f2ac7dsm5573035b3a.43.2025.08.27.03.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 03:55:56 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 2/3] coresight: tpda: add logic to configure TPDA_SYNCR register
Date: Wed, 27 Aug 2025 18:55:44 +0800
Message-Id: <20250827105545.7140-3-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250827105545.7140-1-jie.gan@oss.qualcomm.com>
References: <20250827105545.7140-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cLDgskeN c=1 sm=1 tr=0 ts=68aee43e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=6Dbyrv6SX_ztr3m6kfUA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDE1MyBTYWx0ZWRfX5sJGLv6MZXcq
 277yrMBLGT92/SFOPymo2/poSyRCQam00g9YqBg9UvfDbJn3OkpLLuR+NpiH5eC2rmhBboW2KKF
 WEE4GkNQdjdn9kwqAy4n8QGWdahxOBatnpVWvGxK5dH06c0f2xHw6iT4/6KO9AUCkOllpYO4e+A
 ooz158CD4Ze/tdKEprZkWtw++te0qPNiItjq2y5eMI5VWi/wdiVcrqrbiKuBbuGWaq/v1bVHViZ
 2uT7PrkZQdswu458iYoiZdGLudhaip1EqLrfjyeuZa7h6H9n4vlIbKzRHvPOKTQPhn2L3etwJ2D
 CZRBiOr5k67jP34KpbwGmt1IBv7uVYy4AVZQShPy6VZuqJEwVpkaPoxsl/tsQ7D4UGP0nc0gWKB
 TjpT8Bli
X-Proofpoint-GUID: fqhXFs2blDpdeNHHAND6uVWtMuRWXnNY
X-Proofpoint-ORIG-GUID: fqhXFs2blDpdeNHHAND6uVWtMuRWXnNY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508260153

From: Tao Zhang <tao.zhang@oss.qualcomm.com>

The TPDA_SYNCR register defines the frequency at which TPDA generates
ASYNC packets, enabling userspace tools to accurately parse each valid
packet.

Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tpda.c | 7 +++++++
 drivers/hwtracing/coresight/coresight-tpda.h | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index d4d1def5ec15..a1393962b04d 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -187,6 +187,13 @@ static void tpda_enable_pre_port(struct tpda_drvdata *drvdata)
 	 */
 	if (drvdata->trig_flag_ts)
 		writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
+
+	/* Program the counter value for TPDA_SYNCR */
+	val = readl_relaxed(drvdata->base + TPDA_SYNCR);
+	/* Clear the mode */
+	val &= ~TPDA_SYNCR_MODE_CTRL;
+	val |= TPDA_SYNCR_COUNTER_MASK;
+	writel_relaxed(val, drvdata->base + TPDA_SYNCR);
 }
 
 static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index 0be625fb52fd..0c9bf2fade56 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.h
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -9,6 +9,7 @@
 #define TPDA_CR			(0x000)
 #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
 #define TPDA_FPID_CR		(0x084)
+#define TPDA_SYNCR		(0x08C)
 
 /* Cross trigger FREQ packets timestamp bit */
 #define TPDA_CR_FREQTS		BIT(2)
@@ -27,6 +28,10 @@
 #define TPDA_Pn_CR_CMBSIZE		GENMASK(7, 6)
 /* Aggregator port DSB data set element size bit */
 #define TPDA_Pn_CR_DSBSIZE		BIT(8)
+/* TPDA_SYNCR mode control bit */
+#define TPDA_SYNCR_MODE_CTRL		BIT(12)
+/* TPDA_SYNCR counter mask */
+#define TPDA_SYNCR_COUNTER_MASK		GENMASK(11, 0)
 
 #define TPDA_MAX_INPORTS	32
 
-- 
2.34.1


