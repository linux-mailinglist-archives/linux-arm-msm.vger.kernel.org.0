Return-Path: <linux-arm-msm+bounces-13741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B48877062
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 11:31:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 416B11C20B64
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 10:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F774249FA;
	Sat,  9 Mar 2024 10:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ceQgNIbQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597F3134BC
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Mar 2024 10:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709980300; cv=none; b=JTLfwrtTLv9GCCnWi8A4mGiPMD5YhxFHxITSWhXrHRFvj4IGl+CjPnonDbxlt4LfVKFH+wcaM0taFDVWVRy6lstjnSgp51H1HL4chq4k/QLRgPITJ3YHEKfyFnOo3t4POZoev9AuDcqK4tE+8wFlGrRZ4ybBYMbytTcvUGcadnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709980300; c=relaxed/simple;
	bh=dyCSthHHzXNg2FtPHnjXI29ZKEgPZ2Wv/z/Xo615dDI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BnK9Kqbs9cEkdwGuDP3tN1qYLYZ0w0SSPnria04baxtTEyjh34ADkuAnLP6N9kGo3qPNdMZBoshLvmdpmrzjyjSqUDOw6QXu0z2ak8vwJC1KL+ljeYCZz4jBWop1Qy3kIt4liwVxaiG06JzRQ0sutVzuHwiZf/t5idtRO8e6YrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ceQgNIbQ; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d269b2ff48so42529391fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Mar 2024 02:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709980296; x=1710585096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n2dgZRE3P9NOEAlgbf/KlOXvvwjZtbyPVzKly5b3fGk=;
        b=ceQgNIbQHbrK/kI11hXh4WyhLB4tJqWAa2fPP1YGiwNMWrgUNs+UJbCZltUTuvqjAM
         r9pWuSnMjUGm982l7vt/z4aEwZRRVZ1nLgJM7+ZeY/9KY4IAgJhcyfrrnyCh27VI2Jqh
         g/HqXkDLuz53jvLOZwz9mK5xY8YDm1ooiHuaC/onv2egI6l3/u8BZHAYNBoWSgoJTawx
         uq65UpXESM9m32JeOP4UssF/i7R3XESZg+21BoOFG2x1Asm55DaiTYyjQuwLDb0+LzCk
         inbm1anRoLuv6YDM2cQSNIZk4xkicLqAdclxuooRyid6ydxZcf+8UzRPfhOhPYrS/6CO
         Fi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709980296; x=1710585096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2dgZRE3P9NOEAlgbf/KlOXvvwjZtbyPVzKly5b3fGk=;
        b=rLUhByJgQ6OyfrUGqLkHujh9EgC5aMuTJ7jOYol0pTMytB3GgCGAsLnb0b73M+EFDV
         hNjmF5NmsMMsO1e9W7dAZSEjdlge38vBRRUiZMkgLcBSW/0bqwzuj95TvvfIiD9e9ch6
         YlXgI7u4EoG3ctNegLnVGcqeIEajfbsrBuF7PkTA7NCLeDu073pKyKbPxroLIAvrzdLf
         aGfWebRva2NlTfuaOW2qpiqV5+O/s0lymJOg3qdeIrbkval3prD1uz4dsuZMj3gRztWi
         f/DiYSjTdDDuXOKIdUK21Y+qUzZUdFzO6zjCBhB2+d7L/UPEC4MrA1KHokXv3QzpiYT6
         onxg==
X-Forwarded-Encrypted: i=1; AJvYcCV5xSP5qhPjyT0RM5JUjeD/5MXe7rzn0TESJNYRnXyjQkn3Jd3mneQk5vXm6B150RhM3PXBsJqL+mFya30LQrqByRUOFV/O+Wav/uM5EA==
X-Gm-Message-State: AOJu0Yxl8WjfL7Je5uapYEM0cPGE0g1BvBG1m1lOy2Oe5Uvj+uhk9Fha
	cz+NtBvd6DieoiDfg+I54QZ5uYfpLQlKizH3N+TF7dwP+SdPGk02AEOTYCyl774=
