Return-Path: <linux-arm-msm+bounces-6549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC63D825D28
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jan 2024 00:34:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 744511F2438A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jan 2024 23:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF37B364A5;
	Fri,  5 Jan 2024 23:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LPxoWth0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5996360AE
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jan 2024 23:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50ea8fbf261so70636e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jan 2024 15:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704497658; x=1705102458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pivXLuv3moQJBJFOlfzUjv/WGq0UATAH7Ew9ljEMyg4=;
        b=LPxoWth0+Dz0gOHJAmUE7pw8+rG9W0gy2HL9by3XMA6B6bYmWXF1XNN6lyVRCHL8qx
         EcRurGeMKj18ag3NMXEnrhOlZLlF2YjM+oszGsEmISwxLPdSfUbSi2FyYwk+7P1eyG8H
         bl94sxZoANEQXozFoTi/bya2bIKfuoUBcjEd8fI+VUnFnEwhWSf1ymeeefaxcvROzkba
         nFZvHkzW6pzx2UihdMjAhgttItpMVyMkGA/xi97IHV7gu0noKFMbpCqxm8zUJv+Tr+UE
         z5XnsN/ieWb4xRRwuXYrpocGqxg2DJItI1bCzswCkIWS2UZL/vcsyBi3E13HiYl6fOMI
         n8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704497658; x=1705102458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pivXLuv3moQJBJFOlfzUjv/WGq0UATAH7Ew9ljEMyg4=;
        b=s59D8n3pBqQTQVpVYbdI36vfZvQPQF7iuoVrkhfo1WhUhFbzLenYJD4n4cMDtKwqBE
         PJMkcIXBjdkeCX85j2J31POr2QpPe2ddopurlnUM5J08gsFldbZiMIN+rF7e0tqag3wN
         9gM9rgvbuRZLtpvP7Qvp4ZuTHoQ3Ii0px9VycAOonYwO4/x+TXTFNfVXDVkMef1BGOYg
         GkD4NadxH7VHjry4M9Na0nKgCeauBHR/TK7BVCEC8O2fgkMQBgd1KQUTjn3xes5WOHtC
         IATc7w6T5NmVbPk1ikNLItxj8VQWaNN3R3zziITVXP0YHxF/aR3RSZ+A8UXBwm5g9TRE
         iVHA==
X-Gm-Message-State: AOJu0Yw3wKfFQOSYCEzkYM8xW8V/NT3x9pguC9RbuhAw2RQq3ITnZ5RN
	4NSCyFezo8gtzGj0uQv/HbYB9todbDV0WQ==
X-Google-Smtp-Source: AGHT+IHjjfgIUzKUmYx8HvWto+XFSDXGxrDrzCnNGlIaweKA9Pizp1MjnofAvmLAwmRQ4ywaKSuTYQ==
X-Received: by 2002:a05:6512:1304:b0:50e:b206:50f6 with SMTP id x4-20020a056512130400b0050eb20650f6mr105571lfu.62.1704497658026;
        Fri, 05 Jan 2024 15:34:18 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k4-20020ac24f04000000b0050e74d04c8asm362211lfr.132.2024.01.05.15.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 15:34:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 06 Jan 2024 01:34:15 +0200
Subject: [PATCH v3 1/4] drm/msm/mdss: generate MDSS data for MDP5 platforms
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240106-fd-migrate-mdp5-v3-1-3d2750378063@linaro.org>
References: <20240106-fd-migrate-mdp5-v3-0-3d2750378063@linaro.org>
In-Reply-To: <20240106-fd-migrate-mdp5-v3-0-3d2750378063@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2820;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=LkZVf/+xPhq0hvOZBHDG1k3f2Ti6cdXMRdV8DhuZcww=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlmJH3neGn4tNLgH5uqv+GRDujihKsIuYzeU+fQ
 q1wipxEVTKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZiR9wAKCRCLPIo+Aiko
 1Yx5B/9qCYBUPIhNXXCNksAqS7Arv9TpBfuk3jYAtOIwuslsf84dtngnOJy6DXX8QwgKpSXgDe5
 JhfPlKOHR9iZhYK5hS+C7iwVbnxvAPpdrd9Sywmekw1jdXD/dHqJIh2i5zEfj0rtE8rxaa2TPF9
 deM0w/KJ3NIz8Uu1jb8Bi+PlnwiBb6hF9y0B5Mj4/TNl/a//GjhBJGxY0RCpdck24Tmcm+HrJsP
 wzskwxbkgDYAjlaGhfEYZHoYz5WQddJgOS0LAk/hk4qamQvaJBUlIlZSYNqY0s/JbokBghgyYjA
 ZMWyStoIRyPRfOWmjpgpomAa1vpzfGd8sMkF08lDj+F1roJy
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Older (mdp5) platforms do not use per-SoC compatible strings. Instead
they use a single compat entry 'qcom,mdss'. To facilitate migrating
these platforms to the DPU driver provide a way to generate the MDSS /
UBWC data at runtime, when the DPU driver asks for it.

It is not possible to generate this data structure at the probe time,
since some platforms might not have MDP_CLK enabled, which makes reading
HW_REV register return 0.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 51 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 455b2e3a0cdd..566a5dd5b8e8 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2018, The Linux Foundation
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/interconnect.h>
@@ -213,6 +214,49 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 	}
 }
 
+#define MDSS_HW_MAJ_MIN		GENMASK(31, 16)
+
+#define MDSS_HW_MSM8996		0x1007
+#define MDSS_HW_MSM8937		0x100e
+#define MDSS_HW_MSM8956		0x1010
+#define MDSS_HW_MSM8998		0x3000
+#define MDSS_HW_SDM660		0x3002
+#define MDSS_HW_SDM630		0x3003
+
+/*
+ * MDP5 platforms use generic qcom,mdp5 compat string, so we have to generate this data
+ */
+static const struct msm_mdss_data *msm_mdss_generate_mdp5_mdss_data(struct msm_mdss *mdss)
+{
+	struct msm_mdss_data *data;
+	u32 hw_rev;
+
+	data = devm_kzalloc(mdss->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return NULL;
+
+	hw_rev = readl_relaxed(mdss->mmio + HW_REV);
+	hw_rev = FIELD_GET(MDSS_HW_MAJ_MIN, hw_rev);
+
+	if (hw_rev == MDSS_HW_MSM8996 ||
+	    hw_rev == MDSS_HW_MSM8937 ||
+	    hw_rev == MDSS_HW_MSM8956 ||
+	    hw_rev == MDSS_HW_MSM8998 ||
+	    hw_rev == MDSS_HW_SDM660 ||
+	    hw_rev == MDSS_HW_SDM630) {
+		data->ubwc_dec_version = UBWC_1_0;
+		data->ubwc_enc_version = UBWC_1_0;
+	}
+
+	if (hw_rev == MDSS_HW_MSM8996 ||
+	    hw_rev == MDSS_HW_MSM8998)
+		data->highest_bank_bit = 2;
+	else
+		data->highest_bank_bit = 1;
+
+	return data;
+}
+
 const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
 {
 	struct msm_mdss *mdss;
@@ -222,6 +266,13 @@ const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
 
 	mdss = dev_get_drvdata(dev);
 
+	/*
+	 * We could not do it at the probe time, since hw revision register was
+	 * not readable. Fill data structure now for the MDP5 platforms.
+	 */
+	if (!mdss->mdss_data && mdss->is_mdp5)
+		mdss->mdss_data = msm_mdss_generate_mdp5_mdss_data(mdss);
+
 	return mdss->mdss_data;
 }
 

-- 
2.39.2


