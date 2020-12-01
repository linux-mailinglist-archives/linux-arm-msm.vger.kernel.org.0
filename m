Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E21C2CA730
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Dec 2020 16:38:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388149AbgLAPh6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Dec 2020 10:37:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387532AbgLAPh6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Dec 2020 10:37:58 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9B8FC0617A6
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Dec 2020 07:37:17 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id w206so373268wma.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Dec 2020 07:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7gChBksxn1qEPSD3R08ZEmaSNW2wV6LYIITXUj3191A=;
        b=OHq3343W+aiwvjBes5ZnNTv3M3FuJ79KnBXcTqKWgT0cciUJ6pU+4mU6xulFiZjo78
         VDnDZ/QiFFwV8GUqiE4se8aPBNP2v8jsPkhz4H07Z2M0h5+m05NrCPbd67wKB5HRZSsi
         17A7NsnoCEZPlUj6YMLiows5Hyx2DIZWGQOqcwPpfCcovw1qE75wWOrHbZ+4ZyvlcYa+
         MMXTWv1VRZd5RdKXeYX43Gc8+e1WfjbOlUHLzlJ2viPvVU6ov5mGVr8TcHRiwDoPW0jL
         GMlEj1DkbF7z1mDE229gxeZvk6yhdV/lnCF1SqqKPSRrOS5j58vWXWGwxuGvE/SYWaC/
         PZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7gChBksxn1qEPSD3R08ZEmaSNW2wV6LYIITXUj3191A=;
        b=Zf0Q/yDmP+wEF+OzN4yjZBqngOl9E+HPB1OyLLOfGJQR9ta1z4Y+kKIFLNoG7LmQ1L
         fYQhRUKA+f9yBYSvA5w+bxQjXSDQAD2YPTQQ4f0HwtFURhHckdmPuRAhVlzM3LT2vi0J
         k4WZ+A5y43f9Jn+5lfASZBaS1wUX/Rp4Y4lO8N6tLr1tYix+xqYESOFDZf7Xn+sdn78J
         P3+TAs4HKir+kNaTPPlsdZ+hiarjAGdl6kWO6Ngh+olYZ7O+gYPbsiV/RkUiNnCTP61q
         XPW4LCtA1jJijYVsGWW3xYdkRq4YSDW+zkIvw3FQq1xP9zEKJz2IXMOwFRyu3g7O/p/r
         30Ow==
X-Gm-Message-State: AOAM532d4YUk4BPm8RY+lA3BQosyOHI8VLoSGzkm+uj7axmbZaAqWTYp
        gpumn0R5YZ9PJdYvWQlKtreoUUFvHaKBvEIo
X-Google-Smtp-Source: ABdhPJyvUOqxTG2bB4Si4yZtrjPlvnby1exWonhRpHIQNC99ydXThu1nAChjuanY5zDT+pE9pRCBXQ==
X-Received: by 2002:a05:600c:ce:: with SMTP id u14mr3310247wmm.150.1606837036532;
        Tue, 01 Dec 2020 07:37:16 -0800 (PST)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id y7sm302171wmb.37.2020.12.01.07.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 07:37:15 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 1/6] arm64: dts: qcom: sm8250: add apr and its services
Date:   Tue,  1 Dec 2020 15:37:01 +0000
Message-Id: <20201201153706.13450-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201201153706.13450-1-srinivas.kandagatla@linaro.org>
References: <20201201153706.13450-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add apr node and its associated services required for audio on RB5.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 56 ++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 65acd1f381eb..3b4e98b13d36 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -11,6 +11,8 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom-aoss-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,apr.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/thermal/thermal.h>
 
@@ -2620,6 +2622,60 @@
 				label = "lpass";
 				qcom,remote-pid = <2>;
 
+				apr {
+					compatible = "qcom,apr-v2";
+					qcom,glink-channels = "apr_audio_svc";
+					qcom,apr-domain = <APR_DOMAIN_ADSP>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					apr-service@3 {
+						reg = <APR_SVC_ADSP_CORE>;
+						compatible = "qcom,q6core";
+						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+					};
+
+					q6afe: apr-service@4 {
+						compatible = "qcom,q6afe";
+						reg = <APR_SVC_AFE>;
+						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+						q6afedai: dais {
+							compatible = "qcom,q6afe-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+						};
+
+						q6afecc: cc {
+							compatible = "qcom,q6afe-clocks";
+							#clock-cells = <2>;
+						};
+					};
+
+					q6asm: apr-service@7 {
+						compatible = "qcom,q6asm";
+						reg = <APR_SVC_ASM>;
+						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+						q6asmdai: dais {
+							compatible = "qcom,q6asm-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+							iommus = <&apps_smmu 0x1801 0x0>;
+						};
+					};
+
+					q6adm: apr-service@8 {
+						compatible = "qcom,q6adm";
+						reg = <APR_SVC_ADM>;
+						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+						q6routing: routing {
+							compatible = "qcom,q6adm-routing";
+							#sound-dai-cells = <0>;
+						};
+					};
+				};
+
 				fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
-- 
2.21.0

