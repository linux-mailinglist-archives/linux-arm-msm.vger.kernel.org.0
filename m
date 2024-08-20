Return-Path: <linux-arm-msm+bounces-29048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9487A957DEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 08:13:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C3C028439B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 06:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785B415B995;
	Tue, 20 Aug 2024 06:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RWMGTpCo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C2E158A23;
	Tue, 20 Aug 2024 06:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724134207; cv=none; b=j3hTTusJqS3O1gIeR9bNVUIn02YmJxT0BKahADndET+9XDlFMLzJ3BopeH3aSckBuKT3oOPB120/AL1lOBMX29ZD9nQhrAlERgUXIsIt5dbOUdZmXgmHFu42GVM2ggts/THfUBYHpS+pK0ZvfjHUXM6isCeSZ69VMgQ8DrEbORU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724134207; c=relaxed/simple;
	bh=AnSKb2FCDum2nucOMzNd/4tuPqX/Wv8S3X5d1tcBY4E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IbF3X6F1YWHGuV4Ml2f4VqwiAuTPxRBrBFHLDIu7lVhW2tgmkvjDA9gZqM56j/Zb/+VfGNzh/aBRnuHiqAkWN4nTs2rQObld5ln2tSIzcSBhlSn04duikeUB5Dg1ylou6UIBdGB7/Fm/n+dJU2J75DOd/Htn+vcUDBbO+uTPEfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RWMGTpCo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JN3ciC008364;
	Tue, 20 Aug 2024 06:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QAf4Dga8qf0QToI6BWXKWd
	8notDOy/ZYo/+VVu61V/Q=; b=RWMGTpCodf7sw1n7d9WOA6J8KISoHpsB0oQv8n
	//0fn3pu9Bnbn65CInXEMf+X7IVkUzJJtbwIQlVT6EbW0EIdyU494C2L/UGIm5XV
	9ZhCTzTTJBSpAVa7umkwFrst4ifdogafuEBhp03bO68Zohl49nuOEUgWAla9L7DB
	z8PsjHKH1lXKZJSX75uobJsz71Dz1mk7YgJiQ7VO7S5sJ0B0woufh1F0pFUbWo2h
	AWqGEFP/LsEOUG1hjH1YsTdKXDhwCxKn7aWbJZm5AcArG458ZpNWcvPhhcqFYLLL
	b2dWMPD1J7j8fx/7fxzdiy6FIHxAyZOLK6mxwYalnXl2Dfww==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412k6gejhh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 06:10:01 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47K6A0lK030963
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 06:10:00 GMT
Received: from hu-gokulsri-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 19 Aug 2024 23:09:57 -0700
From: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
To: <andersson@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>,
        <quic_viswanat@quicinc.com>, <quic_mojha@quicinc.com>
Subject: [PATCH V2 1/1] remoteproc: qcom: Add NOTIFY_FATAL event type to SSR subdevice
Date: Tue, 20 Aug 2024 11:39:43 +0530
Message-ID: <20240820060943.277260-1-quic_gokulsri@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YhVH3Q1ZVbaJOCMyb5wUkjY3tmWakyjI
X-Proofpoint-GUID: YhVH3Q1ZVbaJOCMyb5wUkjY3tmWakyjI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408200045

From: Vignesh Viswanathan <quic_viswanat@quicinc.com>

Currently the SSR subdevice notifies the client driver on crash of the
rproc from the recovery workqueue using the BEFORE_SHUTDOWN event.
However, the client driver might be interested to know that the device
has crashed immediately to pause any further transactions with the
rproc. This calls for an event to be sent to the driver in the IRQ
context as soon as the rproc crashes.

Add NOTIFY_FATAL event to SSR subdevice to atomically notify rproc has
crashed to the client driver. The client driver in this scenario is a
ath Wi-Fi driver which is continuously queuing data to the remoteproc and
needs to know if remoteproc crashes as soon as possible to stop queuing
further data and also dump some debug statistics on the driver side that
could potentially help in debug of why the remoteproc crashed.

Validated the event in IPQ9574 and IPQ5332 by forcing the rproc to crash
and ensuring the registered notifier function receives the notification
in IRQ context.

