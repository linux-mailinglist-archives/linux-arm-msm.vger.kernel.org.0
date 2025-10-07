Return-Path: <linux-arm-msm+bounces-76169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A403DBC0500
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 08:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3851E3C1377
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 06:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03EB1204583;
	Tue,  7 Oct 2025 06:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nkHgWGw+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4852013B58B
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 06:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759817922; cv=none; b=mFiwRTHs7Wv6Im2pKexSKsAX2On9TFmWE3keJlFh6+tkuvCwyM+kk/k3612+5TFKFojUPKi4II2QoXAjlYV1Xoe2OkmcRgXa7l4ird5gX6ItKH/naVGiiOxnPX36kjMviJX2Ie5W8g/Lmc4vwPRbn9we//auq9T6sEhDStdX9g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759817922; c=relaxed/simple;
	bh=vsHE2lWKAU5nkO+7tKox9JQEUxeljwZtYdz0bQu4JG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M09DvV5BMQrYrwg6/kiiFgsY3E723+TSKi42FYqTzuueBkz+6+DjNooPs/WwU9vNHMEc1wy2Qi2b2BHCs0hIXPeDovN9CCzteBVEozZSo2OzsOq/E/Jw/H1mINBp7uMLDbsmf7z0um25SyfH+gL1P+POR6sLtgtzPN/10Tk5o2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nkHgWGw+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59738k8x005144
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 06:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CvVAhQAfNLcTGM/vG6Rm69/dUho9Nxx7Jaf
	86sBi5ko=; b=nkHgWGw+89M0BCpEVqUAXsOCTIGSCQMKtZqRCA9HNC0O2I6UvG+
	Ec0IbnaGuChPd7hJvbOQ+o9WRYcmR2cUdkEfJ42gkzJ0YcEJ+5B3PCCq98EtNrd+
	zdOI/qgmb5NJlGxznYXKDGHC5/TXeCnigf3GOpSaI9SXubrd6jkPAsa87NSLnSJw
	kySuMIROyj4tCQVlL7GUc/jvXWkTO4ZEvFHhtsST2yGLyVDq/tMg2XMylLGnQdhS
	+zrPGMCaRsIKZqnF6qnA7x0B2TE/sXTVz6WL6BAxtTHuGZEDlIbOZvaOzvaUgKIP
	ProPa+nKOH8ouAYa74h+bKeLtRGxwtJUwow==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn6gkf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 06:18:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e574e01ed8so134954561cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 23:18:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759817919; x=1760422719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CvVAhQAfNLcTGM/vG6Rm69/dUho9Nxx7Jaf86sBi5ko=;
        b=rWvMNyIu2tkf1mcpo0jv3FJUXyqDlXNExR9VHm9BFukuqPcZGm2dYkwf26v51btbCb
         T45GTCuvixWDjIkg91Gamk3kg9rmTkOryOPmOMdprlI/G2ajeUtPVqYw+uYV9vpybwaF
         6vT4B/VIAn6gJcvO71CEweQrlnwcaOjC1WZrLHGjpC7a5CYHJusvfGYvSBvPFwnALtZo
         QL4M+bqtvjpnXwnjmLHL2B6dTsgS3Tj6BqXdA5g54SHh5vl9nDGs/m4KLZnzREkTIFDD
         /IDHdy25nTn3ZH6WihIXjqY7iawOKbNzeuK8GUzvB7/jrTyX7w1LlerIWHLsLgzh2fAw
         qe8A==
X-Forwarded-Encrypted: i=1; AJvYcCUpPPj3cc1YrDJTe1e35RDRyQLs4k+g3BLXcRdPV6C3pPL0SluSKzXBCCRonrlWgn1iGgZ+DRc9NSP7+duH@vger.kernel.org
X-Gm-Message-State: AOJu0YyXq/xyecIq67wjpb2owCfmPJ5rL4uT3l4K95mIXwjoBFddp6OF
	DCBCxxORZXiKGhhTdV/U395QpQ0PP57x95HdUe/8Io+0+VfhvUmjLmI+mPKa2t+P9DKOUemCrZZ
	hXvtqBOFw3e4jO8MzEgZF4i1Kwf77PrAbZzztuZ7F1gKlH9AbH8jqOv2J0LSzE6za//DT
X-Gm-Gg: ASbGncsWYnCJoCEctfUBDjUAD+UOLWZjcrUVaC6NqojSljCXhBK0JNJzrV2RlevXEg4
	7XVHAvqkUF+lc73KLhOgVrKxwHpst6SFwobM+ZCMzuR72Q1gS6wXKnixd3vuIzhzB77XZWoCC86
	+Irb9M29ZOHg2xpCSRxCgRMCYM8xqTJ2AngeaZnqeZy1ZdjKWRehqgprCrk4EtkVjsDbdu2APmK
	4RlE61MQDKzAZPmABM5xa5iVQZGwVinZfv//7oCz0gy9HPQfaBJ7K5r/ZPAjAA/mPf0FlvQSdnl
	oiIvEeRSWTHbkSunZiMY62CxKmfUfRP24q/ERSBwUvPe3ocCSFbKOQDWfiVmh1h1bq3KhPmZjv4
	BplcdzDm4dA==
X-Received: by 2002:a05:622a:2590:b0:4b7:a44f:527e with SMTP id d75a77b69052e-4e576b0dea4mr215667901cf.76.1759817918959;
        Mon, 06 Oct 2025 23:18:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFJrfWMCsFZ1Rs7jGV7XjlmrBbdRdCEQ8jIKTB0560Sw5sTHLIUZVcwwvmG8Bg0Q6IP6cLtg==
