Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF0F6D6216
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Apr 2023 15:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234972AbjDDNJX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 09:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234950AbjDDNJV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 09:09:21 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC0902691
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 06:09:20 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id by14so14587000ljb.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 06:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680613760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+EzYqiIalSQD23Js2NYf/t5OTCj8dNqn/Jckbi0SmI=;
        b=r3Ng/IWuFKwnbrD6P9osaPJFmNRsRrR7crNFdWLyiVlb4ZzC3pfzMup2axPNqudSfF
         kk1Pna3ENXd2DE6C25I7nUwvaLDwKsaDPVt12NaAbKXycAed6PFoqauvGsgxOOf/ZMoa
         GDvFx9dleugwyWX7pv6fi0hgSe3VSi1z7n6Eevy17j+JSEAD/rvHB2Hx7JCjH+KB3xK6
         cJK+ZdvXHIO5NVqO2j91vdW0zI5lv/LeFEHbGYACLpcQTs+Bc3nJs8RkHZR9T6VuWIGC
         NFC8qAzK/rSyBSZwn5N3C+2eITJRwTFcL7a9IzYri0u1+oCxArOeXqLnuL2EPzQe0T3F
         Xr7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680613760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+EzYqiIalSQD23Js2NYf/t5OTCj8dNqn/Jckbi0SmI=;
        b=LsB5pkZ9IwOKYTFSM26uB0FR7R/ACoGvLfEVSfQqhebq+LvlvtRsuhFXO6obQoJL7N
         n4k/PZGsjR+8qAMGcI1a+izDWX05Ri0flqsQ44iN7Wd98FBKaCfrJbKbZdOSnMxZZOY7
         4mhWuDkL0RP/MDdz/L2oFDco9u6stRDoBG+znC7+RZN1seslZDh/MqEJghuOyNWz/H7h
         vh1IujUKlVE1cNk8z2qVh09P8S3dCA4CKw/qSpaXw0n16i9ms9R8uBbpLqWCUW5FJ/jQ
         d1A8bTH0TDefz+Dq/rNZzKAPaf7ZhibEAFmgpsyOZXrSt5f1ijbaOXgH0Hc2ycOZvUVW
         5uWQ==
X-Gm-Message-State: AAQBX9erBRBTKkba1lKMLKyYCac8JGDo8CliS+sOvIFEbtRbYoxrhz/G
        tYTfXSxRlpfctJ4YtHa1/vyViA==
X-Google-Smtp-Source: AKy350aypGDYtegI39U/t7bdAJVpy4pZFqNz1N57iUaOkN5fnKoSe2vZ4TNWwNPzg4IlbHwNMSFPQg==
X-Received: by 2002:a2e:8455:0:b0:298:a7c3:c26a with SMTP id u21-20020a2e8455000000b00298a7c3c26amr770476ljh.25.1680613760409;
        Tue, 04 Apr 2023 06:09:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
        by smtp.gmail.com with ESMTPSA id c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 06:09:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 26/42] drm/msm/dpu: expand sc7180 catalog
Date:   Tue,  4 Apr 2023 16:06:06 +0300
Message-Id: <20230404130622.509628-27-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Duplicate sm8250 catalog entries to sc7180 to remove dependencies
between DPU instances.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 2326be2900ea..433f7b259f7b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -89,6 +89,11 @@ static const struct dpu_intf_cfg sc7180_intf[] = {
 	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
 };
 
+static const struct dpu_wb_cfg sc7180_wb[] = {
+	WB_BLK("wb_2", WB_2, 0x65000, WB_SM8250_MASK, DPU_CLK_CTRL_WB2, 6,
+			VBIF_RT, MDP_SSPP_TOP0_INTR, 4096, 4),
+};
+
 static const struct dpu_perf_cfg sc7180_perf_data = {
 	.max_bw_low = 6800000,
 	.max_bw_high = 6800000,
@@ -134,8 +139,8 @@ static const struct dpu_mdss_cfg sc7180_dpu_cfg = {
 	.pingpong = sc7180_pp,
 	.intf_count = ARRAY_SIZE(sc7180_intf),
 	.intf = sc7180_intf,
-	.wb_count = ARRAY_SIZE(sm8250_wb),
-	.wb = sm8250_wb,
+	.wb_count = ARRAY_SIZE(sc7180_wb),
+	.wb = sc7180_wb,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.reg_dma_count = 1,
-- 
2.39.2

