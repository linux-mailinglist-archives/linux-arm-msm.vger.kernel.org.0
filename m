Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF1A17836EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 02:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231864AbjHVAPM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Aug 2023 20:15:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231855AbjHVAOY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Aug 2023 20:14:24 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4263ECC3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Aug 2023 17:14:09 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4ff882397ecso5845443e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Aug 2023 17:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692663247; x=1693268047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+n4FHogtkUWW0lhbbvCjrAu0cEo2A7+C+ewNBfn30Hw=;
        b=etVMUpKZEkmyYDGi+eS4ho+3v8B0DCp5dirkbIWCGXqQtSImz8ScI/lbosCqeCuXzj
         8HtE+L78lKJ3uoEJml/41A/Fo88/itYs0XSQCmxZpHjs+CBceUcUQANhft0dmgTcZTDx
         bbgzNz/qdph565kLcF04zAY/Gf/t+4txu1bNJSrXQU9m9Y6f6KcAP6ZxprXt9UuuxfEE
         121FgicHRWuq2EwkqXvTHRKnKq2HAzleydR7kmkJX2NUTQ5tbbt+WplCkApjfcKbLgH3
         8PmU15lkRacmdh8Ee+98mn3v/d5WzhCqTerZBYduc41N6vbL55K2oWn9uW9FCRyPmFhY
         gtug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692663247; x=1693268047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+n4FHogtkUWW0lhbbvCjrAu0cEo2A7+C+ewNBfn30Hw=;
        b=Sr8rsfeB59VXLu78mi/1U8FhnmHEEFSUFQzfYe8gDEEDw54VyUgzs6RZvdInHcVfSk
         HGCnfi5fOwPuXZZcCrxCAazpboF2TMD4SR/yA09JFnLVurJ47q7hdygrVo1DvFQgXalB
         4X1awd8COaRIiXqNL5lLPG8Dtzz7KfbCr7EjwLQPibpgx6qwhBkqbtlgmnBP7fvLhMQy
         ehitK6YG6JMVZmUYic6xnCRFSpmHVpCJIaamyYNiwxs6PrCzPryzQAlVTnVVOOA90sSG
         bwNOlDnW274E0RvQlLbHN09N3xnrYZmA+uVSF0Tvcb/n5ibhUXMkWxIOmVAdqibKwy8M
         RzDw==
X-Gm-Message-State: AOJu0Yxa/nfTPqMYOy/o8WmfxLgGVbq+U9qYO8lVJe5BJrgjwo+wwXXv
        mKBZc4n2HrqFglJCMIOuWkXc+w==
X-Google-Smtp-Source: AGHT+IG8KodIFQEaKNv8A1dawB2DVXnum+OmxFCPZMJgsdWebfCvaXviXDFAXozO2UgVGfsL3ctxSQ==
X-Received: by 2002:a05:6512:3e9:b0:4ff:7046:984a with SMTP id n9-20020a05651203e900b004ff7046984amr5307801lfq.7.1692663247385;
        Mon, 21 Aug 2023 17:14:07 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id er23-20020a05651248d700b004fe36e673b8sm912024lfb.178.2023.08.21.17.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 17:14:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v3 20/32] ARM: dts: qcom: pm8018: move reg property
Date:   Tue, 22 Aug 2023 03:13:37 +0300
Message-Id: <20230822001349.899298-21-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
References: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move reg property to come after compatible.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8018.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/pm8018.dtsi b/arch/arm/boot/dts/qcom/pm8018.dtsi
index c602544900b2..85ab36b6d006 100644
--- a/arch/arm/boot/dts/qcom/pm8018.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8018.dtsi
@@ -27,9 +27,9 @@ pwrkey@1c {
 
 		pm8018_mpps: mpps@50 {
 			compatible = "qcom,pm8018-mpp", "qcom,ssbi-mpp";
+			reg = <0x50>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			reg = <0x50>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&pm8018_mpps 0 0 6>;
@@ -37,9 +37,9 @@ pm8018_mpps: mpps@50 {
 
 		rtc@11d {
 			compatible = "qcom,pm8018-rtc", "qcom,pm8921-rtc";
+			reg = <0x11d>;
 			interrupt-parent = <&pm8018>;
 			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
-			reg = <0x11d>;
 			allow-set-time;
 		};
 
-- 
2.39.2

