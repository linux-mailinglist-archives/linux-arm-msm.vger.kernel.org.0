Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFA1574E753
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 08:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbjGKGaV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 02:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjGKGaV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 02:30:21 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 069EFB8
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 23:30:20 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fb863edcb6so8340733e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 23:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689057018; x=1691649018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sUHQMlTdqZcdcxjw+UWOu+zw3X6NSQ/sSdUNNnCmvbs=;
        b=A77aq6EyZY4PGecpknUMzrEz4n2U1Uz3SIyAdfqS0fr4nFgcbkx0bPB55EftB8el2T
         7+FfWBVJs3+dFKiGbM45SF4H2sK1CENRPHNRiLzIkbGrLej/w/Ba3lrN1Rhb83dLvGTs
         XTr6zPpgIeGV9qpeUalZL/9cVMh2AMvR+OzaBf2Wi/V/lsK2Ky9c9IWJ/J5r11QfCbVx
         5sECfNlINwkezdguRq0KLeGmhGa0OY7sQ6seZCSmMWtBvWt2FhJ72f6OuPfHUoWusgFT
         0/m2kx8KlK/7wmo23xp50r5nKa6gyA5NGUCui5k/pQHU9Mks56ewY3u2fJy6GoGnYe6w
         YPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689057018; x=1691649018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUHQMlTdqZcdcxjw+UWOu+zw3X6NSQ/sSdUNNnCmvbs=;
        b=aTkJ7JgJqi2o3r5wDW8M4JHVPc1wcneiEikdtbvcOdPtQZJF1J09qzpS+nQysKp5CZ
         rTJ0UidQd4Vtwz1Wmd28j7D33aCQ5x+vYAYTS7F46BNgT6gKON/vibT0jNfIR5xdDARy
         tF4UxofSoUS/kimADEg+ZPnX5E77gi6Ixojn0qvAcYkE/VIGjwX7gwH4rfvG7fF7XamI
         YWBrJPR4TF/GQHCsR8dnRD24uVLsNxfB2fTlN+sg04VYwGzBEo2hFECCD9Cz2Tdlor1M
         ssJNmnNwsiGt57sSx66mrHkmEdmJ3OMmGyj1CCVsHNImJa0t2HX3WOva05Ka+TbjsQnh
         cwlw==
X-Gm-Message-State: ABy/qLYtsj5FGirn1dDUbnj1dpGt2nkhqZduAZvSG/3t9ZpvUhCPnFN+
        rOpQWHp3dckUVELLLKeoQLabSA==
X-Google-Smtp-Source: APBJJlE2ZFPufIkXHF5uQd7BLWBq+90N0QJIsSOCzI27jiBwDgSftjyLWYN8TXzbobmA0tqEHIvjbQ==
X-Received: by 2002:a05:6512:2103:b0:4f8:66a1:a31b with SMTP id q3-20020a056512210300b004f866a1a31bmr11021107lfr.30.1689057018244;
        Mon, 10 Jul 2023 23:30:18 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id d3-20020a056402000300b0051e2670d599sm773421edu.4.2023.07.10.23.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 23:30:17 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sm8250-sony-xperia: correct GPIO keys wakeup again
Date:   Tue, 11 Jul 2023 08:30:11 +0200
Message-Id: <20230711063011.16222-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

gpio-keys,wakeup is a deprecated property:

  m8250-sony-xperia-edo-pdx206.dtb: gpio-keys: key-camera-focus: Unevaluated properties are not allowed ('gpio-key,wakeup' was unexpected)

Fixes: a422c6a91a66 ("arm64: dts: qcom: sm8250-edo: Rectify gpio-keys")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

It's a damn Groundhog day. I already fixed all the occurences in
77a7e3942871 ("arm64: dts: qcom: sm8250-sony-xperia: correct GPIO keys
wakeup")!
---
 arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
index cd27794739a5..ecdc20bc10f5 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
@@ -60,7 +60,7 @@ key-camera-focus {
 			gpios = <&pm8150b_gpios 2 GPIO_ACTIVE_LOW>;
 			debounce-interval = <15>;
 			linux,can-disable;
-			gpio-key,wakeup;
+			wakeup-source;
 		};
 
 		key-camera-snapshot {
@@ -69,7 +69,7 @@ key-camera-snapshot {
 			gpios = <&pm8150b_gpios 1 GPIO_ACTIVE_LOW>;
 			debounce-interval = <15>;
 			linux,can-disable;
-			gpio-key,wakeup;
+			wakeup-source;
 		};
 
 		key-vol-down {
-- 
2.34.1

