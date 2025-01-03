Return-Path: <linux-arm-msm+bounces-43888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1F5A009A4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 13:59:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E9D83A4A0D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 12:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27BE31FA8C9;
	Fri,  3 Jan 2025 12:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SZkW3Dhr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87C71FA27F
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 12:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735909133; cv=none; b=Obuy3qETcPyPxQrebeWRI7g8f2tnZL3X1Z+CsCkWmV0cWBVv3PwXMVy2lproND3KrS8N/B4RTZPJn4wCIPLt4Cf7y0cDa1OhjbJUD2OHjeMrpbwE1ZYLoPjP1or0uG02Q+HxWISvcru0P9rXZ+ZNOTN/FJcOZZPgdYmRzb7juPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735909133; c=relaxed/simple;
	bh=IAGUczkW072b8mGGChIWkavp4t+w24yTtaDV/z14qGY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bDFgkJ1zK1RjpojrSX1s+ppMO/fDzPrvkdm275rL4gI8ymsj3F+TrTO1hUHclNcrR5Ma1zp/798mTS9r7xhmN3r4hJoPsDS6BrmzkaDLrYWyA4BkqAtMacd/1kUsIpCpFQ3vTKkHcSLt24fmjJFzmPDp8+7xt5oA0labrJL4qso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SZkW3Dhr; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4368a293339so85430615e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 04:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735909129; x=1736513929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OKAq3a0q8ySBqrMfqf9zRs6QOpHzCqi3UnYgQ6KB45c=;
        b=SZkW3Dhr2QXijy130+jLmKf9Jn3DaWExi/PaI4rKt3xTmopKx1XJCFn7/N+tyTYl4j
         MAjRY8gNwqeaQeEYE+XiRAUOMLHwiIX2d8FiCFLtjPZgfcErMkIBs/uqDz5ChM647w3m
         24I5ydWj8cpYA/W4JMhR9lyjJ2L35vDPjQNSHt8EbNo8TTBShu/xXspf5WReO+IHCguz
         3zaDZHi9FgKLRZ3gtag8qCYM3twYVoga/OQWKGg4DTRiSjjZjl1mybvgK43kR+qariMB
         zq+zeoAHViSWgRHuOqrAlnlKX2IgqV92Olaa5pa3vmOpHWAjk/pwK547ifBI5XId+eDF
         FOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735909129; x=1736513929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OKAq3a0q8ySBqrMfqf9zRs6QOpHzCqi3UnYgQ6KB45c=;
        b=DX6UVNc/BMF3XMWMv0MzyofiiMrRD/zu5cL7KE2itJjxz2+ruefC/KA7w2mnsSRP/G
         CQUWRF4jzLQKVo5ZHQyfrPufYE8SqvqkwOAQDbHxLUmiV26cA5FtrEmBQ2QlW8a8/Mm9
         UyOd7LCiXAxT8zeENN1qq4FvCfgg+A67uAmojO5LjqkkhoyU3YqbD6AGFjsYvMvhP7Hj
         cXrBcMr9kScXJ6pb22Opb6qZpC0vYUwl0KrP/jlxFM3IbDrdP//NYldttlma2sME+pg4
         r/0iZ7PAzQTNlh1+NDuYOGpN+ASCFJ4gFofz+Og/wlNeKGoCph3NkqKCy2nPpbOOE63y
         KjKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVB7WAR7bLARmue9sddVF+2mezDcrCF/h3xgkViqlYW2zDg+d7uTFgkcswtOpLs/8mPmFDSIouLOPvBSE4@vger.kernel.org
X-Gm-Message-State: AOJu0Yxef+AM67RuEoP0Ed+SlFNPZ4pWW5muBMk9zFnDwmetCNDjQbAX
	9f7NWZRxtFQkGzjn9EPbzj1mmR1HOun35qdfOAeQYDXOyhzXcVt0SY7iJ9XnJxc=
X-Gm-Gg: ASbGncsuv088lyomQWaWkNmAwTpbyN55uOykGBXnO9pR4KSEyvW1fTu2c1BvS3yX8d1
	M11NiLyS7+59ntnAL/WHvNGUMQZGXHOHWTt90E9A0tz9nJklYZsrr1A9Mp3+cigsQf5ENWmDutI
	e9aK7wpWpKZKWnhUYhi0hMvaxL2WO0VQ/djDqXzOzKBQP47eg4rUSavKkrzX0l41urTP8OBLDWl
	3oYMgmuEdjm0FoM1jVbjeyiGyO2rwP7lYbR0hQtGCGvsseRyySUczVq
X-Google-Smtp-Source: AGHT+IHD8YK70XCWsS7Q8xW846WSlCt8IGnNQia/YfnRwEzKk1+3N50SwVA3xTK+T6w7X+CkkhvEfw==
X-Received: by 2002:adf:b30c:0:b0:38a:4b8b:1ba with SMTP id ffacd0b85a97d-38a4b8b01d1mr16138981f8f.14.1735909129150;
        Fri, 03 Jan 2025 04:58:49 -0800 (PST)
