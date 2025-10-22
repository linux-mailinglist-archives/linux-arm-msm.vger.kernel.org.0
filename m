Return-Path: <linux-arm-msm+bounces-78409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A68BABFE31C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 22:40:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 868324F64BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 20:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA8A2FB98F;
	Wed, 22 Oct 2025 20:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m7UjtbL2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4D02F069E
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 20:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761165610; cv=none; b=rtF7qRyQjuxPRBnFKfm0OmrHZnQP/d4GUfFx0yQKyKhX/Nw30yS2TZ2AgP4TgtJlE2mNwVYHOYmMsD4fc6sFpsGlOA0AR/Fwpf+uZ++4obUplqjXJ4xdfH5+ipaqwYPh5Ak+gbfW0ObVTt0ZqE4sEo8o4iTrgtNYJsCj03rTECw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761165610; c=relaxed/simple;
	bh=iCoGFTpz60UISOv5P5iUrnD1IkVR1SLRJfmwdPJJhOs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XzXC8YP1zi+tYOIQoAMF0Q1aimG3AjN2DODLOmVa+e+zgyGdWKJfdo6GbIxfu45GSROQAi454jk/U89PaTKec9F5XZTDJm2Eq/BFAuQLaOV52jpuMzg+DVgg7CpeDY0pI9UjhQnNcAAjhtrFzUbdHAUT+pMWYY2mRjej7wfHCR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m7UjtbL2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MIeowo022471
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 20:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vtYqLWCW1JlzDtLcDpkmF7TsN4Rwb3nWFpn
	RFVM5IJI=; b=m7UjtbL2ekBewHJaUgYsIIEgt+K71GIpG+s+rVuzpOca7vy5fHT
	H4gybk0bnFbXcB7+ZbwhLNmvSCDB/lgTcR4z0kEy93y6SAoutp39d+E8T9X6LdJU
	xXe2DCKMDDvTQckMfY6Bzwdt6ATR37yGIRpyurK2aStb7hPH+zyZgogStLyEtI8p
	yThRJw+GgN6T5S2yZyJhNVysm1eIPr5rU7z+Q4RD9T5U4RjQ/tY/Wk6fRfBtEW/i
	tHZDKl+kQp+tm1h19aOBX60Fc1Hib493OH5rcOtHMKOkJjwWjHsTPS1hj0dAq2Zs
	TdKWGkou2B9h3CrY2+Bcfs+Q2YN4kgqWNUg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w862we-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 20:40:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8bb76ee59so1855591cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 13:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761165607; x=1761770407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vtYqLWCW1JlzDtLcDpkmF7TsN4Rwb3nWFpnRFVM5IJI=;
        b=PZmi9cZ/TYqj0MGnJNo8mhynWfP4Wl/lPDrOaVT0859/GiKxyZZ2bEoL11zBQFZhBb
         gRlPHA9S30ElmIc6px3uo2qmYiTSYPEWm9ruVMVUwU+tFUm7sU6tHPhBx/iq4dYjkYlu
         eqYkrGQdRKc5B8NrLBDtE6YnydHETzWv3naYJ8c9Qm0bj9NVvq8ft7RNY7DBDjD+NKsQ
         jmrF1rZQJLi3ZuWykjicCUqPZqMO8+lTqhK9GQEwD/+U+r0Ds0owSZivGvMZGQRH17db
         C6FhglB89uKBsD9iYf2KuyUOf/QSzqYt1XaW/CkgXcj959JtnJ13g8RX2tLirmZtHIpp
         litw==
X-Forwarded-Encrypted: i=1; AJvYcCX3ntJm5Q4I1FHHSHRtrS9W7mKDo88Mdyy1FLvnC2vsVz2qJGdzNcOHzfe5NRqvhZXoGrQqEi2iApEyFN+h@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4CVK90Q/7XhpRPy8mtEi2+MLTGisWNrDRQoeRKEFDL/xxji88
	i6jCBnmCuxU+9klLaElS1jTYSPnDiKhYdie5fvkWWw1zyj67vmSYtfmTiSJoyaA1OTiVnuH/GTf
	qPgqbu8ECyOW3rOrYICmVC0c3zBCfySmlyCoyKtqz2eSfwZ2PXY2YcLV8IcQFDZ1LZot/
X-Gm-Gg: ASbGnct51rxp6FZo6NK5SssD4UufgPB9UkOB2RgvcrOTd9Ep2waypBDLsLZLlxh5lZA
	/4T6Ro8ubJ4GIX3kT2gw7kOU9moJ31TL4UZyuqFykBQ3YTu5MtFbrL15djBNeMbGFOAz59eHoIi
	JYjIseiyNXpyfLbLDwI7xINpi+13DsIpJn0ehEgsvRj9c/Y82HMU9sDi9Bt/JF23l9zHPaUNpgU
	BxHm1luGNcPNV+mOBf1H39kCMbJq7NGNAxTZA04eHTbqSY6LYvQ3s/IX8s4Y/J/q39+78FxCffC
	OeSlkfr4icwkQMV9e1noA9hl7kt/HRBQLf6k0fFbNKyFYGYTuyFCnKHH//wxLYkAbSeottPohX1
	0J593SSAiWDNZxDiMMG5w9e4o7pkY3SjTY2CXGVc=