X-Google-Smtp-Source: AGHT+IEWta587d42WaCMYz46CSqPTHmEYD0eNxzIJJaMFlLh0oXM0SDdOGUY4Uh4KVlxx8+DOKsBNg==
X-Received: by 2002:a2e:b609:0:b0:2d3:25d1:f33 with SMTP id r9-20020a2eb609000000b002d325d10f33mr887304ljn.15.1709980296358;
        Sat, 09 Mar 2024 02:31:36 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y5-20020a2e3205000000b002d31953bc30sm245301ljy.55.2024.03.09.02.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 02:31:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Mar 2024 12:31:28 +0200
Subject: [PATCH RFC v2 1/5] drm/connector: hdmi: fix Infoframes generation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240309-bridge-hdmi-connector-v2-1-1380bea3ee70@linaro.org>
References: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
In-Reply-To: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
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
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2340;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=dyCSthHHzXNg2FtPHnjXI29ZKEgPZ2Wv/z/Xo615dDI=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+obq9bLzqLR2wPVZL8XtPe83J2Xlj+X83NNpbvWxSbez
 htFLBc6GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCRDxzs/71DpZ73B+huV++p
 E+W3yNPIvsEtfJHh/sP0cz/yC7LL5h9LNnjmU7DsRk3c21kccYy96ge6N56+vu6u66tp+e17b8U
 m9h+/e7hFvcitR/jM56A/Una9h8/zGF1x7NVbscY63CTp5CHWhpjsuz98P8e827LEVc+yT6hZ5w
 XPnUxN1/OuptKPV1ze4xcU3rX5inmrBb/qCoMQyxVTNbrjbl/7OTXrqG/zhVLTW/tfP44wcqyxP
 673r3CyxsTZr5/tfz45w2q+banGTq/y4NWce1q470rnxn7j8djGsGOZW97p3bVbmR30vzwJOGAe
 6a6y3qhVr+qptVFr0PTH7xncHrbxyz0+IXF52x1Bo8r1AA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Gate only HDMI Vendor Infoframe generation on the
info->has_hdmi_infoframe. All other infoframes were defined in earlier
HDMI specs and should be generated by default.

Fixes: 000000000000 ("drm/connector: hdmi: Add Infoframes generation")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 46d9fd2ea8fa..691efce9661a 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -1025,9 +1025,6 @@ hdmi_generate_infoframes(const struct drm_connector *connector,
 	if (!info->is_hdmi)
 		return 0;
 
-	if (!info->has_hdmi_infoframe)
-		return 0;
-
 	ret = hdmi_generate_avi_infoframe(connector, state);
 	if (ret)
 		return ret;
@@ -1045,9 +1042,11 @@ hdmi_generate_infoframes(const struct drm_connector *connector,
 	if (ret)
 		return ret;
 
-	ret = hdmi_generate_hdmi_vendor_infoframe(connector, state);
-	if (ret)
-		return ret;
+	if (info->has_hdmi_infoframe) {
+		ret = hdmi_generate_hdmi_vendor_infoframe(connector, state);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
@@ -1208,9 +1207,6 @@ int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *con
 	if (!info->is_hdmi)
 		return 0;
 
-	if (!info->has_hdmi_infoframe)
-		return 0;
-
 	mutex_lock(&connector->hdmi.infoframes.lock);
 
 	ret = UPDATE_INFOFRAME(connector, old_state, new_state, avi);
@@ -1233,9 +1229,11 @@ int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *con
 	if (ret)
 		goto out;
 
-	ret = UPDATE_INFOFRAME(connector, old_state, new_state, hdmi);
-	if (ret)
-		goto out;
+	if (info->has_hdmi_infoframe) {
+		ret = UPDATE_INFOFRAME(connector, old_state, new_state, hdmi);
+		if (ret)
+			goto out;
+	}
 
 out:
 	mutex_unlock(&connector->hdmi.infoframes.lock);
@@ -1269,9 +1267,6 @@ drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *co
 	if (!info->is_hdmi)
 		return 0;
 
-	if (!info->has_hdmi_infoframe)
-		return 0;
-
 	memcpy(&infoframe.data, frame, sizeof(infoframe.data));
 	infoframe.set = true;
 

-- 
2.39.2


