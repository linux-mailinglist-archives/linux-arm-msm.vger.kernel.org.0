Return-Path: <linux-arm-msm+bounces-81774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 60554C5B390
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 04:49:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5215F4E8717
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 03:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7090298CC7;
	Fri, 14 Nov 2025 03:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vh92We77";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TwgCpfpM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A72B299AB3
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763091849; cv=none; b=P7d4i0tVLWIMATBiKyPtGgnSB50H9Y/NXQgfvXtM3+Kh1B3quntf7BEMYv0+G43idOtdaNDNJu4Eqjeqfy1qaH6AFfjRiTgNMnF026h84BNL/7va4VjhTih/2lZWgm74kD12fxvEo3xpovfTHM/hpP1BrLDYYN9NdsWf9Rl/HTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763091849; c=relaxed/simple;
	bh=VPbylyDBkCJtvEwxDI8LMWIjA3Hoqe2EHamYEMv9eSk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KvKcDpc9E/ZMdL2/qbMIqdfVrg60QcrK4l6PkGMrQ9sGYPNEcZ+GisGdb/b3PPhhnxZrSmj0cmcnk4L7DWg+m6zaOgriQowFIF9fhRPQzWS714X7hsCvy8c2wb5VIul/J5qSx+StLqShngk87J5V0NuWsG6LczcFIMO43ISl69M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vh92We77; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TwgCpfpM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMbDUL1495186
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dtq0GJ7tV91I/BHHJah0AtaqvF7na51s0A7ny73xl4Q=; b=Vh92We77N5QIZHvZ
	NSao/Oy+WO94liaviIJC0pRX3Xx3TyKoYy7fy5qnJW0vqCtzZmfa+8PWoomln5yn
	gKlMZiZIS5yqnS55dKwqrx9Aehv2ApAnG2ynFpuWfkHgb21G5ajI9+QTbKqLalZ3
	3ifz+7tsUJu0n0lW7ZOAjt8uROEykG2AMU0GfR0JMIMh+Xd9SSRu6NHXLQG52J6S
	C0PabpzE5bmA/SJYouqWnj2XWZdT1oJTQ8ElsLotJe8VV0BNF13VMYAI7jWPfYvh
	73BNzzad8KWg+rxtheUFcWRzbhDkDR3EmpM98pBVLH1sNpNJs1ftVaqnWb0+9ak4
	ej0q4A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9hrpgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:44:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88236279bd9so48808446d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 19:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763091846; x=1763696646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dtq0GJ7tV91I/BHHJah0AtaqvF7na51s0A7ny73xl4Q=;
        b=TwgCpfpM5T2nx2jr/VaWqwEl0TDoqxzNYzKy5dbSXDE8BMTmy7WevT2OtUJxlvcAi9
         6bO2TwgXROhU/MqneGe+Qz2xHndsi1jRmT4RXxC72U3TQlQm2REUyB9pvwAeBM+ZMoIm
         aF4BZqDpePMVb7+M09CRTMY9ECJKbowAyY3uAITY26yE7jqWw9MfkuHMu2HQyfR111tw
         F05o00zySwi9Gj2eoI5pDcE+LqialJeKE/IKlaPJSYGE3tNai4xU9AGJqaz6G+XGjbfC
         cD6qtLOAQlxdw639jflaNKUVGkwPRPiNcBmVjw1RL1XzRKyABRzkMd+hpOahqFLlRMw9
         rLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763091846; x=1763696646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dtq0GJ7tV91I/BHHJah0AtaqvF7na51s0A7ny73xl4Q=;
        b=kfj5ue2D1oqz/j+3SsbAlprLyVHH3FlJuI+w0RYbMfvthHAiu2ZCbe4+pCzykavptF
         n3+OWG/T9hfP3JrZP4xhOBf4xygveYCIK4f02iWZxqdSfTRzuioq4pEGHG/UrrxJfbGQ
         cdmPL1lfWQrwxLE+UbjYngmmky7sMjCWVxXmozlPNBkyIWPIfmpj8aOeNuPjEvbD9lGI
         Wsl8cky2zxHw5qPuxeKflOkQRFLa+Fze4VLWupYgELsgLXtEaRZ8PnBwShygWu/KCLYB
         x+ASBU/dsws0yvRNsLpuqJEMitCs962p2/Bw9K8XbWR8JAr0mKRdTgZH6omaJrCPxGx3
         Am6Q==
