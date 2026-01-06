Return-Path: <linux-arm-msm+bounces-87668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 419F3CF7E58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 11:54:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AAC1330499D4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 10:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8655E32B983;
	Tue,  6 Jan 2026 10:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dX8sLEOo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aHgMFjcm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC4B327C00
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 10:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767696876; cv=none; b=mWqQleEx3ZxzOZuye3JgLicv13spIhvksKSNbU3aJeydFj+a9EJfvUj1qoXG1DHNwfI+MZcJhr1lTwy6frH1aJXs+gbiSjEX69mT1f3fec7tNY3OScekfiVbhUEb18TLOGvNoXr80lbtZdikcDSHENnzgKvj/iOamQHpC+wyL8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767696876; c=relaxed/simple;
	bh=fs9t0Pn1imcNV1fRjXS6Jwap5nJNDitP9hU7WDGVaiA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PpDzFcOl0+qdsCAg/izVSperyD1zvY+r1xFFzR/dnoSch0J6u1SSL0YN6Cw68rk0yKZPtoVoWWqtYZiEfyD+DnqvSQD7zsaPl5D6j7FtDLTmPjkyFq128u2Itf3zYXcI8BrsSQQaghrtwnVxLOxYdEw613L2fslbZrGunLZNVmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dX8sLEOo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aHgMFjcm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606AaVKE3052950
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 10:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CPlETPk+/+0
	Pb64p86tbnzFv0Ht/ixKaDnd24XPDpKk=; b=dX8sLEOoS0fns/ufPXyOCr9g3+1
	zIwdPMwjiHrfrvD4BlzBNcthoJqoLibOOkR0xBL9RM8CPLNoLgARlGm5YaDhAF7Z
	RV/aRH6K+zVns9Z2hLKwxfALSuKq2pV79MVSLiz1ybH9rWbunX0sYDGbe8T3DVNI
	qocaoTLPEsPaBTR8HX3SYzrIEduav7g2bAdrcXmfkcCwjHWnkD9iC7mDzxTnFuoq
	75bo8a0Jt+WyZ5ll3hFgXyikPtAFAOOrJ5WfWTft20Xxc+UVzYoT8zGs1VUquYUK
	BCasfCnLM9Cv0Wr+ZieyaQF+57IkCck/qsqZIBkYD02zinn4udtNPwLQiCA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgpn9srn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 10:54:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7f66686710fso2602946b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 02:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767696871; x=1768301671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPlETPk+/+0Pb64p86tbnzFv0Ht/ixKaDnd24XPDpKk=;
        b=aHgMFjcmcMGdTVBNkCf6SuH5AUWtrHa8RnfH+tWCPflYyhcr5aU/rqDIjVVfv/zzgO
         gi6QmAvI1GmD202kFOOwmKtVNBnMNAusN3BnnQexEAf6Mq8xHchhk2imnasgZ6bm4eTc
         lGJtEQQYhw2N4+U6deVyMH1/JdDMD72eZx4UUNtfVsf3mgXdzymA/7RB47SV1HGqNRbR
         BkQzbuJTGnU9yJfZK3HHbUgsPe2l+m56usHedsFPK/6GnYGClYoXaQbnEkKwypVzwOKZ
         jviTii1e5vdo3eMPTpfRRO/jLORExOBJz97J4GjttJKqt74d0pmGBpPTeUzFfNaajj77
         ZZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767696871; x=1768301671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CPlETPk+/+0Pb64p86tbnzFv0Ht/ixKaDnd24XPDpKk=;
        b=Q3ryEOT3kbzkCfcP0k+BiF28rF22FHc5PjPhghfURm08XQE0F/wqcClD9SU8vOo/bR
         mH5MB6AVCIlZTEzn3Z7gIzG9ztk3resepsp1Yx7GwFz/aA/hfmNjMhJBAmFuT2Scn42A
         xHJqZXGJ/5u4wW3DNV5JEVixt7wZdiOAL1VQX/NFAVCTHHtDda56jhCn+5bSWfbJlS1L
         VWHTLc+O58+56a1UJY5IB7trq+RnFb9MFqNtEYjhiRfLEWb8AQh3OyM+bfsXCifu+WDA
         Y1QTGVOUGMPbJKjDfYV3avdxGq/mgcWQ1yPZeLaeiHyYf6a8rf+QMpkRkHo7+dxJ+TLO
         Iq2w==
