Return-Path: <linux-arm-msm+bounces-79575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 292D1C1EA8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 08:00:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D635C4016BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 07:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D98033436D;
	Thu, 30 Oct 2025 07:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DfM1D6AB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ikp/Bxoa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07FD2F1FC5
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 07:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761807637; cv=none; b=fpMcet7ppQ2xwy51okwYJEYfZur/g66Gc63Mf3AyHbP+zhP5gMpzHn0msozoEvOVEoJQlbEm0gXgBoR/T7ksyaD7OXOHHq0O+xlWJH07LcZNHwG1xF6ukcPmjhrAViLXpJxFQgg98TBJrtI9byARfbtoLenwEi0HAFSVMZg2sv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761807637; c=relaxed/simple;
	bh=nkMTv+cGBneu9mDQTjTqBZI+GutDvkdMMD3WodVls7o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U99BxxrG+cUv/UPFPQ6TtSav0FdlzDTUBW6GC+milE99HR1GUrdtVIMbPLglv0PqK6oWGQjW2xjLTr5/Ln472R/YVvappA1M5xGLlvYXk1Lm4C5jMuVaifYEOfiUCH0csiINPvCxQZfH4z3DkuIdrPUdKj26ihUf958XKzttPk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DfM1D6AB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ikp/Bxoa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U6u9IB1501890
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 07:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	79IsCawl82bQEifBPmUrGKC8kwHl1F6WlaHBtQQ3mx0=; b=DfM1D6ABnHE4WEUe
	LeZgbuARWpYQUalLf2pc0NzV5rITck/EefYiYkOnw14B+fHjDYPm0jQSU3GQ0v1c
	I28kUj4+nSGxZvGynUjdOlNIbLEuAS3mFNywAzOTaCh2HXkN0aZCtZ4ANyPIZ4FZ
	4CACgtu2+VwLXPx7ZBkqHyNcMS0xqYGmHkV6+IVa3kghux0aO2ab7c6uyuK/d3fr
	gmSthIrr4MS1JQMD7ittlchEmbpT/MoJHkS+QiQ1Ot1NkWRAx4bkDtn38ctI7Dcx
	8wDxC6yzNJyCDjhlKgt0Qp0ksfzk3dWrX+WQa2XW+5CtWsuwiG+ZXUoecMIcyNxw
	o52c5w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3t1jsgqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 07:00:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-294fbd39d31so772635ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 00:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761807626; x=1762412426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79IsCawl82bQEifBPmUrGKC8kwHl1F6WlaHBtQQ3mx0=;
        b=ikp/BxoaeQNCPu12sGpsu7Ic23J+t/g0XFPJOCxnbYZn4ydu5FoTZ99tiQE0dYJ688
         E03LjtlOULwpyYjvzVxS6XwnChAkdTUCVwYn7piC7aoOkaYiVFrt+VsVtvk85Lp15qDJ
         8xTEAjwrWPD0IZxB/xSMzF/QdT/XHAyo9qOfszs91qiZCWCZll2/4hOOzJ5qNme7ZHH3
         JjX6HBdzCohdwp6loKImpOFJksaAanwwb/bU8VlW7Hf9epveoUyP7+gFyo7766tYMV2X
         J73rT5/a6/CD2bn2Aa9Uenqb0hGkeCHBiVCZoX1oSXKvdwdQto8ia80z7428wDBoPiVc
         zWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761807626; x=1762412426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79IsCawl82bQEifBPmUrGKC8kwHl1F6WlaHBtQQ3mx0=;
        b=vKMD/+1x7JcuhEI0lLFwzdDpRjxTz1+OGMBgKMWwnQnrLf02TbbUOBg960woOubddl
         5zxEzWOwXO1Elm5Ylr4sDQZVr4RZIjyiQMxE57DzVRGVPXguNKtUg2S2Q6r2AM+xsmI9
         Bvy5Qh3q+qmI5I5klVVLpkqY8iWMTMcTvvCsvKDJzUaJLWJ91rgg8IyLUPvX5lMAJxSp
         tOwz9CYeq5PqGWvrgjhzpZtbMyoNVtZUJ+O5G6ec28aetojEFFBiIcIv2AoRf4p8yC+n
         BHNTc9B61w8fsPxHStLUOO6zu2Vje5U5Z9zEk8k1QvSq8S7VFt5k1UqoCeDlb4vI7SKv
         xfKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIMVHdPYIghwndIBC3IKTo1TLhwp/JvfS7yUX4Pac4pH/3dwmaKojRa4e3c4YxemNxZQ+4oRdlnPdQ18qV@vger.kernel.org
