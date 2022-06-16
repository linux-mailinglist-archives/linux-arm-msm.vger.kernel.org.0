Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B6AF54DD98
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 10:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359797AbiFPIxj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 04:53:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359846AbiFPIxG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 04:53:06 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0071C6163C
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 01:50:58 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id c4so1150941lfj.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 01:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JCCzD7oRfJJDnx60RNCfCTBL5b1EzprlMae+XENmAMw=;
        b=nHq0xF0ZYp3tEAz+fksuTFTmTGEc0OFPXgW2/s+GNpAhBfmKPKdBYphT7TZavBVMtU
         oqp+Vd2l0loY/cKTWoVo5qJeAZeS86Ah39QqsE6KllgN6Kl2vI7xNazan1ZDoG3BHTYr
         hnwSeJDS20VsYcgtcJI3uZaj50UxyEVjj178GyfLNmn2VtTlestAKHaxMvSKYAcaY1Fc
         5x4+nNVQnFe8zgrsv/IOxDbZEPCf2Wn1q+D7xKGgLzmBvhpZHyKg4B0APZvhBQYc/gKV
         Xb1SCahD3iYTtLUWGFE40OycZeFbB3Es1UYMEO6L1CpM3clkCfoby9q2RDaqcubLSnPn
         Wckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JCCzD7oRfJJDnx60RNCfCTBL5b1EzprlMae+XENmAMw=;
        b=dnXYbD/GU3RSa5tunZw1C3KMF2dHRgR071MPcjhk9VJhEGHcOsYAFIaJnbVfqp/mcc
         ymL1ChWjJEvClsCPkfxYh6SpN73l8mzj1JvY3oJMFBMQrJoc7OpFbbu/bCfWKsoTQBz9
         him3wGMtSVZcZgbAam04Ea7QB5A/4teJpfS8E8Gm2iVZQ1EGGWew040iPv6qAvikPQJE
         IFgXifVWNlj18lRktptKmohhI0ElQWFcmw5F5/ZcsGOt6eTpH1kz1peErsE4zrgFGw4I
         AAodJ/3VrhZqfczdefau8fiJmWr0VGoXVdI+KGCHrLU2bfEUgm070KZdBSJBsdYGpj9R
         xx9g==
X-Gm-Message-State: AJIora9nvwiEMwtsJEn9Hk0fadHD3TuM9x8tPmW6brJKMkYuTNocim3d
        rsocgmZasuPH7rOpd2IMxxRc6A==
X-Google-Smtp-Source: AGRyM1tpGaPfQUuy8/yW8c6Ns9ktOMIazvlJV8x2JhkS9lg7S7PSaaDBdKwrUpogNykTLJfE4MJtiQ==
X-Received: by 2002:a05:6512:2017:b0:478:f827:67ca with SMTP id a23-20020a056512201700b00478f82767camr2064877lfb.10.1655369455004;
        Thu, 16 Jun 2022 01:50:55 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a16-20020a2e8310000000b002557115af75sm167209ljh.118.2022.06.16.01.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 01:50:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/hdmi: drop empty bridge callbacks
Date:   Thu, 16 Jun 2022 11:50:54 +0300
Message-Id: <20220616085054.432317-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Drop empty callbacks msm_hdmi_bridge_enable() and
msm_hdmi_bridge_disable().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 97c24010c4d1..d569f0c6cab7 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -159,14 +159,6 @@ static void msm_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
 		msm_hdmi_hdcp_on(hdmi->hdcp_ctrl);
 }
 
-static void msm_hdmi_bridge_enable(struct drm_bridge *bridge)
-{
-}
-
-static void msm_hdmi_bridge_disable(struct drm_bridge *bridge)
-{
-}
-
 static void msm_hdmi_bridge_post_disable(struct drm_bridge *bridge)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
@@ -306,8 +298,6 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 
 static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 		.pre_enable = msm_hdmi_bridge_pre_enable,
-		.enable = msm_hdmi_bridge_enable,
-		.disable = msm_hdmi_bridge_disable,
 		.post_disable = msm_hdmi_bridge_post_disable,
 		.mode_set = msm_hdmi_bridge_mode_set,
 		.mode_valid = msm_hdmi_bridge_mode_valid,
-- 
2.35.1