The client driver in this scenario is a Wi-Fi driver which is continuously
queuing data to the remoteproc and needs to know if remoteproc crashes
as soon as possible to stop queuing further data and also dump some 
debug statistics on the driver side that could potentially help in
debug of why the remoteproc crashed.

Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
Acked-by: Mukesh Ojha <quic_mojha@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
---
changes since v1:
	- No changes. Rebased on top of linux-next.
	- We will now have a user for this notifier, ath12k.

 drivers/remoteproc/qcom_common.c      | 60 +++++++++++++++++++++++++++
 drivers/remoteproc/remoteproc_core.c  | 12 ++++++
 include/linux/remoteproc.h            |  3 ++
 include/linux/remoteproc/qcom_rproc.h | 17 ++++++++
 4 files changed, 92 insertions(+)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 8c8688f99f0a..6efee422cc23 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -86,6 +86,7 @@ struct minidump_global_toc {
 struct qcom_ssr_subsystem {
 	const char *name;
 	struct srcu_notifier_head notifier_list;
+	struct atomic_notifier_head atomic_notifier_list;
 	struct list_head list;
 };
 
@@ -377,6 +378,7 @@ static struct qcom_ssr_subsystem *qcom_ssr_get_subsys(const char *name)
 	}
 	info->name = kstrdup_const(name, GFP_KERNEL);
 	srcu_init_notifier_head(&info->notifier_list);
+	ATOMIC_INIT_NOTIFIER_HEAD(&info->atomic_notifier_list);
 
 	/* Add to global notification list */
 	list_add_tail(&info->list, &qcom_ssr_subsystem_list);
@@ -428,6 +430,51 @@ int qcom_unregister_ssr_notifier(void *notify, struct notifier_block *nb)
 }
 EXPORT_SYMBOL_GPL(qcom_unregister_ssr_notifier);
 
+/**
+ * qcom_register_ssr_atomic_notifier() - register SSR Atomic notification
+ *					 handler
+ * @name:	Subsystem's SSR name
+ * @nb:	notifier_block to be invoked upon subsystem's state change
+ *
+ * This registers the @nb notifier block as part the atomic notifier
+ * chain for a remoteproc associated with @name. The notifier block's callback
+ * will be invoked when the remote processor crashes in atomic context before
+ * the recovery process is queued.
+ *
+ * Return: a subsystem cookie on success, ERR_PTR on failure.
+ */
+void *qcom_register_ssr_atomic_notifier(const char *name,
+					struct notifier_block *nb)
+{
+	struct qcom_ssr_subsystem *info;
+
+	info = qcom_ssr_get_subsys(name);
+	if (IS_ERR(info))
+		return info;
+
+	atomic_notifier_chain_register(&info->atomic_notifier_list, nb);
+
+	return &info->atomic_notifier_list;
+}
+EXPORT_SYMBOL_GPL(qcom_register_ssr_atomic_notifier);
+
+/**
+ * qcom_unregister_ssr_atomic_notifier() - unregister SSR Atomic notification
+ *					   handler
+ * @notify:	subsystem cookie returned from qcom_register_ssr_notifier
+ * @nb:		notifier_block to unregister
+ *
+ * This function will unregister the notifier from the atomic notifier
+ * chain.
+ *
+ * Return: 0 on success, %ENOENT otherwise.
+ */
+int qcom_unregister_ssr_atomic_notifier(void *notify, struct notifier_block *nb)
+{
+	return atomic_notifier_chain_unregister(notify, nb);
+}
+EXPORT_SYMBOL_GPL(qcom_unregister_ssr_atomic_notifier);
+
 static int ssr_notify_prepare(struct rproc_subdev *subdev)
 {
 	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
@@ -478,6 +525,18 @@ static void ssr_notify_unprepare(struct rproc_subdev *subdev)
 				 QCOM_SSR_AFTER_SHUTDOWN, &data);
 }
 
