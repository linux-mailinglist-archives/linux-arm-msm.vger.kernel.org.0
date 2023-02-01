Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 456A1686AB0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Feb 2023 16:51:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232428AbjBAPvS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Feb 2023 10:51:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232346AbjBAPvR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Feb 2023 10:51:17 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D9C23800E
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Feb 2023 07:51:14 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id q5so17785315wrv.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Feb 2023 07:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAA7Ke5DBl8xbt1zInP+vTJBK9tUzjj+nLzA4OXjzeA=;
        b=x4+Loh1wGoN1ag35UjGi6WlZsCVvudk5LhBfZUF+a501Y5ByNUKKSe2iZuctkotJjF
         Wc7JYF41jpKnJ5Vy+n190LR3QdX8dUkLDn1QUAy+Q7PtRFdXGELDAd8BeydzobGHrtJL
         2giAiOHj0iQcR6Fu2HSXNPqXH3LOQOLDLtkQ20AhxtZ8MqMaBXCnD5hpQBFzewesP5Cy
         IbYhQrILr9WLSNE2m6vrvNvNYcFbTkjYvtWkpBl1ZcQjyMYbBY2GJXh1QMKZX67+UIVp
         FHjIErRcoqkiFVKM7A0dak30zuJQhNTeZVKFi4TKW3RaiPUTFxLlFIxP1YprRSZiYgAP
         GGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MAA7Ke5DBl8xbt1zInP+vTJBK9tUzjj+nLzA4OXjzeA=;
        b=T28WGsMz9wbVEpdCeB0Uat7dWzQzMriznKVdTJXwU3Z5Rwclqioh9a9G79/6nhWj3W
         a2lC5PidPH7A9qTdNQJeKAouYWelHOnvTyXbWV0KJo2fc/tJH6Rz0FvKkF76QOytjG9B
         yxKIc91jxTOFmssEyYkMAKf4vB2b7IPyIctcZwk2zkLqL29yn5DleK6x6FneQbvizW6N
         m2nwnxvFS7ocVRBbTyw/ziZ7ryU+NqqZIY32TMGOnkHAdWCKQ1Zuk4WrncmB1ErMvcmt
         M3WX5kp3yxj3BIyJS6JNV+0fRmGNGDOfC1dbbgzNhsy3SJO5h38vgPW7YOjumruYLvQ7
         SIlQ==
X-Gm-Message-State: AO0yUKX8GHocNJr3eKTUWLmZSNpuEBEbTqbeaT35WCMhWYmoWRUEcgPy
        mrHoEdTkuGHegSWgqKChjhvRvQ==
X-Google-Smtp-Source: AK7set8u+U+y8DzkfCnwkrmVXEsJfIr6RHXYLvAI9b8OP8BOLgSnc/kK2Su0i3vPCxm0weXI5iHiDw==
X-Received: by 2002:a05:6000:10c5:b0:242:1b0d:9c58 with SMTP id b5-20020a05600010c500b002421b0d9c58mr2417690wrx.69.1675266672598;
        Wed, 01 Feb 2023 07:51:12 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t1-20020adfe441000000b002bfd524255esm14816189wrm.43.2023.02.01.07.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 07:51:12 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 01/14] ARM: dts: qcom: sdx55: correct TLMM gpio-ranges
Date:   Wed,  1 Feb 2023 16:50:52 +0100
Message-Id: <20230201155105.282708-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201155105.282708-1-krzysztof.kozlowski@linaro.org>
References: <20230201155105.282708-1-krzysztof.kozlowski@linaro.org>
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

Correct the number of GPIOs in TLMM pin controller.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index a9433d1e4f54..f1553e1e40db 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -560,7 +560,7 @@ tlmm: pinctrl@f100000 {
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			gpio-ranges = <&tlmm 0 0 109>;
+			gpio-ranges = <&tlmm 0 0 108>;
 		};
 
 		sram@1468f000 {
-- 
2.34.1

