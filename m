Return-Path: <linux-arm-msm+bounces-64319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DA7AFFD69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 11:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D940B5A7431
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 09:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6282D3A86;
	Thu, 10 Jul 2025 08:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i+VUCVHE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74BD2D3A66;
	Thu, 10 Jul 2025 08:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752137955; cv=none; b=cTiMAicJVl9xN86TbujuXp/Q2Mc937aT6CrwEtyRQ5ZmFxk7HVlbNuQ3alNBfHJ06kxj7v1uWegW0wzyy2h+knmKlVSgcrz8q+/06BXAVUA/xErjKd5mr434MQ6Sm5HjfP8LURrgpH18Z/43wdKJUE0iYBIHUQwuhaM1fGzTjM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752137955; c=relaxed/simple;
	bh=SBkNAwfzfteyFVw3u3o9ojfUgQhz4MkG+bfgooaM1y8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=EoOmtO8DDfCf60ia5BFfP0ViWPZ3VGrwIGvn1QrlrJ4ODTi7xxhTJL/nSyQO7ABpYarnfbNn3xN2kN4GhknWTf3ANMIukBtqtSWzdr9R/OPcyN2kH0E+wNCreoaAAscTd++HfeYHgsGgLaIOzBSbrw/XEdNc18k2JFpDjCSWvDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i+VUCVHE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A1GIHn011303;
	Thu, 10 Jul 2025 08:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZDnCtW3XTAwr3sDFi4UHgkXp56it1o0H5OqhAcka6GQ=; b=i+VUCVHEqJ5wehu1
	SV/YyPdF1wLNRlkX9uHG5n31iD2obVYCj+3doema+KLW5LE6lIizJ4Cy8V9QMEG7
	L1vmMooAPbj7zrNhMMwz1a0dEzjuZXdKKOWvT5H3ZdtxyfOxYtRjngNawvBoqjSH
	wqGxYr8Rdj2REXkgpCVGA1w6swi6OCCk9G2iTIr9F51z4GoUoeAFhW/Jlzwuz03S
	YbG9T4ZKda8cB9GpUVtF8cN2w3UddB3Wo9d1GfeS8SGX+ibBuYS02xQmx6Ch82Nk
	rJRLiifMcNWoWpLWGYbRtFSjU02+F9bI0f39woLWrEk/0bE2/+VIzAEUO8T2LmaT
	y5n6Bg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smafm8b9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 08:59:11 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56A8xAlT004926
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 08:59:10 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 10 Jul 2025 01:59:08 -0700
From: Vivek.Pernamitta@quicinc.com
Date: Thu, 10 Jul 2025 14:28:36 +0530
Subject: [PATCH v2 5/5] bus: host: mhi: Need to honor sys_err at power_up
 state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250710-sriov_vdev_next-20250630-v2-5-4bd862b822e8@quicinc.com>
References: <20250710-sriov_vdev_next-20250630-v2-0-4bd862b822e8@quicinc.com>
In-Reply-To: <20250710-sriov_vdev_next-20250630-v2-0-4bd862b822e8@quicinc.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752137937; l=2049;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=dSILC8V2vChSok5MNQTMhYD9YzNBO2Ihhthpz9S4up4=;
 b=pK9+OXarfSwifFeKm3P3m/nt3NEajN5VEidc29TKeNAlYDhoPLzpPsSj2fy90l7KVPI0IW8Yo
 YIlInODHP31Dwzbbbe7lXPHHL//pabzaEgBEAdFvp0MwxAiUbDetgTF
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZJ/XmW7b c=1 sm=1 tr=0 ts=686f80df cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=jQ3Gm1P8fRHK_j5qsfwA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: R7U3ERKlWrO-PDPmnxcAZwoJ7IoUaWKV
X-Proofpoint-GUID: R7U3ERKlWrO-PDPmnxcAZwoJ7IoUaWKV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3NiBTYWx0ZWRfX56YTOhernI2c
 ubA4GAFRqWpMVquPRkjfBCfgaBk0bvSjqDaUg16ZJdb3wRPlVEldYZRK78VAV53L++iPXMWSmN3
 xO1wR+hIUt7e+OyBZCAiCQXz49iu0cDyzrRXV61UeI6VtkFL4ZqbaboQrVO16U98HEG6/R9o1RC
 6OubEUoFyz8GttR1rQCH68KBQldqDRAERtl1C40i9PpPkuiAQ0SLd8IGqxmc2hDlGSJZN6Rpa6T
 36zKs+ybemZQwP+ZHuweaLoRB8UHexUV2d7fe8p8/MHiIVOnd46AW09JHQUk04dMr+8jBkgdgWi
 +j1t3/qCRMeXXEtjw2x14jwGYewNTkVC1Y2ieW0vZwNfjFmNrhkVj5Y8pdeq0mo2Che0A3p0vQW
 dF0q05FJkcAo16aE2wnoljPUHNEAFdu5EYoqNHYqFTjdey675OWI2WEAbLGnk5vp42Y8OcxD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=936 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100076

From: Vivek Pernamitta <quic_vpernami@quicinc.com>

In mhi_sync_power_up() host waits for device to enter in to mission mode
but SYS_ERR is an valid state, If device sends an SYS_ERR host will bail
out for wait_event_timeout() as MHI is in error state and if MHI is tear
downed sys err cant't be serviced and mhi can't be recovered.

If there is any SYS_ERR, sys_err handler needs to process SYS_ERR state
and queues the next state transition for device to bring in to Mission
mode, so mhi_sync_power_up() needs to wait for device to enter in to
mission mode.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
---
 drivers/bus/mhi/host/internal.h | 2 ++
 drivers/bus/mhi/host/pm.c       | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 1054e67bb450d2634771d092ed42bbdd63380472..1aec3bb68f9712f5476b0fc3efd8b2efc4d745dc 100644
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
index 2af34980e14250cada75c981b690bc9581715212..fc9713d4021571aebd995a4524eafbcf0128fbd1 100644
--- a/drivers/bus/mhi/host/pm.c
+++ b/drivers/bus/mhi/host/pm.c
@@ -1280,7 +1280,7 @@ int mhi_sync_power_up(struct mhi_controller *mhi_cntrl)
 		mhi_cntrl->ready_timeout_ms : mhi_cntrl->timeout_ms;
 	wait_event_timeout(mhi_cntrl->state_event,
 			   MHI_IN_MISSION_MODE(mhi_cntrl->ee) ||
-			   MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
+			   MHI_PM_IN_UNRECOVERABLE_ERROR(mhi_cntrl->pm_state),
 			   msecs_to_jiffies(timeout_ms));
 
 	ret = (MHI_IN_MISSION_MODE(mhi_cntrl->ee)) ? 0 : -ETIMEDOUT;

-- 
2.34.1


