Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A97E62041D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 00:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232760AbiKGX5O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 18:57:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232781AbiKGX5K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 18:57:10 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 606A727927
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 15:57:02 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id l39-20020a05600c1d2700b003cf93c8156dso6573099wms.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 15:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qAGk+nNjornIMJdpYZzX61c9uY3N5rhRbOvAyl/cRcI=;
        b=LKioUSDnQg6JaddBnL63Lvmeo9cXsgp+4PaRCdFRfMnp/G4E2SBh+Qr+90ot0vORsd
         cBm8vJ85nbF0KcTfTBQBZxui99mITeSt+MZzajkr5y51i31J0bYbzHwD1sWa3A1eD7Yt
         CyjEpBu1c2iLGLA2hxgZmTGlThJWCRZwFA3DDM/OCbrIjbpoujOWDjtv6RETaymWOvWc
         86cxoz4lQfZI6CvxvXy8bkHiJtwubeU0934p5lAVNhvUy7WgAKCLP2Jp5K1QnSsQtU3V
         Ddxm6ZleedqzdeXbYDXx8LbNnahwT6OJ+avsNARdNePDPwuD7Ng3x5KSt84TBIRT0pZP
         WYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qAGk+nNjornIMJdpYZzX61c9uY3N5rhRbOvAyl/cRcI=;
        b=h2nmQtirmQ+dhS/GIIep32zC35wfk0Ts89/P0liPFDBOA5/avpA1sG7vdAWdCW5mdO
         iZdBYDPRR/eUE+3A8DsGFyYJjRzPTxdzNKrnu84uBQcFUHpcFLintjr3Jzrto68m93t4
         mDFCHsEKlfKq4RF0NsWYD5NFwwF50pMlBmKqIeSnd90kMSdcKa852JjLSjP4thdhxM4P
         iSzL+3e47R4STVOayWXhMv6U+Rn5Z9IVdYfq6rBZTzDe4DWiRC/t5Mqra6r31YbnIo72
         1hP3NXgEdgWP6L+INZyTuf+ovQVzKmprDWtv+TT6bQGno7PtnO+XcicCwumRSeTlrvFB
         aNFg==
X-Gm-Message-State: ACrzQf16OjHKmY3j+bJPfjoRPUqkD7WIHXKppNrVwZO0P3ycDLG1JPGl
        wlK7orm01wshajVfjbgFoO0lhA==
X-Google-Smtp-Source: AMsMyM5502aGtya1hfA844I0triX6tm96lgDwjECnjdG0GR1QyLeZz1LBUlYaM1trZYKftrwY96Ldw==
X-Received: by 2002:a1c:35c9:0:b0:3c3:d9a:385f with SMTP id c192-20020a1c35c9000000b003c30d9a385fmr34399577wma.139.1667865420946;
        Mon, 07 Nov 2022 15:57:00 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b18-20020a056000055200b00236545edc91sm8386161wrf.76.2022.11.07.15.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 15:57:00 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, quic_mkrishn@quicinc.com,
        linux-arm-msm@vger.kernel.org
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/18] dt-bindings: msm: dsi-controller-main: Fix clock declarations
Date:   Mon,  7 Nov 2022 23:56:40 +0000
Message-Id: <20221107235654.1769462-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
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

When converting from .txt to .yaml dt-binding descriptions we appear to
have missed some of the previous detail on the number and names of
permissible clocks.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 0f7747e55b9be..cab38a20a54b0 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -35,6 +35,10 @@ properties:
       - description: Display escape clock
       - description: Display AHB clock
       - description: Display AXI clock
+      - description: Core MultiMedia SubSystem clock
+      - description: MDP Core clock
+      - description: MNOC clock
+    minItems: 6
 
   clock-names:
     items:
@@ -44,6 +48,10 @@ properties:
       - const: core
       - const: iface
       - const: bus
+      - const: core_mmss
+      - const: mdp_core
+      - const: mnoc
+    minItems: 6
 
   phys:
     maxItems: 1
-- 
2.38.1

