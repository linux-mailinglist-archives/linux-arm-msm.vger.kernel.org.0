Return-Path: <linux-arm-msm+bounces-84130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAEFC9D4A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 00:10:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E7C1B4E633F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 23:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9AF327C11;
	Tue,  2 Dec 2025 23:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IWfrCN7i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dOyuTDG9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1122326D79
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 23:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764716635; cv=none; b=FM76Bmjhn+pTwBrpBzOSKDP9zzUZWj2ovRmWpccUGRgj012XiyRQByrOXUyblYSWnVl8QzUBc0kJtjJbqlErNTT3xxeS1Q8prGreKu0tDxZiJh1S5CP5koWCsJRXjIsNf4hWeg8rr6m9nwrMGn61lfuddUpoqwwdce8kd0aza98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764716635; c=relaxed/simple;
	bh=LM5cLcvrL97GVflWOVSbpoD+zNNmsN4BqP7GlTU2puY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OajtLyRSxvAj+vRxq2tD4Qo6Y5ocQl2fHO8BuDjFnLIR/lauNpvPHTJO7Hu1ziHBPqKjUvcuu5lCSqc6bU+R1kqn1x2pwSxE6q3mSO5F35X4c8+HBwXsRFAWQHsgDVAyNjGpRMtLW3IddZb9KUCW89iMkTSi6J3F+Ii3tW5LUFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IWfrCN7i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dOyuTDG9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2GXcoi3714898
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 23:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	15Q9ck6ovkYMJTPJoDc2Dx9iK+2vuB4WM6abfMTFsKQ=; b=IWfrCN7ixDKeAOV3
	1kxZXdq1+vw4Jv7+xJiqsrKPoXHsDbZlEXu3K2mRTvZBT24AT2jFCzjLTGFVLvz+
	x/vnEG4/XxAckaX5jRmhfc7JTivr+FxWPGcsa+mKGpKz2fTvVLj5XsdgogDHmevh
	eDJGEiD2fxFNHI73/X65gQPtcIxez4W4/CmJdYyfZZqGHW7kJLKtq7C8HV2Vs2D7
	U8P9x5E2gm3RT7v07WNgiTGsR/AMtX2qNzLpuKcdTY+2yrHtf6VgFerI11xqh3xC
	0MxBrJxrSuDQQRT75jMJ8Y7DvflWuI92wv7KiWbTyxqoAE1Gigvjsx67zlptYe4U
	pT/tHA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at3r2121j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 23:03:52 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-bc7a9935ae6so154618a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 15:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764716632; x=1765321432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15Q9ck6ovkYMJTPJoDc2Dx9iK+2vuB4WM6abfMTFsKQ=;
        b=dOyuTDG9/tN3yfxevIJi4TW2xLd1mPttn27DDDtIBDGFp3TYJU7fAPK5aUIcwSdypX
         qwF4PglMAEZaPEG4Eyw1PhAGAgwnG3XWF3v6nviL6nP0mH4+dkDwm9hxxf/cPqyNH+uq
         FTCVen8GJ6MrBp00HBnvcB61fFsMrGaz/xwVfdJlwJwGH/jTyI2rtwcSp437hYPGDFrs
         1c6maOOkSppFHHTTTs3BGfBeGTjN3kip0EFFCpw4gwmBO2PvP8mgqG1AmtfSAdhy0WJH
         1A45YXCPrIU6VOpSh/+2g74kuc799YEvoFd5FfwUExIvwtu7xNGNxbKbD7TsM/Cfsura
         q78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764716632; x=1765321432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=15Q9ck6ovkYMJTPJoDc2Dx9iK+2vuB4WM6abfMTFsKQ=;
        b=o69PUpDqSHaHY0hpplGyaCoyIfEk4y5xZ0/3uRdUvXDwtQNwtZ8D5EITm6FdqliHJC
         zObhNu6KB7txXpmu0tTt6FlQfE79A1NUIb27ABRIpJhqXci1X6Ox8XwBnOkmwi19r9h+
         vqJKbV7Lcet0BIMiohrzArZlDjuT/ZBHg0svHfyOFig+V9OGyXZ1Vqsniy8KyqyYDTn3
         PqFUV/x5xbEA+TydS/e42cg0+/8Xkn6Rqlt3BPkkqMep4hjy6bGjR1eUQh84/A6HawfP
         nAIRW7okuV6QyQ2DQeI/yLG5LC56BVYGwlI47EgTRhRGLO/AVQKP4ct9M5XJ7FlOMZ0S
         /h5g==
X-Forwarded-Encrypted: i=1; AJvYcCXaExfbCBlYPE0YnptEgaYERxuaVq4NDGhhZ5Kud+iboDWlN74606UBMesd46Kyl0ZB3R9/tYiP58HRzHii@vger.kernel.org
X-Gm-Message-State: AOJu0YywJypAhTTsaed6r8I1Gc3du4pjvCvMn4cXho5a5Z18y26TRQ8+
	b1q4JtKklUxzCqv4mjPYr23YKoMFWQ29cMR+uYFaqcZqNbsRzamJJe8W5F+ZWUyo03o5bJPDyKs
	1MQiL1WE7AXEUJDEoE3UYU4HGoqxu47/bFeC8XLScMU1NKZ10kObLUjlGZ7B9oob4DVR4
