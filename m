Return-Path: <linux-arm-msm+bounces-84830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA36CB185E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 01:40:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E07330E47E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 00:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5271DF759;
	Wed, 10 Dec 2025 00:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EXzPPqt4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KmNMwnGp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F77F1C5D59
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 00:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765327184; cv=none; b=Bu9kKOqZeuzjaqRHflumOvoq6z/tTwUVpk1snjhnNUD0A4O7DBA3zeusyd5515HTQRT50Prv9dPt2Q+onu5+y7o2HCZKZGhp+is69A04QIabwvqtkizzb+t5MXA9GHvJDB5Llmr5vy+nQOIcvYTK+4Y3EcuUAJ/rRfvZ6o34jQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765327184; c=relaxed/simple;
	bh=LM5cLcvrL97GVflWOVSbpoD+zNNmsN4BqP7GlTU2puY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cFnpUwOmqUIyDrivGdDMb0HX4HGU1Wwc7PbxUT0yWa6DC8Dr/azqIbq8QkkCVxIqL0Vk3Eu8ngvmHhVPDTAEolanoOlVHqrJ+wvHSgzFu6vHW9ePMJB2+8eHOdXUzykNqtWcpvT962BzHI0ORkA5Gy7WFFbGl+Pr0/570lodB6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EXzPPqt4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KmNMwnGp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA0O3Wh1721499
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 00:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	15Q9ck6ovkYMJTPJoDc2Dx9iK+2vuB4WM6abfMTFsKQ=; b=EXzPPqt4GEdHpn1o
	gN+uhkW+29bO4yMNOntqni1iDNbqQ3Zf90zlUOItuCJuH3afeYQleVxyXKhBeRvK
	7DJI34TfeahEep0o2BlAECkspTgAohOgd8E3LQ8lxn58kb5YvZcZIPA6+DWLdlne
	sA0Xzg7V9WyDm8IeoEkt/aKBsS9dKnYEfnGwGyd5AtFv8mDzl0IcZEqz/mvy0BfI
	AsD+8k+QF5zGyciIzx2vBPJSx74p+mM7C0+AWgT4qEL1E3wmHp2jgr1CTmaMVegB
	jEr4wZu9ib1fX9hWfn3tJPzK6ICnw/ZXIpFpniBeJKng9fu7bNoj7efLzN3IJH57
	tNBtWg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axqu596p8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 00:39:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7aed9ebcd67so1066662b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 16:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765327180; x=1765931980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15Q9ck6ovkYMJTPJoDc2Dx9iK+2vuB4WM6abfMTFsKQ=;
        b=KmNMwnGpW6qzFuXGRiaDRRV4DJ73VRZ9aByc/ea+ud+spQaChxCH9axwyfxjxDGHMg
         x96HvGez1v8m2zwX2fYc2ViyodEiGwjX1NGkw8EZqs54nCy6M8n5IQ2K8ZDTfpU4tA0J
         +q5rYnEBtBcDCB/uq5kl13+xEEGXqlLso7G8s4LDW2wyYce7AMUDTl+fWf+niAHCP45q
         A+6KVRKhbvX0/ty4i52TD/xN4ojq1v1VCUJVnZwvmWIinJgIQgHnBC7n0Y25crUN9mIt
         zyI4LIkJpOGu/3SPJrfWc0sfWWavYACefZtZ1e9oinz/2zaMpC+DPmBDhhechJsnE4a/
         foBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765327180; x=1765931980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=15Q9ck6ovkYMJTPJoDc2Dx9iK+2vuB4WM6abfMTFsKQ=;
        b=QcoBPJwID4ppelhMJRXGrKhu5XrKwj/pZLXXMdR8ilHwnCGx9tf1t1K7tajyVYpnSt
         AVK+UgByVPN7m35QeqmHNacFLZ/hKeC7T1fHLI7e7YxlBWFYEfiY3ttprPH8cm9UGBWr
         7wEg66TuIz33pIDgF30RpDbsKBRevHET2wCZdusJ+BqiOtlmzVVFUmFcUABXg8iXSXig
         kh734yI4WJRJecDRJXai/qkzj/0ZEcG9uny/N7LNc82bQGnhsiBaswC6R0nnXVipIfQx
         mfunx5gp7Ou2VfoALWvBqVNc1k9uYIncaqEnruVANhKUSuOYMlZIONnt9F1qb4mTx0SG
         O5zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmxWf8VpfnDosF16ZfQ/WF2JBkYfn/oAsoICmrW8j2wzBl7+QU+Dh3G5tSlh1GVkOiIEeKfINZPTSM155z@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7G3INmXO4bvnhTwoVjFImImEHztEOAIkwfJ2+AcYY/46Ro7dQ
	EiXDV/8gLwiIaZXB20zIH7+AgqzEwnc8J6gQJ4VOt1C7X2pHafhnO8+nRy+YsMII0czpN6NwBJc
	uNvLsJgakQtJ/p2iWjvQJlpgVT/XbtvfflVG1246d8ZqrBoIUKduBM+hEoJ2/qM+JRPW/
