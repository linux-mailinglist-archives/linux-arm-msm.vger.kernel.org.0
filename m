Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 505A7744386
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 22:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232301AbjF3Uzd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 16:55:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231617AbjF3Uzb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 16:55:31 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D14C53C1D
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 13:55:29 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b69ea3b29fso37677921fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 13:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688158528; x=1690750528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMftiAUxeR8BPoZkZvXeNvb1WLgqdhL6DsPjfLjpExg=;
        b=usVfE0y4jfSD00eARARtyNvfymfnThV6CUhlklL4nAs6e+w1JYFtG/5wLuXzyS+hVf
         Pqv1DBUv1x33Etorg51OvJadmEhWLrgSD2UHH3c2dWGnfuYMLZ7x440UPtBPSL3PTDkp
         kNRkPlRhB9hbrWGKCM3IWX6uPIs51/XTFABGyhDut2tDfIZYnCwCSTZEyZd/VwKDIUn+
         kGH/ZsilZTaONYNkaBiVWuieLVxb3Q3uahF/qo6huPbs/Vj+lIpUwlaD0cLXsUSVFmha
         be2EdSDAszQFtvTyHfID1odLugarT7IN/Vz91nW7In/DfMV9dy82MBLKuB/4Jz/svyVT
         FOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688158528; x=1690750528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMftiAUxeR8BPoZkZvXeNvb1WLgqdhL6DsPjfLjpExg=;
        b=Z2ES1QzkPKxNt4EgmN14A7kbzCMRN6Tyq/b2BenjSnGSw3aOJWWpgpphwaUJ3fZblF
         nTiNZnNuvXtHSD3w+hbVWemiKfAoVBTLRlCeu4tI8WujFIXnq3K34s+naBloXbEcIzLD
         APINdfGcbTG0J3xRR4bSYaXxdmwlHTef5T4bUjj1rVFyyU2zWSfEw2U6YmzzUGDGTFah
         T1ZodAj9gyOuQ85AgyF2XA9xQndm3frvaa+GADpVJlwyWZxm+gD3F1TTp8POZBGSD+7X
         43EWXQm5lkldYF2Gg/vf5ssrtvsToIY0exKpJd8ZBSrnHmPQmjD6hPtrnGQHxfjEdSY0
         yl4g==
X-Gm-Message-State: ABy/qLbJ9GzTzRL4RXGJIt+L7kuGhGnENfSQmXLVxu7xBunu7v4AmFjR
        0LlydICCOg7O9JUzxrev5V4fxg==
X-Google-Smtp-Source: APBJJlHyyQbnm/lpzaiiXKLntZxu3ILVALF+gEnPjZh2lE+JZqTtQLBu3lv4roeobNHdDchPapmEtA==
X-Received: by 2002:a05:6512:619:b0:4f7:6a40:9fd7 with SMTP id b25-20020a056512061900b004f76a409fd7mr3055482lfe.47.1688158528191;
        Fri, 30 Jun 2023 13:55:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z11-20020ac25deb000000b004fb75943aa0sm2252168lfq.196.2023.06.30.13.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 13:55:27 -0700 (PDT)
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
Subject: [PATCH 05/15] drm/msm/hdmi: set infoframes on all pre_enable calls
Date:   Fri, 30 Jun 2023 23:55:13 +0300
Message-Id: <20230630205523.76823-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
References: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In consequent modeset calls, the atomic_pre_enable() will be called
several times without calling atomic_post_disable() inbetween. Thus
iframes will not be updated for the next mode. Fix this by setting the
iframe outside of the !power_on check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index f9293f7d8f34..bb10b35194ff 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -141,10 +141,11 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
 		hdmi->power_on = true;
-		if (hdmi->hdmi_mode) {
-			msm_hdmi_config_avi_infoframe(hdmi);
-			msm_hdmi_audio_update(hdmi);
-		}
+	}
+
+	if (hdmi->hdmi_mode) {
+		msm_hdmi_config_avi_infoframe(hdmi);
+		msm_hdmi_audio_update(hdmi);
 	}
 
 	msm_hdmi_phy_powerup(phy, hdmi->pixclock);
-- 
2.39.2

