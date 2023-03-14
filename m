Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB1556B8CC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 09:14:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbjCNIMB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 04:12:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbjCNILI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 04:11:08 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CBCA99277
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 01:09:38 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id eh3so2548391edb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 01:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678781371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIHAu8tErojOfd5QM6R7iQDgiVIIMil5Ve6NCJeQni8=;
        b=sr6pnzRPpF6o2HDaiclSrB3FAy6yY+uTkyJCoUN0ng7M/YGhs67XfXhh/j7AoKPhaM
         eRN9WWv7gyOl6B9LGMF5ek4ENi8BsFrnuuKwW9Mo0CfBC/t/MctcvYF6C3/Aipjqy0xR
         FcydWT9EKuqVKhkr3LOunGkH526ciMMA+pKCb7QPRjY5qzBO/AhW0+dpJnjavXo41xUs
         1F1z45MLN59o702BbapAoIF/oFjXp6LBm4j6eg/xFLgI6mAGHx7DQKn1OEEQYBPA46if
         dV9vLZZnO4Z3R0CaZRzYpdQpGjwz5PRp4G1GtSnz+Xnwo6B9VO0svdguywwSRkF2I+PE
         JUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678781371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VIHAu8tErojOfd5QM6R7iQDgiVIIMil5Ve6NCJeQni8=;
        b=ihfw5CmN08zg/dmQL6vYHVAd7xDvlx/PgfgqY6U0QXuV3mUEmq/j936j9jMbskpdhI
         7QhWGlHObTmDrVPwT0Vq2MbArDR6bnjdsn5I8umNv1+V5c2GDhnz26WJvTgjJbMJRGUk
         vwHM0G+yCWnP/Tb96+Jisz7BvI1ec0XKf8coDQ5RfbMTSjS3ntaJZa+R29Cst5A1+3eK
         pcZMFExVzTMcbLdigu2SXNRGV3MPgJAov5dploKdf6FTI5RtrSntRqubeZgNRuxMMa3D
         hfjEPLQbx6AO+6fsTg6fLR/KQlWP3PHpjsiG/9MpIM9zjepMOSU9HSTrNqWEB5YDvJH2
         dstg==
X-Gm-Message-State: AO0yUKXCs517soo47JKE4VK2tk+gB4l4a159LSrPO7Hn7x/J+nCAJeLo
        77kD0z4UIu2Jz3DWFIU8PLBJXg==
X-Google-Smtp-Source: AK7set+nViGSJKPBiCfrPyqc6M+zYGZLmpyG8CW6rERPFv83r0SInDvFH4CKRGOAPfI6AMrpx9mZxQ==
X-Received: by 2002:aa7:d307:0:b0:4fc:825d:7c7f with SMTP id p7-20020aa7d307000000b004fc825d7c7fmr6293704edq.3.1678781370926;
        Tue, 14 Mar 2023 01:09:30 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:6932:5570:6254:9edd])
        by smtp.gmail.com with ESMTPSA id co2-20020a0564020c0200b004fce9ff4830sm584872edb.88.2023.03.14.01.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 01:09:30 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 12/13] arm64: dts: qcom: sc7180: add compatible fallback to mailbox
Date:   Tue, 14 Mar 2023 09:09:16 +0100
Message-Id: <20230314080917.68246-13-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230314080917.68246-1-krzysztof.kozlowski@linaro.org>
References: <20230314080917.68246-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SC7180 mailbox is compatible with SDM845.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index ebfa21e9ed8a..61d99c02a290 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3407,7 +3407,8 @@ msi-controller@17a40000 {
 		};
 
 		apss_shared: mailbox@17c00000 {
-			compatible = "qcom,sc7180-apss-shared";
+			compatible = "qcom,sc7180-apss-shared",
+				     "qcom,sdm845-apss-shared";
 			reg = <0 0x17c00000 0 0x10000>;
 			#mbox-cells = <1>;
 		};
-- 
2.34.1

