Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A71314B6E86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 15:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238514AbiBOORA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 09:17:00 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbiBOORA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 09:17:00 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 755E227175
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 06:16:49 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id j15so14230463lfe.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 06:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7Wgv1r0Ja4kv+q7R33vFu+J3TG98XPEyfJ988+yvLp0=;
        b=YRJzRgM+5jP2zo5GkV7gS+z+z+6IOEZt1xyw7ohc2uvazVeQhg5WHG+PpzJ7Uvrvkl
         BvgMRiznElPgkeaZnCkXxb2w+/fBcuu4H6P91y5mgnaHISH+W+aUReEStTAmXTTRUyYu
         9hY6FgU3iqSsBonW6/EZ+I4jFVGnTtXdHj8d42r/J4kDdjFH3X3WQDTLEYcqnkx4x+zr
         IKhBUvpTtzpPwKAgym7/TuSbdPtwWmxp8HUmDEjgmDMIfA7CYpSH06DLVNZQ2mc5m90L
         Xq+UTArHpEgxzrjVQpcg2DlUeg+YbzShSjlBzI7quYhPIEg55eXNk8FIsY4NJIoGe0NF
         7jFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7Wgv1r0Ja4kv+q7R33vFu+J3TG98XPEyfJ988+yvLp0=;
        b=gcbh2tbzVTfN+7m7qRklTDCdz6ecd2NQCalaEaXtxKTKcZPSBeVjeE5GYyJI+sekrr
         rQlN9OAS7c75zmRUkJsw9+6IKkwNiz0SO54yQAL3iCpHNNj6VqOmOGZ/A6sSUV1wSTLd
         1tAFxyNY9Nlrq+FVg8EbVOXpuCPUxUtAsnulV66xE94iWq/U9QU9z2gYDTPJzIS2rD/C
         vBe8BuHRaydAneV9qQTtdTMvsuNsim7PGUIe3jIt9S27s6yjHQnvD4S9tAajOZCEO/ir
         /vC2psuG2KV/kaVnSw1fW1DMp+1jIyE+kYAORQlRaNfAsnoJFmrBDIcgyQxcFVuWWop7
         T7vg==
X-Gm-Message-State: AOAM532R0bi3jvC2RqJH6vPNyuWO0ay6+tR/cSllcEvcpNn/4tcBW7ks
        d/gqyU6MqKMBI49Dqe9Tatf5fQ==
X-Google-Smtp-Source: ABdhPJwJP5BWmAwDQOBWjjHnLLIYAbJPBOGzXk6aERcNdCaSXoHbdjfef1L147OM0DHiAHtvg+6t7Q==
X-Received: by 2002:a19:ae04:: with SMTP id f4mr3145769lfc.667.1644934607857;
        Tue, 15 Feb 2022 06:16:47 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m16sm1018044ljb.131.2022.02.15.06.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 06:16:47 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 4/8] drm/msm/dpu: drop bus_scaling_client field
Date:   Tue, 15 Feb 2022 17:16:39 +0300
Message-Id: <20220215141643.3444941-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
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

We do not use MSM bus client, so drop bus_scaling_client field from
dpu_encoder_virt.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 401e37f50d54..480d02ccff8c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -127,7 +127,6 @@ enum dpu_enc_rc_states {
  *	Virtual encoder registers itself with the DRM Framework as the encoder.
  * @base:		drm_encoder base class for registration with DRM
  * @enc_spinlock:	Virtual-Encoder-Wide Spin Lock for IRQ purposes
- * @bus_scaling_client:	Client handle to the bus scaling interface
  * @enabled:		True if the encoder is active, protected by enc_lock
  * @num_phys_encs:	Actual number of physical encoders contained.
  * @phys_encs:		Container of physical encoders managed.
@@ -172,7 +171,6 @@ enum dpu_enc_rc_states {
 struct dpu_encoder_virt {
 	struct drm_encoder base;
 	spinlock_t enc_spinlock;
-	uint32_t bus_scaling_client;
 
 	bool enabled;
 
-- 
2.34.1

