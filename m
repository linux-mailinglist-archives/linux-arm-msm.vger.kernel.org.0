Return-Path: <linux-arm-msm+bounces-88438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D92D4D10792
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 04:25:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50579309566A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 03:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0238930BF52;
	Mon, 12 Jan 2026 03:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lwg672vS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="itG3q5c9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6261D30B521
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768188222; cv=none; b=NM/f/LHWwmgw85dUOdD1S9XQw5XJN7TK05K5VgQhYemKDEfXYY/bc9tzawhjLSsJ6TdWnmQwulVebP/r1iZ/XJr5E1ZYdep0NHYvQ8y+IHcD5GdihlTXSRC4snqmrCuY3iNQn4uc+IOWATW9d0sD5pmktgvvIWZxZv4TxODe5us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768188222; c=relaxed/simple;
	bh=QdHxLyA4MAw7riR6PM0xKlPVvxw0TXT2b0nWTc5++jY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OeimoEk8ctGg6QyljxN8UZXVUAa0bUL3wdFS7etggHoW5kFQowGebvgozWYpGjKeUhykekFROg0bTAIqRJ9nCZeunsTldQO8L+nK1jfczytmUD1tZycqfO3ZeClRXZKb96RojKT9lBIiXZ1L+DwGxbiLfOVuwSX/SnzBplwVMB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lwg672vS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=itG3q5c9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BNmALO053127
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G+cnGkDkA8WzUyjFVNfSWrAEgKHPi+4A7R90Xdwa2IE=; b=lwg672vSfuiYiMRu
	gr2kq5uFAF5RopeOXYItZdoSz4shghVmetHZll12uPQsZj5AhT9wBMDq6J80vSaK
	2Xtztv2OoqurgKHlQmi/tU71IkGg6DWwjG6Jloj8tAtHOO4WbTA39gK6m4PMwcgY
	30e0aFi8TSyuI6liEZ5m0pvOFX0pMU3HXogbb+fEeGTUYqLLaB2iJ1MWaqrgsADx
	3AoKZImh2hSsVU6FWXclsG7tLgMQRx0utCtoehnA61vMeQdnXxRQ/UqwOShlVuvM
	CPeK1nyg/BSZO0p0lKol3XS0I1XhQdpHBelpqD33FNBcoQ0Ictcdw5IWZSAmzu3V
	UUYZ5w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkebu3d83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:23:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b17194d321so887171485a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 19:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768188220; x=1768793020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+cnGkDkA8WzUyjFVNfSWrAEgKHPi+4A7R90Xdwa2IE=;
        b=itG3q5c93iU8QZUX466wNrZe6V3DpMwgU5ZHTIb4dNEAIVjVH92aHQXqaUgcQ3i+aA
         wzpv2oTU4cvR/TqEQzBgrTQtryb9l5K7VFpMFvG2mzUKtrKRkcChTE/mE5PPevR9K5wR
         9CzKU1F9w1onbGHvj1LzO2SD6Sg0q9vcyc3X9TVNrrxZrnqvBgT4BfNFhh0jp4ykLXCz
         n7rxnTOzgqq0d45nt81p3aQdtKXZcNhZugruwRx0pUcn54opFh3HBB/uy8jRSE1pzy+U
         32TAHaUIwLqtCNSfPGdPqa1x9VPLDjlyBJ5Vhaf7Y/m+eIYFt30P3fW9qVPB5tMewUj8
         La8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768188220; x=1768793020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G+cnGkDkA8WzUyjFVNfSWrAEgKHPi+4A7R90Xdwa2IE=;
        b=UQ1vlO39wq+9jfY2F7Y89r/9SEqrYvt0ujyOimk4G6QaSyGbXIuMZ6tg/hLe3SHIzx
         Hk3k3/pM9pVXis5mvukDUbkgTbXjCKzJiwTpH5hxRC0/y3rbJX2qsqv1GbDDhMhQftOw
         S9bP++f9D7vr2UTSom193TPeTApPAJm3Hmv3xv9ar4wkIpzsgUfhllXAJkjCGKG4iM+E
         RC2MOTqBZeO9U4Ied7fmPOP1VRzNqj5kSSVXw8UUxXmb6s7Zd1jHK3VkEt9UQshMb6Ey
         ffFote7x4M4qRyvHGnFDgAIsnw0/Wf0HDAcYERnP0nm4rJFhRgwotUah4Eo8z0QvNKEa
         V9JQ==
X-Gm-Message-State: AOJu0YxbqLRb2TG/A6Sks+nkGD2GnBxgdnKPlLWUZGopl3t51VocKhbn
	iJ+6dbDWMnvNT1Le8Y/169OZDluxO/o58w3DxmgEPeBm2dkahnJ4CVHrv8fBxK0LkIzTUz/Z6i7
	Vd+HWJO+eW57p49/OEaZsL8Me6Y+PKhs8lZLVlvvtzUrm4DvEXs/wgYt5Dy6qSKOhWUu6
X-Gm-Gg: AY/fxX5ZZIlyop4GX733XjgFw9BvTzbW03rDCEtQBAaO9GYP2FbUYQenP+33a7c/mSu
	W+1gburmHpf/WYadoHIdCV0AR27BHRPCwWBHzhVXOtOBjAaW9QMYiAZd4jMmg9ymNw07lUHlQup
	VpSmoJdCLdaDhQZSEVFByBpgGTy/zcDpv7Zy+ph6qVPOQJTtangLN+r82M1NheX/F2YS6UkA3FS
	VSms1bvxTLay5SRhsVx9mD5rPBg6AS0apXF64GrgN2vtBAq8oVhrBUr4+Eb5OvmAiUNXlXfeaGJ
	/OdKfd7sJc74mFysIcahfpNRjSLR843DEpfPpvTbibSkHbXO8FlCMq4VbOEwPqrvY12suGoKgBm
	abH9B3IFha+yInV6sqs5NqWAeXe1CIboge2khxbStN8+s8ux9jg0xox2UOzsJ5sPjYTTYRZ9BNh
	TWOqpGch1IlOIhWOETiNdtmlI=
