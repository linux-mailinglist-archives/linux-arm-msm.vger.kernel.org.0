Return-Path: <linux-arm-msm+bounces-63547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6B7AF7AC1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 17:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 133BD1CA3ADD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 15:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C4412EF676;
	Thu,  3 Jul 2025 15:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VSLxxtYV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB74D2F0C66;
	Thu,  3 Jul 2025 15:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555404; cv=none; b=L6O1++U4JUF0Bt0j4GxNdSoqkq/jLcAxRK9wT4oW438jolau985Pm9GykB/0H7TdQDcxTn9IXxs44z8uwsreCrQTLHRpHBdOjikar1n0UL7R3t1EIPml94FLWNzeVuwxqmZEkgpVKnZrbRIeYnryT7ueJlFhwwbaZIHf3QNOtco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555404; c=relaxed/simple;
	bh=Nu8i87h6TCaRhnZcf7DE0uw7jIrV4h4OvpGTwt1RA0o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=aB2GJju1lx3VWiNTQMGiqUPWkyIq6hsdGucUN/6jm2PsWe0EmylY+TgCoOx3T9hF1vFogdQTVGUJ5SfYHs4DHbi2RGaR3YG1OwYDsPuW9bYVXhdXmoUgs6tcLpcWo50KKogw8i+ykWFM1j14DRDHpj8s6vL9+lEGuLji9iESCsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VSLxxtYV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563ErnVG018568;
	Thu, 3 Jul 2025 15:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wduHtGPtkSKEjHRVStchLaRmO1KRr1DnfiqY9YEqJU8=; b=VSLxxtYVY7jfLswS
	IQpEqDjTQgKcvZghnWrcHXevzfvOj6Nyc8pwdZW8/bh420SVHb/AecJuCMOwGmiq
	E9XARXlGx//JCrDlr8kkpcTgVSJABwq4bAJkDgpzevt9S01jIWKWJhZB4MxpCU0k
	jyr6mO7vv2/eyUIF/B6VQssLmCWU3XagzaPI9JRWP6JMtnTrvlbOyZecRTe4picC
	+7lhyGy+LCHggFcZi4E+cmhv87FNMuXqbDJggUFMV5ABrAY8vpU9PEqIbLeVg14d
	6vf5JbJnG1q5hD0IbtfwdK9smIHyASDS/uG6LjIOCctoW3DWhK+DEcki4nIx+gaM
	velAUA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxs01m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 15:09:59 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 563F9wXm006223
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Jul 2025 15:09:58 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 3 Jul 2025 08:09:57 -0700
From: Vivek.Pernamitta@quicinc.com
Date: Thu, 3 Jul 2025 20:39:44 +0530
Subject: [PATCH 5/5] bus: host: mhi: Need to honor sys_err at power_up
 state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250703-sriov_vdev_next-20250630-v1-5-87071d1047e3@quicinc.com>
References: <20250703-sriov_vdev_next-20250630-v1-0-87071d1047e3@quicinc.com>
In-Reply-To: <20250703-sriov_vdev_next-20250630-v1-0-87071d1047e3@quicinc.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751555387; l=2008;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=hKiSjYqoF1Z6A9EbJR7RIbDt2Fq8yqPnNUfzdUwvZsg=;
 b=k4VGMhntpssdu4IWaCVy8hJ2nze84LfHDmOwoziqQ/4ud7avXRWcgG2VSyzLDbY2DCsyWWLEW
 Fc3yoBahLY0Cz4Ss53H91aU50SKFw9wztL5B8cUM3NS78AMZPf/t97X
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEyNyBTYWx0ZWRfX9BwiUV8cSzpb
 gfetumcDfTZYbfZ0ZcdtrS3ky18JgZ4fms+on6BNNFANuihc1/WQCRu/xlMOYSrWIWP2WrqSqMy
 RH6wsGOeDmPZ3rN+E7KhbMlL8TrehNBhTeyZACMjhPgEEBNDMP6eLfx0q5BYup+nSHM+a3zjsx5
 m3v3W6KFdEJcH/pPWxCn/N1MpCKCpCmESUi6/Z5SzswNK+5K4UBcJebb3+aSGTKiCeMO0U+yj0v
 zpG6pa2uyBTfY9qR2O/4kgWOzWoCSeqS8SFHe1zT6q+09/AMPOx+ude5x3Nril2l1mjbOoXbUwM
 0ACx+XRSHoU/uhjlamyDhWFeUEasJVVRgQ4mVOVkrWUooxKuiFNCPkLO7Z5Mt+2TwXHQfasx+0r
 Spj/e9am9tdinMebQCpP3DFZrbitvSC+LwhqkVO8RYayY7/P6LOPG9GlOtXtFeBTrqBwEaVG
X-Proofpoint-GUID: _7uzgNr14hlPh2i8wKtJ4GtsLz7CcZv1
X-Proofpoint-ORIG-GUID: _7uzgNr14hlPh2i8wKtJ4GtsLz7CcZv1
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68669d48 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=89cOwND4bmROO382wosA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=812 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030127

From: Vivek Pernamitta <quic_vpernami@quicinc.com>

In mhi_sync_power_up() host waits for device to enter in to mission mode
but SYS_ERR is an valid state, If device sends an SYS_ERR host will bail
out for wait_event_timeout() as MHI is in error state and calls
mhi_power_down which will teardown MHI driver probe.

If there is any SYS_ERR, sys_err handler needs to process SYS_ERR state
and queues the next state transition for device to bring in to Mission
mode, so mhi_sync_power_up() will wait for device to enter in to
mission mode.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
---
 drivers/bus/mhi/host/internal.h | 2 ++
 drivers/bus/mhi/host/pm.c       | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 1054e67bb450d2634771d092ed42bbdd63380472..00e46176654d8dc2f28b1535d9ef68233266ff3b 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -170,6 +170,8 @@ enum mhi_pm_state {
 							MHI_PM_IN_ERROR_STATE(pm_state))
 #define MHI_PM_IN_SUSPEND_STATE(pm_state)		(pm_state & \
 							(MHI_PM_M3_ENTER | MHI_PM_M3))
+#define MHI_PM_IN_BAD_STATE(pm_state)			((pm_state == MHI_PM_FW_DL_ERR) || \
+							(pm_state >= MHI_PM_SYS_ERR_FAIL))
 
 #define NR_OF_CMD_RINGS					1
 #define CMD_EL_PER_RING					128
diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
index 2af34980e14250cada75c981b690bc9581715212..ee50efc57cf713a7cf38a670cb49ab09a83b30ee 100644
--- a/drivers/bus/mhi/host/pm.c
+++ b/drivers/bus/mhi/host/pm.c
@@ -1280,7 +1280,7 @@ int mhi_sync_power_up(struct mhi_controller *mhi_cntrl)
 		mhi_cntrl->ready_timeout_ms : mhi_cntrl->timeout_ms;
 	wait_event_timeout(mhi_cntrl->state_event,
 			   MHI_IN_MISSION_MODE(mhi_cntrl->ee) ||
-			   MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
+			   MHI_PM_IN_BAD_STATE(mhi_cntrl->pm_state),
 			   msecs_to_jiffies(timeout_ms));
 
 	ret = (MHI_IN_MISSION_MODE(mhi_cntrl->ee)) ? 0 : -ETIMEDOUT;

-- 
2.34.1


