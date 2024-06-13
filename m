Return-Path: <linux-arm-msm+bounces-22617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F22907953
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 19:05:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 144AA1C21B0F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 17:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7140814A081;
	Thu, 13 Jun 2024 17:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xc2q+4VL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC80149E14
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 17:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718298316; cv=none; b=PlbN6jPpe2Asybsva+oJFP60dkt9sEaxddv+Y9DcqX0jmDm7To1oh4fTkUhWDAKEfYZU0XTcu78gwMQNigJEtxAsWgpJD6lXXN/FsQOA/Ik9f15cqNKGt0y5GPGNb8C+IZy2DOMYePSsZigGgV510TI+FSsHIY9ikRpBy+JY1lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718298316; c=relaxed/simple;
	bh=ueS1wf8UISai/dHWZNsJmGTXzlQKS5D7cMZLTp/g7pM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aDd00YUL3VluK5RCFjvsqtUKtAg44SZ1udpHNlYklTIfA3kbyL9eGKa0BAyN3ayK+0yDM/EuATv2cUoD15llLoIyUMt4TvB2cJ36mydJYpFnDG90Nbn/0N2F4V3LSkrbYXgR7CfMAK1ALVohsf0oo7YY+E9DrLCE+Z3noKf98Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xc2q+4VL; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ec0f3b9cfeso1023471fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 10:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718298313; x=1718903113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jFIftxDedqw0XeujJ+yqXgGm8FkPdhMhPZNtKoZN16g=;
        b=Xc2q+4VLUu+hTs4iZOuOdG6nZn8+Le+zv4JekDEd15p0nlckkN9K273rSdMbMtWIai
         HywGpV6CQ5HnZDLU2YpbxnxlwNDack/TuHZ3bCU+pNiyQc6PNebsCXoQkLbv8DOWiyZQ
         Vm5vl3IWhLsmEMeVdXvg6wJfJ1ZUPlB7SP0+KQnsQnC4ZFEH0eY2UUT+krOACQjZPao/
         oB2ehPd/ZEm642GQNOMycNvAJT4loVhT/Vm4rxcBrqReTMla4Hhjl0MwaMOwqs2Vb8n3
         zQkyv1UALJZWV6SeyxYIwTVnzl/R+6Vd1Kcbgoim0/ccOlDcU2ABjS46pQnLrayt6EEw
         t9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718298313; x=1718903113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jFIftxDedqw0XeujJ+yqXgGm8FkPdhMhPZNtKoZN16g=;
        b=PcEN8gxwbVOp6HXOtDGMRTgeoucrCZJNJmbR2gHMzb8yt4r+UBiiMhjvBXMf5j7q+8
         wOj/cQ+81YHjs4j4MQTCZlclzbHXXQxGw7MhvMmVJ35G3WDSNd6TEPK4Y7lrQ0g5liBo
         aH6beVmsietba1Wk0I9o33c3xTCLfSeiGRGQCvHbgo+sjDIHkGyKAJZv1W9nZ427cUZM
         EzRLRbOshcPueFt1qJwrMESP/8Ts79m4ptOuoR/gtdDOgWhHT8huz0o8bA7W7tCyEDTD
         Fvi7YMvLI15tLT/LzdYcrAS1Ph05OfYTPjcguef6oaoVYmj0auKNMo98JVTWkaV22XgJ
         s1tw==
X-Gm-Message-State: AOJu0YwSfakNtW8yG97RVw6VFiyU8JW4AUEydjzNq8ogsT3H8QNoEgiH
	R61ghPGLK7ZDdQXsUc/6Ja0Vt0YkXMiZcecnOgAN5apY2MbU3jtv0UwG54nLxTI=
X-Google-Smtp-Source: AGHT+IE2l88kV8KRfmueofaMiGT9jOC6bDnGDLEFAidZGySARjBWwc6bw1tMCn2EDrlw3Y+pvm3faQ==
X-Received: by 2002:a05:6512:3c96:b0:52b:c0b1:ab9e with SMTP id 2adb3069b0e04-52ca6e564d2mr272152e87.5.1718298312739;
        Thu, 13 Jun 2024 10:05:12 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2825733sm287312e87.60.2024.06.13.10.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 10:05:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 20:05:11 +0300
