Return-Path: <linux-arm-msm+bounces-86587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FB6CDCB96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 16:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A77A23017F0E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 15:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8CFE2DEA9B;
	Wed, 24 Dec 2025 15:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XKYNX0AA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OyPKgY7L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586192D46A9
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 15:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766590441; cv=none; b=tDnFr2Rfg+m5fbj22CoTYt6PgxXxB6sCyuWP7lf4POAtP6mEDSadZv6NH+vxxcouV3A3PWBOY4e67IWxYLJTPLOFuQ+CmLFrPdOcYIegg58Ced1APmKSb6VHd4v1zI6YfytDX80Ti512u6GyoI1NtLz25w2FtHG9Ue68Jik3EX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766590441; c=relaxed/simple;
	bh=KHeJcguGLGLj/H9CNx6XTMl2RY9vGrzpZXAk6Sk28pE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lshpu1O/CtS4M1ifC7EQTg5zwf1fbWDOal39ozXK4XMM+3ub5Qt5ThIPZ3X7h1sRwuipZJxHxs48riFG5Csqbn9wY3ObIJm0qlVUUTpNQi4hJXKbv/z5julRiRE+dPus8Jm5UBsL/8d4w9UMSzx1T/Kqe4Q2xBm0au4tD0a3cNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XKYNX0AA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OyPKgY7L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BODmbnp4134186
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 15:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NVYEvHPpjNPnJ/97y4IcMdENVkXk7RwKRB3tv1Ziw6M=; b=XKYNX0AANqzaR5GG
	A8ixyJSGTEFHwviuSWXkHY50HabiLuXY8P7tOZ3ITgqgbK4vK/DUNjNcQg0vl/Vc
	jVDdjYy9T/xEuj0VLj1bIzrrMN5/BMIkCWQrqyJZzZk6EyDc9Hzvv1LnoeHF3Jz0
	hoO00chezQwrD/mvHLQKeKd2Ncbgw4ogFoSfmubteVhJqnPKpS0tq0kt6/W21NYX
	Snxp/8g7Vyk7zWj/XHJ5LPKmt3VvwHXJYCIl9pdmgM8WXwtWULeFaceF3Ujk0Foz
	B1E4DQUamjqmW4XeGjn2t+xFnhWLBV4lDX/ZsWbBo0f0k7+QHJZhIYXNvBtcVGg+
	NZd4/g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46udyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 15:33:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a37ca7ffdso89922456d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 07:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766590435; x=1767195235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NVYEvHPpjNPnJ/97y4IcMdENVkXk7RwKRB3tv1Ziw6M=;
        b=OyPKgY7LNSdH1/8Qa7KeJQdEhqk901UYkSF9gkPaYFc/0zEeh+QspO7Hej0ZZahmGR
         1L6he2KgiBdU+PAhQSQoVqgPtPSKdmbe7WNFKhJmWZOfpvPMkJbMg4+DI8gUwjb1Xw7D
         XYXHqL2nNOBhTJxDh+AABJcQ81/xkYJ/pC1GGvRjX7nVzARlgVUpIqPskyTJIH1eMioL
         zSnLcg/k7iJVvkrVt3KJhncsOEVjr8EoTrgpvOmkULdhWAoL+Q8YnBkIkZGWDIKGhcjh
         a6K9a/0gqDFw6L9F05JhaW2TtQ7tFK+ZIKI1aW85jRnM8ybookoPhJyfeMly/7wae0An
         VKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766590435; x=1767195235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NVYEvHPpjNPnJ/97y4IcMdENVkXk7RwKRB3tv1Ziw6M=;
        b=cbyV45Icw8/BsDcp49zOMP7/syR95dgLQYZVVxLhxh2ZpoK9NWKqOpsW05hH1adruU
         t8jLWRdkO4AlxYFjVFro1wqQZM9mgxtJzEH1CXzxMWY7cX8QXcWb+iu/v0oIdEh/BzRr
         7oeXd68aJpuvfrJuVmhZwaZovCfxDw20da/oqCZFDt+tsqomkUAda/MfSXVKBfhnxyW4
         v7cXKG//UapYh9a+GBBhdv0TPHZ7H+uaI8j4QUt39C/U4zRlDi8VKrhPv7OomEQtMimA
         F2Nf2BYyg4J9lZ0fHFtbszFqQH1QVXF0OiefWwoKqDNP5MLR2iQl/vBkIRIzmeXdUOIE
         MxJQ==