Received: from [127.0.1.1] ([86.121.162.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acadcsm40225591f8f.105.2025.01.03.04.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 04:58:48 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 03 Jan 2025 14:58:15 +0200
Subject: [PATCH v3 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-1-5c367f4b0763@linaro.org>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
In-Reply-To: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4243; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=IAGUczkW072b8mGGChIWkavp4t+w24yTtaDV/z14qGY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnd98AKCbN6HYV2+NFqGW7h5ppSXp32Xa6J/RTD
 a0btqWjPhuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ3ffAAAKCRAbX0TJAJUV
 VggyD/4r5JoRIbCRjEq+MPJyTb4GwkaPFIb5NyhhsBjJZXXCUuYCS09PW1MGmb4pKaO5I1vX+fW
 a+a3Vh8RMMU0dR7yFgi/LATU68/SniAxsC3OBbPDECwT6XdIusMV77aoFVKyipSJ9gflsiBUN7U
 huB+z6rK663s0CGIOVrFtCSTuuB+ibyRD2VHWDx8ZyPBAdM6yv15S6u7MrLCGvcRZfX2/jMeJl1
 3D70KtIzVXqXNy/CYN7H6DMWbu99oXMANZCHdYTQWGtxb6ODdhhXCl7n5iSUBSbX9gfX8/KEph+
 v/tENqZ7PBV49JJ8WSrn2J4HZUePGn4He0aRdoKFbsRU1GfAnrpxDwSqlC2FAl/wp/eCVcRN7ZI
 PFbEKVvndTc2HUkKxUVOw74s63TDSBInqXXqjBH2/oUKNz4uB/NywN1Hg5IL8WBWtLiBjJG1Cmb
 DdTSbvbSkS1sTEFE8H1SM5bGxv2RBEPUoKOlJiYarux3+clnIZrJLhOicKyhLCA0E9C96Q+93CW
 pVnYkyYFN/aI/d06XbqYzEaONTNjir8o1GVo7O4WCjmKEk1LCPoso7V9sJ77ZVwdI3wLcqrWS4o
 t2k0YpThtHc0CkG2sXGtKyZXmYUEgDS2aromcAXcu/wjaguuahZIYnGMNUkERlL4ZT3ZnIsBa8o
 ZSsvi4Ypj24qAAw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

According to the DisplayPort standard, LTTPRs have two operating
modes:
 - non-transparent - it replies to DPCD LTTPR field specific AUX
   requests, while passes through all other AUX requests
 - transparent - it passes through all AUX requests.

Switching between this two modes is done by the DPTX by issuing
an AUX write to the DPCD PHY_REPEATER_MODE register.

Add a generic helper that allows switching between these modes.

Also add a generic wrapper for the helper that handles the explicit
disabling of non-transparent mode and its disable->enable sequence
mentioned in the DP Standard v2.0 section 3.6.6.1. Do this in order
to move this handling out of the vendor specific driver implementation
into the generic framework.

Tested-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 61 +++++++++++++++++++++++++++++++++
 include/drm/display/drm_dp_helper.h     |  2 ++
 2 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index da3c8521a7fa7d3c9761377363cdd4b44ab1106e..0f665d9adf02cfd16f0c250eb7ae8fe0461f8fdd 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2817,6 +2817,67 @@ int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE])
 }
 EXPORT_SYMBOL(drm_dp_lttpr_max_link_rate);
 
+/**
+ * drm_dp_lttpr_set_transparent_mode - set the LTTPR in transparent mode
+ * @aux: DisplayPort AUX channel
+ * @enable: Enable or disable transparent mode
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable)
+{
+	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
+			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
+	int ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE, val);
+
+	if (ret < 0)
+		return ret;
+
+	return (ret == 1) ? 0 : -EIO;
+}
+EXPORT_SYMBOL(drm_dp_lttpr_set_transparent_mode);
+
+/**
+ * drm_dp_lttpr_init - init LTTPR transparency mode according to DP standard
+ *
+ * @aux: DisplayPort AUX channel
+ * @lttpr_count: Number of LTTPRs. Between 0 and 8, according to DP standard.
+ *               Negative error code for any non-valid number.
+ *               See drm_dp_lttpr_count().
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int drm_dp_lttpr_init(struct drm_dp_aux *aux, int lttpr_count)
+{
+	int ret;
+
+	if (!lttpr_count)
+		return 0;
+
+	/*
+	 * See DP Standard v2.0 3.6.6.1 about the explicit disabling of
+	 * non-transparent mode and the disable->enable non-transparent mode
+	 * sequence.
+	 */
+	ret = drm_dp_lttpr_set_transparent_mode(aux, true);
+	if (ret)
+		return ret;
+
+	if (lttpr_count < 0)
+		return -ENODEV;
+
+	/*
+	 * Roll-back to tranparent mode if setting non-tranparent mode failed
+	 */
+	if (drm_dp_lttpr_set_transparent_mode(aux, false)) {
+		drm_dp_lttpr_set_transparent_mode(aux, true);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_dp_lttpr_init);
+
 /**
  * drm_dp_lttpr_max_lane_count - get the maximum lane count supported by all LTTPRs
  * @caps: LTTPR common capabilities
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 8f4054a560396a43750570a8c2e95624039ab8ad..3311df3b58255cf0620391d0948ccf6b569a8a34 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -630,6 +630,8 @@ int drm_dp_read_lttpr_phy_caps(struct drm_dp_aux *aux,
 			       u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
 int drm_dp_lttpr_count(const u8 cap[DP_LTTPR_COMMON_CAP_SIZE]);
 int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
+int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable);
+int drm_dp_lttpr_init(struct drm_dp_aux *aux, int lttpr_count);
 int drm_dp_lttpr_max_lane_count(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
 bool drm_dp_lttpr_voltage_swing_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
 bool drm_dp_lttpr_pre_emphasis_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);

-- 
2.34.1


