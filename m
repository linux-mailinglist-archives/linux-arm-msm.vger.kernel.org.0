Return-Path: <linux-arm-msm+bounces-88877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A620BD1B381
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 21:33:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EEB933008E0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 20:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31AB92C21EF;
	Tue, 13 Jan 2026 20:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MUNZ7PwV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yoye1ESc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B56E2BCF6C
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 20:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768336422; cv=none; b=axiey+E4S1RP36AiaezXyMzdMpXPxQusC8fk/Qj/IGTlvKDjtLfE/u8PijeB9vjxjmc7Ov44Y+gk2TdnZV3QwQAIrizlWgTR8KhK07X8exhlRbIMguexPMUO9ootG/mSHX2nP0r5dnC3MGGt+GeTj3g3f7KfXmJWpEL+E69Xj1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768336422; c=relaxed/simple;
	bh=rLg1XZm7+TLU/MssBuCqd65nuhBQ9YaSkzsjTYz4VIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z42fq9ilHjxixrEhiil9xpmrXRW3srP9CXdkpJb4TQUyfmk87Hs56dm1Yz5VLw78xIpalcU9DYFKzlLyonzwOX89Zd0qJdpZahqx71Q70xiD9xiZA/GGlLxBrtwjGDlr4gC2HxAHIyWjhmecI+q49bbDm1uiH2D028lAII0TtQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MUNZ7PwV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yoye1ESc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DIENCI390055
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 20:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0moqou0Ld4EaZmHxxSS0TZm2GMndw0nUqSIpM/AN1jg=; b=MUNZ7PwVpbrothYH
	BUkjqNgYRmexrFjjH4+DAPX5KMElW8+sJYkYNGkK3VUiJr7eQJsvDDVi8nquCS6V
	GAZ4KQn4l7i/z6r0ZgaQxndlC5RHHYaK/NQ35wciKDMGy1PgbXpCOFgYeN78/R68
	SgbT9YuPID4ew+FW+lGA9Bgc1ByItWe+clVrTBKp/dvv4dPFNd84Q5WQBQWuxcoh
	c0kSEtdfLEs5csDBKZzdHdaGWh1sQI0/qXl7lcoGNQsgvlMfkLcf9PBCeVcjj6bQ
	sKfeJXZaZR9WMHpsxY71bsk86iCwdZJMBCuIPAtpd0INhG3p6Qoi9pfz+Xaxelxl
	wKoFjA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnu58re03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 20:33:39 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-121adbc6219so1195758c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 12:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768336419; x=1768941219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0moqou0Ld4EaZmHxxSS0TZm2GMndw0nUqSIpM/AN1jg=;
        b=Yoye1ESc61PHcEhxRBRawSUYy0tKFN+V7sPOst7e/xNjcxaa6Lca0dtPGgP4RncjkU
         Q29rQjDTyoq6HoeAgt+9xYw5zVDyAsJXLP+oisU+lJlRUcjfrhoLyI2idVdEAQkMVXXi
         ZQcMMIKZCO+LTvXN3Tt7VJgN1u0iki0mIMn8BpXTqJ6kjUm4OHzZNoVlxQwsyZEmdi/B
         tuEusYyPpQZj8Q00a/2RXjSSwVVl51djmk1Shs8tGtTQP4LAyl+EshQuZTH6LhG2lF8y
         pDGmMEgKVCGdOM/03ZmUe+828/PUo7bugNSN/3krdfwD4XUUTB2llSKasxfMBtycV3Mz
         X9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768336419; x=1768941219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0moqou0Ld4EaZmHxxSS0TZm2GMndw0nUqSIpM/AN1jg=;
        b=FDt6jVHud2xFyzmtvLDW2JXlIBEorzMsK242Yt2eRX+mftVEdBPsY96/DjcPbRlT07
         HyQ1c+arolTE0dqHDAgZjB86WEgE+Oa9TMBHveDI3y6SEDKp3LtT7b6oZSvS33SdKCy3
         D5mmaje7pkRrYxbzqaefwSaZdhJor2D4Ahav/hYJnG2PQlaBfXitM8JSxXTJEitmig21
         9QCfycOXWjENXjVaa0g1lFOSGj30+UrV2TU8ElMpQ2OmRqtNYyDgO6r3Dpc52rnUMldv
         SScvijMCqOcCuOXTcmg0PVKrTgsDylhbPInyvDT3nget52ZlSF9Dav9Pz1NzOdnc9fqu
         12XQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIsyOA/YitmOPj5miupYOZ4GfDwDsd1MpeUpUNpdX8sx4DWtDSZeiiQ6GMU4EHmPeDpVrY7WKC314zt/P8@vger.kernel.org
