Return-Path: <linux-arm-msm+bounces-53090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCA3A7A258
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 14:03:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECC9216B481
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 12:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C708B1F8720;
	Thu,  3 Apr 2025 12:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjRPxtPs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9F21EF0B6
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Apr 2025 12:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743681806; cv=none; b=isFpckvfbYpVeo3nMgo0XtVq1cMtP9jqNAeHc0hNRNcZarJsXzvDd5wBO6DsnKzvlkojgluv50+Tqbcvun3UlZ6/ANvPwuZbnaM5Lwt7zm6gSKayHaAGDu8x9Inwl4yc901T/YAGN5/eosm512TssFAnnTSRhzc7QHXrORwryT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743681806; c=relaxed/simple;
	bh=oeBbHysQJp1Mmip5OjUa/9Nw0SUg/fti5tPQScP/+xM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eF9vYEZv/CaFcwjiiGJbdLkDTKE2pDvz/f3YAI8ALdHfZvc4V20KJ2cIord7WtAPgP2pqnjRP0udCvXbPLhNrHoqBklMeMlen+6W70OfWAOWS2EfTUZb3XgGS1FM64LL6xjIOlFROPyxlfuCgDWlWyj87naMvodHo8+y/8+M4mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjRPxtPs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5339s9UG025727
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Apr 2025 12:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7bfSjsZYsRD
	RwNcOw2Hf/c03MW0n8kSdzSQu2HTFO/c=; b=UjRPxtPsbiRxwLAtTIBC4HbPIbb
	tUQLL9FH6OrV2e6FtgzVyg4PnHHJUq9t5DNQPHKi2EkHDTY2UOL2VwmgtLJq3fXz
	7MYU5IMkVAo9V61MVC9BC4lgy1PhfjpEb4kwk5N5Gae4OaZoGn4iZeNDV1/s8NAk
	r3nZNbZ3iAoXRkFllFxg5NHzuDP+kRan4d0WkiWhb+3CbEPgknkCLToo4Q2bDw1b
	KevzTthMKXJ3duO/SaU7kguFT0prvQa3cm/YzAPNkZ5obf2PLlf3uW7yQv4z0THF
	vavkTmuvKMeHU2DSoZUnJ1nGQCJwNjDvkNhdPg1e76UPmINuSgmEq4c6+MA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ruadvxxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 12:03:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff58318acaso1454677a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 05:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743681803; x=1744286603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7bfSjsZYsRDRwNcOw2Hf/c03MW0n8kSdzSQu2HTFO/c=;
        b=jQwhjD7x05rzBewBKAnzmKqQKthMDSsOIaU6H/ZUw+3eLUmttoROSD8qV6vsepptq5
         ySXQCp5nck1qZNOxEQiAm9JnLzT5Z/3K/KaSLhZfAMOpgD5QEUcckI47Fg4Rb5UqFlE6
         bPp7U7R5Hdnx1NTg4WURlThRPu83NGJBzFDHFtjvhS/1YjRPoV0JAWYwKpnCWvREwUur
         bDAltNLg6LJrYmKsazBcS3gvY9quxidVukKJ2/0jFOYP9SwrB/X36JS4e48GmcwDFVob
         Od5JSHapJkgOTemUMqzgg7THy/fH+qVPSkxU448VunAOrnFBpSo8qbQusrjufsennuqD
         ovVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmwATqqCwl8qapAA7AWen8LoeteW+aguCIPkvAL/y0AiiYJzFTSoHyGuO0/lI2huBY9d4mK8DsphzQIOy3@vger.kernel.org
X-Gm-Message-State: AOJu0YywOWQnDg+uQliTkJABT0Cb8BSgE1Fq+yqUyXBNfU626ZMy2Vbo
	Ey847QJmF892Lul2zGa681KwHAvx3jutIHvxXqdXUhLD3j7MN5GYeKEyaZS2GpLrGVqn9uuuhc7
	stOHIUVeeWBnHA52xQrOXH2zqEvDIuM2qd8qaANkFA03jGohoLrpAF2Kw1IVjdeuv
