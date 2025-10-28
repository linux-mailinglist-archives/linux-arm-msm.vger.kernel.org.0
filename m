Return-Path: <linux-arm-msm+bounces-79115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFB6C132BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 07:31:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6C15C504437
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 06:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6F42DFF04;
	Tue, 28 Oct 2025 06:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NZzUxsY/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97752DE703
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 06:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761632915; cv=none; b=F3XlAAI3/xiyBG5pAq7wlPhjMgNpRHLTy0q3u1VGSsCxZDt7B1hjvOl5CfW7NBOsVTxZjWK/hh7lyoKOagZoZ7MmfXJNJoCOW2FZIpyf2PCp3XxypNG9QSsMC2l2O9hfJ7SwZpp6BopwJnux+C7ATypyntr/XqXsOWWR+Kh+aIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761632915; c=relaxed/simple;
	bh=RHNEaGFIW3gpssw+cDFCs3tIQo8VomibUYN0C5T6Wmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rIuuKr/4Rt750m9G1ubbHNLx0uGWwVv5hlYkDzTBba+DrK+Sr7gD4/NeAqEivmR1LHn4UuGTHTLCiyg8Hd0D6o/E5OtOiBlk/gq/qc6l4+AS2NEbngT1LEnQP/tIHImJF0VI8+w7LPHwPBkXcHSpHTBrFY6zZHdfAtg6B9if0Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NZzUxsY/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S4ARO2553425
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 06:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y4xLxLPPJJ37uZZ+ZptiZV4B7ZVIbN7nFKLLB0qfoAU=; b=NZzUxsY/wYd/IPcs
	SOFdU3O7eKMw728p4mmgAh73BPK72Lo25EmvUmcAlGsbydgVq2nMqDPMImsvUy5H
	sLi4gfhizzBChJB2MgJOOLRfk0kJkrJySqE0ssJBXa+sqOddipj2d/z1SC0xscx5
	lFn2h2OB/FiEVu2HAS/Raj00NHCf1eXFiqrH70yapdZ8zI+zUOJJclV7RwX7hYJQ
	fc8eWxYY2x0pZ9OzXyPH2W0M1ixwX4M7KSx8C+OHq/uD48t9Te3ba7djA3USXFWE
	u1ngdjJg+Ps4cW5ZNuIi4A99RaV1ykmzafHM9Jn7sMJf05SCppoNbDfI5iGUkgDC
	TBtF8g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2pjf8a4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 06:28:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-290bcced220so50483265ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 23:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761632912; x=1762237712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4xLxLPPJJ37uZZ+ZptiZV4B7ZVIbN7nFKLLB0qfoAU=;
        b=h9AK6w9b5zVBJ1dhZENipI0rLLn2yzj7flACh/YUl1Ju/XWT0UKvFOODD4IhhHwDQE
         sT36n5Zcnt/4dd2o0yt7G//Glcvvgpumeuk5RpTo5CK1w7pLGyOMcms8w8c4KMrm/voS
         bAdPlgnNBlPumlPb3k+Dg7KmPCFzw90L3MtVNq0+yvigD6y4QzIu9qrHb0ai7RHdo1Ra
         6JvW5cHNFjdLcVE/++7YG7XEEbiQwnRxPacHkA/9dWJTNlkvPnO7Dt2K+lP5vPRA/Zof
         2Vwgpa64XQVJt8C63Tx2hFr1uXxWh0M+xZbLPUYA5At8H8+jGDSU04IVvD06d4FxCBWo
         ZN9w==
X-Forwarded-Encrypted: i=1; AJvYcCXLPApBjW3un+b9ufIVoTjnh5pbFclltJd2ZTA2EbLWPWK9iB1dcvahC9Clf2RKGansUcm9Uzc82MIGR9Si@vger.kernel.org
X-Gm-Message-State: AOJu0YwJIklvAcgByUeyEVNJ3cT4/CoLaviiQ2Y+ChU6i9RbTxvP3gFn
	i5iy+v9tSWx1V6O+oMZQgXBpwngkVPTtBSS81tV9UK4389lkX8jB2YfwvZJ0/Xt/QWD7Lk7NOSZ
	wQY9rjmCdKIfH1y18XzI+aDyEGuBVKN2mXzEfivGjML6zzusBpc3UzfteU5TCcdTvpX++
