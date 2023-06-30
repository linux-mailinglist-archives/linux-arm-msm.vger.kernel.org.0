Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA7D57434CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 08:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232174AbjF3GNZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 02:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbjF3GNW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 02:13:22 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DA6F2683
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 23:13:21 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b69f1570b2so24259941fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 23:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688105600; x=1690697600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wmn+M2fNga+4TNI6jt8uO55BNbxGOHvu4NVWQjGkRuY=;
        b=bhiTPh2xSONiC5pMqLinu2tf4uLERVeZzdtMA1WZeHgiMvBApDzNW+GoHer3+A4WBt
         YD0gG2XHe0487kaQU4FPAd1SQEynSOJVzsKU5mtnfOZ1zqa3VwgaxF7ajvTpfGSWa53N
         GlecAfjShCN0u4YXCHDt34jhP/QYFs5/9OENtY6Sa514kZF52rbOhYNf33hawrr+0LGr
         eTxhaAMjxISaeB2v4OwbVPhtddGHxV6jWZZpLgN8tKDexMSg/6PdDpfnBQu4pxeZ6kKx
         35ukYXXyVWP1p05cwumIQ+GkJHWrTe4jFdmUtEBrtSQpYuymbVotxjbCBh8JYxDxS80D
         I+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688105600; x=1690697600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wmn+M2fNga+4TNI6jt8uO55BNbxGOHvu4NVWQjGkRuY=;
        b=Qqx9LM9s1BPNS625vwTonunPziWahzvjnFnGQ60uePt3BBa6VKIrU8M/VqVc8hlZWm
         SGE/s4twEt46FU85stahXWu2uA0IxmrHJYtjqGGYdkd6+HedL4iGRFdXEbqu5SrzIQh5
         pVOuO62R2Au6ANzVkFpCRLDtrYQ+6LkNxUrl+PcvkXRdvoe4zfk57oOlC0rzhrLaDur1
         Lx4bRFohSsygR0p35nDv0QhUpBv5iJyJIVTrP/2j4gRlASg0BbuJZJ6nVvvU3ELBcanD
         n2id45frJaoufuaIG+syRi5G2E4IOoDH8iqOQxVy153l7FV1KIccfSDd7305QePIBfK0
         dkQw==
X-Gm-Message-State: ABy/qLaEgysG18B7S4TneVjaZ134b45R/3SiYSfFpntDt4KJUFu/+8G9
        Su6fW3eMT5daSkfGzWfW6A7EHg==
X-Google-Smtp-Source: APBJJlEhx+4ElNlwrvS7nlIc98U8QgF4F0QyKRwJdgPBkZYrDhaQURLhjRUmcuubtCsAs7kwDgTbnw==
X-Received: by 2002:a2e:88d2:0:b0:2b6:364:c153 with SMTP id a18-20020a2e88d2000000b002b60364c153mr1253517ljk.14.1688105600025;
        Thu, 29 Jun 2023 23:13:20 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g22-20020a2eb0d6000000b002b6caeb4b41sm505582ljl.27.2023.06.29.23.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 23:13:19 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 4/7] arm64: dts: qcom: pmk8350: fix ADC-TM compatible string
Date:   Fri, 30 Jun 2023 09:13:12 +0300
Message-Id: <20230630061315.4027453-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630061315.4027453-1-dmitry.baryshkov@linaro.org>
References: <20230630061315.4027453-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The commit b2de43136058 ("arm64: dts: qcom: pmk8350: Add peripherals for
pmk8350") for the ADC TM (thermal monitoring device) have used the
compatible string from the vendor kernel ("qcom,adc-tm7"). Use the
proper compatible string that is defined in the upstream kernel
("qcom,spmi-adc-tm5-gen2").

Fixes: b2de43136058 ("arm64: dts: qcom: pmk8350: Add peripherals for pmk8350")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmk8350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pmk8350.dtsi b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
index bc6297e7253e..1eb74017062d 100644
--- a/arch/arm64/boot/dts/qcom/pmk8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
@@ -59,7 +59,7 @@ pmk8350_vadc: adc@3100 {
 		};
 
 		pmk8350_adc_tm: adc-tm@3400 {
-			compatible = "qcom,adc-tm7";
+			compatible = "qcom,spmi-adc-tm5-gen2";
 			reg = <0x3400>;
 			interrupts = <PMK8350_SID 0x34 0x0 IRQ_TYPE_EDGE_RISING>;
 			#address-cells = <1>;
-- 
2.39.2

