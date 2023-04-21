Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9E46EAD8B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Apr 2023 16:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232815AbjDUO5L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Apr 2023 10:57:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233036AbjDUO5K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Apr 2023 10:57:10 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 757591259B
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 07:57:04 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-504efe702d5so2560700a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 07:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682089023; x=1684681023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uctUzwBZNxJlKpvlCCGIAPlY6l+7Y7RDinQUecvvB3o=;
        b=cpqNYtVyifWBpd7Olh6M27aSvswD+dUQz/fYK6h1wu/OC2xlMDRH8XDAnG3iJQBI0D
         26urFToMIi56QHNGa4WMAGDRaE1qKjdHGF4JySErBO1QIhveRbvjx7eTzYcJ3f2f+w1r
         twY0DSHEQbxpDerw7+XhnFryKRoAgu6hS+nYlJpWI64/fn98UQSfksvNd4ePVjDFKSbo
         9TL8k3L+yf/xY8scabRgTyLQYjCQTUlKie3aFhnW8noQhUyLEfbDJG7VGDJ/FwuxoxKH
         zyRn3zoEsgbd+ssdWhz5y2y9y2F4/vqzucbMHdUx/0+HxLAaHfLh3k+gFN2tXpDwq8tD
         qe2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682089023; x=1684681023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uctUzwBZNxJlKpvlCCGIAPlY6l+7Y7RDinQUecvvB3o=;
        b=DO2Jgi0IoB7nWrm144FLEHc0bcx57/Cw4bcjAjs5AN8gydcqRX6j/Rsl5mT6iS8eFP
         ETnOlNxqVcEa7+7V6NOSdO6DkQh3nhVhPi9rO1tWy6D6QLNE8Lk5YopovvrtA/esZs6t
         jVrFlConcPJEqZzDMaFar1jmyuqyyEsra3uFjaXauVrP9Tn0fCAhM0Mmm0EVWsJ1tK7T
         S/Aaa4ALEMKqOM6Sth9MoPJ1nut3w90ICjml66teXo1YTEI0RKCbcY1jRP3/kXUBlmPR
         64ZAwDcrIJZ9rB0qoTNTU6c70h/wygmCyDjXm/2cqAQBDpnJ4vCz/+N7h1FWzMJRlWoM
         NkXw==
X-Gm-Message-State: AAQBX9dqPDHkz1pYm+bu67WfdPAUAq8GbtkoK8tNE49YwtZaITI/hEvZ
        koefUzBYmS4o4ZSxXheLjO78Gw==
X-Google-Smtp-Source: AKy350b2REY5H1kl7TPN9WKhRxrc9GCLZbpAU2wbU/1Wwzj0x/BQ66ZPvwtnLFJvkl9omAcUfzsOeA==
X-Received: by 2002:a17:906:16d7:b0:94a:8ada:d109 with SMTP id t23-20020a17090616d700b0094a8adad109mr2517876ejd.77.1682089022753;
        Fri, 21 Apr 2023 07:57:02 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 15-20020a170906058f00b0095708428cdcsm1227625ejn.6.2023.04.21.07.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 07:57:02 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        dmitry.baryshkov@linaro.org, airlied@gmail.com, daniel@ffwll.ch,
        lyude@redhat.com
Cc:     javierm@redhat.com, tzimmermann@suse.de, quic_khsieh@quicinc.com,
        quic_bjorande@quicinc.com, johan+linaro@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] drm/msm/dp: unregister audio driver during unbind
Date:   Fri, 21 Apr 2023 15:56:57 +0100
Message-Id: <20230421145657.12186-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

while binding the code always registers a audio driver, however there
is no corresponding unregistration done in unbind. This leads to multiple
redundant audio platform devices if dp_display_bind and dp_display_unbind
happens multiple times during startup. On X13s platform this resulted in
6 to 9 audio codec device instead of just 3 codec devices for 3 dp ports.

Fix this by unregistering codecs on unbind.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   | 12 ++++++++++++
 drivers/gpu/drm/msm/dp/dp_audio.h   |  2 ++
 drivers/gpu/drm/msm/dp/dp_display.c |  1 +
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 6666783e1468..1245c7aa49df 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -593,6 +593,18 @@ static struct hdmi_codec_pdata codec_data = {
 	.i2s = 1,
 };
 
+void dp_unregister_audio_driver(struct device *dev, struct dp_audio *dp_audio)
+{
+	struct dp_audio_private *audio_priv;
+
+	audio_priv = container_of(dp_audio, struct dp_audio_private, dp_audio);
+
+	if (audio_priv->audio_pdev) {
+		platform_device_unregister(audio_priv->audio_pdev);
+		audio_priv->audio_pdev = NULL;
+	}
+}
+
 int dp_register_audio_driver(struct device *dev,
 		struct dp_audio *dp_audio)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_audio.h b/drivers/gpu/drm/msm/dp/dp_audio.h
index 84e5f4a5d26b..4ab78880af82 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.h
+++ b/drivers/gpu/drm/msm/dp/dp_audio.h
@@ -53,6 +53,8 @@ struct dp_audio *dp_audio_get(struct platform_device *pdev,
 int dp_register_audio_driver(struct device *dev,
 		struct dp_audio *dp_audio);
 
+void dp_unregister_audio_driver(struct device *dev, struct dp_audio *dp_audio);
+
 /**
  * dp_audio_put()
  *
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3e13acdfa7e5..99a38dbe51c0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -326,6 +326,7 @@ static void dp_display_unbind(struct device *dev, struct device *master,
 	kthread_stop(dp->ev_tsk);
 
 	dp_power_client_deinit(dp->power);
+	dp_unregister_audio_driver(dev, dp->audio);
 	dp_aux_unregister(dp->aux);
 	dp->drm_dev = NULL;
 	dp->aux->drm_dev = NULL;
-- 
2.21.0

