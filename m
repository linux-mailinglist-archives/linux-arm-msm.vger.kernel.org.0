Return-Path: <linux-arm-msm+bounces-78754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6FBC07631
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 18:48:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 709F31B856B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 16:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1483020B800;
	Fri, 24 Oct 2025 16:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ktoUu+RR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CD82DA765
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 16:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761324397; cv=none; b=YJWKsPl3FtvS1O2SgMaVcBw4s7+JL4+emt/DjTebt1Gy+pEjUqhK/6p1cQtNsXXE2cuqNLlBmoaawQJO0NzjhS5nLhPfKRkMtwsjqF22Xt1NLqZoTy6DdSN4PpWcnRQyW016EVkO8AKNt2GXz+RqkOjMmgT9W3erqIOqrNrtM0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761324397; c=relaxed/simple;
	bh=lIm4bLpaAbIp9SdyqojZjUTRa9xPWdpPuE1KXo8JWEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NsA/T64k97gmiZqBJXUGBxOMgakIAEp6ENpCMSxJ6dx/YWLNKOye/iAqoU/VQrsLnpj9aXNFCN4IHmZNfomg70IIr6sLFcB6kgPu3UnXyG2U2sJER5L2tBE4Co/KaROtEsqBR4TrV/RdApFUPxY8qsnmZ4eVD5g5earWSxRDNDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ktoUu+RR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OBuFaj000371
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 16:46:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7Zh9DUYKtKV
	wNnogAjQw/00B5F59jdUrYsLkMKI6u/I=; b=ktoUu+RRRBXMod0Faynpl+4+2Ol
	z3q4o6507VJjSQWOjKuNvZRzWS0qK7Cw8D5ODrontJmXuNU3PdpSbuF0FnXS7B79
	qthFn8RAYRO06V5zVjBod5zGFo2rpU9XyDbomRXu0xvHXVCbf+K+qJdnkm8t6Yb/
	8n8kKvgWBru5T1ZtyzGVPuJ3olK037Q4P4C9bmzIy1eHopsF6APH82OBkt2F4UnA
	MmEQWgl6/L1oagqguQAkjNbB/aEgSxF6uayMWLftH6Lq5j363VeIFY/FKXkiDb7P
	gIDjfrFtBDJB2UAbUimR6W776M8LpMP9KzHCfMhO7Lkl9WOj1jK/kpWuc7g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49ym9j49x6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 16:46:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e88c912928so65121361cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 09:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761324393; x=1761929193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Zh9DUYKtKVwNnogAjQw/00B5F59jdUrYsLkMKI6u/I=;
        b=cHmi1zCdRr7fojTvZ/3kDmK+hxvep9cn8xgLxYnIRDRl1I4tHGC3pBf3BGrj5ZUk+S
         WVbne6lQPt47YpIFVl3pbwQBQV7H9ikYYybOkmlcNZ33guGzSfGrLcyZ5aHyrtF5IQ7S
         NW01suKK7tTf/Hznjj1XTRuDMCSckfltNoUbE4zjsB5MPPtDyN0KcgUL7cOI9wOl8cfu
         dCX9CBLvKywosYJmr4fzSGFiIof0jVzS4uVR0Jy/+nc9aDcjrXaj++iAg75olcKymg6S
         gZTVZRfyEElWGFaAChHvc8z9s72c1R4WzVEAveOKu5reseiiL7D7KF5Le6yrDl96H5Ix
         XByw==
X-Forwarded-Encrypted: i=1; AJvYcCWp14mYTJro6U7E72GMjehuMEnxgLV8M+SZysAEWpFIfTvnimszGuTrmH9GtMDoEQAH4CxjIT1PRoJEdlPf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3yCnXKr96XzfY5Jrr4/bvYajEMk1hTtZy35lV0H0eAmaSUkIK
	1Iuj6Z8jaUfaLK8bLxA+24FRo9/id3ofYqI4b2iTebXIcZMOhuPY52S2+ciX1Teu5WNyptemorx
	Lvv5FXvD3fRYP1ZdJ6flFs1FZSkMviSUpuMEsokDZo7vth2C7U/BGkkvbRMm3OWhBAPcc
X-Gm-Gg: ASbGncu90uS4ka8bgGYR1LgZCzJKQSDwdhlAvd/7yHnEcWOD3LLWDwSruIg9A7FxOFp
	cQU+NI7KBhtEU1I9u/RvRxBSvtaab5W8k5GdLpzaakFLEb9mcT665n2OgPKliksaS9L9looNgaG
	vMF+2sYTTBwW9Vh4PldnZFxz1nIGYAEGER/3rxkYgv3m0euwxcRKAQ26+aYBzWl5VW3Ag0lRL2H
	RpYp4ameBVMQslsH7pymwr5lK6kgF01hzLE3IMCAz7V/nAAygUYYS94ZSrChEH4MYMvXVDqgarn
	17rarsCvRDbI7MhDRLTJptHu97iMRfq2IRd/UXUACyZkboMNKTXm9B8AOF8uWRZqsUsBymFRhtc
	Ccu02riB5LHq2CE8j39ctqzkacQyidnm4QpRbmdk=
