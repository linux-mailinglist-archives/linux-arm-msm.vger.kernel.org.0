Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 012385E610B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 13:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbiIVLa2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 07:30:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbiIVLaY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 07:30:24 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6DF67CB67
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 04:30:22 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id h3so10630607lja.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 04:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=47vvp11+W20l4C4N5v2oL7Eb2wQVc5MT8hndh5rEnUo=;
        b=fwM+BJ+9XUsoh6Y9ytE96dizU38naJkzLE2buKeHJiv9K2z3DqcZNJgOt+u7Z0DJQG
         ADhgdhu0pcVuEhaVDGC1sasxzwJ4v6BlFa7W0NidFnVtNF+b0jbgSimUyRsBXs8ajG59
         mxg57rx+1XV0sveG4u7y33F3yrtIM382HDFCIJlDDHZvMuX6RY+yB9Vw7IVg+1+3eBf9
         MnPUeGNQVIUthhQPwJfUOG8Lijz+XUv6ieqZT/s5GdtA0IfgBTWrUKoJSAwUbG1wcRjM
         bgrLudtejV9m0lWJ60jGmXfm99QK9YrOJGWdrs9VL+WucAC4l+it35+YmCONtWknehKs
         +/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=47vvp11+W20l4C4N5v2oL7Eb2wQVc5MT8hndh5rEnUo=;
        b=hhh14O80Vx2OPGAdGXntThAcKglaR/I4uufQqtmqNK5lfXRmAXzca49nP/116VvIbZ
         mqxldRbjPMgHqiHwhK1m51Hq6xHXeBGIcuywg+UnuLZZ2MATC2B5vy/U9/Fn/AG3rzmI
         ZajI7/KHJMUmgEDmllCQrUKPzuiO+MD8WTfJS8VirQVaUut4xBtXIHkwhy6BPdCfPeLH
         /yC54vPLPWjciOsght5Q+Ts1QpW3zdnXsjjJbU+RCJlklf0cJ+66peleorPGwxO4ZetO
         6seTDWhmoSgjEKzOLB+LEku5MZhRUGAF6VR1C1eUWaKChXbMEqCotat0xoHQ1H6jH53G
         +lkA==
X-Gm-Message-State: ACrzQf1Fh49M2Z68NwthE43jSDdKdx1bDUgGYZxj5VW8seWN9yed/NI2
        NWQEydgyVQTiJKpLZfwregCj0w==
X-Google-Smtp-Source: AMsMyM47XG+fS8A7DyjTZd0TauZkFtNVv0/q18OyWaGukjimZ/J4f7PRXHMUu8Iv2LnBnMA1lIX8oQ==
X-Received: by 2002:a05:651c:160a:b0:25a:62a4:9085 with SMTP id f10-20020a05651c160a00b0025a62a49085mr947493ljq.214.1663846220415;
        Thu, 22 Sep 2022 04:30:20 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c4-20020ac25304000000b004996fbfd75esm898527lfh.71.2022.09.22.04.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 04:30:19 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 2/5] drm/msm/dsi: add support for DSI 2.6.0
Date:   Thu, 22 Sep 2022 14:30:13 +0300
Message-Id: <20220922113016.355188-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220922113016.355188-1-dmitry.baryshkov@linaro.org>
References: <20220922113016.355188-1-dmitry.baryshkov@linaro.org>
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

Add support for DSI 2.6.0 (block used on sm8450).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 ++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 7e97c239ed48..59a4cc95a251 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -300,6 +300,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&sc7180_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_5_0,
 		&sc7280_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_6_0,
+		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 };
 
 const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 8f04e685a74e..95957fab499d 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -25,6 +25,7 @@
 #define MSM_DSI_6G_VER_MINOR_V2_4_0	0x20040000
 #define MSM_DSI_6G_VER_MINOR_V2_4_1	0x20040001
 #define MSM_DSI_6G_VER_MINOR_V2_5_0	0x20050000
+#define MSM_DSI_6G_VER_MINOR_V2_6_0	0x20060000
 
 #define MSM_DSI_V2_VER_MINOR_8064	0x0
 
-- 
2.35.1

