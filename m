Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B13E878C125
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Aug 2023 11:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234623AbjH2JVw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Aug 2023 05:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234658AbjH2JVa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Aug 2023 05:21:30 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9A751B9
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 02:21:23 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4ffa01fc987so5996657e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 02:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693300882; x=1693905682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hR0J5yZaI/zx09LR10bwkCPb8pdOLPs94n7U+9NGDs=;
        b=OEf0n/Cr4rqIRQJBKCqJ79zzz8uee08s14ebWQEH5B9E1jlYP9Sy6Ye2tkrUGpf4jU
         CJPEBd2X/kjSTtpFnBih9zGvrBs4UBIU5V7Y5DAOd3kco5GeSGhs8+BriQ95lJY/MUSS
         0XN7fcc7k7qE/UF5OFoW2Jwz6Owali18G2iy9K7quG3eh3GmAaUEoanqy2dc8/2wXZZd
         RcTYx8Dnm4zThGo5XmS6NSSuGpX+jIIRPKlIc/+k0KCa+1bA64+QieY/lQ46aITOkqi0
         wkh51yrhURtK1sNe3+iVcYLpaTxPB5TJ1g6Xgd0kkqX8taAvs3x7H0EqirDUbQsQQOX3
         NeKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693300882; x=1693905682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4hR0J5yZaI/zx09LR10bwkCPb8pdOLPs94n7U+9NGDs=;
        b=Fwi2AsaZ1PN0DabJyZ8Ueh5uzLSFUdMuD/bT0olHBBoDcq6+0x29NU81gisDbOQVSN
         rDYheRDd7F7tjAcEqDf/A/GmayJTLtjKXlxuzUgqndhy7ifn1UJ3CxZk6plQqUF2uMpt
         Lh4m6CHsLFEXlZv9EnxzlsgMf9RzoH91Pdpy6fCBY7ZYOPxWCWADMPZz9/x0kKkTd0Y+
         4JPklAW9IXa6lYUMoFqTL12Nir9JSFencdzXyUjY8VycYzYHSKusIyQslxqchqgitrUs
         8QHSZRZjXYymKxdyl9RqAe1RbpWvt04kRR2vNBM+3BGBwtHA23J3/GOrEY38/urBKHVu
         rzfA==
X-Gm-Message-State: AOJu0YzL4JqnwujJff/CuoY7YZDfizfkfLyxneWsi5rQEIYO8aC8timh
        vtfp/PYQPAdF8AZn7MJWAugZXw==
X-Google-Smtp-Source: AGHT+IGC9VWkd4vatZk7v54NROHRSi88mobKt/wBQZSPbaEX2jRMfes8dFOHz/+ViC8x0cpa/pUj2Q==
X-Received: by 2002:a19:675e:0:b0:4fe:3724:fdb6 with SMTP id e30-20020a19675e000000b004fe3724fdb6mr552127lfj.30.1693300882057;
        Tue, 29 Aug 2023 02:21:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u20-20020ac24c34000000b004f858249932sm1884158lfq.90.2023.08.29.02.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 02:21:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] arm64: dts: qcom: sm8150: extend the size of the PDC resource
Date:   Tue, 29 Aug 2023 12:21:19 +0300
Message-Id: <20230829092119.1017194-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230829092119.1017194-1-dmitry.baryshkov@linaro.org>
References: <20230829092119.1017194-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Follow the example of other platforms and extend the PDC resource region
to 0x30000, so that the PDC driver can read the PDC_VERSION register.

Fixes: 397ad94668c1 ("arm64: dts: qcom: sm8150: Add pdc interrupt controller node")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 380712aee977..38c5d6dbd0d7 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3923,7 +3923,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8150-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x400>;
+			reg = <0 0x0b220000 0 0x30000>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>,
 					  <125 63 1>;
 			#interrupt-cells = <2>;
-- 
2.39.2

