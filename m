Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 005435A249C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 11:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238963AbiHZJje (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Aug 2022 05:39:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245226AbiHZJjc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Aug 2022 05:39:32 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D270ACD535
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 02:39:31 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id n15so1294503lfe.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 02:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=qWb9HqeFqbEjNo0sX8LWqplCuUfM7JNEP4wMIZnoIBI=;
        b=NGf+DQWXQ5hozu+8Vb2gZUGGz9qnwo3us1L8EiFM6rrC0BncmtMMMJIPszws1Bj9bg
         8jwSi6yw41MGbMCL3hLaxH6QfANE00+UJ/4Sr5+PE6WHtNIxLXKhBY+SZHY6uPuIDHZ9
         MBWLSDGh8yYnl1mHIvWNsMFWqb4rJ2ClyVldRS2ZhxfqFHOA6oPCwaqgThHbWo3lO2sa
         bIS1nyCeIpwMugQk5u7o8tZFwtZiLf0HaS2+m3vcKRCIuHh4+cujd9acAgPZ0l5pvtwl
         tJOweNonRWYXB9wvFgKC1DXD4X2jQ7vDyikduNH6xdp5sFeu7cXH1AdGv7uyeUvRHTMt
         26Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=qWb9HqeFqbEjNo0sX8LWqplCuUfM7JNEP4wMIZnoIBI=;
        b=BmJGxKUuZ3JhhdHmoK2PfU/bamSt8kVV3A4H4p9tgIHpdl1pEbfL8Z5A2OyKVUt3bl
         nP5j26L0LgUF+loSxe1ufNK4MKssSMLnVpT/1yLCl+QQZsv5Unr2dw25zBJZwPfDbQ6A
         a37RUKkfVdQz0GKK7scvE1pUwUev5hJwuUNjiM2vqVgtOv2+laQCvBES097xmFdh/Gyj
         6D8p3eHPmyBAAyBo/Bk83X36coS6jDmHA0TsuTIcNjEh3zsOwnMv+ln8y0uJL4e7B6f4
         X0mVLUdF6jvR/wMM+IR/96akcqOdg8z40TWph9bjwd4Vy97LWXgLRM73sDNBOfV2k0iU
         Hj5g==
X-Gm-Message-State: ACgBeo0LP7ZIQu0s395/4R7b658kv4KlFmabMA+H0lB/5hkQcAfsp7Mb
        ldQ2mLYPET0dLfiC+AeonRRbDw==
X-Google-Smtp-Source: AA6agR6KpPktXTIffRko51lBRjKetKH/0kFJEkJQx8jlsskHvwLVgjRaJr32l9jyc9jbvgrgjVhqDg==
X-Received: by 2002:a19:f010:0:b0:492:ca3b:e34 with SMTP id p16-20020a19f010000000b00492ca3b0e34mr2196875lfc.563.1661506770071;
        Fri, 26 Aug 2022 02:39:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m6-20020a195206000000b004886508ca5csm329055lfb.68.2022.08.26.02.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 02:39:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/5] drm/msm/hdmi: use devres helper for runtime PM management
Date:   Fri, 26 Aug 2022 12:39:23 +0300
Message-Id: <20220826093927.851597-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220826093927.851597-1-dmitry.baryshkov@linaro.org>
References: <20220826093927.851597-1-dmitry.baryshkov@linaro.org>
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
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 93fe61b86967..1d4557de6872 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -252,7 +252,7 @@ static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
 	if (hdmi->hpd_gpiod)
 		gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
 
-	pm_runtime_enable(&pdev->dev);
+	devm_pm_runtime_enable(&pdev->dev);
 
 	hdmi->workq = alloc_ordered_workqueue("msm_hdmi", 0);
 
-- 
2.35.1

