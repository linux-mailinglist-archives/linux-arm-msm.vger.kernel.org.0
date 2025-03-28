Return-Path: <linux-arm-msm+bounces-52790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE57A74E94
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 17:35:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 120363BA3C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 16:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE6217A309;
	Fri, 28 Mar 2025 16:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h7HP4n/h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5AF2AEED
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 16:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743179748; cv=none; b=eZF5d+l3GwAje1Y/XaOhnduJCpFJ4m9qMSEAtt+XQDnUiIR6zPlqVUoNLrPxZqxnhm1CKazulRSGMDtApdH5+J3k7EU8Mtc5sxYCVAznYaNUtUiP55ZUahCUTT5ZiJLwLQVL77OnTcsjTtvkQzRloKffGyTDEiJCTsoT6ww6su0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743179748; c=relaxed/simple;
	bh=HRjsSgTq5W/9KDRw6tCiSSZcem1vOE2VhOdBd3nbUTQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uVaCaw00KWgopdHhmCtrKEn6CFlpSEjrCm3cwr/7XeHcCF0Zcj4UAxv1zl8m+WyiBEKxMfxHt33W/ksX9jvDEFm/V0FVkqI+HjxS37Z4/iW+ONm0VdS4fgS3/PC6N2RRXnc44GueC9vBvFq3Tc6puGzGYQjjp7vZdURdAXamJno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h7HP4n/h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52SGYt9Q011176
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 16:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=f5uBqZqHWsZAkyJQgUXt65TcEJ15BS2eWtk
	mBtYGP/8=; b=h7HP4n/hMWuxMd+Diht2lZfkTMVTowvhUc9o6oDI7q3nH9zTRpy
	I/Hcyp0hjY6z4AHGr/PoVBMIeYbB7T+azisk7BWKBo5cvKQsvDREAYHo+XV3YbrF
	kkoXgDkz7Nf4x87YZq5wlnLZKMSF50cwECyS/7omtB9wO7L+zmOpwhavZERDfVOR
	WlwrvQjL5bFU6YCL+pHn7bK0GQo5b74FLDCkO4z+jL9tacKtgw/lmv5zvqmV6QxP
	4nW4pls9/FDU2e2CVRGgVOC3AO0ctzUqnJaPRQmDmYAQ+pU3FwNyl3EbuqbYs5I9
	yeeArib1p6cR09CWnz3Xx8YdVIJN8SoNNxQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45nqxuhhg2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 16:35:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-227ed471999so38043195ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 09:35:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743179731; x=1743784531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5uBqZqHWsZAkyJQgUXt65TcEJ15BS2eWtkmBtYGP/8=;
        b=QAakz1Aryn1y8B7i9gOCeH8QHdGOx5rakVSRVKX0PQeTw8u8mbAmqWCQSPxk00Y6U2
         GqDyZJg8pXqDPCG7Z7EgWa8woZDGvFoyoZKXvuHlty/LRbrqKcz49BBoPPUr2jaBexs5
         NGQbkhtDbcD1P3EwcoxPjt4nVQHE0QlK7/Lseol2IzmTPq2gsUA/4sZWP7e4goWox0bh
         Ob1BhFtcdb9fZn2NQEaPcDxVydWT2+BQmq3flmU1j7Hz51K02gsr+Ud3lLZbMBk++to/
         0PCLyqqAY/kkVUulEmgOMjVPonSP2gV72sjH1KsavRmynQPYld/2IE5tzsMNiuMXyx6Q
         NlxQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2Ttbtx4jicrmWDhLiSUz2DI8IgHAlo8aGHFU51u/te1Yvqi7aNeZ7cb9ofuFtItCwYbq2CG9yrQai1CsV@vger.kernel.org
