Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 683E568D9ED
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 14:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232403AbjBGN5M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 08:57:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232289AbjBGN4p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 08:56:45 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ECD138EB6
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 05:56:18 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id hn2-20020a05600ca38200b003dc5cb96d46so13216268wmb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 05:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kE+AxQUwOxA1DoNBo9L3Bq1W/VtJeoaV/fW1FjliOjc=;
        b=AXNPNIpXWGRFXmVvnNyBaX3EUaHtz5imfr2Kc2AD4XzXrTayE70iIYQFWo7gi7/vaB
         ZuplajGB2GW4JSSMA8hYQJbJBf7pUSzb5+ilXMwY1WYl+jqm4LFvl6CZiiAdFXVnXXZ2
         A+GCL3cp9W2GviQruhIqWMioQ2m1ATFWr3lVbhHBxoFDY4FJyAcmiDapk/5xyzOGsvOK
         xIX16EfERwN9r/GBHDjTum7EHzk5vbYPi/SaOPlTRSFlxmHkLhYU6dJMYN2z9UTicq30
         Vr1zsArjd0KRjatg1r9i9WKhNoAYpPlnmLoMOHr4wZT+UfigRJsrDGC6II8wGPWDIAHf
         QihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kE+AxQUwOxA1DoNBo9L3Bq1W/VtJeoaV/fW1FjliOjc=;
        b=GKwdB5ZSuMnaq17N2krwe47M5pXOSZR/8SWGp6EwM3fMmp6ueew/YzeNUhl8pRWQfh
         F3Ho2qeKj85G59JU0b5GDXCW+fP536Ly7/20EOn3lE86aRzz97sInyB2yjKFbxc+wJva
         N5rt4l9TBBJwuCmMwrILtA81SOqi++sobyeQCtc/SADG9jv6IJcP3wAYc6hseDMeHXjQ
         CapGcAdtHMNEik45AifclgEicCectK1i5soEIYcnxt4YLoejzqgapvYnqSV/lE7yVRu/
         C0ANl7xGbiQzPbbZPiqfKYnFR8wdgMiJrcuejvVlmC70uOVBZoTd7AYg4H+BGZCXZFwU
         kIIw==
X-Gm-Message-State: AO0yUKU/byVUsD1ZZkVvUEQYpV8gziZYIcA7ODygAIDcy5qjtqFudvhM
        82EDoVGQ3ceZjTxUJ46v04coUg==
X-Google-Smtp-Source: AK7set/0VFvjfWv6VFXsQD+RR8iooJZ7MrlzClaN0ljfreU4ICsHnB9bcDH781X3XLtXeWSkncAZnA==
X-Received: by 2002:a05:600c:4b1b:b0:3d9:f836:3728 with SMTP id i27-20020a05600c4b1b00b003d9f8363728mr3209658wmp.11.1675778163004;
        Tue, 07 Feb 2023 05:56:03 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id p10-20020a5d59aa000000b002be5401ef5fsm11611312wrr.39.2023.02.07.05.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 05:56:02 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 6/7] arm64: dts: qcom: pm8550b: Add eUSB2 repeater node
Date:   Tue,  7 Feb 2023 15:55:50 +0200
Message-Id: <20230207135551.1418637-7-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207135551.1418637-1-abel.vesa@linaro.org>
References: <20230207135551.1418637-1-abel.vesa@linaro.org>
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

From: Neil Armstrong <neil.armstrong@linaro.org>

Add nodes for the eUSB2 repeater found on the pm8550b SPMI PMIC.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

The v3 (rfc) is here:
https://lore.kernel.org/all/20230202133816.4026990-7-abel.vesa@linaro.org/

Changes since v3:
 * none

 arch/arm64/boot/dts/qcom/pm8550b.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8550b.dtsi b/arch/arm64/boot/dts/qcom/pm8550b.dtsi
index 16bcfb64d735..72609f31c890 100644
--- a/arch/arm64/boot/dts/qcom/pm8550b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550b.dtsi
@@ -55,5 +55,11 @@ pm8550b_gpios: gpio@8800 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		pm8550b_eusb2_repeater: phy@fd00 {
+			compatible = "qcom,pm8550b-eusb2-repeater";
+			reg = <0xfd00>;
+			#phy-cells = <0>;
+		};
 	};
 };
-- 
2.34.1

