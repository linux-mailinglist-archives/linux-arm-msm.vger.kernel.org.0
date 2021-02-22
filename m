Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68F8C3218B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Feb 2021 14:29:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231789AbhBVN3K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Feb 2021 08:29:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231968AbhBVN2B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Feb 2021 08:28:01 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B464C0617A9
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 05:26:59 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id h98so14263465wrh.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 05:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qht2WelTwqkDaQzSNfoAbkrAvuNtWrmENyh0P2R4V7c=;
        b=wCcNugEanrPf9ajFXz5ivsL2nfsbqdo3jGcU5OGl15Po0dcfCCH4M1UxlRdDmsCmcT
         /I2diWIS5rK00Ts2uZOoYZj3lVnxfy24hgRJO4d1VIYfrqU290SEDsMLSguf6xstf+2h
         isEhNSITMy/oiYpTWZ9wJsmdCQC3TYQSxwuXR1lkLanl6fBhaJooegGeINu/WwLErDEJ
         +9j+/gpeW0vArM2roNr1yFJWD6Wu9C8iyNTFj3wabKN+qVwOgxZETtn/dFFdLwMeb2VF
         I6AjIa1h0QYzEu0f0N4P7IqPyKuhH/hs25R9lz0pG4Ig6sU026JqLE6bVzZTSfmInYWR
         tdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qht2WelTwqkDaQzSNfoAbkrAvuNtWrmENyh0P2R4V7c=;
        b=oHYYZioyQNi3TIoQW3pFnyh5OmE+d5aIIPWeN66nvpDnK/U4pRpvxT4VIiDZIY527z
         +RmeI0xA0m6KQLBr59jF1W8pp2sn8gPLXvA7lxFQfr6SuQW3L1EwGc6sn1rASeB7MNcD
         rHsVt3bDpDuQ7UUD7U1NPH9JX/MgHdwgadM//CJMZVZxNDhhWt32QjYpTmIy9ins520k
         h7OWLrOAEOXuq6y9ly2Yx4et01tdxxyVGiIDOVLf9ElO7ZIiC3oh4pDEIz2NUwZ6EngS
         abNm3uWsVS8X4RbukzVVtbULD7hUR7DhGEINOriz7VAPfR8HWqzKNqMXWo/a1ZN6vlEm
         SIgg==
X-Gm-Message-State: AOAM532F4uLgossIiJxPz63z07qpTNDKwN4U71r9nfBrz08yEqxxx25D
        oJuiobbfrLlHUlYW0zqmae9rIQ==
X-Google-Smtp-Source: ABdhPJwfF08im2ERxcqlOl6o3K6eaws9L/SWLmntJT8S7+wU/94imDxW6xmDy6Mx/AgVUrZ9tjUEvA==
X-Received: by 2002:adf:e847:: with SMTP id d7mr19082950wrn.367.1614000416647;
        Mon, 22 Feb 2021 05:26:56 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t7sm3079918wmq.44.2021.02.22.05.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 05:26:56 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stanimir.varbanov@linaro.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     bryan.odonoghue@linaro.org, jonathan@marek.ca,
        dikshita@qti.qualcomm.com
Subject: [PATCH v2 2/3] arm64: dts: qcom: sm8250: Add videocc DT node
Date:   Mon, 22 Feb 2021 13:28:16 +0000
Message-Id: <20210222132817.1807788-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222132817.1807788-1-bryan.odonoghue@linaro.org>
References: <20210222132817.1807788-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

This commit adds the videocc DTS node for sm8250.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 81eaa2508d5c..3639792411ce 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/clock/qcom,videocc-sm8250.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -1810,6 +1811,19 @@ usb_2_dwc3: dwc3@a800000 {
 			};
 		};
 
+		videocc: clock-controller@abf0000 {
+			compatible = "qcom,sm8250-videocc";
+			reg = <0 0x0abf0000 0 0x10000>;
+			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>;
+			mmcx-supply = <&mmcx_reg>;
+			clock-names = "iface", "bi_tcxo", "bi_tcxo_ao";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8250-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
-- 
2.29.2

