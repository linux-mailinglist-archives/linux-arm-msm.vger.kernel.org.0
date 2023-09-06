Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CFFA793A40
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 12:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236561AbjIFKsE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 06:48:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236711AbjIFKsD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 06:48:03 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAED2172C
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 03:47:50 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9a6190af24aso536712966b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 03:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693997269; x=1694602069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tula/AbqNycJa+aVb2JfaPfhOUcN8GxHVbvV8Hf+4lM=;
        b=wnzHuWU1uz9E4dTTB01d7Sv7flHIcUTfezuVvWSW903BqKGtMG8u8LOP+1ZSwWW5Il
         shrEWioBk2d662bYGoqgKB0swBj9hTsnkpw5FCb4zy7r8MsGmgHk3mvPh0N09Tk4xVx2
         vvkLY3miA6Q4/s3RbLde5UOH2iARGQzq1gbOfp85IMcxrqdWKfplYw9ctrEdRP2NbB3R
         3XeRcukkjPJ7a9CGmAelgZRGTq2R7/gWE/r2HYvAjdOMNxdXk97j1aEfBaE+REW3OKz8
         9TC37ULn4BqpJ7YYNsv860D35plmusG5yyxnxjqDXvioysKYGEU7Zy+ZHlhFLXtz9Tu6
         d/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693997269; x=1694602069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tula/AbqNycJa+aVb2JfaPfhOUcN8GxHVbvV8Hf+4lM=;
        b=L+xJoV7Vg8UyuaMiWJr4tBNC9AkArwHLbCJko9f4/utIjDCI+/tQqLmsDREOe553vo
         /rGjXlobAT/1J6zHtW+0R1oinxcuTAHM4sE2m7kjlaE0HS+8eC1ktEN2SXBJxVkNJ5wy
         ERHzUCS1YG1Z8Gn8R8AOFiAMJOoMpUAjjxqNz6jUQqQPyV6Y8NU1Usd2VQX9mzZ95fUp
         FqqZpZKh4ACgC4bfdRa5GOmYY60vBBJyfAbbjaEUACx1eZ/7IFd/+v6dEHpY26rDgcAO
         wCEwmpfryAhoW/NxErVyV3MxbLkZDQ+uR1S0wwSWD1vpbkW6qLrLSMxNTmR5XWq4WDQ8
         +rbA==
X-Gm-Message-State: AOJu0YwIL0LDD0GzTaR8sy+sUnmbgqXR6z9j62a3C7V32fDr1/2A/8ri
        4HwEi+3WA9mXb4DLD4Ud1SKjaA==
X-Google-Smtp-Source: AGHT+IGPcaTpWWV2QjuCLS6QKQdzpMl3Iqc39ioLeeS4fNwM6k0JtvJADLQ0xavrAHWo7tg/2Mir9w==
X-Received: by 2002:a17:907:75ea:b0:9a1:f426:bba9 with SMTP id jz10-20020a17090775ea00b009a1f426bba9mr1849634ejc.74.1693997269411;
        Wed, 06 Sep 2023 03:47:49 -0700 (PDT)
Received: from krzk-bin.. (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id e7-20020a170906248700b0099cc15f09a0sm8791163ejb.55.2023.09.06.03.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 03:47:49 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/6] arm64: dts: qcom: sm8450-hdk: add UFS host controller supply
Date:   Wed,  6 Sep 2023 12:47:41 +0200
Message-Id: <20230906104744.163479-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230906104744.163479-1-krzysztof.kozlowski@linaro.org>
References: <20230906104744.163479-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

According to schematics the L9B regulator supplies VCCQ (already in DTS)
and the UFS controller pads (VDD_PX10, missing vdd-hba).  Add the
missing supply for full hardware description, even though it should not
have functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index bd5e8181f2aa..df9251089cb9 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -1073,6 +1073,7 @@ &ufs_mem_hc {
 	vcc-max-microamp = <1100000>;
 	vccq-supply = <&vreg_l9b_1p2>;
 	vccq-max-microamp = <1200000>;
+	vdd-hba-supply = <&vreg_l9b_1p2>;
 };
 
 &ufs_mem_phy {
-- 
2.34.1

