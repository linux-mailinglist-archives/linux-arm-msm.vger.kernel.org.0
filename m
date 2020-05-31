Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B74661E9966
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2020 19:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728229AbgEaR2O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 31 May 2020 13:28:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbgEaR2N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 31 May 2020 13:28:13 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92CABC061A0E;
        Sun, 31 May 2020 10:28:12 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id h5so3227651wrc.7;
        Sun, 31 May 2020 10:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EakNxGoPn3WCF3pfvxOsaJvDNOYIIIi4TF/T6d07zHM=;
        b=e79bzN9rMWi07UEZ7ZjEjStiqzcQmraODT8etX/3JU2/y4pvhgoJjoXwd9MfdVcYP9
         874Fei8ZUzMquQxOtsEK6BwY4QQG1daBIWR2G9DqRVSbaU5E5Dz+tcqDH39UcpdNByEN
         a2Qu73nzoWHrMtFk6Eu3ZmzhZclA9Z+1HcuhckcnY5HgyqAvlWOQtK1dO2B/VZXQ8V0j
         MUUkZ9pav57DqJm3UoMuP5CbAmqiykt2mXSw272k6eBEkgfVk9NQZHKhsAH37rxupqIg
         6IVkx29e5qeGAxi5wKrtA2/rbS3Di6RjJRckt4KaqX4nHyx1kW+mESICBIS/YmoaR8F3
         j63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EakNxGoPn3WCF3pfvxOsaJvDNOYIIIi4TF/T6d07zHM=;
        b=eTHg97So+MpfMgtNBVDTu2l5/FwHxIqUExX+SPMpSRGMWQ1jm0Uqz7SyEh1wSrYUma
         TYi7Y+9WcVmSsyTkn47SIydsZCc9Mec1Skh/zJtxEuFIgnKXasNj00Dgpru0RfxPKzzJ
         sf1ChSQjwnkA3zujlO+M29LoLGXjbdEcxK/ASI46Tdn+OS2xc/3AU8KMvXHOWzgtfS/L
         y9U7EADpxXdwJlQFEug4zfiPWty45W/hz+5bo9Q3a8xRtc2hu0H5+vOoOr3dXusbOWWn
         /R/pK26r6qPket7V7Nm9bpvS4bKQzlqq1YxO97AAxkk4hIZ+XrBssp3Pfh+1CscKWH7h
         5dXQ==
X-Gm-Message-State: AOAM532CwxTEQpthRwFqiYDsbkCE5vzlzWY/JYRSx9P3pJ0te0Ma/NPA
        mcj5Zz/f+zlAh93J5DS+aeAsUlIk
X-Google-Smtp-Source: ABdhPJzG22PKzt0SpRXW8hGUi5AQ6fxUGGEAsdV2xistr1rZa4Mw99CMYKMFNW0PsBJ6gYBhWDA6Lw==
X-Received: by 2002:adf:de84:: with SMTP id w4mr18533311wrl.54.1590946091391;
        Sun, 31 May 2020 10:28:11 -0700 (PDT)
Received: from localhost.localdomain (abad130.neoplus.adsl.tpnet.pl. [83.6.167.130])
        by smtp.googlemail.com with ESMTPSA id b81sm8922326wmc.5.2020.05.31.10.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 10:28:11 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/14] arm64: dts: Add a proper CPU map for MSM8992
Date:   Sun, 31 May 2020 19:27:51 +0200
Message-Id: <20200531172804.256335-2-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531172804.256335-1-konradybcio@gmail.com>
References: <20200531172804.256335-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit adds cpu nodes for all 6 cores
present on this SoC and the cpu-map.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 68 +++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index 2021795c99ad..900c9445e0ba 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -20,11 +20,34 @@ / {
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
+
 		cpu-map {
 			cluster0 {
 				core0 {
 					cpu = <&CPU0>;
 				};
+
+				core1 {
+					cpu = <&CPU1>;
+				};
+
+				core2 {
+					cpu = <&CPU2>;
+				};
+
+				core3 {
+					cpu = <&CPU3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&CPU4>;
+				};
+
+				core1 {
+					cpu = <&CPU5>;
+				};
 			};
 		};
 
@@ -33,11 +56,56 @@ CPU0: cpu@0 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x0>;
 			next-level-cache = <&L2_0>;
+			enable-method = "psci";
 			L2_0: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 			};
 		};
+
+		CPU1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x1>;
+			next-level-cache = <&L2_0>;
+			enable-method = "psci";
+		};
+
+		CPU2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x2>;
+			next-level-cache = <&L2_0>;
+			enable-method = "psci";
+		};
+
+		CPU3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x3>;
+			next-level-cache = <&L2_0>;
+			enable-method = "psci";
+		};
+
+		CPU4: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a57";
+			reg = <0x0 0x100>;
+			next-level-cache = <&L2_1>;
+			enable-method = "psci";
+			L2_1: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+			};
+		};
+
+		CPU5: cpu@101 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a57";
+			reg = <0x0 0x101>;
+			next-level-cache = <&L2_1>;
+			enable-method = "psci";
+		};
 	};
 
 	timer {
-- 
2.26.2

