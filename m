Return-Path: <linux-arm-msm+bounces-70237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A12B30DBE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 06:54:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A51A3AF235
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 04:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A4B6266B67;
	Fri, 22 Aug 2025 04:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E5AE4X8a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2981FECAD;
	Fri, 22 Aug 2025 04:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755838337; cv=none; b=Zqnhh3l2THGYqG7nupkUgtOr8xgTwzukl1SSeJa2cyAOEhTbpVczXpJ107eTrVwAbEmAx72630gRTNv3Qdsu9dVT3w1vjcxlKB934TZgq+4hd7LRMBAZmrkT/EX1wOGWgyZnipBnxhn+m93/eFK323hwqrztWj+BKzCBTuuzARY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755838337; c=relaxed/simple;
	bh=+R8nj+3x8K/Ut/4FayZ+IQKFiZDBedtKBHySn+2Kpm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=j7s+5r9Y5DXzeaeCFd/WqFwm/LGJl8BmylT0Z1dWwt3vL9ElH6xkUyvtGOJ+KJ9iYWzqaNwSwGpoJel3YYJQyxSkIHJbHp1htEBXXfQFT7sGM65RgYwhvhPiqxB7BI6B3Lp5DCPnTpItmmXc0tPbhICHrXoP8jArtMW7WSGa84E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E5AE4X8a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LI936q010518;
	Fri, 22 Aug 2025 04:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ebTaIP0/FT3mZgpVGuhuvu
	AHCYJeQHUzfan7ZQTqUG0=; b=E5AE4X8a6Qm8ZEU4Yo/sXXYLxM961GM2X6ISTl
	2iWiGd4YLc07+FR9EJNjJq+G+izFJ6jgW+eoZxd1eGZnWQ1fKuCRJGYin3/x9MKL
	f9QQgSJSJkATjamP6Uq3EyopdqwZTF5xxRjYGINkeluN5E2tZUf4TNuaIeioABfb
	PNOtxcOtg2GkuvVsJk53AUtaUDVhmP3Q1CqsBJBC7X/+KT0CRLkGwWirkgV9LIan
	G4BimyoWIBHsJ/p5t/BlOsUp8WdUk6VsqxGttxKdKAUGVJq6iGKlnUJfp7pxgvEK
	cRNmZnOaoTfs0UXrsbqRD+vAUYIkDdA005WkPKd2As/4Xhyg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngt8dmpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 04:52:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57M4qBM9023101
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 04:52:11 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 21 Aug 2025 21:52:09 -0700
From: Vivek.Pernamitta@quicinc.com
Date: Fri, 22 Aug 2025 10:22:03 +0530
Subject: [PATCH] bus: mhi: host: Add uevent support in MHI driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250822-uevent_vdev_next-20250821-v1-1-9ed3a8162194@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAHL3p2gC/y2M0QpAQBQFf0X32da6iPyKJOzBfVnaZVPy7zZ5n
 KaZmzycwFOT3OQQxMtmI2RpQtM62AVKTGRizaWumdWJAHv0wSD0FtehfpMpgykvRj1UJTPFfne
 Y5frebfc8L6FJ0JlrAAAA
X-Change-ID: 20250822-uevent_vdev_next-20250821-dec34b0a7522
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755838329; l=4907;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=STkvCusmiOpM6Yhb7DF2ssrgL0ORFfvkMePsVhEQb2E=;
 b=rJ+E6nOKOxJ8tet+rh1lGxlgVdN8IZRmnFfMW7IWLNdkHLrsiu5WVYEn4paSkkmwszNRK2PNr
 W84vJq6B3w4C3ce5E8KUjflHhUKOF1F0T8x2tgAPBzN6inbaCqYA96e
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNCBTYWx0ZWRfX9sItxnHmzw6T
 rORwoKajAK4UPEWmGEK70+FZeA5qFHiqzUQXvpfQPfe/5FWfD1utRYG+uqtrfBwaAc6tnoLO5pY
 bYhwh50cQCyJ9Ay+RxE2bh6+UnUapZAFXdzrw3h6qJ6At+q6DeeR9j7+A/tU3kb4jMEV+ln0vUC
 qr92ituf19Vrx6gawxplC1BGH+ySYXaEJfgOFkk7ieDyWitBHdsOMSZlNswvo10osRNpngAb/Be
 n5yD7F8W66GVJCuG9OishGwRcLypTxB6PqDjemYBsNUDfP5qM/tkF7XF5Oy73V2n3zQIPuDGreH
 5xruRuH1giw8WI9U6o5obyC/z3JrVxKd/W4nkKjPx1DXFxgcORvfszPZwlr+OAvr0YpTvrj7e+j
 /bQxy6nVF4UNcU+gIBec6J6lnNV0eg==
X-Authority-Analysis: v=2.4 cv=c/fygR9l c=1 sm=1 tr=0 ts=68a7f77c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=ok3_zkLAggRPmFeU4moA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qddB0PnQczr58LR_3VeqwBxka7HiB8B-
X-Proofpoint-ORIG-GUID: qddB0PnQczr58LR_3VeqwBxka7HiB8B-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200134

From: Vivek Pernamitta <quic_vpernami@quicinc.com>

Notify the MHI device's Execution Environment (EE) state via uevent,
enabling applications to receive real-time updates and take appropriate
actions based on the current state of MHI.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
---
Notify the MHI device's Execution Environment (EE) state via uevent,
enabling applications to receive real-time updates and take appropriate
actions based on the current state.

