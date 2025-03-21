Return-Path: <linux-arm-msm+bounces-52235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D29F9A6C1BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 18:41:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94E33486DA9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 17:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2482C181;
	Fri, 21 Mar 2025 17:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gu996iDZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD811D516F
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 17:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742578817; cv=none; b=lKEZnOK83Sisy+2h7OA2EXMhqb5hM4nAk0WJ1SYLxp+HPnrkERJqiZI7IumT54kMkVXaivRt6imqegzW1JHiqNmuJlNPBDzLDWrJ+MpC/q8zf9Q1RtsaZg6S9XxPC9gEtz1CPs5YkDYJMss2pRsvLMbRlNyCX4XEi355yBzfgIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742578817; c=relaxed/simple;
	bh=OcjFeWahFiiezpRHAKoCjxeD+1A1i/Vr96CGE5q2ma8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=szX4hueOoK9TS26U82btIkPA7Coeh/rWkgpNkdyOIXEAqqcF7AmJqadFibFdDN309E3RqYsjnLwGtqd/Ne+E49/1ytc8t46K/AMlrabCUSg1Ut9YAYfvj+ujSgKnPBBc3sxCVucv3xSNz34HD0LNOlEwTGfIzMvXtsVg/bMsK4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gu996iDZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATAjn022097
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 17:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=485AZqvBA1Z/HXVHFrGgOYzbmiRu5euPgFb
	eUkoyvYA=; b=Gu996iDZSS8q//h49iCo3LKFhX0ooem3gRS+iEqPsdhIR87Zyv2
	kqxlYugk1m878b6cnLGJfErwIqWULYHiUaHFJC+jPUh56qZVwt6tYTivsLDzLbJb
	FgYD7xDL1aA4ZSDQB5xPLzQWyPJ6QehifsZsKdMW3ekw4jV0MuDtxGI8jqIQGZPS
	wgalo3Qh8TFu1cvEacSEIo+9uZu2yinskTJLNASQbH4MXlcs1EFWzRqHzuQ3AQvT
	685f8g5psz2v+vX5co37OjG5Yi7iUrP80xK/bKUOrxpq/gHZqXtUAfYK0GPryPm+
	c4Lss3aEygd7RlSnYgymvNcrgbD9tj4WphA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h4wphf8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 17:40:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22410053005so56700545ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 10:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742578813; x=1743183613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=485AZqvBA1Z/HXVHFrGgOYzbmiRu5euPgFbeUkoyvYA=;
        b=wtlowpg4WN3h+1KO1ezmJDRwakNkASK8i9jAV4pISRqcA/Gt0KBSK+E6Lv0ojLSEqO
         3gwpDuilB8tXlXCuYD0w2q1v+XfoQCApFP9Sdp10NVD62LEF4IQLQpciWjZjYJhWljWw
         Ws/6kjP/jUk5kQFbAwDnL2xET75V0bO3V/BaOES5RUdOJpEdaydRkQaSy4vVHKUgIMiq
         bwWvkXmvQBLX/Dfn8qd0/boER0BKqKYMcv0bQBShsBsPFJKjUneco05XF8VzVn1Gp/lC
         LYj+DtVNC6tgQ4Bxcf87Eo6dKjsqiVy6stPalkYWhCQMGUfVJl/dIfaGL1CmWPADrLGr
         E5ag==
X-Forwarded-Encrypted: i=1; AJvYcCU3gVgiDd2da4XGEGqqbXvT/mpnI81gIr30WVQCQXAc/AXDNKlWCHg9XESgdWtffdSnFWPeg0e0G+c4EfJy@vger.kernel.org
X-Gm-Message-State: AOJu0YyDttuaQBpaHg8JWX0EjIfT8v/7Qs4EZ5GUD2NhTxadOlhoCR8f
	WuhI4JZLYOW+V+4nkkOvSeQSLmojV9yuACP6lBDNsNApgtH6wrrGDo8Uip9QSpa3MiMxlkfnFgG
	F3wJBFR1lALOD2wySjB8B26zaYOfd4MdRsAxNiPJKsNmaO8wOrXKE+l24DX+B7EaN
