Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C2D06C1A92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 16:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233131AbjCTP6W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 11:58:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231896AbjCTP5m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 11:57:42 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 610223D0BA
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 08:49:07 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id i9so10824547wrp.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 08:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679327336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdWVdTE/8Dyw4hqegkINdb1CQZwRDCkTAUWJC3MHmmA=;
        b=HbZIY2NdCdPKdS/eMgjJPDUChurWWyqnsYaZHbvocxmHV+SczCkGA6ipcEmv4BmFx/
         HovX1je2YpAh2yyHyxSXtwTtPlbYqFHKqwBYpUAkT/EP3ioZJAbRKTqJtJK+2B/oiuRH
         TBR7AH6zcZeNZ1wLYldKF/0oV0e0puF16U1k6+GB/tulJ6PDox/9oUi+6K40SiaV3ArN
         D9bIbyFGhJ6ASVrAYOslO78YfxlxwVAHmUOKDYyyjhpod7TG2dU3z4tT9DZ8iuRyAZO8
         LrtSEstcL2w+lvwzcNVDcpEOTExiC5Fe9dZcTXV/bPegCv9AD9RhJUNgbArW29mP+uo+
         VHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679327336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OdWVdTE/8Dyw4hqegkINdb1CQZwRDCkTAUWJC3MHmmA=;
        b=7xTV596FMdOGp969uZEkxkJP+JjBk1vTq9mqUlaO4dNyfuh/WLc+XeFoGyqpjsUIMd
         3LmU1g+vYtiVck9HNKU/iqWZIS0xTRGkC5WA2NmI7uWILv3ofTt5VOimbRzn4T26tCWv
         nJjtNNBeLEdbhCbgWq0khbbFIkqHdlkrqt+VyDsc4lM+yyPuIl4Jw/sHO5+dlVgNuzIR
         smcuL9AGEVgeLmG2QirHe4BxevPYMyN2w/JOG8QZOr9gzgK17ByPYQNNbmRHhO3Hl9L1
         Uh3I7sKQHA1o/+3+7hA1/LYUvcHV9YFy3NgJCGJx6afdZpruV5sWf2Q5CBs6kt3+uZM5
         xfuA==
X-Gm-Message-State: AO0yUKXbY2/ToKSReDY83eoRFRcDHCVdvmLAGzMQEk8pxBOeUw/zGUUB
        S3M7z09dAVC38Smvi1oYWwz5cg==
X-Google-Smtp-Source: AK7set9E67ofym2tdvwZKNWb7xackDONhnSE74H9a20p2Ud3bmZk/yDap+TexwNKGRarhLayPEkGxw==
X-Received: by 2002:a5d:448c:0:b0:2d0:bba8:3901 with SMTP id j12-20020a5d448c000000b002d0bba83901mr13538417wrq.62.1679327336593;
        Mon, 20 Mar 2023 08:48:56 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d7d9:4f38:38b4:82b4])
        by smtp.gmail.com with ESMTPSA id o6-20020adfeac6000000b002c71a32394dsm9202578wrn.64.2023.03.20.08.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 08:48:56 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 06/15] dt-bindings: mfd: qcom,spmi-pmic: add compatible for pmm8654au
Date:   Mon, 20 Mar 2023 16:48:32 +0100
Message-Id: <20230320154841.327908-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230320154841.327908-1-brgl@bgdev.pl>
References: <20230320154841.327908-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

PMM8654au is the SPMI PMIC variant used on sa8775p-ride. Add a compatible
for it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Lee Jones <lee@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 975c30aad23c..0f7dd7ac9630 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -79,6 +79,7 @@ properties:
           - qcom,pmk8350
           - qcom,pmk8550
           - qcom,pmm8155au
+          - qcom,pmm8654au
           - qcom,pmp8074
           - qcom,pmr735a
           - qcom,pmr735b
-- 
2.37.2

