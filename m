Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF756550DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Dec 2022 14:22:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbiLWNWG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Dec 2022 08:22:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236355AbiLWNVj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Dec 2022 08:21:39 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEF0615805
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Dec 2022 05:21:25 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id cf42so7119593lfb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Dec 2022 05:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gVhYVj9t0TmO06QRMvsI7c4UDqWdwIO+1a1jibPQ4AY=;
        b=ZvanVxX+F7wVBwyYwCDbg/57StkMJRP4S/FLgziPsHIv9uizGNIZd6yfvupQnvCQuZ
         cwoY2O+tpZ5NF3UYmpsC1KyH448Xvv1pUcTdDXWFg0DOEtRK9e0X61JpgINu+z1Iz1Ud
         WWiDe3yTidIu6u475jt71JXRAmvsS7p5f69AgeiLJV4vXDg5EinHn8hBuamwglIDcZbt
         bwDjacDTD9dCO3azbieo6ncQzqS3zagxt/eBYii/RmoqRi56obm2q5eVAYNaAzkw0807
         kdEajfegOnJWN3wedyWZJR+U2f2a/nvhZrJo0vCoRGDxhv7JZ5gz5kMyYbGP7aNz6lGg
         VpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gVhYVj9t0TmO06QRMvsI7c4UDqWdwIO+1a1jibPQ4AY=;
        b=RDcwRivrMm+jLg9If2+yG3habz4rEypQJ/Xxyin2GMV0w/2+MAEQ4ogz01iY8DvEGe
         JEW+eMz/ZeiDXtU0cjfsNRqAlyUnGLakRbtK38EE5ik+5+UMMMVdrY/a7G1sCZErEjlQ
         AEJcLPDsAztYeYDqaRi7uv/HA3hiORN+TGccBOAOwcUR1mjKfwppP/8AB2QUa/UOeMI4
         grJwxHWs6bidt32r6TXOqHFTLga5DLwYWGiXnZlp1cBfO/BSpcVaZ4kZu9AM7tvpfVAt
         NFGQp49zBnOTknbaRgBAFTIoFad2P4NZ4//UmLuNtKpPJPed164Wd5N6s/MRf8Ji4FQV
         9czg==
X-Gm-Message-State: AFqh2kpA29R68/bswFfEQUo7xl3mI+Ii5+1Jvs1q2SGk0ZLlfCEACq7z
        9uSRx+GB2wt0TgqckRjBgjQ9vA==
X-Google-Smtp-Source: AMrXdXsn9wGVN8vb2r8vKVAVBleq7OwhCbadpKhwLM/z1nyaN2UMeps0tffZCh7rqqNddDNnoOp5kw==
X-Received: by 2002:ac2:48a5:0:b0:4b6:ed1d:38e9 with SMTP id u5-20020ac248a5000000b004b6ed1d38e9mr3616136lfg.64.1671801683968;
        Fri, 23 Dec 2022 05:21:23 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id z11-20020a056512370b00b0049c29389b98sm518929lfr.151.2022.12.23.05.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Dec 2022 05:21:23 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sm8450: correct Soundwire wakeup interrupt name
Date:   Fri, 23 Dec 2022 14:21:21 +0100
Message-Id: <20221223132121.81130-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

The bindings expect second Soundwire interrupt to be "wakeup" (Linux
driver takes by index):

  sm8450-hdk.dtb: soundwire-controller@33b0000: interrupt-names:1: 'wakeup' was expected

Fixes: 14341e76dbc7 ("arm64: dts: qcom: sm8450: add Soundwire and LPASS")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 570475040d95..eb3318516243 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2263,7 +2263,7 @@ swr2: soundwire-controller@33b0000 {
 			reg = <0 0x33b0000 0 0x2000>;
 			interrupts-extended = <&intc GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "core", "wake";
+			interrupt-names = "core", "wakeup";
 
 			clocks = <&vamacro>;
 			clock-names = "iface";
-- 
2.34.1

