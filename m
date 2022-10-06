Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 957365F68D7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 16:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231607AbiJFOG7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 10:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230428AbiJFOGw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 10:06:52 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4107A7AA6
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 07:06:48 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id f9so2336769ljk.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 07:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=reBQ8yGOHkQH0pb0oVf0bw9HrVCQaYc+yr9KWuZJrSU=;
        b=W+9m8JERfT0TZns4CdeLpTRO7yGR+RwvkbtgiXTW0xfW55pzj9ELhp/qDQsVreMbLb
         8TfaVsSxYSJM6cpQrzddKgJdZ+iTUrSHn0yYmcnczgA9apuJ/9FTTcmdswXIfQkUxoey
         a5dbrS3dVqeAmLU5SYUsUtgk9VgFNaXk+CvlYqCc2gPbBcDmECxr3VDf98o9anJ3r74n
         3zALqFkwgEMzoK2pZdl1ODUtEUq7uiyo26d/AipxRdYo2/rLdxaLPkk4Uu7aGltv1wCP
         i11yGEOT3xLfRNUkUKom7GsadIDO+gCJCgq7DiX+tbEOacALmhU064m8gNQb0IGyaIWQ
         FNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=reBQ8yGOHkQH0pb0oVf0bw9HrVCQaYc+yr9KWuZJrSU=;
        b=uFsSHswXI2w9C6qZ5NAZ1voOkuWC+vM3O5Pdi+7M7sY7/k//Ug/4I0bttNWXDuVIzI
         vI2xywMUwOTQjmQy1RlReZQ0pqxzuQteE1dPyCwXhtRgLOOEPdNpFEQhrdlwXZMNv0hs
         i5ent7Kv7QG6L1zHxGYw+E6NYJQ1qIHDx+oyr5BhN3itRWT4KFguT9/yr6aQb7jpk8d8
         ZdX9tIYjyJPsinw5LCcBf6b23EBXJUGySauEibDKTzS/Ndof14WdFdjdQ4ZgD0RGsICI
         JxzOEaHq/T1DGBXEdjMF2sHqGhvAodGqxCrYx0CjFmhGNuu90h6EDPpk9Cd4LjEKj4as
         0TAQ==
X-Gm-Message-State: ACrzQf2QmWSIWV14iWYY067NrsOjiuTiIv8/rd8vL/STlvS3RYF9pl9r
        zGLiGGYBGCp0JyuJJ8cTP5pWzw==
X-Google-Smtp-Source: AMsMyM6o8pYzeIcbus9jyd8olECr/wzlnFA8vzE2RBymghy9etBt5Tr3GerpdbQzs4C6bQX4Q8W53w==
X-Received: by 2002:a2e:98cd:0:b0:26e:4dc:f454 with SMTP id s13-20020a2e98cd000000b0026e04dcf454mr733595ljj.464.1665065206826;
        Thu, 06 Oct 2022 07:06:46 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z3-20020a056512370300b004a2386b8ce8sm1833929lfr.211.2022.10.06.07.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:06:46 -0700 (PDT)
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
Subject: [PATCH 03/34] dt-bindings: pinctrl: qcom,sc8180x: drop ref to pinctrl.yaml
Date:   Thu,  6 Oct 2022 16:06:06 +0200
Message-Id: <20221006140637.246665-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006140637.246665-1-krzysztof.kozlowski@linaro.org>
References: <20221006140637.246665-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The binding references common Qualcomm TLMM pin controller schema, which
references pinctrl.yaml.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

