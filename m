Return-Path: <linux-arm-msm+bounces-78405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F43DBFE283
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 22:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38AA83A7D3A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 20:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9AE2F83C9;
	Wed, 22 Oct 2025 20:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mHguHdcF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AC22741DA
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 20:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761164734; cv=none; b=VzBh6SKts1wC0Ht+6AyyyYZ2l2jOja5HZ5i/ircEpkQLbRA0fNB1iWlawM6gflfl2D1HpxHgNuhcaQF9xnaeZQxTI0UckQinwLjSJA39098xku2wduWrVLwCBYKt5OXea7pHxO3AxdUVAPbwvuHsTr+hz0E6+8TZOUolFkY2LN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761164734; c=relaxed/simple;
	bh=C9TUXf/BFGCFFm3zphnKXyswGX9BNPQTaMW23jeHx4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LoJLJehdeM/E/PtN6/we0cSXwrenMJTnR7fRVfQwNIboI2XquwcmvcruVGxpUgGiYeUcosY6dYXI6+eSxBhTzCkSmeDuk991kyGEidUXTQBHR94CZgh6eRkh5laIb6EyaowuWRwMRNKzbbklslrpcCGWRhOvdJxyJiJhaNXuOfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mHguHdcF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MIex2V031877
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 20:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kwBtKfD8mDP
	l7FcbnLyfaJIKFXBqDMoNLBKZ6gdFoAQ=; b=mHguHdcFOLxTvtrNkYEkCWyFZVL
	j/nufqmWSL+c3K7KtU8wd7a0Wa9IPDn30Ge8JsvHBKKMm41robu5TSPajjygHGX1
	AZd8jS/PgnVjI5qoa7HP2ME+7+Q22NuOFf/PSaE0jCjiWrOZcChlXQO6cToZzorL
	ieLonDyjjI5lr6rA03Z1orMMzZzwAiPSEZNTpVJ+YyI5Y/NSCXYgygOCiCypYQGg
	ZnosX2lZop8CfAlnzWsDzLJ5i+WJeTAnh3TfGsZEq9UYPloDGC2bTi1kUoFkYWp7
	GYybfw/TLwT7TOi8fJjF42JC82uNPXveWBV4uz67GBPLS2Kde6OdYZLdbGw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2ge5ysd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 20:25:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e8a4c63182so724771cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 13:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761164730; x=1761769530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwBtKfD8mDPl7FcbnLyfaJIKFXBqDMoNLBKZ6gdFoAQ=;
        b=MjtdfQOynUrCYr8Hm7nGGbg1+63ZxAO3grcdhhn/wRQkndcXlBdgx69lXoLYi8ojO+
         ekynKA4cHN6CZyXyIvzEMH8XpuN8DvLwUEd2VtI4a9f/pl11DgQdbEtWMXQT1rFSQTlK
         wmcMNr6N3hxOdkVUzAzg1na8+Xpx8A67jFOqjOnuvV1su17BY7fs8wVwJDbhDbMxt8WZ
         PuqfyVPdzOXXBj1VcS+l9VA3mSVmIHxJVaW+wSNr++Nyva1XZztz1kXzf9slx82WRoXa
         +rfPsb+9lw+DjsS8IAJKAzVwe15/DnXzfWTepm+dP+CorIo13Sv2sPMxrWbyHHg2ClN+
         sUIw==
X-Forwarded-Encrypted: i=1; AJvYcCWOHsbigI3NBy0t7O1OAn8NK9fY9krYVCQ6MltwgtuxKVwGjkxzp9jl3HG1RHmUnMYGuXpeVT1b+MK2XSOT@vger.kernel.org
X-Gm-Message-State: AOJu0YzCgYjl47roAYCUo8tICC3gcylgGZc11kO+LX61Ikb9sDpsdGd0
	SZWXND8bHQMjvk0zZ6AJk4WYIPhf32UQA9t4UuiUyaLZHUdb2+cTrgvTVMYlkt1KhUiOs3rdvjP
	iSpsQmtxBSJSuHW116XzPvh/Q3DV62FHuEc0VibBcDcGwiq2Z/JYBSqnWQFi92RlddC7X
