Return-Path: <linux-arm-msm+bounces-72158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 500C9B44AE7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 02:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B1E53AF857
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 00:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3CE61E22E9;
	Fri,  5 Sep 2025 00:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UAlKFWoy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6636D1DE4C9
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 00:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757032740; cv=none; b=jPbLprfehDMH9SnVQoMpryX9L1xqK9LioeT3JNaQ4dEDgkB9BU4f1lsOPQdADWj6bZSRwyRyOENPeTlWE1lz3ufk1MVNtepjsvlXGxijOHBX7++8utghQ+gg43kXkJvJ9ry0biN4bW2pVuvMikmyC8eWAiooJwmcrCpZHqYiJyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757032740; c=relaxed/simple;
	bh=T764qGaUs1J9VFKtvepXHsiXpOOMX042xzB4mztK948=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oWJ2iai+fwaUDv2Komofa+rru8f/Gf7hnsqMLrldXkxBBjjgvn6Y7q91+CnSoCDFRlncoI0R5zP6BJqBfHc/FNOAsdNOnUnXt7mnFbem7zx+oDz7WhFSt7sUJMN/9hvNC+SpVv6PNF7LlnspiHgza8tOPwAWsPT17lvmMNinnPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UAlKFWoy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IQqoJ012122
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 00:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9brpOFp+/3/6vV4g7EI38M1O3ti6c1WPwrR8J+VQwpE=; b=UAlKFWoyVvB7CyPE
	Nlvg0Sg+fFeWVIeDfuo+4jbax5cJ7h8ZXtsS3+dHpihKgxWC93cU3ND5N663+4pI
	xdqefPyl9lJDAWc+uSxHWmBBhHMfYe0INp37Wt+QagDegVmYi/KkQeRwB04Ol3a/
	Yv0BIZy3oyEa+obXQ3SNSaQgqkN4kilIOcNjd75iZKUb+YTJT2JSBYSU3p2uW84o
	1dZnAct7+Mg8vV8UXXzgFTRJX1IplwEE1lbnK+pPfrOWnrCeWWz9M51MoQ2XTpJb
	iiDYbUSO12O066hWaa1Zap4o5GhR5AFpvXjbMkSXWhxCUiRR8VXnxjwu9faJG1MV
	kv1kHg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj5pyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 00:38:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-71ff3e1256cso30371776d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 17:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757032737; x=1757637537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9brpOFp+/3/6vV4g7EI38M1O3ti6c1WPwrR8J+VQwpE=;
        b=DZ/gMgVZomsuiE+LlOoFieHaLeODi+cVeJypwjZA6Ajrd5WdKJbnrMbAOARMN61rZX
         /MAPyuZZwidg5PyDZLEsV+NdZFwtV/M6PWM0zO2fLiMIoU5yw+M4mPfenRdGbRvi/2lf
         jw+aTsHEbIkqOjE42ykyz4qdPxTYJhMKIvgJtiEMgXJBFXxDy4EmQf1B+UbQ1gxNLb82
         rrV8Fr9wS1dbBE6FFcCKuMjvFTEPPcQp38Fjsehl9NhcTeRE1KUacYrcbK87/quBwATA
         dJcZtwN7PQubYEPQVQ+ORVj1XUvrm2G/YmKnp7mgNYUm4dGDy9pkw9N4GU1EzXblpR9J
         s/+Q==
X-Gm-Message-State: AOJu0YyayFFQ3DQ1lCh6aI0bx3bp6UZ3ikQFRu+BL6jV9JL0sfLx6HL7
	l/NoZxKXqnhqrHlCRhJrNIWR0o0Mqv8MHVv8QUDq8SRiAFjulldDdg7KvrlBoPTJPPoSddSzSpe
	55SJxVcDRY1VQ6FcgR7uZiM8wrQHh0KwFuvvq33JcAZlMlYbXanMK6nnF3cgqd+8WEBzd
X-Gm-Gg: ASbGncuQDw0IsM+T+FR4us6S8PIz/gk/iKOFy7AfaxRArkv13rS6Q6zqLtgDuDfRGaB
	HKygMMOobsDdUNhIUPUnjXuWgFdCRExwh9oIMdTXXl1DDeJmTY9ho2PXN0l1M4tx8gJEvk0gxHU
	c5QDMrEzhOmrYvJY87u8nxSr+Z7K2g0WbvOdTSllL3cjKBz0sMRKRX4/0dBKguPojJT85vCDBy0
	AoFDKc+jGMTczEGIxqyXhKHpBvfpd+t8aBU8yXkpAj4toFauwlr5XBz329jKcpXdeBoptsAG5cL
	zjbDbdZ1tkvnCvpukEvCo5BVwbO+TKAsd/4Ve+Nwjt20EidY8VEyDtdzYDfQX1FXSgn0ODdyKLY
	wV5vhxtrH0l/jpu1YEyY9bjjaYCkaQ6vPaLPs0n37CGYPxQyUBM50
