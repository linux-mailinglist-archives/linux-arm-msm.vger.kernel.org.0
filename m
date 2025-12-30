Return-Path: <linux-arm-msm+bounces-86923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA193CE8E0B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 08:18:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F25B2302AE3D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 07:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBEAD28469B;
	Tue, 30 Dec 2025 07:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V89rM2kS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZArBMqvX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30F92DC769
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 07:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767079086; cv=none; b=W6HuwIAdpkVtixCTdWrGN9Hm1LRgsdegFGz4wvV96rTCNU1OOnAyzW5/h4ax/0vhLE59sOKHzhpZj68YHtdNFVZ+lcAKkq+BW/JAxCnQBatMxmsSKeBKuk3t0y9htLnt5gH6Q3DJn4utB72PoUaAAoCbjXZPzkWYye1cy2CVObM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767079086; c=relaxed/simple;
	bh=YDk3hQizRJFfND4exXbw9nbbup2xzJMiVS497+/zF94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tFlcPsjRDVQ18eD/TT8tP0xIAmcZ539nTAeOqPhKxa4MUQCxC4+QdO20s2ZOQ+7Xz8Mpj7azdxZEdEHCJde8wUnSu79pj1XvimG8ot2hRpaR8MSqx4/h9XztiN0yMZ4rdKgLmm+6OJyrmXSMWFS8Xgja5gcdB/xiuawicyn8ngo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V89rM2kS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZArBMqvX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU0jK0s2671413
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 07:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F+D4XhZHUVaMEju2IS5PSFW4hWSDl2cHPlefbnaZtT0=; b=V89rM2kS7v1fuYrA
	MkqlJLlJjtn2+ecHwS00KXmQxeUbEl1kE9KgF0/U9tflmVllTL2nZQNmQUFlES+7
	24L/IIOd6aE+lQ7zEpXZdktbpyOVcGXtkrUcn5BQDCTbKUg6QNY0AIAh2ZBINDDG
	Urr0DHlD9tYVLfrjnu3a5EQfhO5EQ4dlO3WgpnK77mVVchwVUvLB5jH4jAlZ9vqe
	25B4a5jdZ10JnMj7tpAlDuxqPawsAQUH0frYAwtSbfvEa1mBmxnAwAdad16MWJ4t
	KKGNRgRIUK8oskX5RNCOKmkd6+OuCI7rRZAsrqEiHVR3gRqtcJzrPRsrx2v+Zb/u
	p/1NmQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc4fcrr1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 07:18:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6ff3de05so271863831cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 23:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767079083; x=1767683883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+D4XhZHUVaMEju2IS5PSFW4hWSDl2cHPlefbnaZtT0=;
        b=ZArBMqvX0Ja7ZoccKXUui2ltBrUWebWJZsBscmwcJCgFtsctxig3nwq0ZoyapzVSp/
         cxk1ZxLqCo8wqNJDJ3uCDXnXRRUUVe0lPqQfS45A3cr0Ct9Frp9yQ6uyHtNCL/G945rm
         zGUEgRhK1WHjiuj7rTJGvqi94142G0pOdwdgpczvx0SXEJssy9ecx3mWtYc+QTPeox66
         L0fkTw45Zhb2YBrqlP1RUwtW+NZ3FPeM7sUhYvPIwFyFneUhZHrYtvgYKjogWNFYhG62
         42Z8QIlv8wmyMGexz72TBiH33lN9H1cVbDEAXUGdzbD3+Rs64zxOfkIbEeJHkuDJCxr2
         3dJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767079083; x=1767683883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F+D4XhZHUVaMEju2IS5PSFW4hWSDl2cHPlefbnaZtT0=;
        b=wryJy+kWYxrtQa0nxd5ZhipwA9wEbX+EmqSPmssSUdkdZ6Oyw9p6lXgUPWLkWVa/jV
         eKcAKnvXd/XX91hKmh7H0/TFWCGCpVK0CEnAeNJXQe682NZRuOc7MzpB43wEEHuw+voK
         TaMv+nhM2SUpesvsA7KppV/3Ia0MknoLn4DGXItiTeCkiQe7z/BcvrInQyG7tuJygDum
         aw2glxy5YVuueOzxqOaCs9VcKmzumXqd/fnyjdGtBn2UzzRyR1ypLkYgImspUGojx5ky
         aVqFR/RpGgKXN1wmXDmUcnFosDZxeLU8K12i0mMEjLjLAJuyfF5x4K2LEvA70l6qNLOr
         4SoA==