X-Gm-Gg: ASbGncuhAKv65wM7sD7qLNH02FpbZlHMZy4vpRmiUUSSLTo1X2pt8OoWCDytBdkjDm5
	DlaujLsZ6lQjMJ9Uglyth1iYlnCM28NQXG/ytPNFvipTrAvI60mRcM6ULDQ/U8bHCU/lh+FdCLl
	t2RBUtJT+fwGm3KnaxKWusNd3nHyBurm7VnFsGLwJupC4tx6+g+KfJsSW4sjfqlEsRuTG8R/ewI
	bfP5GsrDaIFatwGGAmPxLqVY1p/8aoHLwDJ84ayTXfXEPvifOxM1w388GhhxzFZe14F/+5NUtkC
	LW8FAfIaQ6jkLAtTxxWTn2oe0NIj9Xpjn4hEgKMK0Qrczf9dFBVdebjVH5O0980P10LPclydizV
	9UNBRT8vaY+mTJTn87hTLdOAWzkRXeeT2MAuX53s=
X-Received: by 2002:a17:90b:51c5:b0:2fc:3264:3657 with SMTP id 98e67ed59e1d1-30531e89d22mr34677859a91.0.1743681802617;
        Thu, 03 Apr 2025 05:03:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzFISilPnrajtJVIVve5Zji5cWp6B/YIT0C3CtDEsZkdMh3jxamUFw4lamj/h+Ps8MmIiDZw==
X-Received: by 2002:a17:90b:51c5:b0:2fc:3264:3657 with SMTP id 98e67ed59e1d1-30531e89d22mr34677800a91.0.1743681802127;
        Thu, 03 Apr 2025 05:03:22 -0700 (PDT)
Received: from hu-gokulsri-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305827d710csm1285799a91.10.2025.04.03.05.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:03:21 -0700 (PDT)
From: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com,
        gokul.sriram.p@oss.qualcomm.com
Subject: [PATCH V4 3/8] remoteproc: qcom: add hexagon based WCSS secure PIL driver
Date: Thu,  3 Apr 2025 17:32:59 +0530
Message-Id: <20250403120304.2345677-4-gokul.sriram.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250403120304.2345677-1-gokul.sriram.p@oss.qualcomm.com>
References: <20250403120304.2345677-1-gokul.sriram.p@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VI/dn8PX c=1 sm=1 tr=0 ts=67ee790b cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=r4plcOBkgveba4xxPIQA:9 a=RVmHIydaz68A:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: QWQp-B6VsTZSSIp09f0H5fMkX-zKc665
X-Proofpoint-GUID: QWQp-B6VsTZSSIp09f0H5fMkX-zKc665
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_05,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030050

From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>

Add support to bring up hexagon based WCSS using secure PIL. All IPQxxxx
SoCs support secure Peripheral Image Loading (PIL).

Secure PIL image is signed firmware image which only trusted software such
as TrustZone (TZ) can authenticate and load. Linux kernel will send a
Peripheral Authentication Service (PAS) request to TZ to authenticate and
load the PIL images. This change also introduces secure firmware
authentication using Trusted Management Engine-Lite (TME-L) which is
supported on IPQ5424 SoC. This driver uses mailbox based PAS request to
TME-L for image authentication if supported, else it will fallback to use
SCM call based PAS request to TZ.

In order to avoid overloading the existing WCSS driver or PAS driver, we
came up with this new PAS based IPQ WCSS driver.

Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
---
 drivers/remoteproc/Kconfig              |  19 ++
 drivers/remoteproc/Makefile             |   1 +
 drivers/remoteproc/qcom_q6v5_wcss_sec.c | 399 ++++++++++++++++++++++++
 include/linux/remoteproc.h              |   2 +
 4 files changed, 421 insertions(+)
 create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 83962a114dc9..656cbb12b54d 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -255,6 +255,25 @@ config QCOM_Q6V5_WCSS
 	  Hexagon V5 based WCSS remote processors on e.g. IPQ8074.  This is
 	  a non-TrustZone wireless subsystem.
 
