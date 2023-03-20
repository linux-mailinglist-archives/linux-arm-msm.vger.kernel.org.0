Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4588A6C1A84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 16:58:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231398AbjCTP57 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 11:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231745AbjCTP5c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 11:57:32 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BAEB38654
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 08:49:01 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id m2so10817063wrh.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 08:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679327334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQr/OUg3XddVb1DIA1hszXHQGXx64+DAC9AKsawwCi0=;
        b=gbu7wnyZ1SMWjQkKZ9UlUaFuhu6gvYQY3R3aitHzbK2C7yOjgrGprYwoex8URZunTM
         eckEYo/fotUblWFgg/QGGXyqu/jf3K8WYt6cVmOHnv0TI8x1bv5SRgOeAWa2XV8/3AZ8
         E3mdhaTAqjiETh/P35Tkj5E4F5UStDVw8DrqUa0T4i5qwnWCxwe8A5u765MFj6oUkpBu
         HcSujLr3VniVMW5dc6nZ6s+DKTUcNjzOYqUyh2PLvHXugCYjaPPWJA+OvqOCewu7QPoV
         HqIGhHgQdNYPOqo9HR2uJwsPbHcMYa/m95UU8u68epK8/2qxqWMFT5zHISo3JVS1mM3k
         QOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679327334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQr/OUg3XddVb1DIA1hszXHQGXx64+DAC9AKsawwCi0=;
        b=wbv3/TZbMyF8iiH5NOgGLRyXbr8IOTMvHcXJX0j0tiE8wG1aHE04xtwAN76E7UusH4
         2JmtdFT9bYzmo8PRMjFcEBxgVS5O+nDE5CSawrKfG8INW9Pq8H0u+De687EmlGBe3GKz
         WQK4+sSU0bTbmhTb2HFLrFexNOfUhOM8gDXul/+DFMMC1gWuT/8BiFs7S92+ADfhb2In
         BwjPtjuVPL06eEHUh4R/ne+czFub55eKvM0BfogYilRNIV8sNTxql8msWhK19JHHN5Fc
         2lVHYeAV9ZfqMYe/Zf/8L5UZ16ci87QB3rGwn9mWSiF5kqpofwj/CcRKVFBjNLDdrdZ5
         EZVg==
X-Gm-Message-State: AO0yUKWIy3mD2V3LWaAhst5W7gh44fEEjToZ07+KWdb/JcqW/fH7ZyMr
        v9CkdXnvn0FqQUQ5JtUB8QKcyw==
X-Google-Smtp-Source: AK7set89ybRH+53v7phmMdibqdCHdLP3lqCNFkZoXdTE2UZkK3YMwBan2/1sIbpER1dZbzz8/lRe1A==
X-Received: by 2002:adf:de10:0:b0:2cf:ea38:ef29 with SMTP id b16-20020adfde10000000b002cfea38ef29mr14344325wrm.44.1679327334698;
        Mon, 20 Mar 2023 08:48:54 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d7d9:4f38:38b4:82b4])
        by smtp.gmail.com with ESMTPSA id o6-20020adfeac6000000b002c71a32394dsm9202578wrn.64.2023.03.20.08.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 08:48:54 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 04/15] arm64: dts: qcom: sa8775p: add the pdc node
Date:   Mon, 20 Mar 2023 16:48:30 +0100
Message-Id: <20230320154841.327908-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230320154841.327908-1-brgl@bgdev.pl>
References: <20230320154841.327908-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the Power Domain Controller node for SA8775p.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 41 +++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 296ba69b81ab..797af99227e4 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -591,6 +591,47 @@ tcsr_mutex: hwlock@1f40000 {
 			#hwlock-cells = <1>;
 		};
 
+		pdc: interrupt-controller@b220000 {
+			compatible = "qcom,sa8775p-pdc", "qcom,pdc";
+			reg = <0x0 0x0b220000 0x0 0x30000>,
+			      <0x0 0x17c000f0 0x0 0x64>;
+			qcom,pdc-ranges = <0 480 40>,
+					  <40 140 14>,
+					  <54 263 1>,
+					  <55 306 4>,
+					  <59 312 3>,
+					  <62 374 2>,
+					  <64 434 2>,
+					  <66 438 2>,
+					  <70 520 1>,
+					  <73 523 1>,
+					  <118 568 6>,
+					  <124 609 3>,
+					  <159 638 1>,
+					  <160 720 3>,
+					  <169 728 30>,
+					  <199 416 2>,
+					  <201 449 1>,
+					  <202 89 1>,
+					  <203 451 1>,
+					  <204 462 1>,
+					  <205 264 1>,
+					  <206 579 1>,
+					  <207 653 1>,
+					  <208 656 1>,
+					  <209 659 1>,
+					  <210 122 1>,
+					  <211 699 1>,
+					  <212 705 1>,
+					  <213 450 1>,
+					  <214 643 2>,
+					  <216 646 5>,
+					  <221 390 5>;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+		};
+
 		tlmm: pinctrl@f000000 {
 			compatible = "qcom,sa8775p-tlmm";
 			reg = <0x0 0x0f000000 0x0 0x1000000>;
-- 
2.37.2

