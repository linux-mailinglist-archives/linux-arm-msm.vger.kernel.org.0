Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 092A67D66BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 11:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233435AbjJYJ1T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 05:27:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233761AbjJYJ1S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 05:27:18 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CEC38F
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 02:27:16 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-507adc3381cso7977574e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 02:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698226034; x=1698830834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UkpbSuCxl41j50LHtJ6p/pRvRPPyQRBDrCJQ5yXQI1A=;
        b=LqndCJQvMm7P9d+ObpoWcRemzY8ZNC3jshOo3wsYbjgBknhI3m6HH2fKznFZ/DvtdO
         S7HN0jm5sC5Qul6fLK6TXuKHzXhJp/XaVqhvyXH/FwZp3NVD5tvoL3x15rMa1hFefKF5
         Fmv9eUPjqUGWPjMTj7O6OvkXCwzp/p42IYhkSKuDqrIGYkB/2gflGsHMY1qVOxzzDygu
         zNbWaMf/h4YepKr3/LlM60tkzYqEugQu4lHc/mVTLz4YHEYtMDzlGAUUSezYMfvKaajd
         W1hCGAGucYNzBPLgzR4j5mbi52zmEIXWAe6hSIEJknYX8S6Cs1lYhruSVsRU46/ujfrO
         gIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698226034; x=1698830834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UkpbSuCxl41j50LHtJ6p/pRvRPPyQRBDrCJQ5yXQI1A=;
        b=HvWoRlKjjgZaebd0FLORGuQAqA7cYGllKZWVB/l+m35UkAJGaE/ZdKKvhz5LGZFaBc
         L4+6bvUDgbY7mNwNVmUVs6bzzX/mdUxDNazZVNduySLmDar78FetDwUJwVmXQ2RMkl3o
         ugWHDSoSfccIyv36W/uMQhFKHfuC7hwFNLD+nCnCqN0+Y65pSy6UYpPUu0o65ae7LAIT
         GJonsMREyX3UwGIpLogvNDTKazH6RgxFVQhQuQGmmq+hXMAnnW55CfqftciwxMeikBor
         klJymwjsbPFXwER+vsVT+Al0QDU/Upe+7IjWfs8houXX5aOEFNMAJd46+DL9rIHkL6Am
         u/Wg==
X-Gm-Message-State: AOJu0YzBT9m2yImUSSmgrAbOWn2ptJzfcc2UIsumQnS6lZRoYQ71NB+y
        u/RiwLDIqDpMSRNlGWBSLwD1Fg==
X-Google-Smtp-Source: AGHT+IGkqKhZhFNNxxXtCNi2yE8kJvwqnPOVlHtkHTCLzLASuPo6tPElKpo0tbmLTxYuBhKJa0juGQ==
X-Received: by 2002:a05:6512:214d:b0:507:99fe:3237 with SMTP id s13-20020a056512214d00b0050799fe3237mr9576663lfr.41.1698226034586;
        Wed, 25 Oct 2023 02:27:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id eq25-20020a056512489900b005079fff83d2sm2470377lfb.3.2023.10.25.02.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 02:27:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v2 2/2] drm/msm/dp: attach the DP subconnector property
Date:   Wed, 25 Oct 2023 12:23:10 +0300
Message-ID: <20231025092711.851168-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025092711.851168-1-dmitry.baryshkov@linaro.org>
References: <20231025092711.851168-1-dmitry.baryshkov@linaro.org>
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

[1] https://patchwork.freedesktop.org/patch/555530/

Fixes: bfcc3d8f94f4 ("drm/msm/dp: support setting the DP subconnector type")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
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

