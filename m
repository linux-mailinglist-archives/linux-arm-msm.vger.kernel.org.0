Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 545156C52C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 18:42:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbjCVRmG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 13:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230226AbjCVRl7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 13:41:59 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83D945D76B
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 10:41:57 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id eg48so76045261edb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 10:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679506916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=He95HulR5qTSW8eVx84ZNmIqGC4MQP+vdUqUMvy7lbI=;
        b=mvz8vKZSghP9fCbJLMhekGDiZlhaWBKnSCfYoKEDDuwmTSLW63nfHab+DMfRDBFLwv
         v91HH0DAEBYED9iQ/DbvwiZKcywW07VibMwhy6yjiAW1vo31k2wPirvm+el94baPlVJZ
         DGBtb9sxtIUT2IVW6LCZuf6nHjFaXmImD7WdWeyGs+2cBHqoprdledU+nUTVgsSRYdLh
         UELxi1kjArlbkICAc1trtIStv2jE9ipGzYmmoUWPL4HNQ8f4KjZGlsWy2eS6DwNlKFZQ
         8yzKxvh2c445HbTrqxvuKy/d5CoSUJY2FonrzdiopoAkUHMVlbN6haFHr3nXnJ/su++j
         K4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679506916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=He95HulR5qTSW8eVx84ZNmIqGC4MQP+vdUqUMvy7lbI=;
        b=l7l27mZ79gVjK3YZTsYPty5Bohn4dRyMmKmE6tBEELSDtMAx7oPNUIx2vz5AYR2pqE
         x0ySHDWTUjUo3B8cMW/Zhp+lDKiUnvwKAFV/0ypEBKl9jaUXRL/2+Wmi9eJ527jVNR6/
         H/7lTkS0OytD+JzBGRFT3Oa2okmT/3EP/QMnS517wi/aSho+pFqcoJv28oEANyTibDkh
         wiioTPgMNIeKqtyC1d+jUtJt6uCb+y6bLsT9SCCrx5utmpiF6ozh0qyUOjMi7tH3KkG0
         1iNJ/Ju71Aj2cxpLmB0S8XVtVgM55WAVa4TFui4UjAyirrpQT0Qp2aTlTDJFUJWKpo1b
         js4A==
X-Gm-Message-State: AO0yUKW+YArjOB+sKRZXnhiSe7tnDSqL38ETStbCw9ewxDR6d8m/kB4o
        w5S0Ay7sNhirHfbpD4eoBQjRXA==
X-Google-Smtp-Source: AK7set9fPqlQ+saKQquP9GC+D+cEMMbQMtcq94kjz+jrIn4aLJxNINwlVE4HV0cOvVHxohl30+kInw==
X-Received: by 2002:a17:907:105b:b0:932:cec7:6801 with SMTP id oy27-20020a170907105b00b00932cec76801mr7842298ejb.54.1679506916152;
        Wed, 22 Mar 2023 10:41:56 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id jx3-20020a170907760300b00930876176e2sm7548088ejc.29.2023.03.22.10.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 10:41:55 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 04/11] arm64: dts: qcom: msm8976: add compatible fallback to mailbox
Date:   Wed, 22 Mar 2023 18:41:41 +0100
Message-Id: <20230322174148.810938-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322174148.810938-1-krzysztof.kozlowski@linaro.org>
References: <20230322174148.810938-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8976 mailbox is compatible with MSM8994.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8976.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
index 2d360d05aa5e..c726d879d6f1 100644
--- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
@@ -1027,7 +1027,8 @@ intc: interrupt-controller@b000000 {
 		};
 
 		apcs: mailbox@b011000 {
-			compatible = "qcom,msm8976-apcs-kpss-global", "syscon";
+			compatible = "qcom,msm8976-apcs-kpss-global",
+				     "qcom,msm8994-apcs-kpss-global", "syscon";
 			reg = <0x0b011000 0x1000>;
 			#mbox-cells = <1>;
 		};
-- 
2.34.1

