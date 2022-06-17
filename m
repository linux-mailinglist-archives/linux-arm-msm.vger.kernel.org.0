Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5115550085
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jun 2022 01:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380549AbiFQXSw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 19:18:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358121AbiFQXSv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 19:18:51 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F238963BD6
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 16:18:47 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id hv24-20020a17090ae41800b001e33eebdb5dso8267588pjb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 16:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L5VJMQFQuBE4SqSUMrFo93pnwhbO/r/KnkFGijwP654=;
        b=D9q5XhwKGuBXqDdFf4ZKxhqj4jBTqavmRDHyVTtRdFWOhsLsspGOmpTOlKlqOzDs6D
         IQOQ1RLxN8PQOhd4BlDfXvdzqEJUuYesp7Edis7uc/i8I7CYL9Yg9e/xFz57lmGgHl2V
         Z2yxAlWYAey7MW2Hy3EnIjBHPQhrMUjJkAf2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L5VJMQFQuBE4SqSUMrFo93pnwhbO/r/KnkFGijwP654=;
        b=xB41ZaaSFqHJ0t6ZCIu8BWwjl8JPxQZE9KCnqCPsVpHF2t4nA/KHT3wof80DoYSrfg
         SH4A/IaMj58PpBWNYGfZNTDWabsOAImU7X4eRfsg8uH05pqm9JVPVB/ZOG6FABPWPl9+
         8KTQ82AYVYJsP4fREyxr3VUpD31x+5m0yK25hkdT0AQhoZYHjzo/nLArMDqQTSgucq2f
         wRGUIG23WVrb3U8n9SzYMxF5HdD/vDTipwU2C80QYr1m3VG8vZn62qkYuzbkOVDvk+NQ
         lJkxtzlPDJjmnvndjwOQhzxX0is9Dph2QE/QElstg0oNChUKhQHzXd+1pS65vLOPE6wY
         ki3A==
X-Gm-Message-State: AJIora/IYDUjz1CKxkCd9qsLTPxL8Pq9mKCHEkwxCbAO0HUQUv4OnjB8
        +bBdVecA1la6jiL3DHdbmR/LyQ==
X-Google-Smtp-Source: AGRyM1tstSkK9CnQf36BBjmq5jsms4lDlAdI0SFFDUaoecgEE/QEyvASJqJ6KqLiZQESKnT20Zz5zw==
X-Received: by 2002:a17:902:d2c9:b0:163:bdee:b2df with SMTP id n9-20020a170902d2c900b00163bdeeb2dfmr12210994plc.98.1655507927420;
        Fri, 17 Jun 2022 16:18:47 -0700 (PDT)
Received: from joebar-glaptop.roam.corp.google.com (c-71-202-34-56.hsd1.ca.comcast.net. [71.202.34.56])
        by smtp.gmail.com with ESMTPSA id l8-20020a170903244800b001689e31ff9dsm2276749pls.9.2022.06.17.16.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 16:18:46 -0700 (PDT)
From:   "Joseph S. Barrera III" <joebar@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        "Joseph S. Barrera III" <joebar@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v6 1/6] Simple version of Stephen's patch.
Date:   Fri, 17 Jun 2022 16:16:40 -0700
Message-Id: <20220617161622.v6.1.I4deaec603e855815b517a68f8dbc77b150886c42@changeid>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Joseph S. Barrera III <joebar@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
index 9b3e3d13c165..d1e2df5164ea 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
@@ -5,7 +5,7 @@
  * Copyright 2021 Google LLC.
  */
 
-#include "sc7180-trogdor.dtsi"
+/* This file must be included after sc7180-trogdor.dtsi */
 
 / {
 	/* BOARD-SPECIFIC TOP LEVEL NODES */
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
index fe2369c29aad..88f6a7d4d020 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
@@ -5,7 +5,7 @@
  * Copyright 2020 Google LLC.
  */
 
-#include "sc7180-trogdor.dtsi"
+/* This file must be included after sc7180-trogdor.dtsi */
 
 &ap_sar_sensor {
 	semtech,cs0-ground;
-- 
2.31.0

