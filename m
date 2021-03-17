Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C27CA33E73D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 03:56:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbhCQCzq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Mar 2021 22:55:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbhCQCzh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Mar 2021 22:55:37 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79AFEC06174A
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Mar 2021 19:55:37 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id u198so35387643oia.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Mar 2021 19:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BCzU6F4uZhx7sJJrGnHwNOzG8RXcM1PdQDQ68KOnb4g=;
        b=jvSPqvR7vVYrXbfTCmHC4c+lnilvsDwSUEmRijXAEuU0IrZwpiVgus15lDOP56XG0M
         OeBdYDxDW1oBk0WdZJRlK1+xg9h4JPznsTR6yb+uMSyRfcmQ5VPp5rFYjSHBEbjZp9i5
         vlJzl3at/HDjPAXW37FOnqrAve6FRQKIELgTk2Vf/ArXUgY8c+2/XrBmxu7FMnukBElS
         fipyQFx6Z/U08vkzOHj01+PmrteDauTNjjreibEf2IUYbahbhBQVEmkD8AQTjatoeFBr
         7NNZn5B2qCane9+9SzW6B0Pyivu+ubPQYGXk3q0t3YMKYbottqQ+6bzChFDNHxyQx599
         ZLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BCzU6F4uZhx7sJJrGnHwNOzG8RXcM1PdQDQ68KOnb4g=;
        b=tZG/8pU+upM+jT+ppwCEO6nPxyh1G265eaPoI4zBWC1iAvwnOhaROwYIkJhXCy2G0Q
         /IBKZ/mi0iLZ/sCGjBdFAFqEN0QOpZfDOw6/Py1nwwlOO7T47Wfp8A/3lZH4Ip8SWBR0
         Q+pjZW0f8076Ibf+cE1+mb6tIzpBilFSbWMkwuNIfOd93AKMoHRjYPsmBUtLdkTB3iJA
         vt6LAviOwJgzzUSNPmOoBgCNrYbZZld5qOv+5iPlnZDZljbRQOunriB6bewNTDT44+mx
         GJ8kDeyqoXdm5KmdVAcCw+k3dATFNBXi250peUKm3TDu0rr9A2XM7wI/I5kGtoip3/M3
         faCw==
X-Gm-Message-State: AOAM532NWZjjd0F9ot+gMZFn6T4Z7A3cr+OCPgYwXiIchVli2Q9/LH9U
        G6QxFR6cwxsoxVTrX12ICHBL+g==
X-Google-Smtp-Source: ABdhPJxcT/ALDQlslS78U2rYeCHeJSpWiS0nMXTTBB/sVYN+M3YH+go1KWig/JZ2/p4827s3eS76nw==
X-Received: by 2002:aca:ab44:: with SMTP id u65mr1244373oie.122.1615949736872;
        Tue, 16 Mar 2021 19:55:36 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a6sm8559963otq.79.2021.03.16.19.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 19:55:36 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm: Remove need for reiterating the compatibles
Date:   Tue, 16 Mar 2021 19:56:34 -0700
Message-Id: <20210317025634.3987908-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

After spending a non-negligible time trying to figure out why
dpu_kms_init() would dereference a NULL dpu_kms->pdev, it turns out that
in addition to adding the new compatible to the msm_drv of_match_table
one also need to teach add_display_components() to register the child
nodes - which includes the DPU platform_device.

Replace the open coded test for compatibles with a check against the
match data of the mdss device to save others this trouble in the future.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 94525ac76d4e..0f6e186a609d 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1173,10 +1173,11 @@ static int compare_name_mdp(struct device *dev, void *data)
 	return (strstr(dev_name(dev), "mdp") != NULL);
 }
 
-static int add_display_components(struct device *dev,
+static int add_display_components(struct platform_device *pdev,
 				  struct component_match **matchptr)
 {
 	struct device *mdp_dev;
+	struct device *dev = &pdev->dev;
 	int ret;
 
 	/*
@@ -1185,9 +1186,9 @@ static int add_display_components(struct device *dev,
 	 * Populate the children devices, find the MDP5/DPU node, and then add
 	 * the interfaces to our components list.
 	 */
-	if (of_device_is_compatible(dev->of_node, "qcom,mdss") ||
-	    of_device_is_compatible(dev->of_node, "qcom,sdm845-mdss") ||
-	    of_device_is_compatible(dev->of_node, "qcom,sc7180-mdss")) {
+	switch (get_mdp_ver(pdev)) {
+	case KMS_MDP5:
+	case KMS_DPU:
 		ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
 		if (ret) {
 			DRM_DEV_ERROR(dev, "failed to populate children devices\n");
@@ -1206,9 +1207,11 @@ static int add_display_components(struct device *dev,
 		/* add the MDP component itself */
 		drm_of_component_match_add(dev, matchptr, compare_of,
 					   mdp_dev->of_node);
-	} else {
+		break;
+	case KMS_MDP4:
 		/* MDP4 */
 		mdp_dev = dev;
+		break;
 	}
 
 	ret = add_components_mdp(mdp_dev, matchptr);
@@ -1273,7 +1276,7 @@ static int msm_pdev_probe(struct platform_device *pdev)
 	int ret;
 
 	if (get_mdp_ver(pdev)) {
-		ret = add_display_components(&pdev->dev, &match);
+		ret = add_display_components(pdev, &match);
 		if (ret)
 			return ret;
 	}
-- 
2.29.2