X-Gm-Gg: ASbGncsE5v2ZfspVttAFOIhrlfbonu9vQ2phk9YaMT60S6sDFaaTZKwlU7R1gS7t4bQ
	IlVoUqSLC9oha19/JHDnPHjCzl5DoscRcUsM05rD69vHgiq1cGi4l3iJMAtW9ZAUr9xtOhf1p9p
	KpHw2L6GBZwjClL8eTcvBHbbO+in8dFdOGcq7Q4X/SBSXk0k2xkp0eAttMHWs+H5+OkjZY4dUFd
	3Ac/AwdbyMJykgR42vkKIWCXL9S6O5tzmoRk7yyOvdQK2x/CmBi3uU4iYPwFbMVqa4ZXhFKhUed
	67hoW3LGvqYeuifNW9xgB/nYMMHQTRd7HMKYtM5lVwrZ39YDz9nk5ewkDwamiFbt2wwnN3+H7Rj
	zlXovjjzjQ3AQFZhoNrzs62uFLUzBXi+kiyHUdNSisxsk1+iR7CsOngxZ
X-Received: by 2002:a17:902:cec3:b0:26d:e984:8157 with SMTP id d9443c01a7336-294cb3916c2mr24210885ad.8.1761632912335;
        Mon, 27 Oct 2025 23:28:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsl++Agz9c3ubNi9GgpEKLSw2gjzo0PZ2U8dAXsigtV8l5SB0KneSo4vetGMv9vfVE6Yt4nw==
X-Received: by 2002:a17:902:cec3:b0:26d:e984:8157 with SMTP id d9443c01a7336-294cb3916c2mr24209385ad.8.1761632910108;
        Mon, 27 Oct 2025 23:28:30 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf359asm102503265ad.12.2025.10.27.23.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 23:28:29 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 23:28:13 -0700
Subject: [PATCH 11/12] coresight: add 'cs_mode' to link enable functions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-cpu_cluster_component_pm-v1-11-31355ac588c2@oss.qualcomm.com>
References: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
In-Reply-To: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761632890; l=9332;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=RHNEaGFIW3gpssw+cDFCs3tIQo8VomibUYN0C5T6Wmw=;
 b=rBSWcpEK5L0N76d9lDJjO+2xVcgd0HyPQtiJDwUETgJrGbIE7jjS4M/bf2UYaV+RH2+5C31OG
 BZ8U5uDoHp6BeJTY53bqc/p2TOD0qAj1uC9WUYimjqjN69EJhGYhfC9
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Authority-Analysis: v=2.4 cv=Ut9u9uwB c=1 sm=1 tr=0 ts=69006291 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_ycWAoKx6aYVZ7XB0rUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA1NCBTYWx0ZWRfX08N3RDRD7bZS
 B3AVbzbUPaAU0xzMqYhIW948xqVXYskMU0Gv4rpq1hV0Np9zyPHyUY59R/GXx2b8D6eImkmU6eY
 7iyaRF/CzO/kracTGj8qX4Jd8q5/LJlrMMhQ0I7Q1HaXUkkeGh9i0iTPGIzQ7r8cy/u00EOCWch
 ZfCCVjhJL9P3m28aj0gp0b7BJYx1CSMxQaWXSVzSC3MMFEHYSBsOOyKg7qMkGUBqoGgQcjkapDh
 uiF0lzLQ2CUAgzlBJtGNTYZ2pKjs7t3FA+xw6MUTkdQZ4Skz31OS+w5qHoTkkStJ3yVq1DkPFoK
 d8sQLySNZztdDvX0Vv5HIX5BaVBY5WQOg09R22iCg9zBCGPhgGr+QOJ92zwki+H8tFSazkBrl5N
 EoViRCOtPgCRooaywb317V1LyLZCWg==
