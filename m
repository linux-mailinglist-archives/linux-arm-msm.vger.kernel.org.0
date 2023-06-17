Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6B1873407D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jun 2023 13:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235451AbjFQLVX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Jun 2023 07:21:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233433AbjFQLVW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Jun 2023 07:21:22 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 703BB1FF3
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jun 2023 04:21:20 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5187aa18410so2044519a12.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jun 2023 04:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687000879; x=1689592879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Krcc/vXi7Y/oQrZ+20/s87VCD/03LOPSb5ljOW/mb/o=;
        b=czrZgN6YMKptxuiuK74rBJt180zMz/fmQaDQ3kzvYFYRfVKqlPa9RW3fBTrfnuzu3/
         UcfFvN3zDZqhtdqmyOMyL+LwVBqyKnWM3DQt6DrmwCCQ/aHdKns6J8kBz4TATrMd3EF/
         bqMlSuTZdIoFEMO7CpqpMSzVoUwGT8e8fHL6LJ/kGZePiaKg5ojg6TFTFhV5ouxLPjFy
         dQsNAXSNv9J6G7u+Lh3lftUOtrmeTEF+7VwXli+5UOsemmTdEKWarRobq9hLwtZavowT
         9IzavH6LFXO/iPp6HpuWu1RzkdOTxO/yZlJa3GN7yvwUpDoSgH1bqM2czMHk3SnRJA2Q
         tuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687000879; x=1689592879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Krcc/vXi7Y/oQrZ+20/s87VCD/03LOPSb5ljOW/mb/o=;
        b=LqAxgjb/9ZJcFQhL2KvZgzQTJ4HdVv6cXegyXt5e7TuVGV++YHMfWrfCP19QXA0jRe
         XBYF5bc2VFCZwreaVdLCN6ogoWJFp/Y+V+MAQgiivwwdJThA1EYsJtdu8SSMvCOXsjPl
         e8NvJ0faGqcc6tRs/fLsVahP6zs/Ny98hfj8r+8U3QBumEWJ+Qemt99Au+OSzRFAsQ5J
         Kk1xBcVD7Zc1QDkJWPNt2ABi1aY8NS7sEiegxBHOTQlwRlqNhMF5gTHVjNo45BZaoHGW
         vxDhyimyxWNsGqWkcQG9+1g5OhTXptMYy1eynnCyqfhsKAL8O0rnn50OskpXT5VBMybx
         OjEg==
X-Gm-Message-State: AC+VfDzJEV8/WHHBVPQijaAP/Ku9utNTvNlWjuUq43NpF83i7UbtStrR
        yx5wgPPr+uVcS2K7rZ1FXrIFgA==
X-Google-Smtp-Source: ACHHUZ4AA9V2iKNQmUuN+hakXx8+pjCADqUBGZ21ZBHwXQFRzt/8njtGU93pPL1hgl/RpgF+PRhH2Q==
X-Received: by 2002:a17:907:9281:b0:982:caf9:126 with SMTP id bw1-20020a170907928100b00982caf90126mr4785068ejc.42.1687000878925;
        Sat, 17 Jun 2023 04:21:18 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id k9-20020a170906128900b00965ffb8407asm11837838ejb.87.2023.06.17.04.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 04:21:18 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: qcom: apq8039-t2: remove superfluous "input-enable"
Date:   Sat, 17 Jun 2023 13:21:14 +0200
Message-Id: <20230617112115.130024-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Pin configuration property "input-enable" was used with the intention to
disable the output, but this is done by default by Linux drivers.  Since
commit c4a48b0df8bf ("dt-bindings: pinctrl: qcom: tlmm should use
output-disable, not input-enable") the property is not accepted anymore.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8039-t2.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8039-t2.dts b/arch/arm64/boot/dts/qcom/apq8039-t2.dts
index 40644c242fb7..43686bbd87f4 100644
--- a/arch/arm64/boot/dts/qcom/apq8039-t2.dts
+++ b/arch/arm64/boot/dts/qcom/apq8039-t2.dts
@@ -366,7 +366,6 @@ typec_irq: typec-irq-state {
 		function = "gpio";
 		pins = "gpio107";
 		bias-pull-up;
-		input-enable;
 	};
 };
 
-- 
2.34.1

