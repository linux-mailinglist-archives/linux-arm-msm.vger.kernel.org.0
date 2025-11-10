Return-Path: <linux-arm-msm+bounces-80906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A1FC44F20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 06:05:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E24984E3A69
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 05:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4498B2E6CD0;
	Mon, 10 Nov 2025 05:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EMuU/IP4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dmRvWs+7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2C72E62B4
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 05:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762751133; cv=none; b=FK7SmE/p8RZWLdR45+4A5WC7BamsTWPygz2ji2dfjcI/SgpNTEhcMukiD6nrjjh1efDHBPgbhgMYwRndC59HvSF3SDVmRexuCYy6giU5dp0uH3dYJrmZ7Pt5CW7dW9FScxdtZmvHB37PR4f/XCA9NldwnwELoz24k1NW99gAymM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762751133; c=relaxed/simple;
	bh=RzruQ9wp8ycOBWczy25ujS8bJ+hwcf0vs17Xh670YBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A4gLnhbHKJ/OjOC6di9b/tR9qhxg7myt6GSQWP+rBDQbc+jab+G8cK1+DG2tbmnnCzB+uV+XbFYz5BQkjgW7Vx07lvUqgLvoLEjBZ9RdUPQPEgmZEDpABDYMzYfXkX1ywq0UHCrvjEXt2UHUoYYE/PHT54sAjdmjxxutwnlMXz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EMuU/IP4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dmRvWs+7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9LkpJU1415572
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 05:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Wn/mGVWsg+Fjxsv+KjjZhfuYj6drt3gZw0kiebo5zY=; b=EMuU/IP4jEEE6YMG
	o6ilu0Avh5VtITcPcBjdQ2gBE4KAIJPYv+iMYoaWdlPb7vEYFsQl0+oxlLdxMiCV
	IWB27YOsH9ZOXZjrP/W1cPBfo2gvbTu7o9DjWip3hwNqK47lIp3zKK0HFN1HkGXu
	hzV0wtVVjFMa/GoeKDsCGfLnRxiYvDHhc35UNqTo0MfO0nmrSXHDdmhLfg1pEPvk
	F7MbcNHPhn9Z+j3UF+ZDDmqDtbRu8zxo0KGo/AmM+0/qthqgId4+ndYQBfy7tnKl
	lv48qLrsTfNt65COl78cmy5hiciUD43JVcE1aDQvQcMdyeaMKw2bmLnQQ8cHdnME
	4zQ00A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xs7bf9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 05:05:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-340ec9b90faso937804a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 21:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762751130; x=1763355930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Wn/mGVWsg+Fjxsv+KjjZhfuYj6drt3gZw0kiebo5zY=;
        b=dmRvWs+78451jskzQhCNVRO1UXBhuaZhxxKfEMUtZZAUzoPi8wcMuUHgZ40RDhJ2CB
         UlvThW8FkRH3chvzS7fe21xcToyy/atTm1g6CsUlF4Sj2ivdiEq68o1BYeMg569nZaSY
         I7aNqbjOea720aBRsrgvh613tqTGocPlvMo39Z9pbC92iYMoJkEEa3wizmbv/wTXTJPM
         b4iSB6ke+yvOGGEP+DS6PcxV4dMwF1X08M03rE49OG+9w/XW1/hd0iYg8sIMwricIkqq
         lys1R+AgRCbqs6Rof3JU2KrlWwzlr3ZbbjwoFlT2EzY3ay63nikqhwefUuYGyjv/apdH
         2Ltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762751130; x=1763355930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Wn/mGVWsg+Fjxsv+KjjZhfuYj6drt3gZw0kiebo5zY=;
        b=f0wJw9yeWQrt4y4vTMFXEmwtVFK9w5pga3nACDn7QZPDN1bW659V/PCyAGz/s3Q6Mo
         nVjoRh2S01OmWJGQ72Oet9m0OuHAc+aWudS2Oy4o0Q51arsEzrGfS++7bvO8XNtOoBP2
         Q9kbHetFSueOfEccgHH/aDSnTwI0BSuQIA8kw9gWFBhEx4eQJj+nSQD24NqXcu0hkkio
         qLo+cS/FdbUG3ks7Gy2LTLcuQ6HlfhghxeqFWQZohlBPWyCKbUxbcyM0tg7zdcKeXRVU
         YlP7njicmlRDAI95hEvFWy3CpSIC19CylzwdHNnqXAPLceu4u1nfiyIlKDMoZyu0khwH
         4dFw==
