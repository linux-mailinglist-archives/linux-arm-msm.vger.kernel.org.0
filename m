Return-Path: <linux-arm-msm+bounces-86792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B638CE6064
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 07:32:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 68A483011916
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 06:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0FB2D0600;
	Mon, 29 Dec 2025 06:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QVNi23eL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F1ruviQZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515783A1E98
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766989924; cv=none; b=Pq6bTEINtMZAOiNPw3fmn8L+NWqFz9Us1zfL1+zd9rDWEhspHsmUC8tmkj0zZj//mTEpq3UcIA5z08VBNrgu1zutU+0OkODdhbUEVJoFQ8KQCC0vgb9Q2JCIoV2xdiBteU/q55BRwkfiT8SCxTOH4JzSjwaLoy4Q5xdvPhWvV3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766989924; c=relaxed/simple;
	bh=veRINet6awseWXYxyYZwNw5ZPUP0TfC17AyTv/ndWhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MRMApXaRhR2cr/B9KaDRcY+bmC+X0nNTLM7sVCBKlm5WijoWtLTqC4mi7DM+l15Pssrx1VStaHiv8VMyW5OE3btZAbSLWn8P5aae8wYHRiwY7cs4oxlnh2644Ses3xoVlUzLGCNshz6aFEo5Xps7RqUspPeGhA1iBhP4FOx8/PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QVNi23eL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F1ruviQZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSMu4K53718751
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uNmr2Qd+7VE+ZXIXnd9eWAuqPwXoo5DhvxtgK5dWg7k=; b=QVNi23eL1jVD6PLB
	+PZR4NtMBlXbBD0TX/zDtQzoJZMgMKebRr1UqbyW0CWco22dtHdq69PVTDrnuT+J
	8qIpabcrzvOa6mUJRKAWqEldyPrz54TlldXp7SHk9BMrosf42XE/zvSCVSTYgV/d
	GRWv1gGb0VgfWQ1iTUI5P6nZY9Z03oR3PtLf7RAROZtdqMPfC11UGVX4R12N+MSY
	didDoE3lkrA/t9OVMcO+dPMwuEb+8qGmNna+v+G1Zx0e//xklshYxHxMpKX1kn0y
	2QhGr73hCDDayv6OblFZaY3Dz4zJKaEkHf/J11oiAGlNgVbSlnz/PO19uQsLJ9Ao
	BUZR8w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6sg3k9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:32:02 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b9c91b814cso20061168b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 22:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766989921; x=1767594721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uNmr2Qd+7VE+ZXIXnd9eWAuqPwXoo5DhvxtgK5dWg7k=;
        b=F1ruviQZ9IDZQ7+MNAUZMCGHMYmWr2gq0ZYU2ybWXqdq5qTUmhQoXMm7quMiGq13E2
         WBLHnIPzgEfsodLLUQdKZHV84NY5uVvKgmC/Q37rMsAWRJBcIZvYJwCw0qQe1jB1SxLL
         RFyoB7i8o+rOFaqEJSyXrBCBXGeLa3Qe5NcDaerm9OQX8FiNiG03qSiCnWsObEQQ2ci3
         MoDfYNr/CK45alVID9KfpQcL8ttIeaBhwsHnJiPy3PkyyJisYNm24LSqwDmLxCB2+TrB
         ONg3iL5tH6cg/0b1faX6CFse5UmlU4c11TGDwPTcVWxxrHoyiT/jF6X0pj7kguDhElcO
         uJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766989921; x=1767594721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uNmr2Qd+7VE+ZXIXnd9eWAuqPwXoo5DhvxtgK5dWg7k=;
        b=trmY+R80uNalKtOJZSJUY9j16n6l12rz1ocxpIQj+2vzQGDhLVAkFb1dXPMprT652p
         ONUuvL9u6hSlfJdPSq+f+HTMBNr9pFoLcyOEmyVSPoLry4JyYJoGRGRLiz3Zz7h5XSV1
         JUoJiCKzjf6yaN33rAq3VDokJ9SnwNmYoDA0qJfsHsGnTlO9u0o5E4TRRhaJvG1B8Ofa
         m5wY4DPR1OhHe9mVaQN8eMeC6k8WH9OB1RmsrlcAgSuofvyaIvMpS+aNjtGU9i50TOzZ
         sAHZz6bs4+rV4HwhfRPzg3GWFcadxsIha7nX7XAX36REBzBim49eU2mfIh3aNmqDvmAi
         ggJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFj5bs+MBSFO1YLamcAUAHlOeCqmmw3DjfCW7xePKHtVCF0YvEg0EDBXdbXS9MIHEKMczZUKvFWtAMNfpV@vger.kernel.org
X-Gm-Message-State: AOJu0YzvGPeBKRqjfHgo+96akRm5Aq5zT3ANxHjrKwqDA/RjSHtNqHmr
	lRqSqeBLG8iSUxBQ6s4UYdOlri1h2MczvbwL/FW11G2gvAknR0aZh2ML78eCQdzJf9lnRKHU9BX
	RfMyoEDEVGAWI3HS7txt7m1d/Gxdq4Vl5Qzs0WdGLZblLsVnYtdOYlHwMg62y1fMtrS3Z
