Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 548714B9744
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 04:54:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233210AbiBQDyU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 22:54:20 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233203AbiBQDyT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 22:54:19 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 132E22A0D72
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 19:54:06 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id g39so7543369lfv.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 19:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TB5gV/5sjwk2KpDc6LqRsCf8QAe1Jc0ZykwfWMWBIy0=;
        b=NEkeyH1AK3AiRscVBVwxQydnYnI103BFdWInRv0N2AdXNqA53V2TwmqG+DjWxmhPX2
         Zfy/AoF9vLVRDP0HvY/qXu/290VDBdfr+EO7pHabrNOFgotcQyBL48Bf3QXhpJ17aJOe
         EcDJY14VgmbnP42HhxA6GxR05FAm4A3ETm7EnxvkUIEGAS8BEN6SL3LHQ3ns101W6lqq
         oYZmIvxLJV0zDlRwH/EqnS+7dzmPp/uc0g4KMzGRUISQ/KSiKrsz6QRTbaCKBDENztZd
         1umaFB6p2lkohTyg9PSGAyh7UfjLkpQGhgV1jLU8f/pYiKWQlm+dNtUBNocLmpIH+uXx
         AhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TB5gV/5sjwk2KpDc6LqRsCf8QAe1Jc0ZykwfWMWBIy0=;
        b=cJSVYxGNSPjT+HTWnRRX5crI0y4cnSlKnLqwA/uMt/2ilRzRZMkTjOGtkzQS5wrBQz
         XqM0kaeScIgyD1lNJ6IXTkhe3b2sJJOwfNhpa7Hc+Pkfq/mlI41RXhv/HfQpEdJKtrsp
         spuyUdA5LeLZlXnPcsO+3SbGEqPQxnLFvn4uguijCKwO4m0AbN1WL+iZv0MGt0aEEaZA
         FbmtsCklkeOI3aqfQbPwLexXgNuPF8TP8SPffxLCohacg5aizO2JhXKyP8ATlQFxFMjC
         Is1nnHjUL7QLZoTlxW8zPWCa42nuzexj5JQzN1Wm9T8eCrEECniDv36OnwrTuAqY+vsp
         OmSQ==
X-Gm-Message-State: AOAM531t8WT82zQbn4HIpNA+6mui08MofQSmo9qGzGCe09HPWCClrLFI
        IEjYdWDrkFBzm/RoAkAXANN8mg==
X-Google-Smtp-Source: ABdhPJwtyA5gG/LksjFEdbfLRT1Nr6ZbF8L/cuqKCgPctlNiAUIq77doptloSxqL2BIN5sNaqxExIA==
X-Received: by 2002:a05:6512:31cf:b0:443:7eb6:3440 with SMTP id j15-20020a05651231cf00b004437eb63440mr772193lfe.367.1645070043961;
        Wed, 16 Feb 2022 19:54:03 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h9sm1575454ljb.77.2022.02.16.19.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 19:54:03 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 4/7] drm/msm/dpu: drop bus_scaling_client field
Date:   Thu, 17 Feb 2022 06:53:55 +0300
Message-Id: <20220217035358.465904-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217035358.465904-1-dmitry.baryshkov@linaro.org>
References: <20220217035358.465904-1-dmitry.baryshkov@linaro.org>
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
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 16ae0cccbbb1..f5bc15b2e56e 100644
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

