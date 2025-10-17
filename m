Return-Path: <linux-arm-msm+bounces-77823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E91F8BEB41B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 20:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BA263AD74D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 18:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD2532ABEC;
	Fri, 17 Oct 2025 18:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MdFACgCJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B21231842
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 18:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760726520; cv=none; b=Ecu6yfjD584hJdYsrXsYIETyOkaFTJm4TbIqRw2OrZnURs4aoWZiHxnC9gc7OeREIehJRaG3c8uB/Gnym/qbtBK3VF/HZlwreRG4NjZJoGwSkb/524MzDYPBQRrYB15oJVgUu2jkTajnflVyk8hcIkABBORcqIrnwkzx41qTa78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760726520; c=relaxed/simple;
	bh=0hCN7qCXSLUAZXIjLrkyQ5Q9apLRdYKGIeQ8hEqHEvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D7MJSItO81JtWVxgtkG3yfK7TI42XTRW4MottvuhZKz5/GcUTjigwBLr99WoAYSFsEDyQU4Hu8gT8xro/z8Z34FoDxQsZzcGWqS0Z3e+Ts2gYGgszOgRfB0c7mOcRUskBjv9zIEWzu6G6SEcMZ3kF1Go+jE1p7OPp4bH+nQDwCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MdFACgCJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HIc4Qb024553
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 18:41:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K5dffV9vMTN48/Ti+Eh3Xd6lFyWq3KjwFHmjYc0NovU=; b=MdFACgCJjWVuvGZS
	QeDh2WcNStf5QQtGSxMxdm7zTRaxYS7JmFXP8Cefe5rhET/VQJGGUv53RaxaLdix
	JbGRTDUQ90gMVFQpKR8I7hreuWCNgqvS3y4g9ZUsnp3UFtCf22T2Cnss7+9szJ3k
	eXwz4LJVi1GsA92gwcHgHPHz5JMa2xUf//It/O3R5FMnK1U8yvTFsq8Z4Ncv113w
	ArlJ7gXeTK3+B9kYFAXZJ7PAf3zJkhj1o2s7m5cWQZSfB6B6WgVJccwiTnht8H1x
	LvEdCB47fFBn4z1Ne+vWB3+MI/NsRot+D4uTm4epYcLrpwu96kLx4LBZ8T8MgXIV
	iQyUJA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0cd6wh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 18:41:57 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-3c97e873c82so558811fac.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 11:41:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760726517; x=1761331317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K5dffV9vMTN48/Ti+Eh3Xd6lFyWq3KjwFHmjYc0NovU=;
        b=Z0/hnkYVzF9EurjxIpyvktdU6+zWYT1RO6e2jXubqEYpBmzp0v+17P2C27OrVH59OR
         A6NuxAA800978EEYLJhQLQCS9X0N7FVlgOsSoLQ4kaWXZQXCCXckwzgBM8hTM+FpepZF
         w0gZshgraLaw7NQUU8hfnIgP1VpkB3TYV93sN+yjv8NCcaJ9ZsWL1SWiAsrOQPQCsAjR
         6pDKQ/qPgAlraLIi3byU5zlOgycTMN3Nz/i3bU59BLFulkM+NWNB7xacfrqYsNI2x30V
         zPBOnDvT+ZztxsN5RcadXCneQw9WAlVVzkHb8YrT6xMqr9V3VuC/BMJ/e7hFtDugRahT
         T+RA==
X-Forwarded-Encrypted: i=1; AJvYcCV1vqzaksU0ZQWPqYSc5vvhw3qNLo83dYrtwCuCkShNBYL2a9hXirlT45Xr7TB1kzPLxR01kI0BaG4tynI3@vger.kernel.org
X-Gm-Message-State: AOJu0YygBfMBvvcluPXEArTiuY9b9NmuIqi/yyBK29G5oknEIQkaT5M1
	VYoCbsEbZy6JJ2cQR/6S/tzGRhzhOo02Yl+DNz19p3xRP4MBJ96+PCw0fj9sjYtCUA8ko/qqxx9
	2S48iapQaoVL/NpUCf4lI2w4vNaWpIlkpibfBpI8sdb1SW3IBfsUF8m0T8GV9MNTHVfP7
X-Gm-Gg: ASbGnctoAhYdlJ9k3LpA4giSHe+T0zk132g52OVb8etoZkhCEyBndAdIcRBRKcltj2y
	xoRogWNfthNxnMQ6xjoJ+1jHEbNsTEJ8O0XpVU3Rv8VyynDOG6pXYinAOUdfLzU2Jp0p0wxPHCC
	e7PbVul/RKwbYRTxytfzXXsndv+FLGyxpyqS8XSNgQmVSQ14AyLqrjhTW4cRqKK9cJZpu0/SQLc
	3l9G70cIqihj/8NLhneUqF9WF71AetRRPJb3MfiD13cyWYR6QhMrXwldjzg46dqkzDoGMXyMLVK
	QEMAGK3kBEJ1BCMx0WrLTfDyDt7mFjMfrMjmkL0HYib1BXmpnX1sMiOhg3xPs9LVcW6KvU1oClw
	Dt6XezmlQxkHGfNEcZSoY/Dail2mXRNXFBECqD126v2PwaTk+D7feFjPY/5U=
