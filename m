Return-Path: <linux-arm-msm+bounces-59108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B07AC1426
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 21:05:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2391A1B652FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 19:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA81829B79E;
	Thu, 22 May 2025 19:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LefIQefk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4135429AB13
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940632; cv=none; b=ZKpLKUhyFOWPb35eAvKT4AtTVnG0fi1iNOwibNvf34A931j1tYMt/V5h64a0/sNtXfYd+mKMJHa+jcn4WDkmXU1Mwv3eQZMoo02w7dnmvyuAAQBqEwuEoXNfBRy5NRfAEZa7j3D22uwE+LE+HOFqtASF/CsodwXVqnKzfQ7aJkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940632; c=relaxed/simple;
	bh=WrPL+Fds/SdvaK5M9rAQ/MNc3BQLSxfriO2pPAkHVSI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F2LvMPFSXDxu+qGG7VZlsylpk1Z3+DVD+NJfE2Brm2+x1XuGC/2pP4blgHR13xqqRa3Dw7l1DdxQYKpcpb89SBpkkoH1uc7KuD/t384wBXDeKv7DOLhuQjNCiWicgQFklWGd+mWbbsBLfW4oPLsjYD1r72oqhPbHNOZQlddGJ+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LefIQefk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MH22uS024757
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MJU63GAk4KF2HCv2pS83TCU9KZKeyp5RVvMFBroQ4R0=; b=LefIQefkC5J1Mg5U
	vULUseC46+RcXBdHW66r5EontOo+kcDN+2YmheEhTik1tMveS2uv4wc2UpPgkUBG
	zZN9d81ogP08it7WEGMAuuGJZ77fqRnFOTdIhh8xlIly4Rm8ClrypIrvoNkz+Lz5
	V+gFXT+kT3ZwPj4GPNh2AzO/g0m75zYOWAKa9V9xUwrZtvMYI4ZSYo+yvjTKXrjZ
	3fEcaAFRV57xGDkaRa2h7pqC0TKirS1YDBc1jwz2j0fRwbBFutoIHGMFNG33vqiq
	TCccs/p0OC4SUDJxzWrqM3TzZtpg0vKCyd1ovgl+S4cWOkIRuP8fxUuyLC/rqd/C
	HdzCvg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4ycxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:03:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c793d573b2so1453334485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:03:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940618; x=1748545418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJU63GAk4KF2HCv2pS83TCU9KZKeyp5RVvMFBroQ4R0=;
        b=cpCEL11+uOpTygJnfMTlZuW4fjmOucF6tDJ1LuCedkmJDERqzCBa7XBqs2ZmeItKWe
         ibQ5wbsVJlkYgd0JkNfX6MV9x/rB1kgfsLd2RPyJRdsGWp1HM8kpniR64ri2LpNennM4
         hJju10llCL570jvYqtaw/wa8h6hjW3Zg/kZ2Ez0hT1/rqa+1W/ebyupMHU2Ris0BDchO
         xDaejitpj0jst7m8+OxwKSEXTLjXlQrUeO1mUOveUfOIauxTufLyuP2WtYTtTWPzGjoH
         tav/3tfeA8AG7UH44qB7N1VrdS1zC61TjG5qwEAmVobuXnzkHBCuwMo1GL17kh5FYem/
         N/3w==
X-Forwarded-Encrypted: i=1; AJvYcCU/ud9cN1GdXaazidR9vLapBk2mmrGMww8yUzBy0lBozjuB56tuKlLkxZwx9eOh7Bf0oSDJLoiILgXHNzUT@vger.kernel.org
X-Gm-Message-State: AOJu0YxXBiPTjZgHtQkDWY7hwajsIAMy0XBwN8tjsGjhBGhW/VEWKWwS
	l+eEIYdqeqjy1YeM3y5DQaqkS8sX1cniVLEsg5o7w3nulCp027rGjJECTgr/Ou7f8Az8cs+cwIZ
	KRgNaGJzNsBlzNcl1jIOAAa1eF69ZV7CjzXni8Mfm+564pY73DvhNZdyW/BvwZABXlbTj
X-Gm-Gg: ASbGncs0wWfY70dLdRdFdpzShbjhlTevSwmMffoaU4QDvyu7ruJD3QnZgkci4+v2rAk
	FOFIb4s0abuv07xMwAmLvlQ+BB32Wh7YU5ruCtuT8ccygxaqCc12IbU96XrsYaJIYcaXu+GO0Id
	xE+AEzpbNHKTSNJsYCsp4W36YYf0LEoUfJA/krah8N03yCIz13t079Ow9o9TCAzvi/ghm6hXP7a
	QE125govPBbidmuHt0FPpY0GASb4VlJpsocB0NC7xn9CfmnbVCdNpYdeVXM2WD4LcSANTByKgrl
	UhO7dj9lMewQU8NoHUesyEq/qkmCie3Q4OK1LfficOQK4xkEH5/ueiNL2oMlzEzQNnQjtx+4Mep
	g40By+dTs0dsJYJVU93Ie900t
