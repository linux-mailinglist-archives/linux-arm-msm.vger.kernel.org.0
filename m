Return-Path: <linux-arm-msm+bounces-21085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 505E88D4991
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 12:24:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B82521F21D26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 10:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEBAD183A7E;
	Thu, 30 May 2024 10:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ByCTx+vd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D9D183A76;
	Thu, 30 May 2024 10:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717064472; cv=none; b=IVo8r1IOamSfCgOtRWp9HH4tVViejhZCBWs18+EuieuXq8fMcP6NMV9fcvafcJRNPN5ScKiaEOtYx90IFaQbrtvEKioqZFJxTrd9WHCYxBmbyuhmkLOSoEnp5H0OzYHDLT9tClUXeXxm4ImjZ2AUcKPY6iiJew9DWYACw0dR94k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717064472; c=relaxed/simple;
	bh=lWUVovV8diMODE6RkshdgaufNsjzuhV3F8PtdYrCg1w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rpYl54G+7S2hsFEkfeAaqH+tEqk55Bl0VRQ1yv4SiwTfLZtCpubB/mB/vc+fAdvmmhkLkZl24OZQG7PkUQLCEHGA4JjG8YnoYNi8gZcWXbgm2vhs5v1kzPNqupUQchjMqM2dYqM7gVUsbIoDXFSPWqp5OSkl+MsOLjApyBoZjr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ByCTx+vd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44U8N5J6025517;
	Thu, 30 May 2024 10:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	luZTosupL6TDya/Gh2MiaCHdLtt1tzOx79R4jtJkzrM=; b=ByCTx+vdiYAjIDDK
	I3kF5CbK+Ow9Ko3cpbR+YLq5I77cCPzwdiLuF6q/sJzcE3kwbYGKUOCbN0UHXKA+
	xO2sRi408+u5VeOMq1bqLMgClx71t9zgjJMPXCz55WiA7sqK1YPperXC86ZSD4/3
	M/yOXfL7m6ArcTxih4mBm0Pif8ZH7HxQGOI2qXU6YWfepNyHnEU5aL3IrPuHZ11g
	m1oEjGyfePZwj+2KRCxaaO+jUpOZGcKpuUdHr4aTaBFxEiG8K4QGK8A+oobOXsl3
	+aLl8VEarvrS41TmrHU6DwPNTr67iwNXhkBppSP3e6fZbxvBEhbKw5ZN6NpKMI5u
	ALwq+A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2pur0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 10:21:08 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44UAL8fQ001393
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 10:21:08 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 30 May 2024 03:21:05 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>
Subject: [PATCH v3 9/9] misc: fastrpc: Add system unsigned PD support
Date: Thu, 30 May 2024 15:50:27 +0530
Message-ID: <20240530102032.27179-10-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240530102032.27179-1-quic_ekangupt@quicinc.com>
References: <20240530102032.27179-1-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Qq4so4NFU9_Q5kNRF-_zFc2Bj3Oc3EzU
X-Proofpoint-ORIG-GUID: Qq4so4NFU9_Q5kNRF-_zFc2Bj3Oc3EzU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_07,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405300078

Trusted CPU applications currently offload to signed PDs on CDSP to
gain some additional services provided by root PD. Unsigned PDs have
access to limited root PD services that may not be sufficient for
all use-cases. Signed PDs have a higher dynamic loading latency
which impacts the performance of applications. Limited root PD
services could be opened up for unsigned PDs but that should be
restricted for untrusted processes. For this requirement, System
unsigned PD is introduced which will be same as Unsigned PD for
most part but will have access to more root PD services. Add
changes to offload trusted applications to System unsigned PD
when unsigned offload is requested.

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c      | 27 +++++++++++++++++++++------
 include/uapi/misc/fastrpc.h |  2 ++
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 32615ccde7ac..fc24653d7b7e 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -119,6 +119,12 @@
 #define SENSORS_PDR_SLPI_SERVICE_NAME            SENSORS_PDR_ADSP_SERVICE_NAME
 #define SLPI_SENSORPD_NAME                       "msm/slpi/sensor_pd"
 
