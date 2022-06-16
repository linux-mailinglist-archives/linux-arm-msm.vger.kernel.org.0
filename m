Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 638B754DC60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 10:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359602AbiFPH77 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 03:59:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359354AbiFPH7w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 03:59:52 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78A7D5D65A
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 00:59:51 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id y32so1012796lfa.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 00:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pK63Gcracvx3JbDdqH695RF+R5AO+vccoaxrk2U/rT0=;
        b=ulfzvg9gGWWYXDoIVd4DDhUq5mL/v79PzsN5xF5oXtvlndr9LBXuSMvSDXxYqusdcs
         0gVi8Idoz7oTS845qmfQ5AepB7lXVRMrNeM0lUk4bGPvdA4rByBJGWGpK0rS1i9gmXdV
         JDMLDVG2BHO1Nbo59WpJh4O7loVbpnLGSbvNOYIll+IZ5Agl42wyl6GBcA/X/D7QLZYo
         T/ZiQALG+qtImAS6Hk5FnnaJ/OMGtDmdjZP0wkBeE4T5ND9junO6+jLSCji0bW7cDIJm
         8CP+M+xfM6tgjZD+rIBtek25WdnHXZTjZKg1bB3XKKW6aRvlJVEPmvWR8JQu04mLtOd0
         qpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pK63Gcracvx3JbDdqH695RF+R5AO+vccoaxrk2U/rT0=;
        b=BlxISmujRTu+Of5EwXrKWC69Y13qhE2BsNs3P0woRfYw7+32opoi77Tz7gNEQsEGYG
         rPx3mhZl73lzir5Kn0g01F98XPB3b7d1Vc79jh7dgi15OjjNp7O8h2kkhxNrvatYeYbH
         6n77AWl8WE1TkCLZcc7UF3bgbBDrSZJdFAN/ELMSSYwKfqfSHRmICG0QwzBCxZwPs3NA
         LxKNSRcxPJLMZbaJaTb6EsRcKd5AgfphfvXQt3F4UyBRdk8MQXlTCJKXRDkKaeOl+L8e
         jUlSnPpWgoYWi3WUtK0hF/EJTCGc/j++i6zIgKmgJF6H3mYgngI0QHlVFPfBMHBF5Y0L
         NF9Q==
X-Gm-Message-State: AJIora+8W866CUyM0p0HTy6afefOfAc1JTDWbc52qzB06J8smCEaf5hG
        qA2obvCiu4bIV8d1gZe4R1f5QA==
X-Google-Smtp-Source: AGRyM1u0mQRtd4eiR+Efh9ifaiEjyhP2i5EJCeLCZln2lk0Zx/7+DUx1YDseK3T5FxHmGIsKOpDppQ==
X-Received: by 2002:ac2:5e76:0:b0:478:f72e:7531 with SMTP id a22-20020ac25e76000000b00478f72e7531mr1943784lfr.187.1655366389822;
        Thu, 16 Jun 2022 00:59:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d3-20020a056512368300b00478ff020832sm136717lfs.106.2022.06.16.00.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 00:59:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 1/3] drm/msm/hdmi: use devres helper for runtime PM management
Date:   Thu, 16 Jun 2022 10:59:45 +0300
Message-Id: <20220616075947.347888-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616075947.347888-1-dmitry.baryshkov@linaro.org>
References: <20220616075947.347888-1-dmitry.baryshkov@linaro.org>
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

Use devm_pm_runtime_enable() to enable runtime PM. This way its effect
will be reverted on device unbind/destruction.

Fixes: 6ed9ed484d04 ("drm/msm/hdmi: Set up runtime PM for HDMI")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 6acc17e0efc1..9ff9a68b201b 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -247,7 +247,7 @@ static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
 	if (hdmi->hpd_gpiod)
 		gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
 
-	pm_runtime_enable(&pdev->dev);
+	devm_pm_runtime_enable(&pdev->dev);
 
 	hdmi->workq = alloc_ordered_workqueue("msm_hdmi", 0);
 
-- 
2.35.1

