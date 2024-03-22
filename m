Return-Path: <linux-arm-msm+bounces-14897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 583F2887389
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 20:02:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E0A2283328
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 19:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEAB976C99;
	Fri, 22 Mar 2024 19:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SEEuMyh3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45C876C90
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 19:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711134124; cv=none; b=TNdu1k1j6PCDYnaq+RSlqrQQKMBtPCtwjDk2QheNoaFR0QpltjITDr2MhXG7CIa48Es8fRA63HlqbdKqrriLjiw2Ge0pJwvyKYoOpCahUf3nZnfBrIIOoQPkSxJDguYd3Ws4+Tu+TVhjt5oXXDCUb+AQvHRNkw7Jsww0mGCckNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711134124; c=relaxed/simple;
	bh=PaMYLPdepzZZCz/G2QC+p/OHoztcNgyXtBs+KUZ6lS8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gezdnlo0oJPz59+mJALWCHVKBn9yBeWVy+eyJfEA5KyCHWvjWk1ikSjAc4oGWbcmNivZ7VrdvCOZAytlpccSha5Bv/8H2TqywmZnQqaBm43sAe7RU1ppl/Phne4nHPuKJlWOh7Cp7ITei5om7bX7W14jh2obuYE0WXXGz+fKZrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SEEuMyh3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42MHPQYN014933;
	Fri, 22 Mar 2024 19:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=E8OdGatpo9gTxIJnNScksbLtfpLKVxWlPwsvsfLIod8=; b=SE
	EuMyh3b2OVlhABeLL6uXwhmN8jv1nrbv98205JM5l2sQJvuJgz1UAh/VlT7Fi277
	HksiCDN1lAcO+ehjL/FO4Cfyab3hKeAm4TGJnmSmjD5Z3wGWIV8/gsKbeVFNC1vk
	25QZMcPZb/qdTBeN6u4loi9Wf3SCfNznqp6FIoWhI2so962Eg7bERUPDqc3ZAK+s
	cpSr+3tnohgwEMjEc0vv0eHkPlwgtezff+4VzBIoDrh2Oz0bIcsFxIuhJjV43v08
	MSt67sxVP5gHuhEP9w4dXBO0Gz0crkbJPAUCj2uR1MXzEaz1P4kUb0kJAJvLxPcW
	pLCgagvSbSX52xN5KF5w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x0wy9u18x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Mar 2024 19:01:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42MJ1iT0014764
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Mar 2024 19:01:44 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 22 Mar 2024 12:01:43 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
        <stanislaw.gruszka@linux.intel.com>,
        <jacek.lawrynowicz@linux.intel.com>, <daniel@ffwll.ch>,
        <jiasheng@iscas.ac.cn>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <ogabbay@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jeffrey Hugo
	<quic_jhugo@quicinc.com>
Subject: [PATCH v2 1/2] drm: Add DRM-managed alloc_workqueue() and alloc_ordered_workqueue()
Date: Fri, 22 Mar 2024 13:01:20 -0600
Message-ID: <20240322190121.3881425-2-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240322190121.3881425-1-quic_jhugo@quicinc.com>
References: <20240322190121.3881425-1-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: cKuIMFT2Ny_IC3DKMc-ZrJeLbR8v3N-i
X-Proofpoint-GUID: cKuIMFT2Ny_IC3DKMc-ZrJeLbR8v3N-i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-22_11,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403220137

From: Jiasheng Jiang <jiasheng@iscas.ac.cn>

Add drmm_alloc_workqueue() and drmm_alloc_ordered_workqueue(), the helpers
that provide managed workqueue cleanup. The workqueue will be destroyed
with the final reference of the DRM device.

Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
[jhugo: fix API to return the alloc'd workqueue]
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
---
 drivers/gpu/drm/drm_managed.c | 87 +++++++++++++++++++++++++++++++++++
 include/drm/drm_managed.h     |  8 ++++
 2 files changed, 95 insertions(+)

diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index 7646f67bda4e..fe31117b3811 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -310,3 +310,90 @@ void __drmm_mutex_release(struct drm_device *dev, void *res)
 	mutex_destroy(lock);
 }
 EXPORT_SYMBOL(__drmm_mutex_release);
+
+static void drmm_destroy_workqueue(struct drm_device *dev, void *res)
+{
+	struct workqueue_struct *wq = res;
+
+	destroy_workqueue(wq);
+}
+
+/**
+ * drmm_alloc_workqueue - &drm_device-managed alloc_workqueue()
+ * @dev: DRM device
+ * @fmt: printf format for the name of the workqueue
+ * @flags: WQ_* flags
+ * @max_active: max in-flight work items per CPU, 0 for default
+ * remaining args: args for @fmt
+ *
+ * Returns:
+ * Valid pointer on success, NULL on error.
+ *
+ * This is a &drm_device-managed version of alloc_workqueue().
+ * The initialized lock is automatically destroyed on the final
+ * drm_dev_put().
+ */
+struct workqueue_struct *drmm_alloc_workqueue(struct drm_device *dev,
+					      const char *fmt, unsigned int flags,
+					      int max_active, ...)
+{
+	struct workqueue_struct *wq;
+	va_list args;
+	int ret;
+
+	va_start(args, max_active);
+	wq = alloc_workqueue(fmt, flags, max_active, args);
+	va_end(args);
+
+	if (!wq)
+		return NULL;
+
+	ret = drmm_add_action_or_reset(dev, drmm_destroy_workqueue, wq);
+	if (ret) {
+		destroy_workqueue(wq);
+		return NULL;
+	}
+
+	return wq;
+}
+EXPORT_SYMBOL(drmm_alloc_workqueue);
+
+/**
+ * drmm_alloc_ordered_workqueue - &drm_device-managed
+ * alloc_ordered_workqueue()
+ * @dev: DRM device
+ * @fmt: printf format for the name of the workqueue
+ * @flags: WQ_* flags
+ * remaining args: args for @fmt
+ *
+ * Returns:
+ * Valid pointer on success, NULL on error.
+ *
+ * This is a &drm_device-managed version of alloc_ordered_workqueue().
+ * The initialized lock is automatically destroyed on the final
+ * drm_dev_put().
+ */
+struct workqueue_struct *drmm_alloc_ordered_workqueue(struct drm_device *dev,
+						      const char *fmt,
+						      unsigned int flags, ...)
+{
+	struct workqueue_struct *wq;
+	va_list args;
+	int ret;
+
+	va_start(args, flags);
+	wq = alloc_ordered_workqueue(fmt, flags, args);
+	va_end(args);
+
+	if (!wq)
+		return NULL;
+
+	ret = drmm_add_action_or_reset(dev, drmm_destroy_workqueue, wq);
+	if (ret) {
+		destroy_workqueue(wq);
+		return NULL;
+	}
+
+	return wq;
+}
+EXPORT_SYMBOL(drmm_alloc_ordered_workqueue);
diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
index f547b09ca023..cb42fb252648 100644
--- a/include/drm/drm_managed.h
+++ b/include/drm/drm_managed.h
@@ -127,4 +127,12 @@ void __drmm_mutex_release(struct drm_device *dev, void *res);
 	drmm_add_action_or_reset(dev, __drmm_mutex_release, lock);	     \
 })									     \
 
+struct workqueue_struct *drmm_alloc_workqueue(struct drm_device *dev,
+					      const char *fmt, unsigned int flags,
+					      int max_active, ...);
+
+struct workqueue_struct *drmm_alloc_ordered_workqueue(struct drm_device *dev,
+						      const char *fmt,
+						      unsigned int flags, ...);
+
 #endif
-- 
2.34.1