X-Received: by 2002:a05:622a:207:b0:4e8:acc0:1e8f with SMTP id d75a77b69052e-4e8acc02259mr301322971cf.47.1761324392373;
        Fri, 24 Oct 2025 09:46:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYqNSh4Il+UzcvDo5QXpBAvau+CsuwQ3FdztVvzts+To/aOcS0ccMPETaZH6qd7dg+hbKqIQ==
X-Received: by 2002:a05:622a:207:b0:4e8:acc0:1e8f with SMTP id d75a77b69052e-4e8acc02259mr301322541cf.47.1761324391835;
        Fri, 24 Oct 2025 09:46:31 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d51472215sm563568466b.74.2025.10.24.09.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 09:46:31 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/3] accel/qaic: Add DMA Bridge Channel(DBC) sysfs and uevents
Date: Fri, 24 Oct 2025 18:46:28 +0200
Message-ID: <20251024164630.816862-2-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251024164630.816862-1-youssef.abdulrahman@oss.qualcomm.com>
References: <20251024164630.816862-1-youssef.abdulrahman@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CLknnBrD c=1 sm=1 tr=0 ts=68fbad69 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=nt6Na7LQK8S_E-uQ5a4A:9 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDExMiBTYWx0ZWRfX3QP71JAQiPrc
 8MHOY/hAUYJX0c9sjUNFxGjm8fT4A+uXSJHd/p2m0In+gpjOo3ysOQfKIHV3yLgFpkurnxudFso
 n6jklD7nTp6LbcwsnxCVD/xjl0EB80MBOm0G5jF2uqCqS+Qlrf0GlAr8XJbKIX8s02RGyf5TYzm
 Qrr2dpiprDZxAhfzSmXAzKiRWzO0wNWDF054OyaqoLPcDUdZaf0FHe8iPgicbR+7I5F499NP/z4
 rDuRDMpzdqIor5rdZYfdYS0T8HlnDV0VemxtnC3eCLB1Lgr5OyfFPCbBi8Rwy+wTy1k5An32uZZ
 qadV4NkohWwl0SINH4fHylVYnr5Od81kwmyiss/ac3x4sAvZ1tbr3JnZQvTeVsdzlWoTQfPxNNF
 T49QVRdOxWYyGRxR6/idCvJL0FD3Zg==
X-Proofpoint-GUID: hllFAREtjumVzCE6WcE9Oxm5k7kjyacT
X-Proofpoint-ORIG-GUID: hllFAREtjumVzCE6WcE9Oxm5k7kjyacT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510230112

From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

Expose sysfs files for each DBC representing the current state of that DBC.
For example, sysfs for DBC ID 0 and accel minor number 0 looks like this,

/sys/class/accel/accel0/dbc0_state

Following are the states and their corresponding values,
DBC_STATE_IDLE (0)
DBC_STATE_ASSIGNED (1)
DBC_STATE_BEFORE_SHUTDOWN (2)
DBC_STATE_AFTER_SHUTDOWN (3)
DBC_STATE_BEFORE_POWER_UP (4)
DBC_STATE_AFTER_POWER_UP (5)

Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 Documentation/ABI/stable/sysfs-driver-qaic |  16 +++
 drivers/accel/qaic/Makefile                |   1 +
 drivers/accel/qaic/qaic.h                  |  25 +++++
 drivers/accel/qaic/qaic_control.c          |   2 +
 drivers/accel/qaic/qaic_drv.c              |   8 ++
 drivers/accel/qaic/qaic_sysfs.c            | 109 +++++++++++++++++++++
 6 files changed, 161 insertions(+)
 create mode 100644 Documentation/ABI/stable/sysfs-driver-qaic
 create mode 100644 drivers/accel/qaic/qaic_sysfs.c

