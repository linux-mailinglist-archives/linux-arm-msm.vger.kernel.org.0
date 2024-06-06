Return-Path: <linux-arm-msm+bounces-21980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA95A8FF332
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 19:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18F6D1F22AA9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 17:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C09C19923B;
	Thu,  6 Jun 2024 17:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iitavlBX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7196D199383;
	Thu,  6 Jun 2024 17:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717693212; cv=none; b=OsuMwPQz9dm2vx6nXXBQmhNTEtT6obxMCqq9LBVbA+/w+jfQTne/w4THQtKNa/AW33lHmxjZFKoGtRVljh77jVOOCz1xU9P3QFMLv/vN4EqdrOgU7MkMcmCoT4T4utMBEjzumPv6aDFujsEhiFo1B6h//KDEc104xPV9tCYxJpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717693212; c=relaxed/simple;
	bh=h3H0wQ/8slqoNU8d5XTUqPrw9l09MotW2mPL6afZRss=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TWB6vLoic2M9aYFdUfV35fpPeZHduVx1iZGnGBWWqCgUJEwc0LjKEOyPIuhCxjwjAIHl6iHvSo9wrQykh9pE0fLWWVOuyCcBF06AZv0vQg9bgKXoE9l0jrCx2JuHsWH6/MpLU7OyL+YI0D/0C9c6fBAgOrEVRgprWRjJdd2J0EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iitavlBX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 456AmL3B031268;
	Thu, 6 Jun 2024 17:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xk/nWOnYFKGwFzej6OPoWtm3A5Rv1m05V+78rkT7NLE=; b=iitavlBXVvdbsGaj
	ZwjAu/ek4uvgdSJ47D2iGh3UEXTCwnuLexCg76ZT6wpxaAGgXQx9LRi/UdGffYaB
	+7Pe0Ht3ouSxdFGZtyD94JRaMZH9kYhUfKUUoR5Auq5zraZi6QF5nI1i0Uf2daxL
	/I6jCum+mZp7JEG6GxA55CB+wgzes/Z5DjnTsQj9JECZBw4gYTRK89AMwbR1AVq6
	l6DMO0yKjTEZa4jeyv1PPRnfTiv5gmwag4PyWOOUO04EY0NQQ+xm86RJNSKCU+k3
	bjiQo0oUw5+IpwQXtLmTOPKU2a5XNaKsCW5T+6AgRyFMx1S/fSDpnLWig8DypGkr
	CP2VzA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yj87rnf5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 17:00:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 456H04aa015002
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Jun 2024 17:00:04 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Jun 2024 10:00:01 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>
Subject: [PATCH v4 05/11] misc: fastrpc: Add static PD restart support
Date: Thu, 6 Jun 2024 22:29:25 +0530
Message-ID: <20240606165939.12950-6-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240606165939.12950-1-quic_ekangupt@quicinc.com>
References: <20240606165939.12950-1-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vLOmSHcLl35GJ2j8m1mQ8dbcnFr-0G4h
X-Proofpoint-ORIG-GUID: vLOmSHcLl35GJ2j8m1mQ8dbcnFr-0G4h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_13,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406060120

Static PDs are created on DSPs to support specific use cases like Audio
and Sensors. The static PDs uses any CPU requirements like file
operations or memory need with the help of a daemon running on the CPU.
Audio and sensors daemons attaches to audio PD and sensors PD on DSP.
Audio PD expects some CMA memory for dynamic loading purpose which is
allocated and sent to DSP in fastrpc_init_create_static_process call.
For sensor daemon, the expectation is just to attach to sensors PD and
take up any requests made by the PD(like file operations etc.).

Static PDs run on the audio and sensor supporting subsystem which can
be ADSP or SDSP. They are expected to support PD restart. There are some
CPU resources like buffers etc. for static PDs which are expected to be
cleaned up by fastrpc driver during PDR scenario. For this, there is a
requirement of PD service locator to get the event notifications for
static PD services. Also when events are received, the driver needs to
handle based on PD states.

