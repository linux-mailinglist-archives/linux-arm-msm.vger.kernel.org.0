Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA456F2BC6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 02:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232266AbjD3X7l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Apr 2023 19:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232221AbjD3X5j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Apr 2023 19:57:39 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7688BE7F
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 16:57:36 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2a7ac8a2c8bso20322131fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 16:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682899055; x=1685491055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOrIz3NMUHzc4Jds1q96BiI5FcvAaLjz05V/ffabh1k=;
        b=mxbwUkNrs08+j6OpQviJACylAMwExoOacy7GIWiAZk1z8Cr/dpulcT21TV4ouibs/J
         Qkehfi3YkFQMZi1Jj/6cdtyQ7VMMPOMy2VIniaPyaixvkuNL1XyZameYnxBWzG+QxoWy
         upY9Rk9rOPu8igdA+J7QbtgASphFP/payC/PJeFkXwCMWUNyQfJ+5N5/0Prw62Uaf96B
         FehmwiyN507YHmRZ2aTSr7i+DSwBwoXMSN/dESfXg1lSTn77Q27+mpgnu+aDEFvMA914
         6lTP6jJ2rrwIGnoMUYo73ufVhqeFWxhnQCDWsM4b+RbBsF+zfeqamAsZqY1IWj79+sTv
         4YlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682899055; x=1685491055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOrIz3NMUHzc4Jds1q96BiI5FcvAaLjz05V/ffabh1k=;
        b=Z4gXSePEiVbV7YVlG/djMsK6RzqMmELmQ4t1MWHEHi56+EUP4xPLWuefR8AgkM/t5U
         Aj07Ql4rkGaSkKWDgNOXQQt4l/0xYl6SLVe+zbcBNtD09X8tTwUM0Lv3xBR8816qEWzX
         gxqhuAxTKHWO8DD4+/ggrI6HUckoah5HGla/VL0eB7yOpDvkTddMCBFyaFM+v/cakJt6
         oEx7YBQxVp9TNh9uIbgS4DpTw7395QOJbS84KKmCbUdcitJW+itAi+CB/wfhN2Iqc6+B
         C0frMz1Mx00apm2kSI0Cx3CBC2ep4Qj12YRg3VpJCfokMZum1MiybSIp6V1UjY9NKbfx
         fgdg==
X-Gm-Message-State: AC+VfDyjIuS1piJvsvgrGQjOoUUVCvyfDgdHFsQkSbaYq1h6zE96bUs4
        nhmBTxcaVm1LxS8ewcNU9rqPIQ==
X-Google-Smtp-Source: ACHHUZ7XhNfYFsiX56pvRTS+MsN4k/Ki6ULAaiGilTkcMepabLO3IyC5lMv+9nwArMycl14Q0rZDtQ==
X-Received: by 2002:a05:651c:105:b0:2a9:f94f:d304 with SMTP id a5-20020a05651c010500b002a9f94fd304mr3425249ljb.19.1682899054856;
        Sun, 30 Apr 2023 16:57:34 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id p19-20020a2e9a93000000b002a9f022e8bcsm4292099lji.65.2023.04.30.16.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 16:57:34 -0700 (PDT)
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
Subject: [PATCH 2/7] drm/msm/dpu: drop dpu_encoder_early_unregister
Date:   Mon,  1 May 2023 02:57:27 +0300
Message-Id: <20230430235732.3341119-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
References: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is no need to clean up debugfs manually, it will be done by the
DRM core on device deregistration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 32785cb1b079..8c45c949ec39 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2154,13 +2154,6 @@ static int dpu_encoder_late_register(struct drm_encoder *encoder)
 	return _dpu_encoder_init_debugfs(encoder);
 }
 
-static void dpu_encoder_early_unregister(struct drm_encoder *encoder)
-{
-	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
-
-	debugfs_remove_recursive(dpu_enc->debugfs_root);
-}
-
 static int dpu_encoder_virt_add_phys_encs(
 		struct msm_display_info *disp_info,
 		struct dpu_encoder_virt *dpu_enc,
@@ -2374,7 +2367,6 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
 static const struct drm_encoder_funcs dpu_encoder_funcs = {
 		.destroy = dpu_encoder_destroy,
 		.late_register = dpu_encoder_late_register,
-		.early_unregister = dpu_encoder_early_unregister,
 };
 
 struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
-- 
2.39.2

