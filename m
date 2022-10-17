Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 473BA601CDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 01:01:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbiJQXBM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 19:01:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230488AbiJQXBF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 19:01:05 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C6378049C
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 16:00:50 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id h10so8316583qvq.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 16:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+/y5DQHVlPqDEJxbMYvIvUIy9E2WmWV37aVNLexaIU=;
        b=Zx09MSBTZsH/ydoaXcqEoh8EAJyZNFBuaYinmayQvhWQI+Tg1+vpLdSQ5AbUlUW6RS
         IQrenGrySIHEFapOxpWTS4RqDqiQUDMahzt8S3KTv9d1tXAxuEfJZ8MfnxsZZKpqvnT9
         uYQjwwpYJHVh6ZZIIHzMbvsdQvz+sqM0Vez/r72j0yafmBv+DNpKoauMGmzTjhkZ3/39
         zJ1orpZyygDEOvB3zJZlTvfQI5KS27TQuoV7AJW1biEBZpF9mRDcm1n/yMnhbBo35BGb
         lJt9zy0Xj8BzkHe21I1R/VRn3kthQKb7xB6ZTML8BRFllWbAkkUDux+nKLqPfvbvZOj2
         Sw5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P+/y5DQHVlPqDEJxbMYvIvUIy9E2WmWV37aVNLexaIU=;
        b=Z/oWLgz1b25zFwYgcfRnHbQn8VpUfdHPCuhglC8Q/kyCcKrwbEN5jiaXKQ3ZbQbh2o
         GwyAiZyuF3R+7fpGxtny3BGO57L0qG53miHV7FdvuNe8GEzl0l4PlfI9h2XrfM4ofEyf
         z+f9mp9cZ85jYVQw5WxCjNHkM6SNLjIzimnfNgS++2XqqQGxY8NSUyJBQKUYf2ZcdOY1
         eqHOl17K5LcHFNonNv9uS61vXBbgcgz9jMWfTMK2+aAwuOPfSL7lug3G7MLF/8CUn6Wg
         MvC8+CD9gF1nBjy4Y7nOD3u+gKuqw0frGfpKRauzuw4IMbLc+xMM7zh8+hOfwnQ3BoS/
         yXIg==
X-Gm-Message-State: ACrzQf3YSLcq4sDiuEpTxW2CtZOKjlxWTGxa5S3fUruCEu55bRsOjUyG
        VrKax8+omnehwFSClBKmQLm+CA==
X-Google-Smtp-Source: AMsMyM7K8wcXdq2i7N9MACllAAhrPUKyyE+l4YX9sI5Xr6eH67D1cCQurY12bi3YCXqK4uvq9EmYww==
X-Received: by 2002:a05:6214:5cc5:b0:4b3:ec9e:79d8 with SMTP id lk5-20020a0562145cc500b004b3ec9e79d8mr124966qvb.61.1666047649206;
        Mon, 17 Oct 2022 16:00:49 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id fg11-20020a05622a580b00b0039cb9b6c390sm729670qtb.79.2022.10.17.16.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:00:48 -0700 (PDT)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 07/33] dt-bindings: pinctrl: qcom,sm6125: drop ref to pinctrl.yaml
Date:   Mon, 17 Oct 2022 18:59:46 -0400
Message-Id: <20221017230012.47878-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017230012.47878-1-krzysztof.kozlowski@linaro.org>
References: <20221017230012.47878-1-krzysztof.kozlowski@linaro.org>
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
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml         | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
index 843d110df240..50f721d5f843 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
@@ -13,7 +13,6 @@ description: |
   in the SM6125 platform.
 
 allOf:
-  - $ref: "pinctrl.yaml#"
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 properties:
-- 
2.34.1

