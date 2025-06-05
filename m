Return-Path: <linux-arm-msm+bounces-60421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D6CACF99D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 00:18:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F9BF3B02C1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 22:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5733B20C028;
	Thu,  5 Jun 2025 22:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aXAW+dxq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D0720B218
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 22:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749161882; cv=none; b=q4wog5RoFsK0MANLOvL41iLDwHRRDaLpwdBEzp2ZLGdvyKTWLvuCV5tW1bT0V87b13yvCvB5rzCHWkXs7ykMCYu5Es8FJGkvXOPTqW5/CvTGNMByKoCtwBPgq+FpEvvJkcsPHE6NP7mb/M1BjwqG3hnVF7FyMkPVEBITistzfPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749161882; c=relaxed/simple;
	bh=KcCxnkaLAzedl46fr5qSq832f++6M/A6gPneXpFYYmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aCyF38p87iOAUBOuEo6Z5NdaPfbl7b+qThrP3ZmrCs+qHuioUZ80tX51ooh9NaIK6kyylHdoSlZwt2xz95Za/8vz5enRRyH3l+LBXpm2oD0nyAWvlJCxcQ5fwf+TFLkXeS7UJo2ckNXF5fmLV2oAbaLqtESI17SWyqa/uq/aMvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aXAW+dxq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555HWGKn010418
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 22:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dWOOwem5X3eD76WnD19e0g
	xGVuS0bXeNd7150aFp5A0=; b=aXAW+dxqfOzJYyIH+FQUopn8gJz5QOe2nYjiCH
	hr7prMjlPJYvKVfzkuae40c0dhOIZM5PTntiJsWuHRHlC5md5a9+joC0NSlvsoDG
	ZoSeObTM2pU3szGVwkriicOxmJSG4C83z7l6/YGQhcQf0Ul9XafYs6rdsmeslm1N
	lJo/Mvi2ld3unO4tjWJc6IuA+j/elj2VW5J77mGxAIFnRfekoFBvGKE9bKukrEbc
	DxjbuEMPiZNw5rh+ZdFrLBqp1hvg3oP0L5GV4MR+mRIQnZ/+/2miN0o7xQrPzAXH
	rPkeYQ/Qv5MhG3apnMVOpWN6bkazerjhwqX16abLNiS0OpXA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ytssy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 22:17:57 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3feb0a69830so518093b6e.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 15:17:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749161876; x=1749766676;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dWOOwem5X3eD76WnD19e0gxGVuS0bXeNd7150aFp5A0=;
        b=ZFnHJdLX58VcVvS7cjMf/bowaFd1oD9uVaIrOO/pIWEYRDVqV3RInDoTczLFye++Vh
         jZkm7F+PeyYWaa0xXfEE3yF8yA/cO80+eRpND7tITHF45Xt4G+9nDsk1Fd4USh2lbxVx
         +7Mo7bf19fZgrYabjzY3eopjszdFbB//ftHr1G0d8VhwRi18AWm3zTA+0KJ6QUnsz4Mi
         ql122ZixdYQt+bvGeDGcd0zuT9jhjwYW1ER4VOkkYkNVi+u87gaZ3k8M8aqdYIXhdTvv
         NmyDt5gjuMpAZ3ySv7/cPVSGYT78BvLJl+qOzdENJ4h82IhlM6KJKWmsiLy02iG68Zj/
         4D2w==
X-Gm-Message-State: AOJu0YyLQhID/o50u8f9Dn1HteXKz4i4aloKIUSXOZWAuyq38rgrWLeT
	M0wkfQyYltzIbm4KimTUqA9tUU+JQjtMekWGsLORHJJn/42OsUIwyu2UPexPQwmwZfZL++V69B/
	a9qYMfyX443hagPzOkFDa+CX34M/vZPxCvUl/DDdA7dhH+NBKjixSmtSREBtJXdfXI7p6Bxo4no
	0VFuE=
X-Gm-Gg: ASbGncvV/pTqwm3Gty/ceN44rLyTQ3Ei8N/FiP8MV7v11ZkWVrITpQ8YUtM8hmm0fn+
	7ViZT0wAGVOAm1U0VGPnNSRzquvpCzSnom9KmOlrcpot68D3HCo/HQz/UteXSgPGs8bPWo69iFK
	+zaaWTljxFuu6+GMGFW7iYbDMRgjAtHjy7hJQXvlPBWnohD2dsN7qcTo6D+GLNXKqGqtZsGgaxA
	oscAaqT4WxyNehF0x+mLBiZtFuVB+ccX9apunbvongUdnvrN3DLzb3Jgshws3eXp1Zh4+XSPUCM
	Rjvz7wjLLnfAN2A4JdYucMVjD6i1wlvIcjpR3XKkN+QOeWFW1bwfvmEEv7UQ9E6yV4LLueQ8+yG
	nd1MgdNr4Nf+b/QuFcm43Ww==
X-Received: by 2002:a05:6808:6f94:b0:400:b402:2403 with SMTP id 5614622812f47-4090525e179mr910905b6e.32.1749161875808;
        Thu, 05 Jun 2025 15:17:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQlwxFyoOLuwYkfStnpUAUJlLJu9tJ6U+nMGE/sz2sWwcYXG8gAXklQPQB06e+XrvEEwYG5A==
X-Received: by 2002:a05:6808:6f94:b0:400:b402:2403 with SMTP id 5614622812f47-4090525e179mr910889b6e.32.1749161875130;
        Thu, 05 Jun 2025 15:17:55 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40906a0fef5sm34949b6e.42.2025.06.05.15.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 15:17:54 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 05 Jun 2025 17:17:47 -0500
Subject: [PATCH v2] remoteproc: qcom: pas: Conclude the rename from adsp
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-pas-rename-v2-1-f1c89e49e691@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIoXQmgC/22MQQrDIBRErxL+ugYVVNJV71GysObbCDWm/lZag
 nevybowDLyBeRsQ5oAE526DjCVQSEsDeerAzXa5IwtTY5BcKq65YqsllnGxEZnxevDC71HQDmt
 GHz6H7Do2ngO9Uv4e7iL29a+mCCbYwPnNGD5prd0lEfXPt324FGPfCsZa6w+xESwFqwAAAA==
X-Change-ID: 20250605-pas-rename-7f69f1ff1ff5
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=46885;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=KcCxnkaLAzedl46fr5qSq832f++6M/A6gPneXpFYYmM=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBoQheSuL0cKe2wtaUEvangPhMuJWd7JxFK4gOgh
 P1JogkuVTuJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaEIXkhUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcW8HQ/8D3/Y/3iiHKOgQRFZTBvt852HhdxTaoplU3Mf4QW
 iuExy4EG4IGlGrhaa98KQZ8IXZB72ptVhAjmdvP8M5u0QjRLAzGwvrskxiZ5QK6xUGuTDTLGHkH
 GkEQvmgi6XU2rrjPkhq61DNPxmmUAZ64jTvloO3ay7arLNaq5DG/hyOywsSUKkq+srBVtXATXMk
 EbgsHcR0j4n5aMKS/LimDUSbDhYtOUZLVSHr9E8FRulEaMROlIPC6/vVMMQt7uqawRQ0A8Vn7NC
 LIvsbzzOrv8E3HVonCfXA52qsgMb7WZPMp39E+FQeAlpKTERSnrepr20wwHZXX+4fOslOqEJIJ8
 kjgCfUJiVruVrw9Ca5kv9Xpe6OUnp3WaSxML2VJWejkH5cEyrbCbXSe8JduocVckCy8Px0jwdtd
 MjNmwnAdlzbyBLbCpu/izhZd8LWO/hTfT85DM0dvVfE130JhIoeKi9gH32LEhd6x2yR9yFVd6pU
 WXAuNDPRLwltI4kxyo8h/Li6KwdM9IlfL3v5kM9PWewEYIEEp/jtZ19ZBKHI25U27lbzoToBYgB
 Cr9SCx5sUWNx92iXuzjIrifTrPmbRGpd1bYeBh3QT+ZbvWaY+50yTpQsCfuvYxm/F2hgx10GeSw
 FDrId3rdg+YmjxsPcl54EDaz36dRtySd/PB4yMSFxb2g=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDIwMCBTYWx0ZWRfX8UIiMvjK/kdp
 0MI9lQnnz2xMOP7sPsqmvKmE9w4SZnnoVlMizjRG1L7/d0GZrC9+bK9CzrzTu8wV3bNDa2Lk9Kg
 Qv2kEX2w7aSthSFCpUXNt8vsassk4s3YRzc7M2rFB4TidxugtYY8bb2ESRu1qWZ1X7mhXlP+v6p
 1twgUeiuTL5XIPvMuKFNaGyC8GmIV2fP/OkJJFgP5oeg3SQtwzAnOXdeUMvVAGmMKh5GmgkE1Rp
 lt+qfn+BKRrjcYwQor/Vgs3S+ayMJIhTh1Rr7TYoim6Kr1K8HQfc8++e60BsENQGa5lgoc69dMi
 YFfCAKoOOb3leoaf/W03kTu+bA1TrANgHbYVBaFNZtLo+0AwZkNkiAgvKR76wgnr8GrP7Zzxxoy
 eoxnw1CSea91c4PXvWdjWlN/KXBVKoW5BR6ocjj770noNHSVvDlDVEuzsQGVEcBRL3sWq/S+
