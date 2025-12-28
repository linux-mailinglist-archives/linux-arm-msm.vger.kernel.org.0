Return-Path: <linux-arm-msm+bounces-86704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E654CE48E7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 04:57:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BA3D3021E72
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 03:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52AF62264CD;
	Sun, 28 Dec 2025 03:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GuAd5r28";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UAReCGun"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B3E224B0E
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 03:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766894244; cv=none; b=tVm1ik5wHmULq7ZHyMWW7nfmqIf4Kh7er0qP+1gRkmuCCbr3dKI1MEM5lgFQ3wmn1xSJ0+I2cIlb1EdlcmAfaJCQHLQRzxmxBf6ZGL5qfP8O9o85VIqG+GIgwh5QABl6/TISbBa21dHSc0le14YrCh/0qVvaNIn+cxYTOdiarGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766894244; c=relaxed/simple;
	bh=nloIX6bfFgnfKkBDQaQKSK9yrf/yRRaqYF/Oj4r6sFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NPPmNcCZDEhyjxA2n+5AcAGG8dfERpFQFyu+GgnCb6AL3ANmQbXyXTONH3GJc/JeL7b+UIYlGfgoAaHuDg+k/WJnrViWh7pIuJtYfBygz6V+lXzT5WdpWW/EPHqmVV8FcF6/pTINxVxkc0R5r74hX9NX+jjihAM5+ZVq0ZHKcOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GuAd5r28; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UAReCGun; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BS3kmVF1812290
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 03:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7IWCWQHb5RZkH9xPpsD5CAr5iVUdZiuMhuEQ/RcAPNY=; b=GuAd5r28QY77yb3s
	8V/AZqxx4rWD482/eY3fosQ6GdAWaoqA0y/3gI2uJN7Xqyq61EzY7h0GQt6Vrkh+
	RAqC4ehcg0ZrdMuUGq8Q/CE4IsGbLDvM1qLbkzlLV9ifYCrSBVKiDLH01MTv3lcA
	1u9KjyARtHWmAK9l7GdTY4OVhHhjDfawBfV0i72btbgZemvHFKgutjMwKJNCHudz
	TQ3KjFZIAbipTja+yLCJDokPl/SZo14laKew77HNtAGktjvaCeeRs++hmXLPHJ6K
	BrHl/E3jKGOPqhRDuF0Tz34S6dGtjWYWUjxsVfJmzY4kknmC1l3X7525fVCIeME9
	bxzJqQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba87bsksk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 03:57:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed82af96faso172366811cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 19:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766894241; x=1767499041; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7IWCWQHb5RZkH9xPpsD5CAr5iVUdZiuMhuEQ/RcAPNY=;
        b=UAReCGunPk1+j5fQQTl71x1Fu9Ycw2EmoMIbO3XiNx3VsKCNJOCXWgtnbroXdZCOw5
         jflzWYSrSGcb9dcjuyQFED1VbKJlYKXinNk1tNxMzmu7fznfm0sTSaACFZmpsGiSMrav
         eySk7RE5o8L+8Llsa6REWCiVGA8vF9KjK2a3HJPPDR4mqdTvxnIFW0Vey4VSKVSQTTKe
         b4u1lCD2G1QNprjBwu6yOcYMZSSJxrguidMpEW1E6QNasmzXrB7HvTISaSjqss+45gYH
         wc8mmn80tyu3+4ksHAYegp4wkP/4P62O2FxXJQsHK7Cppiwsa2Lhb09BjiCrYf3hv3N5
         Jlog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766894241; x=1767499041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7IWCWQHb5RZkH9xPpsD5CAr5iVUdZiuMhuEQ/RcAPNY=;
        b=RY/mt8RS8j0QAG9ANeV3UCoEneYHC24AGWdeGcx+PvKctGs66M036hXYkowfy31jzQ
         PS803eZ2OTU3cUWpbIwtZvZUEbCjGUMkqXYoo2zZM5tykqTZBtdp2MIHKS0n+SXTuM+4
         CMCgaup1iX6Mg2PUCMrFffC3QDfGAnTMboZZs/DWSn8CYcYNw2A9w8f4HJIQ3wmZyB6R
         P1p/Ykl55wP2nZQF4GoQRMr0Mm6oCE0jKOKqamZLUDgPd5iONirxRX+KxNyrp2uuegr7
         KIbVK+xTatYaxqb0rjP5puUdPMGjT4hSxz24wTSwjzVRibyzpInyh0TFzXjo/m5eJwwS
         AtIQ==
