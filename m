Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 041F56F3045
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 12:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232196AbjEAKjU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 06:39:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231779AbjEAKjT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 06:39:19 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BF25D7
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 03:39:18 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f1763ee8f8so13545055e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 03:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682937557; x=1685529557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qoKfxkFCc17p3ym+nE35o+to4M3ZNlziHRTvLpVgt8s=;
        b=wLi8Heaurv0eP1LGRSDRoaOdrV41HiIg50YcEOx2xUbsaFXci5LK9HRc6/YP/rmPdI
         TIiP/uuvM9LAT3gOLZBLga6S7Wxy3QXl6Xmgdi6FQNHN9PXbkWSUN8EkAf14ek1LAJRx
         o/oB8ANMqcAkEwlWycs4EOvwTZoslPB5w64NiAimEH6u51rZB/bvrOF+zP8ziut7Js29
         ehctXc9dm2sCeiJqvQiz7GG345rTGv+5ZdvFt0FvShBH5RV7nisQo7GE0jQa3W6G82xA
         zRrHopC7BrwZgZnljCU2PMkw9FhtGS3HaLujvUfEiL/4vizumnhP0pyUvMCaxCeeMMjq
         GluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682937557; x=1685529557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoKfxkFCc17p3ym+nE35o+to4M3ZNlziHRTvLpVgt8s=;
        b=GvBn2VRi1XxWMgyQYQ635ZyQAqqVJEqwrAHTKdlQjBHKKnM6oOm3PoPeBQ+E7Q13SD
         KfBxoLA7zwu7haW81Blx5bs8qPHq6gwI1vtM6+QIn5omR+SB3IZt6qJJjID+MiMUlt3V
         /IfdBqMO1r7zPfV8clHuN1fRqUbHo/1ZEUWKKHgH6qWTBuVEfDgo6RiRUg2mWmSm3Vg1
         GzwHIManpYIsJ5snthTIX6ko6dukdTt2J+f9hOqJeQox+wk/MZjRq1ldTLiISgqHQJKg
         p/uWKiQTGhEAF5DEE64hvFYIwhvEzcFQzUKdq7ZXyK7ZaNHu7BghUB/m6yndSdfImkM5
         cZGg==
X-Gm-Message-State: AC+VfDxbGMA2erbqPHmHX2CX0k7Pczt4c/YXym506FEi76Pf1s9vChf9
        ethqw9Q1vJ/gB5ItyFhA8nrZIg==
X-Google-Smtp-Source: ACHHUZ4bCn1GKAghfFAkQ/mgwytbtbz5hbc3F2LoZNzKFm43jKIs2+GAjb8/ICCch0uoCQzLcVEOcw==
X-Received: by 2002:adf:e78f:0:b0:2f4:e0e5:aaf8 with SMTP id n15-20020adfe78f000000b002f4e0e5aaf8mr9798189wrm.68.1682937557122;
        Mon, 01 May 2023 03:39:17 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k10-20020a5d428a000000b00306337e5464sm31718wrq.44.2023.05.01.03.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 03:39:16 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     laurent.pinchart+renesas@ideasonboard.com, broonie@kernel.org,
        dorum@noisolation.com, javierm@redhat.com,
        quic_bjorande@quicinc.com,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH] media: MAINTAINERS: Add myself as Venus reviewer
Date:   Mon,  1 May 2023 11:39:14 +0100
Message-Id: <20230501103914.962874-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I'd like to be looped in on changes to venus so that I can help ensure no
obvious regressions creep in. I'm happy to run some simple tests for venus
on the hardware I have access to

- db410c
- db820
- rb3
- rb5

and one of rb1 / rb2 in the future when they are delivered.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 713422f465365..e63b1725b5ada 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17546,6 +17546,7 @@ F:	include/dt-bindings/usb/typec/qcom,pmic-typec.h
 QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
 M:	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
 M:	Vikash Garodia <quic_vgarodia@quicinc.com>
+R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 L:	linux-media@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
-- 
2.39.2