X-Gm-Message-State: AOJu0YyHjBsVedOMIevgrHIGjh0JbpMNKSZ61YwcmySS5dGxd/3ybKoX
	6/bD59NbeNVrWh5WT14cur94XAsJVLI9t+ZFh1D6Dq7mwkBeOktT5dkIxzFbUQnex5hK6LSktRt
	qp/BnUtG3D/6gr1DKHut+y7RVRbpxFlJm+tKzQhhDWImThAQ+IU6B+HUHlTv9vgabNJNFN17Y3L
	hl1dk=
X-Gm-Gg: ASbGncshnb9HL5bVdiAi2ZL273VTyzC84q5E1J5FNDgrSLe/XMqNB5uqTez5QRMDA6x
	B3roiTR/GGFXZnvkVKrn+UCUmn23dqrtGHG+UtoVKi3of2svEAHlWMKtAuHFBCZgB6W1pE3lDrh
	/ZZ2N9PTjr0zdjQ9mHMbegiZCZmcMeh6tRb9S5ZMAUr4WxS05KAyroPuGYRQT/xgnzHJBDDCgpS
	tyi8NhpEI4ZtVe5wpt8+eXGebAmx+FlBvp59YesXBzK8n0IrOOygONzOh0i4M3Nl4h0x/DamzjW
	wTAKeVx7I/VPh2R4h9r0r+bF5iyV/ginLY18wkpSgMCJ+So7qr6LtwmQ0uHgoJzHI1wI90cZTNx
	5XTFbVsjs+wTEs4KR/YBDjA09wSNfITpJa63fCKqfE2eDfhkFE25bNixWY+E=
X-Received: by 2002:a17:902:8c92:b0:294:9847:fbfc with SMTP id d9443c01a7336-294def6c333mr25632165ad.11.1761807625613;
        Thu, 30 Oct 2025 00:00:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGasTEFUNJtE+G94KtjRffyB1Voc9iYmdVLTZXDt6lCPlF0AJJNQDh4vq/aF7zCXdujtbxQ1A==
X-Received: by 2002:a17:902:8c92:b0:294:9847:fbfc with SMTP id d9443c01a7336-294def6c333mr25631925ad.11.1761807624956;
        Thu, 30 Oct 2025 00:00:24 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d40a73sm177671325ad.74.2025.10.30.00.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 00:00:24 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 00:00:06 -0700
Subject: [PATCH v3 1/5] media: uapi: videodev2: Add support for AV1
 stateful decoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-av1d_stateful_v3-v3-1-a1184de52fc4@oss.qualcomm.com>
References: <20251030-av1d_stateful_v3-v3-0-a1184de52fc4@oss.qualcomm.com>
In-Reply-To: <20251030-av1d_stateful_v3-v3-0-a1184de52fc4@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761807623; l=2423;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=nkMTv+cGBneu9mDQTjTqBZI+GutDvkdMMD3WodVls7o=;
 b=YXg1T+6exolovBIvmlpqgpeHmi+0zn2Pmy4thtiJSXAp0j6HTJrXOM/YQbZc+4P6CcLABv4rE
 q2MIfsrUPaXCg1YK7dZpsV59L/HyCErY8nDeVeciPW1QNp5dTQbYeLK
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: DLybeowEAv1KuMe2MrNv_N4zB96mYgXc
X-Proofpoint-ORIG-GUID: DLybeowEAv1KuMe2MrNv_N4zB96mYgXc
X-Authority-Analysis: v=2.4 cv=M/lA6iws c=1 sm=1 tr=0 ts=69030d0a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5q8hE9cQKCNJD2usWYQA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA1NSBTYWx0ZWRfX8RTrGAkUXMI6
 idu68zNPxKqEbYgxj6huRGfFnSjMjjFeFcbF5iFU65OoAK0QwYlhPDxBYgL0N6fOzoJQx8Q9D3z
 2z4axIvGB3Byll1So1n8Yqi+9u+N/aknWeVCP92TEvKLI9EGwXLGRIXzK9zEbS+/IDkAcsmRt0e
 GSwPTLQ1i4eS09sj9dY5pQ2mcK2uMeaHRzMaeqNJSbr6d9XgxnI+hPoqmCa68W8/nzvouon/tsh
 SPxW6yt9TLZfrjfrWZUUuVVqs4C5cAOY9t7SGHaT3IUr/gJM290Xpi37skuYTqXdzyObnlWGLr3
 4e91FDLMdaMwkvx51jQSGkz78SdLnkX997oj26mWivKR7yqVyW01C+zk1LSmZzOqL/e566uP6cm
 FG4Fd+1mvAByDp0MMh1P8jzxe3r+fQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300055

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
index c7efb0465db6480fe35be8557728c196e0e530f4..0c70410ffd4d58e0719d3cf13ad336c97b454ae9 100644
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
+        Temporal Unit per buffer from OBU-stream or AnnexB.
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


