Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02BB2596F03
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 15:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239179AbiHQNEj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 09:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235930AbiHQNEL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 09:04:11 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94C9533A23
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 06:03:58 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id v2so18920372lfi.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 06:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=d81NAUVI3O6mHh9rRCLTkzFGlVQOgUX55hJVWZukNlg=;
        b=GIFpL+ATcIDKagtSP6rDHeoCcOFWWr/pW8xkg67OgOzuXkmqjQa8TAsgP6d8MPQ7jj
         qqJg+WFqfoF+EwMmJsCVZ1wXIL63HQvJYQmoIZn7t1jBMG+cTbuPHPOJ0a8Bf2UVJGzD
         P5FoLeWgBjexMccdTDJuh25nyvBuLT1QXHSP7X/h0SuDotdAC8jOh6Di97NbFpclUJVV
         eOUj3TyiIrOTofGk3sreML2YYY2+FPy4vDkZFPCARSTHOPYU9qtFFP3LkYk7cm0PBzv4
         Qh4wFSS3FtUEZr8xfTPHbwtEgb07HMGEZC6I88DQVM9f1zSED1+cWnM0w54Cza6uW+TQ
         +/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=d81NAUVI3O6mHh9rRCLTkzFGlVQOgUX55hJVWZukNlg=;
        b=Va1unFMWWxZFZIwae/NojkD8J0PKiaEcX6D7P4BgW1qTeOvoSaZvMhc16kuVMoJje5
         u8N5zYFWyFsz8R2m/fLrkCSvch/5zHSEpKdX/h9zxF3CcGhLf8gZYn7Wy70c9kpMEA6x
         f+U1CTNWv8D3+N8hYwtd+QvkAcVdEP/Xdi3Glqgmtz6U8xusC2SOMwKLwGMjWaJnNzwW
         GSnuPZD1T8dQ2Z/AZO24J26Kw392HAfSE2HLPK6NHCqLBemNKZ8EttnuqlUjKH30BVv2
         qL/bz3rNPIyaSKhKhxxGQaGwM20wmdoHKg3w0ZiCEe1Fd/srWUxWrRbjhM7GJXVxa4Cv
         sl6w==
X-Gm-Message-State: ACgBeo36pFutKRqng9XCrBiaN1O1ge3Nffs5xXK3EJcIY+SwsOEdnF6S
        fbF8XV/eZHtjBRzwQTzyt+T2tw==
X-Google-Smtp-Source: AA6agR6s5ElWmktazefBCvNFDDnaenAXi9o0z1jq4dXZQKKmJoPORPpgt5EBridafrYMiKy9WM5w0A==
X-Received: by 2002:a05:6512:ac7:b0:491:571c:3ef5 with SMTP id n7-20020a0565120ac700b00491571c3ef5mr7149067lfu.2.1660741436156;
        Wed, 17 Aug 2022 06:03:56 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id v1-20020ac25601000000b0048b3768d2ecsm1683243lfd.174.2022.08.17.06.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 06:03:55 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH v2 04/14] arm64: dts: qcom: msm8998: split TCSR halt regs out of mutex
Date:   Wed, 17 Aug 2022 16:03:32 +0300
Message-Id: <20220817130342.568396-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817130342.568396-1-krzysztof.kozlowski@linaro.org>
References: <20220817130342.568396-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The TCSR halt regs are next to TCSR mutex, so before converting the TCSR
mutex into device with address space, we need to split the halt regs to
its own syscon device.  This also describes more accurately the devices
and their IO address space.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 02d21bff2198..f0806ed103f1 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1049,7 +1049,12 @@ ufsphy_lanes: phy@1da7400 {
 
 		tcsr_mutex_regs: syscon@1f40000 {
 			compatible = "syscon";
-			reg = <0x01f40000 0x40000>;
+			reg = <0x01f40000 0x20000>;
+		};
+
+		tcsr_regs_1: sycon@1f60000 {
+			compatible = "qcom,msm8998-tcsr", "syscon";
+			reg = <0x01f60000 0x20000>;
 		};
 
 		tlmm: pinctrl@3400000 {
@@ -1340,7 +1345,7 @@ remoteproc_mss: remoteproc@4080000 {
 			resets = <&gcc GCC_MSS_RESTART>;
 			reset-names = "mss_restart";
 
-			qcom,halt-regs = <&tcsr_mutex_regs 0x23000 0x25000 0x24000>;
+			qcom,halt-regs = <&tcsr_regs_1 0x3000 0x5000 0x4000>;
 
 			power-domains = <&rpmpd MSM8998_VDDCX>,
 					<&rpmpd MSM8998_VDDMX>;
-- 
2.34.1

