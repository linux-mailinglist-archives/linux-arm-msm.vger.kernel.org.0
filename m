Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2670184641
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 12:52:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgCMLwp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 07:52:45 -0400
Received: from mail-qk1-f182.google.com ([209.85.222.182]:37423 "EHLO
        mail-qk1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726633AbgCMLwo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 07:52:44 -0400
Received: by mail-qk1-f182.google.com with SMTP id z25so7025906qkj.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2020 04:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UJ8xSSCkhQZKbzWiANWRk5A03053ARYS7+yZlu2NNEg=;
        b=smMtm7ULHqM+dfuhiVEGQ/7r96mu4nexYpUcA1rBx01rGnJh7Vu2au/AEaCQAlFzIh
         M9RZBVJctWBOlMEtvnrcpcfGVJj5PaHrQtDU35QB85aBOwjc1SVP56aYzgtmP08X6hQn
         ycXwQCpmxgIskgrlPzmoHtGZGGSqYZ+AHmVnwshhVMBddwtuDLw04bLTiuoZ9brsfImO
         c2cVIb0ePJsmI414HFVW/6qinwTEnYJ68Vj4AYJ+R1RrejPyqH+qSMlBiQ3sQAo9y+9G
         anG7FgekOfQ81AhTRN0X94X+A5OoaF+ab69JZeg8wVgvYWzy2ibgQcjVylW61EwP3QkI
         Drwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UJ8xSSCkhQZKbzWiANWRk5A03053ARYS7+yZlu2NNEg=;
        b=aQEsi/qTTVx8pZVpul6EpHiEWeZEpAzyeUyVioCV4GcZXuwAHiaIQXjqsdOZqaBgdp
         VYNU0ArG6E9fVEuiFriS7ceRo2DO4fAz6bN4EEtPKrut2By8lKTk55zvySTS8/xn/D4X
         M4khf4b9SaJg5iS8r/GjPSE5oF00vStz369+HUn+3M0Ke/SfD9wJGZBfK8MBEJ3furo+
         0AAoT+rJgcH1/up9f8PhdFrBmKHmp1iQbgOr0A5O0jthZ8aojDYjrp+EZzboakZoVzHw
         ufyhQdsvfeeyasy7L9CV/eAS1eSj0M4xIYImLbnbObU1hZGMoongk1GuxSrrqBVZ2rOK
         /J7w==
X-Gm-Message-State: ANhLgQ3fM4Z+pmta/+SgDVe9DfF1CxQzcQxvqxC6ffvsMFm1JLxk03bJ
        yAEz1jzuu0N+44tmTfzZtfz2Jw==
X-Google-Smtp-Source: ADFU+vvci9y7EIeFeKKTsPP0ctv9BIRy71CzpxrY4rf6mDJwA/mHF2m44kf9fpLrCHIUVGZ2lyv1Aw==
X-Received: by 2002:a05:620a:1102:: with SMTP id o2mr1350183qkk.26.1584100363691;
        Fri, 13 Mar 2020 04:52:43 -0700 (PDT)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id 199sm11031143qkm.7.2020.03.13.04.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 04:52:43 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>,
        David Dai <daidavid1@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        David Miller <davem@davemloft.net>,
        Evan Green <evgreen@chromium.org>,
        Odelu Kukatla <okukatla@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: sdm845: add IPA information
Date:   Fri, 13 Mar 2020 06:52:36 -0500
Message-Id: <20200313115237.10491-2-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200313115237.10491-1-elder@linaro.org>
References: <20200313115237.10491-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add IPA-related nodes and definitions to "sdm845.dtsi".

Signed-off-by: Alex Elder <elder@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 51 ++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index c7ddf215c57e..0ebe12e4c07f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -675,6 +675,17 @@
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		ipa_smp2p_out: ipa-ap-to-modem {
+			qcom,entry-name = "ipa";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		ipa_smp2p_in: ipa-modem-to-ap {
+			qcom,entry-name = "ipa";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	smp2p-slpi {
@@ -1696,6 +1707,46 @@
 			};
 		};
 
+		ipa@1e40000 {
+			compatible = "qcom,sdm845-ipa";
+
+			modem-init;
+			modem-remoteproc = <&mss_pil>;
+
+			reg = <0 0x1e40000 0 0x7000>,
+			      <0 0x1e47000 0 0x2000>,
+			      <0 0x1e04000 0 0x2c000>;
+			reg-names = "ipa-reg",
+				    "ipa-shared",
+				    "gsi";
+
+			interrupts-extended =
+					<&intc 0 311 IRQ_TYPE_EDGE_RISING>,
+					<&intc 0 432 IRQ_TYPE_LEVEL_HIGH>,
+					<&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					<&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ipa",
+					  "gsi",
+					  "ipa-clock-query",
+					  "ipa-setup-ready";
+
+			clocks = <&rpmhcc RPMH_IPA_CLK>;
+			clock-names = "core";
+
+			interconnects =
+				<&rsc_hlos MASTER_IPA &rsc_hlos SLAVE_EBI1>,
+				<&rsc_hlos MASTER_IPA &rsc_hlos SLAVE_IMEM>,
+				<&rsc_hlos MASTER_APPSS_PROC &rsc_hlos SLAVE_IPA_CFG>;
+			interconnect-names = "memory",
+					     "imem",
+					     "config";
+
+			qcom,smem-states = <&ipa_smp2p_out 0>,
+					   <&ipa_smp2p_out 1>;
+			qcom,smem-state-names = "ipa-clock-enabled-valid",
+						"ipa-clock-enabled";
+		};
+
 		tcsr_mutex_regs: syscon@1f40000 {
 			compatible = "syscon";
 			reg = <0 0x01f40000 0 0x40000>;
-- 
2.20.1

