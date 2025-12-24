Return-Path: <linux-arm-msm+bounces-86586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BA8CDCB90
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 16:37:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD9523007FCB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 15:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 339E72DE6E3;
	Wed, 24 Dec 2025 15:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qfl/h3JJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UlKNlLgB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263932DAFD7
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 15:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766590440; cv=none; b=RCB6HePD8IAf/17/tCZnca+rVhU9iSInAOXXt9jxGatHvGp6a9nhEuj0xn1S5TQx9x1+OOWeVE74g9+xH7wmtz+aZzcC9+v6z1VKVJNlB8Uoux0oFNTbtFg5OnBwisz0zmMvLCwFbcptAD5pwHx3XIoT2NaO2YcSTRPyIFGTJ0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766590440; c=relaxed/simple;
	bh=XDu3x/fz3j/EqwkfCDIEgsrsKANsbjOIHcvu1Rq/Vig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bY1MECSTkrFwjVglAPoLM5H9/b3F309GuKkyhJXn38Qh+EZrrKAIvgFwp+GE2L7t0JubsGFal74wSTPQl9/jYMcxnM46BzF8mbe5wwVLRgqQNuNAbcfh4O5vf9B8QwWw5GYBkHp+HODH2vZBWSRZHFWJDSTN54rKq+pHovVbxCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qfl/h3JJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UlKNlLgB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO7s2rx1056227
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 15:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fPAB3lyJE+/otMlNhYYLlA2GvBK65FIoSyAVZliZqgU=; b=Qfl/h3JJ70TLkeCp
	qQFe9PUtZtTGcE7hRkyAvxnHNBT/mtAdMb9pEuWhn3Gj1Hc1ILQEc3cA+HC10fqZ
	3A/4QUVfiUxdx4HDGhWcJCZ92MBiL9Hi4c9S4oTt2mOt0HW6ELDwt9+MkV4I+COb
	R/8MoIIHhx8KsO0438RVTLgNOsKrHMMPRL7QQ6UNeSMyMTtM7zLu1aahpO76xBBB
	+xmMKKvwLISCktPlH+17A0Q6456JitR3L6VU1l7ehcFsva3ZUiBgXTKq3kPkB5QI
	Hy5ajt22mA9csYkv6yaFgJ206pECOdzwFh85RMqIgKhpLfMpDl/clqkz35kyQxtH
	+uVJkg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v2tav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 15:33:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee1b7293e7so208830381cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 07:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766590433; x=1767195233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPAB3lyJE+/otMlNhYYLlA2GvBK65FIoSyAVZliZqgU=;
        b=UlKNlLgBY1FuZbM6UfJw5HRLMfwZ3doSBJKl7JCw8LuRLoPVoWPV/jOtjCcm8+JHrk
         uDEgUnR1GCcC5m8244c4RZeIB98bgGfbhJapBWTYN3AbFe/IBN0gDsZvQMnQ6ye998Ch
         lTxHkh1u67G1VH6pmJwf1qZ4pAXjB+VlZAvXIn8I99bTd+9IjJ5CAvkB8mRST7TAwZcj
         CiGbaQuoG7Y2UUjyZKwol3ofYkKWlFO2jenRxQFNO7+nxcyKJIy3TgpQKGqm6Vtrt6qM
         vZVrWXtYlJSsY9lxaFIGP5jAb9j2mmjZBNYZdeSUy9O0JoOPZRQRLtv0LtxmnKW1Csyx
         p/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766590433; x=1767195233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fPAB3lyJE+/otMlNhYYLlA2GvBK65FIoSyAVZliZqgU=;
        b=nm6aKL0W7LBZ28kn5XgCwJ+4dyNZTEC9ia/2ysREpZFPEVvsc+8jWq4zOY8heLuXCN
         SyMpizC0OVt5bNZ+dmE+D38SoveNWfgWzhqM4squABZHPnpggSVne/pZBsMauK4pFE+/
         RFAw7fNavgabEF2AlufCwKWKA+5ujvwHVAjHCrNq3QpFxK1aeL7xqmhXkkNlVse+D5U8
         EuOcYLkA1X3fveuUNwH9I4N54HsTxg6bPclksXiKS/BIQSTJQVmG33YQntjib/xGE54x
         /QPeBFceRkWVUjqPFG/0pDvEFFIoNXQ2qpAVhDM+DfrY9WJ+Z6PprvOWUxRChgZODUqZ
         fQAw==
X-Gm-Message-State: AOJu0YzFZ9tGhozaYbqHHyTaCXT2yhKtsQ9o0TIZWLnaNMxwGSkWFz+Y
	+PXkpP8NTApCakPPDyY2BY6rq3ZVt95EhPNdMb2L+L10b9E2sk0LdECLfkxAQ5GvG4DQK427BSt
	KpczaGyhbLTKOz2LkFzfHnE7XOpeXKyM6JUdJZIELO3i9NPI7EkmMT7FPC7pG9oV4Sq8lOE4cgR
	gQ
