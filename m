Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D720850EDAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 02:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239068AbiDZAoi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Apr 2022 20:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232564AbiDZAoh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Apr 2022 20:44:37 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB92B63BD7
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 17:41:31 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id t25so29175261lfg.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 17:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4BgJVXf3N+o2MbfE8Sxe7s3Hg4gl2fsc9sl4/MZ7Xec=;
        b=Y0uNStUwzU/oXitgusJQjzs+6P6vKrDOyx61uQ+wVP2xAfkFXurLACebiufrGx3Dom
         SwcPd5ljkUSl2dxQ3Tv4MJLO8ji75Xzg7E87+l5vKVzf8+cxIi89Ko3XJPQ9A1PJ8Z7C
         zwFGEtFgs9M9V70Q2BFqw0Lo53egxsmiPsHje1sq3xiBr5DYrn8p+N/+qREfiZGLxpSI
         ITKQ3Y39p9OvyDVnJuZS0BpUPnnuZNeP3lJ/X6GShrwmpGQJP1uoj6jQ08RGU4oPKdFt
         D6OCVQbF7qZjFmdKJQ7tjsWC8HsB9WjXU2qW/wX56kiNJA9hMcR+dc8nCPYyYN8/9Zn6
         HjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4BgJVXf3N+o2MbfE8Sxe7s3Hg4gl2fsc9sl4/MZ7Xec=;
        b=tJ2YkZRqMl6UAvuoWTvxzKrimgnfK9z0/uzyJ2mdHOCveLXTRq4F0sI3Q7c0eUDlDM
         zSW89HfViGsGxQ4DMySu/UqTvBaFxFC5wFx1pn2oY1ZolMKbyiTDr3kWwV6WS9qCJVGP
         H1mttAcFbTlD/J1PsuJ9wUYvjmU9NdTnf9L4HTvu+1ScANhq+CYGXbBdHOeI6fAnSEUX
         2xiMlQ0aMNdVQARxxNyuNMJWsRgp3jdmzY+M129HKg1CBBOykNGiHbfdAB02VOhc79FW
         TmazevQ9k9HuKKnB47Ran9dKvNiS1InI72fnkyyzkE/Rp2S2qUjNlZgym3y/1QGIcHEd
         UxWw==
X-Gm-Message-State: AOAM533i6h9YwAr0vqIjeYGpstYHBMLqs/XG8KXgZeR/Cf7hBrrwnXfK
        mAcZYIbt1RoCDhF8mXueelmLXOfPg4X5ow==
X-Google-Smtp-Source: ABdhPJyfz2HW+yUkl/y/GKEmlC3J2qoEYBy4ZnCi7wRttEGrV1xocUKmOW+mhKSGpBGgAFvLgt+vJg==
X-Received: by 2002:a05:6512:1084:b0:471:d10b:4dec with SMTP id j4-20020a056512108400b00471d10b4decmr14921576lfg.21.1650933690030;
        Mon, 25 Apr 2022 17:41:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p2-20020a19f102000000b0046d09d60becsm1564792lfh.141.2022.04.25.17.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 17:41:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v1] drm/msm: select DRM_DP_AUX_BUS for the AUX bus support
Date:   Tue, 26 Apr 2022 03:41:28 +0300
Message-Id: <20220426004128.2832555-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Add missing dependency on the AUX bus implementation.

Fixes: 82c59ed16695 ("drm/msm/dp: Add eDP support via aux_bus")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index e99719067cd0..a6110fc67ac4 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -12,6 +12,7 @@ config DRM_MSM
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
+	select DRM_DP_AUX_BUS
 	select DRM_DP_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL
-- 
2.35.1

