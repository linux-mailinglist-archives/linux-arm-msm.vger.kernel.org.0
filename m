Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0E8E6001A2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Oct 2022 19:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbiJPRCY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Oct 2022 13:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbiJPRCE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Oct 2022 13:02:04 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84F0E37F89
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 10:01:49 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id o22so5429497qkl.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 10:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtCTGlGKy966v/cPNs/91xDY9Oz5Cj3W8mgOw/S68pg=;
        b=LVw9JvCXj+wz2HhRzOYcvEDwFi/P7oqgoTeRmpOS3B2ngWEdrAiO/a3UczEEPvConS
         zKc5xNRQMYJUT1N6ddMoeo/x1IcngNARCuSSkx7I8nzCEEVqj0MvJIRIsa/zf/A0C56j
         EAiuoy9z3OQQETDtIZvq9Txm5Y2ZscJHPD6NfQjY286slY1UjPnLL5gBkzzuoZFvPyoH
         3QNSdY4arciDil4O6Ezw/gjorfJEJMwrUJM3unjSYt2zxR9JwMvuMEASqusIF4yBgsOH
         NW7242T8eDQLBA1ZnDyFoMNnIDL+FXA7ZM3qxVCQ6VTSzHi4AZ3kx2ybOBMXTdbfODX5
         +XRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtCTGlGKy966v/cPNs/91xDY9Oz5Cj3W8mgOw/S68pg=;
        b=bKxjatc5o3m1wIzVG9oO9enIoMZzHLrOmlSgntMd5zJaZ2Gz3LflxzkPggSKHAYCFc
         oLE8hxEqm8Z8RelvWQz+b3AolxbvHiJ7MgJN7SqZ9+iWxqqxwQ94c8LVYlp9o+ehs9ud
         NPcVxDY5N55PNPcBTqsvauYsCZruJhpv38QnMmP6hzaj2tPhtfUUr8CsoFrwzwaNG2Ja
         +CT03yaaX4WVq0Oi1SdOwaWHE6LLv7bkf/dMqehm8nEswmkgJg8MErnmgOwxNCrlkDHA
         r1c7sgMNmhl7OLuPM5GcUZRZPy3uPVgUbWJk//Tkw1Jz/w9b3QELL1zV78GLrMZ4neSF
         OkLQ==
X-Gm-Message-State: ACrzQf1n4cf5fJEzNie5R851rUS6GL4GSWIrGSZg9JNj/ig/3zE+t7v1
        uCP6131r6YHwxQlXuWXyxcSaMg==
X-Google-Smtp-Source: AMsMyM4ARokuO0OgtfCmIY6SnRaCnysF05eRmr0YFqCOL0skSOgknDTvqfH6jdpP3hsanUIQKTWiog==
X-Received: by 2002:a05:620a:2057:b0:6e6:f4d:980b with SMTP id d23-20020a05620a205700b006e60f4d980bmr5039747qka.544.1665939709008;
        Sun, 16 Oct 2022 10:01:49 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id q6-20020a05620a0d8600b006ce7bb8518bsm7539967qkl.5.2022.10.16.10.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 10:01:47 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 10/34] dt-bindings: pinctrl: qcom,ipq6018: increase number of pins in pinmux
Date:   Sun, 16 Oct 2022 13:00:11 -0400
Message-Id: <20221016170035.35014-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org>
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

One pinxmux node can have more than 4 pins to configure:

  ['gpio1', 'gpio3', 'gpio4', 'gpio5', 'gpio6', 'gpio7', 'gpio8', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio14', 'gpio15', 'gpio17'] is too long

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
index 76698cd97e8c..7202e2af200b 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
@@ -63,7 +63,7 @@ patternProperties:
                       sdc2_data, qdsd_cmd, qdsd_data0, qdsd_data1, qdsd_data2,
                       qdsd_data3 ]
         minItems: 1
-        maxItems: 4
+        maxItems: 16
 
       function:
         description:
-- 
2.34.1