X-Received: by 2002:a05:622a:2590:b0:4b7:a44f:527e with SMTP id d75a77b69052e-4e576b0dea4mr215667711cf.76.1759817918499;
        Mon, 06 Oct 2025 23:18:38 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639773d4d8esm5864519a12.30.2025.10.06.23.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 23:18:38 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, quic_pkanojiy@quicinc.com
Subject: [PATCH] accel/qaic: Synchronize access to DBC request queue head & tail pointer
Date: Tue,  7 Oct 2025 08:18:37 +0200
Message-ID: <20251007061837.206132-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX9le3i3OwGD0l
 VFvKuHTk9zHpcXoTYgXZLg9hQgDx3MxS/ZvdiLkthEn+kkrdlvUsi86f7itpywG3fpDVX52kiRK
 hktxfXcv+lvQl7+LWgLftOePqVIp7OyYPu8ApvbC61XM7oljGIcFw+bQXhG91/U9jv7EtGfNibo
 rxm/I0Y5PuPK9UEmQevZ7DwOEQONTeCHatxdjCp5D1aczvk/3Afa+fbPEzcLER3A6f4SN0+Amvs
 uIQEQzvxgyn6xgKA89Xcfc7jW/VvDtdwjXUUJimJksps2RpeSl6V/PSAsTjynYpfpncNJpwgkja
 yi0dWy1iTwcRo9/DurKWfqjq2NXvL7yEvuRd23yg3IWLXFEX9czv9ZW2ZhsUXhwhDOao5X1LBCy
 QdJM6YW0Wgo6tHvIqdoK07Rnw6xPeg==
X-Proofpoint-GUID: j3NwmNsogSnv2-SylYi9eTAWuM4J9ZNi
X-Proofpoint-ORIG-GUID: j3NwmNsogSnv2-SylYi9eTAWuM4J9ZNi
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e4b0bf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=L090aUOemVNa8NMnONAA:9
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

Two threads of the same process can potential read and write parallelly to
head and tail pointers of the same DBC request queue. This could lead to a
race condition and corrupt the DBC request queue.

Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic.h      |  2 ++
 drivers/accel/qaic/qaic_data.c | 12 ++++++++++--
 drivers/accel/qaic/qaic_drv.c  |  3 +++
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index c31081e42cee..820d133236dd 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -97,6 +97,8 @@ struct dma_bridge_chan {
 	 * response queue's head and tail pointer of this DBC.
 	 */
 	void __iomem		*dbc_base;
+	/* Synchronizes access to Request queue's head and tail pointer */
+	struct mutex		req_lock;
 	/* Head of list where each node is a memory handle queued in request queue */
 	struct list_head	xfer_list;
 	/* Synchronizes DBC readers during cleanup */
diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 797289e9d780..c4f117edb266 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -1356,13 +1356,17 @@ static int __qaic_execute_bo_ioctl(struct drm_device *dev, void *data, struct dr
 		goto release_ch_rcu;
 	}
 
+	ret = mutex_lock_interruptible(&dbc->req_lock);
+	if (ret)
+		goto release_ch_rcu;
+
 	head = readl(dbc->dbc_base + REQHP_OFF);
 	tail = readl(dbc->dbc_base + REQTP_OFF);
 
 	if (head == U32_MAX || tail == U32_MAX) {
 		/* PCI link error */
 		ret = -ENODEV;
-		goto release_ch_rcu;
+		goto unlock_req_lock;
 	}
 
 	queue_level = head <= tail ? tail - head : dbc->nelem - (head - tail);
@@ -1370,11 +1374,12 @@ static int __qaic_execute_bo_ioctl(struct drm_device *dev, void *data, struct dr
 	ret = send_bo_list_to_device(qdev, file_priv, exec, args->hdr.count, is_partial, dbc,
 				     head, &tail);
 	if (ret)
-		goto release_ch_rcu;
+		goto unlock_req_lock;
 
 	/* Finalize commit to hardware */
 	submit_ts = ktime_get_ns();
 	writel(tail, dbc->dbc_base + REQTP_OFF);
+	mutex_unlock(&dbc->req_lock);
 
 	update_profiling_data(file_priv, exec, args->hdr.count, is_partial, received_ts,
 			      submit_ts, queue_level);
@@ -1382,6 +1387,9 @@ static int __qaic_execute_bo_ioctl(struct drm_device *dev, void *data, struct dr
 	if (datapath_polling)
 		schedule_work(&dbc->poll_work);
 
+unlock_req_lock:
+	if (ret)
+		mutex_unlock(&dbc->req_lock);
 release_ch_rcu:
 	srcu_read_unlock(&dbc->ch_lock, rcu_id);
 unlock_dev_srcu:
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index e31bcb0ecfc9..e162f4b8a262 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -454,6 +454,9 @@ static struct qaic_device *create_qdev(struct pci_dev *pdev,
 			return NULL;
 		init_waitqueue_head(&qdev->dbc[i].dbc_release);
 		INIT_LIST_HEAD(&qdev->dbc[i].bo_lists);
+		ret = drmm_mutex_init(drm, &qdev->dbc[i].req_lock);
+		if (ret)
+			return NULL;
 	}
 
 	return qdev;
-- 
2.43.0


