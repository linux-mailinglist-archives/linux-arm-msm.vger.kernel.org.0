Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2E5B2CC492
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 19:12:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387826AbgLBSJP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 13:09:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387640AbgLBSJP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 13:09:15 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0741C061A48
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 10:07:55 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id a6so9845311wmc.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 10:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rNKqlORltziU7c3DN3fZG1eTqDwrx8ly3QE5W9hpJ70=;
        b=IeAmutYYU1MsJRHVWXY7jAkd7WUtsNwPemBO7pQurZqSJXlakZ1aNm888uOR3xypK9
         S2AI1ravNYkot7M8SWf2fNwLRLgT4nWH+6gIN2uHL484qOElRMFnVvtE9pt7SvTTE0Ao
         SUCFPDQ2zmmP0i4YvsYYXwPdcAC3TIw7rSbnHMe8PI+9Cl+ipWXJ3t/qSRHAfFKflebt
         qiOQuXwFbUh5XDvbUwunCvZn3merjeSma7wcnaJZDMiAMbaJ3VIYd74NkeY/85tr0t20
         RBkqc7iEWH8kz9UwFIe1TIJGDa4M/LZEsLsPjgGfike5pG/GB1huC+4v42i2uq6c5wlF
         yGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rNKqlORltziU7c3DN3fZG1eTqDwrx8ly3QE5W9hpJ70=;
        b=pb+9WCc7B9+8RvKv/GaCQsMBshtCm5RP0P4gH27F7o7MBLK9d80JTl3zMylt2E85Th
         aL7Et7lBpFNSY38aAOW3PDpIlmw8aGEdpra6sjg98jKT9gUEv+YvzMjFjJmPvI5oajYc
         ViFKeyP/d4r4yZuUmYhy+WxcKzVPIPlYTFoCh09fTY1Cik2xybdMugilKOETy7Tzp9o8
         //Jzlpl/oL+tAJTvbg1GkM9kQfbvsRg+0XwOqUbhPJkyqpUdF/XlHNWTJpZuO+Xguv61
         RdjTejtmznk0d6NjNyjdmlCv+DZQ7UQ3Wrp0egIOh1elr+kKdpoamO2gRrfv9f/d9FL/
         dojQ==
X-Gm-Message-State: AOAM531v2mfLD26FjbEy4Qi79RnZMaJt1QVV0jgIandw4rbguykSVnD1
        S+9HsNDQAMrRxlaIL+l6Vc2R8/GWb/T8XFZS
X-Google-Smtp-Source: ABdhPJzQRg+gKMvgYx6GpPFaAIOa+lxCOS/e3Q2BEz8+J8T+557IxLGIzx5ApPX8qyUByZsF8MZTuA==
X-Received: by 2002:a1c:4904:: with SMTP id w4mr4338823wma.140.1606932474442;
        Wed, 02 Dec 2020 10:07:54 -0800 (PST)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id a18sm3004404wrr.20.2020.12.02.10.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 10:07:53 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 2/6] arm64: dts: qcom: sm8250: add audio clock controllers
Date:   Wed,  2 Dec 2020 18:07:37 +0000
Message-Id: <20201202180741.16386-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201202180741.16386-1-srinivas.kandagatla@linaro.org>
References: <20201202180741.16386-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add audiocc and aoncc clock controller nodes required for audio on RB5.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index d44120a6eadb..cddbb53db193 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -7,6 +7,8 @@
 #include <dt-bindings/clock/qcom,gcc-sm8250.h>
 #include <dt-bindings/clock/qcom,gpucc-sm8250.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sm8250-lpass-audiocc.h>
+#include <dt-bindings/clock/qcom,sm8250-lpass-aoncc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom-aoss-qmp.h>
@@ -2585,6 +2587,26 @@
 					<GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		audiocc: clock-controller@3300000 {
+			compatible = "qcom,sm8250-lpass-audiocc";
+			reg = <0 0x03300000 0 0x30000>;
+			#clock-cells = <1>;
+			clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				<&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				<&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "core", "audio", "bus";
+		};
+
+		aoncc: clock-controller@3380000 {
+			compatible = "qcom,sm8250-lpass-aoncc";
+			reg = <0 0x03380000 0 0x40000>;
+			#clock-cells = <1>;
+			clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				<&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				<&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "core", "audio", "bus";
+		};
+
 		adsp: remoteproc@17300000 {
 			compatible = "qcom,sm8250-adsp-pas";
 			reg = <0 0x17300000 0 0x100>;
-- 
2.21.0

