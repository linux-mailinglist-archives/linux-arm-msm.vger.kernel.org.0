Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 357786389E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Nov 2022 13:36:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbiKYMgq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Nov 2022 07:36:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbiKYMgo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Nov 2022 07:36:44 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF502D1C1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Nov 2022 04:36:44 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id bs21so6569684wrb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Nov 2022 04:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tCUJCjq8zxDkfeJPGjWwU1cc4Wk9DUerQHc4fqret8=;
        b=mhGv7Zh50AqBp4rTjI6gQn8/oYD9g+VcmKIghEJwnYzPc8vCDBjQZKvtaUDVIjqLX5
         R9deKVTuburdMVz17AK/v6u1w2EUrC85RO3a7Uz7oinTWavxmd6iA/uFuif0JIOzoLPa
         PiMVh+xqwziiZp/fXWMNIW+Oh+iyaJUfU+O/smtrjX35IhMXT4mWFV14IkJArbostmtq
         acfOv+egEQbfS21quRTXM0LRJQAcI1cH4+b5A92v0pW6XcxpN+s9XJK63Zimkc0bkwmU
         ulfVEY9Z+CZP1qYdmo73uevMZPqaSQcCN67Re00fwzsv0b+r6EcB96Hcz8j1k3I9B6hC
         HXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5tCUJCjq8zxDkfeJPGjWwU1cc4Wk9DUerQHc4fqret8=;
        b=WCRkpqj8MFoBGcvZwN8JvJahnugQyiNRoVSV+NS7RLGDHycaDrciPqi2tt1ICcmJLn
         eYg7G4NEGau5iwDA129oJ+ZfF1l2LxYuFxfoz4cfa0YpLa9+gBjOmRhkHBfYjb3vs4W6
         +opDe1rXClhJCmOKw4e6uSacriY+nM0KlEkSRDdwtZbSJtLdaTYqbGjsT8k6bLVgh3xK
         4YYs8LHyTL0djwLIFgrbXVUKjNHrMCAJhZDMiFzUY2UKbBsd9NiTEOgj9K+xeNqkdaqJ
         eAHsXTg66WkX0bODERyKqx4oA6Nlzm0SsK+YdzF0ed/u72aSsOhy7bcM+QHSa4UGSlgt
         qCTQ==
X-Gm-Message-State: ANoB5pmYsNqZVh3wktu242x4c30EKd8YBXVARlNdfUiXpgW1/pE8+s2J
        qXhj0V0KJVa/oGycbFhryIJmhH7pxnRiXw==
X-Google-Smtp-Source: AA0mqf6C8x1hhFqswQgErlQ5HjU+dSvgd7kzHs6f2ND4DDbvxFokbXV3w9I6dNogJHUi73OLfatGxA==
X-Received: by 2002:a5d:5233:0:b0:241:cc24:b65c with SMTP id i19-20020a5d5233000000b00241cc24b65cmr16659995wra.545.1669379802289;
        Fri, 25 Nov 2022 04:36:42 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k15-20020a5d6d4f000000b002366dd0e030sm3574111wri.68.2022.11.25.04.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 04:36:41 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org, dianders@chromium.org,
        david@ixit.cz, krzysztof.kozlowski+dt@linaro.org,
        swboyd@chromium.org, konrad.dybcio@somainline.org,
        agross@kernel.org, andersson@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 01/18] dt-bindings: msm: dsi-controller-main: Fix operating-points-v2 constraint
Date:   Fri, 25 Nov 2022 12:36:21 +0000
Message-Id: <20221125123638.823261-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
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