X-Gm-Gg: ASbGncvL+eOiRUWuzX+lWud1zmeLlTEQ5gABiQBOcbWyszZzd+1ReqbfQrLhxZ14dx5
	6NKP3NGLGOhfhfx9Eds038oFdsrrvklYxjYT4EP0vvUJ+p474cnBWUh7mLGDcxUYijgY30BaGUz
	6j2xCdYLmMGXY8Vs5BipQuzhdncIVb0cZwtJQqmnyLRAkv+Q+1YcmnRejuWq1hst7btUlgTW3au
	IJRxLo/RZLbcH94MghHke052VR6iLQaDL6zgEo+S8EthSQRf3Ydkn0f9ZWwJjzvxxhXJ63qvv3F
	VDLH9KfltrhITQs+4UIUeYNmWOQPSJXYK25iuHS1+jXURyUcy43UnWPl/14xHXQp
X-Received: by 2002:a17:902:f709:b0:220:e5be:29c7 with SMTP id d9443c01a7336-22780e09686mr77372995ad.39.1742578813311;
        Fri, 21 Mar 2025 10:40:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGr7vduCrIKM7kfJ70po5x2MNxFdZs9NfN2hn68LaWCGY6auQhplNaU50zBaoYlRppihaB8Jg==
X-Received: by 2002:a17:902:f709:b0:220:e5be:29c7 with SMTP id d9443c01a7336-22780e09686mr77372455ad.39.1742578812740;
        Fri, 21 Mar 2025 10:40:12 -0700 (PDT)
Received: from jhugo-lnx.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811b80cdsm20123725ad.129.2025.03.21.10.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 10:40:12 -0700 (PDT)
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
To: quic_carlv@quicinc.com, quic_thanson@quicinc.com,
        manivannan.sadhasivam@linaro.org
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [PATCH v2] bus: mhi: host: Address conflict between power_up and syserr
Date: Fri, 21 Mar 2025 11:40:05 -0600
Message-Id: <20250321174005.4077683-1-jeff.hugo@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: SX9omffKzNXf4hRHArGkLXhYsOHsf0-g
X-Proofpoint-GUID: SX9omffKzNXf4hRHArGkLXhYsOHsf0-g
X-Authority-Analysis: v=2.4 cv=ZN3XmW7b c=1 sm=1 tr=0 ts=67dda47e cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=-JrBQj99mACPpmNC3zgA:9 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210129

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

It is unknown when this issue was introduced. It was first observed with
commit bce3f770684c ("bus: mhi: host: Add MHI_PM_SYS_ERR_FAIL state") but
that commit does not appear to introduce the issue per code inspection.
This issue is suspected to trace back to the introduction of MHI, but the
relevant code paths have drastically changed since then. Therefore, do
not identify a specific commit in a Fixes tag as confidence is low that
such a commit would be correctly identified.

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Reviewed-by: Troy Hanson <quic_thanson@quicinc.com>
---

v2:
-Move comment to reset_device condition
-Rename cur_statemachine_state to cur_state
-Amend commit text to explain the lack of a Fixes:

 drivers/bus/mhi/host/pm.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
index 11c0e751f223..5e608436775f 100644
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
 	if (MHI_REG_ACCESS_VALID(prev_state)) {
+		enum mhi_state cur_state = mhi_get_mhi_state(mhi_cntrl);
+		enum mhi_ee_type cur_ee = mhi_get_exec_env(mhi_cntrl);
+
+		if (cur_state == MHI_STATE_SYS_ERR)
+			reset_device = true;
+		else if (cur_ee != MHI_EE_PBL && cur_ee != MHI_EE_SBL)
+			reset_device = true;
+	}
+
+	/*
+	 * Trigger MHI RESET so that the device will not access host memory.
+	 * If the device is in PBL or SBL, it will only respond to RESET if
+	 * the device is in SYSERR state.  SYSERR might already be cleared
+	 * at this point.
+	 */
+	if (reset_device) {
 		u32 in_reset = -1;
 		unsigned long timeout = msecs_to_jiffies(mhi_cntrl->timeout_ms);
 
-- 
2.34.1


