Return-Path: <linux-arm-msm+bounces-75706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A54BB18B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 21:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84C2819C0E24
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 19:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CDAC2D8781;
	Wed,  1 Oct 2025 19:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dITpJMdS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCA727CCF2
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 19:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759345220; cv=none; b=avi5GqlHYe5yL3xvaWQ3GLPb9LjEtF1IW30rWpxEsd5kF34OWkoDId8HI/IT6ftrsytq0BwP5lIVAr2RyFCXmv0qbkrshVAjKavibYbajSo7MiLxYIopZJ1PozNpfGsbKaLOC9/YsP40180azpA9azZ7usC+ry0aynoDTY1KH30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759345220; c=relaxed/simple;
	bh=/rm1Y/tRBwPrsxYpaC+lx0uQgFufvlrB5k6kOnop6/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cvdTqe9enz+ogreN4LFNlIxzg3t9jQjdjSx/G1ur2OBeYqgQAQU0o8fIdw6/h7OWedwwE5ZhCQLZi/qCk8Eu7V0hgWjqU7Eo1OeTFPc3GcZp1gWVvvqgoKVH/cbLk6IqEpXlnO2fBEJrY316vN42HAAoOkfYXF1YWl5oYlmoPOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dITpJMdS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IbtMD023327
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 19:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UOM6pErh4JXh+pgCFCh1VyiU3BioiWvX5lWpX48wx/M=; b=dITpJMdSXPG1KLvF
	q8Aq2T4ihnWDcO2QZN7Pv+lDrEqr64Wr/kK0fPhXn7FqgLRSt5ToxbkNIxkm0xO0
	jBu0Nw2QwJ5htDTZR0eFHwG0mQsxrYxSDacMqv0P9EzWTdb4WG8g9NnMMXdfxQrk
	Gl1UJ4ySBSYcufajwu87fzFgKxDa3S1ppbmnZE5FnrrfGJO0bXFYVbSE0tCoJA4z
	E6WLIBFTCdS+MkzQbOCwBBtzOUSYs1rHe4bIokDt11NDd2oa8kJ2PE8VZyAmwOk/
	+nR8a2wxS4CTImQYIKc3jv6IvDM1JJgr3Bc4Yt/lQ0hHa6b3BfYqWfx30Ud7wl6g
	f3jMEg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a65n4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 19:00:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32ed9dbba55so58176a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 12:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759345212; x=1759950012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UOM6pErh4JXh+pgCFCh1VyiU3BioiWvX5lWpX48wx/M=;
        b=YSO8fPVR9gvI4W3RF3v0z0uaHN276TNZSjdoIUpBNEsPM0h/YQxOOkl/TaLUKX7PD3
         5QdUxL3ZZY/xsFYQkZapoCB67ZeGqn1h8M6KOfD2zf98Zbzgh5MN3AwKQsRg9q6PdLT+
         BO+aUSe4z9XIjgkItFa0DETVpM9cN2CVVuLfhE47eeVLRUu6ok02bPttZ1qUtJAJahCB
         cj+7o2XfrS4TEmM0mI4krSINXnQHX7/qT/tfie+it3xV1LKT+h5rJOQw59JvawJ6hQYl
         shwBuIHOFbKXcjaLhp3N5dxFfQJpAdBtsng2ZJy1/J9HP7/0dZ2I+RXOPhe1lPRXFLIm
         r6gg==
X-Forwarded-Encrypted: i=1; AJvYcCWR7nWwmeZpv4NZufXKVHwI1CPrdtEcksl1r2TRHWpuAIc9silXfg5qoKgdp9bWIKpPcpY1GhIgXuO76tza@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb6Rz80j8JYJGydx/LjNMNp707lWdCoV5fu0PMy68ftsFPap4g
	On063Gbm3z3T65py04JOGcSn7e0hBWWgA5GZtzgKwh1pjgIFD2kPFXp6tbi2apeD4JByzM1aeTC
	5ks9VQ97KJzzQPvQX0oq6CPOqOHVrXFzp5UIqzbRU6Mi4va8+O1uM2tlwGHE3BZnMoBDD
X-Gm-Gg: ASbGncuHcxPBzwPdedfY4VPNIhyrwEW5I+fYhrqymFcR/3vWTOPtL0vr/RyPm+kUdSK
	9nBkN/ZcZWZqimBXCbiM5RpytRZ4cpFQdIoGkaDnJ0kmVrIOIJ56faA//Z8hO7uhLqg6N1P+kYt
	8V0RD0Egk5llecAo+10EvVAS28t0qo/8aPP463QQK0SLBIzxLK27x0hgk4zI3FRjcSUBDvbqIU6
	SRwMKy0fjlQSAzeDfqER+aKUG1dZRHrbH9IqSTL6zjP1DX0P9VndIO3dmyUmc72VZ1CFxwmCIl3
	kmAGUhEE745B4sBCAzSVNabVxJDDcv9DlzTSJ5jZ9Jm6FejSeY+EYjWRGlm6LDMUNxUjigRem5m
	mf9/C3ez4wGk6SMDPT/PAzLM0su3JVg==
