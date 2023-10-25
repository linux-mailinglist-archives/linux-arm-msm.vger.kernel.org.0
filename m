Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA1BF7D66BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 11:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231794AbjJYJ1S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 05:27:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233435AbjJYJ1R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 05:27:17 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ED81DE
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 02:27:15 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-507d1cc0538so7848171e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 02:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698226033; x=1698830833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtUxpS9LHBTz7P4AH4M/bkhlO9UpvXLDxTXKsW01TMA=;
        b=LsVeriTE1ON+evhd06QXYdRyxhdXLQirh7bMVMtM/X9KPTO5Wh2M522myMmVoFK9EU
         wxcYwz0FfbJ+HxFZuILxZBvZ8+G71NaERmp2H/MqdUTBxE3y0HFcQCUmYhM8XhlO3IaQ
         U7uQWlqwcpvYOYw4aHoT5zB40nXje4QMgCbi09221rtUYeGYVHD7B5mOzcY+QT+6LVS8
         6TuhTpuGIpHDSPp3bvhIom+jhHSxnpYCjcAzjVSlwz3jM/LUgRWXLlst7P3mHiRi1i1b
         HPILDilNeG/O7Mjch/cjtleMK998a4IpKU3x1A1dk0lc5raIzL5I6D81VKtMkDGE++at
         c6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698226033; x=1698830833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QtUxpS9LHBTz7P4AH4M/bkhlO9UpvXLDxTXKsW01TMA=;
        b=sqdPtWGNAHekFIs783b8Z4jZUUVvU6TRbD1vTvN3T+eN/0jtm38Ht3kA6xzAA0IE9p
         JBVWaEBHl4FyG63LwcrUXHYstwMy3JZ4RclUFwPwSS+Xln4BRT2Ajsm2p9L0kz7UsccI
         20/qlNmJdeFRXfwoZ259WQcTktZXnXX+8X42sr3UuHRkKbD1ATbA2bwwdKPPRki1gGWV
         Wbs2yLNy7mT5w+nI9tjudayJAQEVhOO6W4KMZsxHqCQmyMPkea2hL1+LQDfARBS0bN5/
         jYBpFeG81YiiEu3GlLcPC/zn6bMxuYWNFGN/D2K63qwl3ILjk+FpmUWytAvH5eo4h2oo
         nt1Q==
X-Gm-Message-State: AOJu0YwRwELn49s4qKo2mrh2mgkl9ogOyjATr4X8N7xMSruguFF8VQq3
        rEQS8oh14SnuTw5c1BEcheaeMg==
X-Google-Smtp-Source: AGHT+IF4JyODsy/R7n9MpWLVJ6X92eTxeIIQaPwvTPjpfhaAGvY2yEMuYrSSE8O5MrNacMcr1we5Ww==
X-Received: by 2002:a05:6512:3b87:b0:507:974d:80f9 with SMTP id g7-20020a0565123b8700b00507974d80f9mr12978498lfv.34.1698226033609;
        Wed, 25 Oct 2023 02:27:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id eq25-20020a056512489900b005079fff83d2sm2470377lfb.3.2023.10.25.02.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 02:27:12 -0700 (PDT)
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
Subject: [PATCH v2 1/2] drm/msm/dp: don't touch DP subconnector property in eDP case
Date:   Wed, 25 Oct 2023 12:23:09 +0300
Message-ID: <20231025092711.851168-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025092711.851168-1-dmitry.baryshkov@linaro.org>
References: <20231025092711.851168-1-dmitry.baryshkov@linaro.org>
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

From: Abel Vesa <abel.vesa@linaro.org>

In case of the eDP connection there is no subconnetor and as such no
subconnector property. Put drm_dp_set_subconnector_property() calls
under the !is_edp condition.

Fixes: bfcc3d8f94f4 ("drm/msm/dp: support setting the DP subconnector type")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e329e03e068d..1b88fb52726f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -365,9 +365,11 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 	/* reset video pattern flag on disconnect */
 	if (!hpd) {
 		dp->panel->video_test = false;
-		drm_dp_set_subconnector_property(dp->dp_display.connector,
-						 connector_status_disconnected,
-						 dp->panel->dpcd, dp->panel->downstream_ports);
+		if (!dp->dp_display.is_edp)
+			drm_dp_set_subconnector_property(dp->dp_display.connector,
+							 connector_status_disconnected,
+							 dp->panel->dpcd,
+							 dp->panel->downstream_ports);
 	}
 
 	dp->dp_display.is_connected = hpd;
@@ -396,8 +398,11 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 
 	dp_link_process_request(dp->link);
 
-	drm_dp_set_subconnector_property(dp->dp_display.connector, connector_status_connected,
-					 dp->panel->dpcd, dp->panel->downstream_ports);
+	if (!dp->dp_display.is_edp)
+		drm_dp_set_subconnector_property(dp->dp_display.connector,
+						 connector_status_connected,
+						 dp->panel->dpcd,
+						 dp->panel->downstream_ports);
 
 	edid = dp->panel->edid;
 
-- 
2.42.0

