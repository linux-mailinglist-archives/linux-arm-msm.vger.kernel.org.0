Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 359A27C5F44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 23:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235170AbjJKVrN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 17:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233582AbjJKVrM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 17:47:12 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D0FBBA
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 14:47:09 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5031ccf004cso429055e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 14:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697060827; x=1697665627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wPUGWW275MYstsSHxHHUDypFjqdrph9V1YvKG1p4fyc=;
        b=hpyXAJjFIEDztKMK49Y7Ciy89/L+ZQbTRsS/mRfIzTYFNw3JD84FpCdbWZk8hF47lP
         2ia4ftYOKOSzRTnLnLCdeGB9K/odA/2yFFx70DpzHweNggE9rpGsyQzDH41RVMy6Ovz2
         89Eui8uq09CyFdZNJpRU+h5Bj+6ZcCTEjEYk0yg8hYMCfa9wrczL7HjfZtQ5QFOWy4Xd
         QxmuVz9wDNWHUHee/c2sK754CZHR1Q3haXYAVV5gIwymCdvLHP6SfCmIW+iruGO0itD7
         GkbXLnFqWY9CBglx/zho2162aQRzvz+tpaB+iXNTSXbuZmzx/qyDmYyMXeRtXTyf698r
         k+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697060827; x=1697665627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPUGWW275MYstsSHxHHUDypFjqdrph9V1YvKG1p4fyc=;
        b=ahV1+HPJ3wN0oW4P5CRKtCCUhI+z87VXHdrVhgdiVqNxY0fsg7/U/Bd5qESOF8+w1y
         sFOv5BnM6JtTNZbIznwwJgvgLk1KYkxZFiePh3XZGrWVkFdJIbtNkfQcjiF2pKTRGqBr
         U9VJbxdO92NFIzB5QuJLR5/w1FQZ2LZmOP7KUNXemMjOmzRnmPe9SXAkp044Q4Ecvlif
         N5mLmwOmULG0xC9p4VFONLZYRuFMRhnZVNhIyWYR97Mak7dIqhi0aTTi9vNnRBp8W+5A
         eMapxRFRei5g8b5iHEul7XVSZMpBo6eEF0bqLMnhZNOl3rHR6b3Ptps7FW9Dwtykv7dj
         bDzQ==
X-Gm-Message-State: AOJu0YzSz296xk+UdvSySZFPEGQBujQBhcLyNkav20dD2WgjUP5HEStC
        9nuZZunZdipNNzVQGwuLG4y25A==
X-Google-Smtp-Source: AGHT+IHAQzCJ2KIdfIvr74FJ4FmySCFQSZAxPAtlfM1u4q0G9LMI7SdYKf1D9vU2z0PW+GjWV/UsDg==
X-Received: by 2002:a05:6512:e9f:b0:500:d960:8b6d with SMTP id bi31-20020a0565120e9f00b00500d9608b6dmr23912348lfb.33.1697060827655;
        Wed, 11 Oct 2023 14:47:07 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o15-20020a056512050f00b004fbab80ecefsm2452485lfb.145.2023.10.11.14.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 14:47:07 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 2/3] drm/msm/hdmi: use correct lifetime device for devm_drm_bridge_add
Date:   Thu, 12 Oct 2023 00:47:04 +0300
Message-Id: <20231011214705.375738-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011214705.375738-1-dmitry.baryshkov@linaro.org>
References: <20231011214705.375738-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The lifetime of the created drm_bridge is attached to the drm_device
rather than the HDMI's platform_device. Use correct lifetime for
devm_drm_bridge_add() call.

Fixes: 719093a67c7f ("drm/msm/hdmi: switch to devm_drm_bridge_add()")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 0b7a6a56677e..f5e01471b0b0 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -331,7 +331,7 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
 		DRM_BRIDGE_OP_DETECT |
 		DRM_BRIDGE_OP_EDID;
 
-	ret = devm_drm_bridge_add(&hdmi->pdev->dev, bridge);
+	ret = devm_drm_bridge_add(hdmi->dev->dev, bridge);
 	if (ret)
 		return ret;
 
-- 
2.39.2