+static void ssr_notify_crash(struct rproc_subdev *subdev)
+{
+	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
+	struct qcom_ssr_notify_data data = {
+		.name = ssr->info->name,
+		.crashed = true,
+	};
+
+	atomic_notifier_call_chain(&ssr->info->atomic_notifier_list,
+				   QCOM_SSR_NOTIFY_CRASH, &data);
+}
+
 /**
  * qcom_add_ssr_subdev() - register subdevice as restart notification source
  * @rproc:	rproc handle
@@ -504,6 +563,7 @@ void qcom_add_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr,
 	ssr->subdev.start = ssr_notify_start;
 	ssr->subdev.stop = ssr_notify_stop;
 	ssr->subdev.unprepare = ssr_notify_unprepare;
+	ssr->subdev.notify_crash = ssr_notify_crash;
 
 	rproc_add_subdev(rproc, &ssr->subdev);
 }
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f276956f2c5c..1828831e0e77 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1140,6 +1140,16 @@ static void rproc_unprepare_subdevices(struct rproc *rproc)
 	}
 }
 
+static void rproc_notify_crash_subdevices(struct rproc *rproc)
+{
+	struct rproc_subdev *subdev;
+
+	list_for_each_entry_reverse(subdev, &rproc->subdevs, node) {
+		if (subdev->notify_crash)
+			subdev->notify_crash(subdev);
+	}
+}
+
 /**
  * rproc_alloc_registered_carveouts() - allocate all carveouts registered
  * in the list
@@ -2712,6 +2722,8 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
 	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
 		rproc->name, rproc_crash_to_string(type));
 
+	rproc_notify_crash_subdevices(rproc);
+
 	queue_work(rproc_recovery_wq, &rproc->crash_handler);
 }
 EXPORT_SYMBOL(rproc_report_crash);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index b4795698d8c2..5101a7ec01bb 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -596,6 +596,8 @@ struct rproc {
  * @stop: stop function, called before the rproc is stopped; the @crashed
  *	    parameter indicates if this originates from a recovery
  * @unprepare: unprepare function, called after the rproc has been stopped
+ * @notify_crash: notify_crash function, called in atomic context to notify
+ *		  rproc has crashed and recovery is about to start
  */
 struct rproc_subdev {
 	struct list_head node;
@@ -604,6 +606,7 @@ struct rproc_subdev {
 	int (*start)(struct rproc_subdev *subdev);
 	void (*stop)(struct rproc_subdev *subdev, bool crashed);
 	void (*unprepare)(struct rproc_subdev *subdev);
+	void (*notify_crash)(struct rproc_subdev *subdev);
 };
 
 /* we currently support only two vrings per rvdev */
diff --git a/include/linux/remoteproc/qcom_rproc.h b/include/linux/remoteproc/qcom_rproc.h
index 82b211518136..f3d06900f297 100644
--- a/include/linux/remoteproc/qcom_rproc.h
+++ b/include/linux/remoteproc/qcom_rproc.h
@@ -11,12 +11,14 @@ struct notifier_block;
  * @QCOM_SSR_AFTER_POWERUP:	Remoteproc is running (start stage)
  * @QCOM_SSR_BEFORE_SHUTDOWN:	Remoteproc crashed or shutting down (stop stage)
  * @QCOM_SSR_AFTER_SHUTDOWN:	Remoteproc is down (unprepare stage)
+ * @QCOM_SSR_NOTIFY_CRASH:	Remoteproc crashed
  */
 enum qcom_ssr_notify_type {
 	QCOM_SSR_BEFORE_POWERUP,
 	QCOM_SSR_AFTER_POWERUP,
 	QCOM_SSR_BEFORE_SHUTDOWN,
 	QCOM_SSR_AFTER_SHUTDOWN,
+	QCOM_SSR_NOTIFY_CRASH,
 };
 
 struct qcom_ssr_notify_data {
@@ -29,6 +31,10 @@ struct qcom_ssr_notify_data {
 void *qcom_register_ssr_notifier(const char *name, struct notifier_block *nb);
 int qcom_unregister_ssr_notifier(void *notify, struct notifier_block *nb);
 
+void *qcom_register_ssr_atomic_notifier(const char *name,
+					struct notifier_block *nb);
+int qcom_unregister_ssr_atomic_notifier(void *notify,
+					struct notifier_block *nb);
 #else
 
 static inline void *qcom_register_ssr_notifier(const char *name,
@@ -43,6 +49,17 @@ static inline int qcom_unregister_ssr_notifier(void *notify,
 	return 0;
 }
 
+static inline void *qcom_register_ssr_atomic_notifier(const char *name,
+						      struct notifier_block *nb)
+{
+	return 0;
+}
+
+static inline int qcom_unregister_ssr_atomic_notifier(void *notify,
+						      struct notifier_block *nb)
+{
+	return 0;
+}
 #endif
 
 #endif
-- 
2.34.1