X-Received: by 2002:a05:6a21:32a0:b0:334:8d22:f95d with SMTP id adf61e73a8af0-334a853656fmr3755219637.2.1760726126649;
        Fri, 17 Oct 2025 11:35:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmm9s2Z9CdP5xpjHJUp8p4fYTpy+mkia0Il4jJ8DvJs8HvC0urRpa3rj4KvgvAv1rY/sYxCQ==
X-Received: by 2002:a05:6a21:32a0:b0:334:8d22:f95d with SMTP id adf61e73a8af0-334a853656fmr3755198637.2.1760726126104;
        Fri, 17 Oct 2025 11:35:26 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f24fasm245487b3a.42.2025.10.17.11.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 11:35:25 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 11:35:15 -0700
Subject: [PATCH v2 1/5] media: uapi: videodev2: Add support for AV1
 stateful decoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-av1_irisdecoder-v2-1-964a5478139e@oss.qualcomm.com>
References: <20251017-av1_irisdecoder-v2-0-964a5478139e@oss.qualcomm.com>
In-Reply-To: <20251017-av1_irisdecoder-v2-0-964a5478139e@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760726124; l=2423;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=0hCN7qCXSLUAZXIjLrkyQ5Q9apLRdYKGIeQ8hEqHEvA=;
 b=RGUIsMsESqBt6hXY0FtwCgHQ3CTacRhs+L+y0gnVmPeLhBqSoeivguFT8nRn9HVtwghv0nqUv
 qy4LpmxRUlqAQf8W0eYj+Od9Nf31cocgjG9o80jfH6I+NCqMwt91laD
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: CH2O76FOomK0UimV9PNVjaaZbhsMeiD7
X-Proofpoint-ORIG-GUID: CH2O76FOomK0UimV9PNVjaaZbhsMeiD7
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68f28df6 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=5q8hE9cQKCNJD2usWYQA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfXzwQnUOncqy49
 nHUMxx3v9zumVu4vjJyhdXHrN3sx2JN6wXlnVihc3j80hLVXz0Byr7At+/DfSV5HRsGXjBqgiXP
 o1K9N2abpwwrphAXkl0QESeUr6Vz7s4M9CzEevzIh95RPVi0NmrjVRd5kqhwO9iMN7g76erYTyW
 BMY2BmJ2NhJuBCAfqOwgLWyL/zlrG/jmL84OEQ+5jVWIwhk7maOyOk6j9Lhfv3D7YJQNVRuWUxt
 MZyrMcM0pxZhgMDxypvkzI51kWPL6sCGbn03D03KQbsbRd6xUmzwMrPE0WbGkgYBYyLi/hIBfke
 2t7g1qQUKrQAKjg0lubaao67q54ZiHtgnj8Y0Iqp15Roip7mxdUfmir2tIZeoK16ZnmCZURcute
 Tf8glnB+X04Sew+IfoaAvQHd+OhC0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

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
index 806ed73ac474ce0e6df00f902850db9fd0db240e..d82557a6ac30851b4fd432a5ceab969abaed2e25 100644
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
+        pipeline. The decoder implements stateful video decoder and expects one
+        Temporal Unit per buffer from OBU-stream or AnnexB.
+        The encoder generates one Temporal Unit per buffer.
 .. raw:: latex
 
     \normalsize
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index becd08fdbddb857f8f2bf205d2164dc6e20e80b2..e03cfe0a5ae830595f0bf69b951ca16beaedab72 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -775,6 +775,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
 #define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC parsed slices */
 #define V4L2_PIX_FMT_AV1_FRAME v4l2_fourcc('A', 'V', '1', 'F') /* AV1 parsed frame */
+#define V4L2_PIX_FMT_AV1      v4l2_fourcc('A', 'V', '1', '0') /* AV1 */
 #define V4L2_PIX_FMT_SPK      v4l2_fourcc('S', 'P', 'K', '0') /* Sorenson Spark */
 #define V4L2_PIX_FMT_RV30     v4l2_fourcc('R', 'V', '3', '0') /* RealVideo 8 */
 #define V4L2_PIX_FMT_RV40     v4l2_fourcc('R', 'V', '4', '0') /* RealVideo 9 & 10 */

-- 
2.34.1


