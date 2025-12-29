Return-Path: <linux-arm-msm+bounces-86790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE13FCE607F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 07:33:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CADD302AB9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 06:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B9D2D0600;
	Mon, 29 Dec 2025 06:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJ3d1yeK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HybyqjO3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA4E259CBD
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766989917; cv=none; b=PAyMJ66VML+jpXkt0dbO6tLQyjZ0jdhSqzfP39vnPWRH39DPiMbmBXfWstqZDgatXH5uDINdnsVDyeSzPPiCxwypTdly9Vd188FHO0kKGjtJelyEaGNmImfW5MbleNX6UjMOrkR0wkEU7LeIItT54Z/aO2oBvc7bsyYGoAnOUpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766989917; c=relaxed/simple;
	bh=WnRTSzPX7v2ew+XjFwuVlCLDf6VD9eOAqwv7XC3gI2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mhj/2H0JgvRJ6VqNHm65IRqw0LlWy52VHnkyAkuSzB0vAnfyna0kzGG7LdBg8JKoqMllmto1t1j5SjDf2F1idKyBQTFzx3IqN276XMmGWIAJgwpjz/pnPNCYK8DJ8gIYNqpesoV3dobwzlltt9PbmPrnQ1wnRWPR3RIU9QkiEVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJ3d1yeK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HybyqjO3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSNf5HI3370169
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z4kGK+44l58UGutVX6T4zr6zgIMspksNRCZEaJaRexw=; b=IJ3d1yeKl285Qo5J
	oyksJj2KFOMPOmEbH9hgmWR3yyCb+du7Cz+fgj6Fq/1gmdspMl0evCH1b96GPAJx
	2e3vase/or6OFCw6FuaeP/tKx6cRRZsIza+OzYBFAq3qJ+rqAl+LEMBYapVVjzU+
	L3N2Bl30APRs13PbPZdy9YPQ+pSUTWxmqcW8bpBpasFDMP8PvR/g9YysLq+FdGnk
	RPfjoeMyRSUTtIls/Ie2aU0WWIyBcSd2KxhsQqQn+ij8l+UFuWa/7eM7jMTJG4gt
	nQd1Nki/TfUSan+q8v9W92arGqTFCd71sGuurwvq3HtnMF5Kqto2bxXFCDPHdM5O
	D0Dojg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba4tnurrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:31:54 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7dd05696910so13667459b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 22:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766989913; x=1767594713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4kGK+44l58UGutVX6T4zr6zgIMspksNRCZEaJaRexw=;
        b=HybyqjO3LQEZW54fSiS4A2PlYGDDBuYcAIyuPpR4tNqrmKvEfbxwRLp11d9641Ha4D
         irmSYWtCLIoKe67Bo/PDwNpNaNaWemgtmHW3/xeAFNfCxct5Jqn+P/1SrXpPSZ3yk8ax
         k1hcGwyJjl6GUCg8w/F+HGUGdpyih6LkXaj11DFB4PCt4OxvQhtCp4ln7aEEQBQP9Deb
         0LFaL2O+ScoTTNmhpz3OrHepocjy8Kqe7mwIm0R86HbpX46xGsGNGyNGY88bZJpRpbka
         dkDvGkdZ3KoFPg5mWolvNXzOZutnHWokU9JF/Za8KunlKb+i3Q93LbwipSE1riqSCMAB
         HiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766989913; x=1767594713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z4kGK+44l58UGutVX6T4zr6zgIMspksNRCZEaJaRexw=;
        b=t3NTH7TsEIvVEzq94gTC2xI+fXMAMNs5qwgvh9ZNJJdYRrm89IEwcukg7vmMdhaFy/
         F1w+5V1/L0PYK8fNiYxlxmC55uXbx6xOybyoT3QKhF7Zb+ghDHv4ZR78iYPZ91+ral0W
         +cUMnzNEFl/gZYlrrucf9bwbFbaQAKWLekBRrBb+zooAvldcDBYQUFOJ1MmaRs9LBt5l
         DD/+Kd/05sBu5HtXqoK0D7YNX6Vyz/TNMrBgzMgSd+T7uhhImNv8CKDqCeLW0mvcUPph
         4Po9XgcubtLzkXOsU40KysdwKpc+xZS18adSsST1FUuuhnVwnFofLOAEbB+NROfd2rOZ
         IUJg==
X-Forwarded-Encrypted: i=1; AJvYcCUGszIxI1PaqviXDoRM0NlfVT6pHCroBrouTWLbdT3bCRsHfHefx9f+RTWNidtH7sBaO2VZXVUBOIfrHcWV@vger.kernel.org
X-Gm-Message-State: AOJu0YznODEI9WovGB8YfRTMP+ZNnbTeNaHl4sNjD53G0mFwoLUKihnk
	ycGfVI9EbjpBp9kdUd+HuW8DyGAl7qchbQia81LE31Z5q1TTIodsSioRFmtdmm9uJIkqWi1ptjb
	sX4quBqM07EMgOqn/YrMbUulJxpdzNAd+aJ6fgW7F8NKaEi/2feIau1NLAKm4wcMul4T5
