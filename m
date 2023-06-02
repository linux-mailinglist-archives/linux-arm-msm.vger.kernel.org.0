Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3876671F9FC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jun 2023 08:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233842AbjFBGUm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Jun 2023 02:20:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233767AbjFBGUc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Jun 2023 02:20:32 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C1CF18C
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 23:20:31 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f6e68cc738so16328005e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 23:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685686830; x=1688278830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SZlmBe4W9vLL73H/TTCi5vs76P5q4kfXo4iNUwpvog=;
        b=vldA/uo1C/WVXoGzKY60oskUqNZSBc5PIaJaSHedAZruZQNfEEC/5c7lC+IPwwKZ7B
         MC9xryptPH1N7ZnIkxCgLonLM9/+sYmnt8EC+K/HSUunMtNo4h876oxyQqYbjMOy9yNO
         wu11ICLWPUQNoy11RwpGO1xJUEmab1ItDVuUlq8jVNegl+vMwIXHnHluX0P/dOpQFRAi
         0hiETtiw/gnNJOFtYu9R2rpDjma+exd6nlkH3+Obut/hYfSrhTd7Hls4wfjPRKzuOy6d
         VmEkPhqfV4kKAdRYmpPwc1gJzcg18pTJCm1W4DRfOdxVhW1vhHDYbzNZDsdv0OjxexHf
         geCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685686830; x=1688278830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8SZlmBe4W9vLL73H/TTCi5vs76P5q4kfXo4iNUwpvog=;
        b=NN4MQrh0NVuWh1uAUfZTE0EMwq2LpRjowNmeBJDfAp4OWExcm4c3YFopM8eiyzd5cR
         k3MxXsHkd34qM/mnwNoH/5QMt8PibZ8voFGkzpslH6fRD3qqs2xo2EFNpcSy4iwW77Fr
         va+IXqFGCiNIWbS2dofeuBr3H0HuApfP11HDQvT+SSrfTD5/SIA5TL8uwZ+SaT6tGHTO
         XJwf/FghdNMx57HIPEGLOj39ewArHSN9PWQk6oy6kt0XLx9f7Jg5Lu7TDjFCah5001Cg
         aRgsDtK7kOI88kctnmhHvYfHX+hdYRRZysIxq7bvnaMP4OwV6RedapOzH9Qhg/+Wqntx
         /MdQ==
X-Gm-Message-State: AC+VfDx1o9V6dGAxYOt17UCoz8n4QBG4XeJo5VGVhFnq/LBINhy4C5ev
        OjG/c9mb8gO0kbVrooz7hmAxNw==
X-Google-Smtp-Source: ACHHUZ4/ldsWeZTvk36B4VbWR7NbgEGMgA3p73P73jjsRLaF9rzYgCqJ8+hZKo55x6eQfrlgMRnbTA==
X-Received: by 2002:adf:dd81:0:b0:309:51ec:9ce0 with SMTP id x1-20020adfdd81000000b0030951ec9ce0mr3321475wrl.69.1685686829989;
        Thu, 01 Jun 2023 23:20:29 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.20])
        by smtp.gmail.com with ESMTPSA id 23-20020a05600c229700b003f42894ebe2sm4388213wmf.23.2023.06.01.23.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 23:20:29 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 6/6] arm64: dts: qcom: sm8450: Add missing interconnect paths to USB HC
Date:   Fri,  2 Jun 2023 09:20:16 +0300
Message-Id: <20230602062016.1883171-6-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602062016.1883171-1-abel.vesa@linaro.org>
References: <20230602062016.1883171-1-abel.vesa@linaro.org>
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

The USB HC node is missing the interconnect paths, so add them.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---

Changes since v1:
 * Added Konrad's R-b tag

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