+enum fastrpc_userpd_type {
+	SIGNED_PD			= 1,
+	UNSIGNED_PD			= 2,
+	SYSTEM_UNSIGNED_PD		= 3,
+};
+
 static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
 						"sdsp", "cdsp"};
 struct fastrpc_phy_page {
@@ -327,7 +333,7 @@ struct fastrpc_user {
 	int tgid;
 	int pd;
 	bool is_secure_dev;
-	bool is_unsigned_pd;
+	enum fastrpc_userpd_type userpd_type;
 	bool untrusted_process;
 	char *servloc_name;
 	/* Lock for lists */
@@ -1518,14 +1524,22 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 		fl->untrusted_process = true;
 
 	if (init.attrs & FASTRPC_MODE_UNSIGNED_MODULE)
-		fl->is_unsigned_pd = true;
+		fl->userpd_type = UNSIGNED_PD;
 
+	/* Disregard any system unsigned PD attribute from userspace */
+	init.attrs &= (~FASTRPC_MODE_SYSTEM_UNSIGNED_PD);
 
-	if (is_session_rejected(fl, fl->is_unsigned_pd)) {
+	if (is_session_rejected(fl, fl->userpd_type != SIGNED_PD)) {
 		err = -EACCES;
 		goto err;
 	}
 
+	/* Trusted apps will be launched as system unsigned PDs */
+	if (!fl->untrusted_process && (fl->userpd_type != SIGNED_PD)) {
+		fl->userpd_type = SYSTEM_UNSIGNED_PD;
+		init.attrs |= FASTRPC_MODE_SYSTEM_UNSIGNED_PD;
+	}
+
 	if (init.filelen > INIT_FILELEN_MAX) {
 		err = -EINVAL;
 		goto err;
@@ -1718,6 +1732,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	fl->tgid = current->tgid;
 	fl->cctx = cctx;
 	fl->is_secure_dev = fdevice->secure;
+	fl->userpd_type = SIGNED_PD;
 
 	fl->sctx = fastrpc_session_alloc(cctx);
 	if (!fl->sctx) {
@@ -2133,7 +2148,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 		return -EFAULT;
 
 	if ((req.flags == ADSP_MMAP_ADD_PAGES ||
-		req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) && !fl->is_unsigned_pd) {
+			req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) && (fl->userpd_type == SIGNED_PD)) {
 		if (req.vaddrin) {
 			dev_err(dev, "adding user allocated pages is not supported for signed PD\n");
 			return -EINVAL;
@@ -2188,7 +2203,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 		dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
 			buf->raddr, buf->size);
 	} else {
-		if ((req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) && fl->is_unsigned_pd) {
+		if ((req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) && (fl->userpd_type != SIGNED_PD)) {
 			dev_err(dev, "secure memory allocation is not supported in unsigned PD\n");
 			return -EINVAL;
 		}
@@ -2220,7 +2235,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 
 err_copy:
 	if ((req.flags != ADSP_MMAP_ADD_PAGES &&
-		req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) || fl->is_unsigned_pd) {
+		req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) || fl->userpd_type != SIGNED_PD) {
 		fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
 	} else {
 		spin_lock(&fl->lock);
diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index f33d914d8f46..3b3279bb2cf9 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -62,6 +62,8 @@ enum fastrpc_proc_attr {
 	FASTRPC_MODE_SYSTEM_PROCESS	= (1 << 5),
 	/* Macro for Prvileged Process */
 	FASTRPC_MODE_PRIVILEGED		= (1 << 6),
+	/* Macro for system unsigned PD */
+	FASTRPC_MODE_SYSTEM_UNSIGNED_PD	= (1 << 17),
 };
 
 /* Fastrpc attribute for memory protection of buffers */
-- 
2.43.0


