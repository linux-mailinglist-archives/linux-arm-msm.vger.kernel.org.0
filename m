Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2A27BCE90
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Oct 2023 15:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344800AbjJHNXa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Oct 2023 09:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344778AbjJHNX3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Oct 2023 09:23:29 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301F2C6
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Oct 2023 06:23:27 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c2907ff9fcso44060111fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Oct 2023 06:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696771405; x=1697376205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ws+BeoAofrb1fd3S6dPoIhO1T8QAsaqdvZDhz+j1aGM=;
        b=XkkIZ14E6Y1hIR16KmhQwCbdnay0hZqT85pGiYj7C495K/fT0j4EJoFU5mlXZCDDFE
         Ypryk5ukK7ePwck6NtlIauo0ZhXLM5BW0cKRLG5Tx3fbig16wwoUCroiv0IWT0OY+YfF
         B9tunA76Towm4njx6NxqAXDS39DK8r3MwNG0LbL6P6GNX5Sgexyor4ERIoP39yO8zHSy
         LOWYVEVVMMqZQO5vPWnK6npRUv92dI0XbMN7G9I0S6yE8gNKwbcRpZ5U5dofAF5N9COT
         XcXYa3fNkbhAvadpsvevqrCteHTnPlbREvReAWoAOXvMcxBbDrv0OAoCTYhFohGwTy9L
         a0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696771405; x=1697376205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ws+BeoAofrb1fd3S6dPoIhO1T8QAsaqdvZDhz+j1aGM=;
        b=UciidxXD7VcLP883mFqKr//JbYDAbDPxRqPpSRIguOYSDiLjediVEAKl574dd+lVKi
         7mWiIAZME4fEH8PdHlyH00tuDgQHnb57D8y+dznMe6wg7jbC9FPO5HmF5VUPzOxWAABp
         LDzJAyv7OLd+I7K4XmqYX0nISuBgAAqDkmrvf3qhIMPZX9GXi8dhqY/DX9/O/mf2tstN
         uM8xNcsNt8ihh9p0aUdxJ2O1jIZ5PQWawJfwonUZvSKxl/EuYzVXb+K0IeJa5c67msXt
         xQp5j90HdPwwtErMJELsE4xjSHOwTxpvl9eZy+74gQ+6R8bvj+ouJBLu7si8FFxG7Y3z
         Ix7Q==
X-Gm-Message-State: AOJu0Yx+Y+taXm6MiHDm3+Puael/gtdV1m6Gc1Ldr72LHTarUoCE8tT3
        +diK1T4j5m27UF9FhPGMZOwUVg==
X-Google-Smtp-Source: AGHT+IHnhandwGXzx8Ood+cxwN4KlSrHrc7gTvLxTHyVDXlge8YIbuzN827mRZBFbSmQ6qN3Li+XFw==
X-Received: by 2002:a19:644a:0:b0:502:9a2c:f766 with SMTP id b10-20020a19644a000000b005029a2cf766mr10356743lfj.30.1696771404911;
        Sun, 08 Oct 2023 06:23:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([188.170.82.148])
        by smtp.gmail.com with ESMTPSA id c28-20020ac244bc000000b005046bf37bebsm1083219lfm.57.2023.10.08.06.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 06:23:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] drm/ci: force-enable CONFIG_MSM_MMCC_8996 as built-in
Date:   Sun,  8 Oct 2023 16:23:20 +0300
Message-Id: <20231008132320.762542-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231008132320.762542-1-dmitry.baryshkov@linaro.org>
References: <20231008132320.762542-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable CONFIG_MSM_MMCC_8996, the multimedia clock controller on Qualcomm
MSM8996 to prevent the the board from hitting the probe deferral
timeouts in CI run.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/ci/arm64.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index 45f9deb7c4f6..b4f653417883 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -62,6 +62,7 @@ CONFIG_PHY_QCOM_QUSB2=y
 CONFIG_PHY_QCOM_QMP=y
 CONFIG_MSM_GCC_8996=y
 CONFIG_QCOM_CLK_APCC_MSM8996=y
+CONFIG_MSM_MMCC_8996=y
 CONFIG_QCOM_LLCC=y
 CONFIG_QCOM_LMH=y
 CONFIG_QCOM_SPMI_TEMP_ALARM=y
-- 
2.40.1

