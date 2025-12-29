Return-Path: <linux-arm-msm+bounces-86788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FBCCE6073
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 07:33:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95BBF301E5B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 06:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075A82D2390;
	Mon, 29 Dec 2025 06:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dMGmGyFi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ew2Wz/yP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7E72D0602
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766989911; cv=none; b=i9dUj0wAx5DZcRdgYZ1cJb5y9eQB4TrjyI9NmV2HQY/GKDufXiQJUVMqPEgpNF3LEFBXTuj3tfa8dImMU0lijTGE6sHHg6S1Tsa8g7AbQtzoYpYpE9Or325WQEOmAFvXB0r9LzbAPCNlPge3khCSy26Zbhx+7Op3p0/+z5Tx18k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766989911; c=relaxed/simple;
	bh=+rL4lRzTGUatVxR2IU5B50u9WgYSm4OhmK8lABIkEUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s+HHIuLasWC0+r75ZMkUZbF2CXmtI3FWKbezOfahnP6gh2Ym1gY2jJBzkprurDo109LvdubxcdzuOaNf+VU7E3td0WtwO2AHO597L9tNg3jKAx5W373BjUC9VLqczl6KcSoS3lyzU+yMbxu/QUOJVfZn4dfwPw08HLUFdmTfMEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dMGmGyFi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ew2Wz/yP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSJV3xq3686954
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CSTdKndo2CG1ApifCcfjmKKwiWM5Dk3UzJnk6Vq5Q0w=; b=dMGmGyFipzSeUG7/
	zm6u2nd2RIZ5NROThQXSYAM6iL5Pu/d2nHAfT9MxM41TnWQyb9XE2SaOOeAdU7sz
	7aFEXa7+/4YM9fJOq6nZrwVerChuRIykdo6qyXHBLyooCLQr2V0cZ+IlH9XA9rzQ
	BKELwKBYgkOLg0Rd3T5GQPIgobTWhG0RpikArF+2GUuljGTZvuhgbTmopHkuVMNE
	Q2YJ44S7PqZxJskOLk6CmSFXu5uZNPpZEpwXbypUeJzM5homl7BqrM7PFWiJ6xNO
	9PlfmrPBp7K5lXdlk5oJnOFPZwyqTPHgc9rp3RYbHqEY4YSWypkZCe644+jy1260
	fy4N8w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7hsbjrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:31:47 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b8a12f0cb4so10247527b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 22:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766989906; x=1767594706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CSTdKndo2CG1ApifCcfjmKKwiWM5Dk3UzJnk6Vq5Q0w=;
        b=Ew2Wz/yPqUGTIdkhJgC2hpynYklWggWu0KHFj1v+BlVZldLY7OORNMcEpV2JiAPr21
         /CBiU0wwtvMGmlVMi8vi67rD5v0MIHhz6yWSQVSWNed1PxU4E82ytcci+LMV/EeInDjl
         Uc0wKCU38KoLff+RMsn+Rz7QhrJx4nKWmiAZ4L1OpO3b4NJoromg7NJhQgk5rs1LG9bG
         +dVA6qHj90dh34GvI97tKtZvhIdbHTUzOC6EmAz2Gd8G1FgbCK60sl+tlip1yBUtyd5k
         SubFY8rz2AJjXyr4ubrigTTt6/CdBsR9t1CRBGjkFlFO8di14OZ7npeQN1fX+2Gk5xfe
         2Yiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766989906; x=1767594706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CSTdKndo2CG1ApifCcfjmKKwiWM5Dk3UzJnk6Vq5Q0w=;
        b=EE9Ur8ov+S6SdzJJQPmEkzy7yVV1xDi6OUdo0KmERtDH91qq9RXdZTk6yDrbHAPTyu
         9FP7MAW42RleChi2k+w98j9/ndBn2kqwOs5CxXZ3QDAWe6cAbv2Lo0zvJx+P/RXzwjfE
         yIWvzLJ4EAzmkLWjnhSVhtqxIFOiRjdv/Z64Az/gliccMsYfOMuIJsCamLHqOuQTpwRF
         k22BpacBCxPGpg2+tY3WLmaI4C8a5mozy/aGhbbbfG4rYHBE680uTQYs53khPuJI12Zl
         2Hx44bltL/Sv+q7FTANkJfk4AjBW/c3xur/D0pYzFdg9L2OJhT4+zqS+GdZBoM4j7XV+
         9nTg==
X-Forwarded-Encrypted: i=1; AJvYcCVbtHOyPCdeaeSiQ0AOdkT1y3/2FPpQEmSla6hXPZrAQG5i1mnmVR1qo2uWy4dvMgB49kb+ygCJy9wk4rxz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5b2kai2e1Kmmzi4HNuW6TwCCRnd02VbMhbkyqUja7tUXny2BQ
	sTnTnEtRFz21qL/NmNRRfuBiz/pxgm19dXM9av4qJmAC0I++xS14Nj1mCkTdBCNegTDthJ49baN
	pc8HF1HlpQBXgKeMNI3sK/FA52RaRo2KKMb8PqSivIV0dns4LIg3/YnVDCJWXoJ94KJ5F
