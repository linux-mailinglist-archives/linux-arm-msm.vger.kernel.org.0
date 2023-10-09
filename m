Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A1567BE86E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 19:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377935AbjJIRk4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 13:40:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377888AbjJIRkz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 13:40:55 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC48ACC
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 10:40:52 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2c008042211so57579571fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 10:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696873251; x=1697478051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bclGRwuWLHVjQHCsBos6jKdQfEdG5WbxRNo0rlhZFc=;
        b=xZgqm4MlK+x4E1VKaY8XkGJY6rToQpLeW54whj6k4/qzleDR9e+HYcPYt76LAJV629
         VbbNrwP7DnCdGSSIs0p8WPMZxUvBcw+vAC3N0MTr9uwPm+DQ6En16N+tRTjtAOVAZlkQ
         RxKeOwDox/VKHD4SfeN/DyaZkcdV+A0qRTP/aTgkdQDJ9gNqEdupD02cmVBKnea1KmAA
         opPLkUJylDCG/V5S5/+YMQXkmbFOVfaNgUDYoii/X94RGw7klOVpkykQBpcVNiNlv8tZ
         4nbS0wkaeNE3R1gNpSHbwI+01Qt9zL2rzA02GOQK3/bbpnrOMmvwpRpZCnOLp7qTNdsj
         jadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696873251; x=1697478051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0bclGRwuWLHVjQHCsBos6jKdQfEdG5WbxRNo0rlhZFc=;
        b=JSqQFbCU2Vy7hk+7V/YKFvRN8UKirc3cc7GuIer7K0PitaXeNYYw9DvusU4Rcijj+Y
         MBDdDQhhNUIpzmkb8a1WCuU58Z1y2GAk07eiEtrqABMFalMJabrTkVhgN/6RBwjT8p1l
         SCjYi8rxNaDNUb9GxRPbMy8hNO1o87LXCQCqF6h71/ey9j6An5RSKgUkpLaAuNcTazMc
         aG1w8EKXXCvOMfly8JLuQEmiq5KElBlRwTfo+Me9Ae0W5Hc4KUqdNmDKx+YI2rFYgIBS
         ajBkQ8QZin7zrAIGtLyqV3ALej4y4alJUBT5C9v2RlxLhIs+so9M0iy0gWZW7HjxbF7P
         zgxw==
X-Gm-Message-State: AOJu0YxM0IBFcROvrsY0iKNPJxekXCrY9pMa1Flt3vDrTPC6AbHP4tcL
        3jo40sh6cmy+AMxOVuVY39X0oQ==
X-Google-Smtp-Source: AGHT+IGY96Dx/DKFkz0wGbbKAQL8l46PHp6xMHBL/SRiJTJrxohlqg7G+rNmpZIOvsxiSXs3LsePdg==
X-Received: by 2002:a2e:3612:0:b0:2c0:293c:ad12 with SMTP id d18-20020a2e3612000000b002c0293cad12mr13040999lja.17.1696873251002;
        Mon, 09 Oct 2023 10:40:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z5-20020a2e3505000000b002bcbae4c21fsm2128988ljz.50.2023.10.09.10.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 10:40:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Simon Ser <contact@emersion.fr>, Janne Grunau <j@jannau.net>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org
Subject: [PATCH v7 2/3 RESEND] drm/bridge_connector: stop filtering events in drm_bridge_connector_hpd_cb()
Date:   Mon,  9 Oct 2023 20:40:47 +0300
Message-Id: <20231009174048.2695981-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009174048.2695981-1-dmitry.baryshkov@linaro.org>
References: <20231009174048.2695981-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In some cases the bridge drivers would like to receive hotplug events
even in the case new status is equal to the old status. In the DP case
this is used to deliver "attention" messages to the DP host. Stop
filtering the events in the drm_bridge_connector_hpd_cb() and let
drivers decide whether they would like to receive the event or not.

Reviewed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 31baf1f5ff81..70582491d955 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -113,16 +113,11 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
 	struct drm_bridge_connector *drm_bridge_connector = cb_data;
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
-	enum drm_connector_status old_status;
 
 	mutex_lock(&dev->mode_config.mutex);
-	old_status = connector->status;
 	connector->status = status;
 	mutex_unlock(&dev->mode_config.mutex);
 
-	if (old_status == status)
-		return;
-
 	drm_bridge_connector_hpd_notify(connector, status);
 
 	drm_kms_helper_connector_hotplug_event(connector);
-- 
2.39.2

