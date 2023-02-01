Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEB14686ABA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Feb 2023 16:51:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232625AbjBAPvZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Feb 2023 10:51:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232013AbjBAPvT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Feb 2023 10:51:19 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A62274A44
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Feb 2023 07:51:18 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so1810303wms.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Feb 2023 07:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMayUmmba9KYG+i8dE2CJlCXDJ8HbBF08mFXCsuITS0=;
        b=rZtGFoizKSwUZ9FVMK/clKBuLS0IGmgrHQiHtRtM+f4SegZWrf22yKraaMGJQAkPiw
         X7HvOEJZXHghm41bzksL4D82f70MdzJz+I5RpIwBOLeHqV6jxxNj0S7YQ+gWLP1JrbX/
         iSl/+HSo3NGVrR96DrrHaiHt9VVepf246GczTVsEEGeX/AC4/m+s+sQB6+9mlmsEbPGZ
         A5s9dIeV+2jH6A2ZGFJKqhFuQ1QPhX9wBDPU7SS7F6M3iG4XcWIxoCpz0mcddlsgxKMB
         FkyMgVsh1dd33fxPW1oouQDKPjtQ2J3L/w+oOcL3E9zJMDfq0o+/s612KZvUyz01bHii
         WX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMayUmmba9KYG+i8dE2CJlCXDJ8HbBF08mFXCsuITS0=;
        b=n/6csKuEgudkeHt9koVXEMEKqZtNuOfO/uuNPl38bsHibNBm6UJwYk1zWVokcVSQdL
         2UN3YbuOGk3CCS+1pwiFw/gA3g4mowSnZouzARlzNOhLO4o2ZD4Vjaas6hgCwGcQGw8f
         YBHJ4yUiwLVVQz+4iB88ri0utm6TOA7fwQ6kOorFj7m30q+wW8Tyzs925PdDgIrQC4xD
         wQv1tWvrpnBXo4LVzctugBA7NWEOEOA/2mRcdcYD4B4fdfsCLIxL9CyqDzCOrVdOO1RG
         RcNsC99M4DNTDw2KIKHyYX36arENCtuR5X56tXsMnDOyQDEAYIGZ/fApW2X+z30j9Dl4
         c5lQ==
X-Gm-Message-State: AO0yUKWIEy5xh0mEf/5hM6T1/VJCO/QvOzHle9US6LhmcHEYhudxL5E6
        jOykcx0VQDdHfI0r0kw4XoJzpA==
X-Google-Smtp-Source: AK7set9zdN0dGCeLkmPGtM4TGGOeQTr5TLpK+bslYlhyAYDWScagBz0sSPktIS+nIErb9K8mCe3U3A==
X-Received: by 2002:a05:600c:1c12:b0:3dc:5a9f:1c7a with SMTP id j18-20020a05600c1c1200b003dc5a9f1c7amr2380623wms.30.1675266678113;
        Wed, 01 Feb 2023 07:51:18 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t1-20020adfe441000000b002bfd524255esm14816189wrm.43.2023.02.01.07.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 07:51:17 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 06/14] arm64: dts: qcom: sdm670: correct TLMM gpio-ranges
Date:   Wed,  1 Feb 2023 16:50:57 +0100
Message-Id: <20230201155105.282708-7-krzysztof.kozlowski@linaro.org>
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
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index ec9946e5f08d..b4c2b6dc1574 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -796,7 +796,7 @@ tlmm: pinctrl@3400000 {
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			gpio-ranges = <&tlmm 0 0 151>;
+			gpio-ranges = <&tlmm 0 0 150>;
 
 			qup_i2c0_default: qup-i2c0-default-state {
 				pins = "gpio0", "gpio1";
-- 
2.34.1

