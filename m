Return-Path: <linux-arm-msm+bounces-50544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C282EA55326
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 18:32:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F16C2188C891
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 17:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EEBF19D89B;
	Thu,  6 Mar 2025 17:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W9PGGPxN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D72204C27
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 17:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741282367; cv=none; b=RnU9sszoLRrRfs8PYnHnp23HKOTmUrRdJ3+sdzeCAMQ+8gtocr7OUyVTH9Bi67QtRH3Roqn3h5wWofwraO4QdLDBX6eBmCmALWjGCyI6N2e9dFmrXmDCllJbe8TZFmUFozJvHexvLBTOeFFwCo53fk79Y09ekx9k/lJPkku9XAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741282367; c=relaxed/simple;
	bh=TQmmxt3BhKz1ClzdmQVOgnjvBkiCkUoEKUecGH8iwj4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=imabiPbwSsLeN0YUIcOBZFwmefP3olvJfFS1//xWaS3IhvuPwgd+p3rgT/Od/anxO38yqu9BItQ2MUmo3Rw/76KomBOYYRCW3KdLifCDAGAk2otbcTLTsKU9BExu4XPhUloOzVNZHcwj6NKuiNl3tFrb8ZXlHzSvvVpRjo1XyC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W9PGGPxN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5269t7eE005606
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Mar 2025 17:32:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=e8eLbo4qIXQo6XAKHfD0GQUAXjTBeExeHTq
	iZHi7ib4=; b=W9PGGPxN1dVElcnWMTWmM4TvUK79qJVwYZWgTFvHiwOgsXun6hp
	bg1/2qlAaZd5VpJyt93Z9R816+fv3pOgj3u1iXo4eW5IIyCw/VCTyObQJBY+GsXS
	rxM7VoyLHZl6slTPMIXCJUuehxUFans+2hsY/y5RIlFjBS3FnUaQrmqnRQw+wygL
	ePoFqU3vnksMi4+IgWA99kQ+GKqbx89fP6YacHaa6hQPziD/YSl2Oyx+R5BBbcEW
	t12Zsezj16mKBsaxOPLMgZnelYq46rYTIEx4XZmBs2eesSmzaPq+dqUpLodajoK1
	IuCYZ2mxXBJIltJLVclPqrhkqMahihpviVA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6tsw1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 17:32:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2236b6fb4a6so26327235ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 09:32:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741282350; x=1741887150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e8eLbo4qIXQo6XAKHfD0GQUAXjTBeExeHTqiZHi7ib4=;
        b=QntQ2c5OgboRNP0YOYnFFgR97FcvaHtgdvSPwzW3rluhZNFqiNyNFkqwQZcgVh7bfS
         4URmW8/gorX6QOY+6DXNg+NpbKocH50+i5KdbED9DOlyx6yAzvzsGiRTKKiu7gbvSphF
         ZmDgU4FWQLCSdQYas0/lRUc3l8jbNfiRji6ILkIH1+156g+6C2Tlrv7zBADzpyQZnkBQ
         Q25VeFr0QsYjvAVpXXoFD+GfEbdxFtRdOgme5x0PqBk/FESb0xsRimM/LlvzfVqf7MS7
         VGl+teJ9nF1HcwVtr8v0d+MVm6vVDdQimzfMc9zb/G39gRiiqjaY2KKPWV5YGj+Geb1R
         edUQ==
X-Forwarded-Encrypted: i=1; AJvYcCU01b9IMgeUZrsPGfx4OlD8qJAgBhGpr5MschjTX1kAA4PrUI/Fj221cvNvbHWlF5BOfub+gCaeKL4mDa5F@vger.kernel.org
X-Gm-Message-State: AOJu0YwdaBL4l33b33LCtD0sC23BzhCj/ngQ8Ipsc29k3FVd+IUgr+Gp
	13dyQOZ3KgnGuotnwkgBq+Ebflwb+eSXsdkUTrO/cdI7E2t9ICixTiimuxv2aTSaAcekeXS5lQ/
	LJ4opy5K+Ki+FjB6Zh47m9G9wfnqql7bZe62/J54obde5fZppOPWmS7hVxN6LKeMo
X-Gm-Gg: ASbGncs214OWvYl8ga3w46pzkbg9HNHfijP9vj2pv+/Og4acfij9FP0TmSxVHbEXPkG
	LLK0X3Q1UBuZYrRppKqxQgiitgLjgNmgy9nAxvMEeouqX1NGXXjig3QDy6/KhY0IAf0bLuaO+ms
	mR/sxkktXaOOe8/zReyQTfMfRFK5GKyirKEPNDInC2O2ZjwmXtOhofOMrZ9CVfDY44DNdSUZenL
	qdejkW9abMUdDj+kTudbv+1qwTVJ912EwutZZt08Af19NoYpZK/xfCV1mkv8yxD75/nhGgFk4wG
	nGkqeiWAB6DfjLvo0dd7uX/dvge1FqA91yQX+CfF3Q7Qf6HRJp9ysCeA+DuvqKl4