X-Gm-Message-State: AOJu0Yww8iGGsc640qE03K7VFgBh4cWBaJQXl774TNVCGB3Jlf7NBCNj
	V437NLIojZ/UooQicb8W4hzdi80Y+xw7H/kDgQ9Xfo6zZx7B5Jq1ejLdKmm2KCiFXNf48Ujfr0P
	GAVHqTnj74WPm+NqsW3oJekEwtZGLmVvY+Fjz19nPg4cASF/XThMWEXHR2/cKggwppgTX
X-Gm-Gg: ASbGncvjiivKOCKNyVEbza0DVxccROlF8yGYDjzJbxD0lfE9/KIduzA2mnMdf4AiD6R
	2Oe1o9Q7OEKaMpWWPw9VfvNdeo6YlPe6R05D5qhMbG1OlHHejKdPx6u6hczzKnzLexX07ZS8l63
	Xb9CZdFXSp9DjNsdsNQeTbBpFX+4QBf0UANwJyvc0wTQxKyF0l0wg6J83ydQG2OyILKJWddj8Ro
	zLH98maitp+cQvVSk/xudajlkvGGTkmjtCnIN7sHKHRWwRZHz4P08Iz2jiSfEARVOdRK+6mtQ6u
	HF5qkG2dYvPAFPEOMBJHung5xF0n+ZJG2KfRGK78BmbhE1Lqzl+PZ/qxyZ3kjxV2bi0hl+xDQhe
	flBZEPyUH0yAM+XdAlD8VPWHq/EdxHfSQD+Ep7AFHBG98bzIl7IUuKrJojlK45lTRohkWtqPzdS
	0bWT2yf6zMf1Pn
X-Received: by 2002:a05:6214:1d2f:b0:880:448b:b893 with SMTP id 6a1803df08f44-8829272e198mr23198586d6.50.1763091846299;
        Thu, 13 Nov 2025 19:44:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqUJMLs+6jtwJBpg3Az+p+wGQJe71anyIqFLGvR3+H/KO+e/mxBtEGa6IBNBccwnLxdp6caQ==
X-Received: by 2002:a05:6214:1d2f:b0:880:448b:b893 with SMTP id 6a1803df08f44-8829272e198mr23198396d6.50.1763091845851;
        Thu, 13 Nov 2025 19:44:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040575fsm800713e87.84.2025.11.13.19.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:44:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 05:43:39 +0200
Subject: [PATCH v3 12/12] drm/msm/dpu: use standard functions in
 _dpu_format_populate_plane_sizes_ubwc()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-dpu-formats-v3-12-cae312379d49@oss.qualcomm.com>
References: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
In-Reply-To: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5431;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VPbylyDBkCJtvEwxDI8LMWIjA3Hoqe2EHamYEMv9eSk=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBpFqVmgyV/FfRFGvjtbKAqqM/dmHvibrPtN6W1A
 VggaMfW43aJATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRalZgAKCRCLPIo+Aiko
 1X2aB/dJXBqXc0cvpTNEm+vU5/J7lvSCBS+lJkjb07vkK0rPSF7L/Ly2Lr7TWERkvw9uxbv4D4X
 ZsaJp6JkFKz9L6pwJOa2hgJpQRHrhWxLu91XedmKyDHfsMP7ynw1cyJckJNX+Gd+sslZihmIfIS
 w6kSykh0qR6PKbok4UcHqGUaO7fd3Q2okEjAu+1wvG+RyQsMhSGDCtUz3OC557KpGImUueLJAdF
 L1vaWNorBEtPqOD+aHvYdw9jrG753owQ00ylexKbFXf4x7PFc5PKngh3XXreO59x6qxcDbPprgY
 uKSVToE0MFlpz7Hd434PVIUWAvtPnbUjyOit0DRDmsg8e0E=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: _h1718VaNzY1QmidWWBuHeXIwuK2Wpi9
