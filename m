Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFD1A12E781
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2020 15:55:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728656AbgABOzI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jan 2020 09:55:08 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41029 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728547AbgABOzF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jan 2020 09:55:05 -0500
Received: by mail-pf1-f196.google.com with SMTP id w62so22143541pfw.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jan 2020 06:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eKeVu2oWXHPKcwPZ0buj2l0Dr4vKizCXYv05Mdip8Hc=;
        b=aOCg3jZT5CYlpjXjebRIQsZa+VwXZzFX1CHogqR1kDbwM739xnyKPnNsiU0ptp3MHs
         vYNvseYPu6YsagozpbIM+kpO23j4wCrPMT6ASiFLWD+ZaIV5n7iHk/fpS6a0OrPjqDVB
         wLSsrxtnlhLWi2/A8IUrPe8e747GUP8eJM/bQwrN0xzPid2xkGtLIe4SNXhd2UmBeDXb
         rJ1hS2kHlqSKjfitfC0rWgXOX4GVmoT2jexzlI3Hm/HRdJShXdVFreaxXnF1jCjUnBxQ
         eDpled0SOGTiaEhhrhFfcpDsaF0de9fkEsolCKoKzyU4ULTQtRoo1ow8VgIgfk78uBZq
         oWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eKeVu2oWXHPKcwPZ0buj2l0Dr4vKizCXYv05Mdip8Hc=;
        b=PfJItISDVilkTTY1Aw1bijcsiYnXsmAsqPXf0dsHn8mRuSzwzmI+UdPUwjfmVRqoN+
         SVQP5QkOPBintRDMSKV50YYcGEFr2UXXveRdNwL6f2eC3//CS36jf6aXn0q8rlGvrnWS
         hh+EBwoMszhoXzhs7erwsAfqpYDX/kRQmE31qc18o0893crFg7dF6d7JWflnwSg7EFry
         vy+haVINkDiOhdqwm88bMl/O7mjfYsq813v1P6278I8ev/xigi57oIUHhqEIYXq3KR9F
         ZSThsuFCZaZcXyLzU72sFetT4ODObjv8wwoKrUl1D3urmdo5E+SqVvRLrWLPVIDdcgSA
         u24w==
X-Gm-Message-State: APjAAAVe4aZkqtJ3KcNFJcl02Eu/ZuNfnYOjRcQ3re3bx3KPyCotD8/E
        50kweDC8GSwi9Q107aTDjN4bf+x0Cf3vSA==
X-Google-Smtp-Source: APXvYqxB4xjsUOgn8YNPlgmgcM4Aw1ezSDGoiNG8NiNNvB6RvRNGaCPhPTEpWobjPT0hyB0c+LByXw==
X-Received: by 2002:a63:111e:: with SMTP id g30mr92154214pgl.251.1577976904992;
        Thu, 02 Jan 2020 06:55:04 -0800 (PST)
Received: from localhost ([103.195.202.148])
        by smtp.gmail.com with ESMTPSA id a28sm63716786pfh.119.2020.01.02.06.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2020 06:55:04 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, swboyd@chromium.org,
        sivaa@codeaurora.org, Andy Gross <agross@kernel.org>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v3 7/9] arm64: dts: sdm845: thermal: Add critical interrupt support
Date:   Thu,  2 Jan 2020 20:24:32 +0530
Message-Id: <a86be6121986d1c37b34f791532cd65ec13f1e00.1577976221.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1577976221.git.amit.kucheria@linaro.org>
References: <cover.1577976221.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register critical interrupts for each of the two tsens controllers

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Link: https://lore.kernel.org/r/3686bd40c99692feb955e936b608b080e2cb1826.1568624011.git.amit.kucheria@linaro.org
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index ddb1f23c936f..8986553cf2eb 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2950,8 +2950,9 @@
 			reg = <0 0x0c263000 0 0x1ff>, /* TM */
 			      <0 0x0c222000 0 0x1ff>; /* SROT */
 			#qcom,sensors = <13>;
-			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "uplow";
+			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
 			#thermal-sensor-cells = <1>;
 		};
 
@@ -2960,8 +2961,9 @@
 			reg = <0 0x0c265000 0 0x1ff>, /* TM */
 			      <0 0x0c223000 0 0x1ff>; /* SROT */
 			#qcom,sensors = <8>;
-			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "uplow";
+			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.20.1

