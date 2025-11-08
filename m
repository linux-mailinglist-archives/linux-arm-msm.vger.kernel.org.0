Return-Path: <linux-arm-msm+bounces-80819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D438BC4268F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 08 Nov 2025 05:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CB763BB80E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Nov 2025 04:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B262D7387;
	Sat,  8 Nov 2025 04:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QWf4LCWh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AGtM29M1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B652C21F3
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Nov 2025 04:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762575853; cv=none; b=SRxBFcl5GBiiIAoMgZTFeV9FlZTssW32asEDq9EYpKu0k28abUZWN1wv15y3+InlBAcsTNZCXrYgLqjbEc68yiqOnXecjYyx+RkBikg/N9b+Nd14F8H+V91zQsLbRBzXGh0V4TR+ksPE4Ajrcd6Uq600eExh7Fel2gQAAZHcmaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762575853; c=relaxed/simple;
	bh=RzruQ9wp8ycOBWczy25ujS8bJ+hwcf0vs17Xh670YBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lMbv4AIqo6jrzMHFMgof/5dZwGMOBDq+CHwq7A8GgGYlNTnpn8irHsqggmLAKqlXy8Ru1ozFZ1vIyEjCNNnfLqrhm5frm9BOv/MeSMBR7RZua6oybd4F3K2GhsSCblx4Td8r9ElQDHYx7UvK3NaLvtBQza0ukNkznrGQVtnEqXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QWf4LCWh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AGtM29M1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A7DPXvp3129940
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Nov 2025 04:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Wn/mGVWsg+Fjxsv+KjjZhfuYj6drt3gZw0kiebo5zY=; b=QWf4LCWhBIetda7E
	ZKcMJbQ8FNl91ZJPKvgGK6wPVrsmXmxyXdCOEaVYERQuQhNzcmrfzWPILYarNtNx
	ySqQNUv/QTiKIR2G0o10WSh0UgH31HfWok6mjgiMcjMUVc8DnXb2dYCTVoQz/fJX
	XVNZvJTyWin9leu4LCrr0aN9k7NZkYffmXdQv4VK53wi8Yk3H3qZxquJQO0xGZ1A
	njPCXA9FnW/cpX1TW9TVO71CzNdPN61Xtl8mOCkMIefvlyIxeAN85m2hTeerJcAN
	gjYqrTNhVNPM2BqSmm1FMFTcM0tBcDwnW2TJPTP0BhWsVb4goalHpTIQymCSvCGW
	HUcIdA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9hn09wks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Nov 2025 04:24:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297e89544d7so716155ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 20:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762575851; x=1763180651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Wn/mGVWsg+Fjxsv+KjjZhfuYj6drt3gZw0kiebo5zY=;
        b=AGtM29M1qbtwrliiN097ZILXbarAA+Q52ri9OyGEf5XGYVAJsAXKjAHMgCf1xDYGu2
         YlvbPeqhQ4pjItGeYFJpfj2HJ8yMm3jr+zp4k0se+VEbwTgw6BZw54+9Rf8sXf1c8kxj
         gXY5PkXaAOm+bSTe5d731K6kld492DS18HFsShoOsDRd8NHk6oidLfBSUKTWqojmmLJc
         Fh9siSO/qnfG8YMKyb24jxu+pz+X9tGlcEuIKKe1tVK2d+Cfs734VLDvBqtOnUaZgY6r
         24TaThuYtqL3ZzWH1PMeGBXsl9eazxNB01PTxieaqzHXQ/ARpcW4Gt/C+Pw4UB1nx1uC
         zzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762575851; x=1763180651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Wn/mGVWsg+Fjxsv+KjjZhfuYj6drt3gZw0kiebo5zY=;
        b=J3lpWuPXtrblOTxkWZs6vtWvs9a1yUiACLUOkSUXzl96c3VWDsyi1qk0Gn2zAZXuml
         dwC3oaBdebp+K7FWKwnLYZIgPFE3MRaXUp2RJMCA6/zAx4h67GDcREkIPNEX38OLbXcu
         PqDBC0s4EuYDaJl1yhAjLWvqMUQpE/ijE9XxvteObfg1asXfzbuBfbXqKPoi7OtSQalZ
         vauXYljRmArNzC0FhX4ybsKHE5SdH0ZqEnKV/Uq0e3iZFa7IKRPCJ92ngMBJX3u7kPxo
         RSMt66bgG93t1zJVHPZfawJW2GBxXNS8OSQTiay0F++WUGEie/5G1lpfHshavzYGW3qf
         2JcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvOxfcy4ivvHvo2qRBZlb5pZo3zdQSEGppkgP0o87IG6NaMe9eWKq6a5OeQfmQQJ916DCSMFNYP163HbFl@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn/oWQYdlKg5Hqk2yS9erjTA+sPN2b3wIKYn0PO/fH3evn8JdY
	UyySFQ7qIDEThJhIPCSny0QjytHRrp5RlfmkUd5nfPTbvOHDdOH2fD+Q+K1e4aLa5v7ivwi3VsZ
	CHMqOoZcE/Qra+i2zmuKozNAZtHYNulBOkX77CHDS4YU4G48Dr+zSciTmoDnvVRIVR4ka
