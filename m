Return-Path: <linux-arm-msm+bounces-7153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D45782C53D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jan 2024 19:09:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB32D1F23A26
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jan 2024 18:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE17E1AAC8;
	Fri, 12 Jan 2024 18:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DGZk1Ilx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E21017C91;
	Fri, 12 Jan 2024 18:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40CDeP5q020221;
	Fri, 12 Jan 2024 18:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=z9gFdCo
	TGwHFwV6EpzHdsjjDp9kUAhPP0c7evcgswu4=; b=DGZk1IlxjuBRqAJ31q+dPRg
	n8qJ87MjzLHSJ9ETKHAKCLk7YMn9DZohejG+QYWt52lsvkSZ0sZNG2JZBqdtZ0Ef
	6o7nJPGrVdnRlzbxQFLJk7JZAbZIeIiuqA9Xt8rz8ZRXJvS2Hch9L6UUV7f78fgr
	oMAR72ZUxYl2djIG2zJGZU6clbp4leOE85u6eKKpGXPSvJC/ywL+ZyANW8Bd4GWb
	FLjOeqXwDuuD3yhjOGUQyjAYi3gp9EBGKJIxY2G6FIZopY6GkCZmiJ7od6VTqXMo
	HEeWFDAY0glJKugaz9yTdlKykcNM3+kySXJbGVnX3hagVsT8GmcfnyIYFnJiuTA=
	=
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vjpuj2sdw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 18:08:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40CI8Eap028273
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 18:08:14 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 12 Jan 2024 10:08:13 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <mani@kernel.org>
CC: <quic_pkanojiy@quicinc.com>, <quic_carlv@quicinc.com>,
        <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        Jeffrey Hugo
	<quic_jhugo@quicinc.com>
Subject: [PATCH v2] bus: mhi: host: Add MHI_PM_SYS_ERR_FAIL state
Date: Fri, 12 Jan 2024 11:08:00 -0700
Message-ID: <20240112180800.536733-1-quic_jhugo@quicinc.com>
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
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: E0xrf_n4ZYdZjwLdITKEGTxfTClM6HES
X-Proofpoint-ORIG-GUID: E0xrf_n4ZYdZjwLdITKEGTxfTClM6HES
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401120142

When processing a SYSERR, if the device does not respond to the MHI_RESET
from the host, the host will be stuck in a difficult to recover state.
The host will remain in MHI_PM_SYS_ERR_PROCESS and not clean up the host
channels.  Clients will not be notified of the SYSERR via the destruction
of their channel devices, which means clients may think that the device is
still up.  Subsequent SYSERR events such as a device fatal error will not
be processed as the state machine cannot transition from PROCESS back to
DETECT.  The only way to recover from this is to unload the mhi module
(wipe the state machine state) or for the mhi controller to initiate
SHUTDOWN.

This issue was discovered by stress testing soc_reset events on AIC100
via the sysfs node.

soc_reset is processed entirely in hardware.  When the register write
hits the endpoint hardware, it causes the soc to reset without firmware
involvement.  In stress testing, there is a rare race where soc_reset N
will cause the soc to reset and PBL to signal SYSERR (fatal error).  If
soc_reset N+1 is triggered before PBL can process the MHI_RESET from the
host, then the soc will reset again, and re-run PBL from the beginning.
This will cause PBL to lose all state.  PBL will be waiting for the host
to respond to the new syserr, but host will be stuck expecting the
previous MHI_RESET to be processed.

Additionally, the AMSS EE firmware (QSM) was hacked to synthetically
reproduce the issue by simulating a FW hang after the QSM issued a
SYSERR.  In this case, soc_reset would not recover the device.

For this failure case, to recover the device, we need a state similar to
PROCESS, but can transition to DETECT.  There is not a viable existing
state to use.  POR has the needed transitions, but assumes the device is
in a good state and could allow the host to attempt to use the device.
Allowing PROCESS to transition to DETECT invites the possibility of
parallel SYSERR processing which could get the host and device out of
sync.

Thus, invent a new state - MHI_PM_SYS_ERR_FAIL

This essentially a holding state.  It allows us to clean up the host
elements that are based on the old state of the device (channels), but
does not allow us to directly advance back to an operational state.  It
does allow the detection and processing of another SYSERR which may
recover the device, or allows the controller to do a clean shutdown.

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
---

