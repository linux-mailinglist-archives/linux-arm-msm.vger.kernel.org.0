Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC156AB80D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 09:14:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbjCFIOj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 03:14:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbjCFIOh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 03:14:37 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98D7FCA1C
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 00:14:35 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id x3so34808850edb.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 00:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678090474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WhF4KrFqcJbSMrArGhXZMWlMUJL2MSMmf8H2b4xo83M=;
        b=mZK+vEoyK3I5nbgQgsSWGv+ACXKR6Z7N+SPuspO5t7qs7iQV/Xc3bl6Qeb9ENbab02
         WFYLlDTabX46bHOvNAEqz1JOc0KGRhCz8ene/N3HObvBW568N0uFYRs1y/YjWPt2AcTi
         /PCPGhXRHmTlbIek6lvg4CPWRpEaPvXX4qdK6e2l5Xzxj2iCb5/+ThgxDEawdv4rv2ux
         EyJhNBTzlyOXNsqSPFUfHaD5PMTYcD3o0jj9dlQM/PiPfM0uu5hiItZgZbML6dKP6Ky8
         WGIOHJQzhP/VfHYxlL71DRpNVZgrzhMwxabj2t0xgfdX9sJGb1FpIJ2G91Zkl7APCCMe
         +XfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678090474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WhF4KrFqcJbSMrArGhXZMWlMUJL2MSMmf8H2b4xo83M=;
        b=uJC/aVvXAr+e55AWeajN43fDcxXGMthyqM+c7aOVAzT2exZDGPWNI8uqGhm8nVIMgM
         pdrkgiHbkPrHNbDBEHDj6V6VyPaxf4QiZBrg4Bnm0GWPog5IrU0v2hIL/nQdi96iaObZ
         mBtQP3XdZ31Uu+lHnlxmVyqFbHI2BLdUi0V7RkH7Nic+6PX0pa9lUd2YkDzw5hF+RwGK
         O9c2VEkrGRFbAUgmChc9NJ9sPVfaCLPFX7PWe81DDn28/L/xJF99YvWWGUCr7B4OHMK0
         nHqt7NTQu0LUY1pVARmSrtfr4d8jySYmqRYc9nqYOp73G9G7uyOqDZoQu53OrdtvX7pZ
         mGtA==
X-Gm-Message-State: AO0yUKUFTn4gN1oqZ8GmVUqOcJz5FthYlCA+4lx6/+xDWjLhrmQZn5Io
        6MH0RyDAba9RlVCRJdMYuBv8Ug==
X-Google-Smtp-Source: AK7set+ccUGm/ekxar8jrwtdBdELFL4w2l8bZ9DCMJYVXL/cxUrmymd0+x67ZSd/62MNhKq1mn1+lQ==
X-Received: by 2002:aa7:d683:0:b0:4ac:bbb4:9772 with SMTP id d3-20020aa7d683000000b004acbbb49772mr6410131edr.40.1678090474133;
        Mon, 06 Mar 2023 00:14:34 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d85d:5a4b:9830:fcfe])
        by smtp.gmail.com with ESMTPSA id w26-20020a1709064a1a00b008c1952b63d8sm4247615eju.137.2023.03.06.00.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 00:14:33 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: qcom: sdm845-db845c: drop empty node override
Date:   Mon,  6 Mar 2023 09:14:29 +0100
Message-Id: <20230306081430.28491-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Drop empty override of pm8998_gpios.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index acd4f9ca6c09..e14fe9bbb386 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1135,10 +1135,6 @@ &qup_uart9_tx {
 	bias-disable;
 };
 
-&pm8998_gpios {
-
-};
-
 /* PINCTRL - additions to nodes defined in sdm845.dtsi */
 &qup_spi0_default {
 	drive-strength = <6>;
-- 
2.34.1

