Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84BC67B1A80
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 13:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231849AbjI1LSs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 07:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232261AbjI1LSb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 07:18:31 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09F3E83CB
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:16:43 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-503f39d3236so20724407e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695899801; x=1696504601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMftiAUxeR8BPoZkZvXeNvb1WLgqdhL6DsPjfLjpExg=;
        b=zSWFCzVM4492+iV9eM7FJbsIoO/58pSMn15jq6BUwaln8uo2W2TzkBGY28SkUgaHbW
         zauZExgAZYL9as5IKOGC/qOM1MB0xOprZd8sELrnYsucQDKCQMj44P7q9NbknehTgeL4
         DxljqCdwKdoQWJfV6Rdghbmm9FXWBnmR0PIeuwgfZx3fwsHsHkh0KvrGvb+JBQ1LFZ00
         mSMv8ffd4Flw0S5VnPuG2ywDgaI8hJ3/M0NZirV2UHn3qJVzHXks4ggD/+Ik6GiD9Mc8
         +KRpMHzT2h1yYLAZiEYZP9k63FN6y2z0bHt5vz49kD505+9G1lja98JvAx+JOuAZTdFr
         IEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695899801; x=1696504601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMftiAUxeR8BPoZkZvXeNvb1WLgqdhL6DsPjfLjpExg=;
        b=Kg0Ferzw2YWePRJBRU4C4C5OaC+B539mYCjjBFmFfC00GY2P66PVXe2oEBnKlGycu4
         66W6aEysoUcmj4an5zCB0eQO9YcpHfekK5Gk1uKANHxviMeBqHazDFo/qkdH8mTszp2k
         s70nqKkcCQxeyt4bQLaytwjv+BQmSyaIR+UN5l9JZGSPtdUaGl4ladEBVjckufFw4xly
         cPiSLdcSkMg2RiB+I8klQ7UDK57QMhkLxuWpmjSFOQucnKBx7XDiipjzIUUYosYaEN/H
         aTjNAR8jksA/jWMy7xISoMyjKBeo7EPu+xYCmI7Nf0EtYjGp+ACjgrOzFy7E/7H5KcxT
         4GuQ==
X-Gm-Message-State: AOJu0YxtjGw8/Ufa8udfKmdWrKL/znhYOV/QuO6CV0sB8HjgU1Sj5YAQ
        LASQRzqUxGqcMdY2QnL3rLgQzQ==
X-Google-Smtp-Source: AGHT+IGJuLOW0z+nyXsjDWy/AhORRPbvfkWB2Dltrt556qDZ0CEwO2DNjEzeGytc0iYjtCSew21T2A==
X-Received: by 2002:a19:4304:0:b0:4ff:7046:984a with SMTP id q4-20020a194304000000b004ff7046984amr733375lfa.7.1695899801373;
        Thu, 28 Sep 2023 04:16:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j18-20020ac253b2000000b004fb738796casm3086623lfh.40.2023.09.28.04.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:16:40 -0700 (PDT)
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
Subject: [PATCH v3 12/15] drm/msm/hdmi: set infoframes on all pre_enable calls
Date:   Thu, 28 Sep 2023 14:16:26 +0300
Message-Id: <20230928111630.1217419-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
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

