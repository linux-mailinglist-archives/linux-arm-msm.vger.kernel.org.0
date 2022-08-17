Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE7A597258
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 17:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240620AbiHQPAC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 11:00:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240624AbiHQO7f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 10:59:35 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCBEB9C8DF
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 07:59:25 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id o2so19367032lfb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 07:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=ANavTHdhnB5H/zimGyX1UGPrp6R0+SdK4bVct34NTMU=;
        b=V+g0+ED9MwDtJibWWYJqlh4m242iKsb8y9YinUV4Oa2+UriGLh/DZ07CGBU5SQT8vQ
         VsKe+GzAJeSO9gtTXexsaXShhB9kY+OJ7yD/DDCdxz3j1NOLlMnDA1/mvPV7meIvyljV
         XPMeYYgHbM9/HAnS/1sOl2zCdFmukOFNRwQN/ly7CprzbDFhrGmWPPNJaTTYbY8/K4C+
         1jFSLqvFtVSr8Z9dGfKHUyyc2NsnZeJkn8hD7oVrKuIxzZJeXD53ee2oo9Tawlgj62Me
         cei3oPHNMTUa2qVeb7TN5pNcxKTJKS2tfaX6qPMUMqzN0GUtJTbiNW3FdSnWdKdtx+3I
         QWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=ANavTHdhnB5H/zimGyX1UGPrp6R0+SdK4bVct34NTMU=;
        b=LXi+gA4mhajqGifa4dAUvLFuxK2QCHqIQ113MZ53XO6wW6TaRvLIAacgeexw0d1uDW
         imLh3HjT30bUrfhIuVNT4K1a4vmrnnHaRuTnK6yA5Ud7NaIgX7V3hhOzNp/2lF/igwHw
         kOogDlnKRqJtndsJt+G0yXjLyOuMHaVp1yfBAkPjq5ao8xrde4aO7N+qfIWVZYOHO8iq
         rZnA2VEKDSJYr4ph8Dy2GiDtgfwxpW0Uap4YP3hTmby1wblUc+GMKsrHQmG5HJsOCdyM
         vxRLafoOIN7QF9W9E42f930aZ2wnlbJ+9EBFzzJgkImIOc/QeIAElWmmqXsGtSd2uEec
         VIzg==
X-Gm-Message-State: ACgBeo3EiKVQ1xmlzP1GwrZzUWdxs8FmLa/OlN5tLs4/VTccz0HU5OWn
        b9yaunvpVRvkQSQnxixjA33xEw==
X-Google-Smtp-Source: AA6agR6PzUNjcLDCTtu9OaHGdNag+EHgbRCnoccmPfcY7h6GOYEQQ06FKNYGgkFXqEs1xPtTzbN8cg==
X-Received: by 2002:a05:6512:2349:b0:48c:ee14:7fc with SMTP id p9-20020a056512234900b0048cee1407fcmr8974141lfu.71.1660748360267;
        Wed, 17 Aug 2022 07:59:20 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id u16-20020a05651c131000b0025fdf9eec1dsm2250454lja.111.2022.08.17.07.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 07:59:19 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH v2 08/17] arm64: dts: qcom: msm8953: add missing TCSR syscon compatible
Date:   Wed, 17 Aug 2022 17:58:52 +0300
Message-Id: <20220817145901.865977-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817145901.865977-1-krzysztof.kozlowski@linaro.org>
References: <20220817145901.865977-1-krzysztof.kozlowski@linaro.org>
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

TCSR syscon node should come with dedicated compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 8416a45ca4fd..ed05897d33f1 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -722,7 +722,7 @@ tcsr: syscon@1937000 {
 		};
 
 		tcsr_phy_clk_scheme_sel: syscon@193f044 {
-			compatible = "syscon";
+			compatible = "qcom,tcsr-msm8953", "syscon";
 			reg = <0x193f044 0x4>;
 		};
 
-- 
2.34.1