PDR handling is required for static PD only. There are no static PD
supported on MDSP or CDSP hence no PDR handling is required. PDR is also
not required for root_pd as if root_pd is shutting down, that basically
suggests that the remoteproc itself is shutting down which is handled
with rpmsg functionalities(probe and remove).

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/Kconfig   |   2 +
 drivers/misc/fastrpc.c | 205 ++++++++++++++++++++++++++++++++++++++---
 2 files changed, 195 insertions(+), 12 deletions(-)

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index faf983680040..e2d83cd085b5 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -280,8 +280,10 @@ config QCOM_FASTRPC
 	tristate "Qualcomm FastRPC"
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on RPMSG
+	depends on NET
 	select DMA_SHARED_BUFFER
 	select QCOM_SCM
+	select QCOM_PDR_HELPERS
 	help
 	  Provides a communication mechanism that allows for clients to
 	  make remote method invocations across processor boundary to
diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index abdd35b7c3ad..13e368279765 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -22,6 +22,7 @@
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <uapi/misc/fastrpc.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/soc/qcom/pdr.h>
 
 #define ADSP_DOMAIN_ID (0)
 #define MDSP_DOMAIN_ID (1)
@@ -29,6 +30,7 @@
 #define CDSP_DOMAIN_ID (3)
 #define FASTRPC_DEV_MAX		4 /* adsp, mdsp, slpi, cdsp*/
 #define FASTRPC_MAX_SESSIONS	14
+#define FASTRPC_MAX_SPD		4
 #define FASTRPC_MAX_VMIDS	16
 #define FASTRPC_ALIGN		128
 #define FASTRPC_MAX_FDLIST	16
@@ -105,6 +107,18 @@
 
 #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
 