X-Gm-Message-State: AOJu0YygztqQ6sDBpWegrjKI48+AKcs67esToHouZ8vYB03j1wGJJeR7
	bZzNuSW7wU71W5c4kZ250slRFo+C8e9rkH8NoNjnDFR9SGRFulBrUGG3JkHElmUPUOeZzxTM7g+
	0d7YIkXhm4+ebRzGUTc+iSd9Wo/jlfDTmCsnSbO51gU0kU+SuoEi10X5zVACgxqRg0C/X
X-Gm-Gg: AY/fxX6G7E5AtPdmZD7NGxM5t9GroSVVhy9LxJZGBD8YPHEm82ZrNaQ6Zzpnc7b8ROf
	/M3B66Tynzwg/SzVZIH9Mg8DkX70Yr3oxn+TuNocpMn4+m6rSFrrQDuXLQfdvxojuCOD8Yk0UZU
	WPAhwyO4lKv3jkyAod7XY6lSHLCJLLJOF2wB8qs7nsEyEK16+S9yen2Ewsf6Yc8T3aR4ZETDD7a
	7eThAfVxnBpY1hxSFVG6Kk4lvJlBdOIOKF0kFLDZkbD/R9qK4iArWB0fc13R6bWhESs0TDy0s4u
	xDoMiGcFTb5kR3jIuFiOPzJeVIIOiptxPGO/RNdl946Dv4ZVVoppBkcPE6JZlZ79YACc4JaLRis
	HsOhtJQUq1ueatevxP86aqsdLFldDh11MwK52/3I1AZw7m4v8SmTcfCp8gCGA94hvS5i2sxLCRI
	PkPoazQznSU+IQbJFujGhWb8c=
X-Received: by 2002:ac8:6f0c:0:b0:4ed:8ab:e7aa with SMTP id d75a77b69052e-4f4abccf14emr457763231cf.11.1767079083004;
        Mon, 29 Dec 2025 23:18:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFaJvSyv2J4sH5R2VzNO8GX+fPMJwUSte+MeeSAQ2QvB5gf/gpGeQ0AU7jz52r9OUytBM+2w==
X-Received: by 2002:ac8:6f0c:0:b0:4ed:8ab:e7aa with SMTP id d75a77b69052e-4f4abccf14emr457763031cf.11.1767079082561;
        Mon, 29 Dec 2025 23:18:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185ea2d8sm9924615e87.45.2025.12.29.23.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 23:18:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 09:17:57 +0200
Subject: [PATCH v6 2/2] drm/msm/dpu: fix WD timer handling on DPU 8.x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-intf-fix-wd-v6-2-98203d150611@oss.qualcomm.com>
References: <20251230-intf-fix-wd-v6-0-98203d150611@oss.qualcomm.com>
In-Reply-To: <20251230-intf-fix-wd-v6-0-98203d150611@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7052;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=YDk3hQizRJFfND4exXbw9nbbup2xzJMiVS497+/zF94=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2ZwzXLOuHkBJa4TZJKZdZcyXtPt3OMlzqp4elr9YeYT2
 va5dlKdjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZiIaBUHwxJO17KVu90MRCcI
 VPkd1u/3kWmV/H+GPfvaa2e/+V8irx/K83u55O80z5IdsmdVkrz7m8We+B/a/cS7kVnncl9fVvR
 /bwGRwnUTYpY+EBC8dbKLwcv8w+wEwRVdX+XfWzot3RLBGnB57rJ5TjzGvTWZb2R+Kfa9cI9O+i
 NkwVl4JEald5+/QJXrbNsSlxVrp/I2ze2blb9hLv/TVtZ/qq1KO8Ibl3/r2yobXuU6g8sg0cQnP
 yxi3b3Xrgl3LrxcqX5FM06gxVn9t2Rc9LTroZLd8dbShofK71g8ePVWmc9V8t5JG37u4vb3Oh94
 Re/OenprSaLuknfK7QuvxE7tZ/v21uVcrFDS4fjfex4CAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: _eQxgkd2LAnW-i55kyBLUSnFQsxZZW0i