v2:
-Add additional details about issue discovery to commit text

 drivers/bus/mhi/host/init.c     |  1 +
 drivers/bus/mhi/host/internal.h |  9 ++++++---
 drivers/bus/mhi/host/pm.c       | 20 +++++++++++++++++---
 3 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 15c1740a2c88..cca2731bc98b 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -62,6 +62,7 @@ static const char * const mhi_pm_state_str[] = {
 	[MHI_PM_STATE_FW_DL_ERR] = "Firmware Download Error",
 	[MHI_PM_STATE_SYS_ERR_DETECT] = "SYS ERROR Detect",
 	[MHI_PM_STATE_SYS_ERR_PROCESS] = "SYS ERROR Process",
+	[MHI_PM_STATE_SYS_ERR_FAIL] = "SYS ERROR Failure",
 	[MHI_PM_STATE_SHUTDOWN_PROCESS] = "SHUTDOWN Process",
 	[MHI_PM_STATE_LD_ERR_FATAL_DETECT] = "Linkdown or Error Fatal Detect",
 };
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 2e139e76de4c..d2858236af52 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -88,6 +88,7 @@ enum mhi_pm_state {
 	MHI_PM_STATE_FW_DL_ERR,
 	MHI_PM_STATE_SYS_ERR_DETECT,
 	MHI_PM_STATE_SYS_ERR_PROCESS,
+	MHI_PM_STATE_SYS_ERR_FAIL,
 	MHI_PM_STATE_SHUTDOWN_PROCESS,
 	MHI_PM_STATE_LD_ERR_FATAL_DETECT,
 	MHI_PM_STATE_MAX
@@ -104,14 +105,16 @@ enum mhi_pm_state {
 #define MHI_PM_FW_DL_ERR				BIT(7)
 #define MHI_PM_SYS_ERR_DETECT				BIT(8)
 #define MHI_PM_SYS_ERR_PROCESS				BIT(9)
-#define MHI_PM_SHUTDOWN_PROCESS				BIT(10)
+#define MHI_PM_SYS_ERR_FAIL				BIT(10)
+#define MHI_PM_SHUTDOWN_PROCESS				BIT(11)
 /* link not accessible */
-#define MHI_PM_LD_ERR_FATAL_DETECT			BIT(11)
+#define MHI_PM_LD_ERR_FATAL_DETECT			BIT(12)
 
 #define MHI_REG_ACCESS_VALID(pm_state)			((pm_state & (MHI_PM_POR | MHI_PM_M0 | \
 						MHI_PM_M2 | MHI_PM_M3_ENTER | MHI_PM_M3_EXIT | \
 						MHI_PM_SYS_ERR_DETECT | MHI_PM_SYS_ERR_PROCESS | \
-						MHI_PM_SHUTDOWN_PROCESS | MHI_PM_FW_DL_ERR)))
+						MHI_PM_SYS_ERR_FAIL | MHI_PM_SHUTDOWN_PROCESS |  \
+						MHI_PM_FW_DL_ERR)))
 #define MHI_PM_IN_ERROR_STATE(pm_state)			(pm_state >= MHI_PM_FW_DL_ERR)
 #define MHI_PM_IN_FATAL_STATE(pm_state)			(pm_state == MHI_PM_LD_ERR_FATAL_DETECT)
 #define MHI_DB_ACCESS_VALID(mhi_cntrl)			(mhi_cntrl->pm_state & mhi_cntrl->db_access)
diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
index 8a4362d75fc4..27f8a40f288c 100644
--- a/drivers/bus/mhi/host/pm.c
+++ b/drivers/bus/mhi/host/pm.c
@@ -36,7 +36,10 @@
  *     M0 <--> M0
  *     M0 -> FW_DL_ERR
  *     M0 -> M3_ENTER -> M3 -> M3_EXIT --> M0
- * L1: SYS_ERR_DETECT -> SYS_ERR_PROCESS --> POR
+ * L1: SYS_ERR_DETECT -> SYS_ERR_PROCESS
+ *     SYS_ERR_PROCESS -> SYS_ERR_FAIL
+ *     SYS_ERR_FAIL -> SYS_ERR_DETECT
+ *     SYS_ERR_PROCESS --> POR
  * L2: SHUTDOWN_PROCESS -> LD_ERR_FATAL_DETECT
  *     SHUTDOWN_PROCESS -> DISABLE
  * L3: LD_ERR_FATAL_DETECT <--> LD_ERR_FATAL_DETECT
@@ -93,7 +96,12 @@ static const struct mhi_pm_transitions dev_state_transitions[] = {
 	},
 	{
 		MHI_PM_SYS_ERR_PROCESS,
-		MHI_PM_POR | MHI_PM_SHUTDOWN_PROCESS |
+		MHI_PM_POR | MHI_PM_SYS_ERR_FAIL | MHI_PM_SHUTDOWN_PROCESS |
+		MHI_PM_LD_ERR_FATAL_DETECT
+	},
+	{
+		MHI_PM_SYS_ERR_FAIL,
+		MHI_PM_SYS_ERR_DETECT | MHI_PM_SHUTDOWN_PROCESS |
 		MHI_PM_LD_ERR_FATAL_DETECT
 	},
 	/* L2 States */
@@ -624,7 +632,13 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
 					!in_reset, timeout);
 		if (!ret || in_reset) {
 			dev_err(dev, "Device failed to exit MHI Reset state\n");
-			goto exit_sys_error_transition;
+			write_lock_irq(&mhi_cntrl->pm_lock);
+			cur_state = mhi_tryset_pm_state(mhi_cntrl,
+							MHI_PM_SYS_ERR_FAIL);
+			write_unlock_irq(&mhi_cntrl->pm_lock);
+			/* Shutdown may have occurred, otherwise cleanup now */
+			if (cur_state != MHI_PM_SYS_ERR_FAIL)
+				goto exit_sys_error_transition;
 		}
 
 		/*
-- 
2.34.1


