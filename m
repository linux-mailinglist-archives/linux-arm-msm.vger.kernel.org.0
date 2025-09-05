Return-Path: <linux-arm-msm+bounces-72162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E9CB44AF1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 02:41:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 664F13ADA47
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 00:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319CC217F53;
	Fri,  5 Sep 2025 00:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmoBVaOW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2C621883F
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 00:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757032755; cv=none; b=f5rzl6bK75e9w3QrVZ17ztJYPR6KBmkFureYnRaGVIxRnQ7FHaVz2lMpC/dhQVcNs8lS/kFGTGftiYD0qZUJ1fc8RDE9agjiMLv8VM1AbobGMcOPN3/zMR2lZ3cx0AfhS/R29BNL48QieV6k420pdOfScpge7PDlEVt+imtAYpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757032755; c=relaxed/simple;
	bh=lGlOq21wJXxPf5qd4HfAzqrvugD2QrjsunL1xmnHE9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=okWzBFKJJPv6IbS/XyRJQ/NWflXhSFxdpTOozaXdUAuLynf0rJSp1X4qy1K8Vez8LxsUrMUufSYq0zgMyqeO3tvD8/JykVUGSEipw5UAyo0ecSpJB54tOY14ZGme69zkfdmLYr5nyhX588NrXpqSabFDSnkMtwfqLs/00IDM/sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CmoBVaOW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IiOfP022986
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 00:39:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ra9GluSXfhMlHZ2ACIpc5GR7mvUKtMwIaWiKkZbOwVY=; b=CmoBVaOWsvaUWwyX
	Ur0wrPYC4AipxzjvoRExW9VbSJbovPTvzHSiLANjH9GfjItEI7AMThPxYCQXYAVy
	fO4OeGNM256nexMaYz5FwBgkT9eMGfY43rBLXI8Bky4gE7SqTlstmsDfR0Czj4EO
	Yr9Ea/RoEnFZQwFf4emVkwioo7G28a7E9UuoPE32+gaHD/Rka4Gx5S/8wTQEm07Y
	W09GeMAteG5p1ekvPmh47z5xiA5m2Jr3kKeJP6tWqpWVXed8F657ZPOpvsoAKNL7
	tfrSul9fTu3NIsI58o9N3gI5D5usDNuYjduGLOjQMsjrkTOkE/+2l9uEUX75HgHX
	lhchtA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0esedj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 00:39:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b35083d560so34818201cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 17:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757032751; x=1757637551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ra9GluSXfhMlHZ2ACIpc5GR7mvUKtMwIaWiKkZbOwVY=;
        b=iaxfUFE2yo2ZIOUgqG+34nabPy14tPHd8dw499qzbpQec9VfXqaBcy++y+h9mmWOli
         gJElRDUcfy2/b7sd5TxDTGLhlDRNX3ZlBIZFnHU4Rpf0cSzPW5/gK9aRVd1kgdmAJVmB
         uH13c9AcNU/zQBQmozzgsS/2W46DzFp2FYDEoZCDT9vgRWJgDKC+WrqIePgHIAegOwDd
         TorYT8eN/ec3+uTw9El81FHUVSm9iFw5G3lx3T9F5f9V5Xy1w09WTOityf0Fy9j5xDQM
         7yuDDU3tu2Qb+2pbpDUALolDgWgH+3JzVNLg0wV3Ixmzp0F2fwCnNkbZCcmjXVS0rv4+
         /EQA==
X-Gm-Message-State: AOJu0YxSL7aDETi30eMJ2Wew+kbB6azVN1Hxz2c+r9UB5nj/DgJejXCU
	Erhc/DCYfSkNZ8aX0UroQZw6FMLAa6mtZrisP1fmd7WSWXrKfhuN6MaeUjB2tNhB+QGCqK1s1G9
	LhY0o3t6X54vZxCSWnEnCJ6wfRr77xP3xMPq9mRjGPhe5MjU82c4W5s8Dt63VCbIeAwLX