X-Proofpoint-ORIG-GUID: JrneugGrb9x_hj54Adm9913ICPGHflGW
X-Proofpoint-GUID: JrneugGrb9x_hj54Adm9913ICPGHflGW
X-Authority-Analysis: v=2.4 cv=T/uMT+KQ c=1 sm=1 tr=0 ts=68421795 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dzOwiNe6f2M5HJTgGzcA:9 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_07,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 adultscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050200

The change that renamed the driver from "adsp" to "pas" didn't change
any of the implementation. The result is an aesthetic eyesore, and
confusing to many.

Conclude the rename of the driver, by updating function, structures and
variable names to match what the driver actually is. The "Hexagon v5" is
also dropped from the name and Kconfig, as this isn't correct either.

No functional change.

Fixes: 9e004f97161d ("remoteproc: qcom: Rename Hexagon v5 PAS driver")
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Changes in v2:
- Dropped unwanted changes of qcom_q6v5_adsp.c
- Fixed ADSP-prefixed define
- Ensured qcom_ prefix in a few comments, and rewrote two to be more
  succinct
- Fixed spelling of peripheral and reworded Kconfig help text slightly.
- Link to v1: https://lore.kernel.org/r/20250605-pas-rename-v1-1-900b770d666c@oss.qualcomm.com
---
 drivers/remoteproc/Kconfig         |  11 +-
 drivers/remoteproc/qcom_q6v5_pas.c | 621 ++++++++++++++++++-------------------
 2 files changed, 313 insertions(+), 319 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 83962a114dc9fdb3260e6e922602f2da53106265..48a0d3a69ed08057716f1e7ea950899f60bbe0cf 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -214,7 +214,7 @@ config QCOM_Q6V5_MSS
 	  handled by QCOM_Q6V5_PAS driver.
 
 config QCOM_Q6V5_PAS
-	tristate "Qualcomm Hexagon v5 Peripheral Authentication Service support"
+	tristate "Qualcomm Peripheral Authentication Service support"
 	depends on OF && ARCH_QCOM
 	depends on QCOM_SMEM
 	depends on RPMSG_QCOM_SMD || RPMSG_QCOM_SMD=n
@@ -229,11 +229,10 @@ config QCOM_Q6V5_PAS
 	select QCOM_RPROC_COMMON
 	select QCOM_SCM
 	help
-	  Say y here to support the TrustZone based Peripheral Image Loader
-	  for the Qualcomm Hexagon v5 based remote processors. This is commonly
-	  used to control subsystems such as ADSP (Audio DSP),
-	  CDSP (Compute DSP), MPSS (Modem Peripheral SubSystem), and
-	  SLPI (Sensor Low Power Island).
+	  Say y here to support the TrustZone based Peripheral Image Loader for
+	  the Qualcomm remote processors. This is commonly used to control
+	  subsystems such as ADSP (Audio DSP), CDSP (Compute DSP), MPSS (Modem
+	  Peripheral SubSystem), and SLPI (Sensor Low Power Island).
 
 config QCOM_Q6V5_WCSS
 	tristate "Qualcomm Hexagon based WCSS Peripheral Image Loader"
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index b306f223127c452f8f2d85aa0fc98db2d684feae..02e29171cbbee2d305827365ef7d2241b6eb786b 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Qualcomm ADSP/SLPI Peripheral Image Loader for MSM8974 and MSM8996
+ * Qualcomm Peripheral Authentication Service remoteproc driver
  *
  * Copyright (C) 2016 Linaro Ltd
  * Copyright (C) 2014 Sony Mobile Communications AB
@@ -31,11 +31,11 @@
 #include "qcom_q6v5.h"
 #include "remoteproc_internal.h"
 
-#define ADSP_DECRYPT_SHUTDOWN_DELAY_MS	100
+#define QCOM_PAS_DECRYPT_SHUTDOWN_DELAY_MS	100
 
 #define MAX_ASSIGN_COUNT 3
 