X-Gm-Message-State: AOJu0YxexL4SkziFW1FFjHFRMFdxwQZ/mMoMev3ntoebWAzNQWhS2GFj
	g0ptwYv/YHugo4tOcSsmheaVrwFWSVW+zplrXcfKibu3aBczzE4ClI8HduEGnyU7dadgLYLKB6H
	vk97ylTSuz5/Eh/BGGlDxAmxOhSJBA9Gs8InRJsmEUJAvqBYSPYL+MPAs3kAOlpUBCKPI
X-Gm-Gg: AY/fxX5WeLacO5SANlhcaJeWxKu0D44P0X5D8j0o9TcYlP9U0O0IfzXtOBrrgbzHoTF
	BMxaCrpu523LLR384qJYiA8WbutHbeA7FFKzVVLNFJFfQ4uId8el8AgjZ5JjBohy0YSxz0Qsxva
	jivO3oAiMeVbKrRj7dBMFxWe2ueIOrp32m6mUk7hC4/wRFzRImfoIB+KaCcxnoeB33gmkiI6quV
	XZrNTohCFndBNTFj7ECUzEuewyVBftDx6ZrQW8NRqaaAv/qFyjjQCXBuXQhXajFt6C/YZ9ND2Rw
	LZL39o1Zbf7hb6ieAyP1Bo3EzfEs+CL6SOcXvyqlb7TqKAVFwosxXaKR0xlBlgFlWp2IDhlnphV
	KILsrTLwxPVSg9Otyd7Gq3SImGla3YGTeDFJa40ylmwNBYwRTcolY4AhW1E3OKaCQGnH4rGQSiF
	eUogGvMRzX4L2CpZOnA5pHrbo=
X-Received: by 2002:ac8:5c81:0:b0:4ed:44a7:cf78 with SMTP id d75a77b69052e-4f4abcfc08cmr396663851cf.34.1766894240820;
        Sat, 27 Dec 2025 19:57:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRihI+vGoLHGy0rBYtNyQv+twoT5KQuP6H/KycbAeGtt5Su5YGLmHR7bgCPc9BpExprx3wEg==
X-Received: by 2002:ac8:5c81:0:b0:4ed:44a7:cf78 with SMTP id d75a77b69052e-4f4abcfc08cmr396663731cf.34.1766894240432;
        Sat, 27 Dec 2025 19:57:20 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5d37sm7883586e87.7.2025.12.27.19.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 19:57:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 05:57:11 +0200
Subject: [PATCH v5 1/2] drm/msm/dpu: Set vsync source irrespective of mdp
 top support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-intf-fix-wd-v5-1-f6fce628e6f2@oss.qualcomm.com>