X-Gm-Message-State: AOJu0YzDYJ7kZfTgrtwQCh7mMdErH6kPxnR8U+HwwVtfIDrEuKOxeo4v
	72INof6fERLEUs6EE7AxzH4J0O5yuevZWGTsHVpeP4VbXaQk3P4P0iqJ34XGfQLW9Bu1STbuJxp
	ZFV1UcP15+7ePUtUwpvOGj2kViJ8X1WHGTr/1rjxPIw8PRmMx2OY23gK21HCxacp6
X-Gm-Gg: ASbGnctPCongp8pVDarm/vklH7XFJbMsQpbXJSROyEZx0xe1gxU/e+7YznLV120WpbT
	+Z0e/AXTAsB6yjFiGpeN9XBsoQmVG14nxrXvHGbSX1DJm/Lg/uS1nv59SDwVF2/b6ILvfeP0nJ6
	1AnLKVduZQkqgIGUskKRTqpO7QDfEoSeJIqkSnTQfIlsqofGP89zJV+IlmsLVprHsCjLdp+skt6
	4KiIGONhM5nxDjzgcdFmAJS+5pLFyZ5xYr4bJ0IRFS6Fim8+p3b9GdYOEM8vOArnz8K/7BH4qZa
	P5Vym02QuOVVsM/4JYtt/MAjvoS4wLvDo3zguonzzCp9iRyj5iYhNX80Dg5MLpCO
X-Received: by 2002:a17:903:32c6:b0:223:5c77:7ef1 with SMTP id d9443c01a7336-228048778b5mr120223345ad.21.1743179730934;
        Fri, 28 Mar 2025 09:35:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsadb1ZkmyuGZ6xkHYTmklTe/SlrpLu7GSX8XMOMFtakAIkec6H9aZWbz98gqp3YvO8l2gnw==
X-Received: by 2002:a17:903:32c6:b0:223:5c77:7ef1 with SMTP id d9443c01a7336-228048778b5mr120222915ad.21.1743179730359;
        Fri, 28 Mar 2025 09:35:30 -0700 (PDT)
Received: from jhugo-lnx.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1dee06sm20276215ad.179.2025.03.28.09.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 09:35:29 -0700 (PDT)
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
To: quic_carlv@quicinc.com, quic_thanson@quicinc.com,
        manivannan.sadhasivam@linaro.org
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [PATCH v3] bus: mhi: host: Address conflict between power_up and syserr
Date: Fri, 28 Mar 2025 10:35:26 -0600
Message-Id: <20250328163526.3365497-1-jeff.hugo@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YeP5qPAC2CqqNQvmiY0niwqUVOARHyOg
X-Authority-Analysis: v=2.4 cv=e7QGSbp/ c=1 sm=1 tr=0 ts=67e6cfe1 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=-JrBQj99mACPpmNC3zgA:9 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: YeP5qPAC2CqqNQvmiY0niwqUVOARHyOg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280115

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

v3:
-Fix the moved comment due to misunderstanding the initial feedback

v2:
-Move comment to reset_device condition
-Rename cur_statemachine_state to cur_state
-Amend commit text to explain the lack of a Fixes:

 drivers/bus/mhi/host/pm.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
index 11c0e751f223..e567a356f136 100644
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
+		/*
+		 * If the device is in PBL or SBL, it will only respond to
+		 * RESET if the device is in SYSERR state.  SYSERR might
+		 * already be cleared at this point.
+		 */
+		enum mhi_state cur_state = mhi_get_mhi_state(mhi_cntrl);
+		enum mhi_ee_type cur_ee = mhi_get_exec_env(mhi_cntrl);
+
+		if (cur_state == MHI_STATE_SYS_ERR)
+			reset_device = true;
+		else if (cur_ee != MHI_EE_PBL && cur_ee != MHI_EE_SBL)
+			reset_device = true;
+	}
+
+	/* Trigger MHI RESET so that the device will not access host memory */
+	if (reset_device) {
 		u32 in_reset = -1;
 		unsigned long timeout = msecs_to_jiffies(mhi_cntrl->timeout_ms);
 
-- 
2.34.1