X-Received: by 2002:a05:620a:2589:b0:8b5:9f70:d4e0 with SMTP id af79cd13be357-8c38940c03bmr2295579085a.88.1768188219714;
        Sun, 11 Jan 2026 19:23:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhRYqINNGiilfJktGY1a3QidR9dZtC/TGNBRD3m0CpeK0zV5Tl0mD40AXvWvDl2toWpsPckw==
X-Received: by 2002:a05:620a:2589:b0:8b5:9f70:d4e0 with SMTP id af79cd13be357-8c38940c03bmr2295577285a.88.1768188219218;
        Sun, 11 Jan 2026 19:23:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b7c2dd9e2sm2373045e87.5.2026.01.11.19.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 19:23:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 05:23:30 +0200
Subject: [PATCH v2 1/2] drm/msm/dpu: simplify bg_alpha selection
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-dpu-rework-alpha-v2-1-d168785911d5@oss.qualcomm.com>
References: <20260112-dpu-rework-alpha-v2-0-d168785911d5@oss.qualcomm.com>
In-Reply-To: <20260112-dpu-rework-alpha-v2-0-d168785911d5@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1783;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QdHxLyA4MAw7riR6PM0xKlPVvxw0TXT2b0nWTc5++jY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZGkzRM0sbLWl/Sv3hK/B492DWbzsS2z/RVzMV
 Pt3sacXROCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWRpMwAKCRCLPIo+Aiko
 1VqbCACqZm08A4ACCAUYVTnkoETDGW8vofWybnMFbT+1GE0TZiAs9TkKY1QOmm/hepBjr1PoAI3
 UlRiO1onsgw1QiP2IpZ53+A3Dw5JJB3giv6YQP0BtvqqgfUx01cNJuoGETeLm3BTpN/Xqj6+WGx
 bY4UMQb60xX5r+YB9x+CzeX+hhQmhSdA+okoGJKZiu5vLBkJ8dHQ6OHLPeycOyYrKHhIq/jtcXM
 hQCXEEqGGhjdBTh5bor2BfnliWZUlM/VlnfEXW5RqsvG8squDUJMplD2rp0FwHU5m31iCm2yGIv
 pR+KtN86n2MfAg1lXacJGKqff2JiynRnBdITNp9QypuuIn/R
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: zFBH6Q067hYoLhXX-KgmHVW64i_PsJCF
X-Proofpoint-ORIG-GUID: zFBH6Q067hYoLhXX-KgmHVW64i_PsJCF
X-Authority-Analysis: v=2.4 cv=LeYxKzfi c=1 sm=1 tr=0 ts=6964693c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ID75BBqnTVE1V_rUnp8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAyNiBTYWx0ZWRfX3dajEmuQakL+
 f7DnGi5uJvHzP4xXqb7Yj9LFdnPVQN4j+hWZdVoBbvh/PPbda1I5jjm9MhEG/gCn+khx40nAlKD
 5PzFPu+xgEJDKQTPKTOY+K2Hq+8rHj0zVgcZ+udLpRkhosiLywxTg4vtm4wDSYla/0UFSGJiTYG
 ydtQi6g+1z3luvkZgCBpJzsQL9yLefawuqXERraEOh3zDDGQiWrn3VYEmoHAJlue/mKGCt83Zlv
 7szkwlQSBHnuLgOZpDvr0g4uV93A9dm5xsRCOhRYUi3eJJ+zqUpD5RfswbDIlP0Eu7OZWrqnI14
 qvELqxm7Tysd4T6P1GhjZZNYl44I1lYmW5XCGL5Z4dwYLlGxIpshHo+r2qrzv9s5PHf2Lq41cit
 ONm1MCVpXPkECRLueLykT3Ry5kKQUtb1pk3onj5YQ7PI8+35ro0QCGvqIV9oZ/2F0cx3FDr2DRD
 o25Tyd+gwnufT1o7p+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120026

In order to be more obvious in fg_alpha / bg_alpha handling during the
blending programming drop the default setting for background alpha value
and set it explicitly in all cases.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 2d06c950e814..f6827ed71f4e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -335,13 +335,13 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 		max_alpha = 0x3ff;
 		fg_alpha = pstate->base.alpha >> 6;
 	}
-	bg_alpha = max_alpha - fg_alpha;
 
 	/* default to opaque blending */
 	if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
 	    !format->alpha_enable) {
 		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
 			DPU_BLEND_BG_ALPHA_BG_CONST;
+		bg_alpha = max_alpha - fg_alpha;
 	} else if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI) {
 		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
 			DPU_BLEND_BG_ALPHA_FG_PIXEL;
@@ -350,6 +350,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 			blend_op |= DPU_BLEND_BG_MOD_ALPHA |
 				    DPU_BLEND_BG_INV_MOD_ALPHA;
 		} else {
+			bg_alpha = 0;
 			blend_op |= DPU_BLEND_BG_INV_ALPHA;
 		}
 	} else {
@@ -363,6 +364,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 				    DPU_BLEND_BG_MOD_ALPHA |
 				    DPU_BLEND_BG_INV_MOD_ALPHA;
 		} else {
+			bg_alpha = 0;
 			blend_op |= DPU_BLEND_BG_INV_ALPHA;
 		}
 	}

-- 
2.47.3


