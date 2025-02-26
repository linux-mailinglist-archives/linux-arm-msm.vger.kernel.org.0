Return-Path: <linux-arm-msm+bounces-49453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC58A45933
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 09:59:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEAFC16AAF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 08:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D322822425C;
	Wed, 26 Feb 2025 08:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u8sqDx7d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB240224246
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 08:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740560374; cv=none; b=kZNx3ja9oj+dvi+zCJgrLM8C3f5BkLKaSIG1zJCKHjs6vHiwx54mqLWF24shtcWJHFjJFiApaUBNVwRWJWFbC3csTOIDe2XCcqiafT8EzrZriKxX8jLGfGeLA7rh+YFsxd5bs9V+NDwKaJ5+zVVN9Ndt+My++yjH1DK3VmmIg4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740560374; c=relaxed/simple;
	bh=f0rJpJCum+b7lqaI4sn4V9SXHt/v6K6WBKvJft3vbro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h3MD3ENQYHiNrBkcMZ3k5LiLSeUVmzgpZK4AhhDhQtKMTnIpG4cW9Fg1ZNBX4Je4WHRBiyuQaGtszed/L4nDsgjMN5naqPma49Jaogvs1xXhDAZvlfItNEIZaYIfQgOpkXwgAyLpMUQHRzNvdWQNVnq1dSeq1+IggQnHmUmYYuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u8sqDx7d; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-548878c6a5aso1580462e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 00:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740560371; x=1741165171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJeDvmYfwTrdzYlRuhgm/ygX8U3uOitNLlW6Q4NvxDE=;
        b=u8sqDx7dF8J76pNEhn24VRvrilFHR8ZcwskAS9DZ0NRChS0agCzAChJhucM/F8IV1I
         dvzVOjZqqNyu2t6m3/U7A6WKFwm08CohYrFGEkRHxElZ2hZ5DtgodEW+YEs27sn+2Qn1
         vgeoHXzWXJx//yIXnUd93ZsHTt12Ev4aGu6f6T6D/aviIwTW+hclWrnqXMiQYUlzkGdn
         ZY1YUz4FaYXcCKGTlJM41Z9CLFoFs21p/Z9EYVfTPYvNq3xRQlgJP8f3j4ghPysLmA8i
         x5F5m25IifjoMoOBW7S6UuL8WSvSaAs4Zvt2YVeZ/yCiH3i4Rg26usLRKt/ZTHu1bR1x
         +6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740560371; x=1741165171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJeDvmYfwTrdzYlRuhgm/ygX8U3uOitNLlW6Q4NvxDE=;
        b=H5nKKlRglka38hmsBrm8DpOKRWK5KCOhKraeR9+DhBRsgcnt0J/vOtYPhSGxFFdTjz
         8BTmDzRLMy+wwS5nyRi2Dxt6/9NHV8alhzwXleJINk0/dmDMuodQkUr3pDBMl/JQPZSS
         Jq+rsPzrFRQZ9g+evCccN4XjjwSSqyd2AnSK6RCXCLsHIC71oXT5+UCbBA+AHC1bAqw7
         Pl912XFtwhNNdUWa2Jhlooyv21rLtwd3OaVzmZ/PxkliRMAerunqseXWVE8hogbX8nl1
         vB9pc4rHuRS+nFDbye5a9UMyEXtZe2Ivcs2drbPafZXFlga1Q0lbUD0yHqZ892QH5EIa
         zBbA==
X-Forwarded-Encrypted: i=1; AJvYcCURixQEpy77pgEtI1MpmmWz1dQMWjFL3AMhvQvbIC4acpPZUIEQr6X0JxTO6wbDuMa+eQpZxBrKBLHrURmN@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb0ZlzvjIPlb6HX5rVGLuyhVz2Qdvf+94etz75NYX22D0Q1QGS
	Wm3twRLNlTfryFGmi/M3ElD/7DbwQzP0DqJL4ngPcAt9YNXLOHjPbzrvGdIAlck=
