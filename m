Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F12BF620414
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 00:57:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232642AbiKGX5F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 18:57:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232676AbiKGX5E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 18:57:04 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2241527900
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 15:57:00 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 187-20020a1c02c4000000b003cf9c3f3b80so3143351wmc.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 15:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cGZG96v8cqz0v6+uEmiwdHlinvJUjde03wda6QbENf0=;
        b=QEGO01djriBqoKxzJ2ibVdcEexNGpvy2oGh2bKckK11kSgma5ioa9nJerlGD/uP6YG
         3tY+s9/fo8hCbW7/HUc+8lfdqauXsxKm+Z67xvM2xxyD3BQTDHqJKbJjQEl/EJQPuMgJ
         5F/plRZ17atZZDd+s5h2iROyOkSF12h+DsarrDCexPJlLxe+k2nQV2siBIrlOyi2+E9t
         xCM+oq5z5naoZ1YV0hVa96EfXCfbhhONOXcIXguNUcSi7k+ZS3+N882EAR0blgp+yP1V
         Er/SOD/Lh5GsmWqCVE/BBQ3QOmjZ3L/1Axl/kYyvmWp15eUf/xMJZXWz8WA8/mHIH6pb
         V5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cGZG96v8cqz0v6+uEmiwdHlinvJUjde03wda6QbENf0=;
        b=H2vTSAYHIoFqdXVzrt7LwFcbB1OO5w4RAI8wS72StA0HWzTtIUB6QNOHqmdbwDBT1T
         fMqPCGvcUNA6oWQSkBdv0LnmAd3R+JTclpuM1dwZiA97/peCOZf/Q/AkLywLI7rNY5f9
         SpR4D1ZYO2A8Ab+gGpFPiBNgvI9sUfOAw2mfl2i362nmzVNK9uhFIZtcRogBEbemOH4n
         i8bOVG9YEnwhqmvZ1ZhRE8maQDQNFOYzGjvGFTJ0RerH33lWi2G8bWuu9UNs7jY/W6nw
         br1LE+4GHkVmSHFMH+yczqMHi63JHjZPXwtmAHPqqyykJ7OUiPbiiiOw/9YNBbhwekyN
         gLbQ==
X-Gm-Message-State: ACrzQf31pKOhnroU15oJxJ1SZN/ifFhF7mZ2ZzEE+/FLuw4kwP9pZgD/
        +7vxc1rm0TYWcAC+IMAnC7Howw==
X-Google-Smtp-Source: AMsMyM4w4Ckhv54D7JLNzKMt1Q9DvaH2u/V2Xm6iRFvGnw31LRME1uZA+oZkp/Yl56q8o8B+5Opphw==
X-Received: by 2002:a7b:c341:0:b0:3c4:552d:2ea7 with SMTP id l1-20020a7bc341000000b003c4552d2ea7mr35599801wmj.82.1667865418625;
        Mon, 07 Nov 2022 15:56:58 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b18-20020a056000055200b00236545edc91sm8386161wrf.76.2022.11.07.15.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 15:56:58 -0800 (PST)
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
Subject: [PATCH v2 02/18] dt-bindings: msm: dsi-controller-main: Fix power-domain constraint
Date:   Mon,  7 Nov 2022 23:56:38 +0000
Message-Id: <20221107235654.1769462-3-bryan.odonoghue@linaro.org>
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

power-domain is required for the sc7180 dispcc GDSC but not every qcom SoC
has a similar dependency for example the aqp8064.

Most Qcom SoC's using mdss-dsi-ctrl seem to have the ability to
power-collapse the MDP without collapsing DSI.

For example the qcom vendor kernel commit for apq8084, msm8226, msm8916, msm8974

https://review.carbonrom.org/plugins/gitiles/CarbonROM/android_kernel_oneplus_msm8994/+/7b5c011a770daa2811778937ed646237a28a8694

"ARM: dts: msm: add mdss gdsc supply to dsi controller device

 It is possible for the DSI controller to be active when MDP is
 power collapsed. DSI controller needs to have it's own vote for
 mdss gdsc to ensure that gdsc remains on in such cases."

This however doesn't appear to be the case for the apq8064 so we shouldn't
be marking power-domain as required in yaml checks.

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
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 27ebfd5ffb22f..cf782c5f5bdb0 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -134,7 +134,6 @@ required:
   - phys
   - assigned-clocks
   - assigned-clock-parents
-  - power-domains
   - ports
 
 additionalProperties: false
-- 
2.38.1