X-Gm-Message-State: AOJu0YyGs/XW9e7Zj4s9PAQNADeBgL+CAv/R/nKvuu4zpPV66v15ek17
	uo/QNSGo2eUi8pQn80K3FWd7nJgo4k/CeQYqZk6+Kbmz3VK3B3gKDLulxm/vEfdE84BGznS5Tcz
	WNQ/wxxEYJPeS7JSVkD5DGX09O8XPQatqmQI6Mf9yfJMpEHyuG0KQfAJ25nuCx3d6vA4N
X-Gm-Gg: AY/fxX5dF9NsBHGq+eJAF790Wa0s+aT/v0+Mafl1KMSAh7aJaVtGlr2cqZ5Pf9xmFtX
	xdMsCG9vpRsbJ+Qup5zeMLw5CcO07DZRjd41hEzPQW+1QlwN0AlnlheOHW4gOdDeEA0CeYfShWH
	G8cCg2cjR/xh12pARFtcNsnrAdlHWaZQmhFWhVg5tU/5IXGB6g8zIT+i/p1/G4rbcYRxPJYmVbm
	IvKQvR/FyCger9yvA73vhu6rc43s0ZkRvR8zCMDHZLrusus7T1gNe08pVLUtBAW1HTbTsC5E5Dq
	zv7kVNo7R8e0eONZYT2w8D5zrjMFmyDINcXdtWSkxFrM1yC8MwRgJ5lspCFtUMQYVgpTgjBdiaa
	R7HbHF7JGIp/xf/FLQU2+NDSdzEdGE9r8gIaR3Dl5P8yyDPKdqDLOXHIp/hTVjNXT+OgeC4L8NQ
	yDBL4x63rIII8s2JbYakS4JQE=
X-Received: by 2002:a05:622a:230a:b0:4ee:1365:ba71 with SMTP id d75a77b69052e-4f4abca88f1mr239988781cf.9.1766590434548;
        Wed, 24 Dec 2025 07:33:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMh2InLsBJ3PDwAeyZtMXndummWGCICu2ZS5MEZy6n7Ac/XW5cgl9CPHDP+OhV1ueiCjZqAg==
X-Received: by 2002:a05:622a:230a:b0:4ee:1365:ba71 with SMTP id d75a77b69052e-4f4abca88f1mr239988291cf.9.1766590434076;
        Wed, 24 Dec 2025 07:33:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618cf9sm5115105e87.57.2025.12.24.07.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:33:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 17:33:50 +0200
Subject: [PATCH v4 2/2] drm/msm/dpu: fix WD timer handling on DPU 8.x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-intf-fix-wd-v4-2-07a0926fafd2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6200;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KHeJcguGLGLj/H9CNx6XTMl2RY9vGrzpZXAk6Sk28pE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpTAfenWlB7mdbgojSTyWi3tFT8QYSIuFvaDcg7
 tHGGZlZHECJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUwH3gAKCRCLPIo+Aiko
 1WfcCACUSMTTvSD22f+YQotsH8vlks67I2zAzR65rWSDr4eS0L7CEW6MGsjI32Tzq1phjac4SM0
 q7P0lM8H55Y4+uN1cBquSzeKZ7uUjs6TnL0ZgB9LmWvMvZjLAODv1LnTNgYq7SczqeecOS30+DD
 1ijP3beQNJsdvjG4wZwZ0BN3QpyTDyRpCOgvStt5QWglACM2zsbT4/fyILMizRO8M+LZrJtMecp
 Vfk3EJjK3/jTISo2FPX23/xZuroN2jHRABOhH8fT8IPTjxmnKbgg6NmPaNgtlMO7PENGfxvUJ7b
 0Jgfjij/vhmZJHUpIUPqBt893DBcNBUCE+CzyiWlCzo3pJnQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: vQTlbyHvsRzKjlAkp_q4lhye4Oz2ewei
