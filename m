Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E130138608
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jan 2020 12:30:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732706AbgALLaS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Jan 2020 06:30:18 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54718 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732693AbgALLaQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Jan 2020 06:30:16 -0500
Received: by mail-wm1-f66.google.com with SMTP id b19so6560755wmj.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jan 2020 03:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KHwbLASHxjGE27Uiky3wxlrPdCw9dEtw2S64/E8yyuc=;
        b=vjJJu2RVXp0X6oEZP5H5bBX8C4YIBD9gsbjZfzgUFNd+TARl2D3CDJtZyt0rcYYA0N
         HsWFg5Ab8FSddlpv/cVQ1bwjE4DACclssOIo4SDpoME73MZHM320/dRgXPxdodNTctU/
         PMARG6KCEn115gWEu57sHns+Y+czGuVKs4e0pHnAdmu58hDzCiaCMjil90+XeFHaJjeZ
         2CvTrOuVB/05jbG+d4uFQ589Wy/CXM3lyOBbqoD2hItrJcutVaiS/2rzU74p20qqlrWn
         GVUWTHQBKbSWGpNz/x6S/bjSBClpNMPoCMYTggYIyFayTgzBfc5KxTz4EaLjgudSrbZQ
         l+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KHwbLASHxjGE27Uiky3wxlrPdCw9dEtw2S64/E8yyuc=;
        b=bilR11NGXX6gjmWd152fZaT0ZVMMV+U6KPLNExADwyKw7HNBBqSsa42c0622XncEmn
         CMGYTgv898WDgmEkfuYiknoaRxxBNNuzgbpHeuyrVgb+/PT+JZSgA6gYgDIXyOhsk1V8
         AGrISg5iRuZw1EWp/0IZJf7J+cCgZW7d0ixrfraJ/BQ1klnGSlSqg1x3cfmnJoJJ1arl
         2YD+a8dl42xdj8X3bgOARbyX7Bc+axzpgIZdmExbKsYXPQp1gPuO3MOe0PJ2oVB0NYb0
         cSuOLYrDnVo11jXG+3ghKVv8guQi5ZYWEdDbg4htUiEQAlUaZdqKumuNbfd4LtyPVvID
         RV5g==
X-Gm-Message-State: APjAAAUElP3OU4+Twq7XiGcuDmh4MN70sMo1qUzj+sIm/3mNG0s/yYiy
        HF7DDm7DBOOP4U7Iwptu0ZqFis29tcA=
X-Google-Smtp-Source: APXvYqysamBkNqIu5nyLG9FpW2nztuJSFajzk43xKKLVsG3seq7LABXj4KAhtOv45hCvJnDDUX/XnA==
X-Received: by 2002:a7b:cc14:: with SMTP id f20mr14953970wmh.58.1578828614509;
        Sun, 12 Jan 2020 03:30:14 -0800 (PST)
Received: from localhost.localdomain (dh207-5-115.xnet.hr. [88.207.5.115])
        by smtp.googlemail.com with ESMTPSA id y17sm9943045wma.36.2020.01.12.03.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2020 03:30:14 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 3/3] arm: dts: IPQ4019: add SDHCI VQMMC LDO node
Date:   Sun, 12 Jan 2020 12:30:03 +0100
Message-Id: <20200112113003.11110-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200112113003.11110-1-robert.marko@sartura.hr>
References: <20200112113003.11110-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since we now have driver for the SDHCI VQMMC LDO needed
for I/0 voltage levels lets introduce the necessary node for it.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 arch/arm/boot/dts/qcom-ipq4019.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index d2b53e190954..d95aee50454d 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -211,6 +211,28 @@
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		sdhci: sdhci@7824900 {
+			compatible = "qcom,sdhci-msm-v4";
+			reg = <0x7824900 0x11c>, <0x7824000 0x800>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+			bus-width = <8>;
+			clocks = <&gcc GCC_SDCC1_APPS_CLK>, <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&gcc GCC_DCD_XO_CLK>;
+			clock-names = "core", "iface", "xo";
+			status = "disabled";
+		};
+
+		vqmmc: regulator@1948000 {
+			compatible = "qcom,vqmmc-ipq4019-regulator";
+			reg = <0x01948000 0x4>;
+			regulator-name = "vqmmc";
+			regulator-min-microvolt = <1500000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-always-on;
+			status = "disabled";
+		};
+
 		blsp_dma: dma@7884000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0x07884000 0x23000>;
-- 
2.24.1

