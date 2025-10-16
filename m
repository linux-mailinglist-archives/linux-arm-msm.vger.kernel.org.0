Return-Path: <linux-arm-msm+bounces-77524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1320DBE1EAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 09:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2E1B24F8BDF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 07:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40FD32EA726;
	Thu, 16 Oct 2025 07:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cTYxcLiX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F89F194137
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 07:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760599531; cv=none; b=ZMM0aCyTV7wDzMtmPQTyXgXL7yArTUpqSo3P47GjgBJKkol7OYL88V3cc8rnr5ucqpHKhhyF21PYELzL7C/4YUa7mMyKOfKAblxy1TZbWfCSXUbJi+V3xCXfEe505hQ7nLVdzL+k8Y2flmruECKXq8RQ0ckm3SdTek4fezAUusY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760599531; c=relaxed/simple;
	bh=UL1DxIhLTDNdEMRngw5CUum4btc2pYG9yp7myJlu1xM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OGITFFy0ws+qo0lPddGVrYYxYrFCsS68B8d+2ndcEHPwqQ7X3MeAJPQotoz9YzIr44KL4jkpYp8e0KSIrDDnsN2FM72ww+4nrtGsO8w9fVIIR+TTti+zcvXcwXgrlCGjUHiKECVMsyR+sJTQaaQHGl+olyxAbHRnpmFMTFvyrgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cTYxcLiX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FJoSnb009231
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 07:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PYLX8mTWQSyaQ2t9hxMxmjQVF4OOp3VkZF2
	bVL4kQk4=; b=cTYxcLiXmgVfohQr2jgxpETSOxsQb4atb7aq8BmMeFHdDHB12Bv
	7oHURSVfikjORwLj5vGtwxQV0PLra3knbcjZEOW2o7/Rx8po+lhoaEAo8RAJ9mIE
	lEE/AHHbUn4itY5lZmFvyLbir64XNI+bdvsjfUn0nf6M5XTlnWYpSRzvddPDWJTY
	w9nQqLf0RWWVWjEMbPZQ8qFYteN5oi/ClLF9bbXVao5qpag7Kfo/rkM9saWHFZWE
	UEX6qCT0iVePJwOlC+/BAOLzjXtKXveg5VpeTO/taMCvmtTlhmIY8RA4zXiZB1R9
	dpbX+5H+vdknUkdVzQMjsE4wrnwzSoS2nVQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c78yh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 07:25:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32eb864fe90so832709a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 00:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760599527; x=1761204327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYLX8mTWQSyaQ2t9hxMxmjQVF4OOp3VkZF2bVL4kQk4=;
        b=MXFSk/QRfKlUo9MrekB7ovNdApFG6P7kWaHzxBU7oOFP5Yxm31RRPXF07gymZ5ojH2
         vdyeWTlFemqhd9mOTEt8JRVzVhGkth9bgorYRot/exS+xqGmEQsk0mmraSAl6PJJ8ct1
         h+rOmx50QctX/VqsGwlDqHGoy4Rz1LZtltkb4zAiK5AjwRPUgXtC78XKXKJQ9rH/p/z6
         hQIzsXI+ng7QYA/6xexDIbJAnLjed/4P1D56pBdP2eZ+hdtprPsMc5ar0HDA0uusEEXW
         cdArs5WJNr3+9wM0RsuAjdsgH4275JI3vxt+dkE31PYHn2RI3ehWhGl0+BRoD3hQqa+i
         rycA==
X-Forwarded-Encrypted: i=1; AJvYcCX/4/DIR3xI+1pc2ttgjgMXfQ8CZA/8pCh1RI4RVRo8Ctw3pZ/wlV4GNeQpSYxLpnrJuCVAoJqj/Eg8W0VG@vger.kernel.org
X-Gm-Message-State: AOJu0YxHEo9xmrA+Z2Qx6G7AaW7OfbdmyCs+/tGk+Fcn2sjY4BSfWGKT
	ViT1oIb3np/XPP2u8jowMlqS24p+M9wmbWglGT6zeMxKTT2XXF1rvs8kFFdSchVkiKp9Mj3cBwq
	gcg4mpkCBEJ7wnCECDg45SdLtZ0RDw31Gyie8OjilTkifrxdT3SbnQrXYB6unCRptJVww
