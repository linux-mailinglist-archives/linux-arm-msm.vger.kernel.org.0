Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4447CD5A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Oct 2023 09:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbjJRHqf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Oct 2023 03:46:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbjJRHqd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Oct 2023 03:46:33 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C2B4F7
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Oct 2023 00:46:31 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c514cbbe7eso54015281fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Oct 2023 00:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697615189; x=1698219989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mK3SefmpOCRjKq+TTt3SLLU2DTb3sKYmEQQtAXZNfAc=;
        b=EcdCsaH3xUxAAG9bOFvW/4aCOmkhHTbYUcs4RarEitNDMoCht4fv9uPB/83MlidskA
         vmM9fIhpT2Y3e/J1Xx0mvkT4iUg4c4LFv1Ww2WYdQ41u+gnm5MAOrsLjBJrwtzPanNGY
         U1x93AGA6eyTGVB2foTUEPcuwj93VcZmfkodmZVhRRYivd6by6bPdyX62ABq2WfwDiyE
         zElLH8hLDOm4Nr68fhj8x3ezHjj7DA01RtJh/H8APP4XY05PKqtILKXe9poguQTTcgHf
         WLmPyYPEmc1s6ys5dV0UKj1H6eIyigwI7gzbUTr64BfxN8YxYBlE1uFwkoc8bd+iZlYf
         RhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697615189; x=1698219989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mK3SefmpOCRjKq+TTt3SLLU2DTb3sKYmEQQtAXZNfAc=;
        b=fzRCq3c9rI/aOU3uicAIZfS8c+diNC9fDYNOHhWKIJRMDEW/m0BmDn6pb0C6AwNxV1
         s+fmR50ZDrpvciH+V9cLIjxTuZ+Xiu0JOi2jp4aOvteClhnipRQBTb5s+DXGRA6Xu8qa
         ii7/GfYXvm3ZOVbpYT/L/6vDmTjBZu7ha9n8ZjqqYG/KV2P06MWTsdG50dUqcWjsLMhc
         jUedqSsm5hanZ6wZiOpukcNVgAZbp9s0FQd+V38NUhh1N5n3a1rVbHm6/sx9j4ptN3m1
         YzoDV0LmKxBRGQ7Xf3+s4eaDJomWVyIp+s486VqwWeG4dZY2GerEdc50e/fx4Rp2UuvP
         DKzA==
X-Gm-Message-State: AOJu0Yx57u0WXyYEh2Gb2m8vjdO3Q0G7qKA2bLYKsh0Ir0cmbCtZcU9V
        3K7aon4IkVgW6MhbQsQcupb8xg==
X-Google-Smtp-Source: AGHT+IFi2RBYSKm7xKyj2+wrqQkWPgen3dgh6wPWuWzx4GmvuK0+6VPXmH/jpPjWwWbLrTIPuN/vSw==
X-Received: by 2002:a05:651c:2117:b0:2c5:32a:cfe8 with SMTP id a23-20020a05651c211700b002c5032acfe8mr3842098ljq.44.1697615189597;
        Wed, 18 Oct 2023 00:46:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru (210.red-80-36-22.staticip.rima-tde.net. [80.36.22.210])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c074600b00405442edc69sm923015wmn.14.2023.10.18.00.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 00:46:29 -0700 (PDT)
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
Subject: [PATCH] drm/msm/dp: attach the DP subconnector property
Date:   Wed, 18 Oct 2023 10:46:27 +0300
Message-ID: <20231018074627.55637-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

While developing and testing the commit bfcc3d8f94f4 ("drm/msm/dp:
support setting the DP subconnector type") I had the patch [1] in my
tree. I haven't noticed that it was a dependency for the commit in
question. Mea culpa.

Since the patch has not landed yet (and even was not reviewed)
and since one of the bridges erroneously uses USB connector type instead
of DP, attach the property directly from the MSM DP driver.

This fixes the following oops on DP HPD event:

 drm_object_property_set_value (drivers/gpu/drm/drm_mode_object.c:288)
 dp_display_process_hpd_high (drivers/gpu/drm/msm/dp/dp_display.c:402)
 dp_hpd_plug_handle.isra.0 (drivers/gpu/drm/msm/dp/dp_display.c:604)
 hpd_event_thread (drivers/gpu/drm/msm/dp/dp_display.c:1110)
 kthread (kernel/kthread.c:388)
 ret_from_fork (arch/arm64/kernel/entry.S:858)

Fixes: bfcc3d8f94f4 ("drm/msm/dp: support setting the DP subconnector type")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_drm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 40e7344180e3..e3bdd7dd4cdc 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -345,6 +345,9 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct dr
 	if (IS_ERR(connector))
 		return connector;
 
+	if (!dp_display->is_edp)
+		drm_connector_attach_dp_subconnector_property(connector);
+
 	drm_connector_attach_encoder(connector, encoder);
 
 	return connector;
-- 
2.42.0

