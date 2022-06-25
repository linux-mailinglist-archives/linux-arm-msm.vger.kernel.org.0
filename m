Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6655D55AD7E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jun 2022 01:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233682AbiFYXZb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Jun 2022 19:25:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233688AbiFYXZ0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Jun 2022 19:25:26 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36B0812608
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 16:25:25 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id s14so6834515ljs.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 16:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5a0O/lj86Odcfyvh0NdSDgZ9jbHY6A/CPF6H0Yb17DU=;
        b=yyS+mK6cduXZl+Iio56UbZ9nIzgB7J9VTE5oBCeuG36DrMimAJnDNCcyPNSL6IY9Hi
         DmIfDi3GCFyTSZFxHzFaY9pg9VUpEPELZlnOI1VHdLepjK/w2Jw2RyOyOUrnKKWQ0Dma
         N0J1boKXkOHjgy85RO43Vq9zUQ/6GCj1CNSr7hqTmZuHmFCJxxKGIX0/ViE5e8BkZL0s
         Sasy74vzxwNp47+iP/TUhvMQU7fgZMC7VA+9cx/FxX5+glD/4VDngTwxmd+BqwW/IxNF
         uX1FTTKOlwq17ruCio29geXApyDSYRUtXfClxF6icvfmWyV/mOlmNindca1mAuK5rcU8
         0mFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5a0O/lj86Odcfyvh0NdSDgZ9jbHY6A/CPF6H0Yb17DU=;
        b=ctpn6TiKJnonhP5ofbVIWhRcdN4iGJZsOLkxNb9j6TWZXNXyw6RzNl4ZttkWUOZvn/
         0FkBQ/C3XZeDgPuXipEZdJD/P3jD0JSthZs0n2vwC38g+7W2I4bXcBpdw9xJGMm3pW5w
         GQJ5YN+9jdAkc8cb2tPBe7sY0JjEZ2gqynGBeK4mbL41CcxS8nQXdpO/A47IPzxjnkCy
         pz0gv7C2T9AwdCQIr1+vqzVJ49wC3LN/zVjZfOeG5SUQ9ctcRuIy56WebNWIzljmnV+p
         xa5xb0FmlGKvH9EbY/Jn1EQP0wBX5Jz5KqCVUIhqvj6bCJ8dEwYuKIBZKQ5ljLRRWuTV
         fTOA==
X-Gm-Message-State: AJIora+IwWzAEZExzKFdWQ/TVfnqVc1QxUWoWq9+T0zVfyN8pBv08U9q
        kPykNz1Mn7ZTCX8WKYrOk37CIA==
X-Google-Smtp-Source: AGRyM1t6fjYd7x9i+9ve9cC+C7UdG5/nZz5n8gJgxMQwmJE8Hg2DzAUEOn+9issMRrXYXdqKdaf/DQ==
X-Received: by 2002:a05:651c:b09:b0:25a:44fd:41f with SMTP id b9-20020a05651c0b0900b0025a44fd041fmr3183870ljr.366.1656199524796;
        Sat, 25 Jun 2022 16:25:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s8-20020a056512202800b0047f750ecd8csm1093694lfs.67.2022.06.25.16.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jun 2022 16:25:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 09/11] dt-bindings: display/msm: add mdp-opp-table to dpu-sc7180
Date:   Sun, 26 Jun 2022 02:25:11 +0300
Message-Id: <20220625232513.522599-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220625232513.522599-1-dmitry.baryshkov@linaro.org>
References: <20220625232513.522599-1-dmitry.baryshkov@linaro.org>
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

On sc7180 platforms DPU device tree node contains child object
mdp-opp-table providing OPP table for the DPU. Add it to the list of
properties to let sc7180.dtsi to validate.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
index f9f22ec56a21..42921f25baa4 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
@@ -53,6 +53,9 @@ properties:
 
   operating-points-v2: true
 
+  mdp-opp-table:
+    $ref: /schemas/opp/opp-v2.yaml#
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     description: |
-- 
2.35.1