X-Received: by 2002:a05:6a20:4387:b0:1f0:e8f0:3a7b with SMTP id adf61e73a8af0-1f544c6037amr585397637.29.1741282349872;
        Thu, 06 Mar 2025 09:32:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzLszYvVhadrUE/9Ua13XLerozHpfmwjVxleGEkFUULcpMGA5M165cwJazMI9UkeZsuNJezA==
X-Received: by 2002:a05:6a20:4387:b0:1f0:e8f0:3a7b with SMTP id adf61e73a8af0-1f544c6037amr585351637.29.1741282349494;
        Thu, 06 Mar 2025 09:32:29 -0800 (PST)
Received: from jhugo-lnx.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af28109a4b4sm1507546a12.32.2025.03.06.09.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 09:32:29 -0800 (PST)
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
To: quic_carlv@quicinc.com, quic_thanson@quicinc.com,
        manivannan.sadhasivam@linaro.org
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [PATCH] bus: mhi: host: Address conflict between power_up and syserr
Date: Thu,  6 Mar 2025 10:32:26 -0700
Message-Id: <20250306173226.857335-1-jeff.hugo@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HZbuTjE8 c=1 sm=1 tr=0 ts=67c9dc3b cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=LMpmeOApDP6YMBtz5LkA:9 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 3TbTeD1FL7KIgXZYy72y1-l-grVtMOGO
X-Proofpoint-ORIG-GUID: 3TbTeD1FL7KIgXZYy72y1-l-grVtMOGO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_06,2025-03-06_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060134

From: Jeffrey Hugo <quic_jhugo@quicinc.com>

mhi_async_power_up() enables IRQs, at which point we can receive a syserr
notification from the device.  The syserr notification queues a work item
that cannot execute until the pm_mutex is released.

If we receive a syserr notification at the right time during
mhi_async_power_up(), we will fail to initialize the device.

The syserr work item will be pending.  If mhi_async_power_up() detects the
syserr, it will handle it.  If the device is in PBL, then the PBL state
transition event will be queued, resulting in a work item after the
pending syserr work item.  Once mhi_async_power_up() releases the pm_mutex
the syserr work item can run.  It will blindly attempt to reset the MHI
state machine, which is the recovery action for syserr.  PBL/SBL are not
interrupt driven and will ignore the MHI Reset unless syserr is actively
advertised.  This will cause the syserr work item to timeout waiting for
Reset to be cleared, and will leave the host state in syserr processing.
The PBL transition work item will then run, and immediately fail because
syserr processing is not a valid state for PBL transition.

This leaves the device uninitialized.

This issue has a fairly unique signature in the kernel log:

[  909.803598] mhi mhi3: Requested to power ON
[  909.803775] Qualcomm Cloud AI 100 0000:36:00.0: Fatal error received from device.  Attempting to recover
[  909.803945] mhi mhi3: Power on setup success
[  911.808444] mhi mhi3: Device failed to exit MHI Reset state
[  911.808448] mhi mhi3: Device MHI is not in valid state

We cannot remove the syserr handling from mhi_async_power_up() because the
device may be in the syserr state, but we missed the notification as the
irq was fired before irqs were enabled.  We also can't queue the syserr
work item from mhi_async_power_up() if syserr is detected because that may
result in a duplicate work item, and cause the same issue since the
duplicate item will blindly issue MHI Reset even if syserr is no longer
active.

Instead, add a check in the syserr work item to make sure that the device
is in the syserr state if the device is in the PBL or SBL EEs.

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pm.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
index 11c0e751f223..3dff0f932726 100644
--- a/drivers/bus/mhi/host/pm.c
+++ b/drivers/bus/mhi/host/pm.c
@@ -602,6 +602,7 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
 	struct mhi_cmd *mhi_cmd;
 	struct mhi_event_ctxt *er_ctxt;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	bool reset_device = false;
 	int ret, i;
 
 	dev_dbg(dev, "Transitioning from PM state: %s to: %s\n",
@@ -630,8 +631,23 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
 	/* Wake up threads waiting for state transition */
 	wake_up_all(&mhi_cntrl->state_event);
 
-	/* Trigger MHI RESET so that the device will not access host memory */
+	/*
+	 * Trigger MHI RESET so that the device will not access host memory.
+	 * If the device is in PBL or SBL, it will only respond to RESET if
+	 * the device is in SYSERR state.  SYSERR might already be cleared
+	 * at this point.
+	 */
 	if (MHI_REG_ACCESS_VALID(prev_state)) {
+		enum mhi_state cur_statemachine_state = mhi_get_mhi_state(mhi_cntrl);
+		enum mhi_ee_type cur_ee = mhi_get_exec_env(mhi_cntrl);
+
+		if (cur_statemachine_state == MHI_STATE_SYS_ERR)
+			reset_device = true;
+		else if (cur_ee != MHI_EE_PBL && cur_ee != MHI_EE_SBL)
+			reset_device = true;
+	}
+
+	if (reset_device) {
 		u32 in_reset = -1;
 		unsigned long timeout = msecs_to_jiffies(mhi_cntrl->timeout_ms);
 
-- 
2.34.1


