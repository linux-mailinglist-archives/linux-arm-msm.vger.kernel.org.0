Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E76547E06D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Dec 2021 09:32:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347203AbhLWIcD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Dec 2021 03:32:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbhLWIcD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Dec 2021 03:32:03 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AE07C061401;
        Thu, 23 Dec 2021 00:32:02 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id b186-20020a1c1bc3000000b00345734afe78so2855003wmb.0;
        Thu, 23 Dec 2021 00:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cXyWAQ1VG/0jxLRICMV6KqxjV+m10/SVcbFw3Teq6as=;
        b=E7QvrEOtpW8mYvxLPDzujVk8TxlOszCSlUnCUBvNk9kAC9UobxmFx7osQaGlpO4aPU
         zMac+lzo6WloMN+nrB9Tjh92linpatSWlLqxxFC8ZyY+BPJOfAHxB0AH5Y+kdMj7MDv/
         Rcv6eLB5Ygi7x1h3FPpyRTIJ7n/TY5u/BfisBYpYi56kCP+O1L7LV+/sQzCfDgXyeXZU
         nLf9QHRBIU7caZUEZSpuhm20ZaTz91CHRwzkcgXyCc+ZhcztnTdhoXpOSE33JUvBSFyP
         JOwbeHcGDKyTvGWpVU26msm4dLXX/CT3wBs7FjvacNbwRbxQnky6WMT5a9uM2OmHOnFc
         imoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cXyWAQ1VG/0jxLRICMV6KqxjV+m10/SVcbFw3Teq6as=;
        b=eHnmUC7HApe4rDT2C41fWo8d7uua7LyI2jxpkjrc9OIzbJo7/w+63XpXEyBngCxp6Q
         J6wxKYF8/H+sXFsXdOYLXY9C4CsafVOIvMspGNrrTJGKLZSjQVQGgQKWCyJGEwlT4uBQ
         yhmOfztOAgzdjd7CKqjjhEzqKhMgZthubk40PkxF/MMbeetq4wnv6XLXwFn9uRKwLtFu
         iIi21BMcHxLKO2bbr5YFPboxnu/WpZ4RyWihQplTGfvJoX0r1TbP6F9qlm+IZpyy7I2J
         jkWwsXttJBIZWxBSZ2oAMnjrKeWgPnO4mnx/mDqLVNyJLIdC4coAgw2CNjhBT21TKo/y
         lFJA==
X-Gm-Message-State: AOAM5308Dp2YYStKAA+RyZadzCMFS+UAI0LjkuWgOS0UPH60yMy3fcOd
        otBqJb/6dcptsleRukwHZ00flhZTs2pT+Q==
X-Google-Smtp-Source: ABdhPJzQA9UhPfC45LdIuPUic6IhlAiJfyGtPvUExuZdy1zlD9jIKx/7SKjxB7X2fH6G04TkKHlEVA==
X-Received: by 2002:a05:600c:4f94:: with SMTP id n20mr795792wmq.64.1640248321288;
        Thu, 23 Dec 2021 00:32:01 -0800 (PST)
Received: from dell5510.arch.suse.de (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id p21sm4038277wmq.20.2021.12.23.00.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 00:32:00 -0800 (PST)
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: qcom: msm8994: SoC specific compatible strings for qcom-sdhci
Date:   Thu, 23 Dec 2021 09:31:52 +0100
Message-Id: <20211223083153.22435-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211223083153.22435-1-petr.vorel@gmail.com>
References: <20211223083153.22435-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 5a9a5ed0565f..955bdb0639fe 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -444,7 +444,7 @@ usb@f9200000 {
 		};
 
 		sdhc1: sdhci@f9824900 {
-			compatible = "qcom,sdhci-msm-v4";
+			compatible = "qcom,msm8994-sdhci", "qcom,sdhci-msm-v4";
 			reg = <0xf9824900 0x1a0>, <0xf9824000 0x800>;
 			reg-names = "hc_mem", "core_mem";
 
@@ -467,7 +467,7 @@ sdhc1: sdhci@f9824900 {
 		};
 
 		sdhc2: sdhci@f98a4900 {
-			compatible = "qcom,sdhci-msm-v4";
+			compatible = "qcom,msm8994-sdhci", "qcom,sdhci-msm-v4";
 			reg = <0xf98a4900 0x11c>, <0xf98a4000 0x800>;
 			reg-names = "hc_mem", "core_mem";
 
-- 
2.34.1