X-Gm-Message-State: AOJu0YxltA9Y8V+kHKyuneUB6wRgsh0i499bY5cQEQzssUZ7LGQaJTmp
	o5f9Ae73S5kzdLk6QiFn1plHah3Qfq+u3QtKlGNz9Enj0zXhdeikWp5c3HZymKzjUWvh/ZquZTW
	qcx4Pq0byvA5e7L+38ecDKgy0JjY+CVzxLNOPjv4xtRHnRadaYK4+vPkIPUEzyr5Q5riN9wQH9P
	kn
X-Gm-Gg: AY/fxX6lkek9w6bagu04WL4UNuUCSOQvMxnn+F3I2cIjNStC0dp3vJx+bg736bk2qMl
	Y9pG8U9y56JS00313K3PPhNga5gqr3Bqw1Drcyh5IXDdsvMISL/tCH13IjcfQ1ghxTGQ4tAzoTH
	lZgLXg2vzhP5XmIXWseULAJ6bZID7AVe9lhKfTc60gAAp6yFFZYwPhxkMJDtMbzw1OvBUQ7W8tC
	JUWIAM2PHw665vob55EGXhNudmLzo72FJ9bE2uml+/nGocuQcOGb1TgvLcA574BGCH5wsrfjroj
	nVPmhD538Dr9yfqqvJ6RUmJMjwnsn+5BdxLKKpu+NEwKfpnY/OiH4tH2Yq6B7AOsiiwGj+/YPd0
	QWfoZ3epEHfkcI+8PpIbfDvKeak32C6DekuJMVm3m00msUOE3rKJ7mSXIOjfq+ynFoWzqcQ==
X-Received: by 2002:a05:7300:7304:b0:2ae:593b:2163 with SMTP id 5a478bee46e88-2b4870bf0dfmr137002eec.4.1768336418562;
        Tue, 13 Jan 2026 12:33:38 -0800 (PST)
X-Received: by 2002:a05:7300:7304:b0:2ae:593b:2163 with SMTP id 5a478bee46e88-2b4870bf0dfmr136981eec.4.1768336417978;
        Tue, 13 Jan 2026 12:33:37 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170673bc0sm19157897eec.5.2026.01.13.12.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 12:33:37 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 12:33:33 -0800
Subject: [RFC PATCH 2/3] media: v4l2-core: Add support for video encoder
 ROI control
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris_enc_roi-v1-2-6c86eba38587@oss.qualcomm.com>
References: <20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com>
In-Reply-To: <20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768336416; l=3289;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=rLg1XZm7+TLU/MssBuCqd65nuhBQ9YaSkzsjTYz4VIE=;
 b=Sr4x6zEVPNeL1g0JOIj59gzmqbw6vnuMmJ9+MXMlvRMlCL+/GQlO831nKbUiYLTQ8442IVe49
 GbDXccNz63uD4pLH9V7tRAkfFKZ6xOquTS+Vy84+KLN4DuqsGldZ4nU
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE2OCBTYWx0ZWRfXwqsyCUxE+sO6
 qv1P/rBaHbRqxfCEeGmAGM90h3yp4qiRgSS0V/dDyULcQQKeT8ErCVkrkownyxebSUZVWteiX5b
 bQYYJq/bCyfhq2dFbntpU3bw6nYxtJjn8mD17mPKqftQCr7/C1U9k7q7u3WxFzGFd7Hr6Ka3arh
 eL5XqKrXHuQDQykvXYIQUdjlbzB1ASuzJiammB+nnSFSBqNZjv0tZGrNtLDLmQyQ6D6uHgwHPd+
 We7na9g0q6Ztkel2fMqrihAxsfsT5al8x3HR6U2XYTHbh0I8+YFk2rP/kSKdPeFRC7YlT0vnJaR
 Ap3RTjgMqkM98s9C7X4PsNNUy+JMgS3d1kbNU/61JI0VPpukJGLc7PAxtCr02AxfB0NeHIHiBhs
 7Zjf3ZYDWF975QaBLVYyTniK7p3NknjfwZmFj/RdeN6Qx4sQjsAjnAr3nrco1Fsc0wm4OdpkG7B
 pBttyBfSSHofOFdwh4g==
