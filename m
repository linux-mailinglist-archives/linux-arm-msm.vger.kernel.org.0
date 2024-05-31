Return-Path: <linux-arm-msm+bounces-21363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 032938D6A68
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 22:08:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8E0D288AFF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 20:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E8317FAA2;
	Fri, 31 May 2024 20:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nkR9A2AX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F64C17E46B
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 20:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717186056; cv=none; b=Hsj0Sm/eG0F9xOfrRWVY+rS1RBtF7xhmuTdrdqJa04oE4IEbl4RE4MAEJcK/yLYy2Ph+RwgP/NzJuJ9JmtKfkm1ImG+jhoJKLymEBS25howvNWkuhGuJY9I7YWI4z2DjIv2cnXSKiXP1Qf/bPhaf/IUhdZzSRE9KrQia9yv6kC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717186056; c=relaxed/simple;
	bh=ATNJtCzOXDVp1OKwxiEV9jk7WYH4jasM/bHZPYZfo4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G8WJ8vyDfqIzBVR1TRzJuNTmvXb4IF6n41xOwiVKU7H0EiuK0fu5QRAMU+RY2aciEP/bsv8XGFH+uFvdp+M53nZasTIh+mKPk022Ezu4T+RMOfzPdOGVhpytXcTRs7vWh0IQUaQ5aRJg2/fsdWHxhrzThXKPrAUx5vVQMEKyEC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nkR9A2AX; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2e78fe9fc2bso32944751fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 13:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717186053; x=1717790853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6C2WBjw85TMMZ9GIIugc3NhLWza5ZaClpp5YdwIj3Y=;
        b=nkR9A2AXVdWqCkpoMxWX47aj3H3FdZGg1qcU13F3gL62tS/CNwPoUVgxm1uGq6cDsg
         tS+bN+wlv9G7X4RXN3O7+/k10OfbH6pUoYPR9N5d+3mjVuLB6OaxOoqHjs48gRv2yNq5
         TUqF96tSWQgB8JjflN9Gdrex2yeWYYH95OD2lSOX2Kji/V1spTaQdsXUeY/Q2VG0Ue+J
         wbd+AC6YEIrM1eWJsj1mwKegJxX3nfbGWx9WxcvJxv4WIpg7ln1v8ZwS5LmfpXKg+Y5I
         9obw6gpotn9jDQ7WEGAlU7ZljMtmSZ1wtp2VOcWZkd6UiKZK8lNouRlgyRsjtVItrcR/
         HeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717186053; x=1717790853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d6C2WBjw85TMMZ9GIIugc3NhLWza5ZaClpp5YdwIj3Y=;
        b=VPtU+w1xMYeeat4M25ikT6omaMY/wR5jvOg+TLIb4qYRCtBuS0QlWHWYME0sfuugI/
         v1ofyaCThMRrwjiSSv5WgbQTGUh3sDEv+vYNf2iIRqvIwZHuBtzW8w/ZQ/btQjTt8tqQ
         AYa/Qt6LmHFYLoOkC6yg17S+E+2r7yXPg3aCYvL64P3PdZzngkxRDV0WR03FD3Oia9hn
         ICdwQ9b3U62KTBEV3OBKdpGUbq3QddNTr7YkAXI6eume1Ga8iajkKJpduC9RIvO4YvyH
         w8wIhSKiYOtkKsZ2dE0GF71SOLukYwgQ6M3+kLJMRsusbaycvR+z9B02GlN5lfmuIbkM
         L3IA==
X-Forwarded-Encrypted: i=1; AJvYcCWt60u152no4/z4wR7Vmx0IPu+s0vk9RX4UipGJLegLjb0vISgmym/U9yBsBSdEsWTYrTWnCn3zi6dYR16cvihPB+y08JnT3hIClrZbuQ==
X-Gm-Message-State: AOJu0YwwPo4Ehn3tgtKZrXA1k/yYgrxVGwpQZ/x7KYqtNYpjqMXVXKCZ
	dceXUyBPbN4A7GB0e+BwhnU7EwZUnT8zAAF8RvuwxZd6SX11fhAWtT54nbWYVUA=
X-Google-Smtp-Source: AGHT+IFEbGsurUQqegm0dR4iZcKkdLohi5tdSQtO24nzPhBAHnIn6wJq6gBZuF0+VUHo38IC2u3gKA==
X-Received: by 2002:a2e:3517:0:b0:2e5:61f8:db58 with SMTP id 38308e7fff4ca-2ea950fd531mr19016881fa.11.1717186053514;
        Fri, 31 May 2024 13:07:33 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91cf0b83sm4022111fa.116.2024.05.31.13.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 13:07:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 May 2024 23:07:27 +0300
Subject: [PATCH v4 4/9] drm/msm/hdmi: switch to atomic bridge callbacks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-bridge-hdmi-connector-v4-4-5110f7943622@linaro.org>
References: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
In-Reply-To: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2170;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ATNJtCzOXDVp1OKwxiEV9jk7WYH4jasM/bHZPYZfo4g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmWi4AMWQQW3Gm/ic5snixj31M57cTzkXCz1Z9e
 9X5rwFblCyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlouAAAKCRCLPIo+Aiko
 1UGXB/9frTF1MzeSGRB/G97BiMJwkvfUeL8Hu4DM85QkmNl6gMMTDOIMaet+aTodn+4H5ZvFBNq
 7kZOfWDezgACnMCRWH+/QPv9IgQFgUk6tcYIwn++ETDnnpJJgACy/JBpINpWOfd3W+qtfiNOTDI
 g/vbKMoWEUqZg3u4O/0MUm/6fOyTUcseXHp1GZqI038siGvihfCZzHWDGJnZxZGDZ/W1+bNwyEL
 gqqMwm38yyd82GDE6mmD73qkXc5wJiFkcOBNBVcqiaXa9kYs3I/JLL1lQOHTj7C34jIPBBREVQZ
 1msY9c4lFy/x6Gxd09VDiBe4TDFWPIQUGyIhmXyOgzezAdkN
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Change MSM HDMI bridge to use atomic_* callbacks in preparation to
enablign the HDMI connector support.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 4a5b5112227f..d839c71091dc 100644
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
2.39.2