+#define AUDIO_PDR_SERVICE_LOCATION_CLIENT_NAME   "audio_pdr_adsp"
+#define AUDIO_PDR_ADSP_SERVICE_NAME              "avs/audio"
+#define ADSP_AUDIOPD_NAME                        "msm/adsp/audio_pd"
+
+#define SENSORS_PDR_ADSP_SERVICE_LOCATION_CLIENT_NAME   "sensors_pdr_adsp"
+#define SENSORS_PDR_ADSP_SERVICE_NAME              "tms/servreg"
+#define ADSP_SENSORPD_NAME                       "msm/adsp/sensor_pd"
+
+#define SENSORS_PDR_SLPI_SERVICE_LOCATION_CLIENT_NAME "sensors_pdr_slpi"
+#define SENSORS_PDR_SLPI_SERVICE_NAME            SENSORS_PDR_ADSP_SERVICE_NAME
+#define SLPI_SENSORPD_NAME                       "msm/slpi/sensor_pd"
+
 static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
 						"sdsp", "cdsp"};
 struct fastrpc_phy_page {
@@ -259,6 +273,15 @@ struct fastrpc_session_ctx {
 	bool valid;
 };
 
+struct fastrpc_static_pd {
+	char *servloc_name;
+	char *spdname;
+	void *pdrhandle;
+	struct fastrpc_channel_ctx *cctx;
+	struct fastrpc_user *fl;
+	bool ispdup;
+};
+
 struct fastrpc_channel_ctx {
 	int domain_id;
 	int sesscount;
@@ -266,6 +289,7 @@ struct fastrpc_channel_ctx {
 	struct qcom_scm_vmperm vmperms[FASTRPC_MAX_VMIDS];
 	struct rpmsg_device *rpdev;
 	struct fastrpc_session_ctx session[FASTRPC_MAX_SESSIONS];
+	struct fastrpc_static_pd spd[FASTRPC_MAX_SPD];
 	spinlock_t lock;
 	struct idr ctx_idr;
 	struct list_head users;
@@ -297,10 +321,12 @@ struct fastrpc_user {
 	struct fastrpc_channel_ctx *cctx;
 	struct fastrpc_session_ctx *sctx;
 	struct fastrpc_buf *init_mem;
+	struct fastrpc_static_pd *spd;
 
 	int tgid;
 	int pd;
 	bool is_secure_dev;
+	char *servloc_name;
 	/* Lock for lists */
 	spinlock_t lock;
 	/* lock for allocations */
@@ -1230,12 +1256,33 @@ static bool is_session_rejected(struct fastrpc_user *fl, bool unsigned_pd_reques
 	return false;
 }
 
+static struct fastrpc_static_pd *fastrpc_get_spd_session(
+				struct fastrpc_user *fl)
+{
+	int i;
+	struct fastrpc_static_pd *spd = NULL;
+	struct fastrpc_channel_ctx *cctx = fl->cctx;
+
+	for (i = 0; i < FASTRPC_MAX_SPD ; i++) {
+		if (!cctx->spd[i].servloc_name)
+			continue;
+		if (!strcmp(fl->servloc_name, cctx->spd[i].servloc_name)) {
+			spd = &cctx->spd[i];
+			spd->fl = fl;
+			break;
+		}
+	}
+
+	return spd;
+}
+
 static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 					      char __user *argp)
 {
 	struct fastrpc_init_create_static init;
 	struct fastrpc_invoke_args *args;
 	struct fastrpc_phy_page pages[1];
+	struct fastrpc_static_pd *spd = NULL;
 	char *name;
 	int err;
 	struct {
@@ -1270,6 +1317,19 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 		goto err_name;
 	}
 
+	fl->servloc_name = AUDIO_PDR_SERVICE_LOCATION_CLIENT_NAME;
+
+	spd = fastrpc_get_spd_session(fl);
+	if (!spd) {
+		err = -EUSERS;
+		goto err_name;
+	}
+
+	if (!spd->ispdup) {
+		err = -ENOTCONN;
+		goto err_name;
+	}
+	fl->spd = spd;
 	if (!fl->cctx->remote_heap) {
 		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
 						&fl->cctx->remote_heap);
@@ -1645,6 +1705,7 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
 static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
 {
 	struct fastrpc_invoke_args args[1];
+	struct fastrpc_static_pd *spd = NULL;
 	int tgid = fl->tgid;
 	u32 sc;
 
@@ -1654,6 +1715,22 @@ static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
 	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_ATTACH, 1, 0);
 	fl->pd = pd;
 
+	if (pd == SENSORS_PD) {
+		if (fl->cctx->domain_id == ADSP_DOMAIN_ID)
+			fl->servloc_name = SENSORS_PDR_ADSP_SERVICE_LOCATION_CLIENT_NAME;
+		else if (fl->cctx->domain_id == SDSP_DOMAIN_ID)
+			fl->servloc_name = SENSORS_PDR_SLPI_SERVICE_LOCATION_CLIENT_NAME;
+
+		spd = fastrpc_get_spd_session(fl);
+		if (!spd)
+			return -EUSERS;
+
+		if (!spd->ispdup)
+			return -ENOTCONN;
+
+		fl->spd = spd;
+	}
+
 	return fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
 				       sc, &args[0]);
 }
@@ -2129,6 +2206,64 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
 	return err;
 }
 
+static void fastrpc_notify_users(struct fastrpc_user *user)
+{
+	struct fastrpc_invoke_ctx *ctx;
+
+	spin_lock(&user->lock);
+	list_for_each_entry(ctx, &user->pending, node) {
+		ctx->retval = -EPIPE;
+		complete(&ctx->work);
+	}
+	spin_unlock(&user->lock);
+}
+
+static void fastrpc_notify_pdr_drivers(struct fastrpc_channel_ctx *cctx,
+		char *servloc_name)
+{
+	struct fastrpc_user *fl;
+	unsigned long flags;
+
+	spin_lock_irqsave(&cctx->lock, flags);
+	list_for_each_entry(fl, &cctx->users, user) {
+		if (fl->servloc_name && !strcmp(servloc_name, fl->servloc_name))
+			fastrpc_notify_users(fl);
+	}
+	spin_unlock_irqrestore(&cctx->lock, flags);
+}
+
+static void fastrpc_pdr_cb(int state, char *service_path, void *priv)
+{
+	struct fastrpc_static_pd *spd = (struct fastrpc_static_pd *)priv;
+	struct fastrpc_channel_ctx *cctx;
+
+	if (!spd)
+		return;
+
+	cctx = spd->cctx;
+	switch (state) {
+	case SERVREG_SERVICE_STATE_DOWN:
+		dev_info(&cctx->rpdev->dev,
+			"%s: %s (%s) is down for PDR on %s\n",
+			__func__, spd->spdname,
+			spd->servloc_name,
+			domains[cctx->domain_id]);
+		spd->ispdup = false;
+		fastrpc_notify_pdr_drivers(cctx, spd->servloc_name);
+		break;
+	case SERVREG_SERVICE_STATE_UP:
+		dev_info(&cctx->rpdev->dev,
+			"%s: %s (%s) is up for PDR on %s\n",
+			__func__, spd->spdname,
+			spd->servloc_name,
+			domains[cctx->domain_id]);
+		spd->ispdup = true;
+		break;
+	default:
+		break;
+	}
+}
+
 static const struct file_operations fastrpc_fops = {
 	.open = fastrpc_device_open,
 	.release = fastrpc_device_release,
@@ -2248,6 +2383,39 @@ static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ct
 	return err;
 }
 
+static int fastrpc_setup_service_locator(struct fastrpc_channel_ctx *cctx, char *client_name,
+			char *service_name, char *service_path, int domain, int spd_session)
+{
+	int err = 0;
+	struct pdr_handle *handle = NULL;
+	struct pdr_service *service = NULL;
+
+	/* Register the service locator's callback function */
+	handle = pdr_handle_alloc(fastrpc_pdr_cb, &cctx->spd[spd_session]);
+	if (IS_ERR(handle)) {
+		err = PTR_ERR(handle);
+		goto bail;
+	}
+	cctx->spd[spd_session].pdrhandle = handle;
+	cctx->spd[spd_session].servloc_name = client_name;
+	cctx->spd[spd_session].spdname = service_path;
+	cctx->spd[spd_session].cctx = cctx;
+	service = pdr_add_lookup(handle, service_name, service_path);
+	if (IS_ERR(service)) {
+		err = PTR_ERR(service);
+		goto bail;
+	}
+	pr_info("fastrpc: %s: pdr_add_lookup enabled for %s (%s, %s)\n",
+		__func__, service_name, client_name, service_path);
+
+bail:
+	if (err) {
+		pr_warn("fastrpc: %s: failed for %s (%s, %s)with err %d\n",
+				__func__, service_name, client_name, service_path, err);
+	}
+	return err;
+}
+
 static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 {
 	struct device *rdev = &rpdev->dev;
@@ -2326,6 +2494,25 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		goto fdev_error;
 	}
 
+	if (domain_id == ADSP_DOMAIN_ID) {
+		err = fastrpc_setup_service_locator(data, AUDIO_PDR_SERVICE_LOCATION_CLIENT_NAME,
+			AUDIO_PDR_ADSP_SERVICE_NAME, ADSP_AUDIOPD_NAME, domain_id, 0);
+		if (err)
+			goto populate_error;
+
+		err = fastrpc_setup_service_locator(data,
+			SENSORS_PDR_ADSP_SERVICE_LOCATION_CLIENT_NAME,
+			SENSORS_PDR_ADSP_SERVICE_NAME, ADSP_SENSORPD_NAME, domain_id, 1);
+		if (err)
+			goto populate_error;
+	} else if (domain_id == SDSP_DOMAIN_ID) {
+		err = fastrpc_setup_service_locator(data,
+			SENSORS_PDR_SLPI_SERVICE_LOCATION_CLIENT_NAME,
+			SENSORS_PDR_SLPI_SERVICE_NAME, SLPI_SENSORPD_NAME, domain_id, 0);
+		if (err)
+			goto populate_error;
+	}
+
 	kref_init(&data->refcount);
 
 	dev_set_drvdata(&rpdev->dev, data);
@@ -2355,24 +2542,13 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	return err;
 }
 
-static void fastrpc_notify_users(struct fastrpc_user *user)
-{
-	struct fastrpc_invoke_ctx *ctx;
-
-	spin_lock(&user->lock);
-	list_for_each_entry(ctx, &user->pending, node) {
-		ctx->retval = -EPIPE;
-		complete(&ctx->work);
-	}
-	spin_unlock(&user->lock);
-}
-
 static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 {
 	struct fastrpc_channel_ctx *cctx = dev_get_drvdata(&rpdev->dev);
 	struct fastrpc_buf *buf, *b;
 	struct fastrpc_user *user;
 	unsigned long flags;
+	int i;
 
 	/* No invocations past this point */
 	spin_lock_irqsave(&cctx->lock, flags);
@@ -2393,6 +2569,11 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	if (cctx->remote_heap)
 		fastrpc_buf_free(cctx->remote_heap);
 
+	for (i = 0; i < FASTRPC_MAX_SPD; i++) {
+		if (cctx->spd[i].pdrhandle)
+			pdr_handle_release(cctx->spd[i].pdrhandle);
+	}
+
 	of_platform_depopulate(&rpdev->dev);
 
 	fastrpc_channel_ctx_put(cctx);
-- 
2.43.0


