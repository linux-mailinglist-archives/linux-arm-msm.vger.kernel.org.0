Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE84167669C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jan 2023 14:55:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbjAUNzC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Jan 2023 08:55:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjAUNzC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Jan 2023 08:55:02 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23FD6B471
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jan 2023 05:55:01 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id p25so8517191ljn.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jan 2023 05:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wl7hg1pdo80Ygf+JBADZba88dXLFhEepBsuXC7v4hE0=;
        b=KBk+pIjry+zjgLszQt02PH4rTBD0eEOY0IbKiERpg3FjNuOpKRNn4pZddOPun9xfAi
         423OvgF8MNMK7bfhhfqkYL3n2XOJhRdwWWNtg8JTssWkspITIOuu1RzHE07cu5TVMblG
         f9OuI3RUV556wOQQk2ln+JnF/kMZQseq1V0jgVMLJmrvBPXFqfkwvF9eBge66JeZJnYz
         rmslM+i7Bb6YRHbtZLRXRbm8tX/m9XaaygtoJOGHM1MOUDH/cgENsT2dvKF0Vyet471V
         JAhvgAsi7nG9elnOPKr8Hl0KyZ1C7lnNIKn0/DG5Sqc32IGk01iBcYAtdgLB9bRm+1W4
         UECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wl7hg1pdo80Ygf+JBADZba88dXLFhEepBsuXC7v4hE0=;
        b=qre7wSnjlkXkWeA6WqCpLA3/lTPvd6pliT1EWVfxDm+EPCwwPKUyi8A5vKyo3qp7QV
         Ar1zFfucVNI47gsAZpaMHKK0A4O7rwIWKMrVPdaMb6145gcSz2SX1EFAnHHttuk/41PM
         kne93/2iud3wOIivkcCbc7V9UH8HlgvUnZDVbdHOFMYaBpl/v2JEtA65tuOvzVG0c9PX
         mdsv0nRtYtPDsGnN8wM8EaVeMDktuK5ljj4MD1yLqnj2KapVsdaDS66aL9JOFfo7PH+f
         dWCSWi22yM7IaLMkuRBQI2nL8Nk50ZCk4KvNLKGBZWY2eUkdmqvxP06R5MffCAyvpODS
         c0gg==
X-Gm-Message-State: AFqh2krG+xOKrxt2tAUaZZcE43vT/B3mNL+7cAZ3I+j10L3x5sAsHeag
        hTa1OVjukltSNfWOc9S+7jexeltf5a11r5px
X-Google-Smtp-Source: AMrXdXuLYCgRTVJmLXVQ+P1YP4SN1ZnWHdMxNLQzEJgrT9t+B+j6d/Lo4I0WDOTzTzxW6/RWOES0yg==
X-Received: by 2002:a2e:9b81:0:b0:28b:8d89:712d with SMTP id z1-20020a2e9b81000000b0028b8d89712dmr5023100lji.13.1674309299442;
        Sat, 21 Jan 2023 05:54:59 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.65.44])
        by smtp.gmail.com with ESMTPSA id g17-20020a2eb5d1000000b0027fd93e9043sm5027283ljn.113.2023.01.21.05.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 05:54:59 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: drop stale comment from struct dpu_mdp_cfg doc
Date:   Sat, 21 Jan 2023 15:54:57 +0200
Message-Id: <20230121135457.2788199-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The field ubwc_static was removed from struct dpu_mdp_cfg some time ago.
Drop the corresponding kerneldoc now.

Fixes: 544d8b96150d ("drm/msm/dpu: update UBWC config for sm8150 and sm8250")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index d152fef438f9..a56581b34ddf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -539,7 +539,6 @@ struct dpu_clk_ctrl_reg {
  * @base:              register base offset to mdss
  * @features           bit mask identifying sub-blocks/features
  * @highest_bank_bit:  UBWC parameter
- * @ubwc_static:       ubwc static configuration
  * @ubwc_swizzle:      ubwc default swizzle setting
  * @clk_ctrls          clock control register definition
  */
-- 
2.39.0