X-Received: by 2002:a05:622a:181c:b0:4e8:b4fd:de34 with SMTP id d75a77b69052e-4e8b4fdf3f3mr188327001cf.70.1761165606741;
        Wed, 22 Oct 2025 13:40:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl0MXdSBAUurKqzT8VouwoZ39qwMBqfWrgvNqsoRIiE/caEBea9tWKCpOKHB+jDFBaQs0Arg==
X-Received: by 2002:a05:622a:181c:b0:4e8:b4fd:de34 with SMTP id d75a77b69052e-4e8b4fdf3f3mr188326481cf.70.1761165606159;
        Wed, 22 Oct 2025 13:40:06 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d5144d61asm9399766b.62.2025.10.22.13.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 13:40:05 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Add support for PM callbacks
Date: Wed, 22 Oct 2025 22:40:05 +0200
Message-ID: <20251022204005.3888195-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX7pJ2E4qt+kOG
 Sg0WKBhmBpXfqBNNniZ2BkpdevPU2uGSMC0ua+FKD8cE5Ba0yRlXMP9M/Cbh0UKexQtIT79Kca9
 l2XnXrI7mvYjxrV481IEd/eMJqNQZazJGZt33QtejjT2Y+sYdINkqWVTH4XYOhF1yoP75/pbHWj
 H8Cg0chTe2CSUZEILraMsw15Ukbp+RkgAcd0mFkLOzg8sSv8RBZD1LXMMKvW71J9EMzB30GsWRS
 NXv2HgS6Kij+cDUBJPGjupDO3YeToYrO4NHtOTRuBnFrgW76S1q15Lx69N7n/Bn9VDsF1RxY84o
 ePqxqkf6TwZanyxug2UP2s3ewPKA7oA2mhypB41y0fJsTQetzmy8WN7CSsTuxc7hmkGw5Jehjkm
 XlNHV6OgB3vUWu+o4Gtrnt2JCRgoKA==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f94127 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=69-lKJUwG6m09LcNS64A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: HubjaeQxdpJeDYaT66olronDe24SsemM
X-Proofpoint-ORIG-GUID: HubjaeQxdpJeDYaT66olronDe24SsemM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

Add initial support for suspend and hibernation PM callbacks to QAIC.

Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic.h          |  2 +
 drivers/accel/qaic/qaic_drv.c      | 89 ++++++++++++++++++++++++++++++
 drivers/accel/qaic/qaic_timesync.c |  9 +++
 drivers/accel/qaic/qaic_timesync.h |  3 +
 4 files changed, 103 insertions(+)

diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index 820d133236dd..2bfc4ce203c5 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -161,6 +161,8 @@ struct qaic_device {
 	struct mhi_device	*qts_ch;
 	/* Work queue for tasks related to MHI "QAIC_TIMESYNC" channel */
 	struct workqueue_struct	*qts_wq;
+	/* MHI "QAIC_TIMESYNC_PERIODIC" channel device */
+	struct mhi_device	*mqts_ch;
 	/* Head of list of page allocated by MHI bootlog device */
 	struct list_head        bootlog;
 	/* MHI bootlog channel device */
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index e162f4b8a262..6cf0f42c9add 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -660,6 +660,92 @@ static const struct pci_error_handlers qaic_pci_err_handler = {
 	.reset_done = qaic_pci_reset_done,
 };
 
+static bool qaic_is_under_reset(struct qaic_device *qdev)
+{
+	int rcu_id;
+	bool ret;
+
+	rcu_id = srcu_read_lock(&qdev->dev_lock);
+	ret = qdev->dev_state != QAIC_ONLINE;
+	srcu_read_unlock(&qdev->dev_lock, rcu_id);
+	return ret;
+}
+
+static bool qaic_data_path_busy(struct qaic_device *qdev)
+{
+	int dev_rcu_id;
+	bool ret;
+	int i;
+
+	dev_rcu_id = srcu_read_lock(&qdev->dev_lock);
+	if (qdev->dev_state != QAIC_ONLINE) {
+		srcu_read_unlock(&qdev->dev_lock, dev_rcu_id);
+		return false;
+	}
+	for (i = 0; i < qdev->num_dbc; i++) {
+		struct dma_bridge_chan *dbc = &qdev->dbc[i];
+		unsigned long flags;
+		int ch_rcu_id;
+
+		ch_rcu_id = srcu_read_lock(&dbc->ch_lock);
+		if (!dbc->usr || !dbc->in_use) {
+			srcu_read_unlock(&dbc->ch_lock, ch_rcu_id);
+			continue;
+		}
+		spin_lock_irqsave(&dbc->xfer_lock, flags);
+		ret = !list_empty(&dbc->xfer_list);
+		spin_unlock_irqrestore(&dbc->xfer_lock, flags);
+		srcu_read_unlock(&dbc->ch_lock, ch_rcu_id);
+		if (ret)
+			break;
+	}
+	srcu_read_unlock(&qdev->dev_lock, dev_rcu_id);
+	return ret;
+}
+
+static int qaic_pm_suspend(struct device *dev)
+{
+	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(dev));
+
+	dev_dbg(dev, "Suspending..\n");
+	if (qaic_data_path_busy(qdev)) {
+		dev_dbg(dev, "Device's datapath is busy. Aborting suspend..\n");
+		return -EBUSY;
+	}
+	if (qaic_is_under_reset(qdev)) {
+		dev_dbg(dev, "Device is under reset. Aborting suspend..\n");
+		return -EBUSY;
+	}
+	qaic_mqts_ch_stop_timer(qdev->mqts_ch);
+	qaic_pci_reset_prepare(qdev->pdev);
+	pci_save_state(qdev->pdev);
+	pci_disable_device(qdev->pdev);
+	pci_set_power_state(qdev->pdev, PCI_D3hot);
+	return 0;
+}
+
+static int qaic_pm_resume(struct device *dev)
+{
+	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(dev));
+	int ret;
+
+	dev_dbg(dev, "Resuming..\n");
+	pci_set_power_state(qdev->pdev, PCI_D0);
+	pci_restore_state(qdev->pdev);
+	ret = pci_enable_device(qdev->pdev);
+	if (ret) {
+		dev_err(dev, "pci_enable_device failed on resume %d\n", ret);
+		return ret;
+	}
+	pci_set_master(qdev->pdev);
+	qaic_pci_reset_done(qdev->pdev);
+	return 0;
+}
+
+static const struct dev_pm_ops qaic_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(qaic_pm_suspend, qaic_pm_resume)
+};
+
 static struct pci_driver qaic_pci_driver = {
 	.name = QAIC_NAME,
 	.id_table = qaic_ids,
@@ -667,6 +753,9 @@ static struct pci_driver qaic_pci_driver = {
 	.remove = qaic_pci_remove,
 	.shutdown = qaic_pci_shutdown,
 	.err_handler = &qaic_pci_err_handler,
+	.driver = {
+		.pm = &qaic_pm_ops,
+	},
 };
 
 static int __init qaic_init(void)
diff --git a/drivers/accel/qaic/qaic_timesync.c b/drivers/accel/qaic/qaic_timesync.c
index 3fac540f8e03..8af2475f4f36 100644
--- a/drivers/accel/qaic/qaic_timesync.c
+++ b/drivers/accel/qaic/qaic_timesync.c
@@ -171,6 +171,13 @@ static void qaic_timesync_timer(struct timer_list *t)
 		dev_err(mqtsdev->dev, "%s mod_timer error:%d\n", __func__, ret);
 }
 
+void qaic_mqts_ch_stop_timer(struct mhi_device *mhi_dev)
+{
+	struct mqts_dev *mqtsdev = dev_get_drvdata(&mhi_dev->dev);
+
+	timer_delete_sync(&mqtsdev->timer);
+}
+
 static int qaic_timesync_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
 {
 	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(mhi_dev->mhi_cntrl->cntrl_dev));
@@ -206,6 +213,7 @@ static int qaic_timesync_probe(struct mhi_device *mhi_dev, const struct mhi_devi
 	timer->expires = jiffies + msecs_to_jiffies(timesync_delay_ms);
 	add_timer(timer);
 	dev_set_drvdata(&mhi_dev->dev, mqtsdev);
+	qdev->mqts_ch = mhi_dev;
 
 	return 0;
 
@@ -221,6 +229,7 @@ static void qaic_timesync_remove(struct mhi_device *mhi_dev)
 {
 	struct mqts_dev *mqtsdev = dev_get_drvdata(&mhi_dev->dev);
 
+	mqtsdev->qdev->mqts_ch = NULL;
 	timer_delete_sync(&mqtsdev->timer);
 	mhi_unprepare_from_transfer(mqtsdev->mhi_dev);
 	kfree(mqtsdev->sync_msg);
diff --git a/drivers/accel/qaic/qaic_timesync.h b/drivers/accel/qaic/qaic_timesync.h
index 851b7acd43bb..77b9c2b55057 100644
--- a/drivers/accel/qaic/qaic_timesync.h
+++ b/drivers/accel/qaic/qaic_timesync.h
@@ -6,6 +6,9 @@
 #ifndef __QAIC_TIMESYNC_H__
 #define __QAIC_TIMESYNC_H__
 
+#include <linux/mhi.h>
+
 int qaic_timesync_init(void);
 void qaic_timesync_deinit(void);
+void qaic_mqts_ch_stop_timer(struct mhi_device *mhi_dev);
 #endif /* __QAIC_TIMESYNC_H__ */
-- 
2.43.0