X-Gm-Gg: ASbGncs3LEdqRRt1XC4UWtVaRUs5MQclsUgbxqdhbH7usrtgsuOr1wp5TI9bw3mnvlx
	mPdxxEjoK1sMMElEklFL8BBCviz09G0NDNpZhP1WzgBvbVy/vqTqFuVHgFTpY1WIvk0kF2RB29k
	pj5L4A2Afhlm2WKAbwRJxrl1XSnpBR+8HC1e1vEwIAwOjXvIOSj7JKhTaoKy5NhPjjGrbu6FgLI
	15aLOSsPZG4zfNOXOaTfkVgSOIYh0qAVqmbaD+tdbzTS7h2zCcYzYiic42DVvJV/GyfFWMoIOla
	0JVu4gvZH1Xg9/+rWhYHvaWLroZfgCWS+84IgU0k0qywV0ZGXs9vciou8OITXNi5a5Tp9Ni4vXR
	7+wbgG+DQBoBFkpVZeCFDohkJ3sXIjQaj/tYIViBrdwnalo7xDbvCggIUA1A=
X-Received: by 2002:a17:902:dace:b0:290:af0d:9381 with SMTP id d9443c01a7336-297e56cf5d7mr9475715ad.7.1762575850814;
        Fri, 07 Nov 2025 20:24:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHc2T4l9Pub60u4mvuoxZoKdhoytBYJ9DnpI+jGuvhEiD9MFfksqlH6xBEpa+ahRhwh8csX/A==
X-Received: by 2002:a17:902:dace:b0:290:af0d:9381 with SMTP id d9443c01a7336-297e56cf5d7mr9475615ad.7.1762575850343;
        Fri, 07 Nov 2025 20:24:10 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b90asm75442235ad.23.2025.11.07.20.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 20:24:10 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Fri, 07 Nov 2025 20:24:05 -0800
Subject: [PATCH v5 1/5] media: uapi: videodev2: Add support for AV1
 stateful decoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-av1d_stateful_v3-v5-1-351652ba49cd@oss.qualcomm.com>
