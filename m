Return-Path: <linux-arm-msm+bounces-62157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11092AE5C87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 08:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3CAB07B2DD1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 06:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77082561C5;
	Tue, 24 Jun 2025 06:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i0c4z4eE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E25253950
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750745130; cv=none; b=csjNMl+250Hn8fTOZDEaFVTKXmbZaM1EVRchviq1zXQzNBpomQO3cvbYMF8XS8vyqAv8V9E6OMFc3E6FB7aL/idtPvpsndktewbg5T4W+028E3inA8oINbaxADutIoZwSPNhYY9EmK0Pq3XKPutr3xTgBaw4rMxQYe3OD2x/6dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750745130; c=relaxed/simple;
	bh=VBK9JtAr3FmFIut3GYFMz/furBThoh2UTUTxdAFQcD0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A/ZviomP7WxWgkt5SCeR6mBx9ROam4oFZQupk9d52Q99XKSsv4LEMMXC+fv6T0zzWANKZydl/ojWCR6P5ID6uJ3sEhgr+Qkdz8gVijaatutSgCj7KPGXxOoySVzLHfm/5vS7jBASOc4dv18XDzQwF7wgQXpgStaYxF6muWmk8YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i0c4z4eE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NKl8QZ012117
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:05:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lDdOYdwFc4W
	UgEUqvI2QS/sAK9B8E5IgVNSudMM9Bh8=; b=i0c4z4eEl78Km1aLtMy5ImC4Sr4
	SBbO/iWZPsABX7YYWZxjQAGNjmoi5P6NSVRaIa4c+NhlLjfDkvdwnkXaN4CJ/FOd
	41dM0cDx91dOE4QG95OtiikmB+0Tzi2AF26Eu2/G8NlwGqbN4LuPzbGuC8KBO+JQ
	QlMdybB+cr/FvFhFoqRX2NDXlS2U7rtWErF1xtb0TbicLGDctlsiDcczsUplOB9X
	CfCVtZ6kURwyE/Y5wBOTyCP6xT+Rn+SAIYwn7J/cpr01bWHPqCPFP0Ru3TGVQg77
	92Me4yw+n9Wg7z9z2WnNuCZtm/PoR98v3obKCh6ezschd7jYP4whKOo3oNg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1sfej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:05:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235f77f86f6so49214015ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 23:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745125; x=1751349925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lDdOYdwFc4WUgEUqvI2QS/sAK9B8E5IgVNSudMM9Bh8=;
        b=rPuUht67fBRMK9FgBZTpxgeobWBH6i3cj+76YD05PyGhsTsHICIk9q9V+OA1xVQ+vM
         4HNGRGY0Aa2piFLW/G6jc623QY2NolT7iedcCcJfhCsW/iIhNGPSe55zYefQ0INUEUOT
         4dFNtqJMc5klBXIV/CgrzX+CeH8st1R/kPVn//FOVy0ALev3uPL6AjJdiTkxsqe5vfRz
         HPHL9TIjTvglWTAA+g24F+6IMqyWay+bN5tdY679HnMrStICuJxTQl1xnv3mNkADuSrK
         gjy9dWGoP27JtpWPT6fdrx2nWZz11vNhksmFWIG3xjhzcGk29k00FCVakv5Cra0yqRJ4
         UiSg==
X-Forwarded-Encrypted: i=1; AJvYcCWl3acklRjVtIzWtM8mCy8t/a0kSnEiWtdnMucGgoTu0tbnJJBpfWhFNCb6XJIdh8CvRYJRTnV58EeEJZY6@vger.kernel.org
X-Gm-Message-State: AOJu0YwYKn+gYqH3anVvx7KRxgAnv01NyUHxDcZjXH5dWGIS72BhuECY
	fIqx/QaVVjiCPFrFR/fY5CZlbH5JlpSAd7+gZ1NjxN26HEkvZyJiysR32YOJP+6r/7zKoqYyisl
	9OWYkQnXbV8hdEjZHkTnmgeS6QJ2CovHal9OGV+d05+sGyR8YZCrZ3zWJZfRPu5O3rNR7
X-Gm-Gg: ASbGncud/tY96t6YajtFkbk4dyYarI2tq91BwB3tdfxx686vx7LUPbkja+5gBnTCYN5
	ruifEYTuCHDbCMiyWmDLUSWjCHqC6SJ6KNtqT4L6bTCCCaRsn4phPUvBU12I7y/RuGoEloekrH8
	Xg7h6FPqI/s3m2zJ2QYE77nIB5C0sdCEkHZitJzmdhOGfyppr2prpqjRBzWUiuhskBrP3MeEuTr
	MwexK5k+GuqX+Mz23ApL2nI4WMGGYewOaFzQIHrek9dazeTaAtZZS/E/YSFGe9MtymneJa9QID5
	cQnSU1+MEbhPZzz/9JEvYYY460MAIaMqNB12KnfZ4iCG0ty1Uia1xx0BgTBBXXi95hI2Jr0wiWc
	+Ig==
