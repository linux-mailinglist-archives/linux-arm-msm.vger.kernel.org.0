Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 335ED790EE4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Sep 2023 00:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231715AbjICWYj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Sep 2023 18:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbjICWYj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Sep 2023 18:24:39 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75A0CDA
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Sep 2023 15:24:35 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50091b91a83so1481690e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Sep 2023 15:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693779874; x=1694384674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XEhViKgKa5eb93Mv2StmnO1+XOdK/MONhfma/MWqrho=;
        b=IQFHBhjEORzOHA+aAy3SkuSLFCHRf/abQJzGA48MbLBkYYf016FVJ4vw9S+kMcB4EI
         Qo8EP7l1+hqwJ1ITTbeWr3o99KfXy9THeQtpQPZSTx7txUG6bZDmxU2z3kjFAXJz9OgY
         dj66cIlEoialvdGW9vDDoLSEEP3pRmTFTFo3uiNdESBJYnm80dYDbUaxBqi9KIl2wgn5
         GpEvQ2Uzw9M2wddKJJBbyqCKX4cATykMQJCxU8owwfwCiseii0s+Od+RCHKBHDr/GsOM
         SQYIpFu5xYTIZuNTXP0PTLHW4PL1jOO8qnIN2eKjM76pbzBK00XzHMAgHAdjZDogkJw8
         FY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693779874; x=1694384674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XEhViKgKa5eb93Mv2StmnO1+XOdK/MONhfma/MWqrho=;
        b=LDwKEsBTQKCliOtbcC4qpSaPBKjff6S4c5jcO6DeF6If5dBch8tNlnfp9CcJzJaEAc
         7xwywLFywsrW/UAofiuPE9mP0riM4qMPZygmOPEkoL5tHbqpQE+hEpYLsd/DIUmuE/+V
         SOH7CP4mfU7skMgBs/oUfp3dyYZbiaE9vJtN3WjFzrL4ek3wqGl04zVYHmIBYDGPlkXF
         nNZweVRJk3IJrdWem9aNOIV5liGIJJHoU/RWcx2/0h7vNfoBhCK1a+F9ELx/IMyNvcki
         suuWdbJPDtMALrffhZ+ofkFxKV1d3iPazNmRloC4E0ZCHCjnYsIJDyxVIganx5QPMdKd
         /PKQ==
X-Gm-Message-State: AOJu0YwqwOGIkYgrWx5Uw6JdA63L7WYNaykk0D7eeCXVXjKxMCgH2TNd
        THhxw1fZ3xxrXATHxjY9ee27sQ==
X-Google-Smtp-Source: AGHT+IGkVndOJyfxDqGt5dFZj8GwhNu8Z4fdUL8ZicnKvKTPy2GOhiAjh3VrKANhrIbX6uo1IKua+A==
X-Received: by 2002:ac2:5383:0:b0:500:ac3:dd77 with SMTP id g3-20020ac25383000000b005000ac3dd77mr4974529lfh.10.1693779873773;
        Sun, 03 Sep 2023 15:24:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x11-20020ac259cb000000b004fe9d0a417dsm1421016lfn.185.2023.09.03.15.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 15:24:33 -0700 (PDT)
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
Subject: [PATCH] drm/msm/dp: support setting the DP subconnector type
Date:   Mon,  4 Sep 2023 01:24:32 +0300
Message-Id: <20230903222432.2894093-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Read the downstream port info and set the subconnector type accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Dependencies: https://patchwork.freedesktop.org/series/123221/

---

 drivers/gpu/drm/msm/dp/dp_display.c | 9 ++++++++-
 drivers/gpu/drm/msm/dp/dp_panel.c   | 5 +++++
 drivers/gpu/drm/msm/dp/dp_panel.h   | 1 +
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 96bbf6fec2f1..8abeae658200 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -372,8 +372,12 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 	}
 
 	/* reset video pattern flag on disconnect */
-	if (!hpd)
+	if (!hpd) {
 		dp->panel->video_test = false;
+		drm_dp_set_subconnector_property(dp->dp_display.connector,
+						 connector_status_disconnected,
+						 dp->panel->dpcd, dp->panel->downstream_ports);
+	}
 
 	dp->dp_display.is_connected = hpd;
 
@@ -401,6 +405,9 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 
 	dp_link_process_request(dp->link);
 
+	drm_dp_set_subconnector_property(dp->dp_display.connector, connector_status_connected,
+					 dp->panel->dpcd, dp->panel->downstream_ports);
+
 	edid = dp->panel->edid;
 
 	dp->dp_display.psr_supported = dp->panel->psr_cap.version && psr_enabled;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 97ba41593820..1cb54f26f5aa 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -162,6 +162,11 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 		}
 	}
 
+	rc = drm_dp_read_downstream_info(panel->aux, dp_panel->dpcd,
+					 dp_panel->downstream_ports);
+	if (rc)
+		return rc;
+
 	kfree(dp_panel->edid);
 	dp_panel->edid = NULL;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 3cb1f8dcfd3b..a0dfc579c5f9 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -36,6 +36,7 @@ struct dp_panel_psr {
 struct dp_panel {
 	/* dpcd raw data */
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
+	u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS];
 
 	struct dp_link_info link_info;
 	struct drm_dp_desc desc;
-- 
2.39.2

