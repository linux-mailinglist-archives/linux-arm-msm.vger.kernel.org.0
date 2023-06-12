Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0AEB72B5FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 05:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234535AbjFLDSj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Jun 2023 23:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234759AbjFLDSG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Jun 2023 23:18:06 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 011D435B1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jun 2023 20:16:38 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b1a3fa2cd2so42564471fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jun 2023 20:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686539785; x=1689131785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i8bbUw1QYsNj4ZuF741sMEm9dNSqu8lftaNCRxtP03g=;
        b=Ty4GkavvoCkw1OR6pEPSh0h1rS1tL/IZ3JrBR9IZRX9r4OKqs/QVVZX6adPnzoSaYG
         M6rLDEgB9o3j0ExVlbSfUFwrkJuxl6ECKiwNH2YQCrvd4hgxRiTUUzH1UXr33YDA6TVa
         Xei3zzffwDNfNa4bHT0htNslei8IPrBMpyYEtjBUG/+P2TL10AdSqUYZm+ar0/B+Ls8I
         H+erCOTMSHz02V0f6LDcZpDMsfdioT27VBpQg8S3ASt3p72OZMDzV4Dby/s8qd4fyj3/
         Zcm/MoDnLZvk81d9lhdcb1abWlL4FwEtA6RMQYAzs94+CPgmJh5F+hBZCB6S4JoXMg2d
         rflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686539785; x=1689131785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8bbUw1QYsNj4ZuF741sMEm9dNSqu8lftaNCRxtP03g=;
        b=AWg1cKstSlfJ5R5lqmgMVNJtOic7V3qhfOke+ROd2luhgYrwa4xHi1qlJRwpzbpAUO
         c9Hm4fRh54k9CTypoIRN0LFh9QH2XZ/uDB/k1x15PAyu4R5OjzQzZ90OkRslIParvD1u
         UsTIo0552qcCz/Rt0IKzDsA2CDzOydfALj3vL0RmqAi5eGfbGc7oCZygFTYES0Pp8n7N
         DRrttPxecIii54wKlKmAtS8odBkwMBsd/QT85XQ1x+z+RV+y+y119r87mXTO2giaOUES
         Au6TN74sHBqvkTQULIa5kIZziYWEB0aeC1IL6dETQcfxZMZWUYQpQ933Lg29XLVJTtg6
         s0Ew==
X-Gm-Message-State: AC+VfDwuakfXUnNxOo315WwpuoRQ9vAOWFK64fOI4OnsTQkEg0dF1n9c
        4xBkqZ45gAkQoA+8NU7DmhtaFw==
X-Google-Smtp-Source: ACHHUZ633YwU7nj4H37EMlrzk6y1s4B13oddDZfwTAu0IYWjbvj8IB+kHVD0VUVOYv1zNtaZXTLNAg==
X-Received: by 2002:a2e:b046:0:b0:2b1:eca3:4e8d with SMTP id d6-20020a2eb046000000b002b1eca34e8dmr2122945ljl.12.1686539784753;
        Sun, 11 Jun 2023 20:16:24 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id b8-20020a2e8488000000b002b32f9b6bd3sm120937ljh.62.2023.06.11.20.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 20:16:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Degdag Mohamed <degdagmohamed@gmail.com>
Subject: [PATCH] arm64: dts: qcom: sm8150: use proper DSI PHY compatible
Date:   Mon, 12 Jun 2023 06:16:23 +0300
Message-Id: <20230612031623.3620155-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The DSI PHY on the Qualcomm SM8150 platform requires platform-specific
handling. Use the proper SoC-specific compatible string for the DSI
PHYs.

Reported-by: Degdag Mohamed <degdagmohamed@gmail.com>
Fixes: 2ef3bb17c45c ("arm64: dts: qcom: sm8150: Add DISPCC node")
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 197c016aaeba..95d361443dff 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3832,7 +3832,7 @@ opp-358000000 {
 			};
 
 			mdss_dsi0_phy: phy@ae94400 {
-				compatible = "qcom,dsi-phy-7nm";
+				compatible = "qcom,dsi-phy-7nm-8150";
 				reg = <0 0x0ae94400 0 0x200>,
 				      <0 0x0ae94600 0 0x280>,
 				      <0 0x0ae94900 0 0x260>;
@@ -3906,7 +3906,7 @@ mdss_dsi1_out: endpoint {
 			};
 
 			mdss_dsi1_phy: phy@ae96400 {
-				compatible = "qcom,dsi-phy-7nm";
+				compatible = "qcom,dsi-phy-7nm-8150";
 				reg = <0 0x0ae96400 0 0x200>,
 				      <0 0x0ae96600 0 0x280>,
 				      <0 0x0ae96900 0 0x260>;
-- 
2.39.2