X-Gm-Gg: ASbGncv0NCxsWyZAGKQRK/hJv9TUcTh8SVZhLzomCcolkyJOrn8O9LgmKEySTUMhOkX
	/+WB5RiIJWE+DsJ/i/OlVTIMhmZRPOh236UG2L+jTx4DxXrCaBsbq+7pIV+p48WZoortkElaWlc
	/LXqk9xfrQAJVPtQ8J7+x35J9c29Ekeo9oCTbxKuR/rPZ+kEaAyzlHPpxFwv+ejE3Z1JCiXDQES
	29RPBa3JN0LQ/fBDOA33NG5Br8HIn30herb9G7S6w7Xalp0bOPX1Vdg+kID7p99Utgpv6U3veQM
	dSoMBr/uGYeeTWUJ/FGyXn1FtCsqDBQKUQ==
X-Google-Smtp-Source: AGHT+IHnyRZE9xXoxSH11WZO/mjHOb7FtOwcpzIW8SeHSDOj8wlDRd0QXQhax5YrxPLGfiQ8QHD+/g==
X-Received: by 2002:a05:6512:b98:b0:545:2c86:17e6 with SMTP id 2adb3069b0e04-5483912fcc4mr10487208e87.5.1740560370919;
        Wed, 26 Feb 2025 00:59:30 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a819e0c49sm4556641fa.10.2025.02.26.00.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 00:59:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 26 Feb 2025 10:59:24 +0200
Subject: [PATCH v8 1/7] drm/msm/hdmi: switch to atomic bridge callbacks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-bridge-hdmi-connector-v8-1-340af24b35cc@linaro.org>
References: <20250226-bridge-hdmi-connector-v8-0-340af24b35cc@linaro.org>
In-Reply-To: <20250226-bridge-hdmi-connector-v8-0-340af24b35cc@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2282;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=f0rJpJCum+b7lqaI4sn4V9SXHt/v6K6WBKvJft3vbro=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnvtfsfP5JOx4k9UNQsIABWXjlycLBo0B9VJPQr
 V2fMgIBoe2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ77X7AAKCRCLPIo+Aiko
 1fTVB/4gVuuKglGSNvRERQTsX298FmX2Q10UUHn8rmqstQrQ8oMQIL4EaDQp8VNkz1PLE/1bw9p
 ksul49Hd3DEFRM5mq8/7INGZ1FEwRZ7ZQr20Z1edKNZ7PUsgea7eUlODfTUbYlONna9hVUzi0yT
 t0QE8MLblgVWHsQ+oN0Wb0s64tF3dFG0Pk2n13YcIEjMvw/u6d5VEaY+ZrxkV1CV/Xs99XI/IiB
 2WhjKiDSBtHxwbDhn5hviSxdlcMDBOMhSIVKkizA6v3tscwuKGbmAAp7GIIS9skFTEo8icdswxq
 QciDiWte6IZK26X18olApN11vmF8XCRoM8ygHZC4jcZiIasf
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Change MSM HDMI bridge to use atomic_* callbacks in preparation to
enablign the HDMI connector support.

Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 4a5b5112227f516dfc4279d0f319ec1e5b17f240..d839c71091dcdc3b020fcbba8d698d58ee7fc749 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -126,7 +126,8 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
 	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
 }
 
-static void msm_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
+static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					      struct drm_bridge_state *old_bridge_state)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -152,7 +153,8 @@ static void msm_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
 		msm_hdmi_hdcp_on(hdmi->hdcp_ctrl);
 }
 
-static void msm_hdmi_bridge_post_disable(struct drm_bridge *bridge)
+static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
+						struct drm_bridge_state *old_bridge_state)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -299,8 +301,11 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 }
 
 static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
-	.pre_enable = msm_hdmi_bridge_pre_enable,
-	.post_disable = msm_hdmi_bridge_post_disable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
+	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
 	.mode_set = msm_hdmi_bridge_mode_set,
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.edid_read = msm_hdmi_bridge_edid_read,

-- 
2.39.5