X-Proofpoint-GUID: OdNetFFP2O8r8Ut7kcRhYxTyi733PKhL
X-Proofpoint-ORIG-GUID: OdNetFFP2O8r8Ut7kcRhYxTyi733PKhL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280054

Extend the coresight link enable interfaces to accept an
`enum cs_mode` argument. This allows link drivers to distinguish
between sysfs and perf coresight modes when enabling links.

This change is necessary because enabling CPU cluster links may involve
calling `smp_call_function_single()`, which is unsafe in perf mode due
to context constraints. By passing the tracing mode explicitly, link
drivers can apply mode-specific logic to avoid unsafe operations.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c       |  7 ++++---
 drivers/hwtracing/coresight/coresight-funnel.c     | 21 +++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-replicator.c | 23 +++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tmc-etf.c    | 19 +++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tnoc.c       |  3 ++-
 drivers/hwtracing/coresight/coresight-tpda.c       |  3 ++-
 include/linux/coresight.h                          |  3 ++-
 7 files changed, 70 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 3267192f0c1c667b0570b9100c3c449064e7fb5e..2e62005655dbcb9b504a1a5be392a5b00ed567d4 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -313,7 +313,8 @@ static void coresight_disable_sink(struct coresight_device *csdev)
 static int coresight_enable_link(struct coresight_device *csdev,
 				 struct coresight_device *parent,
 				 struct coresight_device *child,
-				 struct coresight_device *source)
+				 struct coresight_device *source,
+				 enum cs_mode mode)
 {
 	int link_subtype;
 	struct coresight_connection *inconn, *outconn;
@@ -330,7 +331,7 @@ static int coresight_enable_link(struct coresight_device *csdev,
 	if (link_subtype == CORESIGHT_DEV_SUBTYPE_LINK_SPLIT && IS_ERR(outconn))
 		return PTR_ERR(outconn);
 
-	return link_ops(csdev)->enable(csdev, inconn, outconn);
+	return link_ops(csdev)->enable(csdev, inconn, outconn, mode);
 }
 
 static void coresight_disable_link(struct coresight_device *csdev,
@@ -546,7 +547,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 		case CORESIGHT_DEV_TYPE_LINK:
 			parent = list_prev_entry(nd, link)->csdev;
 			child = list_next_entry(nd, link)->csdev;
-			ret = coresight_enable_link(csdev, parent, child, source);
+			ret = coresight_enable_link(csdev, parent, child, source, mode);
 			if (ret)
 				goto err_disable_helpers;
 			break;
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 43b9287a865eb26ce021521e4a5f193c48188bba..fd8dcd541454bd804210fa0f80f2dcc49a908717 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -121,7 +121,8 @@ static int funnel_enable_hw(struct funnel_drvdata *drvdata, int port)
 
 static int funnel_enable(struct coresight_device *csdev,
 			 struct coresight_connection *in,
-			 struct coresight_connection *out)
+			 struct coresight_connection *out,
+			 enum cs_mode mode)
 {
 	int rc = 0;
 	struct funnel_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
@@ -135,6 +136,23 @@ static int funnel_enable(struct coresight_device *csdev,
 	else
 		in->dest_refcnt++;
 
+	if (mode == CS_MODE_PERF) {
+		if (first_enable) {
+			if (drvdata->cpumask &&
+			    !cpumask_test_cpu(smp_processor_id(), drvdata->cpumask)) {
+				raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+				return -EINVAL;
+			}
+
+			if (drvdata->base)
+				rc = dynamic_funnel_enable_hw(drvdata, in->dest_port);
+			if (!rc)
+				in->dest_refcnt++;
+		}
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+		return rc;
+	}
+
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	if (first_enable) {
@@ -183,6 +201,7 @@ static void funnel_disable(struct coresight_device *csdev,
 			dynamic_funnel_disable_hw(drvdata, in->dest_port);
 		last_disable = true;
 	}
+
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	if (last_disable)
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 22c9bc71817d238c2d4ddffbb42678bf792b29af..6cb57763f9b10b68f9e129adfd6a448edce2637d 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -199,7 +199,8 @@ static int replicator_enable_hw(struct replicator_drvdata *drvdata,
 
 static int replicator_enable(struct coresight_device *csdev,
 			     struct coresight_connection *in,
-			     struct coresight_connection *out)
+			     struct coresight_connection *out,
+			     enum cs_mode mode)
 {
 	int rc = 0;
 	struct replicator_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
@@ -212,6 +213,25 @@ static int replicator_enable(struct coresight_device *csdev,
 		first_enable = true;
 	else
 		out->src_refcnt++;
+
+	if (mode == CS_MODE_PERF) {
+		if (first_enable) {
+			if (drvdata->cpumask &&
+			    !cpumask_test_cpu(smp_processor_id(), drvdata->cpumask)) {
+				raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+				return -EINVAL;
+			}
+
+			if (drvdata->base)
+				rc = dynamic_replicator_enable(drvdata, in->dest_port,
+							       out->src_port);
+			if (!rc)
+				out->src_refcnt++;
+		}
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+		return rc;
+	}
+
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	if (first_enable) {
@@ -272,6 +292,7 @@ static void replicator_disable(struct coresight_device *csdev,
 						   out->src_port);
 		last_disable = true;
 	}
+
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	if (last_disable)
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index b8a1c10d4b4c49144449b33f26710cf11713b338..281c3b316dc3c0d4fab4f06b7093825b741cf595 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -424,7 +424,8 @@ static int tmc_disable_etf_sink(struct coresight_device *csdev)
 
 static int tmc_enable_etf_link(struct coresight_device *csdev,
 			       struct coresight_connection *in,
-			       struct coresight_connection *out)
+			       struct coresight_connection *out,
+			       enum cs_mode mode)
 {
 	int ret = 0;
 	unsigned long flags;
@@ -443,6 +444,22 @@ static int tmc_enable_etf_link(struct coresight_device *csdev,
 	if (!first_enable)
 		csdev->refcnt++;
 
+	if (mode == CS_MODE_PERF) {
+		if (first_enable) {
+			if (drvdata->cpumask &&
+			    !cpumask_test_cpu(smp_processor_id(), drvdata->cpumask)) {
+				raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+				return -EINVAL;
+			}
+
+			ret = tmc_etf_enable_hw_local(drvdata);
+			if (!ret)
+				csdev->refcnt++;
+		}
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+		return ret;
+	}
+
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 	if (first_enable) {
 		ret = tmc_etf_enable_hw(drvdata);
diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index ff9a0a9cfe96e5f5e3077c750ea2f890cdd50d94..48e9e685b9439d92bdaae9e40d3b3bc2d1ac1cd2 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -73,7 +73,8 @@ static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
 }
 
 static int trace_noc_enable(struct coresight_device *csdev, struct coresight_connection *inport,
-			    struct coresight_connection *outport)
+			    struct coresight_connection *outport,
+			    enum cs_mode mode)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 333b3cb236859f0feb1498f4ab81037c772143fd..4af433145728c9e5b600a4e58dfe8931447200f8 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -197,7 +197,8 @@ static int __tpda_enable(struct tpda_drvdata *drvdata, int port)
 
 static int tpda_enable(struct coresight_device *csdev,
 		       struct coresight_connection *in,
-		       struct coresight_connection *out)
+		       struct coresight_connection *out,
+		       enum cs_mode mode)
 {
 	struct tpda_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	int ret = 0;
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 6de59ce8ef8ca45c29e2f09c1b979eb7686b685f..f4d522dc096cb9d0f8d2d8b7ce8a90574bf7c5e1 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -385,7 +385,8 @@ struct coresight_ops_sink {
 struct coresight_ops_link {
 	int (*enable)(struct coresight_device *csdev,
 		      struct coresight_connection *in,
-		      struct coresight_connection *out);
+		      struct coresight_connection *out,
+		      enum cs_mode mode);
 	void (*disable)(struct coresight_device *csdev,
 			struct coresight_connection *in,
 			struct coresight_connection *out);

-- 
2.34.1