diff --git a/Documentation/ABI/stable/sysfs-driver-qaic b/Documentation/ABI/stable/sysfs-driver-qaic
new file mode 100644
index 000000000000..e5876935e62b
--- /dev/null
+++ b/Documentation/ABI/stable/sysfs-driver-qaic
@@ -0,0 +1,16 @@
+What:		/sys/bus/pci/drivers/qaic/XXXX:XX:XX.X/accel/accel<minor_nr>/dbc<N>_state
+Date:		October 2025
+KernelVersion:	6.19
+Contact:	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
+Description:	Represents the current state of DMA Bridge channel (DBC). Below are the possible
+		states,
+		IDLE (0) -		DBC is free and can be activated
+		ASSIGNED (1) -		DBC is activated and a workload is running on device
+		BEFORE_SHUTDOWN (2) -	Sub-system associated with this workload has crashed and
+					it will shutdown soon
+		AFTER_SHUTDOWN (3) -	Sub-system associated with this workload has crashed and
+					it has shutdown
+		BEFORE_POWER_UP (4) -	Sub-system associated with this workload is shutdown and
+					it will be powered up soon
+		AFTER_POWER_UP (5) -	Sub-system associated with this workload is now powered up
+Users:		Any userspace application or clients interested in DBC state.
diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
index 1106b876f737..8f6746e5f03a 100644
--- a/drivers/accel/qaic/Makefile
+++ b/drivers/accel/qaic/Makefile
@@ -11,6 +11,7 @@ qaic-y := \
 	qaic_data.o \
 	qaic_drv.o \
 	qaic_ras.o \
+	qaic_sysfs.o \
 	qaic_timesync.o \
 	sahara.o
 
diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index 820d133236dd..4c2f25249e95 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -47,6 +47,22 @@ enum __packed dev_states {
 	QAIC_ONLINE,
 };
 
