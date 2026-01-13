Return-Path: <linux-arm-msm+bounces-88876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C381FD1B37B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 21:33:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 447873005316
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 20:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2D2730EF7F;
	Tue, 13 Jan 2026 20:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kcxkRxgk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DGMv+6F6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1E826F289
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 20:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768336421; cv=none; b=ApEiQuvbPz80K2nelO0pl7tIEjSeGhA2YFyfYx/QguACM122gygu92NjDujWz2QVX/csDIgxtZLjtg9mQ1cfXd8t6rZ6DbZSgWSbmo+RXnO9a/hT9JBislJ9D9c4+dqhD0LRFMdeDz358VrkxCBBblnQj0GRUJfx499p8avxxns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768336421; c=relaxed/simple;
	bh=0Td/LNDR2RTKrvU2VfyPG8mO1E8oATgnsMCmASdMIb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AKOYveCqab4uxPu7jNshxy6nfTaDS1Ji8InJdoBTeSWroZIx6qNVogB2FVdO5f8RnukN9gmxVRzq20USX1lvS3MmoLn7CXIacfhd/PjU3p1ZUkUw4FkxDxFFVG1fzCiTL51MHx+F/w5l82/XIrnUMoE1a6N9lKnzj/7ZRJmhZCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kcxkRxgk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DGMv+6F6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DEjKD14080708
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 20:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Oks4Lx3iH0CoTRTkj5T3bSc++Pq4Nk/yi1DSprS+Tk=; b=kcxkRxgk5no0fX7V
	BQpesOXUEhI8Qu/6NVzDeV4bmERmjwUdjrZcVHXU83QWHKKARI0/BXhlrLCZUYTH
	amesiugM0cqMkQuvTlOMnhVyAxGYx/ded0E09gPFX/NLUJljpluxNBcbXx6+86ks
	Fc2HIstqoGnwo7YFTOhFx62G7fQtiQQNr30CH7V1uHp1NxRG+mRWqu06/iXAr5qJ
	nIqgFRsaHxVQcq0lBIHAEpMsYLZ6Co/p5iWrc7KMes7D9zlv07hfQNP+Ll354C+P
	pJdkBEqn2xamJPNGj+0HLHk/hxs2vIHjhuX9D8ekw3Y0riS6989kdPnqmtIBKSDi
	nE/YDw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnr3e96hq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 20:33:39 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-11f3c7096baso926048c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 12:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768336418; x=1768941218; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Oks4Lx3iH0CoTRTkj5T3bSc++Pq4Nk/yi1DSprS+Tk=;
        b=DGMv+6F6ZLzYlTSZ8HbYtYmGkgbgw6up1VCWn69LcfzH9yoe0P1EC4GlYcegrrT6uw
         M8zU1Nqi1QJaoSe5DtTqMYTDB/J9gd/AKn0jwT+GuU+eF9bdXkyKEfjQzkP3LhPsYeza
         by/AZ0OMysYfHbDTL0cOY1XaAmHRnj/0npAUcFmIsv6TCpPx3G6Zg853XLIuHx0PuCLq
         fVzimtKiIuy63Ce0lYc3qx17QRjYwcl0myw3xamh9/XZSIhxNzKFkr8b/NUvILOnOxSC
         b0uwVJ+efBuhgOT3SyDu6Em5O/Ph1OVB7DC8v7RvnWb+j2No53hszkgpgqnyI3ZGxilf
         UAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768336418; x=1768941218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8Oks4Lx3iH0CoTRTkj5T3bSc++Pq4Nk/yi1DSprS+Tk=;
        b=SZdo5LX8bS75iGsrpZJHaSc2u/XvQ0VzBtgjwE/5L5Q58Fh+L42D4EGwBDN0+bTV9A
         7I0+FqaG7EQFC4qFwSJ5nrQWa3u3eLjWhNUY6B/1d5pFeEmHdQRQ4M+VTE93Md3USeWB
         O7GgWhLXm6GohxbLrJmuTElz+IqlO8tXDxAvsA1Tbg9f4nKeyqAOIKLuIX4BF800h1eR
         LsIy3ErW3YU81eTQCJpjI/IGG7xZPeo1mVs69lcGtAffM8g7p2AgVu55Fw+97WnVUkRu
         /wNpY31kBEV5sHkxDGJJztLYl+/n7n8P/P8PGEAyS8vnWuN1i1cwBHJeN/RYRDPMS2is
         LXzA==