References: <20251228-intf-fix-wd-v5-0-f6fce628e6f2@oss.qualcomm.com>
In-Reply-To: <20251228-intf-fix-wd-v5-0-f6fce628e6f2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Teguh Sobirin <teguh@sobir.in>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2331;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=s/p//pRO52a+gehzMR/sFVop1oTXxVfxhzjK9LP7fJQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUKqaQcCnxzpAERYuI1BkP4lP7s4Y8SjZQWi9c
 iJnaxelohCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVCqmgAKCRCLPIo+Aiko
 1TXZB/0eNQwsLafwu3hdu9ZMr78lj7pdHE9t8stem2p/yTVUxVfIVEuM52t9jHqqgVRViVJ5MwU
 gqO/ovI+BWvkHZH6NUPsGLz0cNqRTMEZKwh0qy7umCa1NAkWUGq+k8tHHxOtyXWF1CP/2C5vGT7
 NFlTKK3Ffv7KRBLSFkto20diOUTY2IGLaR5iATRcmkreFGfUui/QON1Ua5bwqnXMT4A7mlVq/Gn
 q/zysNMTd+1qlK7bbl9kJtMXVyZ73cxVppHi/jvfosWIyDlUD4VUMnahBxJOjWW3wK93044vhSB
 j+a4lwzvp+m26J3mNsx1vSeArw/QjlXcaEDN5bWeuyMT9Die
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: eqepgUomrr42G6MFsJmAIdJLir6z3T6B
X-Proofpoint-GUID: eqepgUomrr42G6MFsJmAIdJLir6z3T6B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDAzMyBTYWx0ZWRfX0E4Y6thYjUJk
 chv8SWNwFezhJ7NcxaRzB5eOwODEUC/hYUeXniZVzSm5Orkxl12FPmy5pmATC0pM3n2x7E7CTY0
 dd9DRggApXDDEvks5sgm5CrsE9oKojeiAyw/xQ/I7pVycGQ7CK+iBKkOBuJVoYw9EZZJ+RNuoQj
 /g3AFqCrrOqtbriijNm9K5wue96A5aiAHA0Nv2hkPonaIQzCvLUhSk5vjS+PH4o6N3ha4XqxLeW
 tir6wkG38352+hr2RVswWN5pMrKz3OKaZBGY/G3PGT3n9UA+ST9p+t27MCFb4BpMaCnt9xzo4pz
 m4l/FRsIOI4A699hNPyVFaOhLfN1Z9x00p+V5euLGfAB8r23rsjtf6oJ5ZelrmoUBfKQIWczlLz
 yAUHbm8vO0SWoMOrS01mE2/+QZJOKzeZiV3E4KzuncbAtYHEWUNfHFO9WyKsFoCBL3hmBUu0pXE
 OC5x8K74JC99J5RBuAA==
X-Authority-Analysis: v=2.4 cv=do7Wylg4 c=1 sm=1 tr=0 ts=6950aaa1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=tVI0ZWmoAAAA:8 a=EUspDBNiAAAA:8 a=JyrEbUn3yN3s6GbRLFEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280033

From: Teguh Sobirin <teguh@sobir.in>

Since DPU 5.x the vsync source TE setup is split between MDP TOP and
INTF blocks. Currently all code to setup vsync_source is only executed
if MDP TOP implements the setup_vsync_source() callback. However on
DPU >= 8.x this callback is not implemented, making DPU driver skip all
vsync setup. Move the INTF part out of this condition, letting DPU
driver to setup TE vsync selection on all new DPU devices.

Signed-off-by: Teguh Sobirin <teguh@sobir.in>
Fixes: 2f69e5458447 ("drm/msm/dpu: skip watchdog timer programming through TOP on >= SM8450")
[DB: restored top->ops.setup_vsync_source call]
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d1cfe81a3373..3921c15aee98 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -774,6 +774,8 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 		return;
 	}
 
+	vsync_cfg.vsync_source = disp_info->vsync_source;
+
 	if (hw_mdptop->ops.setup_vsync_source) {
 		for (i = 0; i < dpu_enc->num_phys_encs; i++)
 			vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
@@ -781,17 +783,15 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 		vsync_cfg.pp_count = dpu_enc->num_phys_encs;
 		vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);
 
-		vsync_cfg.vsync_source = disp_info->vsync_source;
-
 		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
+	}
 
-		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-			phys_enc = dpu_enc->phys_encs[i];
+	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
+		phys_enc = dpu_enc->phys_encs[i];
 
-			if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
-				phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
-						vsync_cfg.vsync_source);
-		}
+		if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
+			phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
+							 vsync_cfg.vsync_source);
 	}
 }
 

-- 
2.47.3