X-Forwarded-Encrypted: i=1; AJvYcCVNmopQpRClxmdaFctF2wQVlBLXZ+pwiDqM35GQESEVtRTp9438im7+CNnyTq9YiZhiimr5m8lfz9+p34IH@vger.kernel.org
X-Gm-Message-State: AOJu0YxXAlxF18cnUg0KaFz5/Xow2/pUFsdaAAnmiCTniO/+DN1hM572
	+ghuSglopQY+8qzB9zKOejqz/NpgStYBPEqVIHMf43mPjrfwQHjM9WjgydU7tvr6h6URGgoBP+M
	knqc9hzTEKicsmZBRSybaTYsA/BuH0NbktHrvUbewSyMnklCHU4BJkOI5TYhAnU2jIRIy
X-Gm-Gg: ASbGncuEZjL+O4efWRSRmNdJlNMdkwGMFdsLo6mMn+UiHaVzylVtPP+OCmUCWd2QgpN
	zxv2tUtfYGSMtWJuachURs9JKEpur10bK8/f6weqI2y5O7sMKHK7SO0ygUiLq8TjzQDQktAlhz7
	2b2p+XU04nnsww7Zar4+WAp28R1LYE6Sh0Vy0UzRh3XEu6JubsCgve1L0GuHi5dfj7sz32vNF1r
	wTO8MkEF1f3OUHAzYgJXtpX3qNkBAVqGsTj2HgatCakeZTg5zH4xa7IjHb9w4wkkOjiVszxnuaz
	nxnQGYXMD5i2/Tk+GP/yRufd8jthyLxJxxj1RTdh6nD9VjsUO10oEDC95w3Ks/u6by2KpLii/kh
	8TBVhh5Kk6mlGQyxVgDfpttFH/iPyc5+2vRHaWtqFzA0jJU+4BwjI2PkXLTk=
X-Received: by 2002:a17:90b:164a:b0:33d:55b1:e336 with SMTP id 98e67ed59e1d1-3436cbf092emr4859904a91.6.1762751129921;
        Sun, 09 Nov 2025 21:05:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGR72/MIEIGKNpXYc7OsoV2hqp53HrJgYOB/4/a56FbPWhcVd5z9h4gzeRMwzF7XO1Ft5WO6Q==
X-Received: by 2002:a17:90b:164a:b0:33d:55b1:e336 with SMTP id 98e67ed59e1d1-3436cbf092emr4859886a91.6.1762751129404;
        Sun, 09 Nov 2025 21:05:29 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343705c1354sm5913748a91.18.2025.11.09.21.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 21:05:29 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Sun, 09 Nov 2025 21:05:15 -0800
Subject: [PATCH v6 1/5] media: uapi: videodev2: Add support for AV1
 stateful decoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251109-av1d_stateful_v3-v6-1-4a9bde86025a@oss.qualcomm.com>
References: <20251109-av1d_stateful_v3-v6-0-4a9bde86025a@oss.qualcomm.com>
In-Reply-To: <20251109-av1d_stateful_v3-v6-0-4a9bde86025a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762751127; l=2537;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=RzruQ9wp8ycOBWczy25ujS8bJ+hwcf0vs17Xh670YBY=;
 b=Ad2uYGRWwrIgdcvhA53FD3hdqFNuQEfvwCq2Ng/hVzZjPBcA7eaITEILB8vrV2IPErkYoV3Q/
 Pw+mB4zmzxQDW16+pBmKl+KNDxWif+gPwy0hVVkLjdnzXROTzVOcJ99
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: O3DnYhJwe4G5_ysGhUYS_1yg0Hbm3WCN
X-Proofpoint-ORIG-GUID: O3DnYhJwe4G5_ysGhUYS_1yg0Hbm3WCN
X-Authority-Analysis: v=2.4 cv=LtifC3dc c=1 sm=1 tr=0 ts=6911729a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=5q8hE9cQKCNJD2usWYQA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA0MSBTYWx0ZWRfXyjN2Lzkr0H2w
 4l1tFfHYQdIM2t+gMkFBZbMGU7FeiXCFLOjxb6p4uPZ7qf1yDUeYLbfF9jpNFNGFFbuYr1CYK36
 HBinIwkBiaEQ0j4p6iks1w7SY6Iz5Jpj5+ZuyaLUg4a9VDeVQNhMjWeqmai63bsco6DGUuHc4Yb
 NwacIIZM3u2us5L7rto/9ccm9+DEiPLlTl0ZJHqn19L4m+ZWkQcnaf/R/zahdB3AnHz2DFwSVi+
 +fN5NGoXQAiW0E8cnGENmAIiKtJjU3jnDiLB2HJ6TKFlmEXLBrrZQm+ZKy1avAABT5TnljElhqH
 1MiRcSPBfTNua0x9L5nQfXFTbrGaPGDUZbWBgG/D2p9rewed+MtU0eb66tl8QUBTkN7F+Actntu
 8s3/PbsoYKfc5uNrixKYi5KZ5C7HJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100041

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


