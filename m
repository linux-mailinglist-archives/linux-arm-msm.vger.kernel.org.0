Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 760355619E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 14:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234770AbiF3MJC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 08:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234703AbiF3MJA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 08:09:00 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C23572A25E
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 05:08:58 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id u12-20020a05600c210c00b003a02b16d2b8so1531402wml.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 05:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7Y364367ZETPbYUxjT/bYJ3on1jew7iPHooGEySLfcg=;
        b=F2Th9MYS3e7kKEY/PRcP6iGG14Gg3stmsqlhD5Ge+759FtxKhNZrh1YznniTP37FnI
         iwv1WQ+X8RB2mt7SO+JOLBbP4aC/haKWp6wfdrXP1pkz/qQqX06jy1iYzoZJZPCl/tup
         n9slmYihLyneqnI513seDapb8epkBQksUV2yyFKCnVewyiKsFr2UYJD+3aHs2GXhf/u0
         69TMQmj9yzEFT2/p9DKx6LiifFIkrsclsKK2MGMWVvOL06XARM28CpPb08EPAXDwUZiv
         DrIaJIXD/NFwL9TNKUZIg2S99wW+xY9NCxtEh2UXu2HeQnLoPCxIOcKlLg/1s56ISUQm
         ocUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7Y364367ZETPbYUxjT/bYJ3on1jew7iPHooGEySLfcg=;
        b=o9KH/oSPNUQa0Kx79HlfFt46wH8UA3pttr4yjEz9nmgXv35bB+OXO0HRFdpGP9OXRo
         PXEqf53wDorFmZXOWBCabpPw7Ta2tdKKhPkpqokcAuDXbcBjncvyRJ+dxMxjn8BISPDo
         m9eH9pA/Jy0P+G7EU17gn/8C75zmMTy3IP2f3qzexcXTg77jYjZlhCDe2YZF0+TuN456
         aqgfVrZnvX974yNb3mCSfB8iCkd93Wt6EV1TJVQhbflEX2RszCaokv/xqI7eTzTdMmsx
         V+UgVyQyuGQt7GPAtthYS1ByIsuN7/QOQkj964bx3TWVzivDOvW8+kJE2ChtaTY82m7X
         NkQg==
X-Gm-Message-State: AJIora8z6mVBn8gLieZoZ+WXTvJrTA8oRBsBSgJBA4DhxRHYv7a0TLAW
        6WAIAvjy+ioH8YRKShlJ8EkVYw==
X-Google-Smtp-Source: AGRyM1sObV4Rfm6jYF+yKcTsDVbHI1OJZvADjgK9ncMMPWFLgqXPeWQ03hNKyahysgx1uF02bIV4nQ==
X-Received: by 2002:a05:600c:190d:b0:3a0:585a:256 with SMTP id j13-20020a05600c190d00b003a0585a0256mr9309229wmq.54.1656590937377;
        Thu, 30 Jun 2022 05:08:57 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m1-20020a7bcb81000000b003a05621dc53sm6286532wmi.29.2022.06.30.05.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 05:08:56 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     quic_mkrishn@quicinc.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH 7/7] dt-bindings: msm: dsi: Add missing qcom,dsi-phy-regulator-ldo-mode
Date:   Thu, 30 Jun 2022 13:08:45 +0100
Message-Id: <20220630120845.3356144-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add in missing qcom,dsi-phy-regulator-ldo-mode to the 28nm DSI PHY.
When converting from .txt to .yaml we missed this one.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-phy-28nm.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
index 9ecd513d93661..3551e166db966 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
@@ -40,6 +40,9 @@ properties:
       - description: dsi phy register set
       - description: dsi phy regulator register set
 
+  qcom,dsi-phy-regulator-ldo-mode:
+    description: Boolean value indicating if the LDO mode PHY regulator is wanted.
+
   reg-names:
     items:
       - const: dsi_pll
-- 
2.36.1

