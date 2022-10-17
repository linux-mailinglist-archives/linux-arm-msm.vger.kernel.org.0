Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87C68601CC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 01:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbiJQXAp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 19:00:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbiJQXAl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 19:00:41 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F05257FE61
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 16:00:39 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id o22so7659923qkl.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 16:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fj+DQUBx9p1ZkV1G/l0ToLX1GpfKvmkaoqt6UhSbFaI=;
        b=PzGVrWN0z9CiZDa2QVXcId125FsblDHYJyLrR3GoxmKxmdL4N9toPt59IwwynU9eQ9
         jQXjQdB4mIhjiZgW3X2zgQiZov4kbSO89PIvpNemuuDnKkq2QCkyT8BsJ/mdntGNdo1O
         /vnv1XlMOjUqVcC2PhUYlGX1/vMVckD2KqYb9rncLl2hZU9CXAsl6jPv5uVEKzTRVgYI
         OXGnEJiRaDNyG9cdnKAc2UheP5PJ9AmW9XqCitCh8N0bszr4gYH8DMTV2MUi48jg88pj
         3rd/JLzXm/LEJQ+ODG1MqI+qyLR2brO4/JOylvKt6nlfuZlQGvom1pvDu3D7GF3+Vcji
         qEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fj+DQUBx9p1ZkV1G/l0ToLX1GpfKvmkaoqt6UhSbFaI=;
        b=rZMUwIn44JLNXhbq9zLPlxiRXqjkR617yA9Etwv1EaNLh9Ah41A4uOc/rgTF+p1MYF
         MXFX7Y7EL6nvzBYTaBhe0lCkB7pP0ZEKoaI6+Ri2Sy0Bu5cWa6KN2b1GqD2R4kVtin6Q
         pQUT0vh9BWV28JrMI3beGQ9J5xDoximH6NZTJjNswyUNNYhPcesxYp6/gaSN7qPbRGiJ
         UpUNtVb4kG6Do2U1pO7aVC+2GCvzbRSOmy5+jiq1bgauq0izuOvs+6YKvNMZC3J5J8Jb
         DJGuQXkvkeCYV5WUInN0ictKe9y3p2geBpMWvU5kjINMrsDvshc4elNWaptArtRJdFvu
         D8SA==
X-Gm-Message-State: ACrzQf2/ma2YO6dXzaxLeUcLsCvsri/Xcu4v/YKjoPHeHKToulrgY66r
        tz3Hql+FIdiAOLyjMG17Yt9Wcg==
X-Google-Smtp-Source: AMsMyM7sJMw1KfaWnUqTazlRDvrGacPX6Lau/l6xKgx7Kpq7hhSyR8fKlkyD70zkTWDIYeI3kKQaSg==
X-Received: by 2002:a05:620a:7e6:b0:6ec:c7e7:e50e with SMTP id k6-20020a05620a07e600b006ecc7e7e50emr9364936qkk.295.1666047639077;
        Mon, 17 Oct 2022 16:00:39 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id fg11-20020a05622a580b00b0039cb9b6c390sm729670qtb.79.2022.10.17.16.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:00:38 -0700 (PDT)
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
Subject: [PATCH v3 02/33] dt-bindings: pinctrl: qcom,sc8180x: drop ref to pinctrl.yaml
Date:   Mon, 17 Oct 2022 18:59:41 -0400
Message-Id: <20221017230012.47878-3-krzysztof.kozlowski@linaro.org>
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
 .../devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
index b98eeba2c530..62d0ea7bbc62 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
@@ -14,7 +14,6 @@ description: |
   SC8180X platform.
 
 allOf:
-  - $ref: "pinctrl.yaml#"
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 properties:
-- 
2.34.1