X-Gm-Gg: AY/fxX7ywxBURARAxdK3daAXgYz4L/0QXmkf5JYOLigvE8BajuFC+YPnrxH3AyDNsVi
	wRNNE2cagpglda3nxcFjIODWo/uc/KZE6LCEUFLONxNZyhGDvtgWnEzG4tJMppppnus19eGAra6
	pGYld3D6b5DbO960VGYi0g5BhQnXFX1/lMf8jbAAv5AupE98GAVx1T5bGL3BYnJKoR+8e77vlbj
	OhDwwq4/M/uFI04jS7aHyLVsD4MU3lb0/bqpe4TKEDQDvRHwNSYW6sIb8O4CQd/MoA+icFFmrzN
	3VQv4hWa1ueNT8epVOIKSThpmYJpUwPtZohMwXGj5zvIuj5L6nn/76L7bv1aLoIboMHdrN3Qazo
	fYgjiy2U9CB7CS2N5BJURiA3uwv6xCznWWqdK36iZSI9D5TAXAkPfIYVmjmJnAN3iGvGxgQ==
X-Received: by 2002:a05:7300:fd18:b0:2ab:ca55:b76e with SMTP id 5a478bee46e88-2ac055ebd5dmr329975eec.9.1765327180145;
        Tue, 09 Dec 2025 16:39:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYFbzbHs+Cv0xPIKB3DK0EyWKH0o8MME4eKs/ZruNQOUZXKUnl7tmEavS54+IVCIT7u5a/Zw==
X-Received: by 2002:a05:7300:fd18:b0:2ab:ca55:b76e with SMTP id 5a478bee46e88-2ac055ebd5dmr329957eec.9.1765327179534;
        Tue, 09 Dec 2025 16:39:39 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba822b615sm46666784eec.0.2025.12.09.16.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 16:39:39 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 09 Dec 2025 16:39:34 -0800
Subject: [PATCH v9 1/5] media: uapi: videodev2: Add support for AV1
 stateful decoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-av1d_stateful_v3-v9-1-718e3b3934b1@oss.qualcomm.com>
References: <20251209-av1d_stateful_v3-v9-0-718e3b3934b1@oss.qualcomm.com>
In-Reply-To: <20251209-av1d_stateful_v3-v9-0-718e3b3934b1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765327177; l=2597;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=LM5cLcvrL97GVflWOVSbpoD+zNNmsN4BqP7GlTU2puY=;
 b=gwl3TbJGa4i46Mm6ZkDKnVBJY+wgF5KOZVI98IEcAaPTqAZpaPu3Wm3iMzWBn2uyjp3fgukGI
 OHZOjZiyhHZCPBjK7LbxbJmu9+7MoVBky/UCD/piCZve6BGlYQqVg+N
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: N3ufXIiwE9FqUptY09XNP-lxTStT1UJx
X-Authority-Analysis: v=2.4 cv=Y7/1cxeN c=1 sm=1 tr=0 ts=6938c14d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5q8hE9cQKCNJD2usWYQA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: N3ufXIiwE9FqUptY09XNP-lxTStT1UJx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAwMyBTYWx0ZWRfX3JZ1uhSZq4/F
 hkVDE0LzhFO2SZj+mgXFsO6vz7//XeW2Cezsd3MUVlVJ5JEMEUpkhrrzHRAxYZhjrxzw/kj35Ow
 m11SbGo9iWFhLmVARNDVtLgBwAnBuGAuSI0AKibDFqlJ/LWXf60vhVplTtGK/YY66TYto++AGxM
 f4bCFBfTHaHwKao6cV+m57oEjJmw+sNW2oL7ay2GVh3zyfun50UPzHe06h7HASCW7pAeWJTAQxt
 N/iC/oHeM1nJxViXkZp+xrCceiPMSZX5ftyr6PnZcna65WYfIUxgnITANW2jUoN5PThHMW2XvwH
 4tiJ/ue6BXuoFqZLSGrCyOtVFgIQJ++NVdXWaFlO9R0hRXrCDAJHVgArZE4mNT8KzXtWDYaTUp0
 I2FjmmlrvNHEizjfd+HvJieJJYJtxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100003

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