X-Gm-Gg: AY/fxX7IBypseb5uVm4klU4Aso/d41UVZVYB/38cWOKizodjs356DHzZu8PqfPDkkuY
	hs3kTIiPs0b+CNKYOGXDgvdsFqgQNuKXbH0d04bjOM48hKxgnFuAK6Pqgte8zcIh1epYQ+AW7rS
	DqDTqcAxgIBdKaXt9nnN7C7x8dF8XmGSOycTaHiTkS+BbWcdqF+3rrkqbrOEiZOgNgetmOKETGo
	DvWIMWK231qkpni8e8OM962IR+dUupcf+7PAdOoaRERMcwk1cVeDi2DoyQqMQYrR89yEFk+QFEX
	V+1HFHhb3Tv8en37CXemy0lvS1OOgu98ZJO1xufQFg08KyTS9PAXD2sa/CKZ8mcGj1c3sJu9kok
	ZOHiA+CoXDg73yWVAAUdoCwWx7V08n2krhubhaBGZLUax+ss=
X-Received: by 2002:a05:6a00:3e2a:b0:7ff:9657:d6c8 with SMTP id d2e1a72fcca58-7ff9657d93bmr28312819b3a.27.1766989913310;
        Sun, 28 Dec 2025 22:31:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHJRw93o1Mu/bxzeZ0T78s/9VVpmIWJ/3GzW8Pdfcb1wUzPtC/9Fcpocb48Dd0PHZQGwaUHw==
X-Received: by 2002:a05:6a00:3e2a:b0:7ff:9657:d6c8 with SMTP id d2e1a72fcca58-7ff9657d93bmr28312788b3a.27.1766989912821;
        Sun, 28 Dec 2025 22:31:52 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e797ab9sm28308962b3a.59.2025.12.28.22.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 22:31:52 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 12:01:23 +0530
Subject: [PATCH v2 4/6] Revert "media: iris: Add sanity check for stop
 streaming"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-iris-fixes-v2-4-6dce2063d782@oss.qualcomm.com>
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766989894; l=1786;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=WnRTSzPX7v2ew+XjFwuVlCLDf6VD9eOAqwv7XC3gI2U=;
 b=VOCuOT+DWm3oykxxHTdN0yd/G4XMeijEfhGx3Pd7X/pmo6NApRAA5OTa8XluOJAmVDCMAhj9v
 LoMGDeklgmUBg0mjpvV7Y4TOEGpu2WDhYGUvk+ofPNDkmMo1+06H2dC
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Authority-Analysis: v=2.4 cv=G+YR0tk5 c=1 sm=1 tr=0 ts=6952205a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=miAyyWkRVIhBFoa6HtIA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: udK32faCb8njHBFi3-wTTq1n5xyha1_Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA1NyBTYWx0ZWRfX7nvss84wvbZp
 bRan+WmNLQvBgeqafg0RcuLQsvJaF+TAFpSiQUCPiIolBFmNzRXUmvCt+8gIXpVogGVkTo6ZqoG
 CFiJc8/CJsl5sCiGslQVcAuFb3ySamhWKRdA3Cp6lQaoiNDcKhpetYm+Ll+8Iq41K2AWjVRtyy0
 2RKCUD7MxsMRPorq49zWyXqQ9rBiSEBbGsY5tXVsX6zugg5IZgB8aJY+4F5mqggV4Cneq11U/b+
 aVGCjuCmOcc192zHmxanBDFwFY95ZneO9YvuA63RE4542SNn0sx+GlmZSmUTJRca0clakmR10Hf
 zhaGlj+h1jdRt5D1drkWs4JOoOk/5FFEEp5eQNAO9uGMiWlWn+aWuGqQri2UcXBdDuv+EfRGE9+
 xBYls4d0ToMWyV73IceXAAB7vLOkcxWS8SUt8QqBF1ubGGWfYI56TMi3/0cS6NhwGNqnKE7ONcp
 5ypjqJu0KfslOm8abtA==
X-Proofpoint-ORIG-GUID: udK32faCb8njHBFi3-wTTq1n5xyha1_Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290057

Revert the check that skipped stop_streaming when the instance was in
IRIS_INST_ERROR, as it caused multiple regressions:

1. Buffers were not returned to vb2 when the instance was already in
   error state, triggering warnings in the vb2 core because buffer
   completion was skipped.

2. If a session failed early (e.g. unsupported configuration), the
   instance transitioned to IRIS_INST_ERROR. When userspace attempted
   to stop streaming for cleanup, stop_streaming was skipped due to the
   added check, preventing proper teardown and leaving the firmware
   in an inconsistent state.

Fixes: ad699fa78b59 ("media: iris: Add sanity check for stop streaming")
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vb2.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index db8768d8a8f61c9ceb04e423d0a769d35114e20e..139b821f7952feb33b21a7045aef9e8a4782aa3c 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -231,8 +231,6 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
 		return;
 
 	mutex_lock(&inst->lock);
-	if (inst->state == IRIS_INST_ERROR)
-		goto exit;
 
 	if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
 	    !V4L2_TYPE_IS_CAPTURE(q->type))
@@ -243,10 +241,10 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
 		goto exit;
 
 exit:
-	if (ret) {
-		iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
+	iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
+	if (ret)
 		iris_inst_change_state(inst, IRIS_INST_ERROR);
-	}
+
 	mutex_unlock(&inst->lock);
 }
 

-- 
2.34.1


