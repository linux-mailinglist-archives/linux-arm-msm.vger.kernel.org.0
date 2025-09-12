Return-Path: <linux-arm-msm+bounces-73216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F693B541CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 06:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2863E7B17BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 04:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970942701D9;
	Fri, 12 Sep 2025 04:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hJBAeGZK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FD426E6F8;
	Fri, 12 Sep 2025 04:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757653172; cv=none; b=RnuNxEE0JIunjheWPM0fENc7W5Fhxw3rvRPOq+QzGBup51/4iC4m/lMOwU8Ys3E0q0/BWEPBIZi0R/qaaOswXBOxGEv2LHBCkz/R7vpWak0QA0Q6y85BM1noana264v8z01HYSdd0xgPaPgrQXKKCoUcyLVSTQ6u90fASgs2cj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757653172; c=relaxed/simple;
	bh=FPPXx4oKeL6xXNEmPIiMjrOeK5jDq2/+RU0cL0Biv68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=sjOvdpaHMkXed/itECeXkhf1DYHECzZothQhqkSI0MrEJD7i1Sc8V/kyYShmInBmIV+oLD1N3GNynLMryCfpFhK0yFICqBA3n0usuRX2qtTO1lYlU9jcRdOVSzkyGUrIM++bZnbDfkMMeee2Oq59pGtIfIKqxR6C7z/MZUxlvtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hJBAeGZK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BISGAw005414;
	Fri, 12 Sep 2025 04:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JLnejCdExVOYmb0qAPX3oA
	WJ0nT3oW0K6+1SV8d0LsU=; b=hJBAeGZKszIYJyRtrfxyLvysVc4C1OdfTwKzD+
	kTyGlS0IlX7No6EByzyjN1umbPN+s5SnQ5LviIC4AGlr4TtAd0NMiMlMY4Y0Hj5l
	kNoLoEZuUkzN6SY1zU+W4soHt2PAfNt+7Ps48aNUOsf+M0q91V63ZeBdCpyNKxEH
	kdYj6hfY1rqePT8rvyrz46WYsa3LEYscIL7J/TVV0OI2im3K/w8apCuDBEIclcBd
	Cx9d/AYrbmz3nLV2l/AwUnc7cZ+KWXhywhJ1Vm5pkDEfO3LRlP2UaGxZDCCCTfuh
	HH0xWsyAxLWXkblwv7ooZd2DgXutwvQD4KQKjXv7j1kQ5wyw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2ebhu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 04:59:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58C4xPOB016858
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 04:59:25 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 11 Sep 2025 21:59:23 -0700
From: Vivek.Pernamitta@quicinc.com
Date: Fri, 12 Sep 2025 10:29:16 +0530
Subject: [PATCH v2] bus: mhi: host: Add uevent support in MHI driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250912-b4-uevent_vdev_next-20250911-v2-1-89440407bf7e@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAKOow2gC/y3MQQqDMBBG4avIrDuQRAPqVaRINX90NlESGwTx7
 obS5ceDd1FCFCTqq4sisiTZQoF5VTSvn7CAxRWTUcaqThueGv4iIxxjdshjwHnwP2r2c6NRt14
 7O1FZ7BFezt9+eN/3Az9TZ9NuAAAA
X-Change-ID: 20250912-b4-uevent_vdev_next-20250911-fc41e38f1d5b
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757653163; l=5209;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=DCzpWkP0qu12EL3jXqAK9eCwxc03vN89IQvdZDkzsoA=;
 b=brxsS4hbjsb+1LqBCxS371rE5RiU0lD9fcSyeR80dE+3xpN9YTo3zYBJeeCLsb0IICwxFkZ1Q
 qRtzUDEDKHVAS4PozIhl9HAIEiy80g/zp8LBNhk6u2BxlZX4PZKnBId
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c3a8af cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=O6tHu9usdxQueJh1WOwA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: l6SMdmvlZ1RvRUAxJOaEekJrH05VxSSA
X-Proofpoint-GUID: l6SMdmvlZ1RvRUAxJOaEekJrH05VxSSA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX1KWFOW0sz0zx
 CHwYPD0cmg7EitF5U8Lz2ToGgV+eJ8FKs00unYcR0aZqL/kCwm00HB2h32UcgqFlJASsXHzCWX/
 1ucTz7a68Xg+d3nK8chIkV6NxFGVptzEOiqkhoLKkEZy/L7Y1toR2HRAF/mlXZCQ9SX8d9uU9Lg
 QinrDqFLf2Zyx172o231R+YwAwpCaegPw2ZQIO4djAQrwtxTUCAlOc/hZSkwgHr5YMnSn5I5MZZ
 /Yk03XX7ANDfFju6ybXpUJBAutvtrJCwhEzcjYNEtljHve6LGrS20cs3yhftv7JQbIEtf4QXMGG
 fpsw5RzJTYx/gJS/fB+6jtgzvA+YItxufyAUnw+GDZVhyVm6iS3PvTZ9Wa04aLt7UDq4+6CryyO
 zX5bf3Lr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

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
Changes in v2:
- Fix memory leak in uevent notifier.
- Link to v1: https://lore.kernel.org/r/20250822-uevent_vdev_next-20250821-v1-1-9ed3a8162194@quicinc.com
---

---
 drivers/bus/mhi/host/internal.h |  1 +
 drivers/bus/mhi/host/main.c     |  1 +
 drivers/bus/mhi/host/pm.c       | 29 +++++++++++++++++++++++++++++
 3 files changed, 31 insertions(+)

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
index 33d92bf2fc3ed48db5f7fe80e4f0ef9fe2d2f2ab..331f65921a979adce60a32fb62e2c9b712f21c87 100644
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
@@ -1338,3 +1346,24 @@ void mhi_device_put(struct mhi_device *mhi_dev)
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
+	if (!buf[0]) {
+		dev_dbg(dev, "Failed to allocate memory for uevent");
+		return;
+	}
+
+	ret = kobject_uevent_env(&dev->kobj, KOBJ_CHANGE, buf);
+	if (ret)
+		dev_err(dev, "Failed to send %s uevent\n", TO_MHI_EXEC_STR(ee));
+
+	 kfree(buf[0]);
+}

---
base-commit: 8f21d9da46702c4d6951ba60ca8a05f42870fe8f
change-id: 20250912-b4-uevent_vdev_next-20250911-fc41e38f1d5b

Best regards,
-- 
Vivek Pernamitta <<quic_vpernami@quicinc.com>>


