Return-Path: <linux-arm-msm+bounces-70166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D85C6B2F92A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 15:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B500716C371
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 12:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0A8322A23;
	Thu, 21 Aug 2025 12:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oW4aHXhd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C5732274E;
	Thu, 21 Aug 2025 12:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755780954; cv=none; b=FToE0/nyxuA/+f22vO035FzR/iCbIpB4rQ1AiyL1yKuWY6izZvfXU5CB6Bq2paLWrp2BaSWon265VDHqo24sKD8Jg6JlK4tjYhFvAqqAVTg/tcOXh5MuMEokV6tuJp1KzWNgrLtAKLLVlDzG61oNO7dc5jZCAHaEZFj6IpdqHU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755780954; c=relaxed/simple;
	bh=SMyPH8k7ybIW1TbdHhI5Z9x8SGDd802E4AgAHU1m/Nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Aae+OTef3YOUew+m3I+/vuQsAA2PSN9I1ZCrDiM5x5FX4DsywhrFB6FpbQIeMio6m4wYnXNSRcoBlWxRME6fm/Ua5EbyyyszyFMHrommENCmatfQzzGiTYn0uyORPb8dx32MDyLKSa0l9SHuOFrf4X641UO9zLGwr5u11j+H9FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oW4aHXhd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9b7N4007005;
	Thu, 21 Aug 2025 12:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iZn+HTZy+eCupO8kXsIA6gWkofnSykOW+GioTXxJsOA=; b=oW4aHXhdqUPzCQ1c
	ZN9yJW0wu/pWnz8AU0RROTUES5EBnoxy/8TK0IiJO2JXPLCmAcFPJJdKHbOt5XJp
	nZgj6aZ0nknEGZAOF4z7jpN66BaHUWd6kU9AW/dB8Y1tWFJ+Zkhgq1ytMEVqOie3
	wyRj1fu0+j7VYwCPhfH5cHVwTLMk6RB1bHL8jVKj32QAULojlOR163A+mMIS9SJ0
	IMlNCVqJxmWUl2Ko2IRj80TB6FfSHngSNfFM89qe6UsmHBqme/b1TosJ5QdISa9n
	x7t+Mx3mYFJu0NEzYDswR49rYWN4fbY3E7bBC7+ol/4Evg+S0hoQhD4wrJpb1dGP
	0RfUvA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5295fex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 12:55:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57LCtoEP030749
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 12:55:50 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 21 Aug 2025 05:55:48 -0700
From: Vivek.Pernamitta@quicinc.com
Date: Thu, 21 Aug 2025 18:25:37 +0530
Subject: [PATCH v3 5/6] bus: mhi: core: Improve mhi_sync_power_up handling
 for SYS_ERR state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250821-vdev_next-20250821_sriov-v3-5-e1b017c48d4a@quicinc.com>
References: <20250821-vdev_next-20250821_sriov-v3-0-e1b017c48d4a@quicinc.com>
In-Reply-To: <20250821-vdev_next-20250821_sriov-v3-0-e1b017c48d4a@quicinc.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755780937; l=2304;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=x42Ng4yuzREddVD0BdqYq/q46c7+nSqgm/YcBbLGLMc=;
 b=2GCJAvu/+Zt2owtnwoiH98zDFqQCYmvoPIwzAOGsfoHoeUhGlPOlm6JT4n1unYa561NV28VV/
 DBLIRxkGk3aDbE6y2c0sInPAvdO/KEsIvkiNOVdRWJKWmlIz9lOw7Sm
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZJKOWX7b c=1 sm=1 tr=0 ts=68a71756 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=jSJrFnb4eazxI21aJSAA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: zcJBmIyScZ7i6KIVB_KtxLTG9SVDC70o
X-Proofpoint-GUID: zcJBmIyScZ7i6KIVB_KtxLTG9SVDC70o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXygmiQCD5OjZ6
 QZlxSB4Uu2AuIukR+Fmrk0inJ8NQekUDCnUw7uozqzUfsuld2+YJbz8v+IULClC8e1wHobw7if7
 8e+ayOxy2LMrvcPzMhmikdJMYafmYK6QK6bDYTqWzBPNArc1cHMxvUEH2ok02riLt4nokpBJgrq
 vbjWruGeDaNBRVWkffPkTh+bk6sKfvhrdeEL0JkORwJD8Uk5wsSo5XK/JJfXP3D483/tYiOeY0a
 mqMvYrG0s2XbaN6n0D34GYHktKNRrMyUYIURc4buqEUdrH2MYTG1i6Jrol/ZmgNeaI9OpDO1XzZ
 vaqZtYFKGiaygjmb5fZNCDRnAbZJt7flaBkGpbamCABDwIlth5S0HSp1cxwP/mWj3O4vTsHKeki
 WmVLvdYFIV0zZzeguSv7MbHFbb1fLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

From: Vivek Pernamitta <quic_vpernami@quicinc.com>

In power-up, reboot, or recovery scenarios, mhi_sync_power_up() is invoked
by the controller driver to wait for the device to enter Mission Mode.

However, in some cases, the device may be in SYS_ERR state due to a
previous device reset. SYS_ERR is a valid state, but currently, the host
exits at wait_event_timeout() prematurely when MHI_PM_IN_ERROR_STATE is
detected, causing mhi_sync_power_up() to fail.

If MHI is torn down before SYS_ERR is serviced, recovery is not possible.
Instead of aborting, the SYS_ERR handler should process the error and queue
the next state transition to bring the device into Mission Mode.

This change ensures mhi_sync_power_up() waits for Mission Mode even
after SYS_ERR, enabling proper recovery and improving robustness.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
---
 drivers/bus/mhi/host/internal.h | 2 ++
 drivers/bus/mhi/host/pm.c       | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 034be33565b78eff9bdefd93faa4f3ce93825bad..9e37e5c9a6c7e07d54300adce51c9db9052e477a 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -170,6 +170,8 @@ enum mhi_pm_state {
 							MHI_PM_IN_ERROR_STATE(pm_state))
 #define MHI_PM_IN_SUSPEND_STATE(pm_state)		(pm_state & \
 							(MHI_PM_M3_ENTER | MHI_PM_M3))
+#define MHI_PM_IN_UNRECOVERABLE_ERROR(pm_state)		((pm_state == MHI_PM_FW_DL_ERR) || \
+							(pm_state >= MHI_PM_SYS_ERR_FAIL))
 
 #define NR_OF_CMD_RINGS					1
 #define CMD_EL_PER_RING					128
diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
index 33d92bf2fc3ed48db5f7fe80e4f0ef9fe2d2f2ab..e908bbce79e9a8a76881b5d040c7e9d4985124dc 100644
--- a/drivers/bus/mhi/host/pm.c
+++ b/drivers/bus/mhi/host/pm.c
@@ -1279,7 +1279,7 @@ int mhi_sync_power_up(struct mhi_controller *mhi_cntrl)
 		mhi_cntrl->ready_timeout_ms : mhi_cntrl->timeout_ms;
 	wait_event_timeout(mhi_cntrl->state_event,
 			   MHI_IN_MISSION_MODE(mhi_cntrl->ee) ||
-			   MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
+			   MHI_PM_IN_UNRECOVERABLE_ERROR(mhi_cntrl->pm_state),
 			   msecs_to_jiffies(timeout_ms));
 
 	ret = (MHI_IN_MISSION_MODE(mhi_cntrl->ee)) ? 0 : -ETIMEDOUT;

-- 
2.34.1