X-Proofpoint-ORIG-GUID: _eQxgkd2LAnW-i55kyBLUSnFQsxZZW0i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA2NSBTYWx0ZWRfX1I42xeTv+wow
 wvhtVZX2FR0oejDWRis0O8Hx3PAGMm8hhIzjXZ13N3vPKdvDwdIsmjEEUinSmV5HqFXdiB4nRA5
 GIKqUkZ1Vp7S6u0lw1ok7MsRhMjsNubOj05YvsHHwLWQVsKAHxJJAwLN/145cO8Cck/E/D9rLSk
 2lLSNeyvYYqPklzc9sldMnF7VFtUrDstDfh2Hvj/Dg/SfFVsrGPKSbmWBkmKv2PX5xUvgRB2Bbd
 S+KkgrfUnEtEW00wAX0nEsGfXWjc5sqFHuQVcTWEria5Br0oJJbK6NY8+w+7pNuXHpKduhAYbtP
 3ndpj206FmK/deo5GawTlvyLQCMLfx0B/nXT4xooVd2h3IMnK/7PBFZUExkCYVssAoSMSVzauni
 ei+DKDBLnOV+P2DmBDFuEVk3b+JACrfzUoBXWP6JKqKmkosbo/v8YP1YII3qIan09jcP7oVgJlD
 ztXLInXlL9JYxJZupew==
X-Authority-Analysis: v=2.4 cv=foHRpV4f c=1 sm=1 tr=0 ts=69537cab cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=tVI0ZWmoAAAA:8 a=EUspDBNiAAAA:8 a=VmWmgm_EPZb_nnVC2x0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300065

Since DPU 8.x Watchdog timer settings were moved from the TOP to the
INTF block. Support programming the timer in the INTF block. Fixes tag
points to the commit which removed register access to those registers on
DPU 8.x+ (and which also should have added proper support for WD timer
on those devices).

Fixes: 43e3293fc614 ("drm/msm/dpu: add support for MDP_TOP blackhole")
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 49 +++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c  |  7 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  7 +++++
 5 files changed, 57 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 3921c15aee98..058a7c8727f7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -775,13 +775,13 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 	}
 
 	vsync_cfg.vsync_source = disp_info->vsync_source;
+	vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);
 
 	if (hw_mdptop->ops.setup_vsync_source) {
 		for (i = 0; i < dpu_enc->num_phys_encs; i++)
 			vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
 
 		vsync_cfg.pp_count = dpu_enc->num_phys_encs;
-		vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);
 
 		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
 	}
@@ -791,7 +791,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 
 		if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
 			phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
-							 vsync_cfg.vsync_source);
+							 &vsync_cfg);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index a80ac82a9625..7e620f590984 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -67,6 +67,10 @@
 #define INTF_MISR_CTRL                  0x180
 #define INTF_MISR_SIGNATURE             0x184
 
+#define INTF_WD_TIMER_0_CTL		0x230
+#define INTF_WD_TIMER_0_CTL2		0x234
+#define INTF_WD_TIMER_0_LOAD_VALUE	0x238
+
 #define INTF_MUX                        0x25C
 #define INTF_STATUS                     0x26C
 #define INTF_AVR_CONTROL                0x270
