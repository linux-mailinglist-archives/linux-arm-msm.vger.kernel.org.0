Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAFFC5F11F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 20:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232430AbiI3Sw4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 14:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232452AbiI3Swx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 14:52:53 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF0DD169E5F
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:51 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id o7so931646lfk.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=EaQMdX6FllMXSsNGQaM8PQpPkIwr6tJY09gexolAZos=;
        b=XVWD1qBoumpsl64QWh0QCMJ7TjHp1VF+8NZXKThKB95I7/XyZPfCnuE3ntKSo3HK3x
         SEwsxNBMyy0Vp4CT8dsNqX3WdUpMbsV7EMCumDfuK8cFxWNu5UPf5J6hYyD3lbbGhxSC
         1+xm57Zw5MqXzUXS/LjjhUf3YVxeYVNfR3I9EcKXkzCkvcN3nA1V/AkiSARVylYYakXM
         d8la1PDu5vEqqh7d8yOYXLTQWNuoVoZxF5MabeFWkbPuv+41KZCIKYjW0AW1UvMbY/Ts
         V1sTgM+jgVpYGsve8AlheNOuU2OQxU5E+5OYJmBODrpy1hz+Hz/xNr2ew1qG5D7TalzM
         4PNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=EaQMdX6FllMXSsNGQaM8PQpPkIwr6tJY09gexolAZos=;
        b=Oci21y771eMTYNt6PbN3jtPzWk3OIrz2azxjQSMjST4l3mfa7pS78dua6Ylbasd46R
         hHfb8qIQWyQvbijy9vpTWxpnYsE6XPll0WZrsedRGfSPCgbAsxY8L2OwquEq1YEHIdKt
         EkBQiLtDdV8PbrdivKvy/ncFjbJdBR0QxEJwH+kNmBPTjNNnRRcE7W1Z7vu0ja5mib4K
         N20Z/zzcrEl4WDudYzePStaA1hPMBqy5oV/arps3UH6Hs0I0prg+kCGBkEizk9Gs6y6P
         6+k05Gqxk4abOLuFRqW+VLQ9T3MAgbcYBBePX2BSCVm/84iqEvQmHJpocBK8cqeUhSyr
         BUaQ==
X-Gm-Message-State: ACrzQf0ipHuxT0TRu41cxtzuVrpaISka3ULBKsdDk9tHjhJfKwpvSmuu
        fzEDYA9QzP3RAdYtuGSQcGItyw==
X-Google-Smtp-Source: AMsMyM5e/cgrkY1VBFmybxFLSPWc56ds+OYdlgGfigMeXwtLlyn80+2Hlm1UVCRb1K+AwcXpjz74+A==
X-Received: by 2002:a05:6512:3d28:b0:49f:4b31:909b with SMTP id d40-20020a0565123d2800b0049f4b31909bmr3583498lfv.669.1664563969981;
        Fri, 30 Sep 2022 11:52:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i8-20020a056512006800b00492cfecf1c0sm374703lfo.245.2022.09.30.11.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 11:52:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 17/23] ARM: dts: qcom: msm8960: drop qcom, prefix from SSBI node name
Date:   Fri, 30 Sep 2022 21:52:30 +0300
Message-Id: <20220930185236.867655-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8960.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom-msm8960.dtsi
index 64a3dcb5176c..487ab9b8d23b 100644
--- a/arch/arm/boot/dts/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8960.dtsi
@@ -247,7 +247,7 @@ gsbi5_serial: serial@16440000 {
 			};
 		};
 
-		qcom,ssbi@500000 {
+		ssbi@500000 {
 			compatible = "qcom,ssbi";
 			reg = <0x500000 0x1000>;
 			qcom,controller-type = "pmic-arbiter";
-- 
2.35.1