X-Gm-Gg: ASbGncvamJfDkKDyQTDS0ZfoM6NryvlBlVwFZ/flE4usnK4G3mWnxEKL5MkEdNpX40X
	LhfOs6sXXp7OrTk2WOSz8TZobIGvwByo4L9mD43X56SLnXCQQXpAHNgdaxvFDrpMLfM0RNQUA1N
	VP3DgaFe6duRz9A0iZkISbK15KJKuUCtLplyklO3JVRH1sNOR8jQH636qSVm02ZDol+CcPj3mkr
	n8i2HZ+TZEJOVGzS6VM1j3CpO+msMalDSnCGiCVdu9puIYPn2GtHFFt5P2YixY5+zkvpC0ly1Dw
	0/pjO7+phR5s5BpnBHzupATGa/Y56qm8q1HgJVmYTIwb+zucoM9isxqjbJIjC/fgyCIctm7jxVY
	ZBRM0Py3tNX0kuniFcY/BXLRzrCbkQv6q5Bt43Pk8nDRl0Kp/C7SaQ2iHix+OgV2KF8Iw7g==
X-Received: by 2002:a05:7300:ad08:b0:2a4:3592:8624 with SMTP id 5a478bee46e88-2ab92e230b3mr182093eec.2.1764716632037;
        Tue, 02 Dec 2025 15:03:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6UOXCH+XKa7SI/WBt4c/5dAn0X7e3OjuS7CW37qUQxEYYs974JvbEpcKs/mnaCNylTAUMsw==
X-Received: by 2002:a05:7300:ad08:b0:2a4:3592:8624 with SMTP id 5a478bee46e88-2ab92e230b3mr182065eec.2.1764716631395;
        Tue, 02 Dec 2025 15:03:51 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a965ae9d06sm59214149eec.4.2025.12.02.15.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 15:03:51 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 02 Dec 2025 15:03:42 -0800
Subject: [PATCH v8 1/5] media: uapi: videodev2: Add support for AV1
 stateful decoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-av1d_stateful_v3-v8-1-2f74a81773b4@oss.qualcomm.com>
References: <20251202-av1d_stateful_v3-v8-0-2f74a81773b4@oss.qualcomm.com>
In-Reply-To: <20251202-av1d_stateful_v3-v8-0-2f74a81773b4@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764716630; l=2597;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=LM5cLcvrL97GVflWOVSbpoD+zNNmsN4BqP7GlTU2puY=;
 b=mfGLNxNno/UKDn6zsDFlYdadUi9+6hmIS9Ztyuf1DkzPX+f+1EF1apBdWaXqJO0BpQ9N001uG
 g12dfcZtoKeA3+YQGHo7PdJtgOJci4jx8CADYbb4TE6rZzSt5uWhRr7
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-ORIG-GUID: cbW4U1pQd-PUChaQw6tJmf5FOsbykmXL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDE4MiBTYWx0ZWRfX9x/sQw5hP1xP
 FZs8l0w51V/3uh2hKivJXVuk/9b2s1ZnIq+xagSydNlcUu1pNjyAjNWPm8j71vMT2NMObrtYg30
 /naE4qMoNZ/hsM9MGeFBp7YGE9JXRaOtn1fWbyI2CLRAApNUR6XZDoZWmiZDzTYD1R/zE1cWDoD
 uktq6rUH5oPy01/viMSZjSdzMDXy74/04IoBXJeD6PNrhoecY3MkdxKo4wwGr7UeKzSKqmhiOq+
 XFK66JVpujDqxoXvGaOEpdM3iz1PzABBuWNX6G87OFLzMJ1ZivC/ZSZGMgkoU/U/Hl2crP8Sudl
 jgbYAohWDXVuTaAM64TCspXss96eDKJg8iW9cekD8FQHsu712ZuB8mRNjK60IBwmFon5VxvKHiM
 Jlu8VM7b7ZoMNe+NrXkBsNC3VDugPQ==
X-Proofpoint-GUID: cbW4U1pQd-PUChaQw6tJmf5FOsbykmXL
X-Authority-Analysis: v=2.4 cv=c+WmgB9l c=1 sm=1 tr=0 ts=692f7058 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5q8hE9cQKCNJD2usWYQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020182

Introduce a new pixel format, V4L2_PIX_FMT_AV1, to the
Video4Linux2(V4L2) API. This format is intended for AV1
bitstreams in stateful decoding/encoding workflows.
The fourcc code 'AV10' is used to distinguish
this format from the existing V4L2_PIX_FMT_AV1_FRAME,
which is used for stateless AV1 decoder implementation.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 Documentation/userspace-api/media/v4l/pixfmt-compressed.rst | 8 ++++++++
 include/uapi/linux/videodev2.h                              | 1 +
 2 files changed, 9 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
index c7efb0465db6480fe35be8557728c196e0e530f4..235f955d3cd5cfc83b0d3d424e6625b14c07266c 100644
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
+        temporal unit per buffer in OBU stream format.
+        The encoder generates one Temporal Unit per buffer.
 .. raw:: latex
 
     \normalsize
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index add08188f06890182a5c399a223c1ab0a546cae1..848e86617d5c87d76f15663403c2f3f0e709073b 100644
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


