Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2CB7675F3B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 22:01:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbjATVBR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 16:01:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbjATVBQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 16:01:16 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E73A8BA9F
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 13:01:14 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id mp20so16955849ejc.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 13:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9zrT9/RXPPXhnEVoW0aJsCVkHusFjlZ161d+oX04STE=;
        b=VhpZPNA/QWJFVRprlhHEdvq+/+4H7v3FVGVD04GyVD/EUEJFdD8RyMe84kgUEPUhWd
         CSPM+LH1fCURhYgTQa64yUSi3WnWL6zjKgNrnJwZnLqsAmscVxGSMUxPpNSJBAWPLAR6
         lUsuDtnasVrrYyhkGq9VB/ZHvxzTw2o3nc/q6OBvDQRT+WN28CE+7zlbdJTO/DrtdM9P
         kAx4wx9IGN1sWaBT2h3CHNexWt7VBNhIZ3a/7+uxHYWSNjz8Z+AJSA1c4l4/oVMG9q+R
         ZHPNZRWukpuWZCcns72TNlvqN2y/UGD3CjG94LU1GCQloe+M1+8iPwj7GTWVCD3mPjBg
         2frA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9zrT9/RXPPXhnEVoW0aJsCVkHusFjlZ161d+oX04STE=;
        b=kN2EWg01T+FlEP0WOW1sd3SX+knesJuIQj8zj28SL75dArUGs5FZApXLSJQWBTrnab
         cMtMEaAAkIsoKrngYMXEiVtGgOcXCno/QwsIwTiDrIbWMTQVgbNzbk1DGG5xU2lc4n6C
         QL8qDBkMbtuJ09tRJsqZR1vUYtwXOH8s/RFSxOBTCxQYlPIT860FbV0YU3YqviywizAx
         qX4c9RsZUB3pAy7B80kG6lprlHhOtDrTw5A3jSXnXFRdJvZRWywmVHkCIySutzZsaxBf
         hDaBVJrMNWSlTc8RAW7QXbxSBH/beiNWMbAJVJdMIvU668GWVYW7OKssUZt1liQ4f9OR
         Z7Cg==
X-Gm-Message-State: AFqh2kqDldfkv6A60jWADUKHzyxLxDANPDtzTnA4W2le3MaEcjJsGCsc
        zHxKArsu671ydaVEQ7zsF1DLmhe3eOlCqf13
X-Google-Smtp-Source: AMrXdXuKJBPk9bfYe2DX44R2Ihfk454JoHlIi3euiHm+P/rLKqXOFKfrzF2JNOubZZ/RoJp5TRlvPg==
X-Received: by 2002:a17:906:3741:b0:861:eb6e:8019 with SMTP id e1-20020a170906374100b00861eb6e8019mr14749113ejc.69.1674248472796;
        Fri, 20 Jan 2023 13:01:12 -0800 (PST)
Received: from localhost.localdomain (abyk37.neoplus.adsl.tpnet.pl. [83.9.30.37])
        by smtp.gmail.com with ESMTPSA id g22-20020a170906595600b0087221268e49sm6581229ejr.186.2023.01.20.13.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 13:01:12 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] drm/msm/dsi: Allow 2 CTRLs on v2.5.0
Date:   Fri, 20 Jan 2023 22:00:53 +0100
Message-Id: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
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

v2.5.0 support was originally added for SC7280, but this hw is also
present on SM8350, which has one more DSI host. Bump up the dsi count
and fill in the register of the secondary host to allow it to probe.

This should not have any adverse effects on SC7280, as the secondary
CTRL will only be touched if it's defined, anyway.

Fixes: 65c391b31994 ("drm/msm/dsi: Add DSI support for SC7280")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 33884ebd2f86..6d21f0b33411 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -223,8 +223,8 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
 	.num_regulators = ARRAY_SIZE(sc7280_dsi_regulators),
 	.bus_clk_names = dsi_sc7280_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_sc7280_bus_clk_names),
-	.io_start = { 0xae94000 },
-	.num_dsi = 1,
+	.io_start = { 0xae94000, 0xae96000 },
+	.num_dsi = 2,
 };
 
 static const char * const dsi_qcm2290_bus_clk_names[] = {
-- 
2.39.1

