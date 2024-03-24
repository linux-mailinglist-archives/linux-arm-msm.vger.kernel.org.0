Return-Path: <linux-arm-msm+bounces-14947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB2A887E78
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Mar 2024 19:57:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22DA228142D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Mar 2024 18:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C47DDDF;
	Sun, 24 Mar 2024 18:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fs5d7HEA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740FBD524
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 Mar 2024 18:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711306635; cv=none; b=a/OFq5qKPNSn9IgwDo8XHHwPwMHcs3PaowXABhka2pcSdWX7tubc1vWDqXenNKa+ra717q3i7X77L6x/sSYLXMQPk3oOq+2DfNxHwFL8Jxt4qlqhkktPxBvy0xxhA2cj/9+mZV0hDA9I5pakv0dwQFFYPTaNfFabp069TAaYJO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711306635; c=relaxed/simple;
	bh=W+ixrxB17oBlZR5+q98FI6rFAsGuYD9iSG3AVEjJDtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b66+1T/VAiz5UBqsF5RM5E9NPKlR3AF3AfEyLFOy+OQYM6nU/jduo8vOD1RX6O4qU73HkvBBG2lmF6xfSoEoBSyXbYsrJ8HRfTlcMCWd7ytAjhWlbEo70WRrt9r2x+O1rLf71Vgsiv/aYlmEQFzB2iRfK3WkzJTz1JNalg3OPaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fs5d7HEA; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d4a901e284so74122741fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Mar 2024 11:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711306631; x=1711911431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tVN8D/5N0Uyspg/EOqzGv8QkQMu3D3Z6cYgiWKzgOIk=;
        b=Fs5d7HEAvvD83sSGcRjSd8aG6T/6VEMOZeDTMQFwSzBOeda8+hi7L1qMP9ieVT1EGK
         kFWk9pFL1WXSM7Sj/lmjymwnpNfthOqEQGMxgZeBScbI2TLVD3BA3/DXD2i6Zp5du/z3
         WwDkgxYUGM9GEp9bQS865/WUx0RYgJoIYuV3g8AEF03jNDte96QwXvZlKSqvyTM4PT3A
         q8KVY+UwYMqAX9oYRUNsDUUF4g/w9gqZxJiTcSI+RqwN/lpApcgfEon2TE6zIOqPytnV
         DN08Abypgu+jmpn1ByC1dXYP4PFtt+x3SIlVzlb2Puh93X7RtLg587mbgkpXljJ5UT70
         GQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711306631; x=1711911431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVN8D/5N0Uyspg/EOqzGv8QkQMu3D3Z6cYgiWKzgOIk=;
        b=Ee3bT8nIhOsWXuBLzQ3kZx/1fp58GDLvDBNPqOPRKCKJdU7+S7TlEDajC21GqyibhK
         +lFHCh34bN5I99BWIHOVkOpxDTsyQaIsoLRHckky/mFF/bJ13zTp24fJN4mOHbD4ikcF
         34enCYpeK+T3VHngUDgQv0sK3Ik5nTaRNTrEnRALdD0MpGqIENgx7nn3HxBmvvOG4Kcf
         108FFm2oqstZpaz7cAhha6+IRd38wfyLID3XezS6vvwvhn2SR6O/JHRsKI3iVc6T26hO
         Vo/+G3po3iroW2HhajDRErDaqZGluqiTdL7NcGI4Q/HYRUGVgaFOyF5PdHleSTsKGIco
         BsFA==
X-Gm-Message-State: AOJu0YwTwoMPREweCiTFelhUInypLqzdrsx8gS2KNjcpCfTiAXgkwPSN
	nF2fOCu8dcTKoIbyd5fk6iSkZNorgkHkE+TrdHoJGxqs1wxxkCPnbuBu52nEVPk=
X-Google-Smtp-Source: AGHT+IHGpqFZdzuNs12HTt42MK5CsHqzalyY4AxaKVvVmNTAOVCX41+QspypOu+I1cPNmWlJn5NyHA==
X-Received: by 2002:a05:6512:12cc:b0:515:acbd:3ec4 with SMTP id p12-20020a05651212cc00b00515acbd3ec4mr473886lfg.16.1711306631252;
        Sun, 24 Mar 2024 11:57:11 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id m19-20020a1709060d9300b00a45c9945251sm2194008eji.192.2024.03.24.11.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 11:57:10 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Sun, 24 Mar 2024 20:56:51 +0200
Subject: [PATCH v4 1/2] drm/msm/dp: Add support for determining the eDP/DP
 mode from DT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240324-x1e80100-display-refactor-connector-v4-1-e0ebaea66a78@linaro.org>