+config QCOM_Q6V5_WCSS_SEC
+	tristate "Qualcomm Hexagon based WCSS Secure Peripheral Image Loader"
+	depends on OF && ARCH_QCOM
+	depends on QCOM_SMEM
+	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
+	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
+	select QCOM_MDT_LOADER
+	select QCOM_PIL_INFO
+	select QCOM_Q6V5_COMMON
+	select QCOM_RPROC_COMMON
+	select QCOM_SCM
+	help
+	  Say y here to support the Qualcomm Secure Peripheral Image Loader
+	  for the Hexagon based remote processors on e.g. IPQ5332.
+
+	  This is TrustZone wireless subsystem. The firmware is
+	  verified and booted with the help of the Peripheral Authentication
+	  System (PAS) in TrustZone.
+
 config QCOM_SYSMON
 	tristate "Qualcomm sysmon driver"
 	depends on RPMSG
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 5ff4e2fee4ab..d4971b672812 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_QCOM_Q6V5_ADSP)		+= qcom_q6v5_adsp.o
 obj-$(CONFIG_QCOM_Q6V5_MSS)		+= qcom_q6v5_mss.o
 obj-$(CONFIG_QCOM_Q6V5_PAS)		+= qcom_q6v5_pas.o
 obj-$(CONFIG_QCOM_Q6V5_WCSS)		+= qcom_q6v5_wcss.o
+obj-$(CONFIG_QCOM_Q6V5_WCSS_SEC)	+= qcom_q6v5_wcss_sec.o
 obj-$(CONFIG_QCOM_SYSMON)		+= qcom_sysmon.o
 obj-$(CONFIG_QCOM_WCNSS_PIL)		+= qcom_wcnss_pil.o
 qcom_wcnss_pil-y			+= qcom_wcnss.o
