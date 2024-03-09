Return-Path: <linux-arm-msm+bounces-13759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE628771D8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 16:10:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6600B21034
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 15:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3748B44371;
	Sat,  9 Mar 2024 15:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U0YSiaf4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473BA44366
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Mar 2024 15:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709996952; cv=none; b=g6wwPNXiDnfBWMvPtWAfNrlRow64HGH9qZbeklmHiPAz5Dyd3zuFKwA4K8o3QMOSmV1udm+OGYU/NXtJWQL0ALOtSrrNP4+fIQN8DeI5s/mZt5kVFhR8XbCmNUku9g0xMBT8JrCV3zMRscC0W+noWd3uOlyc5n+X5Tni30A6Blk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709996952; c=relaxed/simple;
	bh=25sj2EpAUs4CVgh43hLR16WG/PkkmsNSMdc3g9mxl2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t/fGvTl4MoPXs3L/wSCyzxnzaOjhwVdifE0Pbx3fNqFxpGptXji+IaEcItWLFVI6Qe+mf2QId8UnRD4MvB1WJPWP4bDvjZybGqQZuP1JO1rnbviY/2S/eaOTNNeNPLME0nLBR9NUGxFvUYPkFRAAidxEA5aFIpGLdU3IeCOcwPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U0YSiaf4; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d40fe2181dso21084011fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Mar 2024 07:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709996948; x=1710601748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aDBr2FAG34D/nO8EL2D1pYlW3kGuhkxGNLEsghBUPo4=;
        b=U0YSiaf4zIBwa3mQ7e9LL1C7szTm4fPmxAdPdMADDZM/coeNbfW2nG8hjdsn1xJkPz
         pA/wkultan92nvE/ORGVRJndb222CxTR0j2EDE3orbohAJmewQP2ix/F6b20VYcnuUUV
         fgW2PXh55OBA7lCEAgIHr//DAP2d9Jm9JsbVczKeMDaWrGLHFDtUPRRMdXrWTxiru1B8
         MCor3hDQy9aNvbx3e7zhND8er4FIR6b8bl7AvNnUnHgz0tpinn6EUSvBoLdLP5WxMd2f
         q8oJ9PfXQ4VHVJZXdQMbxF65Zjyl/YPCXAKfj6NJlqDsWytaAnDUaLKBbOpYeZWFK5ev
         wLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709996948; x=1710601748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aDBr2FAG34D/nO8EL2D1pYlW3kGuhkxGNLEsghBUPo4=;
        b=fbuOPh0voaCoUzYFsmTZjeTUjRx39MT4KQRmNxYFhhfxX7Tgj6RvrxqffElJVMrb1a
         DzVjpzYeoPIScNAsV/GVJIgbUjlpZN+vW6pfE4dQHvcXHWQJgrR0Fiy88AX73OoCN5Wh
         21i3GLQWLDnbGxySe5evN2rplUHGfNs3C7poC69FG98AZg4PP05vSIadRV92cG0fuMYK
         pw9iePRcGMOLrGEWG2qqsowbkvFChyLtgEdDUOTEU2cWN6o4iHAq2PJH1Y8e309JXvdT
         oEhvLq1gN8vqaZzC/B6PPv7ZIzYmWPWs0N7lH3ge0zSIhS1nM0ooljrci8zkt1c+x5xy
         TaUw==
X-Gm-Message-State: AOJu0YyeQXa931ESZfGQAQbOio2ve8SNCtCh/JK6ol7F63GyzbN1ykbj
	Aa1eIZGy4hiIIcmIZ8u/1u3WOmqp9kjRM6AVkNiz/+B4ZODK5dMplvkqqlk7ems=
X-Google-Smtp-Source: AGHT+IEPT352wtTz9iAipTw3WZyhnuQwbR41TmyOH1p5I8NW7VTHUCkkrju+IO+M+E5Komq4fBWr9w==
X-Received: by 2002:a2e:9890:0:b0:2d3:a7da:b17b with SMTP id b16-20020a2e9890000000b002d3a7dab17bmr1584405ljj.4.1709996948665;
        Sat, 09 Mar 2024 07:09:08 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m1-20020a2eb6c1000000b002d4062c833dsm328511ljo.98.2024.03.09.07.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 07:09:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Mar 2024 17:09:05 +0200
