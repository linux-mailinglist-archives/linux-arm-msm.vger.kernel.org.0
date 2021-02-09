Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16C71314F76
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 13:50:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbhBIMtz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 07:49:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbhBIMs6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 07:48:58 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2489C06178C
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 04:48:17 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id r65so4624151lff.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 04:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CkMqtRiTtrh3rDzNk9MszUw8gNTXkM+DptzGY6xVabA=;
        b=dj2YU+XJgH33FouhY8L+yGx3RxrVqvklVk6C2GasZUduPX1hbaXZW7Au5vUtb9ZjCl
         32j7ms+DmOLAFYbNSP1+0ijQmuXj1p/8AuVAiD5jbHCNlItDhWC8RKpKpW9wclWaKzvc
         tgd+0TFL45uAIQBIFus6va5XY71Pb+fsVkvtxL5CAOFoT3koW9+nCb7sQhA6gTcdvQw3
         XrjSrixao0LkvAR53Lox7q8JnnlYsMMSa9W8fnrDH7lEPQznug/mt1QeN7mNf7qDecv9
         AGxnvTapLFhg1eU/EMbemdIVjoR4eEqVlKVHDxaxzkeXpB0S5bxZly9ixP2xvATCQWTu
         0DsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CkMqtRiTtrh3rDzNk9MszUw8gNTXkM+DptzGY6xVabA=;
        b=W7y2MWtzJLKO6e783z6xNfP6/CIrCdDiSrpRSIDfUiEjmGrMv4C7Wt5gD0bqU5NS7P
         n5YV56h6bJxCf7p7BOcjnmj3kpaa/fqfYsF5ZxYdtVKwylzl3AyXeS3LVHRulE382tSJ
         hGCY2hD/iAiAt2NPHmQPc6h4n8l6m/xXrhktgRAhd8crOqjgS0XZNpKud7ZSJeASsZxU
         7K2fYY60a5ijTM6eoasOcey8TJMFsGGnJFoVLZtDlCWjCWsTX5GvuMDWfzycTp1UpiGr
         OtgqkJamqKl9YbbrJsmcZKbyWQxS9Cc6BFujwMwwixU94bWmYBQghaC4kPTiZpKqOgsi
         MvRQ==
X-Gm-Message-State: AOAM5319SKp3VBdsQksWvaLaE3mBKFuJrsAeKc9qBLYqQh8mdLXcDrF/
        0j1ePp3DVl6ivabmztdglCD9rA==
X-Google-Smtp-Source: ABdhPJyo4/lcs3EWX9NzujKYd/p0E5/naSIJGZUDoA0LiQ6i0rvXTG/2ezbedzYbkdWQ+FwDuoyiEw==
X-Received: by 2002:a19:441:: with SMTP id 62mr828605lfe.274.1612874896532;
        Tue, 09 Feb 2021 04:48:16 -0800 (PST)
Received: from eriador.lan ([94.25.229.138])
        by smtp.gmail.com with ESMTPSA id e16sm1220653ljn.105.2021.02.09.04.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 04:48:16 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: qcom: sm8250: add pinctrl for SPI using GPIO as a CS
Date:   Tue,  9 Feb 2021 15:47:57 +0300
Message-Id: <20210209124758.990681-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209124758.990681-1-dmitry.baryshkov@linaro.org>
References: <20210209124758.990681-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

GENI SPI controller shows several issues if it manages the CS on its own
(see 37dd4b777942 ("arm64: dts: qcom: sc7180: Provide pinconf for SPI to
use GPIO for CS")) for the details. Provide pinctrl entries for SPI
controllers using the same CS pin but in GPIO mode.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 100 +++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index e43e1367ceb7..0044911f7790 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3063,6 +3063,106 @@ qup_spi19_cs: qup-spi19-cs {
 				function = "qup19";
 			};
 
+			qup_spi0_cs_gpio: qup-spi0-cs-gpio {
+				pins = "gpio31";
+				function = "gpio";
+			};
+
+			qup_spi1_cs_gpio: qup-spi1-cs-gpio {
+				pins = "gpio7";
+				function = "gpio";
+			};
+
+			qup_spi2_cs_gpio: qup-spi2-cs-gpio {
+				pins = "gpio118";
+				function = "gpio";
+			};
+
+			qup_spi3_cs_gpio: qup-spi3-cs-gpio {
+				pins = "gpio122";
+				function = "gpio";
+			};
+
+			qup_spi4_cs_gpio: qup-spi4-cs-gpio {
+				pins = "gpio11";
+				function = "gpio";
+			};
+
+			qup_spi5_cs_gpio: qup-spi5-cs-gpio {
+				pins = "gpio15";
+				function = "gpio";
+			};
+
+			qup_spi6_cs_gpio: qup-spi6-cs-gpio {
+				pins = "gpio19";
+				function = "gpio";
+			};
+
+			qup_spi7_cs_gpio: qup-spi7-cs-gpio {
+				pins = "gpio23";
+				function = "gpio";
+			};
+
+			qup_spi8_cs_gpio: qup-spi8-cs-gpio {
+				pins = "gpio27";
+				function = "gpio";
+			};
+
+			qup_spi9_cs_gpio: qup-spi9-cs-gpio {
+				pins = "gpio128";
+				function = "gpio";
+			};
+
+			qup_spi10_cs_gpio: qup-spi10-cs-gpio {
+				pins = "gpio132";
+				function = "gpio";
+			};
+
+			qup_spi11_cs_gpio: qup-spi11-cs-gpio {
+				pins = "gpio63";
+				function = "gpio";
+			};
+
+			qup_spi12_cs_gpio: qup-spi12-cs-gpio {
+				pins = "gpio35";
+				function = "gpio";
+			};
+
+			qup_spi13_cs_gpio: qup-spi13-cs-gpio {
+				pins = "gpio39";
+				function = "gpio";
+			};
+
+			qup_spi14_cs_gpio: qup-spi14-cs-gpio {
+				pins = "gpio43";
+				function = "gpio";
+			};
+
+			qup_spi15_cs_gpio: qup-spi15-cs-gpio {
+				pins = "gpio47";
+				function = "gpio";
+			};
+
+			qup_spi16_cs_gpio: qup-spi16-cs-gpio {
+				pins = "gpio51";
+				function = "gpio";
+			};
+
+			qup_spi17_cs_gpio: qup-spi17-cs-gpio {
+				pins = "gpio55";
+				function = "gpio";
+			};
+
+			qup_spi18_cs_gpio: qup-spi18-cs-gpio {
+				pins = "gpio59";
+				function = "gpio";
+			};
+
+			qup_spi19_cs_gpio: qup-spi19-cs-gpio {
+				pins = "gpio3";
+				function = "gpio";
+			};
+
 			qup_spi0_data_clk: qup-spi0-data-clk {
 				pins = "gpio28", "gpio29",
 				       "gpio30";
-- 
2.30.0