X-Received: by 2002:a05:620a:1726:b0:7c5:f696:f8e5 with SMTP id af79cd13be357-7cd4672499amr3483753285a.14.1747940618214;
        Thu, 22 May 2025 12:03:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJUNU+rm/Ph9/vz8kwtEwwdRHJFL/bChnN6Hrfa7DmeGkmkC4jRRpunmPXwB6Tp5vuDe91wQ==
X-Received: by 2002:a05:620a:1726:b0:7c5:f696:f8e5 with SMTP id af79cd13be357-7cd4672499amr3483747485a.14.1747940617664;
        Thu, 22 May 2025 12:03:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:22 +0300
Subject: [PATCH v5 03/30] drm/msm/dpu: inline _setup_ctl_ops()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-3-3b2085a07884@oss.qualcomm.com>
References: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
In-Reply-To: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5939;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=GFf0v3WAmRcTA8zxH+uCVN7GSoj6mJ0DVirlWlbweGk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T7iekawvAScfsheKNdhh9/EXfE+ZBTWarVm
 w8TTRGxrLuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90+wAKCRCLPIo+Aiko
 1YYAB/4pjBHc4s+lMqo5GCRmL8vStn+1DiNM0XJP/FBfY2OE9pmjW/mNwYIAdbpZF7hRv6IRnn7
 M0SE2BJa3Mn80G+2E7j7buJbbCKgYv48X/wbWbC8mYMYRbl4KdmQHfahOr/Zt35O19YGXgx8SxL
 uwsGw37xcpm7vTt/y8CyEq9sgf8B79MCI+nxQfSv6UC76dRoJDiwQ+BcGmC7/1htYYSw6TKgO2n
 L+4GSEaZvWSUPDtaAiSKpP2mkOZuLUPyYNf3DPsig5Yg0xgOOE+/j3mC0eXXrK1ji/XkttL14XG
 //YtF2gzkon1B5kQ9svLTBGNtIkDUSyq4RufxovDCkEW0sSL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: mouerUZlpPNz8yAr9N1Ym0zpfZX9DVzh
X-Proofpoint-ORIG-GUID: mouerUZlpPNz8yAr9N1Ym0zpfZX9DVzh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfX2nhZLCq1JgfD
 ABxCCEZOskeYekzZfda7XgYpGER7+AJHkfsiwoZBumXZbFaq3+F2PlLgQ4AVV+2OKhJx8248e7o
 UWaFyRfZoKy7cNO0flS1cKwVqgmGpsJo6WRzRllUh4Farzn2EFUZtTHK/hUbZuFGt9ObNzuJ+mq
 ipsin63XkEWHIAwZ1fP/S2jZGqdB7Sl89kAUusqPjJbesN9ZAuvkwW+QzZV3FoYgJIh2wX0r2O3
 Rv7gA1OOCQvVHgQENGg5ZUvXpEtrStfW4ViPHjP7SYifNN+hSneaIWfHiFai4wRKKU5bLXY+jAI
 aUAN9F+MwOCXTd4nDog0tDDFHoAPNqmCkDAw72H0Ia1/LL+cbOjxzbc+nXMyNyJTNcMzPFMWkw6
 f1iFR/ugO7NX3ateWqZppNmC4FAIZ7s7wdWPKlxLaJdVKZCoZfAMJcMd7Vf1cwV/6E3Zo3r3
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=682f7513 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=J8zulDhgwS0aM89Qmk8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220192

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Inline the _setup_ctl_ops() function, it makes it easier to handle
different conditions involving CTL configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 98 ++++++++++++++----------------
 1 file changed, 47 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 573e42b06ad068445b947c59955281ba6e238dad..d58a0f1e8edb524ff3f21ff8c96688dd2ae49541 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -737,56 +737,6 @@ static void dpu_hw_ctl_set_active_fetch_pipes(struct dpu_hw_ctl *ctx,
 	DPU_REG_WRITE(&ctx->hw, CTL_FETCH_PIPE_ACTIVE, val);
 }
 
