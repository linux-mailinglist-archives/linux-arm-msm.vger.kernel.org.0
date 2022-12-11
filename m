Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6933964937D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Dec 2022 11:05:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbiLKKFL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Dec 2022 05:05:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbiLKKFK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Dec 2022 05:05:10 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A400B4A1;
        Sun, 11 Dec 2022 02:05:08 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bp15so13814161lfb.13;
        Sun, 11 Dec 2022 02:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mORmrcJPmx0+jo1NRvWarQavuglobYs3FqP1jJtwnzU=;
        b=C3KWOQlanpiNn/ufzGDiU1EP53D5TEtv1NX/xcHHE1tzEU6XfdCZWrT8aB0lmrzLAZ
         NMkdVGDXP+DVb8CdF1yUbvwERo+66TGYIFzGLB5vA+RxPINAMBNc5g9PV92gL9/lgdD6
         5UZLD3z42KbLN3YgUJuI3svdTIgqDwcX/CKJmxef31YuOvuqQQti71WLk/r/uAttbYqI
         S0X0QZwBk20QGopoy+/ys8CmvBa/5cbLlzRD0E09qZ0qJln+z8nBXfWsyrfonWH6ZUop
         CTVGPTsVJyJyncVW9EqvsaFLg4hhE814/nRtTljgbp4l1HzYxxadv1TofvJoVPfbMJlT
         Ca8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mORmrcJPmx0+jo1NRvWarQavuglobYs3FqP1jJtwnzU=;
        b=lYu+3Yhio+S6owY05e61mrYqSSE9B3uGc1cMbUrW+AcymGTE3bIbAzGZN1Xpzd6il5
         /xbFb2wn+koPX6fIfmXP0jQzpB4Z9c32RKxDIKnPXJFVSJjwHe4wryp3JpKXkbZ6NkvU
         IN90agK5XqnSvhc3ZBwvnwXz4mLRDUDlv/4de57Q8z3OZdlDrnBLx9p2sL7MqJhrdjMs
         mpo7csaVNM1BEK+5hVGvzb7l5JkiPNxJX1Y0J7CsoqOU3pOv0bU1bfTf3TWRClCJmfvK
         GOHVrx8+U2UsJVtXenN+WsMCz+YVJTmuo58DccL25m61MuE47xAtp5zle5o0iZKZnogv
         31Og==
X-Gm-Message-State: ANoB5pll+5duDWYcEP5U3dqXC9gvF9/yu3Bm4HQEI3o6BdJuBWTEw7ag
        q1b+7EYAiPS4NzOfzZDXV5aO/YSnYcY=
X-Google-Smtp-Source: AA0mqf4H6k8Hf1hrIWYMblOqpx7G58uqN/u8CLA/ICe6F/BQhvhyRqej2u0xBIxvE+tt/YOs4EuuCg==
X-Received: by 2002:a05:6512:a8c:b0:4b5:a843:58d0 with SMTP id m12-20020a0565120a8c00b004b5a84358d0mr4059252lfu.41.1670753106094;
        Sun, 11 Dec 2022 02:05:06 -0800 (PST)
Received: from localhost.localdomain ([176.106.35.163])
        by smtp.gmail.com with ESMTPSA id q2-20020a056512210200b004b4bae1a05asm1109924lfr.293.2022.12.11.02.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 02:05:05 -0800 (PST)
From:   Dominik Kobinski <dominikkobinski314@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     pevik@seznam.cz, agross@kernel.org, alexeymin@postmarketos.org,
        quic_bjorande@quicinc.com, bribbers@disroot.org,
        devicetree@vger.kernel.org, konrad.dybcio@linaro.org,
        petr.vorel@gmail.com,
        Dominik Kobinski <dominikkobinski314@gmail.com>
Subject: [PATCH v2 1/1] arm64: dts: msm8992-bullhead: add memory hole region
Date:   Sun, 11 Dec 2022 11:05:01 +0100
Message-Id: <20221211100501.82323-1-dominikkobinski314@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add region for memory hole present on bullhead in order to
fix a reboot issue on recent kernels

Reported-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Dominik Kobinski <dominikkobinski314@gmail.com>
---
Changes since v1: 
 * msm8992-bullhead instead of bullhead in the commit message
 * memory node named "reserved" instead of just "memory"
Both suggested by Konrad Dybcio 

 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
index 71e373b11de9..37bcbbc67be5 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
@@ -2,6 +2,7 @@
 /* Copyright (c) 2015, LGE Inc. All rights reserved.
  * Copyright (c) 2016, The Linux Foundation. All rights reserved.
  * Copyright (c) 2021, Petr Vorel <petr.vorel@gmail.com>
+ * Copyright (c) 2022, Dominik Kobinski <dominikkobinski314@gmail.com>
  */
 
 /dts-v1/;
@@ -50,6 +51,11 @@ cont_splash_mem: memory@3400000 {
 			reg = <0 0x03400000 0 0x1200000>;
 			no-map;
 		};
+
+		removed_region: reserved@5000000 {
+			reg = <0 0x05000000 0 0x2200000>;
+			no-map;
+		};
 	};
 };
 
-- 
2.30.2