Subject: [PATCH 1/3] drm/msm/dsi: remove the drm_bridge_attach fallback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240309-fd-dsi-cleanup-bridges-v1-1-962ebdba82ed@linaro.org>
References: <20240309-fd-dsi-cleanup-bridges-v1-0-962ebdba82ed@linaro.org>
In-Reply-To: <20240309-fd-dsi-cleanup-bridges-v1-0-962ebdba82ed@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2369;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=25sj2EpAUs4CVgh43hLR16WG/PkkmsNSMdc3g9mxl2I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7HuSPyhU7mt5oJSmJoDFQtH4cLTENnWHFQ6NV
 7NYXoxKi+SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZex7kgAKCRCLPIo+Aiko
 1UWUB/9fcjO5+fe58xaEbgbtZcYIbSS/rTMGDmJ9GSgRT3x9eINjFvydclOPe1eyvrtLy1gcS+W
 JFLKvxnr0//Dyf2ObqocW3EpKp9/TMA1OpkCYUbAnP9sjgtcyoPNQ+6KVfCkgorZySXFPvTtWZK
 98tClxsDyXUeG7sEvDzqjvmOFNdSZa/oIl/XRcyeRa2+T9LOECKniV0U0i6vRpcqQvWCBndWW/u
 TstpB/6g/UflC+2ZLlGbLgJHfbl1iD4YA1Gs7FHCq4+bYqbM+6EuzN318o8y1LP6egUlo1YJa7s
 RD28X1JAPXAjGSE+pI7rztz/i0tj+XiD7SSyMngfAg35+Raw
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

All the bridges that are being used with the MSM DSI hosts have been
converted to support DRM_BRIDGE_ATTACH_NO_CONNECTOR. Drop the fallback
code and require DRM_BRIDGE_ATTACH_NO_CONNECTOR to be supported by the
downstream bridges.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 36 +++++++++++------------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index af2a287cb3bd..a7c7f85b73e4 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -465,6 +465,7 @@ int msm_dsi_manager_ext_bridge_init(u8 id, struct drm_bridge *int_bridge)
 	struct drm_device *dev = msm_dsi->dev;
 	struct drm_encoder *encoder;
 	struct drm_bridge *ext_bridge;
+	struct drm_connector *connector;
 	int ret;
 
 	ext_bridge = devm_drm_of_get_bridge(&msm_dsi->pdev->dev,
@@ -474,36 +475,21 @@ int msm_dsi_manager_ext_bridge_init(u8 id, struct drm_bridge *int_bridge)
 
 	encoder = int_bridge->encoder;
 
-	/*
-	 * Try first to create the bridge without it creating its own
-	 * connector.. currently some bridges support this, and others
-	 * do not (and some support both modes)
-	 */
 	ret = drm_bridge_attach(encoder, ext_bridge, int_bridge,
 			DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-	if (ret == -EINVAL) {
-		/*
-		 * link the internal dsi bridge to the external bridge,
-		 * connector is created by the next bridge.
-		 */
-		ret = drm_bridge_attach(encoder, ext_bridge, int_bridge, 0);
-		if (ret < 0)
-			return ret;
-	} else {
-		struct drm_connector *connector;
-
-		/* We are in charge of the connector, create one now. */
-		connector = drm_bridge_connector_init(dev, encoder);
-		if (IS_ERR(connector)) {
-			DRM_ERROR("Unable to create bridge connector\n");
-			return PTR_ERR(connector);
-		}
+	if (ret)
+		return ret;
 
-		ret = drm_connector_attach_encoder(connector, encoder);
-		if (ret < 0)
-			return ret;
+	connector = drm_bridge_connector_init(dev, encoder);
+	if (IS_ERR(connector)) {
+		DRM_ERROR("Unable to create bridge connector\n");
+		return PTR_ERR(connector);
 	}
 
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 

-- 
2.39.2