X-Proofpoint-GUID: vQTlbyHvsRzKjlAkp_q4lhye4Oz2ewei
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694c07e3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EGfW19dKLGIg-ZbO5EIA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEzNyBTYWx0ZWRfXxZ9rtsH4rZX1
 WLbWOIjsu2EW4jM/qUdzoJwyIekD/0K08oCtvY0MauC9DXJaf+t30Zzh0IKDm4k12EUdQp8MV5+
 SxHhQduCAWFBLk6zVOaeUYvOK3l/MXKa4sneUTPXaaw5TbH8xvinH7yGIjiWXFP2vN/d9Aj0lql
 KVmYLJdLihqzosSTBT4q6Q+hgLg1P3qL5CMAAVuvYvR/jn1LsRTiBzC5nosWkWK6ZkAH0hoFl4c
 TjHpspkJrCJF68KYYqi+Kpa5qZErp3vXlP1PcKbi+5FqgM7wpou+Szavp4d2n5N4itfE694xHvA
 y0IuxZCH6VSJqSD7QtMxRc8GWi3HVd+YKoFFtjue6sFBkCdiqitbAYqSv+uhir+yRat9fb3gSlL
 7wpy0Vt+UKtWpG+ZKE2OnjaSq7ewFVJ1XtSh+zpW8KHiTsn5WEoV3O0C8C1JrTJOnxyDADIbo6P
 rvZpmN51zx0Eo7gGm6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240137

Since DPU 8.x Watchdog timer settings were moved from the TOP to the
INTF block. Support programming the timer in the INTF block.

Fixes: e955a3f0d86e ("drm/msm/dpu: Implement tearcheck support on INTF block")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 48 +++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c  |  7 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  7 +++++
 5 files changed, 55 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0482b2bb5a9e..0e53d9869ae9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -792,7 +792,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 
 		if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
 			phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
-							 vsync_cfg.vsync_source);
+							 &vsync_cfg);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index a80ac82a9625..7967d9bd2f44 100644
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
@@ -475,7 +479,7 @@ static int dpu_hw_intf_get_vsync_info(struct dpu_hw_intf *intf,
 }
 
 static void dpu_hw_intf_vsync_sel(struct dpu_hw_intf *intf,
-				  enum dpu_vsync_source vsync_source)
+				  struct dpu_vsync_source_cfg *cfg)
 {
 	struct dpu_hw_blk_reg_map *c;
 
@@ -484,7 +488,42 @@ static void dpu_hw_intf_vsync_sel(struct dpu_hw_intf *intf,
 
 	c = &intf->hw;
 
-	DPU_REG_WRITE(c, INTF_TEAR_MDP_VSYNC_SEL, (vsync_source & 0xf));
+	DPU_REG_WRITE(c, INTF_TEAR_MDP_VSYNC_SEL, (cfg->vsync_source & 0xf));
+}
+
+static void dpu_hw_intf_vsync_sel_v8(struct dpu_hw_intf *intf,
+				  struct dpu_vsync_source_cfg *cfg)
+{
+	struct dpu_hw_blk_reg_map *c;
+
+	if (!intf)
+		return;
+
+	c = &intf->hw;
+
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
+		reg = DPU_REG_READ(c, INTF_WD_TIMER_0_CTL2);
+		reg |= BIT(8);		/* enable heartbeat timer */
+		reg |= BIT(0);		/* enable WD timer */
+		DPU_REG_WRITE(c, INTF_WD_TIMER_0_CTL2, reg);
+
+		/* make sure that timers are enabled/disabled for vsync state */
+		wmb();
+	}
+
+	dpu_hw_intf_vsync_sel(intf, cfg);
 }
 
 static void dpu_hw_intf_disable_autorefresh(struct dpu_hw_intf *intf,
@@ -598,7 +637,10 @@ struct dpu_hw_intf *dpu_hw_intf_init(struct drm_device *dev,
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