@@ -475,7 +479,20 @@ static int dpu_hw_intf_get_vsync_info(struct dpu_hw_intf *intf,
 }
 
 static void dpu_hw_intf_vsync_sel(struct dpu_hw_intf *intf,
-				  enum dpu_vsync_source vsync_source)
+				  struct dpu_vsync_source_cfg *cfg)
+{
+	struct dpu_hw_blk_reg_map *c;
+
+	if (!intf)
+		return;
+
+	c = &intf->hw;
+
+	DPU_REG_WRITE(c, INTF_TEAR_MDP_VSYNC_SEL, (cfg->vsync_source & 0xf));
+}
+
+static void dpu_hw_intf_vsync_sel_v8(struct dpu_hw_intf *intf,
+				  struct dpu_vsync_source_cfg *cfg)
 {
 	struct dpu_hw_blk_reg_map *c;
 
@@ -484,7 +501,30 @@ static void dpu_hw_intf_vsync_sel(struct dpu_hw_intf *intf,
 
 	c = &intf->hw;
 
-	DPU_REG_WRITE(c, INTF_TEAR_MDP_VSYNC_SEL, (vsync_source & 0xf));
+	if (cfg->vsync_source >= DPU_VSYNC_SOURCE_WD_TIMER_4 &&
+	    cfg->vsync_source <= DPU_VSYNC_SOURCE_WD_TIMER_1) {
+		pr_warn_once("DPU 8.x supports only GPIOs and timer0 as TE sources\n");
+		return;
+	}
+
+	if (cfg->vsync_source == DPU_VSYNC_SOURCE_WD_TIMER_0) {
+		u32 reg;
+
+		DPU_REG_WRITE(c, INTF_WD_TIMER_0_LOAD_VALUE,
+			      CALCULATE_WD_LOAD_VALUE(cfg->frame_rate));
+
+		DPU_REG_WRITE(c, INTF_WD_TIMER_0_CTL, BIT(0)); /* clear timer */
+
+		reg  = BIT(8);		/* enable heartbeat timer */
+		reg |= BIT(0);		/* enable WD timer */
+		reg |= BIT(1);		/* select default 16 clock ticks */
+		DPU_REG_WRITE(c, INTF_WD_TIMER_0_CTL2, reg);
+
+		/* make sure that timers are enabled/disabled for vsync state */
+		wmb();
+	}
+
+	dpu_hw_intf_vsync_sel(intf, cfg);
 }
 
 static void dpu_hw_intf_disable_autorefresh(struct dpu_hw_intf *intf,
@@ -598,7 +638,10 @@ struct dpu_hw_intf *dpu_hw_intf_init(struct drm_device *dev,
 		c->ops.enable_tearcheck = dpu_hw_intf_enable_te;
 		c->ops.disable_tearcheck = dpu_hw_intf_disable_te;
 		c->ops.connect_external_te = dpu_hw_intf_connect_external_te;
-		c->ops.vsync_sel = dpu_hw_intf_vsync_sel;
+		if (mdss_rev->core_major_ver >= 8)
+			c->ops.vsync_sel = dpu_hw_intf_vsync_sel_v8;
+		else
+			c->ops.vsync_sel = dpu_hw_intf_vsync_sel;
 		c->ops.disable_autorefresh = dpu_hw_intf_disable_autorefresh;
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index f31067a9aaf1..e84ab849d71a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -12,6 +12,7 @@
 #include "dpu_hw_util.h"
 
 struct dpu_hw_intf;
+struct dpu_vsync_source_cfg;
 
 /* intf timing settings */
 struct dpu_hw_intf_timing_params {
@@ -107,7 +108,7 @@ struct dpu_hw_intf_ops {
 
 	int (*connect_external_te)(struct dpu_hw_intf *intf, bool enable_external_te);
 
-	void (*vsync_sel)(struct dpu_hw_intf *intf, enum dpu_vsync_source vsync_source);
+	void (*vsync_sel)(struct dpu_hw_intf *intf, struct dpu_vsync_source_cfg *cfg);
 
 	/**
 	 * Disable autorefresh if enabled
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index 96dc10589bee..1ebd75d4f9be 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -22,13 +22,6 @@
 #define TRAFFIC_SHAPER_WR_CLIENT(num)     (0x060 + (num * 4))
 #define TRAFFIC_SHAPER_FIXPOINT_FACTOR    4
 
-#define MDP_TICK_COUNT                    16
-#define XO_CLK_RATE                       19200
-#define MS_TICKS_IN_SEC                   1000
-
-#define CALCULATE_WD_LOAD_VALUE(fps) \
-	((uint32_t)((MS_TICKS_IN_SEC * XO_CLK_RATE)/(MDP_TICK_COUNT * fps)))
-
 static void dpu_hw_setup_split_pipe(struct dpu_hw_mdp *mdp,
 		struct split_pipe_cfg *cfg)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index 67b08e99335d..6fe65bc3bff4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -21,6 +21,13 @@
 
 #define TO_S15D16(_x_)((_x_) << 7)
 
+#define MDP_TICK_COUNT                    16
+#define XO_CLK_RATE                       19200
+#define MS_TICKS_IN_SEC                   1000
+
+#define CALCULATE_WD_LOAD_VALUE(fps) \
+	((uint32_t)((MS_TICKS_IN_SEC * XO_CLK_RATE)/(MDP_TICK_COUNT * fps)))
+
 extern const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L;
 extern const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L;
 extern const struct dpu_csc_cfg dpu_csc10_rgb2yuv_601l;

-- 
2.47.3