X-Gm-Gg: ASbGncu2KFZeK50ElOWNR0Nha8sO8JqPWwgGxffcWq5QcKCDt/6pNXL+veMTL/F4UmP
	uEAOhn0u+gIzzzM1j4mtXG1jSzB8WyoIBKP3Zyr5TIw70BNx2o/WqSj/stIX+VSrTp6gh7QTNFj
	AhbeClPVo3oVbeYBvku38hwLroMU+lnDaag1xqKQ4U3nv7H/Geug16ltoLjMaB049HrKMl1qSTZ
	kt4rbVYqCO03tHLVbN/eZcF77pnlCIRPCZiKNDR8C1CsVL22aOm95zGOXuAbxDfgXDaN9lFHx+q
	vUu5AHXg36ZKBtr9tl+VZY4lBNLrGJYaH9o7qjzKngc5B/MkTJeyh5HBYJp2ExE+tK7y/9q3cmh
	D1v1akn1miHDcK2wRXEcSI2zseJnYnW8eJnm/DUI=
X-Received: by 2002:a05:622a:15d4:b0:4e8:b783:f167 with SMTP id d75a77b69052e-4e8b783f435mr192705911cf.83.1761164730045;
        Wed, 22 Oct 2025 13:25:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrE/W51tvurdufAZvbqtet6VH0PYfY8oxN2yAq0I9RSUK8aDK8uU8m+lDbi7rlVWVVb6CLmg==
X-Received: by 2002:a05:622a:15d4:b0:4e8:b783:f167 with SMTP id d75a77b69052e-4e8b783f435mr192705501cf.83.1761164729520;
        Wed, 22 Oct 2025 13:25:29 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d5141a207sm4998566b.52.2025.10.22.13.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 13:25:29 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] accel/qaic: Add DMA Bridge Channel(DBC) sysfs and uevents
Date: Wed, 22 Oct 2025 22:25:25 +0200
Message-ID: <20251022202527.3873558-2-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022202527.3873558-1-youssef.abdulrahman@oss.qualcomm.com>
References: <20251022202527.3873558-1-youssef.abdulrahman@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX5TYrAJTwvJSG
 zsmn4SNJholNhEqKqhcMYvi2RZEdW+Eu7CMaQuNo8LiFY4tySUDnjF/YUbnI7pXRCJKwaLcs8a0
 rUvyH+kLC2xkrHgJSYmDXEGiLwyIY7rUB94Dv9nnO9j67eCUKQt/ja+S//WO7UwBi/ypdt8bpK7
 OXxhCEXLcc1wXFRzLIOEUjH0qPLWA4prBO/iCHXCBEB2dzlxP7n8zg39O+bvUrDTPrG57zQJAPU
 6XyAdQjEhmdLx2N0heJXN3YtO0/V2NE4JUqobNXOpf0Yiv3/zBeTF/zzy90PrwrTrLIPwE6F27P
 cOf98cW5iowpovtuL7d7BYxYlKnx21mTs0Oy0iH32Swomr+hFSTMF5uBmu3JCrouB5e1n0fuIer
 A/BultMRwuB/J2IUzdvWKF2mEJ6nmA==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f93dba cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=nt6Na7LQK8S_E-uQ5a4A:9 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: nMarWM3Gy0YOhTJraVXTvLhxLe52eGYd
X-Proofpoint-ORIG-GUID: nMarWM3Gy0YOhTJraVXTvLhxLe52eGYd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020

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
index 000000000000..d967e8a20c1c
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
+	snprintf(id_str, ARRAY_SIZE(id_str), "DBC_ID=%d", dbc_id);
+	snprintf(state_str, ARRAY_SIZE(state_str), "DBC_STATE=%d", state);
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
+		snprintf(dbc_attr->name, NAME_LEN, "dbc%d_state", i);
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