X-Gm-Gg: AY/fxX6DjCpR5oz8yrHZKH60GXfO7Q0J13BPcdS4Hf8tiXu5BwW/xdRsk075bTRGv6h
	KfLWTQxFnWdhaq6Qz6UxgKKzXCWdot9IzY/1Gar6DkJr9PEHIH8nAweb+IM5OVnfopCCpSu9yW0
	Z57TyRteR4609yfy33bWNQuaCSdykbQs8ryVJhdvKyv9k/6CcBtyq4Eu66HRWZ290QJHT/ZZrMu
	VJa2a+cnCd2n3L5FrSeetDbZu9t42+4tNWaFJWOE2ey69vgIiV40GP0+zT6+Hgwh/MkB52CGoVC
	cKgHZ7xGOJQvwpucGXObtAVr3nSqphPkrnXMkno5nvA8ngKtossUh0RJX/3qZjdjERK3HAIZ+jl
	SZdZtcbkmvxeK8E44LbOmQ9xpJ+wR7ejBvd0stf8Lp9YFizHVE2PgFU1X++9hWwlKybOySFn/Vn
	f/hNbW3odcEFKg5xqq9t/7yak=
X-Received: by 2002:a05:622a:4d3:b0:4ed:42a2:1281 with SMTP id d75a77b69052e-4f4abcb8d02mr251613531cf.8.1766590433344;
        Wed, 24 Dec 2025 07:33:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFy8qUi0xeWx0iGCNSIgAQhPtuppf9D8vhc4sFFnom9zYvqxkc1Z4gZQfkGBsYXhLd9phBdQQ==
X-Received: by 2002:a05:622a:4d3:b0:4ed:42a2:1281 with SMTP id d75a77b69052e-4f4abcb8d02mr251613291cf.8.1766590432979;
        Wed, 24 Dec 2025 07:33:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618cf9sm5115105e87.57.2025.12.24.07.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:33:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 17:33:49 +0200
Subject: [PATCH v4 1/2] drm/msm/dpu: Set vsync source irrespective of mdp
 top support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-intf-fix-wd-v4-1-07a0926fafd2@oss.qualcomm.com>
References: <20251224-intf-fix-wd-v4-0-07a0926fafd2@oss.qualcomm.com>
In-Reply-To: <20251224-intf-fix-wd-v4-0-07a0926fafd2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2330;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cYm0vhLoKqA2PBsfl+wS9rx0q7aHEWOFtDsgpCz+I9Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpTAferAB2TUEQ1WhDBlHehg6VFbE6pjSp/CfWP
 7fjPuiPKdaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUwH3gAKCRCLPIo+Aiko
 1TKIB/9gCUDK2YB7407yFykOcDkHJk8KsO426K6fmECYOOTiCiVMsnp7zAT3st9H4z8ckEoiFtX
 PEz868HYa/toZJo0B3hKpw3FeSRV+qtvbzfQ3POlOG3cwtaBtOu2y5uVfHbnqzRL9xWNJQJYstK
 i1Dqhjv9u5H4nGBkad2tyeJ0X4HLvg8AnSYEAkDx7eBhvEDb7FmNvVZbZvEjvYIE8pfZxT5hKbe
 aOXla86xAepBu4NTqQHzorXof82UpmN/pVnDS4Fl3Yzv9zxEKobXAMkmKwd/MPwo8WvzXQLNHXB
 67FFtXGPzrY0jlK4v3klbH4IJsdKL+nsUvSubIgqGu/YoLSx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEzNyBTYWx0ZWRfX8GVI/Ghw7aEc
 aqZS4vuy8INi6PdQDL/Edlk6XMj98sQ+Xp8A/KN48z698JH4UPum8xrsbSOuTrAJQEd1uqvhZdr
 YD3THWXbtZ3F/LDrT6fVoRj+WNyuBXutYggPZ92alJcUW3tIV0nHGplnXZBGdMgyY407pOlqL1A
 bqmeFMkTluyiOohAIFQD6846H1CrQG+qZ+OzqNMDRRS1vxg5+qSHVhoEu/biMzgaGYO7M/1VctI
 0B42hlo+hKv17DENWm9a4pgMYOUn9uAGYAIUTISD3IWpqzIhyk9Kn9l66zscbEAkRJpxHOKk73T
 RrAUKayREWbRkjxKf40IwW/kWgx0Pg5YIUhBczurbwYDIfExhx6MYNF060x24mHR7XNCsmgoioy
 F+epCnsWp2KxA0qLV025mLyJ0gcjOP54ND83dj6U8S/ei50WDF+8BM165/3WiYAvey2onli65ST
 yporEI1GYDcna9BaLgA==
X-Proofpoint-ORIG-GUID: 1HJbHESxg1q5eo9InkqF58XcGTv2hBZ9
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694c07e2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3fIW1a8P77-jr8MUMFIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 1HJbHESxg1q5eo9InkqF58XcGTv2hBZ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240137

From: Teguh Sobirin <teguh@sobir.in>

Since DPU 5.x the vsync source TE setup is split between MDP TOP and
INTF blocks.  Currently all code to setup vsync_source is only exectued
if MDP TOP implements the setup_vsync_source() callback. However on
DPU >= 8.x this callback is not implemented, making DPU driver skip all
vsync setup. Move the INTF part out of this condition, letting DPU
driver to setup TE vsync selection on all new DPU devices.

Signed-off-by: Teguh Sobirin <teguh@sobir.in>
Fixes: 2f69e5458447 ("drm/msm/dpu: skip watchdog timer programming through TOP on >= SM8450")
[DB: restored top->ops.setup_vsync_source call]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d1cfe81a3373..0482b2bb5a9e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -774,6 +774,9 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 		return;
 	}
 
+	/* Set vsync source irrespective of mdp top support */
+	vsync_cfg.vsync_source = disp_info->vsync_source;
+
 	if (hw_mdptop->ops.setup_vsync_source) {
 		for (i = 0; i < dpu_enc->num_phys_encs; i++)
 			vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
@@ -781,17 +784,15 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
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


