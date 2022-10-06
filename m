Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0685C5F68EC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 16:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231337AbiJFOH0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 10:07:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231295AbiJFOHE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 10:07:04 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8838CAD999
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 07:06:55 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id f37so2855992lfv.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 07:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=KQjK7qR8aDTxCX/wEwMMoCMnkBh65bJdWFnevxayKME=;
        b=LzlULNRKv3NUwJ3XnY+tTnhOjsoY1nQtoDLufa/0Zcsnud9RAtJmA42p4M2PU4xNQD
         WyD738+KtHMlF7v8UZvd8BqiXkdgxO035duq3+22mD97l6G6ksImt6J3vMVrTiqjWGzA
         0VVLnYaniGkFBuYJByOltQek+4QNCnyvlnh1k1YEJjcuVpmBLYr+sHY3UNZgRCof4CJ8
         iuuZxUS+yQqlXOVz6b80zSdXXC2FzJYWiZYSzjXWqwVZ5aI2EezpXmMwGHgajIZft2kK
         Hef6st9Z0zXEHs14anENLsMdXllRi14+WuOvQSaBXZd7uJIPu88pKs060bs1oMt1+DUd
         5MNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=KQjK7qR8aDTxCX/wEwMMoCMnkBh65bJdWFnevxayKME=;
        b=4nwl70eUrRvJYcfbs1QQfRdoG5l2GVjz0W9OZHIWJIXesor6ksoPdIcqjT5IjbXJFu
         Hyp9oV5RghJSFdr5r/eSR5f29OAjAUdXv20Ty/P1mKhN6GQPW3KBlg1Tt/0VOJk6jTSt
         obnPGdNNxuL19TyV+8RbMR/PbOQdhSYhlPy24MO2P44VNM9LrNxxH0AiWBZ8dWOGmXFW
         d7atnQxX3LFQGJ17tXU1DuW1s4TGtFtjrPpZL46c3u3AZ3vyWuF4XcENmX0g3tlYC7iQ
         sxalXneT/wqyUpzkYJ0Fvp8Ny8n/TymeqGAFhHxvtr+5SV8LOMPLBVLh6YqMjxi7ybJP
         082A==
X-Gm-Message-State: ACrzQf2my/M9Vz7h+LFO98A6IK98k37aQibRwKzjnb7OGUdUNqfDzQ20
        +eYlIJhqU388tkz+UELYp/obOEjCH+SchQ==
X-Google-Smtp-Source: AMsMyM6zf7BTezkpe5D3Gdyiywc8/FyKK4qRYONk8eJDxKL83AHAzzfnmRtCv72L2mHgkgBXdkBF9g==
X-Received: by 2002:ac2:5296:0:b0:4a2:6d18:4dc8 with SMTP id q22-20020ac25296000000b004a26d184dc8mr51980lfm.444.1665065214712;
        Thu, 06 Oct 2022 07:06:54 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z3-20020a056512370300b004a2386b8ce8sm1833929lfr.211.2022.10.06.07.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:06:54 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 09/34] dt-bindings: pinctrl: qcom,sm6350: drop ref to pinctrl.yaml
Date:   Thu,  6 Oct 2022 16:06:12 +0200
Message-Id: <20221006140637.246665-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006140637.246665-1-krzysztof.kozlowski@linaro.org>
References: <20221006140637.246665-1-krzysztof.kozlowski@linaro.org>
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

The binding references common Qualcomm TLMM pin controller schema, which
references pinctrl.yaml.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml         | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
index 856b9c567ecb..94af82ee5967 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
@@ -14,7 +14,6 @@ description: |
   in the SM6350 platform.
 
 allOf:
-  - $ref: "pinctrl.yaml#"
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 properties:
-- 
2.34.1

