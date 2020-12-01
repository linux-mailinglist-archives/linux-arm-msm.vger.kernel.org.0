Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 467D82CA743
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Dec 2020 16:42:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390571AbgLAPip (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Dec 2020 10:38:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391853AbgLAPim (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Dec 2020 10:38:42 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3214DC061A4F
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Dec 2020 07:37:28 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id k14so3301010wrn.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Dec 2020 07:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lRg3pwqDu/VoieERe7nqqzEqQSkTOmr6u0qBR4l6xpE=;
        b=rG06myb+y4BTb4pXflRO0w2jwQhacHqbLmRYJEZPdaXT9sHju16t0xk92wf4gjXyEv
         43RL/jJZ0irQY5w+91x3FdIdviotfsb7Ms5BKGTnnctgb112Kt3FR/echxIA/00j3YrL
         zxqQpHWpSfQE1dxZ0zpg334ewXVMa8K5UaPBoXhl7hwjjLwHNQAU3NSUKFLMS3jkqBQO
         Kv+Oqy3pW882x7aeE9e8eTCG4G50u8UdZSZcF8Brb646zOCbQvAYzRBm9t6AKAy8/cZT
         1k/MAGNy2F+VMIdgJ3LM1fiVvNV1jNPpvbWuBqp1gh0zGL3HWfiabEtC4m8lM0Mt7pMF
         jGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lRg3pwqDu/VoieERe7nqqzEqQSkTOmr6u0qBR4l6xpE=;
        b=atlV6v7K96t1xp8kWoIuMNeQXpXyLbP2gzrJOEl8pi/ldb8socPvWvdTUIVBmsIWqt
         /71qROm6xturuV4eQlwUmItWIiJbZu5HPj4AocNg4V68X/DSR7VRe9J5xByI2wlQQkeA
         ANfY7CINMuukl9XK7SWC2Fe2ADoEYvGN3TVesx7LdPMn6FRV88cYkagYqPK66a4XKlK8
         Y/4Oi5Ys4jsDbIL8O01Cdn+8hmHdtUrz5jjsK52eU/joXEvJNJpfCJ8O+qDclPySpX0i
         fgbUG4xzJmOQbckPyI4GfU/kfh/6yNMwp1YPSmtx1rgvRwrQMqS5me1FxSHSHY8PV3SP
         YrtQ==
X-Gm-Message-State: AOAM530baZSUaaOBp3Pnm4LmMGhf+tTZ0a1fwoKu8RBJEGzZXX3NR4fB
        E4wQ4UnGobuYElSpfpQFLSGk+Q==
X-Google-Smtp-Source: ABdhPJwsyc6hrB+A4gdRKX7OrQSq2G7QnmL9sfGctUTgOgxJB31FlrU1KXP4y+M4/YBiZc+9B/0j5g==
X-Received: by 2002:a05:6000:187:: with SMTP id p7mr4531496wrx.240.1606837046877;
        Tue, 01 Dec 2020 07:37:26 -0800 (PST)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id y7sm302171wmb.37.2020.12.01.07.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 07:37:26 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 4/6] arm64: dts: qcom: sm8250: add wsa and va codec macros
Date:   Tue,  1 Dec 2020 15:37:04 +0000
Message-Id: <20201201153706.13450-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201201153706.13450-1-srinivas.kandagatla@linaro.org>
References: <20201201153706.13450-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for WSA and VA codec macros along with WSA soundwire
controller required for getting audio on RB5.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 56 ++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 4e1309b6571e..19dd7460e586 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2702,6 +2702,62 @@
 	                };
 		};
 
+		wsamacro: codec@3240000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&wsa_swr_clk_active &wsa_swr_data_active>;
+
+			compatible = "qcom,sm8250-lpass-wsa-macro";
+			reg = <0 0x3240000 0 0x1000>;
+			clocks = <&audiocc LPASS_CDC_WSA_MCLK>,
+				<&audiocc LPASS_CDC_WSA_NPL>,
+				<&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				<&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				<&aoncc LPASS_CDC_VA_MCLK>,
+				<&vamacro>;
+
+			clock-names = "mclk", "npl", "macro", "dcodec", "va", "fsgen";
+
+			#clock-cells = <0>;
+			clock-frequency = <9600000>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		swr0: soundwire-controller@3250000 {
+			reg = <0 0x3250000 0 0x2000>;
+			compatible = "qcom,soundwire-v1.5.1";
+			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&wsamacro>;
+			clock-names = "iface";
+
+			qcom,din-ports = <2>;
+			qcom,dout-ports = <6>;
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x07 0x1F 0x3F 0x07 0x1F 0x3F 0x0F 0x0F>;
+			qcom,ports-offset1 = 		/bits/ 8 <0x01 0x02 0x0C 0x06 0x12 0x0D 0x07 0x0A >;
+			qcom,ports-offset2 = 		/bits/ 8 <0xFF 0x00 0x1F 0xFF 0x00 0x1F 0x00 0x00>;
+			qcom,ports-block-pack-mode = 	/bits/ 8 <0x0 0x0 0x1 0x0 0x0 0x1 0x0 0x0>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
+		vamacro: codec@3370000 {
+			compatible = "qcom,sm8250-lpass-va-macro";
+			reg = <0 0x3370000 0 0x1000>;
+			clocks = <&aoncc LPASS_CDC_VA_MCLK>,
+				<&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				<&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+
+			clock-names = "mclk", "macro", "dcodec";
+
+			#clock-cells = <0>;
+			clock-frequency = <9600000>;
+			clock-output-names = "fsgen";
+			#sound-dai-cells = <1>;
+		};
+
 		adsp: remoteproc@17300000 {
 			compatible = "qcom,sm8250-adsp-pas";
 			reg = <0 0x17300000 0 0x100>;
-- 
2.21.0

