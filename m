Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51EF75ECAFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 19:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232925AbiI0Rhk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 13:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232781AbiI0Rh2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 13:37:28 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E5B91D35B9
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 10:37:26 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id j16so16819859lfg.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 10:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=cZ9oR+D/ntPl4smbOciC/3TQd2xPuUm410NdDVUtl4c=;
        b=y9s8rKgqHrtHKvLw1f0XV20FCGU45un3WEm2EYvqLahplGQIgU/QqPU8U1YA1sjPmL
         PA41EwHFWj3cOZcj0MPfgi8lkQLPBPyQ8wswVvMG58PuTV5J8X4O4BKQ7hPdPDIct+g8
         3Jff4yp0Pe+oyOOwCfNcve+YXod/W8YkWDvEnKun0fvJ6LUiPK/PTfJDwCaAnt1lM+Wg
         V5dwO+xp/+a9ySMLXKS8Cg0YwP7E1JpXWYG5aymaJvrpGlav36M4gahJ7nHymxMNTUxa
         1FKuT7tOaQKTd+8I1OZpfb4oOWTWnVSzcGEkpyzTo8k9XCIV+n9DPFR2WhFa6oSjJdLF
         zUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=cZ9oR+D/ntPl4smbOciC/3TQd2xPuUm410NdDVUtl4c=;
        b=Zio+XdKoyMjHKzf2unVGZzT0rHDprPOBmRDz5LPdXia2nQAQQnMpHaSs+RBz2oBO70
         E5ZAQWxbZoUYfrZJfo6THmtDrtwlJhpMOK9g6hvi5yeUhkGTKhLtC8wJjw/eHL4bXU7u
         8aAKFVB1btZiCUqj5/Ak86X5iSMArFiWe7o8ydQ53WetFW5Kjq5QRVl65u3k/kvhb8C2
         Xr14XIJ2RSczOd0cYvi7mhXQ/83g0NRAE+Kj7cecc4xZrrp7ZErGMTvu7q41/NCITCkP
         LFVYP4nGOhaxKJjLbwlPseMKpbhEn78+s8kXz8GvTuGpGsMh5RgO4MjRtfAQ2T0LOh+i
         OP8A==
X-Gm-Message-State: ACrzQf0ev5fW9vONp7BXCUobFDv6K2hWEhBDsg/efVb0m6eEnfd97+gc
        qrBACNVsuCl4rgVzIooTqIqBug==
X-Google-Smtp-Source: AMsMyM5nISlEWKYwHX/wI6R4cUfGRy0CNgugstzjdSD4IsGU3jIscdW2GoHYSfVEZDBwTzRXT6dkOQ==
X-Received: by 2002:a05:6512:a88:b0:4a0:28eb:672c with SMTP id m8-20020a0565120a8800b004a028eb672cmr11197789lfu.594.1664300244982;
        Tue, 27 Sep 2022 10:37:24 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q12-20020ac246ec000000b00498f570aef2sm218879lfo.209.2022.09.27.10.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:37:23 -0700 (PDT)
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
Subject: [PATCH v3 04/34] ARM: dts: qcom: sdx55: align TLMM pin configuration with DT schema
Date:   Tue, 27 Sep 2022 19:36:32 +0200
Message-Id: <20220927173702.5200-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
References: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
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

