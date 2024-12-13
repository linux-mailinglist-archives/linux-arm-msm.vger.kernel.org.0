Return-Path: <linux-arm-msm+bounces-42129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E846D9F1887
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 23:15:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C76B188ECC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 22:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 258FE1B0F0A;
	Fri, 13 Dec 2024 22:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eT/eDFqM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394851A9B4F
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 22:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734128087; cv=none; b=MDCNlwQVMeMo7BK8ExMPWdo+B/cr8PNKU4p1I0qyTSKef9OquuJ88s/CzkYu9hXzFbBZdR2Ix20l11byRcHs5Sd8MFuLNBJ999jAv972ogNfI/bZmClEQHV5Q1qqscU1FUCQjjvtNQUr6xRn5cXXJfbWVd2eBw9FOfGszWSye70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734128087; c=relaxed/simple;
	bh=sURLU3QRO4lBSIODQBucrC/9R5zvezCH7Xkam1qgsTU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z04jWacNuAYuAPJffD0Gd+0yibohbF2GaOVxWMJd00PwbgvKP9ta2Z43vfTLCEeSAvVKOZh5FvfHOI0wbvaxn7eVfKLeLqsymH4K3GTAMEUaGK9IEV05NCN8qDRl88RXJ2o9o9vcebcxPFkvf61jaqzO9bHDjeYWXzP9N0oAjAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eT/eDFqM; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30227ccf803so24215331fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734128083; x=1734732883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a6/t+UEo+o4R/5x0BVa9xiJzTng+azk8DSVw42DIL44=;
        b=eT/eDFqMbS/Z57I2hAG3R0nLwxQhyfLxlvbGvN+LziQz74lxK6Th0t+pRmcI8MWg7h
         mIMihZgI0D58xL8CdotnT1ciEPwHZCHgNSSC6xms/0rLPyMyzAcx1btOLXHmAKMugmCO
         fTQ1yQ30du4LsD4epBVqHlQkLk9eeGe7Pp4oHcBvDJ9zrNhVQl4tTdeT5MeFlh+ajrzP
         wEmTyZ0HLc9iozwlVR4T00Fofqn15OgD2ZQq8Hcib9qQBODP/pdwNmUkmNIFjeRkhb8+
         EX9Xg2qKzXxsIQLmxb79jwLaS7e77wCum7DWfN6LVuiKHdMN+9a9F/Vki/HxfSbvuPn8
         FSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734128083; x=1734732883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a6/t+UEo+o4R/5x0BVa9xiJzTng+azk8DSVw42DIL44=;
        b=JrsCe5WxynGFaupSuWfmaTFoMMaABLoySWc7dud5bE5nhrtBIaVx7Tlv1YByNDg3qw
         Q+QU2s5kfFSP/Zj2rfeS1Yg+wDtCGEUL14hdtGW3Ut2ClGCYkzhQFSPyHhdfcNn2zpi5
         40f7hNnr0ABalE/V+xbmck2BoJH8HsHj8V+50HSnwjQInuQaI6l/T//yDduVeC2pGQlE
         3r2z+SHfVo8ANRNs8EdCoWI6dmktiDg9DmCgyJXpLUlaPoJ42fBftc2++Xpydz+1skc6
         gLPnZYrZtf+4RQLDIWD/Ksa+kr2wxiAExgqMGLl8Km7w4ciU9A1TLDIYYOrLQbTO1U3O
         RTIQ==
X-Gm-Message-State: AOJu0Ywc1iVeHCSvy6LLb6DBZ5XJg2YK1A4OIZkRrEqCFa96nsMb3PTC
	Ol7800lREKJFILVM1u+0jkmrjhdcuJgC3cVBKEArN4v1jK5PDvgkFq9TE7ylb1U=
X-Gm-Gg: ASbGncu8TU1u3R4Bptc9uzEK8xobqeWbLiJUMZXX3mUlNcOF0XZNoJixaKwR0l4ImcM
	leLXtpsoaOoA0U9+XU+NbhewMBZSIAcStuYLKfy4Hf+ZfwdrWlAp3rVa9ugTeOcd+GgX/Dfo8lr
	M+tRgHVu/j0dFB1jkaJ+V9xF7bAoENNB135NvoQev2VQwO50rlVDizgVyy1Rg+XpRlUO/lbkv8B
	tJcaFAzflrdD2zPcJJTWNqfu2lzhfHj10kEteo0EeiF4XL+Gwm3s4XhLhZsAIOP
X-Google-Smtp-Source: AGHT+IHkxr4X/C9aNnfH9bFExxSkoB1mD90El/rG/VeJ5/fjh3XHK+G1yR4l8HfLEZZZ7epTnoUyxQ==
X-Received: by 2002:a2e:b8d0:0:b0:300:2d54:c2c8 with SMTP id 38308e7fff4ca-30254521f71mr13750741fa.8.1734128083581;
        Fri, 13 Dec 2024 14:14:43 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 14:14:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:19 +0200
