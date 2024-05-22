Return-Path: <linux-arm-msm+bounces-20195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5528CBF9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 12:51:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38863B2179C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 10:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89BA282492;
	Wed, 22 May 2024 10:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TjNkqHKI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6DE82491
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 10:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716375065; cv=none; b=ivgb0d8UX8ooOY0AsSQzNVipSscqWPVg0xGLAj4Zl+W9htc2wn2CrIBEGxkDq84UERzszDq/Z3gttZMH4H30Z5NwWmU4DIcUWQot+/dBtnV8/dGvGPCgdpkzWFuS/82lX/o0f4ix9D5xRs8yJtK6p4tpa2jjh6d3HKzEf28xTn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716375065; c=relaxed/simple;
	bh=osqs9uVQGma2pB7Uqqmi191XkOj9NO2HEt9nbTjIsVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gJbfgDbHj4ZaTcyEYAsBPiIpk804tpfKyzNhar+O8ceX5vkv4FWTEAXYVTCQ9GbyngaSrAHAMYZ/GCxnANfrjm36+rMhWU8fkE1DjbAAuaEw411dmqwD/gWpVCcg9GFpCGm7lW7eQn5i77Mqwji+f0UaD4m5QJKKtL93M2GRl58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TjNkqHKI; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51f40b5e059so6899520e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 03:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716375060; x=1716979860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9dResiOVnD3KDBKBragxWJ8JzwAGCkXgZAm144m2F5c=;
        b=TjNkqHKIdYxxWe4LEmJ4nirZAc8wdlcMp/EIEPugcFw18uo8hykEaqzHc6Of5TEfeO
         79JcefWoluPbRVUbJOglmYTXbZHK273twte6kDaFWa9HVN7/w8YFlw+O+r1R7otjXaos
         W6RotYZJRxz4SxXrO/ZdkFSedhT24T+IdImGOmqCByJ1ssxBOeOomSlY8VFuEekLalP4
         FYsSXuYdU/Vowx2HZx1mCw13evMhQHSwpyHI013Ux1o0FJwuyRgEWs0SK0TiJ41pzVs/
         RvybGeFXC3xcjjbogfVQcPRL2FYfp3Djekbi8k+w/yVxfrO/LruqNkuUnNP17l7Bo7O0
         V2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716375060; x=1716979860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9dResiOVnD3KDBKBragxWJ8JzwAGCkXgZAm144m2F5c=;
        b=RyuN5X0Gc2X53xO38yD9kIXdZO1GjZoFtw/FslAVDJmrEvfmJXfjbJKW6APSysA/Ma
         RODJcxxpFs4zn0K3hIsI0c7KEtBCVqCF+AOPYuNZoLxCQMe2q420ubmG+CP2PR99dJjy
         RueeRpZVkM/Qr/pyOSnz/GLjUWUX9b7ZKUja27zAkg54EyuW4sE+DUU9993dhVRriN5n
         B29kjKM6xrrgx1MmbNI3XQopEE0oC0rfa476pjEj7Ile4FXnsBvgYeNJ4ygNBlOom3K4
         cy71aPHH+1vHfr4Te+78Zqz3reQlhG7giObXvyK1rsJ6AJzIXYMdONfg0wuiWdjv5JtC
         +ijA==
X-Gm-Message-State: AOJu0Yy2Dmx+NMpX/3sKlLth+xu7przOKxUVp/nbC0w5/O7+OzsoJ5FR
	99gTbG49VsY82tRfLtyBFM5Pi7in9QkG3KEbP6/8vp1gAlYATh9GhSPYP92mpryWtR/xYRyxUi1
	l
X-Google-Smtp-Source: AGHT+IEOC9Mt121LUZMOGbgq/bBML1Pc3j8MLinnpLNjgkjcRolQAPuoJbIEqAzUiz7UiRJq4scneg==
X-Received: by 2002:a05:6512:1583:b0:51f:5d0a:d71a with SMTP id 2adb3069b0e04-526bd694ab4mr1047130e87.10.1716375060602;
        Wed, 22 May 2024 03:51:00 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52431778ec8sm1279126e87.194.2024.05.22.03.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 03:51:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 13:50:55 +0300
Subject: [PATCH v2 03/14] drm/msm/hdmi: switch to
 atomic_pre_enable/post_disable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-fd-hdmi-hpd-v2-3-c30bdb7c5c7e@linaro.org>
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2151;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=osqs9uVQGma2pB7Uqqmi191XkOj9NO2HEt9nbTjIsVU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTc4PCjd2hgbwjgDirDxBNAxSDUfP1Beqm985y
 mK3+UPx39GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk3ODwAKCRCLPIo+Aiko
 1WPYB/9GLMl/u2GZ6jjdkuV0W4HL2lvbKpyLAgp7znyuLJlQUAPszh1vOixoX8xNGhFns22vham
 I4iJi+J8EkXyOxci+LIH4tRVsV/SxwHRSEW/e3Cw2bXrKQmcDYv7fd+0GHrCCLjcpCMyebaojiW
 zRBJyJl3CHbBr5p9gzsVLMJylnF0DZTA1ug30vaVjh9K08tofK+gyZ4Ispn4JPX3qyHCuXfciM2
 bPq0rZyOMrJ8bx5Jt46S0g3gIGzI3yhMeb83rVW7IeutOq0m1XsS63rQmH/ccGOypBcBVfxVRjx
 JO7Ny9cUSQ2fG1qG4VcrKyPdZonoRdiIM6VG2BeF/b+MX3uD
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In preparation of reworking the HDMI mode setting, switch pre_enable and
post_disable callbacks to their atomic variants.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 9eb4d06bdc0e..3c6121c57b01 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -120,7 +120,8 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
 	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
 }
 
-static void msm_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
+static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					      struct drm_bridge_state *old_bridge_state)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -146,7 +147,8 @@ static void msm_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
 		msm_hdmi_hdcp_on(hdmi->hdcp_ctrl);
 }
 
-static void msm_hdmi_bridge_post_disable(struct drm_bridge *bridge)
+static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
+						struct drm_bridge_state *old_bridge_state)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -292,8 +294,13 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 }
 
 static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
-	.pre_enable = msm_hdmi_bridge_pre_enable,
-	.post_disable = msm_hdmi_bridge_post_disable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+
+	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
+	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
+
 	.mode_set = msm_hdmi_bridge_mode_set,
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.edid_read = msm_hdmi_bridge_edid_read,

-- 
2.39.2


