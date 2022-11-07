Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04736620411
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 00:57:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232577AbiKGX5F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 18:57:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232636AbiKGX5D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 18:57:03 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F423E2715B
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 15:56:58 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id w14so18498445wru.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 15:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pgeozmPZqS6JXtBUtzz0XCzNbXeI8NLd/9teAZZ3ZoU=;
        b=Kr118oU3tWMRM9OSMDTcbOgWvtcP8ZX+qbTofQqOopNwYkeh3XrjPqa6V6VvNQvFvT
         buMppsTMAE9msYo92KDfPVh4w5Q5AkJkHxjoo21UDk4HoO7m0d+X3pqvW+c9s27zN6ji
         eAigHkl7x8GNbTxMKA3UOLEG7iPFPB5grRdVTKEncCeZQ4X7dPzTrZgrBEm0vuImwSdf
         GynTlyZRoiHPwRx0Z62w3A3uNl1VwtLVYX2fPCBpcT5fsD8hh1uopYrAGpCFro0X4IpW
         qvF8BiG7AS+gO99UC3oUTN0mzWxrLTASTXcJ5NIw9J/z7pW88w5/W7GxGgtLNFgJgOGz
         AwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pgeozmPZqS6JXtBUtzz0XCzNbXeI8NLd/9teAZZ3ZoU=;
        b=RTB1pv4mzqD1v+UK5GqhF3GV6UeKsEe0BGT38tFD9DUCEYjDE2WEw82tYI3hZddQqj
         aoXjhJFx6qAIi3q7rbcFlX1a+Dkb0VSm2SRR1Iv4WVkskH2xTG4kHTSBbSkTzUeCcE/1
         xlRQ+bQBCfbNSCaqGw/6wQHZwv0S3veC9bC8VRQ7UDImjoC2FJLFdhROChx96NY3eJG0
         WkwdjmJbVaEIZz0dlzwFlNA6JEk2WMJCDQaqrLFW4Au98jtKzDv2faX1r0qAq1eie5SH
         Aw+bN2vSNaRUWYzYwmLFrFK9syYLTGN8ALNhpUQtv0x6ChCTS0lVZJfG+rFQHEWRjL1a
         ztTw==
X-Gm-Message-State: ACrzQf0hKCuSOP8IhS0SO9w0zz6edhDqOqw/c6klYMj92eL7ES5rSpZk
        /xMOsMpS3G6VZS2XRwUyVxE82A==
X-Google-Smtp-Source: AMsMyM6a2iAeeRzZq19eqEqkJIwF+xt4p4o6N4GE+PRqYk+U2IE/mi3aZrpaVlpQnpPKNsKNm05xHQ==
X-Received: by 2002:adf:e44f:0:b0:236:59a3:c5a8 with SMTP id t15-20020adfe44f000000b0023659a3c5a8mr34097585wrm.396.1667865417559;
        Mon, 07 Nov 2022 15:56:57 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b18-20020a056000055200b00236545edc91sm8386161wrf.76.2022.11.07.15.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 15:56:57 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, quic_mkrishn@quicinc.com,
        linux-arm-msm@vger.kernel.org
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/18] dt-bindings: msm: dsi-controller-main: Fix operating-points-v2 constraint
Date:   Mon,  7 Nov 2022 23:56:37 +0000
Message-Id: <20221107235654.1769462-2-bryan.odonoghue@linaro.org>
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

The existing msm8916.dtsi does not depend on nor require operating points.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
index 7782bff89afc7..27ebfd5ffb22f 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -135,7 +135,6 @@ required:
   - assigned-clocks
   - assigned-clock-parents
   - power-domains
-  - operating-points-v2
   - ports
 
 additionalProperties: false
-- 
2.38.1

