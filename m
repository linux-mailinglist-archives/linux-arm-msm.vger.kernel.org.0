Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89A023E09BF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Aug 2021 23:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238899AbhHDVCg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Aug 2021 17:02:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238926AbhHDVCe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Aug 2021 17:02:34 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3772C06179A
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Aug 2021 14:02:19 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id j18so2927896ile.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Aug 2021 14:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=stsCAhb9KyNn9NActCypTJWHTXz4zjhM13MZVyTCBnA=;
        b=Urz7X5a+h1M5TrRqe4vxlM0lYfjjuDUEhvxjXMe38+AjpA2RJRhPkAAufCreOGnmYk
         bRtGhkyCZeaxgbUCPM57CUBWJ6I2nZomrGnX88XAqom9y5De2lI4UIFbbgMh218QRqke
         s71weIRu0oW/Ba78xA4hN71KNLH0wSZJ9ha71MHQnlkf0YdbXmV7SuEC/NG/3Es4ol8y
         R3+1Ta5LfChZZaDLiJnYNc2jLakgg1IV2NJxz4jfJzdckad2a2hKngSLGZY3hXygQ+K2
         u5YgbT3vEcKGup6sM6XjWbrqnjj+PAOQTywIN81kwwPyrezOpR9oGy/+VDB7EXK0oWKZ
         +GNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=stsCAhb9KyNn9NActCypTJWHTXz4zjhM13MZVyTCBnA=;
        b=AYNIeMYKE1BHnRluReoo6mzUM5jvL3wvhNSI4Kjv84VwLq7q8Ub25nx6agDLGnWurG
         r6StTK15wkfVK8uDr4Gtu1vsG6NAY3RwEq0T6QPXvF5gSCxxAd3dNZpUwVou3WrWsPE9
         AR2f3LZaj2mlOV6N9pElx8V1G1VtCkdL2GO6iLSIgHYqr499vgQmQ2pnimJlDzTVEdAY
         kyzMs3bj2e97ScSRFJ5HhhyGxhof6m2aHehbZbpX1I7APf22iVdQBw4/Af9SndxynkUT
         I9AiqtY79Nlh0qBKpYdGq7YHp0V9YxFdDeQcoVHYiex7WHp6dN0fiW9EezSuLtsdCiob
         MMEg==
X-Gm-Message-State: AOAM533imQN6cA4xjbWvzBZtP2FPYzJ+UV0cgEVjVeOeVwbbYUaxfx8c
        +pOoGihHDlhHbbLWmznxhDSKjg==
X-Google-Smtp-Source: ABdhPJySSRd5XcaUWfwDcgu6AKbzKExu52CNfJGfTR0DYT8gGkJkbsFR6aADf4U1iB+GRvDkqt22lQ==
X-Received: by 2002:a92:da86:: with SMTP id u6mr213363iln.265.1628110939397;
        Wed, 04 Aug 2021 14:02:19 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id d18sm1687396ile.32.2021.08.04.14.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 14:02:19 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     robh+dt@kernel.org, elder@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] arm64: dts: qcom: sc7280: add IPA information
Date:   Wed,  4 Aug 2021 16:02:11 -0500
Message-Id: <20210804210214.1891755-2-elder@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210804210214.1891755-1-elder@linaro.org>
References: <20210804210214.1891755-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add IPA-related nodes and definitions to "sc7280.dtsi", including
the reserved memory area used for AP-based IPA firmware loading.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 42 ++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 029723a75edef..5764c5b5cae17 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -69,6 +69,11 @@ cpucp_mem: memory@80b00000 {
 			no-map;
 			reg = <0x0 0x80b00000 0x0 0x100000>;
 		};
+
+		ipa_fw_mem: memory@8b700000 {
+			reg = <0 0x8b700000 0 0x10000>;
+			no-map;
+		};
 	};
 
 	cpus {
@@ -568,6 +573,43 @@ mmss_noc: interconnect@1740000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		ipa: ipa@1e40000 {
+			compatible = "qcom,sc7280-ipa";
+
+			iommus = <&apps_smmu 0x480 0x0>,
+				 <&apps_smmu 0x482 0x0>;
+			reg = <0 0x1e40000 0 0x8000>,
+			      <0 0x1e50000 0 0x4ad0>,
+			      <0 0x1e04000 0 0x23000>;
+			reg-names = "ipa-reg",
+				    "ipa-shared",
+				    "gsi";
+
+			interrupts-extended = <&intc 0 654 IRQ_TYPE_EDGE_RISING>,
+					      <&intc 0 432 IRQ_TYPE_LEVEL_HIGH>,
+					      <&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ipa",
+					  "gsi",
+					  "ipa-clock-query",
+					  "ipa-setup-ready";
+
+			clocks = <&rpmhcc RPMH_IPA_CLK>;
+			clock-names = "core";
+
+			interconnects = <&aggre2_noc MASTER_IPA 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_IPA_CFG 0>;
+			interconnect-names = "memory",
+					     "config";
+
+			qcom,smem-states = <&ipa_smp2p_out 0>,
+					   <&ipa_smp2p_out 1>;
+			qcom,smem-state-names = "ipa-clock-enabled-valid",
+						"ipa-clock-enabled";
+
+			status = "disabled";
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex", "syscon";
 			reg = <0 0x01f40000 0 0x40000>;
-- 
2.27.0