X-Received: by 2002:a17:903:4b07:b0:234:8eeb:d834 with SMTP id d9443c01a7336-237d97fbc8fmr248546125ad.16.1750745125072;
        Mon, 23 Jun 2025 23:05:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJSsLPuqK7+6S2VP4lZAltQqpakLws2gPXkMkL3c6Beh8EhGPZyr249GoBMsvm7A/2zAVDFQ==
X-Received: by 2002:a17:903:4b07:b0:234:8eeb:d834 with SMTP id d9443c01a7336-237d97fbc8fmr248545765ad.16.1750745124642;
        Mon, 23 Jun 2025 23:05:24 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83937b1sm101371455ad.52.2025.06.23.23.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:05:23 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jie.gan@oss.qualcomm.com
Subject: [PATCH v3 09/10] coresight: tmc: add read function for byte-cntr
Date: Tue, 24 Jun 2025 14:04:37 +0800
Message-Id: <20250624060438.7469-10-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
References: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685a4026 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=56IJ4eEW6NAC_NOVRZQA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: hTsTDl9N5kkAxULX6ThJjYCTMXiKIzzI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1MSBTYWx0ZWRfX3lUPL1diZwXe
 wfTQXq4YBGMNNLHo6qF0wJPJXAVerwrhAzu3rGqRN01GpvU1DBY1K+RjUIas9qYTe83htVlwlDW
 gEDcTzpL8MrhMKuOgyx403hwxr/xSSbmOdsKpjq/IEmm6+wkKKuAbz6S56y2e1+78njosuE/hQ/
 8TpI0+TxCM29tEYji6xEClalaPcsBovJuVZXw/qwOKHDe9ljlW3dB194S+08T9ExTALNeCf6S5i
 nkzyqR0Epjrdb8TFnS8uM/e0flAeeb0cVBXWP0uCFvDXSjI2til++y/eAiIY/b9bt1XYpasONQw
 DIkV5PBPgt5D9ozL8LR4X8JKPMnCgSChg25C5z41L2Nz7EQXFxIOhdM9BpU2irUTJNx/xpkKetX
 PUp4ZVGp4V1sTqJ7TEUHsAQBstvkTaPtPaaAVvmETrJHFYv/STX5U1/ajlGZ7Vjeq89bG6Sf
X-Proofpoint-ORIG-GUID: hTsTDl9N5kkAxULX6ThJjYCTMXiKIzzI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240051

The byte-cntr read function always reads trace data from the deactivated
and filled buffer which is already synced. The read function will fail
when the ETR cannot find a available buffer to receive trace data.

The read function terminates when the path is disabled or interrupted by a
signal.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-core.c  | 31 ++++++-
 .../hwtracing/coresight/coresight-tmc-etr.c   | 90 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h   |  4 +-
 3 files changed, 120 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 40605310240d..7b09cf060666 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -317,14 +317,18 @@ static int tmc_open(struct inode *inode, struct file *file)
 	return 0;
 }
 