X-Gm-Gg: ASbGncthlxGKyrJv/yOmanPmuCCKf7FX58Pj0v1OKqKIMaAemFGuoWTw/jdzcSzIE1g
	YzcrfOg7e4RWzQSJtvMm42iHbg4Xh79U/0hnxoU6QprYvPAopcsNa9onGwvSSFFNSFzvAgSbM6E
	H9wS1oCbJAC07qK61T9j33NGOu8mwJA1LIEkEbFCnpaH9zQ0wW81FTyIlPxh+Llc1TIipWxKdKk
	4leYfKv5YpScuNpOmEoC9W8cGRgqrXXMzNJyWsS38zJgXj5HqioQ7muGWh0kwyzWP+OzpSJ1lH2
	tj1EmlneM3pjqm2YolO7PJBmIyOQ+XoeFsAo5pifF8ldOrNypVYQ0wOp9kHkxgcA+OUXfZXwiXd
	30qmlYWjFq+YU3Bf1dLXIQus9aerYw1Yrn69kKcZMQS2n32tBtOTp80Z2RlRbI9RUICRQTA==
X-Received: by 2002:a17:90a:e7c4:b0:33b:8b82:98cc with SMTP id 98e67ed59e1d1-33b8b829c10mr12376898a91.14.1760599527393;
        Thu, 16 Oct 2025 00:25:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8EKOUJ8xGsupmOiisrAsUTMSki73ipiDYPVq89pIraBuMMaoKj84FJrrdjz62zznsHQL1Vw==
X-Received: by 2002:a17:90a:e7c4:b0:33b:8b82:98cc with SMTP id 98e67ed59e1d1-33b8b829c10mr12376874a91.14.1760599526961;
        Thu, 16 Oct 2025 00:25:26 -0700 (PDT)
Received: from WANGAOW-LAB01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bb663f591sm725450a91.21.2025.10.16.00.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 00:25:26 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
To: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com, Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v1] media: qcom: iris: Add sanity check for stop streaming
Date: Thu, 16 Oct 2025 15:25:17 +0800
Message-ID: <20251016072517.4845-1-wangao.wang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vb9WnGCgO1OI37PVzaYwhdvAJ1FDLGK6
X-Proofpoint-ORIG-GUID: vb9WnGCgO1OI37PVzaYwhdvAJ1FDLGK6
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68f09de8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=cYsYxGlOpVVTreCKc7QA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX3jpVmilfp6pZ
 mX7553lkUnGUi0l+EIMyMlkUhTo3hKsWz/hXvxILkkPgL5In/cpPraTQdOWbx2L59c5QcXTYqao
 cJp0+G/k4VkM+JZ9aMPpW6R5pOCzZAe2pZ1OZcup8h62rYA9iW/UoQXbXp35xnzHvIZVXx7lfHh
 XpMAuMDpqeLIaHnFCuTXQs/QlKROGYeV1kbw0mQJQTphwXAJcxbKnHn2woy1PPH51kJOWguqXW7
 MKhbytI8GU6IVGW6rGoCHM1/HZKDtDMINvO9hwRop8fAveRxxL+S4w989dXSy1VDSJukhPtinm7
 KsHdTTLvu35N8MY/uUwoYxtSLBNGwnrdSL/bA8DViVF5cmYyy/7zLvVihbMONyQjZd8cHOnxWA2
 O/4QTf69W2Nxmg7jkzmpgwdXqnYXpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

Add sanity check in iris_vb2_stop_streaming. If inst->state is
already IRIS_INST_ERROR, we should skip the stream_off operation
because it would still send packets to the firmware.

In iris_vdec_kill_session, inst->state is set to IRIS_INST_ERROR
and session_close is executed, which will kfree(inst_hfi_gen2->packet).
If stop_streaming is called afterward, it will cause a crash.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vb2.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index 139b821f7952..c1647fb4f0cc 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -231,16 +231,20 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
 		return;
 
 	mutex_lock(&inst->lock);
+	if (inst->state == IRIS_INST_ERROR) {
+		ret = -EBUSY;
+		goto error;
+	}
 
 	if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
 	    !V4L2_TYPE_IS_CAPTURE(q->type))
-		goto exit;
+		goto error;
 
 	ret = iris_session_streamoff(inst, q->type);
 	if (ret)
-		goto exit;
+		goto error;
 
-exit:
+error:
 	iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
 	if (ret)
 		iris_inst_change_state(inst, IRIS_INST_ERROR);
-- 
2.43.0


