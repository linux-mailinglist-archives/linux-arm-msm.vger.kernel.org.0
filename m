Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAA105FDDB6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Oct 2022 17:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbiJMP42 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Oct 2022 11:56:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbiJMP40 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Oct 2022 11:56:26 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B11DDAC53
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Oct 2022 08:56:25 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id df9so1528570qvb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Oct 2022 08:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=peBZ+o0SLeYqd+DX9yqHCLT12xT6rkAjixZ0RNiZfhk=;
        b=gDCuiFor8HhpbWp9fp3uVoGYcrxvCuN30wL3ycpmtQUhgOfaKOHfQAfWRFQQvOjXRD
         s2HaYMgTL9/mXuok+k2EVgRwDTohpx5U4qSC/4ZtacdmJf4x8/wcprMXcH8I6e1N19A3
         yuchYZfusaAiKjfw400t9C1NEm25tcpaZfI+YAijRONZBFq1u7CfuJXonKHmO5Qg3P4S
         7LG4LUL0ew63UGj9EfwOeKKuAKKx4GFvImk/ZzGw8NtfPYiFm5tiBq0H/talcKb1ESD1
         alKCkoDemzduw+Y90xJRgzNqAzY2mGl1sk8fK2cFnA4jYjuyPrkhAyQQw2j7dCSlDATs
         0X4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=peBZ+o0SLeYqd+DX9yqHCLT12xT6rkAjixZ0RNiZfhk=;
        b=4TWqoOygf/kNE/XZ8KSSMCmx021XqTix0DbCrXrpGUHNpP6+j6X8TVy4Sc8nSBC9xG
         eULjXeAZ+7ILaca5VgUO68P4nax4pWS49olDqb8afpgrR2D9ru+BfZ/tKeSjZebGoE5e
         88gBEI0orWUEJCqcqdOtB7lvsRTIfuJb5iaVQg+87f9zf5xwDWPRa/QLXR4iFj+mI+Yt
         71Zv1vxDHQO2sP96vaENh036DcUGDRQvU0TXS7ldROYbCM6s+i4I/+caVa7mhw6+rGuC
         PPEARHUQYY7+8R28vdIr20+rHPnBM0ev287CvqEiQ6lIvx1TGWoReiAZy7fJvQ2XoFGL
         mNAA==
X-Gm-Message-State: ACrzQf0T0ZudqfLO8ltkWMxKC7T/dHW1si0VikNsk9l1lfW5emo7zCWX
        GGiTt7+vuCT7fmdUtUDKs3lP1fUqfSiQIg==
X-Google-Smtp-Source: AMsMyM4XRJrleKDViEuaZRBXI1jBxAocsRDssr0ijqLzj3jQlNSUTePImEmO8W2wY2lZWQg2nXW4cw==
X-Received: by 2002:a0c:e552:0:b0:4b1:86f0:89d5 with SMTP id n18-20020a0ce552000000b004b186f089d5mr456508qvm.97.1665676584224;
        Thu, 13 Oct 2022 08:56:24 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id u6-20020a05620a0c4600b006cec8001bf4sm65280qki.26.2022.10.13.08.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 08:56:23 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/4] ARM: dts: qcom: ipq4018-ap120c-ac: Add SoC compatible
Date:   Thu, 13 Oct 2022 11:54:17 -0400
Message-Id: <20221013155418.47577-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221013155418.47577-1-krzysztof.kozlowski@linaro.org>
References: <20221013155418.47577-1-krzysztof.kozlowski@linaro.org>
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

Add qcom,ipq4018 compatible fallback for the SoC.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi b/arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi
index af9a26fb5d4a..a5a6f3ebb274 100644
--- a/arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi
@@ -6,7 +6,7 @@
 
 / {
 	model = "ALFA Network AP120C-AC";
-	compatible = "alfa-network,ap120c-ac";
+	compatible = "alfa-network,ap120c-ac", "qcom,ipq4018";
 
 	keys {
 		compatible = "gpio-keys";
-- 
2.34.1

