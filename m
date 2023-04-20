Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 130436E8A77
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 08:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233948AbjDTGgX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 02:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233945AbjDTGgU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 02:36:20 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F079446B8
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 23:36:17 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5066ce4f725so541409a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 23:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681972576; x=1684564576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbEmKfVYY8C8sMjL/DQ/gdFG3u/uYvGT8W0gHSHLPto=;
        b=GCAfm1cyBiYWdqlkXFclWG9u8VJtCU1aaaS1jCLA+C1aObfqqz0T+ChaYxRAGxdw9U
         MGmb2bOa1lVoD9XrTrRrOyqH/p9J3EolFW9OjupRnTzKC2zxxb4/bIyYb1Ti0jQgz2Ie
         CflcqWtsjTBJ/lBRconpaiWdqT14tGLmfYFiaNC3nBRrezDDOk8IvV8lNf/7Gp9sCwPo
         nupi9hVPlPOXiWv+ymR/94ikzLG7FH5TivLZUlrC9Q2hPyVvTsdTJ70F2GAVNkSHbYmW
         ds6uzeHyHTOGmigOF//b2QWHJeseNjryudSH7m44yY9lUyw3woWsyq4BmsGlkrCYRbW+
         sKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681972576; x=1684564576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbEmKfVYY8C8sMjL/DQ/gdFG3u/uYvGT8W0gHSHLPto=;
        b=kMWXbCVzGn6/ff4lBHOT4Jsrzr5vN1K5ebyeHTbGrPVAPahQLUiusnPsRrz0wA2MFa
         RPYNMbWZS+ZP9+TcFb6PgyJtUjtvY0M1aYgmXBhrSDdbZj/TfuaxunR3AzYOos/aRAJ7
         bsdW7Pr9H2wt24PYCeAPAbFHa8jfGi51MHi8Ka+ySDR6JNUbxwPddLjGLmdjrkr8cnGt
         YsDl9D45rDuQEDN9mMiYBIc4koc+EdIIzWgiuTS7S3Kk0UvGqCcezqxx6R7d1V7FdKv4
         d0WFxiy5OAU3/UOQl0KwyeLRLuH1RMlrwBD4ZyBQ9OguBZwVxSayAtPoAt4ZxyZUwLRz
         atIg==
X-Gm-Message-State: AAQBX9fpjRH3ObYliskVJpvsGVhk5bmH6mdgdhKlyh9JI4NWIYYr53Ut
        0FHcYzMdt1lX6wcDVoMiw5p2Kw==
X-Google-Smtp-Source: AKy350YZ82raRIzUrhhnIOg0JaAXUWzLEKzuTYsji+cOOuYLa0g+8x6W7ka1kt296eXNrwjd37XA5g==
X-Received: by 2002:a05:6402:5170:b0:504:b323:fdf1 with SMTP id d16-20020a056402517000b00504b323fdf1mr803762ede.21.1681972576441;
        Wed, 19 Apr 2023 23:36:16 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id f7-20020a05640214c700b004fa380a14e7sm395342edx.77.2023.04.19.23.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 23:36:15 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/7] arm64: dts: qcom: msm8994: add unit address to soc node
Date:   Thu, 20 Apr 2023 08:36:06 +0200
Message-Id: <20230420063610.11068-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420063610.11068-1-krzysztof.kozlowski@linaro.org>
References: <20230420063610.11068-1-krzysztof.kozlowski@linaro.org>
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

"soc" node is supposed to have unit address:

  Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 4041f3a690fe..184bdde5c78d 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -340,8 +340,7 @@ modem_smp2p_in: slave-kernel {
 		};
 	};
 
-	soc: soc {
-
+	soc: soc@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0 0 0xffffffff>;
-- 
2.34.1

