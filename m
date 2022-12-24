Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF4A6655A90
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Dec 2022 16:43:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbiLXPnG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Dec 2022 10:43:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231324AbiLXPnB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Dec 2022 10:43:01 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA588DE9A
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Dec 2022 07:42:59 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id cf42so10735967lfb.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Dec 2022 07:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ysaSn2ynBsG9iGZ/g/I8NJdHeBVgacyPmB6wiSk/yPU=;
        b=o8eHYnYEKtPp1a3dVDvtK+xXcT1LG8+Jm51T4Xm7Kg0b0xjIKAPGSz/Hs04kqJNHzW
         GTB7XYMs+SOO9GemAYdQtwWE2raCo2kMoRsJC0s9pTje0DiDDFe1JR3SixGs+4WnceSh
         5z+FI2oEogM8vx3wxAl+eV9vRyZPXbzl+pqohnzGhRYFi4phRYUqtKIzY9DEZCKQDLjN
         dzZjvrEtAxLpPSLv25Ig0UDcFcHzUzfV+5DN1uQqMkz4DM4GD54C5r93vrhpy8yF4a5O
         DOM66FfNs8MLGNagsM1xaYSvcQoX4UFlpOfy89dDSVKcGFSXITNpcYO7xKspe6wnrllR
         Xtqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ysaSn2ynBsG9iGZ/g/I8NJdHeBVgacyPmB6wiSk/yPU=;
        b=CBLYMBDWYMuRyrUjdXtHrg4ZIMUpg8I6p060Q1ELgD4VEpzRRXXRoKPV2XiPGJQ0ak
         SYR+TVy/eOZ1mqJNUAn+ZkdM/QxM5Mey8sck1d6njVxJdagJ5vjxFSsYiSkQG7AnZ7e5
         x2dbdRo+s2hRNF53chbqYPfHdt6PnoNQYm4iZhVhkFdfvYzPAttUdFVMw2tgKri4WPgd
         /mJcGZIZS//rVBniEx2cNbrPBXwUB6Z1Pji+lnbYLY+pkGBbHwhFa0RPfakwL+WAu29a
         QDReK9hLTKb8O+jobXWuo0l9TJpbd4EZxHVtZEYfSVHBOlzeDOLwGMAUXszxIaG7RnmT
         dPhw==
X-Gm-Message-State: AFqh2kpXvizHKsh19yIXGDp5K6tF/IKM1JiHzsrTO2139HJlzKGvKj6H
        g16NAUJlGzIfrEuQCFWon5wSXQ==
X-Google-Smtp-Source: AMrXdXturyp6eB5pfcMZNqzEbAP6wVkccGgcQJDfsCkaCZFWZ/EyKqOOlykgdE8Y1htWxkNah5ENbQ==
X-Received: by 2002:ac2:44cb:0:b0:4b6:e64c:aebf with SMTP id d11-20020ac244cb000000b004b6e64caebfmr3575166lfm.51.1671896578199;
        Sat, 24 Dec 2022 07:42:58 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f14-20020ac251ae000000b004b257fef958sm999927lfk.94.2022.12.24.07.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Dec 2022 07:42:57 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/5] arm64: dts: qcom: msm8996: align bus node names with DT schema
Date:   Sat, 24 Dec 2022 16:42:51 +0100
Message-Id: <20221224154255.43499-1-krzysztof.kozlowski@linaro.org>
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

The node names should be generic and the bindings expect "bus" for
simple-bus nodes:

  msm8996-mtp.dtb: agnoc@0: $nodename:0: 'agnoc@0' does not match '^bus(@[0-9a-f]+)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index c53018ca81d7..cf2f5b74a4c2 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1814,7 +1814,7 @@ spmi_bus: spmi@400f000 {
 			#interrupt-cells = <4>;
 		};
 
-		agnoc@0 {
+		bus@0 {
 			power-domains = <&gcc AGGRE0_NOC_GDSC>;
 			compatible = "simple-pm-bus";
 			#address-cells = <1>;
-- 
2.34.1