Subject: [PATCH v2 8/8] drm/msm/dpu: rename dpu_hw_setup_vsync_source
 functions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-dpu-handle-te-signal-v2-8-67a0116b5366@linaro.org>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
In-Reply-To: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2201;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ueS1wf8UISai/dHWZNsJmGTXzlQKS5D7cMZLTp/g7pM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1q22qFk9TX8rEHKdSeV7vy9tNmzxVbbNr3lv/3a3qeZI
 q84j1/qZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEgmU5GBoePXzIn1bMMMlk
 5afCiHcR50/Z2f5WMD306KHEZLaOs282zjA4njA7OSDF8O3SQJmHb9k39v5VuCkV0WekwZ3Cp7L
 8OM/GHwv9JG2VLwXuPMXUf9anmE9BMNXto0gjV9WCVWq1B0I3bM9Kdsk4u/O/QHh2OS+P2BaGxt
 l6YZoXprO6Htl28YWLihbD+dwl37okXVQ2t3isSJWOO9L6ZrvHl1v+q04u/qv5csP2K/Ir2W+uW
 v2vPau/X6k9bJJMxJ7IMAf9c33KvZt0XI10Q3t3svW3rXp+cPuNOI03e0878N14KBqZEZyy8bGW
 8mahwszwnFyTnPYA8S8qzemSN62+a270fzjxXIxEgf0fAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Rename dpu_hw_setup_vsync_source functions to make the names match the
implementation: on DPU 5.x the TOP only contains timer setup, while 3.x
and 4.x used MDP_VSYNC_SEL register to select TE source.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index 05e48cf4ec1d..6e2ac50b94a4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -107,8 +107,8 @@ static void dpu_hw_get_danger_status(struct dpu_hw_mdp *mdp,
 	status->sspp[SSPP_CURSOR1] = (value >> 26) & 0x3;
 }
 
-static void dpu_hw_setup_vsync_source(struct dpu_hw_mdp *mdp,
-		struct dpu_vsync_source_cfg *cfg)
+static void dpu_hw_setup_wd_timer(struct dpu_hw_mdp *mdp,
+				  struct dpu_vsync_source_cfg *cfg)
 {
 	struct dpu_hw_blk_reg_map *c;
 	u32 reg, wd_load_value, wd_ctl, wd_ctl2;
@@ -163,8 +163,8 @@ static void dpu_hw_setup_vsync_source(struct dpu_hw_mdp *mdp,
 	}
 }
 
-static void dpu_hw_setup_vsync_source_and_vsync_sel(struct dpu_hw_mdp *mdp,
-		struct dpu_vsync_source_cfg *cfg)
+static void dpu_hw_setup_vsync_sel(struct dpu_hw_mdp *mdp,
+				   struct dpu_vsync_source_cfg *cfg)
 {
 	struct dpu_hw_blk_reg_map *c;
 	u32 reg, i;
@@ -187,7 +187,7 @@ static void dpu_hw_setup_vsync_source_and_vsync_sel(struct dpu_hw_mdp *mdp,
 	}
 	DPU_REG_WRITE(c, MDP_VSYNC_SEL, reg);
 
-	dpu_hw_setup_vsync_source(mdp, cfg);
+	dpu_hw_setup_wd_timer(mdp, cfg);
 }
 
 static void dpu_hw_get_safe_status(struct dpu_hw_mdp *mdp,
@@ -239,9 +239,9 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 	ops->get_danger_status = dpu_hw_get_danger_status;
 
 	if (cap & BIT(DPU_MDP_VSYNC_SEL))
-		ops->setup_vsync_source = dpu_hw_setup_vsync_source_and_vsync_sel;
+		ops->setup_vsync_source = dpu_hw_setup_vsync_sel;
 	else
-		ops->setup_vsync_source = dpu_hw_setup_vsync_source;
+		ops->setup_vsync_source = dpu_hw_setup_wd_timer;
 
 	ops->get_safe_status = dpu_hw_get_safe_status;
 

-- 
2.39.2