X-Proofpoint-ORIG-GUID: _h1718VaNzY1QmidWWBuHeXIwuK2Wpi9
X-Authority-Analysis: v=2.4 cv=N+Qk1m9B c=1 sm=1 tr=0 ts=6916a586 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7bqH7Blup1pqkekdm3wA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfX83pOm0l4NTg7
 0GZhImqu0przjJpXuPCQNeu3Tn5UGbpIAcVj96/7zHRGpxq90SU26AMgahumRC/l4KD3jS24jLy
 tBZeNGDXKFkC+W75ytr2AQoqAc6UczCU7PnblwQbIcRSh+pUwBc8MOQh8bSdQuhGFfAw9WVIJXR
 7QqW23DZQDjiQJv90+evjZCwd6UqE9P4bI7g/Qpq7NalaFNZ6jDa2n/sJ2svlBuANzEoF7jbVqj
 vjsNPMm2+tP2UWC92kViCgEtFcxUj4eApkd2vwYbrD64WwH9HriSsgZyJGJ94TRwsLq46TVepIl
 +uOUrHNcUYLg7u2wR1aeRblAUVjsCkioPfbuQtdjJN8s+T26yAvSJVX1SXmhzcTVcqVBBEGWV2I
 dbwCeF4/Y9yhNqaTmESt+ycrbtLA0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140027

The _dpu_format_populate_plane_sizes_ubwc() used MSM_MEDIA_ALIGN() and
MSM_MEDIA_ROUNDUP(), macros inherited from the previous implementation,
msm_media_info.h. Replace them with the standard Linux macros,
round_up() and DIV_ROUND_UP() respectively.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 63 +++++++++++++----------------
 1 file changed, 27 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index da1870ce7680899759d09caa01050eeb9844a484..6e8883dbfad439a3b3f07b6fe9337820048fc2eb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -10,16 +10,6 @@
 #include "dpu_kms.h"
 #include "dpu_formats.h"
 
-#ifndef MSM_MEDIA_ALIGN
-#define MSM_MEDIA_ALIGN(__sz, __align) (((__align) & ((__align) - 1)) ?\
-	((((__sz) + (__align) - 1) / (__align)) * (__align)) :\
-	(((__sz) + (__align) - 1) & (~((__align) - 1))))
-#endif
-
-#ifndef MSM_MEDIA_ROUNDUP
-#define MSM_MEDIA_ROUNDUP(__sz, __r) (((__sz) + ((__r) - 1)) / (__r))
-#endif
-
 #define DPU_UBWC_PLANE_SIZE_ALIGNMENT	4096
 
 /*
@@ -78,56 +68,57 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 
 		if (MSM_FORMAT_IS_DX(fmt)) {
 			if (fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT) {
-				stride = MSM_MEDIA_ALIGN(fb->width, 192);
-				stride = MSM_MEDIA_ALIGN(stride * 4 / 3, 256);
+				/* can't use round_up() here because 192 is NPoT */
+				stride = roundup(fb->width, 192);
+				stride = round_up(stride * 4 / 3, 256);
 				y_tile_width = 48;
 			} else {
-				stride = MSM_MEDIA_ALIGN(fb->width * 2, 256);
+				stride = round_up(fb->width * 2, 256);
 				y_tile_width = 32;
 			}
 
-			sclines = MSM_MEDIA_ALIGN(fb->height, 16);
+			sclines = round_up(fb->height, 16);
 			y_tile_height = 4;
 		} else {
-			stride = MSM_MEDIA_ALIGN(fb->width, 128);
+			stride = round_up(fb->width, 128);
 			y_tile_width = 32;
 
-			sclines = MSM_MEDIA_ALIGN(fb->height, 32);
+			sclines = round_up(fb->height, 32);
 			y_tile_height = 8;
 		}
 
 		layout->plane_pitch[0] = stride;