References: <20240324-x1e80100-display-refactor-connector-v4-0-e0ebaea66a78@linaro.org>
In-Reply-To: <20240324-x1e80100-display-refactor-connector-v4-0-e0ebaea66a78@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2349; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=W+ixrxB17oBlZR5+q98FI6rFAsGuYD9iSG3AVEjJDtQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmAHeBsZIpB8Uauni+2TSikC5QzjLlvF5qYFr3A
 ygziovcZrmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZgB3gQAKCRAbX0TJAJUV
 VsOWEACL930zCGaf6kuqdiBz5yYmZIV/rq1f+Qv/7ml/Hn7PXQEVdDyv+BLdW4gG5F2aYeMtMCu
 aa4iaXRl2bb71L50VPo8M6xDlgRVakNwln3QqkA5LVytVRjez/hHAU5mNxpWRVWCNkk5gziLzmw
 d/+hLQqusEqfP1XAiQf+GIPqBz5opAV3sXsfa+KevOzrHN8Hu5t28Awqv+m5KXcNF9pIoEnQd7D
 UYgaYjLd819IQ9ApYzHAPk5iZv8NK9Owu5NspjIt7tnFgjMKwRSbfUzIkMWkum4kC64BIlscVJ4
 9KxD5g9isZZVkcqY8oZHKsnG92GLWztm4CJVzWd+W0IsRACmYRK8fYHkXWAtl0CVfT1vRT0peQj
 5OnxyTN/dx00cdFWxkiV6Ayn3kKtCw5cZHtega1yQrwIOqSOsuPFQlGj3ZmBp/YFp3AGJc6CLPg
 B0dYlGXsMZbOYDuQun5xPsiFMRtGFzCVT6DakS6m+6nGR4xT/ovtNjrT1Q6Kpx18SyOVgh6PRnt
 loUF9+eT3aH7+xxKs1KN8zqfq3UZULQ0i0IJ/6eYicKXmgWjBliLt9Hx/tsTG445lOuYnTHhmvs
 VC9hTp8TMyoJiC1lwTfdvbEocdUDuUnsDVv8mIRQv9EgRyU2isT2by45OZ4L9tDYOmrxxmwtzO2
 a+/VR6wqrv1VVzQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Instead of relying on different compatibles for eDP and DP, lookup
the panel node in devicetree to figure out the connector type and
then pass on that information to the PHY. External DP doesn't have
a panel described in DT, therefore, assume it's eDP if panel node
is present.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c4cb82af5c2f..9169a739cc54 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -726,6 +726,14 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 	if (IS_ERR(phy))
 		return PTR_ERR(phy);
 
+	rc = phy_set_mode_ext(phy, PHY_MODE_DP,
+			      dp->dp_display.is_edp ? PHY_SUBMODE_EDP : PHY_SUBMODE_DP);
+	if (rc) {
+		DRM_ERROR("failed to set phy submode, rc = %d\n", rc);
+		dp->catalog = NULL;
+		goto error;
+	}
+
 	dp->catalog = dp_catalog_get(dev);
 	if (IS_ERR(dp->catalog)) {
 		rc = PTR_ERR(dp->catalog);
@@ -1241,6 +1249,25 @@ static int dp_auxbus_done_probe(struct drm_dp_aux *aux)
 	return dp_display_probe_tail(aux->dev);
 }
 
+static int dp_display_get_connector_type(struct platform_device *pdev,
+					 const struct msm_dp_desc *desc)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct device_node *aux_bus = of_get_child_by_name(node, "aux-bus");
+	struct device_node *panel = of_get_child_by_name(aux_bus, "panel");
+	int connector_type;
+
+	if (panel)
+		connector_type = DRM_MODE_CONNECTOR_eDP;
+	else
+		connector_type = DRM_MODE_SUBCONNECTOR_DisplayPort;
+
+	of_node_put(panel);
+	of_node_put(aux_bus);
+
+	return connector_type;
+}
+
 static int dp_display_probe(struct platform_device *pdev)
 {
 	int rc = 0;
@@ -1263,7 +1290,7 @@ static int dp_display_probe(struct platform_device *pdev)
 	dp->dp_display.pdev = pdev;
 	dp->name = "drm_dp";
 	dp->id = desc->id;
-	dp->dp_display.connector_type = desc->connector_type;
+	dp->dp_display.connector_type = dp_display_get_connector_type(pdev, desc);
 	dp->wide_bus_supported = desc->wide_bus_supported;
 	dp->dp_display.is_edp =
 		(dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);

-- 
2.34.1