X-Gm-Gg: ASbGncs8U1WW6Gh7IXOWnSfbjUn2uhKLFCLjA+3dDSP5hsp9Vcaz/25tO9YOqQcbSte
	2swkjd4O2jF6xuk52R6AN0C50NoGMIKEe4gv0VtZXLvJ1uaUNtumU+pP0yv8DgVaHEcGfqpWITu
	7o4UmWIlJduAn9MMRlsBEX5R+e3aANjiBF6qoO5xu+mLc02fNa1UsMJihuZVr2eaUd6DQoJy/tF
	/G7fXcpZFKuHay/PQKQ8XfHmOOHELbwYNBX9k/+mxYPiAhUbGC7RspWUVT9xXVUiKeqZ+Ug1ZMP
	G3B+7igi5cfiwW1k7nuDek8Fg+X4ujTL0taXFdG4We5M+IR8HO7J6Rm8BLy/kOTsdmGmZK8a3eM
	KVyDUpJUNhGkBWDwxMl9pXywtCGUT+WwXyts+hgO5fzbDtry74JX7
X-Received: by 2002:a05:622a:4207:b0:4af:1535:6b53 with SMTP id d75a77b69052e-4b31da3b2a0mr222826071cf.54.1757032751059;
        Thu, 04 Sep 2025 17:39:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGS3wnGT8ACgxrTqpQD8+qzTZ6t5n5H43QqgEg9VQB/rUpomSgmUzUzHoGTcB143SkCSuf93g==
X-Received: by 2002:a05:622a:4207:b0:4af:1535:6b53 with SMTP id d75a77b69052e-4b31da3b2a0mr222825811cf.54.1757032750618;
        Thu, 04 Sep 2025 17:39:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfd938sm1510059e87.109.2025.09.04.17.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 17:39:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 05 Sep 2025 03:38:41 +0300
Subject: [PATCH v2 12/12] drm/msm/dpu: use standard functions in
 _dpu_format_populate_plane_sizes_ubwc()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-dpu-formats-v2-12-7a674028c048@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5431;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lGlOq21wJXxPf5qd4HfAzqrvugD2QrjsunL1xmnHE9s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoujEKK92PZaXMEwacZH5/xSig59AgXXb3CmkPc
 fjelgfuBvKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLoxCgAKCRCLPIo+Aiko
 1TJbB/4r1O0t6fCeOk0Vjk5icw3t2tBKMN1g91Yubw5n3bIrgtCaaAj4eaBV0LGNLTrZQusxc2K
 Hw4mgODdktXjaQGdz3iQhL0wJyVXyQ19phnBcb6Y19aHwqZiiwqZ6JjfY6wgtBTZUYTgR9VzrL4
 TOkX8fsQmUcnphqOBgw7Hxn8/Sf7bBt6XRCQom6nKnZL+T9CMPCgl6cw7wVQy24Cbkwl8HArcL9
 vStylSVaxxlS+ykE/3IIxofD1eC262/fLFak/ohr8oKogkQ8P5GQsRetJ1lx9I8PIdFfc9BcQOj
 zhu4MFrmQ7SLnRgwqs10szN6IRd66kqr5s+ES0wJ4yW8eRSE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: NEW0_r82UNmX_esBsGWqQAZV6WA5Svs_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfXzfrfApsO6x5T
 VC+hvIFMME7iHdBesTIm88R+eVx6is1Iu+DuLO/hytmB/pDx6CZvbJ8fLae31Xb3jEm/2olb1zS
 RCUrrpmgSS2HNkkLJTtTuuMgKlB+mtffAlSHlC8dB6B4liEYW42+bsKNu8YVQBplS24cPD65evz
 0bp/7k8uJ9zdbaZzov9wYsdlR7CSJH2luUKR+aTJPgS7Zmk2YIr8uDnN5C8Sc3t5uSSzwws/vn8
 w57Q0bFQBFvQFjNVGOhd6kwb3Gw3Gn5SYirehpBW7WlRRif1CnHzBBfNcCvAY9+fYiZnyJZmAPh
 PriOm6k4w03Ga8qYIziYRHuzh59OaZZpawP/zmZGwWl0TBHCVhA6mbhDZGdoloRR30ha9dnxUZQ
 NUfbnl3M
X-Proofpoint-ORIG-GUID: NEW0_r82UNmX_esBsGWqQAZV6WA5Svs_
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68ba3130 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7bqH7Blup1pqkekdm3wA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

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
2.47.2