X-Received: by 2002:a17:90b:224c:b0:32e:74b6:4ef9 with SMTP id 98e67ed59e1d1-339a6d425ffmr2697917a91.0.1759345211627;
        Wed, 01 Oct 2025 12:00:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOya6qECNpJ/6SMsAf6t/f1E24fDwdtbmQv0sCvjkybfOLZCjjsyzeop/XkBa+HD2orVE21w==
X-Received: by 2002:a17:90b:224c:b0:32e:74b6:4ef9 with SMTP id 98e67ed59e1d1-339a6d425ffmr2697884a91.0.1759345211040;
        Wed, 01 Oct 2025 12:00:11 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a701cbffsm2950074a91.21.2025.10.01.12.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 12:00:10 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Wed, 01 Oct 2025 12:00:04 -0700
Subject: [PATCH 1/5] media: uapi: videodev2: Add support for AV1 stateful
 decoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251001-av1_irisdecoder-v1-1-9fb08f3b96a0@oss.qualcomm.com>
References: <20251001-av1_irisdecoder-v1-0-9fb08f3b96a0@oss.qualcomm.com>
In-Reply-To: <20251001-av1_irisdecoder-v1-0-9fb08f3b96a0@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759345209; l=2422;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=/rm1Y/tRBwPrsxYpaC+lx0uQgFufvlrB5k6kOnop6/c=;
 b=FwUQJyOxBbml7pw9V/Ys5GVnoZdTtkEyEOGQk0Uuq8AhzLh7ZnUQ5p4zFEGKUJILkfwMAb4Lm
 bPdsvL/RRqFBI5PUHQph+15o9hqW8aKW9BXY7qK3FLFXygM3XQpCLrx
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68dd7a41 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=5q8hE9cQKCNJD2usWYQA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: A1sUEGapJymAoXJjwNGDaehUV-f4VqqV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfX83WG70js1Pg6
 ZkORJgi4fNs1aWGxnwgUHIQAmXw7wqC+tdC1JH8fP21HDL2YiAIXZIYRZ4zI6DoeSYKpYfrVFP7
 NSXuvQ7ABqXBcM9rARgPuNyx3nvERc2BUgV254skxyTmNYAp/lXTjR8c8B7aKjSe3+lTLHHxMIj
 HsbazlKCqQqiPA2O29UPwnuG7MyvN0ITbhf45rSPFDn8FtOP3n40qWnH/ojDJ8VigWbHukBVO7c
 rTIp8eHg3zbNRnG1BM/7MSnd1TTymSrWDqaObRpiQsWcEQwKvdbf9zGz2MUY6aTX2xrN/8v3uac
 IQSdhIWz0d9Lz387F32uIX+yUHIHPrn6/aIaNt5N6dQB/y6QlrsHXXPIMdie3ODNiMlu1KPFs1V
 vX7Ornq2kt56GIisV0Ss5hMetC+8WA==
X-Proofpoint-ORIG-GUID: A1sUEGapJymAoXJjwNGDaehUV-f4VqqV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_05,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033

Introduce a new pixel format, V4L2_PIX_FMT_AV1, to the
Video4Linux2(V4L2) API. This format is intended for AV1
bitstreams in stateful decoding/encoding workflows.
The fourcc code 'AV10' is used to distinguish
this format from the existing V4L2_PIX_FMT_AV1_FRAME,
which is used for stateless AV1 decoder implementation.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 Documentation/userspace-api/media/v4l/pixfmt-compressed.rst | 8 ++++++++
 include/uapi/linux/videodev2.h                              | 1 +
 2 files changed, 9 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
index 806ed73ac474ce0e6df00f902850db9fd0db240e..043ec57d7d48a36005f2a0121a5bc7b733d06590 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
@@ -274,6 +274,14 @@ Compressed Formats
         of macroblocks to decode a full corresponding frame to the matching
         capture buffer.
 
+    * .. _V4L2-PIX-FMT-AV1:
+
+      - ``V4L2_PIX_FMT_AV1``
+      - 'AV10'
+      - AV1 compressed video frame. This format is adapted for implementing AV1
+        pipeline as stateful video decoder. The decoder expects one Temporal
+        Unit per buffer from OBU-stream or AnnexB.
+        The encoder generates one Temporal Unit per buffer.
 .. raw:: latex
 
     \normalsize
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index becd08fdbddb857f8f2bf205d2164dc6e20e80b2..4c07ad6afd45d6a56d19d65fd25f091d81725823 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -775,6 +775,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
 #define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC parsed slices */
 #define V4L2_PIX_FMT_AV1_FRAME v4l2_fourcc('A', 'V', '1', 'F') /* AV1 parsed frame */
+#define V4L2_PIX_FMT_AV1      v4l2_fourcc('A', 'V', '1', '0') /* AV1 (stateful) */
 #define V4L2_PIX_FMT_SPK      v4l2_fourcc('S', 'P', 'K', '0') /* Sorenson Spark */
 #define V4L2_PIX_FMT_RV30     v4l2_fourcc('R', 'V', '3', '0') /* RealVideo 8 */
 #define V4L2_PIX_FMT_RV40     v4l2_fourcc('R', 'V', '4', '0') /* RealVideo 9 & 10 */

-- 
2.34.1


