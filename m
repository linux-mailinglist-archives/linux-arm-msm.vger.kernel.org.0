Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 838415619E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 14:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233823AbiF3MI5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 08:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234536AbiF3MI4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 08:08:56 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61AF029CAF
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 05:08:53 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id e28so21830545wra.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 05:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qw+FrcK8UL5qu8ONac/uqXSaLs1ISOMfbcLfGwuhXDE=;
        b=dZ4HRsYHTwt8haiFE3hGMawaqkoZU0n2a/IY+4Dmx89wDrrt7nP7KDIL4r6uGM9cuh
         sMEq7Tfc7a0iV0aJuz+6KIfBdRnkdni+bvpWA65weJj6/cwSy+smead6Gmi0opV8AN6e
         IUprbZAmIoqAP18YpDWpZovQWRkdFy5Z1bcX+OZPbrMNpjf3mtg7lSY+khiiYQoK0wT7
         5jt+Xdzo7KE1a//RW6cd6q4pcit38/G6JVXHgEfDEJIAyB8u1QTHgx0veDqw5wvbYdy/
         qt0L2KkT9YIWNL1DRbEM0j0BMONiU9rd+jzGkJ3me6KdUhb9lrGVwHVzMCqiRl2iT/+R
         M7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qw+FrcK8UL5qu8ONac/uqXSaLs1ISOMfbcLfGwuhXDE=;
        b=AwrjejWOX03Vblnh0HQBnKrbV5unYpBflBHXtOilIrg9eS0uY7pKIFs5r7E6yEXTSB
         4NVtWLhFPBo58dbEQ8YemOLB5NheXcvaXCfyAVq15RAIP0kRGd55vB15kxJ8rR9HACea
         tQLpJTbdW/momOJGoi3oHvSC0DVGceAjcL3+hh1lBnWeRcj5cNYTtbnzgbnNZCxkYKbX
         qsR0w61Vexu5ubtQ/KzfPRp/SAY0VXDqdVqzDELNv4ZdnJH0ztIxEll6tidofKgAf7j4
         c9q3VZUosR5F6lQtZtHlPAHgIWzrOzb5HaMLBKl/wg7AoBG90Vxb97g3EA60KbW8vzhO
         NoGw==
X-Gm-Message-State: AJIora8zz4t2M57af61cl0r2kdBlTbMbAMMKxs13AKyEMJ8vMJ2FfXm8
        dWOkiA4Wix2Q6zcM25wuuyZl2w==
X-Google-Smtp-Source: AGRyM1vw/qWPMCqZcAMlORKxceCBDPBznemmed3RSo+O4t9zNeHUWYv2GFQMWw3MrhWnPp2h/OzJog==
X-Received: by 2002:a05:6000:1705:b0:21b:bcff:39d3 with SMTP id n5-20020a056000170500b0021bbcff39d3mr8141430wrc.502.1656590931841;
        Thu, 30 Jun 2022 05:08:51 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m1-20020a7bcb81000000b003a05621dc53sm6286532wmi.29.2022.06.30.05.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 05:08:51 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     quic_mkrishn@quicinc.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH 3/7] dt-bindings: msm: dsi: Fix power-domains constraint
Date:   Thu, 30 Jun 2022 13:08:41 +0100
Message-Id: <20220630120845.3356144-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
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

The existing msm8916.dtsi does not depend on nor require power-domains.
Drop from the list of required.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 101adec8d9152..91324f0828448 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -136,7 +136,6 @@ required:
   - phy-names
   - assigned-clocks
   - assigned-clock-parents
-  - power-domains
   - ports
 
 additionalProperties: false
-- 
2.36.1

