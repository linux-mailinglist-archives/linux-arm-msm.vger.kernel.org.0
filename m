Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9002270DC42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 14:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236762AbjEWMQT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 08:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236764AbjEWMQP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 08:16:15 -0400
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D943F18E
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 05:16:08 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4f3b4ed6fdeso3930090e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 05:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684844107; x=1687436107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMftiAUxeR8BPoZkZvXeNvb1WLgqdhL6DsPjfLjpExg=;
        b=ETX+jpQh1MkS/oEmbkm1RFkjIuPTjVkoKZKMQyqb44Ujy6MPxqvuFFRR5Ozv1N0fPL
         IyRB8EvrCQUBDzkstsPROcFAYQ7O6UofNHKb4BgRFu8BpUTjlKD5eVx0dhx3mVAHQr+e
         ozCd+EVp6H33iBFNoDaAnD5i2WIfckcUzBL91i4FYMXFEn7vvogAnsjs9zn53E/hJkK3
         LElwG+XWm/cAFZrLhqcdOPkbMVV/f7Z65RHR/MDV4Mm2ULcy2ilkir4TjCbvjfiTc8iB
         BnpqO61RlUfjK6tn/iGB7tqivbti3PaXHqJ4yeetkBiZ9/Exc43+iHe9sV9rqRdhlFe8
         Px/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684844107; x=1687436107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMftiAUxeR8BPoZkZvXeNvb1WLgqdhL6DsPjfLjpExg=;
        b=PJOg0hembwxq0l6MKhW3hEYdp+xEJwAv7sd0cFAMtoSZtfb8DT4N8UI4y7pjqgqiZU
         9Pu988OKueYHVZNKLreqjJRgywwsKpntLcTug1QCoJRLTjhayYjF+RikSSLrYmVbiNN7
         JQATtb7xsExUdjc5894+DpxxVqDPTWbjBBfu/ExkPSY/27e5vj79hcUpRNIMDpnjmomx
         epmmiwK2ShHeDIGAyhQba1LddTIcCf4Dh8m1s1c0dYvayHptfniUq2XhNN92Tl/iPDDm
         pvvyAha4DpHNFCAKhnmxmlvPTXKbsexTLiQVa1HY6Fpshy0uxkg6wzHcQbPon6bDLTC9
         ccdw==
X-Gm-Message-State: AC+VfDwbUGs4wCMMa9ASceWtDt0JRnnTONPGAtn/V6X47C83Oz8x96oy
        z+0ZYhVbUhoNy+w4OugGbSqdhA==
X-Google-Smtp-Source: ACHHUZ43GR6mi7FCfEihpvwLYVmk40w1hC6t0c87laL1uoecXBbBd/pseUpVwOps9C9xtYnTi/b2Gw==
X-Received: by 2002:ac2:5fae:0:b0:4ed:b4f9:28c7 with SMTP id s14-20020ac25fae000000b004edb4f928c7mr4155100lfe.6.1684844107381;
        Tue, 23 May 2023 05:15:07 -0700 (PDT)
Received: from eriador.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c26-20020ac2531a000000b004f160559d4asm1319616lfh.183.2023.05.23.05.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 05:15:07 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org
Subject: [PATCH 12/15] drm/msm/hdmi: set infoframes on all pre_enable calls
Date:   Tue, 23 May 2023 15:14:51 +0300
Message-Id: <20230523121454.3460634-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
References: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
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

