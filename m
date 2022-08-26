Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 074B95A24A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 11:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343966AbiHZJjg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Aug 2022 05:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245226AbiHZJjf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Aug 2022 05:39:35 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4570AE216
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 02:39:34 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id s1so1282380lfp.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 02:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=XJBZo86NwzlYcDfKiueYzUkDbZYleRySpVsik2jGH+A=;
        b=qpR7kKD1V3xBxJwj/wDBDO/SFHHHvlDYnlDrpv2aTla7l7Bj4pq1d8enTjpRnpHyOL
         JFrcTElR51YXfx7D8/A5baErgAx6mSa6V5OxSBF67SGUvWDHF18O423UGhbIXXi3Daen
         mcgUicIXXgq/Tek4pesS7vw4IHg30mihFUX/+hJ/dacuXegYwujWZeQ6q3HhUC260bnb
         4RaGeovYLe/gjJz1VSubMQHyrHAttkgcGqA5/qVDk1ZdzQZVD0ludYmRI3rIbO2Y+11k
         o8m2ent+YZyehIkednJG0R0ssgYxtNqK8lG3pT+qI9tH5UlZJ2Xv8VPLm5QKzP6zYeDo
         j0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=XJBZo86NwzlYcDfKiueYzUkDbZYleRySpVsik2jGH+A=;
        b=T3O7JfR3IV7Fx4FGXnlYbYv6FO7jXhwmJR+XhfICdnPjdchU/2wRP5dT4jsttxzNb5
         i4HDhM1dtTTT2OjbLj3QDM0B1+EZOCi0NcNsEGagJVtbHBPk+qvs4Fa78Xye3i+5b4N6
         huLXKsaiNO35/uDUhCj45ly0ccwoRfrm2suU7+lClIHXZ76qQtqtboxvp4Yzy+9Ovciw
         2trR8zCc0ydBl4S2ctm5okHxjQ7P8vzsa/izqf4WF7O+pH90WMa+ELe+gudfQs1do6+X
         1wWv6siO/FrL/1xXs9vv26Ku7SpMxTsJLrXnWKK1nF2HU3jav5mzWX6PyPK4Goa/9ygZ
         l5vQ==
X-Gm-Message-State: ACgBeo1B0+6i8rGygYbxjyk7HGm1ta3m1ceDR+0/4e91LeCJYcRTQy3f
        caLuWcLEOcn4anX84ZO2IntjeQ==
X-Google-Smtp-Source: AA6agR5dRIkH6udc5pKFMe1bhIYgbLLZvNUngMjDNapUvHnC/ilmRHVTVwwJnT4S7oGbP+Stft24mw==
X-Received: by 2002:a05:6512:acd:b0:492:b8e0:2ef4 with SMTP id n13-20020a0565120acd00b00492b8e02ef4mr2091002lfu.360.1661506773119;
        Fri, 26 Aug 2022 02:39:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m6-20020a195206000000b004886508ca5csm329055lfb.68.2022.08.26.02.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 02:39:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 4/5] drm/msm/hdmi: don't take extra reference on PHY device
Date:   Fri, 26 Aug 2022 12:39:26 +0300
Message-Id: <20220826093927.851597-5-dmitry.baryshkov@linaro.org>
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

The of_find_device_by_node() already increments the device's usage
count, so there is no need to increment it again using get_device().
Drop this extra get_device().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index c298a36f3b42..926274eeee25 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -106,7 +106,7 @@ static int msm_hdmi_get_phy(struct hdmi *hdmi)
 		return -EPROBE_DEFER;
 	}
 
-	hdmi->phy_dev = get_device(&phy_pdev->dev);
+	hdmi->phy_dev = &phy_pdev->dev;
 
 	return 0;
 }
-- 
2.35.1