X-Forwarded-Encrypted: i=1; AJvYcCXIPEr7/n7oJyu7w4+LZGngiCBTUrfiRBNNOyXE0DZ+I95PbeXiSdv4jXJa99WrpIYVaUGNYMk2m5dZilw+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5qzZtHGSy8Kz05PvaMC9Oe3iUc2IobOtZYAeqSddwsd16EHDh
	HUOytuce99MqiIXd/ItlVVMb1CrgMyT0YKzhO188ftL4HH+Y/cDXdnXE+IrrQRUE+QKheu8U2WJ
	ddinttyI9PE9giC4BJKAkec2kxNYiZJMKMClCnENQHAHIcttbDCJ7lfWqXZ3Mg1Vk5hEC
X-Gm-Gg: AY/fxX6cJrvbY/8yQ2c+SZARkPSV/9v1jTvBsA8L85te96bVz8zluHg0ZL5ULetTPsE
	0SdV/dgcDpJZxUaLyUVnvSke1BX2hZyWxZYERECxYcd0dZo4Njk0QcYxbofoATZVvUGpPuFV0dR
	791ZfgZ7+rahdZGYiSEJYScs7m2VLiPtKaceRSJZ58fwFWNm4+dpGg9fHm9+FAvC1LNmOxUn8xf
	ezOCDVF/E94hj6jILI2Yqs+2gzC92eSIcgFt+4iHF3DCJbQUi648+J5NcWgLURCjU9rwNlkRWaS
	L4kWzVTQYtyAPcnkghm5ZGNLzsurswkvylEvYJdcTg90bp9RwxxqqeVHtZYH6tmnjLVW2ZtvT4L
	00vnxcl4t+uSKU2chMb18iD5DyHBMM0REU1+/2utMung0C1lNDj6PchmTyBW8g0YwxrztxcaLyR
	0jESs/pJsbLZwwXagLVDl4lCKvygY47YIVfhIN47o=
X-Received: by 2002:a05:6a00:f92:b0:7f0:4694:1c21 with SMTP id d2e1a72fcca58-81881739c04mr2232585b3a.20.1767696871334;
        Tue, 06 Jan 2026 02:54:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLwKGIxY2rCuMxuys54jm5dYUHMG6OG07vd4V9O9dUCeSXaCSJIC8R64qtOUxGqnhBiAnfTQ==
X-Received: by 2002:a05:6a00:f92:b0:7f0:4694:1c21 with SMTP id d2e1a72fcca58-81881739c04mr2232561b3a.20.1767696870833;
        Tue, 06 Jan 2026 02:54:30 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9b98sm1855121b3a.20.2026.01.06.02.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 02:54:30 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v9 3/6] remoteproc: qcom: add hexagon based WCSS secure PIL driver
Date: Tue,  6 Jan 2026 16:24:09 +0530
Message-Id: <20260106105412.3529898-4-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260106105412.3529898-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260106105412.3529898-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uaHnkxwZu5fJBWniV_vWHJyTlvKmXbR7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA5MyBTYWx0ZWRfX9ea/ilZXmOFs
 gsrga0wQwKlM7fUl/8q/l0k0j+0FDXezxO0uO0Lf7i5xLnI0Xux57R1kfVdXkdwy1rJ76eT3B4x
 uFtJ+HQYvLboiWiX53fNMJwOsEYJMDLttxEEnxyR66fFMpuFY2UU3P5CNwMPYE6Udry39xEWG28
 R/OsjE2z/cHedIvaowtnRCVugpgTieH9DpCvrFPJEzBpxYkHB5b1rz6mJfAY1Aj9IWi+rl59oAH
 tv9KWQ6TNEZXrSp8Zomf2XWH9chDwwiMEuYzjBYI9AN/zHMDB+vgX+AOUNgWJyUL+tavXsg5JKZ
 sBQbA0/KXj0l1A+PtcBLIb9SwyVNf39ls295x0w0e2BPad/4h5+NEMki4lY2NydD37T2i3+RSat
 TlzHZrD+tE2boE+KNmV42vpN7Y06ZLbWF0WKzDU7qkXHFzvfZqL7AJRpUckVsE6Amxgt+BHJ8w4
 RFb1nhRveNC6Y0knemA==