-static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
-				   char **bufpp)
+static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata,
+				   struct ctcu_byte_cntr *byte_cntr_data,
+				   loff_t pos, size_t len, char **bufpp)
 {
 	switch (drvdata->config_type) {
 	case TMC_CONFIG_TYPE_ETB:
 	case TMC_CONFIG_TYPE_ETF:
 		return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
 	case TMC_CONFIG_TYPE_ETR:
+		if (byte_cntr_data && byte_cntr_data->thresh_val)
+			return tmc_byte_cntr_get_data(drvdata, byte_cntr_data, len, bufpp);
+
 		return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
 	}
 
@@ -338,7 +342,21 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
 	ssize_t actual;
 	struct tmc_drvdata *drvdata = container_of(file->private_data,
 						   struct tmc_drvdata, miscdev);
-	actual = tmc_get_sysfs_trace(drvdata, *ppos, len, &bufp);
+	struct coresight_device *helper = coresight_get_helper(drvdata->csdev,
+						CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
+	struct ctcu_byte_cntr *byte_cntr_data = NULL;
+	struct ctcu_drvdata *ctcu_drvdata = NULL;
+	int port;
+
+	if (helper) {
+		port = coresight_get_port_helper(drvdata->csdev, helper);
+		if (port >= 0) {
+			ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
+			byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
+		}
+	}
+
+	actual = tmc_get_sysfs_trace(drvdata, byte_cntr_data, *ppos, len, &bufp);
 	if (actual <= 0)
 		return 0;
 
@@ -348,7 +366,12 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
 		return -EFAULT;
 	}
 
-	*ppos += actual;
+	if (byte_cntr_data && byte_cntr_data->thresh_val) {
+		byte_cntr_data->total_size += actual;
+		drvdata->reading_node->pos += actual;
+	} else
+		*ppos += actual;
+
 	dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
 
 	return actual;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 3e3e1b5e78ca..8f53ecb12ad3 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1163,6 +1163,10 @@ ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
 	ssize_t actual = len;
 	struct etr_buf *etr_buf = drvdata->sysfs_buf;
 
+	/* Reading the buf defind in buf_node if it exists*/
+	if (drvdata->reading_node)
+		etr_buf = drvdata->reading_node->sysfs_buf;
+
 	if (pos + actual > etr_buf->len)
 		actual = etr_buf->len - pos;
 	if (actual <= 0)
@@ -1339,6 +1343,92 @@ static bool tmc_byte_cntr_switch_buffer(struct tmc_drvdata *drvdata,
 	return found_free_buf;
 }
 
+/*
+ * tmc_byte_cntr_get_data() - reads data from the deactived and filled buffer.
+ * The byte-cntr reading work reads data from the deactived and filled buffer.
+ * The read operation waits for a buffer to become available, either filled or
+ * upon timeout, and then reads trace data from the synced buffer.
+ */
+ssize_t tmc_byte_cntr_get_data(struct tmc_drvdata *drvdata,
+			       struct ctcu_byte_cntr *byte_cntr_data,
+			       size_t len, char **bufpp)
+{
+	size_t thresh_val = byte_cntr_data->thresh_val;
+	atomic_t *irq_cnt = &byte_cntr_data->irq_cnt;
+	struct etr_buf *sysfs_buf = drvdata->sysfs_buf;
+	struct device *dev = &drvdata->csdev->dev;
+	struct etr_buf_node *nd, *next;
+	ssize_t size = sysfs_buf->size;
+	ssize_t actual;
+	loff_t pos;
+	int ret;
+
+wait_buffer:
+	if (!byte_cntr_data->reading_buf) {
+		ret = wait_event_interruptible_timeout(byte_cntr_data->wq,
+				((atomic_read(irq_cnt) + 1) * thresh_val >= size) ||
+				!byte_cntr_data->enable,
+				BYTE_CNTR_TIMEOUT);
+		if (ret < 0)
+			return ret;
+		/*
+		 * The current etr_buf is almost full or timeout is triggered,
+		 * so switch the buffer and mark the switched buffer as reading.
+		 */
+		if (byte_cntr_data->enable) {
+			if (!tmc_byte_cntr_switch_buffer(drvdata, byte_cntr_data)) {
+				dev_err(dev, "Switch buffer failed for byte-cntr\n");
+				return -EINVAL;
+			}
+
+			byte_cntr_data->reading_buf = true;
+		} else {
+			if (!drvdata->reading_node) {
+				list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, node) {
+					if (nd->sysfs_buf == sysfs_buf) {
+						nd->pos = 0;
+						drvdata->reading_node = nd;
+						break;
+					}
+				}
+			}
+
+			pos = drvdata->reading_node->pos;
+			actual = tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
+			if (actual > 0)
+				return actual;
+
+			drvdata->reading_node = NULL;
+
+			/* Exit byte-cntr reading */
+			return -EINVAL;
+		}
+	}
+
+	/* Check the status of current etr_buf*/
+	if ((atomic_read(irq_cnt) + 1) * thresh_val >= size)
+		/*
+		 * Unlikely to find a free buffer to switch, so just disable
+		 * the ETR for a while.
+		 */
+		if (!tmc_byte_cntr_switch_buffer(drvdata, byte_cntr_data))
+			dev_info(dev, "No available buffer to store data, disable ETR\n");
+
+	pos = drvdata->reading_node->pos;
+	actual = tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
+	if (actual == 0) {
+		/* Reading work for marked buffer has finished, reset flags */
+		drvdata->reading_node->reading = false;
+		byte_cntr_data->reading_buf = false;
+		drvdata->reading_node = NULL;
+
+		/* Nothing in the buffer, wait for next buffer to be filled */
+		goto wait_buffer;
+	}
+
+	return actual;
+}
+
 static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
 {
 	int ret = 0;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index f95df0a34ad6..4136ec5ecaf7 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -364,7 +364,9 @@ int tmc_read_prepare_byte_cntr(struct tmc_drvdata *drvdata,
 			       struct ctcu_byte_cntr *byte_cntr_data);
 int tmc_read_unprepare_byte_cntr(struct tmc_drvdata *drvdata,
 				 struct ctcu_byte_cntr *byte_cntr_data);
-
+ssize_t tmc_byte_cntr_get_data(struct tmc_drvdata *drvdata,
+			       struct ctcu_byte_cntr *byte_cntr_data,
+			       size_t len, char **bufpp);
 
 #define TMC_REG_PAIR(name, lo_off, hi_off)				\
 static inline u64							\
-- 
2.34.1


