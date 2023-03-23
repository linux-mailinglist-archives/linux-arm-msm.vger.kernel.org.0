Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7F816C7423
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 00:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230486AbjCWXhu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 19:37:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231307AbjCWXht (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 19:37:49 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 453602CFD5
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 16:37:43 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id k37so96376lfv.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 16:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679614661; x=1682206661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+68XLJlMQiAJbakqRYHZICNWbFaukDSRyNz+AoqyBhw=;
        b=jwmACRoXnboV8q9fE1FsAs64uaJ8smLtrZqQzpO/wvqpYjZXxbWBt0OJ4DsnwkBl4Y
         FQTf7+HtVg89pt8FphOn9g4qXRFO2H5SD5Xah7haJ+rtINEKDr1WlZ2+pwbWTtXSiviK
         osxRuXfifA7VE0PSjbI7O2cb9exD/OSccJGM9Mh/1p/kxx5Ao867U8+dz7brsDv2mmGu
         RuAb//MM5UQXWFUIy5x92PnHujdKhuaHhB3mCn2Hj+pRp1aOMSliX539/xskdLkSp77O
         ob14kW445A4/ifPfG1ashvyOD6+595A6MDYaFXsvq1dpHJUrXElJGsEeI63h9aQHynvo
         TuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679614661; x=1682206661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+68XLJlMQiAJbakqRYHZICNWbFaukDSRyNz+AoqyBhw=;
        b=claaKBZ+UuyPHyj5AWMymnyHVI5Otl5zvtT/SI253kV9Lwnl63PPYS5gKQ3wA6Kof1
         ulkcvHhMPyEVcuC/7pzvY4Yc7rgqSVnmh999nGt76KAQNZra408H/m8hxipgUpU9lDL9
         fWzVlB5oaekS1tLQjHhOQ7dnvPff7RNNFRp4fOIw8O/o6YghFNm4+Ou2Nce+UTTcFNqT
         LdngA+reFIHG1Qf5AsGS16B8RNbgoliC16/q6GRHUlEWwux5oS/HNs4q/q6SgbK2uMP+
         PoEhbj3OsPu4WgiLvK/We50Z2qt3pjhIpLcHPE9iDoFuaj4BvuDLYIJAkHSTbHh7dH6y
         a8dQ==
X-Gm-Message-State: AAQBX9ev4GiGTvNg4kf0LGd4JggTVQqfnMTLSzDMeocvzOu6G783Epje
        D0BbPrWOf2+h3aXytFIsrS3X2Q==
X-Google-Smtp-Source: AKy350YXac/3/X8FMo8O7mW1GeLbcm/v9GdqyH6QFB6ytxYCPNSFRDArkX8Zfsx9jQ61znnXi5zAZg==
X-Received: by 2002:ac2:4184:0:b0:4e9:d613:503e with SMTP id z4-20020ac24184000000b004e9d613503emr88592lfh.6.1679614661484;
        Thu, 23 Mar 2023 16:37:41 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id w9-20020ac254a9000000b004e845b49d81sm3105264lfk.140.2023.03.23.16.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 16:37:40 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/5] arm64: dts: qcom: msm8996: update QCE compatible according to a new scheme
Date:   Fri, 24 Mar 2023 01:37:32 +0200
Message-Id: <20230323233735.2131020-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230323233735.2131020-1-vladimir.zapolskiy@linaro.org>
References: <20230323233735.2131020-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the old deprecated compatible name of QCE IP on MSM8996 to new ones
based on SoC name.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 4661a556772e..2ee28f9b6229 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -784,7 +784,7 @@ cryptobam: dma-controller@644000 {
 		};
 
 		crypto: crypto@67a000 {
-			compatible = "qcom,crypto-v5.4";
+			compatible = "qcom,msm8996-qce", "qcom,ipq4019-qce", "qcom,qce";
 			reg = <0x0067a000 0x6000>;
 			clocks = <&gcc GCC_CE1_AHB_CLK>,
 				 <&gcc GCC_CE1_AXI_CLK>,
-- 
2.33.0

