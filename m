Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0FE7600193
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Oct 2022 19:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbiJPRBq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Oct 2022 13:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbiJPRBe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Oct 2022 13:01:34 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FAC038455
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 10:01:29 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id hh9so6508380qtb.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 10:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZ9oR+D/ntPl4smbOciC/3TQd2xPuUm410NdDVUtl4c=;
        b=sFvLfDnGkh1KcA5xPDPEAoWdt5eqsHv5ak1Q34uSDqzEPcPfgigew2U3rcWHubvEDv
         Cv7yKA7/xxJr4SYeo8Av66Rn0VDXB9lwxxdzbBSVGd7U9WWuEs2frO4z6rc/I4D+iXYT
         hDIP/rnLx2s5dyij9ATp6BmR1uYeMyeOg+HKMz10gNTxZlgFDLSYkOA5UiR30V/2KL+Q
         0H2LVszEAjz/FOwgOwcLL8fqkT4Q51ycOXm5HMel3RoSBUvu8fH0oj0mD5jfD0MyEv0j
         2pSemPLdQofczTfVaDvNJJFsBp8ar+flVGxBrxiTCSISOiJDj5dbAvz/Pm/6uR4uWGRj
         qz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZ9oR+D/ntPl4smbOciC/3TQd2xPuUm410NdDVUtl4c=;
        b=EZaEuDAotTXky0ZR09YhOFmI6Z0aD4Zb++S85VLKE3h9aaeHUaoJ31VBXDyY9AJUgo
         86ryx4KGUowO21CUsHnWvsaYGOtpoRMzVYQbzxjA75hiWikLZpB87anfGTxu+BwOAIeJ
         YatLKczk++R8d5WAb7Jb6l9hjU2Y7cvsFNQKPfHwhr2gqxRvzQ2x4Lu0kV32/u2xtYG7
         TPQiYQKF+VhLI8A/T/sivKnzyw0O9dIWKaccKPbW72NKZYYpsJZ9T85oSPH5QVI6Hcfn
         jcx1dbtnxON5qwCKdh0YDesWFPG1yL9TAHNYjMUcFy3DNB9m0xMZtFdbULK+6Fqznqmh
         d/wA==
X-Gm-Message-State: ACrzQf3fYB+kLA/d+lzKrnICsqCUxgD0i63p65VaLW4guV7QuFmtLIYF
        SJ+0hDqpTS7dlvN6CB46GKc/AYmQRQPaKA==
X-Google-Smtp-Source: AMsMyM5rPCrnpq784dEiH7UjnjuKQnKNFBy6E3HTpgKPw/7KxdgO8+4VVG2zBe3iLn+QwHQP/7g5Hg==
X-Received: by 2002:ac8:5849:0:b0:39a:8e35:1bfa with SMTP id h9-20020ac85849000000b0039a8e351bfamr5694157qth.573.1665939688467;
        Sun, 16 Oct 2022 10:01:28 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id q6-20020a05620a0d8600b006ce7bb8518bsm7539967qkl.5.2022.10.16.10.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 10:01:26 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 04/34] ARM: dts: qcom: sdx55: align TLMM pin configuration with DT schema
Date:   Sun, 16 Oct 2022 13:00:05 -0400
Message-Id: <20221016170035.35014-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org>
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

DT schema expects TLMM pin configuration nodes to be named with
'-state' suffix and their optional children with '-pins' suffix.  Schema
also requires 'function' property, so two nodes for the same gpio (mux
and config) should be merged into one.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../boot/dts/qcom-sdx55-telit-fn980-tlb.dts   | 45 +++++++------------
 1 file changed, 15 insertions(+), 30 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts b/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
index a4fa468a095f..ac8b4626ae9a 100644
--- a/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
+++ b/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
@@ -282,40 +282,25 @@ &remoteproc_mpss {
 };
 
 &tlmm {
-	pcie_ep_clkreq_default: pcie_ep_clkreq_default {
-		mux {
-			pins = "gpio56";
-			function = "pcie_clkreq";
-		};
-		config {
-			pins = "gpio56";
-			drive-strength = <2>;
-			bias-disable;
-		};
+	pcie_ep_clkreq_default: pcie-ep-clkreq-default-state {
+		pins = "gpio56";
+		function = "pcie_clkreq";
+		drive-strength = <2>;
+		bias-disable;
 	};
 
-	pcie_ep_perst_default: pcie_ep_perst_default {
-		mux {
-			pins = "gpio57";
-			function = "gpio";
-		};
-		config {
-			pins = "gpio57";
-			drive-strength = <2>;
-			bias-pull-down;
-		};
+	pcie_ep_perst_default: pcie-ep-perst-default-state {
+		pins = "gpio57";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
 	};
 
-	pcie_ep_wake_default: pcie_ep_wake_default {
-		mux {
-			pins = "gpio53";
-			function = "gpio";
-		};
-		config {
-			pins = "gpio53";
-			drive-strength = <2>;
-			bias-disable;
-		};
+	pcie_ep_wake_default: pcie-ep-wake-default-state {
+		pins = "gpio53";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
 	};
 };
 
-- 
2.34.1