Signed-off-by:
---
Usage:

Enabling 16 virtual fucntions for SRIOV device QDU100 once device reached
mission mode from systemd service file

SUBSYSTEM=="mhi", ENV{EXEC_ENV}=="MISSION MODE", SUBSYSTEMS=="pci", ATTRS{device}=="0x0601",ATTR{../sriov_numvfs}="16"
---

---
 drivers/bus/mhi/host/internal.h |  1 +
 drivers/bus/mhi/host/main.c     |  1 +
 drivers/bus/mhi/host/pm.c       | 22 ++++++++++++++++++++++
 3 files changed, 24 insertions(+)

diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 034be33565b78eff9bdefd93faa4f3ce93825bad..d455f0bf00133775fa23882a727782275640e43b 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -403,6 +403,7 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
 				struct mhi_event *mhi_event, u32 event_quota);
 int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
 			     struct mhi_event *mhi_event, u32 event_quota);
+void mhi_uevent_notify(struct mhi_controller *mhi_cntrl, enum mhi_ee_type ee);
 
 /* ISR handlers */
 irqreturn_t mhi_irq_handler(int irq_number, void *dev);
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 52bef663e182de157e50f64c1764a52545c70865..8615512743199a59a58c3756d9cc3407079cee7e 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -512,6 +512,7 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
 		if (mhi_cntrl->rddm_image && mhi_is_active(mhi_cntrl)) {
 			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_RDDM);
 			mhi_cntrl->ee = ee;
+			mhi_uevent_notify(mhi_cntrl, mhi_cntrl->ee);
 			wake_up_all(&mhi_cntrl->state_event);
 		}
 		break;
diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
index 33d92bf2fc3ed48db5f7fe80e4f0ef9fe2d2f2ab..1b849f334c49e52636821ed7587865a9254e9118 100644
--- a/drivers/bus/mhi/host/pm.c
+++ b/drivers/bus/mhi/host/pm.c
@@ -418,6 +418,7 @@ static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
 	device_for_each_child(&mhi_cntrl->mhi_dev->dev, &current_ee,
 			      mhi_destroy_device);
 	mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_MISSION_MODE);
+	mhi_uevent_notify(mhi_cntrl, mhi_cntrl->ee);
 
 	/* Force MHI to be in M0 state before continuing */
 	ret = __mhi_device_get_sync(mhi_cntrl);
@@ -631,6 +632,8 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
 	/* Wake up threads waiting for state transition */
 	wake_up_all(&mhi_cntrl->state_event);
 
+	mhi_uevent_notify(mhi_cntrl, mhi_cntrl->ee);
+
 	if (MHI_REG_ACCESS_VALID(prev_state)) {
 		/*
 		 * If the device is in PBL or SBL, it will only respond to
@@ -829,6 +832,8 @@ void mhi_pm_st_worker(struct work_struct *work)
 			mhi_create_devices(mhi_cntrl);
 			if (mhi_cntrl->fbc_download)
 				mhi_download_amss_image(mhi_cntrl);
+
+			mhi_uevent_notify(mhi_cntrl, mhi_cntrl->ee);
 			break;
 		case DEV_ST_TRANSITION_MISSION_MODE:
 			mhi_pm_mission_mode_transition(mhi_cntrl);
@@ -838,6 +843,7 @@ void mhi_pm_st_worker(struct work_struct *work)
 			mhi_cntrl->ee = MHI_EE_FP;
 			write_unlock_irq(&mhi_cntrl->pm_lock);
 			mhi_create_devices(mhi_cntrl);
+			mhi_uevent_notify(mhi_cntrl, mhi_cntrl->ee);
 			break;
 		case DEV_ST_TRANSITION_READY:
 			mhi_ready_state_transition(mhi_cntrl);
@@ -1240,6 +1246,8 @@ static void __mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful,
 	write_unlock_irq(&mhi_cntrl->pm_lock);
 	mutex_unlock(&mhi_cntrl->pm_mutex);
 
+	mhi_uevent_notify(mhi_cntrl, mhi_cntrl->ee);
+
 	if (destroy_device)
 		mhi_queue_state_transition(mhi_cntrl,
 					   DEV_ST_TRANSITION_DISABLE_DESTROY_DEVICE);
@@ -1338,3 +1346,17 @@ void mhi_device_put(struct mhi_device *mhi_dev)
 	read_unlock_bh(&mhi_cntrl->pm_lock);
 }
 EXPORT_SYMBOL_GPL(mhi_device_put);
+
+void mhi_uevent_notify(struct mhi_controller *mhi_cntrl, enum mhi_ee_type ee)
+{
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	char *buf[2];
+	int ret;
+
+	buf[0] = kasprintf(GFP_KERNEL, "EXEC_ENV=%s", TO_MHI_EXEC_STR(ee));
+	buf[1] = NULL;
+
+	ret = kobject_uevent_env(&dev->kobj, KOBJ_CHANGE, buf);
+	if (ret)
+		dev_err(dev, "Failed to send %s uevent\n", TO_MHI_EXEC_STR(ee));
+}

---
base-commit: 7fa4d8dc380fbd81a9d702a855c50690c9c6442c
change-id: 20250822-uevent_vdev_next-20250821-dec34b0a7522

Best regards,
-- 
Vivek Pernamitta <<quic_vpernami@quicinc.com>>