-		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
+		layout->plane_size[0] = round_up(layout->plane_pitch[0] *
 			sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
 		layout->plane_pitch[1] = stride;
-		layout->plane_size[1] = MSM_MEDIA_ALIGN(layout->plane_pitch[1] *
+		layout->plane_size[1] = round_up(layout->plane_pitch[1] *
 			sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
 		if (!meta)
 			return 0;
 
-		y_meta_stride = MSM_MEDIA_ROUNDUP(fb->width, y_tile_width);
-		layout->plane_pitch[2] = MSM_MEDIA_ALIGN(y_meta_stride, 64);
+		y_meta_stride = DIV_ROUND_UP(fb->width, y_tile_width);
+		layout->plane_pitch[2] = round_up(y_meta_stride, 64);
 
-		y_meta_scanlines = MSM_MEDIA_ROUNDUP(fb->height, y_tile_height);
-		y_meta_scanlines = MSM_MEDIA_ALIGN(y_meta_scanlines, 16);
-		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
+		y_meta_scanlines = DIV_ROUND_UP(fb->height, y_tile_height);
+		y_meta_scanlines = round_up(y_meta_scanlines, 16);
+		layout->plane_size[2] = round_up(layout->plane_pitch[2] *
 			y_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
-		uv_meta_stride = MSM_MEDIA_ROUNDUP((fb->width+1)>>1, y_tile_width / 2);
-		layout->plane_pitch[3] = MSM_MEDIA_ALIGN(uv_meta_stride, 64);
+		uv_meta_stride = DIV_ROUND_UP((fb->width+1)>>1, y_tile_width / 2);
+		layout->plane_pitch[3] = round_up(uv_meta_stride, 64);
 
-		uv_meta_scanlines = MSM_MEDIA_ROUNDUP((fb->height+1)>>1, y_tile_height);
-		uv_meta_scanlines = MSM_MEDIA_ALIGN(uv_meta_scanlines, 16);
-		layout->plane_size[3] = MSM_MEDIA_ALIGN(layout->plane_pitch[3] *
+		uv_meta_scanlines = DIV_ROUND_UP((fb->height+1)>>1, y_tile_height);
+		uv_meta_scanlines = round_up(uv_meta_scanlines, 16);
+		layout->plane_size[3] = round_up(layout->plane_pitch[3] *
 			uv_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 	} else {
 		unsigned int rgb_scanlines, rgb_meta_scanlines, rgb_meta_stride;
 
-		layout->plane_pitch[0] = MSM_MEDIA_ALIGN(fb->width * fmt->bpp, 256);
-		rgb_scanlines = MSM_MEDIA_ALIGN(fb->height, 16);
-		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
+		layout->plane_pitch[0] = round_up(fb->width * fmt->bpp, 256);
+		rgb_scanlines = round_up(fb->height, 16);
+		layout->plane_size[0] = round_up(layout->plane_pitch[0] *
 			rgb_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
 		if (!meta)
@@ -136,13 +127,13 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		/* uAPI leaves plane[1] empty and plane[2] as meta */
 		layout->num_planes += 1;
 
-		rgb_meta_stride = MSM_MEDIA_ROUNDUP(fb->width, 16);
-		layout->plane_pitch[2] = MSM_MEDIA_ALIGN(rgb_meta_stride, 64);
+		rgb_meta_stride = DIV_ROUND_UP(fb->width, 16);
+		layout->plane_pitch[2] = round_up(rgb_meta_stride, 64);
 
-		rgb_meta_scanlines = MSM_MEDIA_ROUNDUP(fb->height, 4);
-		rgb_meta_scanlines = MSM_MEDIA_ALIGN(rgb_meta_scanlines, 16);
+		rgb_meta_scanlines = DIV_ROUND_UP(fb->height, 4);
+		rgb_meta_scanlines = round_up(rgb_meta_scanlines, 16);
 
-		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
+		layout->plane_size[2] = round_up(layout->plane_pitch[2] *
 			rgb_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 	}
 

-- 
2.47.3