References: <20251107-av1d_stateful_v3-v5-0-351652ba49cd@oss.qualcomm.com>
In-Reply-To: <20251107-av1d_stateful_v3-v5-0-351652ba49cd@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762575848; l=2537;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=RzruQ9wp8ycOBWczy25ujS8bJ+hwcf0vs17Xh670YBY=;
 b=cg1QpdXQckjwYuFtNcqmfDOWzTBpBbqjyOZC9kzEChBsuKtoYoRbh6TiEpY/G7s8JKGIoxGc/
 wNrzzoWrykaAOeSu7ikmNZodXOq64+3BKZTbFA7DZgYs9anMh5ldRN0
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDAzMyBTYWx0ZWRfXxseoXThu5KiJ
 c7fLgiym639WdP2PziWRn91M4v/05bYg41NJqaSqwkbQ6oYdzvPaPHQ5Lk67HxXp3L3QaI9x1K3
 mWayz7//3Y58+whj+b9jqXZxOhsyz3c2o3JH0MJj+UjKcCY1AVTGeFGV3i7KaiMEReHDMkQj8VG
 htpD1sOZpqy6KA1N/BknaNxQjVfLikSkfbjkkN302X1AJ0NwGxbUMTpo7RBxuqjfIcdvv1C48r4
 DJ36aof04kTdfq2X4GCt4ffScnl9uEDlrHfNN76YGk9O1Ly7hnUwVK2WT4pZFk4zLKlLzJyjyfV
 6463bTwvb7ymc5lvXueTRBsbTGt4MEb4cv5R6FVSP2DtD/WLsRg0P3xQjMlYWenlbgqkhu6dPuR
 9O7xmFvSZD54A2suLnI8WSDPXJyOdA==
X-Proofpoint-GUID: GAdOBEV_JuP-C4gkUqpJ_adzNqyrCRpN
X-Authority-Analysis: v=2.4 cv=MsJfKmae c=1 sm=1 tr=0 ts=690ec5eb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=5q8hE9cQKCNJD2usWYQA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: GAdOBEV_JuP-C4gkUqpJ_adzNqyrCRpN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511080033

Introduce a new pixel format, V4L2_PIX_FMT_AV1, to the
Video4Linux2(V4L2) API. This format is intended for AV1
bitstreams in stateful decoding/encoding workflows.
The fourcc code 'AV10' is used to distinguish
this format from the existing V4L2_PIX_FMT_AV1_FRAME,
which is used for stateless AV1 decoder implementation.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 Documentation/userspace-api/media/v4l/pixfmt-compressed.rst | 8 ++++++++
 include/uapi/linux/videodev2.h                              | 1 +
 2 files changed, 9 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
index c7efb0465db6480fe35be8557728c196e0e530f4..6ca63f35b801b8aae142b69eddfaa549a5568a3f 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
@@ -275,6 +275,14 @@ Compressed Formats
         of macroblocks to decode a full corresponding frame to the matching
         capture buffer.
 
+    * .. _V4L2-PIX-FMT-AV1:
+
+      - ``V4L2_PIX_FMT_AV1``
+      - 'AV01'
+      - AV1 compressed video frame. This format is adapted for implementing AV1
+        pipeline. The decoder implements stateful video decoder and expects one
+        Temporal Unit per buffer from OBU Stream.
+        The encoder generates one Temporal Unit per buffer.
 .. raw:: latex
 
     \normalsize
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index becd08fdbddb857f8f2bf205d2164dc6e20e80b2..cf0b71bbe0f9d397e1e6c88433a0fc3ba11fb947 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -775,6 +775,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
 #define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC parsed slices */
 #define V4L2_PIX_FMT_AV1_FRAME v4l2_fourcc('A', 'V', '1', 'F') /* AV1 parsed frame */
+#define V4L2_PIX_FMT_AV1      v4l2_fourcc('A', 'V', '0', '1') /* AV1 */
 #define V4L2_PIX_FMT_SPK      v4l2_fourcc('S', 'P', 'K', '0') /* Sorenson Spark */
 #define V4L2_PIX_FMT_RV30     v4l2_fourcc('R', 'V', '3', '0') /* RealVideo 8 */
 #define V4L2_PIX_FMT_RV40     v4l2_fourcc('R', 'V', '4', '0') /* RealVideo 9 & 10 */

-- 
2.34.1


