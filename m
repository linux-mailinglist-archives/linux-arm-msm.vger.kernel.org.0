Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B43D73D080
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jun 2023 13:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231753AbjFYLmj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Jun 2023 07:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231984AbjFYLmg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Jun 2023 07:42:36 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CFF811A
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jun 2023 04:42:35 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f954d78bf8so3012883e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jun 2023 04:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687693354; x=1690285354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMftiAUxeR8BPoZkZvXeNvb1WLgqdhL6DsPjfLjpExg=;
        b=nE9hwWDfWngVy/rJ1ATloHL2acbnwoqhkXi38nYNFRf1kqZvB71Smf9bY+b/qkrxRP
         MXwB9J5C9ItoBwkkMGNCcn4lpjlZqKXZYOy7ojITBqpz+YA0ayUBiGBnq9HlMmAGb12O
         6u3q0MrT4vlbNvIjFcH+4UMvFq3OVM9Dvw3BRFepnAVB9fEDbqIAit6SifKg1vx1xKzW
         P63sX/0OItKDxNlXzDmh7X/E/fLaWYYPXDddddvAK4XUNeaXVOLEYi+MNbGoqxV7RVQS
         zw6oboCfNTyAoJeHJ9c6K/PvkFU0vbURW6HoODLyIT5IOHXAxdyu2IgUUWmSYxKc133c
         /Z5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687693354; x=1690285354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMftiAUxeR8BPoZkZvXeNvb1WLgqdhL6DsPjfLjpExg=;
        b=AzPzSo6Y5QRnreU5A+Hj5ymNToiMk6Q3l1cR/Rmxg6PnXGShXj+wRdkUL/vOCEdi19
         jfxKFSDPvQWk3thu32uOwJWbN4cjGMVK6B+VkHcx2du7+lxMpcEn6HPqRy+ZxR6fUGD1
         K6/DO0bPBZBWteX2vAAPnKQuAl+e960e5qqZJR75ISpiGgjX96874y7UJ4avC6b51K+p
         Ste/sIZT6X402ybXJ3uFfDn7L/Yk0NXCHRwDmi/UMDVCSp88U3VQD54HFIC2F51oOSCi
         Ly+K9L/NSWRKDHHYhxFWu01IwG2GgZL2MCt9ohUW4Ta/dkvMCx9ukpbPqCXioiV6DEdh
         WONQ==
X-Gm-Message-State: AC+VfDyAv5QkqhoJ2OoU1y0rfQzVy20OR5hCVFomh9ePBnGJMw5ztsMP
        ZkOeLfeWC+400CmQGU3k9am3uA==
X-Google-Smtp-Source: ACHHUZ42a3rY1LXrItHqP+/HoHNQ4DRPF+yUblDDgmlM5wyJNaabrKnL1yHAUQYVToD3/xWvmBDNxQ==
X-Received: by 2002:a19:5018:0:b0:4f8:75b0:2297 with SMTP id e24-20020a195018000000b004f875b02297mr11187764lfb.43.1687693353834;
        Sun, 25 Jun 2023 04:42:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b23-20020ac25637000000b004f87893ce21sm637323lff.3.2023.06.25.04.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 04:42:33 -0700 (PDT)
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
Subject: [PATCH v2 12/15] drm/msm/hdmi: set infoframes on all pre_enable calls
Date:   Sun, 25 Jun 2023 14:42:19 +0300
Message-Id: <20230625114222.96689-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230625114222.96689-1-dmitry.baryshkov@linaro.org>
References: <20230625114222.96689-1-dmitry.baryshkov@linaro.org>
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