X-Gm-Gg: AY/fxX57mMukz2X8f/vxkIXgBjBfbfeFaptWZdogcvQryyacNwPkW1SR12TQzYTxdWA
	k0L9C1t3410SEWSJ04G5r+sV5MjcYK+2LRI2iemdF/MfqO8BAWs2DDTeiydIHUn+d+OBeS/VT4w
	WRI97uBPMyDO5nEhcDNwBaRE52IR/76CP5Rm8VUXhwWJPyUAkWpl66vzn65DplAYsnCn8Rfdycf
	1e27wcNy3q1nLr08TyvUQsM++34ZwpRGV96gOVPNL6YuDVqtqcme7NrjFN5tNe3iLyGNKoeVPZw
	Hpr9gQaKEkSLwAF4Ydb2ULc1uJFfAQdoaVWDsbjA4Vk0lC7HWZPv3E2iH+HaHNLAGCKsZfenAeh
	Q9wg7fSkv/EbwDSYcpmbxR06lJ0y8RDL6+w6bwRpBitV13Jk=
X-Received: by 2002:a05:6a00:8014:b0:7aa:e5f2:617d with SMTP id d2e1a72fcca58-7ff651c3519mr28501216b3a.30.1766989921263;
        Sun, 28 Dec 2025 22:32:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEuWNnJoqqmKSK7EBdRRCNpr9qpD2VwNZsE7kTp8/v1msgyAvsObPIWGy+/LSRKXlLFzuuqKQ==
X-Received: by 2002:a05:6a00:8014:b0:7aa:e5f2:617d with SMTP id d2e1a72fcca58-7ff651c3519mr28501191b3a.30.1766989920730;
        Sun, 28 Dec 2025 22:32:00 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e797ab9sm28308962b3a.59.2025.12.28.22.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 22:32:00 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 12:01:25 +0530
Subject: [PATCH v2 6/6] media: iris: Prevent output buffer queuing before
 stream-on completes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-iris-fixes-v2-6-6dce2063d782@oss.qualcomm.com>
References: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
In-Reply-To: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766989894; l=2070;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=ToSP8yw7UHrhfrl6kjhmcJJUW4s5zMFqgwQlqSSUXTg=;
 b=BBGTPZuqvbZVANhDb1b6tnEdSuZz3vjpRe1l8N0jbAO4T0nOyAX42ahp0+jMiyrVleaN7FZiT
 F7wbzFHue8kBksFbC4KBNJeQf3YQurHCrnGVmD3tnkzh15mCx6Lzefj
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-GUID: axniw7EQlFWgO4KR3qbLoCmeLgWVFvlA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA1NyBTYWx0ZWRfXyrKU6lDW8Fuy
 t7DbhSIqqgrA/wKe5AachEE+exD5K43tns3nhIo67d6xkfkGl+7KBfPUU+R4ViMUKVMG3nOTCVo
 RHUdbj1DkB6I4x2T6iB+WOaXQ8REpqS5pHWPW2wlSQVFbLtaUeRR6cGw0idE8dBFbtgat+0Ef/C
 bqHTnBWe3Hue9ncei4AUqNuvqiTCXT83VXRjBO7pcFXyKw/G7dHs+MkDsYQ9LAmAdZ9AEcy/VcQ
 mQy9T7BC7I0DeuULYvT5PuLVpSGGP4+1+RjF51vzsMi/PoAVdThxPI3f+DN/iPVhrwPiL6UYdZe
 XJp632RS6gXnQHNie/Kirj33YZwbtjfuvntWhzY5T52V4b2dlAsMLjjtv5qUXPenq75c+LwqhuR
 r9ZGoeLEmd/oT232/H7HTdu1xOwyjTCcFkEgm3+JHrFZ3kwgWqEN8Wa99xN3y2GhC2Fcq146Olc
 H0Kj9oHU83durkmM3Bw==
X-Proofpoint-ORIG-GUID: axniw7EQlFWgO4KR3qbLoCmeLgWVFvlA
X-Authority-Analysis: v=2.4 cv=Y+L1cxeN c=1 sm=1 tr=0 ts=69522062 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=k0qMZAR7W_WzNVtuHNoA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290057

From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

During normal playback, stream-on for input is followed by output, and
only after input stream-on does actual streaming begin. However, when
gst-play performs a seek, both input and output streams are stopped,
and on restart, output stream-on occurs first. At this point, firmware
has not yet started streaming. Queuing output buffers before the firmware
begins streaming causes it to process buffers in an invalid state, leading
to an error response. These buffers are returned to the driver as errors,
forcing the driver into an error state and stopping playback.

Fix this by deferring output buffer queuing until stream-on completes.
Input buffers can still be queued before stream-on as required.

Fixes: 92e007ca5ab6 ("media: iris: Add V4L2 streaming support for encoder video device")
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vb2.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index 139b821f7952feb33b21a7045aef9e8a4782aa3c..bf0b8400996ece5c9d449b99609a302da726bf9a 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -193,10 +193,14 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
 	buf_type = iris_v4l2_type_to_driver(q->type);
 
 	if (inst->domain == DECODER) {
-		if (inst->state == IRIS_INST_STREAMING)
+		if (buf_type == BUF_INPUT)
+			ret = iris_queue_deferred_buffers(inst, BUF_INPUT);
+
+		if (!ret && inst->state == IRIS_INST_STREAMING) {
 			ret = iris_queue_internal_deferred_buffers(inst, BUF_DPB);
-		if (!ret)
-			ret = iris_queue_deferred_buffers(inst, buf_type);
+			if (!ret)
+				ret = iris_queue_deferred_buffers(inst, BUF_OUTPUT);
+		}
 	} else {
 		if (inst->state == IRIS_INST_STREAMING) {
 			ret = iris_queue_deferred_buffers(inst, BUF_INPUT);

-- 
2.34.1


