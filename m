Return-Path: <linux-arm-msm+bounces-73343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5126DB54E61
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 14:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08332AA2CD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F2CB30C35D;
	Fri, 12 Sep 2025 12:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nl6fKb4Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBAB30B527;
	Fri, 12 Sep 2025 12:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757681309; cv=none; b=rd5EycmATYwnVgyyD2FIouHgdQjF0gU1dplnu8gStUbz0T930plUqm2NYXm8gVsX2pyJTesMEGLSFoeeY9qX4lJ9gVFYOYQTzJ6/Ij9otwpBLebuv9OcD5ELsACUwR8H5JQgt27pFPEPvcOoS4Jefi6eRiU57J7WF8GCzqSus1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757681309; c=relaxed/simple;
	bh=UF1CIMCevu9HbluOPb99Yw0/05oUTlgecK3A7mMUSuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=QqiLhdiLal9UQye5F0cGXj3464V1qMLZDSDsvkUJZroJzAGYRb4a/RzyFCz6owVd/BSwWLJGl4e7ApHt6NyfYj74LVnlrwf5H6H4tRhO0lgdWPzA/Xj+CKb/lwV6hu0A2iiQsXY4RiS8/35bq4nQIfGUNTgFKSko8ICa9eMoQLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nl6fKb4Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fijH023969;
	Fri, 12 Sep 2025 12:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7k3f3m6IS8fJ/gmBWpXzmShGYlKp7WFy3tyMFbp9syE=; b=nl6fKb4YWv7xh4oc
	wq5x+seHgLNMsm1VC84payoxXtOrVGugJdwI5J50VyduTyqd1K+I+oAxMRNfyDud
	0ggcdZVdxHU2vVnowj92u18J4ebGAdXH2YYZ1CRdY0hnE5JU775aGsJjsMjlFp2W
	xJTzPrfDCIAo5a21OjwYAYGRrNOzqm0zHGr0XiMYaSUseJDyz8DWf6ari8ca7te7
	YDvGTZewwRgZiZOWNU4bxke6grngJBMus/iwICbG4wDu6emr1JWYwmLKIxAW9oSv
	D6Y+UpKYtwal9RbSwfl2Cfh7Bbu2ScryIw3fuabt3+E8jPIusUizzJZCLOEoh+zU
	94cX6w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2fs7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 12:48:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58CCmNYO031754
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 12:48:23 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Fri, 12 Sep 2025 05:48:21 -0700
From: Vivek.Pernamitta@quicinc.com
Date: Fri, 12 Sep 2025 18:18:09 +0530
Subject: [PATCH v4 5/6] bus: mhi: core: Improve mhi_sync_power_up handling
 for SYS_ERR state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250912-uevent_vdev_next-20250911-v4-5-fa2f6ccd301b@quicinc.com>
References: <20250912-uevent_vdev_next-20250911-v4-0-fa2f6ccd301b@quicinc.com>
In-Reply-To: <20250912-uevent_vdev_next-20250911-v4-0-fa2f6ccd301b@quicinc.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757681290; l=2001;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=YKwSKBs+8PzFfcdnAnUQhAssZGEFmql2m+8BzXL/FgQ=;
 b=8kFAWW0Se94mzr+rAaeaNqEIAn2WIpFVDoyiJNxRx7hToDCBICppRn2BRfoz8jf062V1G6oNf
 fgEJULUtNGzAphe/QiXuR0IPiaoIXI9Am8axG1AA2CvUfcmwh85ZBjq
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c41698 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=d564mSNedCF9_XSSoE4A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: hayx54-gMvt7acqikrw8seA_BOjKvmfH
X-Proofpoint-GUID: hayx54-gMvt7acqikrw8seA_BOjKvmfH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX1/8w2Xpo9qTo
 ZWP6+6yyCf13iXUyM8PF0ZT0tcMdfHp0vQ+MS3SFK/RY10SUJWU51I+dgSLj/j5PP8MAzymXqU0
 TXTIpIN57RxyPdsb7UP2L0urGLVHZUUeRRQDfRBI9n3oRxllvTaQXlur/O1ciny6B8q7Ite7ejZ
 RhDqreSDmmcoeUEqwgp4B7pII3VAOc4vHwnxKgwWE6IZ5gtZ+1EEaxhFUUtRgcj1NsRReXnAHT0
 QbGjKyGUzAU0a03DNNdvQAcAxkrEc2erPk619YYNkKdhaakuKUaMoZvlCClSHm4AZ03t4qs7GPG
 namkN3EwWr0zKK4Q8odpee/iLuc6abeBZ7oZIL1zo817XRE3q3HjGQ2frlAmp9nfeI3PQr2TkWw
 TTPnx9MD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

From: Vivek Pernamitta <quic_vpernami@quicinc.com>

Ensure mhi_sync_power_up waits for Mission Mode after SYS_ERR

Allow mhi_sync_power_up to handle SYS_ERR during power-up, reboot,
or recovery. Avoid premature exit when MHI_PM_IN_ERROR_STATE is seen.

Treat SYS_ERR as a valid state and let its handler process the error.
Queue the next transition to Mission Mode instead of aborting early.
Prevent teardown before SYS_ERR is serviced to enable proper recovery.
Improve robustness by ensuring Mission Mode is reached after SYS_ERR.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
---
 drivers/bus/mhi/host/internal.h | 2 ++
 drivers/bus/mhi/host/pm.c       | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 034be33565b78eff9bdefd93faa4f3ce93825bad..9f815cfac763e1a33f55804cfd7f3df9cf53f89a 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -170,6 +170,8 @@ enum mhi_pm_state {
 							MHI_PM_IN_ERROR_STATE(pm_state))
 #define MHI_PM_IN_SUSPEND_STATE(pm_state)		(pm_state & \
 							(MHI_PM_M3_ENTER | MHI_PM_M3))
+#define MHI_PM_FATAL_ERROR(pm_state)			((pm_state == MHI_PM_FW_DL_ERR) || \
+							(pm_state >= MHI_PM_SYS_ERR_FAIL))
 
 #define NR_OF_CMD_RINGS					1
 #define CMD_EL_PER_RING					128
diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
index 33d92bf2fc3ed48db5f7fe80e4f0ef9fe2d2f2ab..31b20c07de9ee7006dbb81e3ab2fbf6e66396d98 100644
--- a/drivers/bus/mhi/host/pm.c
+++ b/drivers/bus/mhi/host/pm.c
@@ -1279,7 +1279,7 @@ int mhi_sync_power_up(struct mhi_controller *mhi_cntrl)
 		mhi_cntrl->ready_timeout_ms : mhi_cntrl->timeout_ms;
 	wait_event_timeout(mhi_cntrl->state_event,
 			   MHI_IN_MISSION_MODE(mhi_cntrl->ee) ||
-			   MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
+			   MHI_PM_FATAL_ERROR(mhi_cntrl->pm_state),
 			   msecs_to_jiffies(timeout_ms));
 
 	ret = (MHI_IN_MISSION_MODE(mhi_cntrl->ee)) ? 0 : -ETIMEDOUT;

-- 
2.34.1


