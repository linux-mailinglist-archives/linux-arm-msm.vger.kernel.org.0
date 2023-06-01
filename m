Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E373719B71
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 14:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233108AbjFAMBY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 08:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233208AbjFAMBV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 08:01:21 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 071B71B6
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 05:00:53 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-973e7c35eddso100281666b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 05:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685620849; x=1688212849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQ07pbH4ORNmss/trSRTOGFYqmQRR7R00AJsQhlRP+w=;
        b=IX7YfJmKqcKbS5WCYp1pcWIibgt+yXjOfUMqSs8EJU31NKxz5KGCJaXMHWqp+5z41G
         RVeMciWTXlDR0uRCICJiAWrReA8UX64aiUdj0FvQ4tAO47UVdKq4I7f6s8nk8nvzX+Dp
         WfWwd0d0ay5mFpWxSvy2Mx3/dRik7HgaUYlX0qBMusIEJ59XGc5E3vRTxChTYTPWy7du
         2jzZDeYbeppVjvyTapXn2YoaVgwvBqHe3Co2X8/Ch0x1reCZ6M8PNeDZ0MULTtNmNVRG
         s6YiT9OC08ThFX8KyCtOi7VfRCiymdMdCx6msn3Up0KU23bGhgC3cyrJk/r2COdyT0hl
         uoCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685620849; x=1688212849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQ07pbH4ORNmss/trSRTOGFYqmQRR7R00AJsQhlRP+w=;
        b=iHyxer0VOO/FR11Opz+Vw5xkocGkD5x42KcU+4thNu77Tm0GVBJ/dXXtleoDlByixb
         iUebe0yD1aHq97H2D+2OPdxRav6BJdT/e6uT5QHHNLfoAOoviXls8a9bHhP8G9WwCwBG
         PkYBJoVN+Iiz/wmmbk9lKTaU0+uoxTphe5qLEI9L+1bKsWea7LEA9iratdsl/MAlNm7u
         rWbTsbEAgvEnmok9NUUK6TbcOXbv6YkA2G4rqEQZrxzSvVkMe4EsdyTHMQD4DlV1Of8q
         xbfuqjqU89/oaEiTCLATirWoT8bodLEH74BgvWfbkTmFs1rGlM3w83NPk2ginBmbsU0v
         HXBA==
X-Gm-Message-State: AC+VfDyRZVgeQO/GBCwnHhvGC/lv+zbLfCz6/LTepUNAgUQz7a4EL5Dk
        Ypx3IIPBWg9qKelgy389infrhg==
X-Google-Smtp-Source: ACHHUZ6ji3Y4Y3yI82B9XAoLbcJhk5vOQnK7gxgDOLElhKksKpzddGufackRqF5GEaqorUYbRMg2Ag==
X-Received: by 2002:a17:907:6e10:b0:974:6de:8a5e with SMTP id sd16-20020a1709076e1000b0097406de8a5emr8822633ejc.40.1685620848718;
        Thu, 01 Jun 2023 05:00:48 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.20])
        by smtp.gmail.com with ESMTPSA id v24-20020a170906b01800b0096f6e2f4d9esm10359923ejy.83.2023.06.01.05.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 05:00:48 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/4] arm64: dts: qcom: sm8450: Add missing interconnect paths to USB HC
Date:   Thu,  1 Jun 2023 15:00:29 +0300
Message-Id: <20230601120029.38859-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230601120029.38859-1-abel.vesa@linaro.org>
References: <20230601120029.38859-1-abel.vesa@linaro.org>
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

The USB HC node is missing the interconnect paths, so add them.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 11560ec9f182..5cd7296c7660 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -4306,6 +4306,10 @@ usb_1: usb@a6f8800 {
 
 			resets = <&gcc GCC_USB30_PRIM_BCR>;
 
+			interconnects = <&aggre1_noc MASTER_USB3_0 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
 			usb_1_dwc3: usb@a600000 {
 				compatible = "snps,dwc3";
 				reg = <0 0x0a600000 0 0xcd00>;
-- 
2.34.1

