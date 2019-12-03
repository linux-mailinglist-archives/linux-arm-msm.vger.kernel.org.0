Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2590D10F70A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2019 06:24:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727234AbfLCFYE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Dec 2019 00:24:04 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:35399 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727205AbfLCFYE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Dec 2019 00:24:04 -0500
Received: by mail-pj1-f65.google.com with SMTP id s8so1040547pji.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2019 21:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=uC4Bl0qQMP+1vSYZwhrmDHQhbcFrxWT9l8fOqCUV/2M=;
        b=CsBQbbk33gwSnGTheESyeysKYf5sXnfg5mZVFnO0DaOw2FrrxXsCZTUBhUS/MrDmrP
         xVJsth6AadZWqmV4Cn4jnVRF5YTOi8prYKzDcQQXIq11NQhRCeNijr9gQhIzk8Q5YrjC
         aqHhpgAtaZFym1+lC7ZBR+uSsLZH+/MjroeeuZi9MkRiNabtAHU6GSl6otUCcOYnDShf
         A8TGRHlbu8P5X4OrSmpaOVuFrxhQkejScB+1zzLtgUvQGe1JLdaBKW+f/cLcMGV0HG/5
         sfcHMxgnT4oDpY80QZ6aWaJyWYFiHRnZmHyef0Kg3WDmMDxBCtCQFFIQsvjcpm2Dbb2S
         yBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=uC4Bl0qQMP+1vSYZwhrmDHQhbcFrxWT9l8fOqCUV/2M=;
        b=GljI8Qy26mFp/ugdcvyvT5QNG7EoG6FVQ/uQqk1WCT+VZG874YjwSpU4ajElh6M2Ae
         M4h1K49Qx76u+WUIssdWoIH8KfUzI9ZzkSNGjPeIh3OpC8m2y6qUqoYowx987mjmI5OT
         q2+h2SwdkxR2JfI7zPVbeejCfrwqn4JTOnbWMwphspjHnvhOGGy7vb5rNF8LZsXHU7JW
         Gddahk9/ceN16X+548pS3bSHUe/h0hPlViyx2cTcnP2vES5FaeemJG67GR16Er/JDMuN
         +bv0haTyacNEY88wdtJ1vYi8FXa6GjpG8uH9JQGSZXg9jZ3IW+lIDvnErMUJI7nmHisK
         TI5g==
X-Gm-Message-State: APjAAAXYxyYZZIvZ3tZKkUQWdlBwXtnTmgI6oLDUlOK0W8evN5qx6V6j
        KCoNaXx78Vek/o4LotS77DlPgw==
X-Google-Smtp-Source: APXvYqzAkPb+58kmN+jZ+GoeV3AgIBAOA1Hp2v7nvCCOaOjQLYETIKHjGrMPFYLkgjefi6AmYAf02A==
X-Received: by 2002:a17:902:126:: with SMTP id 35mr3273197plb.105.1575350643416;
        Mon, 02 Dec 2019 21:24:03 -0800 (PST)
Received: from localhost ([14.96.109.134])
        by smtp.gmail.com with ESMTPSA id l18sm1415986pff.79.2019.12.02.21.24.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 21:24:02 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, swboyd@chromium.org,
        sivaa@codeaurora.org, Andy Gross <agross@kernel.org>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v2 7/9] arm64: dts: sdm845: thermal: Add critical interrupt support
Date:   Tue,  3 Dec 2019 10:53:28 +0530
Message-Id: <2e01f6891b5cbdc5dec754e7e3afc737ecbaa87a.1575349416.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1575349416.git.amit.kucheria@linaro.org>
References: <cover.1575349416.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1575349416.git.amit.kucheria@linaro.org>
References: <cover.1575349416.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register critical interrupts for each of the two tsens controllers

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Message-Id: <3686bd40c99692feb955e936b608b080e2cb1826.1568624011.git.amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index ddb1f23c936fe..8986553cf2eb6 100644
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
2.17.1

