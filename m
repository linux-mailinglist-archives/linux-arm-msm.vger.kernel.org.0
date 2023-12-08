Return-Path: <linux-arm-msm+bounces-4066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE1F80AF85
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 23:14:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50C1C1C20AB0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 22:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DBCF59B50;
	Fri,  8 Dec 2023 22:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SFddAPIW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A6FC118
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 14:14:18 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B8Lsh8T018256;
	Fri, 8 Dec 2023 22:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=1vgixEtZoHTf9fbQcvAW3O1TDYX2opNerS0Qyb3Okds=;
 b=SFddAPIWqrupox45Yb7rdkagsVIGphbt2KAN6zab4jYSqi+WIZ34V3JZvt4WvQi9hcXE
 vERNZeQBPAZt+sijB8WfxOUhJX3/vRNmTny0Lg0WYdO/lWCci4ORPT6FkZeYey/q5i9h
 dNO6/3aCARYtwJU+6+nPhcF+XiFZXz9UJW7SlLUa5Li9uTBVWj8GW1CJDzJwwJhFomhE
 5Q83qUhJMcxJYGysuTDH8jZx63BDfNCRwVYYEcHQUvN4XQn+Fh/Fz/2RqJNZcTAsglln
 DUufKq4V2oYRvFWi7cm4kRmOxFYrSM8srceDWsjPMwiqG5k5kZHzuACJ/51Y3FSjYGRA iw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uv2sfs81x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 22:14:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B8MEBvj028395
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Dec 2023 22:14:11 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 8 Dec 2023 14:14:10 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <mani@kernel.org>, <quic_pkanojiy@quicinc.com>, <quic_carlv@quicinc.com>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        Jeffrey Hugo
	<quic_jhugo@quicinc.com>
Subject: [PATCH] bus: mhi: host: Add MHI_PM_SYS_ERR_FAIL state
Date: Fri, 8 Dec 2023 15:13:53 -0700
Message-ID: <20231208221353.1560177-1-quic_jhugo@quicinc.com>
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
X-Proofpoint-GUID: _SW7SDkHix2cBtcgLi4wZf01EMupCKBT
X-Proofpoint-ORIG-GUID: _SW7SDkHix2cBtcgLi4wZf01EMupCKBT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_14,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080184

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

In this failure case, to recover the device, we need a state similar to
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
 drivers/bus/mhi/host/init.c     |  1 +
 drivers/bus/mhi/host/internal.h |  9 ++++++---
 drivers/bus/mhi/host/pm.c       | 20 +++++++++++++++++---
 3 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index e2c2f510b04f..d3f919277cf9 100644
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
index 30ac415a3000..4b6deea17bcd 100644
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
index a2f2feef1476..d0d033ce9984 100644
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
@@ -629,7 +637,13 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
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


