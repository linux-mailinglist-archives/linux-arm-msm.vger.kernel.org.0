Return-Path: <linux-arm-msm+bounces-86489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2D2CDB800
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 07:31:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F119030B6D0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 06:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7431320A04;
	Wed, 24 Dec 2025 06:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvJMdQTd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bwereyeO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457A92D7D42
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766557690; cv=none; b=tpLJRpbwqOXNeuZ+Kihkf+3xonTlFTqhHMHZJ+XaoFhKKYkntN/3iRrF+tDxfxbyl/gRNTZOFzfMuIdaTJEjR7TgVd26zlFrNRQY5FNyPWh5gKtwXr8eJbl4ZUF9KlNCQepv3kL8UtZJZwHfRBBqQnXSA3xK7E1QxXzddjzJGj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766557690; c=relaxed/simple;
	bh=xtcCRp++LaWYqpdmb2jGTHOJ0mXUq+jjwQQKy3bKQ+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hdNxGDGraSIcXExo/+iWMqvn3Dejk6aRxVjsECxsV+vRBEMurXW7iMRRpAxHT6WY1wUly2i3DS2rNVTvULNinNaNxUnjHAENh9KAepHg4uux3muEnvxb4BsRu6sEe/f7Q7LbHPg3RQ3ki8ZvEx7k0toj4NILGycBFUsmGYe82bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvJMdQTd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bwereyeO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3wT6b3796796
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iOdzmcIwX9TAQP5ZayadVCjvndDWClqgACwOqjT6E+I=; b=lvJMdQTdFbK7jmUM
	oieJFKC39OarlvkcxMVITu1cRWQJzJmUTAtHInbsKm+ie9ctn2bEiLkQr8MoZLll
	lIuYgneABA6GsZqznkcCJmF6pA53FTmZeSjo7cnlJmB6WrPcEF7An7Y4j4gYZX/T
	e7XblsWKcNcz9AWNX8420eCysVSvqsetz1iKu1NZGRO0NzCoBRD7Kzamw/fU4v9y
	UpY7mWvKQElkJtcP+M0Efg8Ab9Iy7FH0V2sE8Nh0avs93sJurdQF6NIQyQuHuDxR
	rEkCGFxcsEZ4k2vIpPdcNI4Px4FMisLpEkBXkn/E9Cc7+ikdxWsvraAUyx7Mo2jM
	wiIlqw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b88r68ach-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:28:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b90740249dso9910410b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 22:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766557688; x=1767162488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iOdzmcIwX9TAQP5ZayadVCjvndDWClqgACwOqjT6E+I=;
        b=bwereyeOFEZ/iaXumHAwNz4t/z+I1KbjjUQjgTxXCoPdyxG0R0Or6WK57q2dIKxRTK
         /JhXQU+MS5R/We8va5GIQ+fcwZ/koEWujII9nYAfL0jUaREPcCY/angfOWZHwnks6nQj
         mHb83dC0KI3NYJlLlzo1ipMepmJynrKPFZdq1ZDHkbJITPCq6o8j0U+wp+3chxKprPwY
         vq0HPU8rweTv1MLGbklqDGGUXNhlthKQ/YSPnCrTMXGYKXJniu9v1Jd5zIc0KWF7W8uZ
         j+JnggjcjOi+7ThBezRJFtLBUBxrKS2+rEj8jTtCYSSMGrRfSg3G1Y89SBjskSNPjVUl
         OBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766557688; x=1767162488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iOdzmcIwX9TAQP5ZayadVCjvndDWClqgACwOqjT6E+I=;
        b=X8rxs1/KJFB3pIQn3ZVA6NDuPssiRtMUVDLwMFipE8RSgQ7tP3LIWhkuETcS3cNYCU
         t8oDZdl/5bKskTLme5AlpsGesiRJwiOCVL/+SDpRtlmKB9OUEQ1blRsqi4XpMXEENw2/
         Pbvqn6LmCUvZsWQGq2SQsc/jvDy6NjrpjkruOBhQIhYbG+95Nl3aPSop2M26zHFzmx1Z
         UETlb1e5YkFdj0Px+XBjp6szdW2TAL8SWDVbC8rC8tyjZNyIzNwwRPdETa9MwvHMnOvT
         DDRVh5L9NhX4JMFpjTLMmmsjamdAg4rO74k03TqL64G46aPis/RPq88F4WLkUcT/AtJT
         p7MQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKBc9WHUt84peghYotbv/h/yGBkkTosu3DXWX7stSQSjOgzstkt+kHuw77xnSvF0BokvRCm5ow+wRUPVzl@vger.kernel.org
