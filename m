Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55343568BE0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 16:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233108AbiGFOyR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 10:54:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231347AbiGFOyQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 10:54:16 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A25B6D58
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 07:54:15 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id a11so18779248ljb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 07:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sSxyjPJtu0fKyMsv6IIihxMffbK12MXQCS93t6bK9ww=;
        b=lFAbNGpf1OwKySjxwfgeYp7hJ9YZKX7H7yazd5KaviFoSvEWPvh6nuKqge8GUYLlu3
         a5vP95C1mv+4tkRDT8dIRPHg1DtasnbfQutd5yavpFUiBh3VUNchNDjx+JTZoDZpyDxJ
         QXMCyE5wyaxhboD7/yU8e7G6cAnf6uCKi6XD3HIzY27rIJBdZbpgOwxdRKvsJFYo4KRb
         Bs1l8TW7gnsbSdpDPweDNa9OADC1JqSkf+J7FNS4f0NY8Ne4TVmeBNbMtLUzH9VOCSZq
         mNbvwm8SqE2AJd5v/nUBB6oKOFr97RaKviWPG/81qN1zb5dbDRcd7Fh2glGQ7dfI7AMl
         W9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sSxyjPJtu0fKyMsv6IIihxMffbK12MXQCS93t6bK9ww=;
        b=u0zPomEo4S3sa6dCZo2rMjFUjToJeRGSmweFpt2DQtgkSX2deqg1Gcvye1DCJbGt5l
         Ve7Hvq90MpphGj9gmctOs7eVglA36XT4UM8g1ziawzxLK5FfsUI2O30po+qLGPaZs0VY
         zi6c/Od2hliQsPPOmNN2euxjioqojtMGYDyoEXvMGfXe4ZdP+iV+3N1er8/Cd3egIuVI
         aDoifrSFUU0MUp4FfYUcWCbOWe12TtJ0oEoMgOxGIYLbPmDSCMPDZ6TKYt08tWPuFGwU
         W53sWAR4EqdZlEj5xvR5bsDHrwBP8CH9T5dLdGu/HJiuCYFE4mGNNwljLPv6Lw5CqRfY
         TyDA==
X-Gm-Message-State: AJIora+9hreOSOeYe8EW/sqCtDl7L7wn/ntyc8zk/xu09N2xLtJY9Zps
        2KVsWvaYIpDftjFmW+bRpzV8tmX2ssVO4A==
X-Google-Smtp-Source: AGRyM1sNShrAebQctdaGTtt3HEm+7qSPjendZctbMSvrRVRFegSG1uUF2U+zj33UvurD2cx1WaRFEQ==
X-Received: by 2002:a05:651c:1a11:b0:25d:2e06:c35a with SMTP id by17-20020a05651c1a1100b0025d2e06c35amr6852772ljb.499.1657119254081;
        Wed, 06 Jul 2022 07:54:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i28-20020a056512007c00b0048650aee2b2sm359374lfo.144.2022.07.06.07.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 07:54:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/6] arm64: dts: qcom: msm8996: add missing DSI clock assignments
Date:   Wed,  6 Jul 2022 17:54:07 +0300
Message-Id: <20220706145412.1566011-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add missing DSI clock assignments to properly use DSI PHY clocks as DSI
byte and pixel clock parents.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 25d6b26fab60..50f7f89655b3 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -880,6 +880,8 @@ dsi0: dsi@994000 {
 					      "core_mmss",
 					      "pixel",
 					      "core";
+				assigned-clocks = <&mmcc BYTE0_CLK_SRC>, <&mmcc PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
 
 				phys = <&dsi0_phy>;
 				phy-names = "dsi";
@@ -946,6 +948,8 @@ dsi1: dsi@996000 {
 					      "core_mmss",
 					      "pixel",
 					      "core";
+				assigned-clocks = <&mmcc BYTE1_CLK_SRC>, <&mmcc PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
 
 				phys = <&dsi1_phy>;
 				phy-names = "dsi";
-- 
2.35.1