+enum dbc_states {
+	/* DBC is free and can be activated */
+	DBC_STATE_IDLE,
+	/* DBC is activated and a workload is running on device */
+	DBC_STATE_ASSIGNED,
+	/* Sub-system associated with this workload has crashed and it will shutdown soon */
+	DBC_STATE_BEFORE_SHUTDOWN,
+	/* Sub-system associated with this workload has crashed and it has shutdown */
+	DBC_STATE_AFTER_SHUTDOWN,
+	/* Sub-system associated with this workload is shutdown and it will be powered up soon */
+	DBC_STATE_BEFORE_POWER_UP,
+	/* Sub-system associated with this workload is now powered up */
+	DBC_STATE_AFTER_POWER_UP,
+	DBC_STATE_MAX,
+};
+
 extern bool datapath_polling;
 
 struct qaic_user {
@@ -114,6 +130,8 @@ struct dma_bridge_chan {
 	unsigned int		irq;
 	/* Polling work item to simulate interrupts */
 	struct work_struct	poll_work;
+	/* Represents various states of this DBC from enum dbc_states */
+	unsigned int		state;
 };
 
 struct qaic_device {
@@ -195,6 +213,8 @@ struct qaic_drm_device {
 	struct list_head	users;
 	/* Synchronizes access to users list */
 	struct mutex		users_mutex;
+	/* Pointer to array of DBC sysfs attributes */
+	void			*sysfs_attrs;
 };
 
 struct qaic_bo {
@@ -319,4 +339,9 @@ int qaic_perf_stats_bo_ioctl(struct drm_device *dev, void *data, struct drm_file
 int qaic_detach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
 void irq_polling_work(struct work_struct *work);
 
+/* qaic_sysfs.c */
+int qaic_sysfs_init(struct qaic_drm_device *qddev);
+void qaic_sysfs_remove(struct qaic_drm_device *qddev);
+void set_dbc_state(struct qaic_device *qdev, u32 dbc_id, unsigned int state);
+
 #endif /* _QAIC_H_ */
diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index b86a8e48e731..b1ab1282f9d3 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -309,6 +309,7 @@ static void save_dbc_buf(struct qaic_device *qdev, struct ioctl_resources *resou
 		enable_dbc(qdev, dbc_id, usr);
 		qdev->dbc[dbc_id].in_use = true;
 		resources->buf = NULL;
+		set_dbc_state(qdev, dbc_id, DBC_STATE_ASSIGNED);
 	}
 }
 
@@ -921,6 +922,7 @@ static int decode_deactivate(struct qaic_device *qdev, void *trans, u32 *msg_len
 	}
 
 	release_dbc(qdev, dbc_id);
+	set_dbc_state(qdev, dbc_id, DBC_STATE_IDLE);
 	*msg_len += sizeof(*in_trans);
 
 	return 0;
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index e162f4b8a262..a8a16f20320f 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -270,6 +270,13 @@ static int qaic_create_drm_device(struct qaic_device *qdev, s32 partition_id)
 		return ret;
 	}
 
+	ret = qaic_sysfs_init(qddev);
+	if (ret) {
+		drm_dev_unregister(drm);
+		pci_dbg(qdev->pdev, "qaic_sysfs_init failed %d\n", ret);
+		return ret;
+	}
+
 	qaic_debugfs_init(qddev);
 
 	return ret;
@@ -281,6 +288,7 @@ static void qaic_destroy_drm_device(struct qaic_device *qdev, s32 partition_id)
 	struct drm_device *drm = to_drm(qddev);
 	struct qaic_user *usr;
 
+	qaic_sysfs_remove(qddev);
 	drm_dev_unregister(drm);
 	qddev->partition_id = 0;
 	/*
diff --git a/drivers/accel/qaic/qaic_sysfs.c b/drivers/accel/qaic/qaic_sysfs.c
new file mode 100644
index 000000000000..5d7aa1a5f4d1
--- /dev/null
+++ b/drivers/accel/qaic/qaic_sysfs.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* Copyright (c) 2020-2025, The Linux Foundation. All rights reserved. */
+
+#include <drm/drm_file.h>
+#include <drm/drm_managed.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/kobject.h>
+#include <linux/mutex.h>
+#include <linux/sysfs.h>
+
+#include "qaic.h"
+
+#define NAME_LEN		14
+
+struct dbc_attribute {
+	struct device_attribute dev_attr;
+	u32 dbc_id;
+	char name[NAME_LEN];
+};
+
+static ssize_t dbc_state_show(struct device *dev, struct device_attribute *a, char *buf)
+{
+	struct dbc_attribute *dbc_attr = container_of(a, struct dbc_attribute, dev_attr);
+	struct drm_minor *minor = dev_get_drvdata(dev);
+	struct qaic_device *qdev;
+
+	qdev = to_qaic_device(minor->dev);
+	return sysfs_emit(buf, "%d\n", qdev->dbc[dbc_attr->dbc_id].state);
+}
+
+void set_dbc_state(struct qaic_device *qdev, u32 dbc_id, unsigned int state)
+{
+	struct device *kdev = to_accel_kdev(qdev->qddev);
+	char *envp[3] = {};
+	char state_str[16];
+	char id_str[12];
+
+	envp[0] = id_str;
+	envp[1] = state_str;
+
+	if (state >= DBC_STATE_MAX)
+		return;
+	if (dbc_id >= qdev->num_dbc)
+		return;
+	if (state == qdev->dbc[dbc_id].state)
+		return;
+
+	scnprintf(id_str, ARRAY_SIZE(id_str), "DBC_ID=%d", dbc_id);
+	scnprintf(state_str, ARRAY_SIZE(state_str), "DBC_STATE=%d", state);
+
+	qdev->dbc[dbc_id].state = state;
+	kobject_uevent_env(&kdev->kobj, KOBJ_CHANGE, envp);
+}
+
+int qaic_sysfs_init(struct qaic_drm_device *qddev)
+{
+	struct device *kdev = to_accel_kdev(qddev);
+	struct drm_device *drm = to_drm(qddev);
+	u32 num_dbc = qddev->qdev->num_dbc;
+	struct dbc_attribute *dbc_attrs;
+	int i, ret;
+
+	dbc_attrs = drmm_kcalloc(drm, num_dbc, sizeof(*dbc_attrs), GFP_KERNEL);
+	if (!dbc_attrs)
+		return -ENOMEM;
+
+	for (i = 0; i < num_dbc; ++i) {
+		struct dbc_attribute *dbc_attr = &dbc_attrs[i];
+
+		sysfs_attr_init(&dbc_attr->dev_attr.attr);
+		dbc_attr->dbc_id = i;
+		scnprintf(dbc_attr->name, NAME_LEN, "dbc%d_state", i);
+		dbc_attr->dev_attr.attr.name = dbc_attr->name;
+		dbc_attr->dev_attr.attr.mode = 0444;
+		dbc_attr->dev_attr.show = dbc_state_show;
+		ret = sysfs_create_file(&kdev->kobj, &dbc_attr->dev_attr.attr);
+		if (ret) {
+			int j;
+
+			for (j = 0; j < i; ++j) {
+				dbc_attr = &dbc_attrs[j];
+				sysfs_remove_file(&kdev->kobj, &dbc_attr->dev_attr.attr);
+			}
+			drmm_kfree(drm, dbc_attrs);
+			return ret;
+		}
+	}
+
+	qddev->sysfs_attrs = dbc_attrs;
+	return 0;
+}
+
+void qaic_sysfs_remove(struct qaic_drm_device *qddev)
+{
+	struct dbc_attribute *dbc_attrs = qddev->sysfs_attrs;
+	struct device *kdev = to_accel_kdev(qddev);
+	u32 num_dbc = qddev->qdev->num_dbc;
+	int i;
+
+	if (!dbc_attrs)
+		return;
+
+	qddev->sysfs_attrs = NULL;
+	for (i = 0; i < num_dbc; ++i)
+		sysfs_remove_file(&kdev->kobj, &dbc_attrs[i].dev_attr.attr);
+	drmm_kfree(to_drm(qddev), dbc_attrs);
+}
-- 
2.43.0