X-Received: by 2002:a05:6214:2469:b0:72c:cc04:c3a4 with SMTP id 6a1803df08f44-72ccc04c455mr9697076d6.8.1757032737082;
        Thu, 04 Sep 2025 17:38:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGggptVB7yJzNpKmjyKL+r1E5aqNrdPD/lf2zm9l0aUlD3mzu8IDaTE/VSOjY55ioVtIEDZgQ==
X-Received: by 2002:a05:6214:2469:b0:72c:cc04:c3a4 with SMTP id 6a1803df08f44-72ccc04c455mr9696816d6.8.1757032736562;
        Thu, 04 Sep 2025 17:38:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfd938sm1510059e87.109.2025.09.04.17.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 17:38:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 05 Sep 2025 03:38:36 +0300
Subject: [PATCH v2 07/12] drm/msm/disp: pull in common tiled YUV format
 parameters
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-dpu-formats-v2-7-7a674028c048@oss.qualcomm.com>
References: <20250905-dpu-formats-v2-0-7a674028c048@oss.qualcomm.com>
In-Reply-To: <20250905-dpu-formats-v2-0-7a674028c048@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3220;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=T764qGaUs1J9VFKtvepXHsiXpOOMX042xzB4mztK948=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoujEKmhozhM/+m0ojp5V0LfFbrvFkofA6W7eN2
 zog3jTw8leJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLoxCgAKCRCLPIo+Aiko
 1WBWCACkbqlPExGRCdiT0UZihOTCLMIN0u56fVd4JKEr4W83H1+sgCf0pawMxOGZCTHPFT5hvxM
 FujC3WWVbcsz1hnM2oRWtPtya6sCIPWKRskqGvJDUsGEa9mW4SP23z9y2AXAk5CgHNcFH9lu7g0
 IeaSCENfkEevQlYsG+m++UAQF+YBbwAI9gEmh2lcqlJG6LFBrkZQz6wPG4Ew9gynLcX5Gl7iSGg
 fQVzC2kJNG94q4D0gQV3mwBX1eqbvgxkfiqY9Ww+ao6uTJBM1ZBucWHIsfj/Ad3oe0m9FbpDFYD
 YIQo8lZLTi8QTq24/iy09Ml0oFMwtxweD1VrgixjGOcT8icP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfXzA6BdLPG3nTx
 d/mpDIOpqZs3mExOuE+Yp81ijStcEPM1nVmLemmDWq8hP4RlmPpzFO/Inl38G4vhM6vkAMOqPb7
 WJeSyl4ZWnnklt05NRSbjpRBvNcoiEKutOEVW/GVoK7Pemvb2ZRxrYzYGQHP4LU1ixbLnGYAszx
 Z760VPgA7e5Wyi3cb08c2XQ9K5Z+xHBu6zjV938k46PeaeE5hICqwyW7pXIk1AO1LQoGsLTc88e
 HpEJMYqwdTRtKaX0/A7i/32V5ywYlY/J8CLSYFQ5E2VmD0UIYo5VfDelCd97HcxQ563fJJ0Hgo8
 Pw5RHBPSDEPTu38OU7q5tMzmQgrmQbzZ5uNv7fQ1xeWK2cnDy2rrewFDrdHVyfoz43tWZ0bMbgh
 EDChCWD8
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68ba3122 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=FCw1dLDEiFPyt24oSuoA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: kLB3I9rvwoBAK7-D7rSXfMX6vJ99Xvgc
X-Proofpoint-ORIG-GUID: kLB3I9rvwoBAK7-D7rSXfMX6vJ99Xvgc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117

Pull common params of tiled YUV formats into corresponding macro
definitions, simplifying format table.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 900b2de252a6eb2eac3d0670f1aaa77f7520fd77..79f7f973dbf348acf2c06e66afedeb8f22e7a8ca 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -284,8 +284,7 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
-#define PSEUDO_YUV_FMT_TILED(fmt, a, r, g, b, e0, e1, chroma,             \
-flg, fm, np, th)                                                          \
+#define PSEUDO_YUV_FMT_TILED(fmt, r, g, b, e0, e1, chroma, flg, th)       \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
@@ -294,13 +293,14 @@ flg, fm, np, th)                                                          \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
 	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
+	.bpc_a = 0,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
+	.fetch_mode = MDP_FETCH_UBWC,                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_COMPRESSED | flg,                        \
+	.num_planes = 4,                                                  \
 	.tile_height = th                                                 \
 }
 
@@ -623,19 +623,16 @@ static const struct msm_format mdp_formats_ubwc[] = {
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
 	PSEUDO_YUV_FMT_TILED(NV12,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, MSM_FORMAT_FLAG_YUV |
-				MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 4, MDP_TILE_HEIGHT_NV12),
+		CHROMA_420, 0,
+		MDP_TILE_HEIGHT_NV12),
 
 	PSEUDO_YUV_FMT_TILED(P010,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, MSM_FORMAT_FLAG_DX |
-				MSM_FORMAT_FLAG_YUV |
-				MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 4, MDP_TILE_HEIGHT_UBWC),
+		CHROMA_420, MSM_FORMAT_FLAG_DX,
+		MDP_TILE_HEIGHT_UBWC),
 };
 
 const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format,

-- 
2.47.2