X-Gm-Message-State: AOJu0YySspPxSjqBNIpvxsKTOJSMYyEF3h/30FSsk4SVu72a5P4ttEk+
	gz/5Jnl+RLU4wT8Y+RO4QGg6YvCtsGDpX6Evv6VcH3cGlN/zT29PMekwcDsmg45uQKkfhovP4Sf
	MtUJpBTw/D9is5DYM7d+tpQ737Q4HYi2HOWBEcF4xUYCXJAAH7TZHJTpBtIMobcVJIjeW
X-Gm-Gg: AY/fxX7Xrp+wXoYWaKv/GlXZMjXQWS6w1aKP0np6+fHKCl/ikPYQiHveN2hukNDaEzJ
	VXUc0ueBWeRXlpXsBjHvmkhxti1lZfN3EZFviPI3zEfV+Ch5HYQ8Uis6sFCDkq6aV4UM6oqsXJq
	dIKCAETmZXJGUrMEwD08D+O6fnetUIlr/9PFioj6kZrhWvu052mLJmez0raSpYdkI4t+9bWDlEc
	oweE0SsssPK4W9rIo88HdFbjKYcmhgCznG+oOfHmBbA0sVGSlmWNv1zkg9gIbBQ9vd0W2uquMec
	VirhRzs2g5I5SXTpxTgxdd0LOssVnl7tYnZbJBWzZK1Z1OIZ9qOrG3QDWO6CLSaFfsqHrCfDxNr
	6ofFFUA8ITUjrLr0kqHUwAeqWXZwkwf68N5Juq4oUbXOCqbo=
X-Received: by 2002:a05:6a00:1d08:b0:7e8:450c:61c6 with SMTP id d2e1a72fcca58-7ff6667b6bemr13836238b3a.54.1766557687751;
        Tue, 23 Dec 2025 22:28:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6/VVdv5LYR0NlRCzKDcgcQQZY58Z9RxGAUWMdermZHeHEAtShlzmWAMeTdGav8ECyJNAdsw==
X-Received: by 2002:a05:6a00:1d08:b0:7e8:450c:61c6 with SMTP id d2e1a72fcca58-7ff6667b6bemr13836210b3a.54.1766557687300;
        Tue, 23 Dec 2025 22:28:07 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7eb85f15sm15618908b3a.68.2025.12.23.22.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 22:28:06 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 11:57:15 +0530
Subject: [PATCH 6/6] media: iris: Prevent output buffer queuing before
 stream-on completes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-iris-fixes-v1-6-5f79861700ec@oss.qualcomm.com>
References: <20251224-iris-fixes-v1-0-5f79861700ec@oss.qualcomm.com>
In-Reply-To: <20251224-iris-fixes-v1-0-5f79861700ec@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766557663; l=1980;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=9cv66z5/Jx2IEk3a10U2yz6GWrmYnmCrelbm3ThLw6M=;
 b=8RqraBMlk1Pmn+B8DOYKVlIAApcZqiNp6DcP3/Y21GGjMxtB7/a8ZQ/cQgouv1JfWrfqQwPHW
 pTpzt88mns6A8NIMDMn+VerisdGMeoJwJiQi7bZqSdqQ3GeVGd5UWYE
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-GUID: 8is6vQ5Yr7oFxaOSj4Hc9g7SwhhBFDag
X-Proofpoint-ORIG-GUID: 8is6vQ5Yr7oFxaOSj4Hc9g7SwhhBFDag
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA1MyBTYWx0ZWRfX6icZbGDidKA1
 CbZlXo/h89GP6APQFOU1B5WWCnAjDiqTSzU8RGTCx3Xy9oSDBA1grinzMv0A6h3+MX6KVZKQfgd
 1sVDhu1nGcZXVGVB3g2BBn30rJcMaGrSF5WB2Lq/yeG5xt1xjTgDijkyxBDQtDLiSpEcSpb7ERA
 /VfspHyWXtrDalYHPiNhnPcHFAdBFkt2y0epy/pIdGz9VglOB/LkaH8+KzFE1ePScVXohFs6P88
 9ZcPxZrE1rjqWAFfOPZODnIWbHzF+SXmqlpSE9TMi5tOt+1sT+OI92NNsRcJt4jj15efPfBJnCy
 s9Jaz9/sKNzuaJl5L0YGTp2mRp9ag2vKFehspGjq/cA8vbh+DSfR2Nezns4VpJe/JUOsY0AgQtz
 qvX1rUBPHSFHpXNbMdgMTgqCPlm0XgZ/O16R0/zYjWs4D6RSo++W6OD60doKejIaxTbcXfFTeKE
 OCaG1UwP7DD6iMXLTew==
X-Authority-Analysis: v=2.4 cv=Qahrf8bv c=1 sm=1 tr=0 ts=694b87f8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XLzqMKnRyDA5696EbmIA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240053

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


