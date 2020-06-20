Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAD1B202460
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 16:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728444AbgFTOsq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Jun 2020 10:48:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728433AbgFTOsn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Jun 2020 10:48:43 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50FEEC06174E;
        Sat, 20 Jun 2020 07:48:43 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id r9so10917673wmh.2;
        Sat, 20 Jun 2020 07:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iDykADcxrijpqv/X+4zRhTKtVeA53wtr3kZ/KK6Yknc=;
        b=J7Q0k4xazhrgTh5VPqb5vVtvVnAQUxeodb+dzDqLGvJrqG7htnM5ErZWBNI+q/ZQAE
         vbidlWrnjRon7INnbfePJsJjulJYceMcyh1h4dJVt45HwIYq+kWTZwOyBY3yVCm2ZB9T
         arTMjWuGitXg5AifgLdHFjyj+jOvOcbSmxSZ/GDLuLhG00r9spHWcwL72eEdpZ3qs0ve
         gqAVhNZ99FVC/9z4sz51pdxuyVEqJgsGjYKO6g2uTeVo5gseMR+n9YYlBAylr1goZBKU
         1usdXPoT/ubHobG3urVYurXB1FAx9R5wfOMnyxKhoxFfzEmt9o2oWozbpbiMrFuHyq/l
         TpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iDykADcxrijpqv/X+4zRhTKtVeA53wtr3kZ/KK6Yknc=;
        b=AS/xW3pG1Su+EtM21H7itbEzrTiAzSFkCqydIiSh8PR9BlAqW9T5PNhr1bznf5JEWR
         D9bdpWwKtYqunPmzGeXgri3RbS3f5I0Ie5P1e1ZZ0NSB+D/EQik3JI9jRrNElijtTQWa
         kBIa2IDE+sHVmp66lMTmhxXN/koH5HQEq6fZVS6SguvqGPJsTvyf4YKLjEQ4lTBhADgs
         vUNkdByFUiQ/5cm65XI76F5I9nwloj262Rq8lz9Qq3vgKzD+G9t/3KvyHJA7LZk9S6HR
         rDXJoOshYgfzCppNKA3xoParKVh6EYYX9SNa7Bqu9AUoiyxrIHyBbnmoiQN6ms7gbl2F
         S1Dw==
X-Gm-Message-State: AOAM5316NRm7Vu+LreuaNvuF+qwo5/ZYLKY8L7xY0334qYssKzyJ61/V
        NcDeC+fvkaAyAGJ7C7JaLs8=
X-Google-Smtp-Source: ABdhPJzK+JnkPaEomg+uDiJites2Z/svU9kDxcqK//WHNt1MFHp5Nkk3E0e4oqkFB2vOs0hnBGLuEQ==
X-Received: by 2002:a7b:c113:: with SMTP id w19mr9542513wmi.161.1592664522060;
        Sat, 20 Jun 2020 07:48:42 -0700 (PDT)
Received: from localhost.localdomain (abae138.neoplus.adsl.tpnet.pl. [83.6.168.138])
        by smtp.googlemail.com with ESMTPSA id 63sm11928379wra.86.2020.06.20.07.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 07:48:41 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 15/21] arm64: dts: qcom: msm8994: Add BLSP2 UART2 node
Date:   Sat, 20 Jun 2020 16:46:31 +0200
Message-Id: <20200620144639.335093-16-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200620144639.335093-1-konradybcio@gmail.com>
References: <20200620144639.335093-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a BLSP2 UART2 node to enable serial connection.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index df35c975c94c..20e859eb1318 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -243,6 +243,15 @@ blsp1_uart2: serial@f991e000 {
 				 <&gcc GCC_BLSP1_AHB_CLK>;
 		};
 
+		blsp2_uart2: serial@f995e000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0xf995e000 0x1000>;
+			interrupt = <GIC_SPI 146 IRQ_TYPE_EDGE_FALLING>;
+			clock-names = "core", "iface";
+			clocks = <&gcc GCC_BLSP2_UART2_APPS_CLK>,
+					<&gcc GCC_BLSP2_AHB_CLK>;
+		};
+
 		spmi_bus: qcom,spmi@fc4c0000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0xfc4cf000 0x1000>,
-- 
2.27.0