X-Forwarded-Encrypted: i=1; AJvYcCWPJeBE1CdPeRFEPECEdc8D3vFWF570ln3O6WYAIkrzFwnSPqSjRApOAAj3csU5Iz3noweeU+1ykETZTjKg@vger.kernel.org
X-Gm-Message-State: AOJu0YxngyDEEE/Bn53C+XxncZnJPWzjZCZ9PSJoY5Uxpt3ldOmwHPKl
	gpbCQbp3wTV6mLejPWu14VZH2yHFYgsIwffAIDsDF9yJ0u5BoZDwkwEHCIV7azn9+IFrIqfNvKa
	+xxjuVniZBXiiaioctr37YQQ9wzLpG1dK0LvHhR9xbk7iFg3MOZDM7FBYFE9FjG8x/FM3J0hjS7
	rn
X-Gm-Gg: AY/fxX6mAJOlhCdGIjWmyHbUtvEqTbZEUUM0en5WHZ1XJ4lNtkMXCU3pGjqL36gBRn1
	adXEe2RMox62dTXYHjTDW34YU+fW8mL5/rX0zN2K0plf5mM0K4UGXRpPUWmlsz04ddcPftu0hYd
	LEIORatOfepPKGqGnCdAmIyrk+a49TxYZEbGA8/rCDpgHMpF4inLjU9AoI/Y3N3h42SJPX3HNL2
	tWKt+Mmj96cIrZl5dv3wKmceHLddSqKjMTNxXLZJwqIaJSAKyuUJTZYub2iGkhhCATy4b9f83Mw
	W4QvoPgjojFbSKSI+yjHaXKNhPjan+rcN8DvOegUQOuvZu2Q91BXZ21wZx4/WzoRJY1vk0HsuHR
	dFi5v+nxdOe12U94sTV6LdJPso9Zb9AwT58RuCuwIJkVnqBSkH8Jyls7mEHMSkMSrTDGlcw==
X-Received: by 2002:a05:7300:a28b:b0:2b0:4e90:7755 with SMTP id 5a478bee46e88-2b4873215abmr121779eec.8.1768336417941;
        Tue, 13 Jan 2026 12:33:37 -0800 (PST)
X-Received: by 2002:a05:7300:a28b:b0:2b0:4e90:7755 with SMTP id 5a478bee46e88-2b4873215abmr121757eec.8.1768336417361;
        Tue, 13 Jan 2026 12:33:37 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170673bc0sm19157897eec.5.2026.01.13.12.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 12:33:37 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 12:33:32 -0800
Subject: [RFC PATCH 1/3] media: uapi: Introduce new control for video
 encoder ROI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris_enc_roi-v1-1-6c86eba38587@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768336416; l=4374;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=0Td/LNDR2RTKrvU2VfyPG8mO1E8oATgnsMCmASdMIb8=;
 b=ENymqkOPbznuQvfaGVxFX6x4RlaPuM9sEHqQEXbTypnU1CQw9+JJ0uzJc9e1WCBifYMbZdrGB
 SNh9dPwxZfQD5GJnf3+CNKnJg9YWnOrDgoXJ/8iIO7a5dp+eEWmeYyy
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=TPFIilla c=1 sm=1 tr=0 ts=6966ac23 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1tTGy1hlu4sAMEPmmk4A:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE2OCBTYWx0ZWRfXwJMzykW60I9X
 R3oOG93LZpSveCQ5SLPl8KVjmPOSCzdA8IVdi0hzrlgW9vFkpyk/b4V9dp7SW3Tr5oViJASDlOW
 LwtOB7LayBPuMw37l7x8ZHV0RJ9PMdIs187ABmwh/o6bnle1iDZlAR7nX2dvrN6BPRpdhUYtePE
 U/SVsVOiDZbm2SJhf60rFQ22A/dT0tFWQ25vt8VgqxwEatjyG1r328dpbGvC/fF4uKW7kXb+baI
 mgw+W2JOV+oZZ5yMEU6zj4fJT3/mf19WqNU4iraYFodvBUOryUzQ7pUfAKtvvUtrJ9xmnlDBqnd
 oyF9p6zUaNCq9dT6vgRp+GOAiOUArNOdvR804MaqSwg7AbEmaWma7+QQm/pDvQs0mbMbbfzQYQJ
 rYvzE5deMgOcgPEOfu8yJAH/eIU3oGhne6yFcZX/EP9hytlAC/mEeVT/Bl1mt3Vk8+YmCw6uXpK
 s7A93F+TEFaAdoIHQ+Q==
