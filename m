Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6DF246E81A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 13:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237141AbhLIMKo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 07:10:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237201AbhLIMKl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 07:10:41 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E4D8C0698C4
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Dec 2021 04:07:07 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id i5so9334181wrb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Dec 2021 04:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/yLbHMPc4fjBfcCF0phtg6VZEZ5ftsCYoS5ciOiSFeU=;
        b=ms6+lIoVD5aNOBnWiJw4l8WclwmAL7F9FXiPl6e5amw+1IiTB9DzQcs8uYLiV+cUGE
         KKuSfDkp8HRA+czZK5aK4t9wvKGjTbl5NH+bJaVVDVBsvrUKRe1qDyD+hN9ViINoWD6+
         lqZTxLzaoHIJTVtKByCfFSTXexbI0FiJ+v56DmllxdtiBagBRLBv3oOZyBQWhAGgfzYB
         KeQGO7euVmv/mCmkMFo1OfiShZRmJMaErnWCMBb2yyEgmsRtikNs9EIqymf+QHijb7pl
         b6PbVEX4J9T0xLpKdq4bO/XHFaQQ7DNpwE/8S3MI+nfQvvBpyxBiYIgZv6V44dVcLUHB
         XVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/yLbHMPc4fjBfcCF0phtg6VZEZ5ftsCYoS5ciOiSFeU=;
        b=0A9T0le1yrKalAomG0hZE4pFLr3zrjf1sVkAOzfA2cGWtFwfJ5U/Fs0eY5EcylxEfj
         kAL05nsHIvlfr70RVI/uEKVbTq+40/7Emv3WjidAQvAOO1ZazRxI1JpXP/kf1F7ay6YC
         Z97a/ZnY3x2KlC//SOgWGnZWmZybXkkGfqSn4Q56tM7mGzBrwoS7Jw9+COi1ZonmiErC
         5wKpzyNimNc1fsYA7C+wn6pp1yDogZ9lbudPZigk5z6zqlFA+XFVST1ftzFkaz734hDH
         w67/vVQizsWCiJw6urcfVKl11m8cnxRH1OtpsTyN68PEMg0NbZpAVuzIzKLmeTF5UPYL
         9fLw==
X-Gm-Message-State: AOAM530Sue2KDONmTAaFRPjVqDfjwkGUK6Is4G5Grf4mdoZF5fuHr95k
        MMRFDyrWyNpCE8dI9/Zka1QLCA==
X-Google-Smtp-Source: ABdhPJw8A0ceeX5B3052YIiAS+wQV5uUHv/XXGVeWUYkOE3fe0yKYjHZPtOjTtTjlS00CW7zJOohqQ==
X-Received: by 2002:adf:c5d1:: with SMTP id v17mr5748532wrg.571.1639051626129;
        Thu, 09 Dec 2021 04:07:06 -0800 (PST)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id 4sm7513289wrz.90.2021.12.09.04.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 04:07:05 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     robh+dt@kernel.org, gregkh@linuxfoundation.org
Cc:     devicetree@vger.kernel.org, ekangupt@qti.qualcomm.com,
        jeyr@codeaurora.org, bkumar@qti.qualcomm.com,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 8/8] arm64: dts: qcom: add non-secure domain property to fastrpc nodes
Date:   Thu,  9 Dec 2021 12:06:26 +0000
Message-Id: <20211209120626.26373-9-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211209120626.26373-1-srinivas.kandagatla@linaro.org>
References: <20211209120626.26373-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jeya R <jeyr@codeaurora.org>

FastRPC DSP domain would be set as secure if non-secure dsp property is not
added to the fastrpc DT node. Add this property to DT files of msm8916,
sdm845, sm8150, sm8250 and sm8350 so that nothing is broken after secure
domain patchset.

This patch is purely for backward compatibility reasons.

Signed-off-by: Jeya R <jeyr@codeaurora.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi  | 2 ++
 arch/arm64/boot/dts/qcom/sm8150.dtsi  | 3 +++
 arch/arm64/boot/dts/qcom/sm8250.dtsi  | 3 +++
 arch/arm64/boot/dts/qcom/sm8350.dtsi  | 3 +++
 5 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index c1c42f26b61e..137a479449d4 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1365,6 +1365,7 @@
 					compatible = "qcom,fastrpc";
 					qcom,smd-channels = "fastrpcsmd-apps-dsp";
 					label = "adsp";
+					qcom,non-secure-domain;
 
 					#address-cells = <1>;
 					#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 526087586ba4..4aebfed4ec00 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -838,6 +838,7 @@
 				compatible = "qcom,fastrpc";
 				qcom,glink-channels = "fastrpcglink-apps-dsp";
 				label = "adsp";
+				qcom,non-secure-domain;
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -888,6 +889,7 @@
 				compatible = "qcom,fastrpc";
 				qcom,glink-channels = "fastrpcglink-apps-dsp";
 				label = "cdsp";
+				qcom,non-secure-domain;
 				#address-cells = <1>;
 				#size-cells = <0>;
 
diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 81b4ff2cc4cd..9ac213bb96b7 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1751,6 +1751,7 @@
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "sdsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
@@ -2994,6 +2995,7 @@
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "cdsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
@@ -3439,6 +3441,7 @@
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index f0d342aa662d..06be221ad5b6 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2265,6 +2265,7 @@
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "sdsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
@@ -2330,6 +2331,7 @@
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "cdsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
@@ -4100,6 +4102,7 @@
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index d134280e2939..80f753cbe91c 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1278,6 +1278,7 @@
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "sdsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
@@ -1347,6 +1348,7 @@
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "cdsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
@@ -1643,6 +1645,7 @@
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-- 
2.21.0