X-Proofpoint-GUID: uaHnkxwZu5fJBWniV_vWHJyTlvKmXbR7
X-Authority-Analysis: v=2.4 cv=KfnfcAYD c=1 sm=1 tr=0 ts=695ce9e9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=UqCG9HQmAAAA:8
 a=2haS3Ga0fGOBmvNocw8A:9 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060093

From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>

Add support to bring up hexagon based WCSS using secure PIL. All IPQxxxx
SoCs support secure Peripheral Image Loading (PIL).

Secure PIL image is signed firmware image which only trusted software such
as TrustZone (TZ) can authenticate and load. Linux kernel will send a
Peripheral Authentication Service (PAS) request to TZ to authenticate and
load the PIL images.

In order to avoid overloading the existing WCSS driver or PAS driver, we
came up with this new PAS based IPQ WCSS driver.

Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
[ Dropped ipq5424 support ]
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v8: Dropped ipq5424 support.
    The comments related to 'use_tmelcom' in [1] not applicable
    [1] https://lore.kernel.org/linux-arm-msm/72f0d4f7-8d8a-4fc5-bac2-8094e971a0e3@oss.qualcomm.com/
    Changed copyright for drivers/remoteproc/qcom_q6v5_wcss_sec.c
---
 drivers/remoteproc/Kconfig              |  19 ++
 drivers/remoteproc/Makefile             |   1 +
 drivers/remoteproc/qcom_q6v5_wcss_sec.c | 328 ++++++++++++++++++++++++
 include/linux/remoteproc.h              |   2 +
 4 files changed, 350 insertions(+)
 create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 48a0d3a69ed0..eaa427e4e9ec 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -254,6 +254,25 @@ config QCOM_Q6V5_WCSS
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
index 1c7598b8475d..08705ef62bce 100644
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
index 000000000000..10fe3391decb
--- /dev/null
+++ b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
@@ -0,0 +1,328 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include <linux/clk.h>
+#include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/io.h>
+#include <linux/mailbox_client.h>
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
+	ret = qcom_scm_pas_auth_and_reset(wcss->desc->pasid);
+	if (ret) {
+		dev_err(dev, "wcss_reset failed\n");
+		goto unprepare;
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
+	ret = qcom_scm_pas_shutdown(wcss->desc->pasid);
+	if (ret) {
+		dev_err(dev, "not able to shutdown\n");
+		return ret;
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
+	ret = qcom_mdt_load(dev, fw, rproc->firmware, wcss->desc->pasid, wcss->mem_region,
+			    wcss->mem_phys, wcss->mem_size, &wcss->mem_reloc);
+	if (ret)
+		return ret;
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
+	if (offset + size < segment->size) {
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
+	struct device *dev = wcss->dev;
+	struct resource res;
+	int ret;
+
+	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
+	if (ret) {
+		dev_err(dev, "unable to acquire memory-region resource\n");
+		return ret;
+	}
+
+	wcss->mem_phys = res.start;
+	wcss->mem_reloc = res.start;
+	wcss->mem_size = resource_size(&res);
+	wcss->mem_region = devm_ioremap_resource_wc(dev, &res);
+	if (!wcss->mem_region) {
+		dev_err(dev, "unable to map memory region: %pR\n", &res);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int wcss_sec_probe(struct platform_device *pdev)
+{
+	const struct wcss_data *desc = of_device_get_match_data(&pdev->dev);
+	const char *fw_name = NULL;
+	struct wcss_sec *wcss;
+	struct clk *sleep_clk;
+	struct clk *int_clk;
+	struct rproc *rproc;
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
+	int_clk = devm_clk_get_optional_enabled(&pdev->dev, "interconnect");
+	if (IS_ERR(int_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(int_clk),
+				     "Failed to get interconnect clock\n");
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
+static const struct wcss_data wcss_sec_ipq9574_res_init = {
+	.pasid = WCSS_PAS_ID,
+	.ss_name = "q6wcss",
+};
+
+static const struct of_device_id wcss_sec_of_match[] = {
+	{ .compatible = "qcom,ipq5018-wcss-sec-pil", .data = &wcss_sec_ipq5332_res_init },
+	{ .compatible = "qcom,ipq5332-wcss-sec-pil", .data = &wcss_sec_ipq5332_res_init },
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