diff --git a/drivers/remoteproc/qcom_q6v5_wcss_sec.c b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
new file mode 100644
index 000000000000..30422c6c982d
--- /dev/null
+++ b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
@@ -0,0 +1,399 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2016-2018 Linaro Ltd.
+ * Copyright (C) 2014 Sony Mobile Communications AB
+ * Copyright (c) 2012-2018 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#include <linux/clk.h>
+#include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/io.h>
+#include <linux/mailbox_client.h>
+#include <linux/mailbox/tmelcom-qmp.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/soc/qcom/mdt_loader.h>
+
+#include "qcom_common.h"
+#include "qcom_q6v5.h"
+#include "qcom_pil_info.h"
+
+#define WCSS_CRASH_REASON		421
+
+#define WCSS_PAS_ID			0x6
+#define MPD_WCSS_PAS_ID			0xd
+
+#define Q6_WAIT_TIMEOUT			(5 * HZ)
+
+struct wcss_sec {
+	struct device *dev;
+	struct qcom_rproc_glink glink_subdev;
+	struct qcom_rproc_ssr ssr_subdev;
+	struct qcom_q6v5 q6;
+	phys_addr_t mem_phys;
+	phys_addr_t mem_reloc;
+	void *mem_region;
+	size_t mem_size;
+	const struct wcss_data *desc;
+
+	struct mbox_client mbox_client;
+	struct mbox_chan *mbox_chan;
+	void *metadata;
+	size_t metadata_len;
+};
+
+struct wcss_data {
+	u32 pasid;
+	const char *ss_name;
+	bool auto_boot;
+	bool tmelcom;
+};
+
+static int wcss_sec_start(struct rproc *rproc)
+{
+	struct wcss_sec *wcss = rproc->priv;
+	struct device *dev = wcss->dev;
+	int ret;
+
+	ret = qcom_q6v5_prepare(&wcss->q6);
+	if (ret)
+		return ret;
+
+	if (!IS_ERR_OR_NULL(wcss->mbox_chan)) {
+		struct tmel_sec_auth tsa;
+		struct tmel_qmp_msg tqm;
+
+		tsa.data = wcss->metadata;
+		tsa.size = wcss->metadata_len;
+		tsa.pas_id = wcss->desc->pasid;
+		tqm.msg = &tsa;
+		tqm.msg_id = TMEL_MSG_UID_SECBOOT_SEC_AUTH;
+
+		ret = mbox_send_message(wcss->mbox_chan, (void *)&tqm);
+		if (ret < 0) {
+			dev_err(dev, "Failed to send message via mailbox\n");
+			goto unprepare;
+		}
+	} else {
+		ret = qcom_scm_pas_auth_and_reset(wcss->desc->pasid);
+		if (ret) {
+			dev_err(dev, "wcss_reset failed\n");
+			goto unprepare;
+		}
+	}
+
+	ret = qcom_q6v5_wait_for_start(&wcss->q6, Q6_WAIT_TIMEOUT);
+	if (ret == -ETIMEDOUT)
+		dev_err(dev, "start timed out\n");
+
+unprepare:
+	qcom_q6v5_unprepare(&wcss->q6);
+
+	return ret;
+}
+
+static int wcss_sec_stop(struct rproc *rproc)
+{
+	struct wcss_sec *wcss = rproc->priv;
+	struct device *dev = wcss->dev;
+	int ret;
+
+	if (!IS_ERR_OR_NULL(wcss->mbox_chan)) {
+		struct tmel_sec_auth tsa = {0};
+		struct tmel_qmp_msg tqm;
+
+		tsa.pas_id = wcss->desc->pasid;
+		tqm.msg = &tsa;
+		tqm.msg_id = TMEL_MSG_UID_SECBOOT_SS_TEAR_DOWN;
+
+		mbox_send_message(wcss->mbox_chan, (void *)&tqm);
+	} else {
+		ret = qcom_scm_pas_shutdown(wcss->desc->pasid);
+		if (ret) {
+			dev_err(dev, "not able to shutdown\n");
+			return ret;
+		}
+	}
+
+	qcom_q6v5_unprepare(&wcss->q6);
+
+	return 0;
+}
+
+static void *wcss_sec_da_to_va(struct rproc *rproc, u64 da, size_t len,
+			       bool *is_iomem)
+{
+	struct wcss_sec *wcss = rproc->priv;
+	int offset;
+
+	offset = da - wcss->mem_reloc;
+	if (offset < 0 || offset + len > wcss->mem_size)
+		return NULL;
+
+	return wcss->mem_region + offset;
+}
+
+static int wcss_sec_load(struct rproc *rproc, const struct firmware *fw)
+{
+	struct wcss_sec *wcss = rproc->priv;
+	struct device *dev = wcss->dev;
+	int ret;
+
+	if (!IS_ERR_OR_NULL(wcss->mbox_chan)) {
+		wcss->metadata = qcom_mdt_read_metadata(fw, &wcss->metadata_len,
+							rproc->firmware, wcss->dev);
+		if (IS_ERR(wcss->metadata)) {
+			ret = PTR_ERR(wcss->metadata);
+			dev_err(wcss->dev, "error %d reading firmware %s metadata\n",
+				ret, rproc->firmware);
+			return ret;
+		}
+
+		ret = qcom_mdt_load_no_init(wcss->dev, fw, rproc->firmware, wcss->desc->pasid,
+					    wcss->mem_region, wcss->mem_phys, wcss->mem_size,
+					    &wcss->mem_reloc);
+		if (ret) {
+			kfree(wcss->metadata);
+			return ret;
+		}
+	} else {
+		ret = qcom_mdt_load(dev, fw, rproc->firmware, wcss->desc->pasid, wcss->mem_region,
+				    wcss->mem_phys, wcss->mem_size, &wcss->mem_reloc);
+		if (ret)
+			return ret;
+	}
+
+	qcom_pil_info_store("wcss", wcss->mem_phys, wcss->mem_size);
+
+	return 0;
+}
+
+static unsigned long wcss_sec_panic(struct rproc *rproc)
+{
+	struct wcss_sec *wcss = rproc->priv;
+
+	return qcom_q6v5_panic(&wcss->q6);
+}
+
+static void wcss_sec_copy_segment(struct rproc *rproc,
+				  struct rproc_dump_segment *segment,
+				  void *dest, size_t offset, size_t size)
+{
+	struct wcss_sec *wcss = rproc->priv;
+	struct device *dev = wcss->dev;
+
+	if (!segment->io_ptr)
+		segment->io_ptr = ioremap_wc(segment->da, segment->size);
+
+	if (!segment->io_ptr) {
+		dev_err(dev, "Failed to ioremap segment %pad size 0x%zx\n",
+			&segment->da, segment->size);
+		return;
+	}
+
+	if (offset + size <= segment->size) {
+		memcpy(dest, segment->io_ptr + offset, size);
+	} else {
+		iounmap(segment->io_ptr);
+		segment->io_ptr = NULL;
+	}
+}
+
+static int wcss_sec_dump_segments(struct rproc *rproc,
+				  const struct firmware *fw)
+{
+	struct device *dev = rproc->dev.parent;
+	struct reserved_mem *rmem = NULL;
+	struct device_node *node;
+	int num_segs, index;
+	int ret;
+
+	/*
+	 * Parse through additional reserved memory regions for the rproc
+	 * and add them to the coredump segments
+	 */
+	num_segs = of_count_phandle_with_args(dev->of_node,
+					      "memory-region", NULL);
+	for (index = 0; index < num_segs; index++) {
+		node = of_parse_phandle(dev->of_node,
+					"memory-region", index);
+		if (!node)
+			return -EINVAL;
+
+		rmem = of_reserved_mem_lookup(node);
+		of_node_put(node);
+		if (!rmem) {
+			dev_err(dev, "unable to acquire memory-region index %d num_segs %d\n",
+				index, num_segs);
+			return -EINVAL;
+		}
+
+		dev_dbg(dev, "Adding segment 0x%pa size 0x%pa",
+			&rmem->base, &rmem->size);
+		ret = rproc_coredump_add_custom_segment(rproc,
+							rmem->base,
+							rmem->size,
+							wcss_sec_copy_segment,
+							NULL);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct rproc_ops wcss_sec_ops = {
+	.start = wcss_sec_start,
+	.stop = wcss_sec_stop,
+	.da_to_va = wcss_sec_da_to_va,
+	.load = wcss_sec_load,
+	.get_boot_addr = rproc_elf_get_boot_addr,
+	.panic = wcss_sec_panic,
+	.parse_fw = wcss_sec_dump_segments,
+};
+
+static int wcss_sec_alloc_memory_region(struct wcss_sec *wcss)
+{
+	struct reserved_mem *rmem = NULL;
+	struct device_node *node;
+	struct device *dev = wcss->dev;
+
+	node = of_parse_phandle(dev->of_node, "memory-region", 0);
+	if (!node) {
+		dev_err(dev, "can't find phandle memory-region\n");
+		return -EINVAL;
+	}
+
+	rmem = of_reserved_mem_lookup(node);
+	of_node_put(node);
+
+	if (!rmem) {
+		dev_err(dev, "unable to acquire memory-region\n");
+		return -EINVAL;
+	}
+
+	wcss->mem_phys = rmem->base;
+	wcss->mem_reloc = rmem->base;
+	wcss->mem_size = rmem->size;
+	wcss->mem_region = devm_ioremap_wc(dev, wcss->mem_phys, wcss->mem_size);
+	if (!wcss->mem_region) {
+		dev_err(dev, "unable to map memory region: %pa+%pa\n",
+			&rmem->base, &rmem->size);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int wcss_sec_probe(struct platform_device *pdev)
+{
+	struct rproc *rproc;
+	struct wcss_sec *wcss;
+	struct clk *sleep_clk;
+	const char *fw_name = NULL;
+	const struct wcss_data *desc = of_device_get_match_data(&pdev->dev);
+	int ret;
+
+	ret = of_property_read_string(pdev->dev.of_node, "firmware-name",
+				      &fw_name);
+	if (ret < 0)
+		return ret;
+
+	rproc = devm_rproc_alloc(&pdev->dev, desc->ss_name, &wcss_sec_ops,
+				 fw_name, sizeof(*wcss));
+	if (!rproc) {
+		dev_err(&pdev->dev, "failed to allocate rproc\n");
+		return -ENOMEM;
+	}
+
+	wcss = rproc->priv;
+	wcss->dev = &pdev->dev;
+	wcss->desc = desc;
+
+	ret = wcss_sec_alloc_memory_region(wcss);
+	if (ret)
+		return ret;
+
+	sleep_clk = devm_clk_get_optional_enabled(&pdev->dev, "sleep");
+	if (IS_ERR(sleep_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(sleep_clk),
+				     "Failed to get sleep clock\n");
+
+	ret = qcom_q6v5_init(&wcss->q6, pdev, rproc,
+			     WCSS_CRASH_REASON, NULL, NULL);
+	if (ret)
+		return ret;
+
+	qcom_add_glink_subdev(rproc, &wcss->glink_subdev, desc->ss_name);
+	qcom_add_ssr_subdev(rproc, &wcss->ssr_subdev, desc->ss_name);
+
+	rproc->auto_boot = false;
+	rproc->dump_conf = RPROC_COREDUMP_INLINE;
+	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
+
+	if (desc->tmelcom) {
+		wcss->mbox_client.dev = wcss->dev;
+		wcss->mbox_client.knows_txdone = true;
+		wcss->mbox_client.tx_block = true;
+		wcss->mbox_chan = mbox_request_channel(&wcss->mbox_client, 0);
+		if (IS_ERR(wcss->mbox_chan))
+			return dev_err_probe(wcss->dev, PTR_ERR(wcss->mbox_chan),
+					     "mbox chan for IPC is missing\n");
+	}
+
+	ret = devm_rproc_add(&pdev->dev, rproc);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, rproc);
+
+	return 0;
+}
+
+static void wcss_sec_remove(struct platform_device *pdev)
+{
+	struct rproc *rproc = platform_get_drvdata(pdev);
+	struct wcss_sec *wcss = rproc->priv;
+
+	mbox_free_channel(wcss->mbox_chan);
+	qcom_remove_glink_subdev(rproc, &wcss->glink_subdev);
+	qcom_remove_ssr_subdev(rproc, &wcss->ssr_subdev);
+	qcom_q6v5_deinit(&wcss->q6);
+}
+
+static const struct wcss_data wcss_sec_ipq5332_res_init = {
+	.pasid = MPD_WCSS_PAS_ID,
+	.ss_name = "q6wcss",
+};
+
+static const struct wcss_data wcss_sec_ipq5424_res_init = {
+	.pasid = MPD_WCSS_PAS_ID,
+	.ss_name = "q6wcss",
+	.tmelcom = true,
+};
+
+static const struct wcss_data wcss_sec_ipq9574_res_init = {
+	.pasid = WCSS_PAS_ID,
+	.ss_name = "q6wcss",
+};
+
+static const struct of_device_id wcss_sec_of_match[] = {
+	{ .compatible = "qcom,ipq5332-wcss-sec-pil", .data = &wcss_sec_ipq5332_res_init },
+	{ .compatible = "qcom,ipq5424-wcss-sec-pil", .data = &wcss_sec_ipq5424_res_init },
+	{ .compatible = "qcom,ipq9574-wcss-sec-pil", .data = &wcss_sec_ipq9574_res_init },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, wcss_sec_of_match);
+
+static struct platform_driver wcss_sec_driver = {
+	.probe = wcss_sec_probe,
+	.remove = wcss_sec_remove,
+	.driver = {
+		.name = "qcom-wcss-secure-pil",
+		.of_match_table = wcss_sec_of_match,
+	},
+};
+module_platform_driver(wcss_sec_driver);
+
+MODULE_DESCRIPTION("Hexagon WCSS Secure Peripheral Image Loader");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index b4795698d8c2..7b2159853345 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -472,6 +472,7 @@ enum rproc_dump_mechanism {
  * @node:	list node related to the rproc segment list
  * @da:		device address of the segment
  * @size:	size of the segment
+ * @io_ptr:	ptr to store the ioremapped dump segment
  * @priv:	private data associated with the dump_segment
  * @dump:	custom dump function to fill device memory segment associated
  *		with coredump
@@ -483,6 +484,7 @@ struct rproc_dump_segment {
 	dma_addr_t da;
 	size_t size;
 
+	void *io_ptr;
 	void *priv;
 	void (*dump)(struct rproc *rproc, struct rproc_dump_segment *segment,
 		     void *dest, size_t offset, size_t size);
-- 
2.34.1