X-Authority-Analysis: v=2.4 cv=BZnVE7t2 c=1 sm=1 tr=0 ts=6966ac23 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rF52-kdUTgVHl7Ch54gA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: UtOR9AVXLjn-NILWLFwi09uT1lMzhVgG
X-Proofpoint-GUID: UtOR9AVXLjn-NILWLFwi09uT1lMzhVgG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130168

Implement V4L2_CTRL_TYPE_ENC_ROI_PARAMS control type with validation
ensuring the number of ROI regions stays within acceptable limits.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 14 +++++++++++++-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c |  5 +++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 209bc05883bb15bc8614970e7b42595aad6dd18f..5695c96b4f2065c5d548a25ebcfd3619e7b6f4d0 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -442,6 +442,9 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_AV1_FILM_GRAIN:
 		pr_cont("AV1_FILM_GRAIN");
 		break;
+	case V4L2_CTRL_TYPE_ENC_ROI_PARAMS:
+		pr_cont("ENCODER_ROI");
+		break;
 	case V4L2_CTRL_TYPE_RECT:
 		pr_cont("(%d,%d)/%ux%u",
 			ptr.p_rect->left, ptr.p_rect->top,
@@ -967,6 +970,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
 	struct v4l2_area *area;
 	struct v4l2_rect *rect;
+	struct v4l2_ctrl_enc_roi_params *p_enc_roi_params;
 	void *p = ptr.p + idx * ctrl->elem_size;
 	unsigned int i;
 
@@ -1329,7 +1333,12 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		if (!rect->width || !rect->height)
 			return -EINVAL;
 		break;
-
+	case V4L2_CTRL_TYPE_ENC_ROI_PARAMS:
+		p_enc_roi_params = p;
+		if (p_enc_roi_params->num_roi_regions > 10 ||
+		    p_enc_roi_params->num_roi_regions < 0)
+			return -EINVAL;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -2042,6 +2051,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_RECT:
 		elem_size = sizeof(struct v4l2_rect);
 		break;
+	case V4L2_CTRL_TYPE_ENC_ROI_PARAMS:
+		elem_size = sizeof(struct v4l2_ctrl_enc_roi_params);
+		break;
 	default:
 		if (type < V4L2_CTRL_COMPOUND_TYPES)
 			elem_size = sizeof(s32);
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index ad41f65374e2396f30f9798235401705af366622..7d36e387d6e9b0e5ee556ea1e48c1b4f0abd084b 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -973,6 +973,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:			return "Average QP Value";
 	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
 	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
+	case V4L2_CID_MPEG_VIDEO_ENC_ROI:			return "Video Encoder ROI params ";
 
 	/* VPX controls */
 	case V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS:		return "VPX Number of Partitions";
@@ -1607,6 +1608,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
 		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
 		break;
+	case V4L2_CID_MPEG_VIDEO_ENC_ROI:
+		*type = V4L2_CTRL_TYPE_ENC_ROI_PARAMS;
+		*flags |= V4L2_CTRL_FLAG_HAS_PAYLOAD;
+		break;
 	default:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;

-- 
2.34.1