Subject: [PATCH 03/35] drm/msm/dpu: stop passing mdss_ver to
 setup_timing_gen()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-3-988f0662cb7e@linaro.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
In-Reply-To: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3649;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=sURLU3QRO4lBSIODQBucrC/9R5zvezCH7Xkam1qgsTU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHEi5r26WnowVbacpDgVif3osRU7Lls2DTJ4
 iroXfFIqASJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxxAAKCRCLPIo+Aiko
 1Y41CACbbx/PpgDANCo/yVbuGqmVnaIiPQTqCUwPuCRDf1buhfRnGzEQg+uwE8Tn4OA8qij4tlh
 kvQT3PKuwC3fkNBxYISHk2emM6FynDfv388JE9QZwS/kRzOByq03h42Qo6b0mqAUCiN5Qyw5rXX
 YplnDossOA2m2Vs8o7sMj31TzVjl7JySiotc4HQ/gnjR27UnAUtP940VcMU0vMYxvowJZRL6w+Q
 dI0xyGVVQhE5LPpolceNdxixgMZaV/8YT59gGnmRhN8Gg6arVPfzmlBo3RN8Uqu0bSAYImmIoX7
 GU3JU32h8cB+kPUI8WVgvGDEcLX6vBN4xtQBvg0L/59kM5Ra
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

As a preparation to further MDSS-revision cleanups stop passing MDSS
revision to the setup_timing_gen() callback. Instead store a pointer to
it inside struct dpu_hw_intf and use it diretly. It's not that the MDSS
revision can chance between dpu_hw_intf_init() and
dpu_encoder_phys_vid_setup_timing_engine().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 7 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 5 +++--
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index abd6600046cb3a91bf88ca240fd9b9c306b0ea2e..3e0f1288ad17e19f6d0b7c5dcba19d3e5977a461 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -307,8 +307,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 
 	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
 	phys_enc->hw_intf->ops.setup_timing_gen(phys_enc->hw_intf,
-			&timing_params, fmt,
-			phys_enc->dpu_kms->catalog->mdss_ver);
+			&timing_params, fmt);
 	phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, &intf_cfg);
 
 	/* setup which pp blk will connect to this intf */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index fb1d25baa518057e74fec3406faffd48969d492b..1d56c21ac79095ab515aeb485346e1eb5793c260 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -98,8 +98,7 @@
 
 static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 		const struct dpu_hw_intf_timing_params *p,
-		const struct msm_format *fmt,
-		const struct dpu_mdss_version *mdss_ver)
+		const struct msm_format *fmt)
 {
 	struct dpu_hw_blk_reg_map *c = &intf->hw;
 	u32 hsync_period, vsync_period;
@@ -180,7 +179,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 
 	/* TODO: handle DSC+DP case, we only handle DSC+DSI case so far */
 	if (p->compression_en && !dp_intf &&
-	    mdss_ver->core_major_ver >= 7)
+	    intf->mdss_ver->core_major_ver >= 7)
 		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
 
 	hsync_data_start_x = hsync_start_x;
@@ -580,6 +579,8 @@ struct dpu_hw_intf *dpu_hw_intf_init(struct drm_device *dev,
 	c->idx = cfg->id;
 	c->cap = cfg;
 
+	c->mdss_ver = mdss_rev;
+
 	c->ops.setup_timing_gen = dpu_hw_intf_setup_timing_engine;
 	c->ops.setup_prg_fetch  = dpu_hw_intf_setup_prg_fetch;
 	c->ops.get_status = dpu_hw_intf_get_status;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 114be272ac0ae67fe0d4dfc0c117baa4106f77c9..f31067a9aaf1d6b96c77157135122e5e8bccb7c4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -81,8 +81,7 @@ struct dpu_hw_intf_cmd_mode_cfg {
 struct dpu_hw_intf_ops {
 	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
 			const struct dpu_hw_intf_timing_params *p,
-			const struct msm_format *fmt,
-			const struct dpu_mdss_version *mdss_ver);
+			const struct msm_format *fmt);
 
 	void (*setup_prg_fetch)(struct dpu_hw_intf *intf,
 			const struct dpu_hw_intf_prog_fetch *fetch);
@@ -126,6 +125,8 @@ struct dpu_hw_intf {
 	enum dpu_intf idx;
 	const struct dpu_intf_cfg *cap;
 
+	const struct dpu_mdss_version *mdss_ver;
+
 	/* ops */
 	struct dpu_hw_intf_ops ops;
 };

-- 
2.39.5


