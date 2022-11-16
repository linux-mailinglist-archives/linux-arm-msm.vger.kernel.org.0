Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 043DD62BF65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 14:27:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233010AbiKPN1U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 08:27:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231927AbiKPN1S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 08:27:18 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D717D10FD8
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 05:27:16 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id k8so29937801wrh.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 05:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBRqWnCeQXInJiVIgel6GnGGi/k91jgap3VPQWddO6c=;
        b=hbos4SMALGfn+HhAolqrMFSmMt4LinBrAODNq7G5MeG/aM1mCi1IpmtNJpYdkxbcyn
         Ndt3tcZyFAexSG6rnsUSAX3sUH3xXiQNp7S0/DXKoxBXbVhkqOsc2dHCxd13IPnm2l6q
         KZwetd52afKGON+kv1BglKOhrxQiCoFWU54aRXh7Hff1Xv0nXBckvVp2CLrF/Ebbbz1n
         rXolLOsdjtXUIUH9nHgaFgE9U1x/tfCMSjRlRQPsd7fQ9YxXfIh1kEujRQIU0bP2KEWo
         j1exyR8wmrNBBGs8+aqMzaFL31fhuNVMeNGHkViAxI1z79qH5bHAcYgqRSD8Fb5oOdWP
         7yBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mBRqWnCeQXInJiVIgel6GnGGi/k91jgap3VPQWddO6c=;
        b=jYfVSA3g970WRycaAtOPwCKFa8n4Iavl8e0kp8jVU3Azn2tKWWQXp5fXBxdAh4m04S
         dcOHS8Z68IkX41tX7yJ3Mp2fNqZvpWqVAJZqJ1ch+ZTs9K8nUtyNdihytpgDfc+dCvZA
         yCxLSxb45JKBDjRDKpGPn/oZvBlFN5mWSWHG7Wz0LxRTyk0k/Z27NeSkuz5nf20Q1aqJ
         cxbu4hlSwAAbe+CIVNpqDmEnDLu8FKZ8DMQGY9lyZoCpy7XMBk70IWT65sFPJaCRIf5C
         H6NiP4oK4fYSRCUsbXv6rowdIj58rkO9RIcPynHNMRJeE01EbdNungClv6Su2PLYPaZ7
         Vwwg==
X-Gm-Message-State: ANoB5pk9C/0Z5pdfPErDuEB9h9mef/xqGV8lKSmFpUCv7X+lT5v/Jv9K
        ZpoGJCUcthuMCL9mvG+z20udYiZGaYeeew==
X-Google-Smtp-Source: AA0mqf4ExGpMw0FDlzzqQwlTo/pJFzVqxX+CmrbxmdoS/MOasH7ds2hbUWAGhf5hJbaooLWQuf8eWQ==
X-Received: by 2002:a5d:6909:0:b0:23a:5a31:29eb with SMTP id t9-20020a5d6909000000b0023a5a3129ebmr13556350wru.679.1668605235346;
        Wed, 16 Nov 2022 05:27:15 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id k25-20020a05600c1c9900b003cf4d99fd2asm2425710wms.6.2022.11.16.05.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 05:27:14 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [RFC PATCH 1/2] arm64: dts: qcom: pm8550b: Add eUSB2 repeater node
Date:   Wed, 16 Nov 2022 15:27:05 +0200
Message-Id: <20221116132706.2852434-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221116132706.2852434-1-abel.vesa@linaro.org>
References: <20221116132706.2852434-1-abel.vesa@linaro.org>
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
 arch/arm64/boot/dts/qcom/pm8550b.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8550b.dtsi b/arch/arm64/boot/dts/qcom/pm8550b.dtsi
index 16bcfb64d735..a15fab7c238b 100644
--- a/arch/arm64/boot/dts/qcom/pm8550b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550b.dtsi
@@ -55,5 +55,10 @@ pm8550b_gpios: gpio@8800 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		pm8550b_eusb2_repeater: usb-repeater@fd00 {
+			compatible = "qcom,pm8550b-eusb2-repeater";
+			reg = <0xfd00>;
+		};
 	};
 };
-- 
2.34.1

