Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1861617B58E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2020 05:31:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbgCFE3O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 23:29:14 -0500
Received: from mail-yw1-f52.google.com ([209.85.161.52]:45920 "EHLO
        mail-yw1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727433AbgCFE3L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 23:29:11 -0500
Received: by mail-yw1-f52.google.com with SMTP id d206so1049811ywa.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2020 20:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+OwhcmpR7pb9yvMAW/3zddjXHmCNfQqId9+2KCqrSJ0=;
        b=sjVEnqNbTnwO2ySAIcfwaHGIihm2d0ARvf/F6V07mD/Axnj9d9GnoXRS2V9mVxm3W2
         0TS3QpjPCK04d5r1+L/HC5wdj96wA3MIS/6VlekW8qXxENUuLtNEZ+b8IevwkjspC6un
         HOvuEZ5CW96Ob3kx8r7mxGlbq7+x6Zv8ATZTA8PZRmo/fy/qEBkXLRjAyH3mVPPdnYBC
         52N667VdKut1mbrQyKWkxvtTprXMBsL/RCHD/LukuF28fDlbIkI5cGpA/Y2xWipqc+sq
         ZMmyBdtuZHQpXUWYZa9y86Wb+97peQc8sMc4k9kCbrNXX4jLYmICKhd0ynCdcRQmWbcw
         29Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+OwhcmpR7pb9yvMAW/3zddjXHmCNfQqId9+2KCqrSJ0=;
        b=j5tJOzk8DoqkqbzXFPwo7CYncQ7RXOYqG7vY5eO1+e0eJpD1tyo2VZdi0FE5l8tU0s
         3dsAB27hy+wOB+5J9rfC2Az4RwCjboTfvKaQYIR0c/prYETYD9DyTYL8NnfDm7rXz3OM
         j2NQi3r5sIjf5BYI8Qy/RtBT7qMC2mSQ0it1wu3d52ykvxaL3GcT8BgHsxbRhV+318Tm
         GuttbscfwPwnfJIGuGFRlfdd6kYU9UUqKoEwZEBlM8KgshnDzII0af091ZbcRTa16ajl
         i7RdUUtkCkX5zYBhQok7tIUjwxNF5r2FC5gw8k9YrUckQM7f9QqsoCMD9iJLPe0hzDyr
         OaEQ==
X-Gm-Message-State: ANhLgQ1aR1Tx6B9fXcIPau4lVsR9AiPeSXY9Hy2OcL9Nu4i0ATye7poK
        NIxBDAayRm//E5uj7iygJMz0uA==
X-Google-Smtp-Source: ADFU+vuavLb0hi1Kt/CtoekqDopx5Ou6PhT5pbkRZYLJyLf4bvqSt3M6Cw7E2PZn2Fxgjq2Y837RIg==
X-Received: by 2002:a0d:d952:: with SMTP id b79mr2289846ywe.226.1583468949477;
        Thu, 05 Mar 2020 20:29:09 -0800 (PST)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id x2sm12581836ywa.32.2020.03.05.20.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 20:29:09 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     David Miller <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>,
        Johannes Berg <johannes@sipsolutions.net>,
        Dan Williams <dcbw@redhat.com>,
        Evan Green <evgreen@google.com>,
        Eric Caruso <ejcaruso@google.com>,
        Susheel Yadav Yadagiri <syadagir@codeaurora.org>,
        Chaitanya Pratapa <cpratapa@codeaurora.org>,
        Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 17/17] arm64: dts: sdm845: add IPA information
Date:   Thu,  5 Mar 2020 22:28:31 -0600
Message-Id: <20200306042831.17827-18-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200306042831.17827-1-elder@linaro.org>
References: <20200306042831.17827-1-elder@linaro.org>
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
index d42302b8889b..58fd1c611849 100644
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
@@ -1435,6 +1446,46 @@
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

