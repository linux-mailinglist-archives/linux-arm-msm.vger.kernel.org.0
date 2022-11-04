Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40D586196D8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 14:03:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231555AbiKDNDh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 09:03:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231543AbiKDNDg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 09:03:36 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 461941F622
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 06:03:35 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id bp15so7280280lfb.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 06:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlP9nOL0nEzXJLWABMNdlQffQrykHT4joP6jF1+Vzog=;
        b=LyF6T0FcxBLy5ij5H/10TivOAG6Bjid20IZywbGQqroqhamayx0/OgYbGnSf28WIYt
         Et9CfQ/uAuIdSXUgrNJjRVs7MmRw6LJ94RDf7WkFKvFhFMrZ9DHKqkYaOkR/PEfjnKO8
         13MtZD9rV5Mr78b8GYgO6f0KTLveC4HsaTP1wPtkHuzufiXMjseAFR7g8cc9nz4y7av3
         N1sySDNS9mI8liTtlskvC0bjhL/bcrKTsmmhGuocKpDeSfjv5KLKQbzEQcmNZRoCA42r
         n1/8GHVwhvsRjT3H69GNCXEoroHwtokDzJHwG4eutksqoxkP+R14SP1/ZyOu0VlysshA
         8FSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jlP9nOL0nEzXJLWABMNdlQffQrykHT4joP6jF1+Vzog=;
        b=efS1niQ3DpQ/F2DKVaQX755iVCaU+n9rtSS9dcu797pPB7QU0KqNHv7/cQQXjm3WNr
         JXKAdcVi+cMrSu/Qau98jcza1+axcoi8/U5ohfOQjR6tLvviN0IsPhl95ZFC7oKXOtra
         91HkQ6gtg0SPVSIMe5z8Yahu69VnT5RaiE02WP5Dkc4L7A8EtncnYSP2DOgCfTjES17q
         mfi0w8ZBPQ21fsxen2H3B+F8SuFjydISOVJz0DcKbLGz2o7Ts/dW0Q6x9F1AElgZ+wjy
         l4sUkQG3Q6FO97HoE79R7sewyt7g2ikTcH/yO93a6zwrx4Ipx30uZZRqHjgZLebLaWaN
         NkMQ==
X-Gm-Message-State: ACrzQf0b4JXw56cQpbzRW0ndEOeVV4lRobwX98ZFyRYYFAYkqeGLssWj
        XIk3OL3h6TlMs5O9PN4mwKkyQQ==
X-Google-Smtp-Source: AMsMyM4kUsK6PeEQ0Vtt+fvOdwJgJUjDwnNa9yfhbNL0Hvmsa+8gNmsRGp3PawrGxQ25qyuEwFByZQ==
X-Received: by 2002:ac2:4884:0:b0:4b1:4eb1:f3b9 with SMTP id x4-20020ac24884000000b004b14eb1f3b9mr5355525lfc.83.1667567013501;
        Fri, 04 Nov 2022 06:03:33 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id s6-20020a2eb626000000b0026fe0a052c5sm419975ljn.129.2022.11.04.06.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 06:03:33 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v3 5/8] drm/msm/dsi: add support for DSI 2.6.0
Date:   Fri,  4 Nov 2022 16:03:21 +0300
Message-Id: <20221104130324.1024242-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
References: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
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

Add support for DSI 2.6.0 (block used on sm8450).

Tested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
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