X-Gm-Gg: AY/fxX7NEgxlQIbpr9GQ+H0B351mFqRSAuON/o7Z4hDtU+KlVxrpxpaoEMfxJO/plGt
	suDIRligX63ow6jZl+XpvRdt5DzVzoFvoCox+0CwNct6b325H68IMKurh7N5sI+uWUnFVDmW3BI
	dr2iPHejahIWFLxaPv+6G8eTsCNPgR280I0FtnSSnZ/Evi0APMAhpB508CfY/DZoLmq7ov3digW
	FuRjjMrE/Ua2qXxkUahSgAGy0wV7AlW9JlLmibe8yBIm74gjNdWMXSmrNZof7RD+dOvM2ykED8E
	jmwmT6Tff+DWysuufnw9W0aJC0vR3r4sCSzSsENRDC7egmhI7RvNwIC9jHWvBp8yKgjcocMVy22
	YJG06v/i+VBiss0PeTkuHxTanaK26O5osNvswCKWKAL6Xyas=
X-Received: by 2002:a05:6a00:4105:b0:7f0:d758:3143 with SMTP id d2e1a72fcca58-7ff654b8108mr24578310b3a.20.1766989905973;
        Sun, 28 Dec 2025 22:31:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDInxSUa0oM3ki/aI3H6HGzs0EMPDzJPVYX8xu8sOQ+UZegnvmeo2DVlJYFXbYykF5SxlGIA==
X-Received: by 2002:a05:6a00:4105:b0:7f0:d758:3143 with SMTP id d2e1a72fcca58-7ff654b8108mr24578290b3a.20.1766989905477;
        Sun, 28 Dec 2025 22:31:45 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e797ab9sm28308962b3a.59.2025.12.28.22.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 22:31:45 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 12:01:21 +0530
Subject: [PATCH v2 2/6] media: iris: Skip resolution set on first IPSC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-iris-fixes-v2-2-6dce2063d782@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766989894; l=1386;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=+rL4lRzTGUatVxR2IU5B50u9WgYSm4OhmK8lABIkEUw=;
 b=cvCwCsa2e0WzLjbz4pz1dOqr9BVp8LWqEaYF9etAPKZHg5cz+zc1B7dUbW1ONpKMy/7hwooV3
 AMQOJvKRWlgD/Yg5EEgfBvhzbh0RcD2h2OWsXQUJsFfFrrhfeY5R4ca
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-GUID: Tl_Tot0ISwwEsHdsxLVYvk_8pmuBi4UU
X-Authority-Analysis: v=2.4 cv=O4o0fR9W c=1 sm=1 tr=0 ts=69522053 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Ed8qMULA6z6kmPtfi8MA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: Tl_Tot0ISwwEsHdsxLVYvk_8pmuBi4UU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA1NyBTYWx0ZWRfX7drLT/VJ9D77
 3jtiixOUxFrDlLolIeCd24HkEUCPAdbt3vAjYhovKJDTegUzuxyPjCeprXqaHPSKAr30fh4Rpkf
 BHnDGTF7821Xm+biOPtS8ghhVbTejM+9AvG0oyqAyKSHYMjs+hgMTDiWicQPQnahjw4NuxWOBTG
 QnnGsRTqdzXpeUW5zCzV0qFo6DzaHomX7IbemsKm4XdVRzzdK2bcbRGbFFcnLnddLVdCHGo36gK
 IeYIj3mgCDBnrI0dfARpuYEqyxTxaxBQTgdPTCZ3MFyidFS9XKY/OhFWakobXgwzuxzYufPqz/z
 gFK5GRBFzpOGU6Y/vzotfsrBNMW3y8K64j2WUxxfu7iK1+QUOseEBseH72Uy584ZsnaLZZHDYlq
 qaHtCg6tNO0JNFCXOPtVxCS5qgfgejMsGCvPW8pDMXB39HNWgA79eJr2sO7XE5JYWO1vmQdqQ67
 1HkH+bz/qqMc/2DCzKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290057

The resolution property is not supposed to be set during reconfig.
Existing iris_drc_pending(inst) check is insufficient, as it doesn't
cover the first port setting change.

Extend the conditional check to also skip resolution setting when
the instance is in IRIS_INST_SUB_FIRST_IPSC.

Fixes: caf205548769 ("media: iris: Avoid updating frame size to firmware during reconfig")
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 52da7ef7bab08fb1cb2ac804ccc6e3c7f9677890..5087e51daa842515e9d62730680fb237bf274efa 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -733,7 +733,7 @@ static int iris_hfi_gen1_set_resolution(struct iris_inst *inst, u32 plane)
 	struct hfi_framesize fs;
 	int ret;
 
-	if (!iris_drc_pending(inst)) {
+	if (!iris_drc_pending(inst) && !(inst->sub_state & IRIS_INST_SUB_FIRST_IPSC)) {
 		fs.buffer_type = HFI_BUFFER_INPUT;
 		fs.width = inst->fmt_src->fmt.pix_mp.width;
 		fs.height = inst->fmt_src->fmt.pix_mp.height;

-- 
2.34.1