X-Proofpoint-GUID: jrzOSygh7i3N42YGTPcq_oUNDd2Qpdn9
X-Proofpoint-ORIG-GUID: jrzOSygh7i3N42YGTPcq_oUNDd2Qpdn9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130168

Add compound control, V4L2_CID_MPEG_VIDEO_ENC_ROI, for
video encoder Region of Interest to allow applications to specify
different quality levels for specific regions in video frames. Define
struct v4l2_ctrl_enc_roi_params to hold up to 10 rectangular ROI,
regions and their corresponding delta_qp value (v4l2_roi_param)
that adjust quantization relative to the frame's base value.

This enables use cases like prioritizing quality for faces in video
conferencing or important objects in surveillance footage while reducing
bitrate for less critical areas.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst         |  7 +++++++
 include/media/v4l2-ctrls.h                              |  1 +
 include/uapi/linux/v4l2-controls.h                      |  1 +
 include/uapi/linux/videodev2.h                          | 17 +++++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index c8890cb5e00ac05649e6c344c2a6b938b2ec1b24..0eecb46bb356c01411dfc313b92376593bcd86f6 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1668,6 +1668,13 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     Codecs need to always use the specified range, rather then a HW custom range.
     Applicable to encoders
 
+``V4L2_CID_MPEG_VIDEO_ENC_ROI (struct)``
+    Defines the control id to configure specific delta QP for one or more
+    rectangular regions of interest. The struct v4l2_ctrl_enc_roi_params
+    is defined to hold up to 10 v4l2_rect regions and their corresponding
+    delta_qp with a range of -31 to 30.
+    Applicable to encoders
+
 .. raw:: latex
 
     \normalsize
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 31fc1bee3797bfe532931889188c8f7a9dedad39..c44fad7f51db45a437dd3287aa16830585ac42f3 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -91,6 +91,7 @@ union v4l2_ctrl_ptr {
 	struct v4l2_ctrl_av1_frame *p_av1_frame;
 	struct v4l2_ctrl_av1_film_grain *p_av1_film_grain;
 	struct v4l2_rect *p_rect;
+	struct v4l2_ctrl_enc_roi_params *p_enc_roi_params;
 	void *p;
 	const void *p_const;
 };
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index f84ed133a6c9b2ddc1aedbd582ddf78cb71f34e5..5f2621365593ee19a7792fb25ea29acf6a7860f1 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -918,6 +918,7 @@ enum v4l2_mpeg_video_av1_level {
 };
 
 #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
+#define V4L2_CID_MPEG_VIDEO_ENC_ROI  (V4L2_CID_CODEC_BASE + 658)
 
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index add08188f06890182a5c399a223c1ab0a546cae1..18a5ae34842721c2647a7a76365e4d299d2b8a44 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1909,6 +1909,7 @@ struct v4l2_ext_control {
 		struct v4l2_ctrl_av1_film_grain __user *p_av1_film_grain;
 		struct v4l2_ctrl_hdr10_cll_info __user *p_hdr10_cll_info;
 		struct v4l2_ctrl_hdr10_mastering_display __user *p_hdr10_mastering_display;
+		struct v4l2_ctrl_enc_roi_params __user *p_enc_roi_params;
 		void __user *ptr;
 	} __attribute__ ((packed));
 } __attribute__ ((packed));
@@ -1990,6 +1991,8 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY = 0x281,
 	V4L2_CTRL_TYPE_AV1_FRAME	    = 0x282,
 	V4L2_CTRL_TYPE_AV1_FILM_GRAIN	    = 0x283,
+
+	V4L2_CTRL_TYPE_ENC_ROI_PARAMS	    = 0x284,
 };
 
 /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
@@ -2540,6 +2543,20 @@ struct v4l2_streamparm {
 	} parm;
 };
 
+/* Roi format
+ */
+#define VIDEO_MAX_ROI_REGIONS         10
+
+struct v4l2_roi_param {
+	struct v4l2_rect roi_rect;
+	__s32 delta_qp;
+};
+
+struct v4l2_ctrl_enc_roi_params {
+	__u32 num_roi_regions;
+	struct v4l2_roi_param roi_params[VIDEO_MAX_ROI_REGIONS];
+};
+
 /*
  *	E V E N T S
  */

-- 
2.34.1