-struct adsp_data {
+struct qcom_pas_data {
 	int crash_reason_smem;
 	const char *firmware_name;
 	const char *dtb_firmware_name;
@@ -60,7 +60,7 @@ struct adsp_data {
 	int region_assign_vmid;
 };
 
-struct qcom_adsp {
+struct qcom_pas {
 	struct device *dev;
 	struct rproc *rproc;
 
@@ -119,36 +119,37 @@ struct qcom_adsp {
 	struct qcom_scm_pas_metadata dtb_pas_metadata;
 };
 
-static void adsp_segment_dump(struct rproc *rproc, struct rproc_dump_segment *segment,
-		       void *dest, size_t offset, size_t size)
+static void qcom_pas_segment_dump(struct rproc *rproc,
+				  struct rproc_dump_segment *segment,
+				  void *dest, size_t offset, size_t size)
 {
-	struct qcom_adsp *adsp = rproc->priv;
+	struct qcom_pas *pas = rproc->priv;
 	int total_offset;
 
-	total_offset = segment->da + segment->offset + offset - adsp->mem_phys;
-	if (total_offset < 0 || total_offset + size > adsp->mem_size) {
-		dev_err(adsp->dev,
+	total_offset = segment->da + segment->offset + offset - pas->mem_phys;
+	if (total_offset < 0 || total_offset + size > pas->mem_size) {
+		dev_err(pas->dev,
 			"invalid copy request for segment %pad with offset %zu and size %zu)\n",
 			&segment->da, offset, size);
 		memset(dest, 0xff, size);
 		return;
 	}
 
-	memcpy_fromio(dest, adsp->mem_region + total_offset, size);
+	memcpy_fromio(dest, pas->mem_region + total_offset, size);
 }
 
-static void adsp_minidump(struct rproc *rproc)
+static void qcom_pas_minidump(struct rproc *rproc)
 {
-	struct qcom_adsp *adsp = rproc->priv;
+	struct qcom_pas *pas = rproc->priv;
 
 	if (rproc->dump_conf == RPROC_COREDUMP_DISABLED)
 		return;
 
-	qcom_minidump(rproc, adsp->minidump_id, adsp_segment_dump);
+	qcom_minidump(rproc, pas->minidump_id, qcom_pas_segment_dump);
 }
 
-static int adsp_pds_enable(struct qcom_adsp *adsp, struct device **pds,
-			   size_t pd_count)
+static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
+			       size_t pd_count)
 {
 	int ret;
 	int i;
@@ -174,8 +175,8 @@ static int adsp_pds_enable(struct qcom_adsp *adsp, struct device **pds,
 	return ret;
 };
 
-static void adsp_pds_disable(struct qcom_adsp *adsp, struct device **pds,
-			     size_t pd_count)
+static void qcom_pas_pds_disable(struct qcom_pas *pas, struct device **pds,
+				 size_t pd_count)
 {
 	int i;
 
@@ -185,65 +186,65 @@ static void adsp_pds_disable(struct qcom_adsp *adsp, struct device **pds,
 	}
 }
 
-static int adsp_shutdown_poll_decrypt(struct qcom_adsp *adsp)
+static int qcom_pas_shutdown_poll_decrypt(struct qcom_pas *pas)
 {
 	unsigned int retry_num = 50;
 	int ret;
 
 	do {
-		msleep(ADSP_DECRYPT_SHUTDOWN_DELAY_MS);
-		ret = qcom_scm_pas_shutdown(adsp->pas_id);
+		msleep(QCOM_PAS_DECRYPT_SHUTDOWN_DELAY_MS);
+		ret = qcom_scm_pas_shutdown(pas->pas_id);
 	} while (ret == -EINVAL && --retry_num);
 
 	return ret;
 }
 
-static int adsp_unprepare(struct rproc *rproc)
+static int qcom_pas_unprepare(struct rproc *rproc)
 {
-	struct qcom_adsp *adsp = rproc->priv;
+	struct qcom_pas *pas = rproc->priv;
 
 	/*
-	 * adsp_load() did pass pas_metadata to the SCM driver for storing
+	 * qcom_pas_load() did pass pas_metadata to the SCM driver for storing
 	 * metadata context. It might have been released already if
 	 * auth_and_reset() was successful, but in other cases clean it up
 	 * here.
 	 */
-	qcom_scm_pas_metadata_release(&adsp->pas_metadata);
-	if (adsp->dtb_pas_id)
-		qcom_scm_pas_metadata_release(&adsp->dtb_pas_metadata);
+	qcom_scm_pas_metadata_release(&pas->pas_metadata);
+	if (pas->dtb_pas_id)
+		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
 
 	return 0;
 }
 
-static int adsp_load(struct rproc *rproc, const struct firmware *fw)
+static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 {
-	struct qcom_adsp *adsp = rproc->priv;
+	struct qcom_pas *pas = rproc->priv;
 	int ret;
 
-	/* Store firmware handle to be used in adsp_start() */
-	adsp->firmware = fw;
+	/* Store firmware handle to be used in qcom_pas_start() */
+	pas->firmware = fw;
 
-	if (adsp->lite_pas_id)
-		ret = qcom_scm_pas_shutdown(adsp->lite_pas_id);
+	if (pas->lite_pas_id)
+		ret = qcom_scm_pas_shutdown(pas->lite_pas_id);
 
-	if (adsp->dtb_pas_id) {
-		ret = request_firmware(&adsp->dtb_firmware, adsp->dtb_firmware_name, adsp->dev);
+	if (pas->dtb_pas_id) {
+		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
 		if (ret) {
-			dev_err(adsp->dev, "request_firmware failed for %s: %d\n",
-				adsp->dtb_firmware_name, ret);
+			dev_err(pas->dev, "request_firmware failed for %s: %d\n",
+				pas->dtb_firmware_name, ret);
 			return ret;
 		}
 
-		ret = qcom_mdt_pas_init(adsp->dev, adsp->dtb_firmware, adsp->dtb_firmware_name,
-					adsp->dtb_pas_id, adsp->dtb_mem_phys,
-					&adsp->dtb_pas_metadata);
+		ret = qcom_mdt_pas_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
+					pas->dtb_pas_id, pas->dtb_mem_phys,
+					&pas->dtb_pas_metadata);
 		if (ret)
 			goto release_dtb_firmware;
 
-		ret = qcom_mdt_load_no_init(adsp->dev, adsp->dtb_firmware, adsp->dtb_firmware_name,
-					    adsp->dtb_pas_id, adsp->dtb_mem_region,
-					    adsp->dtb_mem_phys, adsp->dtb_mem_size,
-					    &adsp->dtb_mem_reloc);
+		ret = qcom_mdt_load_no_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
+					    pas->dtb_pas_id, pas->dtb_mem_region,
+					    pas->dtb_mem_phys, pas->dtb_mem_size,
+					    &pas->dtb_mem_reloc);
 		if (ret)
 			goto release_dtb_metadata;
 	}
@@ -251,248 +252,246 @@ static int adsp_load(struct rproc *rproc, const struct firmware *fw)
 	return 0;
 
 release_dtb_metadata:
-	qcom_scm_pas_metadata_release(&adsp->dtb_pas_metadata);
+	qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
 
 release_dtb_firmware:
-	release_firmware(adsp->dtb_firmware);
+	release_firmware(pas->dtb_firmware);
 
 	return ret;
 }
 
-static int adsp_start(struct rproc *rproc)
+static int qcom_pas_start(struct rproc *rproc)
 {
-	struct qcom_adsp *adsp = rproc->priv;
+	struct qcom_pas *pas = rproc->priv;
 	int ret;
 
-	ret = qcom_q6v5_prepare(&adsp->q6v5);
+	ret = qcom_q6v5_prepare(&pas->q6v5);
 	if (ret)
 		return ret;
 
-	ret = adsp_pds_enable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
+	ret = qcom_pas_pds_enable(pas, pas->proxy_pds, pas->proxy_pd_count);
 	if (ret < 0)
 		goto disable_irqs;
 
-	ret = clk_prepare_enable(adsp->xo);
+	ret = clk_prepare_enable(pas->xo);
 	if (ret)
 		goto disable_proxy_pds;
 
-	ret = clk_prepare_enable(adsp->aggre2_clk);
+	ret = clk_prepare_enable(pas->aggre2_clk);
 	if (ret)
 		goto disable_xo_clk;
 
-	if (adsp->cx_supply) {
-		ret = regulator_enable(adsp->cx_supply);
+	if (pas->cx_supply) {
+		ret = regulator_enable(pas->cx_supply);
 		if (ret)
 			goto disable_aggre2_clk;
 	}
 
-	if (adsp->px_supply) {
-		ret = regulator_enable(adsp->px_supply);
+	if (pas->px_supply) {
+		ret = regulator_enable(pas->px_supply);
 		if (ret)
 			goto disable_cx_supply;
 	}
 
-	if (adsp->dtb_pas_id) {
-		ret = qcom_scm_pas_auth_and_reset(adsp->dtb_pas_id);
+	if (pas->dtb_pas_id) {
+		ret = qcom_scm_pas_auth_and_reset(pas->dtb_pas_id);
 		if (ret) {
-			dev_err(adsp->dev,
+			dev_err(pas->dev,
 				"failed to authenticate dtb image and release reset\n");
 			goto disable_px_supply;
 		}
 	}
 
-	ret = qcom_mdt_pas_init(adsp->dev, adsp->firmware, rproc->firmware, adsp->pas_id,
-				adsp->mem_phys, &adsp->pas_metadata);
+	ret = qcom_mdt_pas_init(pas->dev, pas->firmware, rproc->firmware, pas->pas_id,
+				pas->mem_phys, &pas->pas_metadata);
 	if (ret)
 		goto disable_px_supply;
 
-	ret = qcom_mdt_load_no_init(adsp->dev, adsp->firmware, rproc->firmware, adsp->pas_id,
-				    adsp->mem_region, adsp->mem_phys, adsp->mem_size,
-				    &adsp->mem_reloc);
+	ret = qcom_mdt_load_no_init(pas->dev, pas->firmware, rproc->firmware, pas->pas_id,
+				    pas->mem_region, pas->mem_phys, pas->mem_size,
+				    &pas->mem_reloc);
 	if (ret)
 		goto release_pas_metadata;
 
-	qcom_pil_info_store(adsp->info_name, adsp->mem_phys, adsp->mem_size);
+	qcom_pil_info_store(pas->info_name, pas->mem_phys, pas->mem_size);
 
-	ret = qcom_scm_pas_auth_and_reset(adsp->pas_id);
+	ret = qcom_scm_pas_auth_and_reset(pas->pas_id);
 	if (ret) {
-		dev_err(adsp->dev,
+		dev_err(pas->dev,
 			"failed to authenticate image and release reset\n");
 		goto release_pas_metadata;
 	}
 
-	ret = qcom_q6v5_wait_for_start(&adsp->q6v5, msecs_to_jiffies(5000));
+	ret = qcom_q6v5_wait_for_start(&pas->q6v5, msecs_to_jiffies(5000));
 	if (ret == -ETIMEDOUT) {
-		dev_err(adsp->dev, "start timed out\n");
-		qcom_scm_pas_shutdown(adsp->pas_id);
+		dev_err(pas->dev, "start timed out\n");
+		qcom_scm_pas_shutdown(pas->pas_id);
 		goto release_pas_metadata;
 	}
 
-	qcom_scm_pas_metadata_release(&adsp->pas_metadata);
-	if (adsp->dtb_pas_id)
-		qcom_scm_pas_metadata_release(&adsp->dtb_pas_metadata);
+	qcom_scm_pas_metadata_release(&pas->pas_metadata);
+	if (pas->dtb_pas_id)
+		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
 
-	/* Remove pointer to the loaded firmware, only valid in adsp_load() & adsp_start() */
-	adsp->firmware = NULL;
+	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
+	pas->firmware = NULL;
 
 	return 0;
 
 release_pas_metadata:
-	qcom_scm_pas_metadata_release(&adsp->pas_metadata);
-	if (adsp->dtb_pas_id)
-		qcom_scm_pas_metadata_release(&adsp->dtb_pas_metadata);
+	qcom_scm_pas_metadata_release(&pas->pas_metadata);
+	if (pas->dtb_pas_id)
+		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
 disable_px_supply:
-	if (adsp->px_supply)
-		regulator_disable(adsp->px_supply);
+	if (pas->px_supply)
+		regulator_disable(pas->px_supply);
 disable_cx_supply:
-	if (adsp->cx_supply)
-		regulator_disable(adsp->cx_supply);
+	if (pas->cx_supply)
+		regulator_disable(pas->cx_supply);
 disable_aggre2_clk:
-	clk_disable_unprepare(adsp->aggre2_clk);
+	clk_disable_unprepare(pas->aggre2_clk);
 disable_xo_clk:
-	clk_disable_unprepare(adsp->xo);
+	clk_disable_unprepare(pas->xo);
 disable_proxy_pds:
-	adsp_pds_disable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
+	qcom_pas_pds_disable(pas, pas->proxy_pds, pas->proxy_pd_count);
 disable_irqs:
-	qcom_q6v5_unprepare(&adsp->q6v5);
+	qcom_q6v5_unprepare(&pas->q6v5);
 
-	/* Remove pointer to the loaded firmware, only valid in adsp_load() & adsp_start() */
-	adsp->firmware = NULL;
+	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
+	pas->firmware = NULL;
 
 	return ret;
 }
 
 static void qcom_pas_handover(struct qcom_q6v5 *q6v5)
 {
-	struct qcom_adsp *adsp = container_of(q6v5, struct qcom_adsp, q6v5);
-
-	if (adsp->px_supply)
-		regulator_disable(adsp->px_supply);
-	if (adsp->cx_supply)
-		regulator_disable(adsp->cx_supply);
-	clk_disable_unprepare(adsp->aggre2_clk);
-	clk_disable_unprepare(adsp->xo);
-	adsp_pds_disable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
+	struct qcom_pas *pas = container_of(q6v5, struct qcom_pas, q6v5);
+
+	if (pas->px_supply)
+		regulator_disable(pas->px_supply);
+	if (pas->cx_supply)
+		regulator_disable(pas->cx_supply);
+	clk_disable_unprepare(pas->aggre2_clk);
+	clk_disable_unprepare(pas->xo);
+	qcom_pas_pds_disable(pas, pas->proxy_pds, pas->proxy_pd_count);
 }
 
-static int adsp_stop(struct rproc *rproc)
+static int qcom_pas_stop(struct rproc *rproc)
 {
-	struct qcom_adsp *adsp = rproc->priv;
+	struct qcom_pas *pas = rproc->priv;
 	int handover;
 	int ret;
 
-	ret = qcom_q6v5_request_stop(&adsp->q6v5, adsp->sysmon);
+	ret = qcom_q6v5_request_stop(&pas->q6v5, pas->sysmon);
 	if (ret == -ETIMEDOUT)
-		dev_err(adsp->dev, "timed out on wait\n");
+		dev_err(pas->dev, "timed out on wait\n");
 
-	ret = qcom_scm_pas_shutdown(adsp->pas_id);
-	if (ret && adsp->decrypt_shutdown)
-		ret = adsp_shutdown_poll_decrypt(adsp);
+	ret = qcom_scm_pas_shutdown(pas->pas_id);
+	if (ret && pas->decrypt_shutdown)
+		ret = qcom_pas_shutdown_poll_decrypt(pas);
 
 	if (ret)
-		dev_err(adsp->dev, "failed to shutdown: %d\n", ret);
+		dev_err(pas->dev, "failed to shutdown: %d\n", ret);
 
-	if (adsp->dtb_pas_id) {
-		ret = qcom_scm_pas_shutdown(adsp->dtb_pas_id);
+	if (pas->dtb_pas_id) {
+		ret = qcom_scm_pas_shutdown(pas->dtb_pas_id);
 		if (ret)
-			dev_err(adsp->dev, "failed to shutdown dtb: %d\n", ret);
+			dev_err(pas->dev, "failed to shutdown dtb: %d\n", ret);
 	}
 
-	handover = qcom_q6v5_unprepare(&adsp->q6v5);
+	handover = qcom_q6v5_unprepare(&pas->q6v5);
 	if (handover)
-		qcom_pas_handover(&adsp->q6v5);
+		qcom_pas_handover(&pas->q6v5);
 
-	if (adsp->smem_host_id)
-		ret = qcom_smem_bust_hwspin_lock_by_host(adsp->smem_host_id);
+	if (pas->smem_host_id)
+		ret = qcom_smem_bust_hwspin_lock_by_host(pas->smem_host_id);
 
 	return ret;
 }
 
-static void *adsp_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
+static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
-	struct qcom_adsp *adsp = rproc->priv;
+	struct qcom_pas *pas = rproc->priv;
 	int offset;
 
-	offset = da - adsp->mem_reloc;
-	if (offset < 0 || offset + len > adsp->mem_size)
+	offset = da - pas->mem_reloc;
+	if (offset < 0 || offset + len > pas->mem_size)
 		return NULL;
 
 	if (is_iomem)
 		*is_iomem = true;
 
-	return adsp->mem_region + offset;
+	return pas->mem_region + offset;
 }
 
-static unsigned long adsp_panic(struct rproc *rproc)
+static unsigned long qcom_pas_panic(struct rproc *rproc)
 {
-	struct qcom_adsp *adsp = rproc->priv;
+	struct qcom_pas *pas = rproc->priv;
 
-	return qcom_q6v5_panic(&adsp->q6v5);
+	return qcom_q6v5_panic(&pas->q6v5);
 }
 
-static const struct rproc_ops adsp_ops = {
-	.unprepare = adsp_unprepare,
-	.start = adsp_start,
-	.stop = adsp_stop,
-	.da_to_va = adsp_da_to_va,
+static const struct rproc_ops qcom_pas_ops = {
+	.unprepare = qcom_pas_unprepare,
+	.start = qcom_pas_start,
+	.stop = qcom_pas_stop,
+	.da_to_va = qcom_pas_da_to_va,
 	.parse_fw = qcom_register_dump_segments,
-	.load = adsp_load,
-	.panic = adsp_panic,
+	.load = qcom_pas_load,
+	.panic = qcom_pas_panic,
 };
 
-static const struct rproc_ops adsp_minidump_ops = {
-	.unprepare = adsp_unprepare,
-	.start = adsp_start,
-	.stop = adsp_stop,
-	.da_to_va = adsp_da_to_va,
+static const struct rproc_ops qcom_pas_minidump_ops = {
+	.unprepare = qcom_pas_unprepare,
+	.start = qcom_pas_start,
+	.stop = qcom_pas_stop,
+	.da_to_va = qcom_pas_da_to_va,
 	.parse_fw = qcom_register_dump_segments,
-	.load = adsp_load,
-	.panic = adsp_panic,
-	.coredump = adsp_minidump,
+	.load = qcom_pas_load,
+	.panic = qcom_pas_panic,
+	.coredump = qcom_pas_minidump,
 };
 
-static int adsp_init_clock(struct qcom_adsp *adsp)
+static int qcom_pas_init_clock(struct qcom_pas *pas)
 {
-	adsp->xo = devm_clk_get(adsp->dev, "xo");
-	if (IS_ERR(adsp->xo))
-		return dev_err_probe(adsp->dev, PTR_ERR(adsp->xo),
+	pas->xo = devm_clk_get(pas->dev, "xo");
+	if (IS_ERR(pas->xo))
+		return dev_err_probe(pas->dev, PTR_ERR(pas->xo),
 				     "failed to get xo clock");
 
-
-	adsp->aggre2_clk = devm_clk_get_optional(adsp->dev, "aggre2");
-	if (IS_ERR(adsp->aggre2_clk))
-		return dev_err_probe(adsp->dev, PTR_ERR(adsp->aggre2_clk),
+	pas->aggre2_clk = devm_clk_get_optional(pas->dev, "aggre2");
+	if (IS_ERR(pas->aggre2_clk))
+		return dev_err_probe(pas->dev, PTR_ERR(pas->aggre2_clk),
 				     "failed to get aggre2 clock");
 
 	return 0;
 }
 
-static int adsp_init_regulator(struct qcom_adsp *adsp)
+static int qcom_pas_init_regulator(struct qcom_pas *pas)
 {
-	adsp->cx_supply = devm_regulator_get_optional(adsp->dev, "cx");
-	if (IS_ERR(adsp->cx_supply)) {
-		if (PTR_ERR(adsp->cx_supply) == -ENODEV)
-			adsp->cx_supply = NULL;
+	pas->cx_supply = devm_regulator_get_optional(pas->dev, "cx");
+	if (IS_ERR(pas->cx_supply)) {
+		if (PTR_ERR(pas->cx_supply) == -ENODEV)
+			pas->cx_supply = NULL;
 		else
-			return PTR_ERR(adsp->cx_supply);
+			return PTR_ERR(pas->cx_supply);
 	}
 
-	if (adsp->cx_supply)
-		regulator_set_load(adsp->cx_supply, 100000);
+	if (pas->cx_supply)
+		regulator_set_load(pas->cx_supply, 100000);
 
-	adsp->px_supply = devm_regulator_get_optional(adsp->dev, "px");
-	if (IS_ERR(adsp->px_supply)) {
-		if (PTR_ERR(adsp->px_supply) == -ENODEV)
-			adsp->px_supply = NULL;
+	pas->px_supply = devm_regulator_get_optional(pas->dev, "px");
+	if (IS_ERR(pas->px_supply)) {
+		if (PTR_ERR(pas->px_supply) == -ENODEV)
+			pas->px_supply = NULL;
 		else
-			return PTR_ERR(adsp->px_supply);
+			return PTR_ERR(pas->px_supply);
 	}
 
 	return 0;
 }
 
-static int adsp_pds_attach(struct device *dev, struct device **devs,
-			   char **pd_names)
+static int qcom_pas_pds_attach(struct device *dev, struct device **devs, char **pd_names)
 {
 	size_t num_pds = 0;
 	int ret;
@@ -528,10 +527,9 @@ static int adsp_pds_attach(struct device *dev, struct device **devs,
 	return ret;
 };
 
-static void adsp_pds_detach(struct qcom_adsp *adsp, struct device **pds,
-			    size_t pd_count)
+static void qcom_pas_pds_detach(struct qcom_pas *pas, struct device **pds, size_t pd_count)
 {
-	struct device *dev = adsp->dev;
+	struct device *dev = pas->dev;
 	int i;
 
 	/* Handle single power domain */
@@ -544,62 +542,62 @@ static void adsp_pds_detach(struct qcom_adsp *adsp, struct device **pds,
 		dev_pm_domain_detach(pds[i], false);
 }
 
-static int adsp_alloc_memory_region(struct qcom_adsp *adsp)
+static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 {
 	struct reserved_mem *rmem;
 	struct device_node *node;
 
-	node = of_parse_phandle(adsp->dev->of_node, "memory-region", 0);
+	node = of_parse_phandle(pas->dev->of_node, "memory-region", 0);
 	if (!node) {
-		dev_err(adsp->dev, "no memory-region specified\n");
+		dev_err(pas->dev, "no memory-region specified\n");
 		return -EINVAL;
 	}
 
 	rmem = of_reserved_mem_lookup(node);
 	of_node_put(node);
 	if (!rmem) {
-		dev_err(adsp->dev, "unable to resolve memory-region\n");
+		dev_err(pas->dev, "unable to resolve memory-region\n");
 		return -EINVAL;
 	}
 
-	adsp->mem_phys = adsp->mem_reloc = rmem->base;
-	adsp->mem_size = rmem->size;
-	adsp->mem_region = devm_ioremap_wc(adsp->dev, adsp->mem_phys, adsp->mem_size);
-	if (!adsp->mem_region) {
-		dev_err(adsp->dev, "unable to map memory region: %pa+%zx\n",
-			&rmem->base, adsp->mem_size);
+	pas->mem_phys = pas->mem_reloc = rmem->base;
+	pas->mem_size = rmem->size;
+	pas->mem_region = devm_ioremap_wc(pas->dev, pas->mem_phys, pas->mem_size);
+	if (!pas->mem_region) {
+		dev_err(pas->dev, "unable to map memory region: %pa+%zx\n",
+			&rmem->base, pas->mem_size);
 		return -EBUSY;
 	}
 
-	if (!adsp->dtb_pas_id)
+	if (!pas->dtb_pas_id)
 		return 0;
 
-	node = of_parse_phandle(adsp->dev->of_node, "memory-region", 1);
+	node = of_parse_phandle(pas->dev->of_node, "memory-region", 1);
 	if (!node) {
-		dev_err(adsp->dev, "no dtb memory-region specified\n");
+		dev_err(pas->dev, "no dtb memory-region specified\n");
 		return -EINVAL;
 	}
 
 	rmem = of_reserved_mem_lookup(node);
 	of_node_put(node);
 	if (!rmem) {
-		dev_err(adsp->dev, "unable to resolve dtb memory-region\n");
+		dev_err(pas->dev, "unable to resolve dtb memory-region\n");
 		return -EINVAL;
 	}
 
-	adsp->dtb_mem_phys = adsp->dtb_mem_reloc = rmem->base;
-	adsp->dtb_mem_size = rmem->size;
-	adsp->dtb_mem_region = devm_ioremap_wc(adsp->dev, adsp->dtb_mem_phys, adsp->dtb_mem_size);
-	if (!adsp->dtb_mem_region) {
-		dev_err(adsp->dev, "unable to map dtb memory region: %pa+%zx\n",
-			&rmem->base, adsp->dtb_mem_size);
+	pas->dtb_mem_phys = pas->dtb_mem_reloc = rmem->base;
+	pas->dtb_mem_size = rmem->size;
+	pas->dtb_mem_region = devm_ioremap_wc(pas->dev, pas->dtb_mem_phys, pas->dtb_mem_size);
+	if (!pas->dtb_mem_region) {
+		dev_err(pas->dev, "unable to map dtb memory region: %pa+%zx\n",
+			&rmem->base, pas->dtb_mem_size);
 		return -EBUSY;
 	}
 
 	return 0;
 }
 
-static int adsp_assign_memory_region(struct qcom_adsp *adsp)
+static int qcom_pas_assign_memory_region(struct qcom_pas *pas)
 {
 	struct qcom_scm_vmperm perm[MAX_ASSIGN_COUNT];
 	struct device_node *node;
@@ -607,45 +605,45 @@ static int adsp_assign_memory_region(struct qcom_adsp *adsp)
 	int offset;
 	int ret;
 
-	if (!adsp->region_assign_idx)
+	if (!pas->region_assign_idx)
 		return 0;
 
-	for (offset = 0; offset < adsp->region_assign_count; ++offset) {
+	for (offset = 0; offset < pas->region_assign_count; ++offset) {
 		struct reserved_mem *rmem = NULL;
 
-		node = of_parse_phandle(adsp->dev->of_node, "memory-region",
-					adsp->region_assign_idx + offset);
+		node = of_parse_phandle(pas->dev->of_node, "memory-region",
+					pas->region_assign_idx + offset);
 		if (node)
 			rmem = of_reserved_mem_lookup(node);
 		of_node_put(node);
 		if (!rmem) {
-			dev_err(adsp->dev, "unable to resolve shareable memory-region index %d\n",
+			dev_err(pas->dev, "unable to resolve shareable memory-region index %d\n",
 				offset);
 			return -EINVAL;
 		}
 
-		if (adsp->region_assign_shared)  {
+		if (pas->region_assign_shared)  {
 			perm[0].vmid = QCOM_SCM_VMID_HLOS;
 			perm[0].perm = QCOM_SCM_PERM_RW;
-			perm[1].vmid = adsp->region_assign_vmid;
+			perm[1].vmid = pas->region_assign_vmid;
 			perm[1].perm = QCOM_SCM_PERM_RW;
 			perm_size = 2;
 		} else {
-			perm[0].vmid = adsp->region_assign_vmid;
+			perm[0].vmid = pas->region_assign_vmid;
 			perm[0].perm = QCOM_SCM_PERM_RW;
 			perm_size = 1;
 		}
 
-		adsp->region_assign_phys[offset] = rmem->base;
-		adsp->region_assign_size[offset] = rmem->size;
-		adsp->region_assign_owners[offset] = BIT(QCOM_SCM_VMID_HLOS);
+		pas->region_assign_phys[offset] = rmem->base;
+		pas->region_assign_size[offset] = rmem->size;
+		pas->region_assign_owners[offset] = BIT(QCOM_SCM_VMID_HLOS);
 
-		ret = qcom_scm_assign_mem(adsp->region_assign_phys[offset],
-					  adsp->region_assign_size[offset],
-					  &adsp->region_assign_owners[offset],
+		ret = qcom_scm_assign_mem(pas->region_assign_phys[offset],
+					  pas->region_assign_size[offset],
+					  &pas->region_assign_owners[offset],
 					  perm, perm_size);
 		if (ret < 0) {
-			dev_err(adsp->dev, "assign memory %d failed\n", offset);
+			dev_err(pas->dev, "assign memory %d failed\n", offset);
 			return ret;
 		}
 	}
@@ -653,35 +651,35 @@ static int adsp_assign_memory_region(struct qcom_adsp *adsp)
 	return 0;
 }
 
-static void adsp_unassign_memory_region(struct qcom_adsp *adsp)
+static void qcom_pas_unassign_memory_region(struct qcom_pas *pas)
 {
 	struct qcom_scm_vmperm perm;
 	int offset;
 	int ret;
 
-	if (!adsp->region_assign_idx || adsp->region_assign_shared)
+	if (!pas->region_assign_idx || pas->region_assign_shared)
 		return;
 
-	for (offset = 0; offset < adsp->region_assign_count; ++offset) {
+	for (offset = 0; offset < pas->region_assign_count; ++offset) {
 		perm.vmid = QCOM_SCM_VMID_HLOS;
 		perm.perm = QCOM_SCM_PERM_RW;
 
-		ret = qcom_scm_assign_mem(adsp->region_assign_phys[offset],
-					  adsp->region_assign_size[offset],
-					  &adsp->region_assign_owners[offset],
+		ret = qcom_scm_assign_mem(pas->region_assign_phys[offset],
+					  pas->region_assign_size[offset],
+					  &pas->region_assign_owners[offset],
 					  &perm, 1);
 		if (ret < 0)
-			dev_err(adsp->dev, "unassign memory %d failed\n", offset);
+			dev_err(pas->dev, "unassign memory %d failed\n", offset);
 	}
 }
 
-static int adsp_probe(struct platform_device *pdev)
+static int qcom_pas_probe(struct platform_device *pdev)
 {
-	const struct adsp_data *desc;
-	struct qcom_adsp *adsp;
+	const struct qcom_pas_data *desc;
+	struct qcom_pas *pas;
 	struct rproc *rproc;
 	const char *fw_name, *dtb_fw_name = NULL;
-	const struct rproc_ops *ops = &adsp_ops;
+	const struct rproc_ops *ops = &qcom_pas_ops;
 	int ret;
 
 	desc = of_device_get_match_data(&pdev->dev);
@@ -706,9 +704,9 @@ static int adsp_probe(struct platform_device *pdev)
 	}
 
 	if (desc->minidump_id)
-		ops = &adsp_minidump_ops;
+		ops = &qcom_pas_minidump_ops;
 
-	rproc = devm_rproc_alloc(&pdev->dev, desc->sysmon_name, ops, fw_name, sizeof(*adsp));
+	rproc = devm_rproc_alloc(&pdev->dev, desc->sysmon_name, ops, fw_name, sizeof(*pas));
 
 	if (!rproc) {
 		dev_err(&pdev->dev, "unable to allocate remoteproc\n");
@@ -718,68 +716,65 @@ static int adsp_probe(struct platform_device *pdev)
 	rproc->auto_boot = desc->auto_boot;
 	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
 
-	adsp = rproc->priv;
-	adsp->dev = &pdev->dev;
-	adsp->rproc = rproc;
-	adsp->minidump_id = desc->minidump_id;
-	adsp->pas_id = desc->pas_id;
-	adsp->lite_pas_id = desc->lite_pas_id;
-	adsp->info_name = desc->sysmon_name;
-	adsp->smem_host_id = desc->smem_host_id;
-	adsp->decrypt_shutdown = desc->decrypt_shutdown;
-	adsp->region_assign_idx = desc->region_assign_idx;
-	adsp->region_assign_count = min_t(int, MAX_ASSIGN_COUNT, desc->region_assign_count);
-	adsp->region_assign_vmid = desc->region_assign_vmid;
-	adsp->region_assign_shared = desc->region_assign_shared;
+	pas = rproc->priv;
+	pas->dev = &pdev->dev;
+	pas->rproc = rproc;
+	pas->minidump_id = desc->minidump_id;
+	pas->pas_id = desc->pas_id;
+	pas->lite_pas_id = desc->lite_pas_id;
+	pas->info_name = desc->sysmon_name;
+	pas->smem_host_id = desc->smem_host_id;
+	pas->decrypt_shutdown = desc->decrypt_shutdown;
+	pas->region_assign_idx = desc->region_assign_idx;
+	pas->region_assign_count = min_t(int, MAX_ASSIGN_COUNT, desc->region_assign_count);
+	pas->region_assign_vmid = desc->region_assign_vmid;
+	pas->region_assign_shared = desc->region_assign_shared;
 	if (dtb_fw_name) {
-		adsp->dtb_firmware_name = dtb_fw_name;
-		adsp->dtb_pas_id = desc->dtb_pas_id;
+		pas->dtb_firmware_name = dtb_fw_name;
+		pas->dtb_pas_id = desc->dtb_pas_id;
 	}
-	platform_set_drvdata(pdev, adsp);
+	platform_set_drvdata(pdev, pas);
 
-	ret = device_init_wakeup(adsp->dev, true);
+	ret = device_init_wakeup(pas->dev, true);
 	if (ret)
 		goto free_rproc;
 
-	ret = adsp_alloc_memory_region(adsp);
+	ret = qcom_pas_alloc_memory_region(pas);
 	if (ret)
 		goto free_rproc;
 
-	ret = adsp_assign_memory_region(adsp);
+	ret = qcom_pas_assign_memory_region(pas);
 	if (ret)
 		goto free_rproc;
 
-	ret = adsp_init_clock(adsp);
+	ret = qcom_pas_init_clock(pas);
 	if (ret)
 		goto unassign_mem;
 
-	ret = adsp_init_regulator(adsp);
+	ret = qcom_pas_init_regulator(pas);
 	if (ret)
 		goto unassign_mem;
 
-	ret = adsp_pds_attach(&pdev->dev, adsp->proxy_pds,
-			      desc->proxy_pd_names);
+	ret = qcom_pas_pds_attach(&pdev->dev, pas->proxy_pds, desc->proxy_pd_names);
 	if (ret < 0)
 		goto unassign_mem;
-	adsp->proxy_pd_count = ret;
+	pas->proxy_pd_count = ret;
 
-	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, desc->crash_reason_smem, desc->load_state,
-			     qcom_pas_handover);
+	ret = qcom_q6v5_init(&pas->q6v5, pdev, rproc, desc->crash_reason_smem,
+			     desc->load_state, qcom_pas_handover);
 	if (ret)
 		goto detach_proxy_pds;
 
-	qcom_add_glink_subdev(rproc, &adsp->glink_subdev, desc->ssr_name);
-	qcom_add_smd_subdev(rproc, &adsp->smd_subdev);
-	qcom_add_pdm_subdev(rproc, &adsp->pdm_subdev);
-	adsp->sysmon = qcom_add_sysmon_subdev(rproc,
-					      desc->sysmon_name,
-					      desc->ssctl_id);
-	if (IS_ERR(adsp->sysmon)) {
-		ret = PTR_ERR(adsp->sysmon);
+	qcom_add_glink_subdev(rproc, &pas->glink_subdev, desc->ssr_name);
+	qcom_add_smd_subdev(rproc, &pas->smd_subdev);
+	qcom_add_pdm_subdev(rproc, &pas->pdm_subdev);
+	pas->sysmon = qcom_add_sysmon_subdev(rproc, desc->sysmon_name, desc->ssctl_id);
+	if (IS_ERR(pas->sysmon)) {
+		ret = PTR_ERR(pas->sysmon);
 		goto deinit_remove_pdm_smd_glink;
 	}
 
-	qcom_add_ssr_subdev(rproc, &adsp->ssr_subdev, desc->ssr_name);
+	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
 	ret = rproc_add(rproc);
 	if (ret)
 		goto remove_ssr_sysmon;
@@ -787,41 +782,41 @@ static int adsp_probe(struct platform_device *pdev)
 	return 0;
 
 remove_ssr_sysmon:
-	qcom_remove_ssr_subdev(rproc, &adsp->ssr_subdev);
-	qcom_remove_sysmon_subdev(adsp->sysmon);
+	qcom_remove_ssr_subdev(rproc, &pas->ssr_subdev);
+	qcom_remove_sysmon_subdev(pas->sysmon);
 deinit_remove_pdm_smd_glink:
-	qcom_remove_pdm_subdev(rproc, &adsp->pdm_subdev);
-	qcom_remove_smd_subdev(rproc, &adsp->smd_subdev);
-	qcom_remove_glink_subdev(rproc, &adsp->glink_subdev);
-	qcom_q6v5_deinit(&adsp->q6v5);
+	qcom_remove_pdm_subdev(rproc, &pas->pdm_subdev);
+	qcom_remove_smd_subdev(rproc, &pas->smd_subdev);
+	qcom_remove_glink_subdev(rproc, &pas->glink_subdev);
+	qcom_q6v5_deinit(&pas->q6v5);
 detach_proxy_pds:
-	adsp_pds_detach(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
+	qcom_pas_pds_detach(pas, pas->proxy_pds, pas->proxy_pd_count);
 unassign_mem:
-	adsp_unassign_memory_region(adsp);
+	qcom_pas_unassign_memory_region(pas);
 free_rproc:
-	device_init_wakeup(adsp->dev, false);
+	device_init_wakeup(pas->dev, false);
 
 	return ret;
 }
 
-static void adsp_remove(struct platform_device *pdev)
+static void qcom_pas_remove(struct platform_device *pdev)
 {
-	struct qcom_adsp *adsp = platform_get_drvdata(pdev);
-
-	rproc_del(adsp->rproc);
-
-	qcom_q6v5_deinit(&adsp->q6v5);
-	adsp_unassign_memory_region(adsp);
-	qcom_remove_glink_subdev(adsp->rproc, &adsp->glink_subdev);
-	qcom_remove_sysmon_subdev(adsp->sysmon);
-	qcom_remove_smd_subdev(adsp->rproc, &adsp->smd_subdev);
-	qcom_remove_pdm_subdev(adsp->rproc, &adsp->pdm_subdev);
-	qcom_remove_ssr_subdev(adsp->rproc, &adsp->ssr_subdev);
-	adsp_pds_detach(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
-	device_init_wakeup(adsp->dev, false);
+	struct qcom_pas *pas = platform_get_drvdata(pdev);
+
+	rproc_del(pas->rproc);
+
+	qcom_q6v5_deinit(&pas->q6v5);
+	qcom_pas_unassign_memory_region(pas);
+	qcom_remove_glink_subdev(pas->rproc, &pas->glink_subdev);
+	qcom_remove_sysmon_subdev(pas->sysmon);
+	qcom_remove_smd_subdev(pas->rproc, &pas->smd_subdev);
+	qcom_remove_pdm_subdev(pas->rproc, &pas->pdm_subdev);
+	qcom_remove_ssr_subdev(pas->rproc, &pas->ssr_subdev);
+	qcom_pas_pds_detach(pas, pas->proxy_pds, pas->proxy_pd_count);
+	device_init_wakeup(pas->dev, false);
 }
 
-static const struct adsp_data adsp_resource_init = {
+static const struct qcom_pas_data adsp_resource_init = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
 	.pas_id = 1,
@@ -831,7 +826,7 @@ static const struct adsp_data adsp_resource_init = {
 	.ssctl_id = 0x14,
 };
 
-static const struct adsp_data sa8775p_adsp_resource = {
+static const struct qcom_pas_data sa8775p_adsp_resource = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mbn",
 	.pas_id = 1,
@@ -848,7 +843,7 @@ static const struct adsp_data sa8775p_adsp_resource = {
 	.ssctl_id = 0x14,
 };
 
-static const struct adsp_data sdm845_adsp_resource_init = {
+static const struct qcom_pas_data sdm845_adsp_resource_init = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
 	.pas_id = 1,
@@ -859,7 +854,7 @@ static const struct adsp_data sdm845_adsp_resource_init = {
 	.ssctl_id = 0x14,
 };
 
-static const struct adsp_data sm6350_adsp_resource = {
+static const struct qcom_pas_data sm6350_adsp_resource = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
 	.pas_id = 1,
@@ -875,7 +870,7 @@ static const struct adsp_data sm6350_adsp_resource = {
 	.ssctl_id = 0x14,
 };
 
-static const struct adsp_data sm6375_mpss_resource = {
+static const struct qcom_pas_data sm6375_mpss_resource = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
 	.pas_id = 4,
@@ -890,7 +885,7 @@ static const struct adsp_data sm6375_mpss_resource = {
 	.ssctl_id = 0x12,
 };
 
-static const struct adsp_data sm8150_adsp_resource = {
+static const struct qcom_pas_data sm8150_adsp_resource = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
 	.pas_id = 1,
@@ -905,7 +900,7 @@ static const struct adsp_data sm8150_adsp_resource = {
 	.ssctl_id = 0x14,
 };
 
-static const struct adsp_data sm8250_adsp_resource = {
+static const struct qcom_pas_data sm8250_adsp_resource = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
 	.pas_id = 1,
@@ -922,7 +917,7 @@ static const struct adsp_data sm8250_adsp_resource = {
 	.ssctl_id = 0x14,
 };
 
-static const struct adsp_data sm8350_adsp_resource = {
+static const struct qcom_pas_data sm8350_adsp_resource = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
 	.pas_id = 1,
@@ -938,7 +933,7 @@ static const struct adsp_data sm8350_adsp_resource = {
 	.ssctl_id = 0x14,
 };
 
-static const struct adsp_data msm8996_adsp_resource = {
+static const struct qcom_pas_data msm8996_adsp_resource = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
 	.pas_id = 1,
@@ -952,7 +947,7 @@ static const struct adsp_data msm8996_adsp_resource = {
 	.ssctl_id = 0x14,
 };
 
-static const struct adsp_data cdsp_resource_init = {
+static const struct qcom_pas_data cdsp_resource_init = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 18,
@@ -962,7 +957,7 @@ static const struct adsp_data cdsp_resource_init = {
 	.ssctl_id = 0x17,
 };
 
-static const struct adsp_data sa8775p_cdsp0_resource = {
+static const struct qcom_pas_data sa8775p_cdsp0_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp0.mbn",
 	.pas_id = 18,
@@ -980,7 +975,7 @@ static const struct adsp_data sa8775p_cdsp0_resource = {
 	.ssctl_id = 0x17,
 };
 
-static const struct adsp_data sa8775p_cdsp1_resource = {
+static const struct qcom_pas_data sa8775p_cdsp1_resource = {
 	.crash_reason_smem = 633,
 	.firmware_name = "cdsp1.mbn",
 	.pas_id = 30,
@@ -998,7 +993,7 @@ static const struct adsp_data sa8775p_cdsp1_resource = {
 	.ssctl_id = 0x20,
 };
 
-static const struct adsp_data sdm845_cdsp_resource_init = {
+static const struct qcom_pas_data sdm845_cdsp_resource_init = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 18,
@@ -1009,7 +1004,7 @@ static const struct adsp_data sdm845_cdsp_resource_init = {
 	.ssctl_id = 0x17,
 };
 
-static const struct adsp_data sm6350_cdsp_resource = {
+static const struct qcom_pas_data sm6350_cdsp_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 18,
@@ -1025,7 +1020,7 @@ static const struct adsp_data sm6350_cdsp_resource = {
 	.ssctl_id = 0x17,
 };
 
-static const struct adsp_data sm8150_cdsp_resource = {
+static const struct qcom_pas_data sm8150_cdsp_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 18,
@@ -1040,7 +1035,7 @@ static const struct adsp_data sm8150_cdsp_resource = {
 	.ssctl_id = 0x17,
 };
 
-static const struct adsp_data sm8250_cdsp_resource = {
+static const struct qcom_pas_data sm8250_cdsp_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 18,
@@ -1055,7 +1050,7 @@ static const struct adsp_data sm8250_cdsp_resource = {
 	.ssctl_id = 0x17,
 };
 
-static const struct adsp_data sc8280xp_nsp0_resource = {
+static const struct qcom_pas_data sc8280xp_nsp0_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 18,
@@ -1069,7 +1064,7 @@ static const struct adsp_data sc8280xp_nsp0_resource = {
 	.ssctl_id = 0x17,
 };
 
-static const struct adsp_data sc8280xp_nsp1_resource = {
+static const struct qcom_pas_data sc8280xp_nsp1_resource = {
 	.crash_reason_smem = 633,
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 30,
@@ -1083,7 +1078,7 @@ static const struct adsp_data sc8280xp_nsp1_resource = {
 	.ssctl_id = 0x20,
 };
 
-static const struct adsp_data x1e80100_adsp_resource = {
+static const struct qcom_pas_data x1e80100_adsp_resource = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
 	.dtb_firmware_name = "adsp_dtb.mdt",
@@ -1103,7 +1098,7 @@ static const struct adsp_data x1e80100_adsp_resource = {
 	.ssctl_id = 0x14,
 };
 
-static const struct adsp_data x1e80100_cdsp_resource = {
+static const struct qcom_pas_data x1e80100_cdsp_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
 	.dtb_firmware_name = "cdsp_dtb.mdt",
@@ -1123,7 +1118,7 @@ static const struct adsp_data x1e80100_cdsp_resource = {
 	.ssctl_id = 0x17,
 };
 
-static const struct adsp_data sm8350_cdsp_resource = {
+static const struct qcom_pas_data sm8350_cdsp_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 18,
@@ -1140,7 +1135,7 @@ static const struct adsp_data sm8350_cdsp_resource = {
 	.ssctl_id = 0x17,
 };
 
-static const struct adsp_data sa8775p_gpdsp0_resource = {
+static const struct qcom_pas_data sa8775p_gpdsp0_resource = {
 	.crash_reason_smem = 640,
 	.firmware_name = "gpdsp0.mbn",
 	.pas_id = 39,
@@ -1157,7 +1152,7 @@ static const struct adsp_data sa8775p_gpdsp0_resource = {
 	.ssctl_id = 0x21,
 };
 
-static const struct adsp_data sa8775p_gpdsp1_resource = {
+static const struct qcom_pas_data sa8775p_gpdsp1_resource = {
 	.crash_reason_smem = 641,
 	.firmware_name = "gpdsp1.mbn",
 	.pas_id = 40,
@@ -1174,7 +1169,7 @@ static const struct adsp_data sa8775p_gpdsp1_resource = {
 	.ssctl_id = 0x22,
 };
 
-static const struct adsp_data mpss_resource_init = {
+static const struct qcom_pas_data mpss_resource_init = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
 	.pas_id = 4,
@@ -1191,7 +1186,7 @@ static const struct adsp_data mpss_resource_init = {
 	.ssctl_id = 0x12,
 };
 
-static const struct adsp_data sc8180x_mpss_resource = {
+static const struct qcom_pas_data sc8180x_mpss_resource = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
 	.pas_id = 4,
@@ -1206,7 +1201,7 @@ static const struct adsp_data sc8180x_mpss_resource = {
 	.ssctl_id = 0x12,
 };
 
-static const struct adsp_data msm8996_slpi_resource_init = {
+static const struct qcom_pas_data msm8996_slpi_resource_init = {
 	.crash_reason_smem = 424,
 	.firmware_name = "slpi.mdt",
 	.pas_id = 12,
@@ -1220,7 +1215,7 @@ static const struct adsp_data msm8996_slpi_resource_init = {
 	.ssctl_id = 0x16,
 };
 
-static const struct adsp_data sdm845_slpi_resource_init = {
+static const struct qcom_pas_data sdm845_slpi_resource_init = {
 	.crash_reason_smem = 424,
 	.firmware_name = "slpi.mdt",
 	.pas_id = 12,
@@ -1236,7 +1231,7 @@ static const struct adsp_data sdm845_slpi_resource_init = {
 	.ssctl_id = 0x16,
 };
 
-static const struct adsp_data wcss_resource_init = {
+static const struct qcom_pas_data wcss_resource_init = {
 	.crash_reason_smem = 421,
 	.firmware_name = "wcnss.mdt",
 	.pas_id = 6,
@@ -1246,7 +1241,7 @@ static const struct adsp_data wcss_resource_init = {
 	.ssctl_id = 0x12,
 };
 
-static const struct adsp_data sdx55_mpss_resource = {
+static const struct qcom_pas_data sdx55_mpss_resource = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
 	.pas_id = 4,
@@ -1261,7 +1256,7 @@ static const struct adsp_data sdx55_mpss_resource = {
 	.ssctl_id = 0x22,
 };
 
-static const struct adsp_data sm8450_mpss_resource = {
+static const struct qcom_pas_data sm8450_mpss_resource = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
 	.pas_id = 4,
@@ -1279,7 +1274,7 @@ static const struct adsp_data sm8450_mpss_resource = {
 	.ssctl_id = 0x12,
 };
 
-static const struct adsp_data sm8550_adsp_resource = {
+static const struct qcom_pas_data sm8550_adsp_resource = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
 	.dtb_firmware_name = "adsp_dtb.mdt",
@@ -1299,7 +1294,7 @@ static const struct adsp_data sm8550_adsp_resource = {
 	.smem_host_id = 2,
 };
 
-static const struct adsp_data sm8550_cdsp_resource = {
+static const struct qcom_pas_data sm8550_cdsp_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
 	.dtb_firmware_name = "cdsp_dtb.mdt",
@@ -1320,7 +1315,7 @@ static const struct adsp_data sm8550_cdsp_resource = {
 	.smem_host_id = 5,
 };
 
-static const struct adsp_data sm8550_mpss_resource = {
+static const struct qcom_pas_data sm8550_mpss_resource = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
 	.dtb_firmware_name = "modem_dtb.mdt",
@@ -1344,7 +1339,7 @@ static const struct adsp_data sm8550_mpss_resource = {
 	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
 };
 
-static const struct adsp_data sc7280_wpss_resource = {
+static const struct qcom_pas_data sc7280_wpss_resource = {
 	.crash_reason_smem = 626,
 	.firmware_name = "wpss.mdt",
 	.pas_id = 6,
@@ -1361,7 +1356,7 @@ static const struct adsp_data sc7280_wpss_resource = {
 	.ssctl_id = 0x19,
 };
 
-static const struct adsp_data sm8650_cdsp_resource = {
+static const struct qcom_pas_data sm8650_cdsp_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
 	.dtb_firmware_name = "cdsp_dtb.mdt",
@@ -1386,7 +1381,7 @@ static const struct adsp_data sm8650_cdsp_resource = {
 	.region_assign_vmid = QCOM_SCM_VMID_CDSP,
 };
 
-static const struct adsp_data sm8650_mpss_resource = {
+static const struct qcom_pas_data sm8650_mpss_resource = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
 	.dtb_firmware_name = "modem_dtb.mdt",
@@ -1410,7 +1405,7 @@ static const struct adsp_data sm8650_mpss_resource = {
 	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
 };
 
-static const struct adsp_data sm8750_mpss_resource = {
+static const struct qcom_pas_data sm8750_mpss_resource = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
 	.dtb_firmware_name = "modem_dtb.mdt",
@@ -1434,7 +1429,7 @@ static const struct adsp_data sm8750_mpss_resource = {
 	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
 };
 
-static const struct of_device_id adsp_of_match[] = {
+static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,msm8226-adsp-pil", .data = &msm8996_adsp_resource},
 	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource},
 	{ .compatible = "qcom,msm8974-adsp-pil", .data = &adsp_resource_init},
@@ -1504,17 +1499,17 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,x1e80100-cdsp-pas", .data = &x1e80100_cdsp_resource},
 	{ },
 };
-MODULE_DEVICE_TABLE(of, adsp_of_match);
+MODULE_DEVICE_TABLE(of, qcom_pas_of_match);
 
-static struct platform_driver adsp_driver = {
-	.probe = adsp_probe,
-	.remove = adsp_remove,
+static struct platform_driver qcom_pas_driver = {
+	.probe = qcom_pas_probe,
+	.remove = qcom_pas_remove,
 	.driver = {
 		.name = "qcom_q6v5_pas",
-		.of_match_table = adsp_of_match,
+		.of_match_table = qcom_pas_of_match,
 	},
 };
 
-module_platform_driver(adsp_driver);
-MODULE_DESCRIPTION("Qualcomm Hexagon v5 Peripheral Authentication Service driver");
+module_platform_driver(qcom_pas_driver);
+MODULE_DESCRIPTION("Qualcomm Peripheral Authentication Service remoteproc driver");
 MODULE_LICENSE("GPL v2");

---
base-commit: a0bea9e39035edc56a994630e6048c8a191a99d8
change-id: 20250605-pas-rename-7f69f1ff1ff5

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