-static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
-		unsigned long cap)
-{
-	if (cap & BIT(DPU_CTL_ACTIVE_CFG)) {
-		ops->trigger_flush = dpu_hw_ctl_trigger_flush_v1;
-		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg_v1;
-		ops->reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
-		ops->update_pending_flush_intf =
-			dpu_hw_ctl_update_pending_flush_intf_v1;
-
-		ops->update_pending_flush_periph =
-			dpu_hw_ctl_update_pending_flush_periph_v1;
-
-		ops->update_pending_flush_merge_3d =
-			dpu_hw_ctl_update_pending_flush_merge_3d_v1;
-		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
-		ops->update_pending_flush_cwb = dpu_hw_ctl_update_pending_flush_cwb_v1;
-		ops->update_pending_flush_dsc =
-			dpu_hw_ctl_update_pending_flush_dsc_v1;
-		ops->update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm_v1;
-	} else {
-		ops->trigger_flush = dpu_hw_ctl_trigger_flush;
-		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
-		ops->update_pending_flush_intf =
-			dpu_hw_ctl_update_pending_flush_intf;
-		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb;
-		ops->update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm;
-	}
-	ops->clear_pending_flush = dpu_hw_ctl_clear_pending_flush;
-	ops->update_pending_flush = dpu_hw_ctl_update_pending_flush;
-	ops->get_pending_flush = dpu_hw_ctl_get_pending_flush;
-	ops->get_flush_register = dpu_hw_ctl_get_flush_register;
-	ops->trigger_start = dpu_hw_ctl_trigger_start;
-	ops->is_started = dpu_hw_ctl_is_started;
-	ops->trigger_pending = dpu_hw_ctl_trigger_pending;
-	ops->reset = dpu_hw_ctl_reset_control;
-	ops->wait_reset_status = dpu_hw_ctl_wait_reset_status;
-	ops->clear_all_blendstages = dpu_hw_ctl_clear_all_blendstages;
-	ops->setup_blendstage = dpu_hw_ctl_setup_blendstage;
-	ops->update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
-	ops->update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
-	if (cap & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
-		ops->update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_sub_blocks;
-	else
-		ops->update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
-
-	if (cap & BIT(DPU_CTL_FETCH_ACTIVE))
-		ops->set_active_fetch_pipes = dpu_hw_ctl_set_active_fetch_pipes;
-};
-
 /**
  * dpu_hw_ctl_init() - Initializes the ctl_path hw driver object.
  * Should be called before accessing any ctl_path register.
@@ -812,7 +762,53 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	c->hw.log_mask = DPU_DBG_MASK_CTL;
 
 	c->caps = cfg;
-	_setup_ctl_ops(&c->ops, c->caps->features);
+
+	if (c->caps->features & BIT(DPU_CTL_ACTIVE_CFG)) {
+		c->ops.trigger_flush = dpu_hw_ctl_trigger_flush_v1;
+		c->ops.setup_intf_cfg = dpu_hw_ctl_intf_cfg_v1;
+		c->ops.reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
+		c->ops.update_pending_flush_intf =
+			dpu_hw_ctl_update_pending_flush_intf_v1;
+
+		c->ops.update_pending_flush_periph =
+			dpu_hw_ctl_update_pending_flush_periph_v1;
+
+		c->ops.update_pending_flush_merge_3d =
+			dpu_hw_ctl_update_pending_flush_merge_3d_v1;
+		c->ops.update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
+		c->ops.update_pending_flush_cwb = dpu_hw_ctl_update_pending_flush_cwb_v1;
+		c->ops.update_pending_flush_dsc =
+			dpu_hw_ctl_update_pending_flush_dsc_v1;
+		c->ops.update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm_v1;
+	} else {
+		c->ops.trigger_flush = dpu_hw_ctl_trigger_flush;
+		c->ops.setup_intf_cfg = dpu_hw_ctl_intf_cfg;
+		c->ops.update_pending_flush_intf =
+			dpu_hw_ctl_update_pending_flush_intf;
+		c->ops.update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb;
+		c->ops.update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm;
+	}
+	c->ops.clear_pending_flush = dpu_hw_ctl_clear_pending_flush;
+	c->ops.update_pending_flush = dpu_hw_ctl_update_pending_flush;
+	c->ops.get_pending_flush = dpu_hw_ctl_get_pending_flush;
+	c->ops.get_flush_register = dpu_hw_ctl_get_flush_register;
+	c->ops.trigger_start = dpu_hw_ctl_trigger_start;
+	c->ops.is_started = dpu_hw_ctl_is_started;
+	c->ops.trigger_pending = dpu_hw_ctl_trigger_pending;
+	c->ops.reset = dpu_hw_ctl_reset_control;
+	c->ops.wait_reset_status = dpu_hw_ctl_wait_reset_status;
+	c->ops.clear_all_blendstages = dpu_hw_ctl_clear_all_blendstages;
+	c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
+	c->ops.update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
+	c->ops.update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
+	if (c->caps->features & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_sub_blocks;
+	else
+		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
+
+	if (c->caps->features & BIT(DPU_CTL_FETCH_ACTIVE))
+		c->ops.set_active_fetch_pipes = dpu_hw_ctl_set_active_fetch_pipes;
+
 	c->idx = cfg->id;
 	c->mixer_count = mixer_count;
 	c->mixer_hw_caps = mixer;

-- 
2.39.5


