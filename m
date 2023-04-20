Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D743A6E9EE8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Apr 2023 00:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232468AbjDTWbc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 18:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232746AbjDTWba (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 18:31:30 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 060A04203
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 15:31:26 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2a8db10a5d4so9546171fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 15:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682029885; x=1684621885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mgy1m01DsGQkO8m6umm6ha07ksFZFFo7FoVlVrv2pCk=;
        b=WleTIZCSyGhCiRH+O5xPdhKxDlRPx3jxmlS6I8zc9dTtPQpUulWszVYU/24DRXIWrx
         TyTAz2cSZSp77irfa2s+QuxXhWNuP98IAuNQitxIvEp38mNY9XkD35p01x86OBA+LoAc
         i5MIcTrh2faAd5zAh5V/TxUvUHDNNWldY5gwehCxA+JRZX4VqZBd4cK1ugV9It7/CJvv
         pOliZeCZjaF7GFwqPEzKbTIiwzzVMx2pbijbXlBRI6K97dU6vig21HP9b6E9NJwfDbXh
         cxWaja6+AcHhUqGiu498Q4U9M+zFrg/YvsKPH4LhYV3vTKl2TKKaAmBcsOqweKIYOAON
         1iuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682029885; x=1684621885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mgy1m01DsGQkO8m6umm6ha07ksFZFFo7FoVlVrv2pCk=;
        b=Cf3Vwc23K6m4fDKnl0PydQeVJEQmg9FYy44ROr+VpJmSCBv3pul4X5xDszzM7g8VA6
         BDy8WE3WbYhER9t+xsoP0n0jmpdv6a7ubyrUeLxV8woIwfGuc9s8pU5ai+LGiSiU7Z/2
         zobWZWDWGKJPTz1YL5VdeOXI/kiQ2S8zE2rxE3OFesDwyz+LZP3qbHaU/mnzy46zpVhx
         r/9x7iuO2GMB8AvAIZ4mlQsNaXHkL+5LXdT7Q57yMYq6cHZFQjXqGWOLspBVqECqee1c
         96ctyTTRa1n5TPQe9ohnJBSsOfXa9k0kgsv2CDru0rYsxvHB4/8uQ+FFO4AFEXzqvE3v
         1CQQ==
X-Gm-Message-State: AAQBX9eDKOt4/ljrRa7NtqMR8bLLtfIkfFigOsz3ik+l4z36sazs+IHT
        4lzROIFRMeS2jfRHQpNeSuammQ==
X-Google-Smtp-Source: AKy350ZAf10TswzpeU0L8mqlrgrQZIW7aM7IXW4Y6tz+en9CcheCpNxhhVoVesxB41VU6Bo+G6fZGQ==
X-Received: by 2002:a2e:98d8:0:b0:2a8:ee05:ca1e with SMTP id s24-20020a2e98d8000000b002a8ee05ca1emr95726ljj.13.1682029884877;
        Thu, 20 Apr 2023 15:31:24 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id w8-20020ac25d48000000b004eedb66983csm324256lfd.273.2023.04.20.15.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 15:31:24 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 21 Apr 2023 00:31:11 +0200
Subject: [PATCH v2 02/13] dt-bindings: display/msm: dsi-controller-main:
 Add SM6375
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v2-2-5def73f50980@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1682029879; l=1145;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=QlPpd+ksZO3I03gNbWxED0xzwfnGvYwQQWVE28vN1qo=;
 b=Tg+MM4R6Hq9ZR30v4XBrUBNZ1ekzX3I5GoPUGc3SFwD2ubk3y9GVml3+HBbWLW3rLJL2w+YLpVEq
 V8PlvA1pCze0dvkmYouDUIxE2ZfSWhXFOvvibcPr3IyU+rxq9Qyw
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the DSI host found on SM6375.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 6f367a1fabf8..f7dc05a65420 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -27,6 +27,7 @@ properties:
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
               - qcom,sm6350-dsi-ctrl
+              - qcom,sm6375-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl
@@ -354,6 +355,7 @@ allOf:
             enum:
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
+              - qcom,sm6375-dsi-ctrl
     then:
       properties:
         clocks:

-- 
2.40.0

