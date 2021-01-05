Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45D582EA7F9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 10:50:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728749AbhAEJsr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 04:48:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728135AbhAEJsq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 04:48:46 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC334C0617A9
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 01:47:07 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id i7so20943306pgc.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 01:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ATxPuvgrya5B/FyBJYrUahFVKKPVYhe/pH6/5ZIOhtU=;
        b=yF+TpclryjnTudKWHmOw5ksb8YAaigz8auYp8L8NwLf7QbfKpcE8O+++8cmp2Y8w0t
         dqjSm4Q3x3VC7ZFXOZsAVUrM1fvkX0tk1wICc576CZ6trs9wwcW5vtAPRB6dj9k2QAqO
         ZbiCcZ+wbWQSiFDxPb4xiFolrPF0i1LnOlby9fYCegEIYfUwgX0+Z1DK/OPlcQQ+fgQH
         7Xzwp0TSNY5e4PmzKjLlo6XiP3/VvPQvnT+wE1cz7I7b8hrerYbZzBgAUtX7zgcQZPT+
         VyAD1eg5jbTlf0VZb8zcq4wmmqXZoZfs4bVXZC3loePvxqe3ArBayN6EJU0/6GTFf8Ry
         8lQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ATxPuvgrya5B/FyBJYrUahFVKKPVYhe/pH6/5ZIOhtU=;
        b=fIKyr4CCVOfmf7vt6PMydAL/MgBt93XvEDYgfUsL4rsPYYJXxN6OIShYNYqvAa2dbD
         80xqokrFWn6eo28ECTrstZQk/DQqTD/oZJBoPSLoIcqrcpHv6HCx4ZJxnbQSHe8HL+V9
         /4MqkMyLO1jC8dX5lfI3MLa88iWouvDdvfHL3RLQ0OjcZeCh2staM2k+el3yfH6mw8UZ
         ziJW4FuX1mOHl/kIb/00PGpaeb1SiTCc354VFjvAGP3btnvNswgWXnUhvRuB2Ibe7v2f
         ji/8md3p4htL3ByojOZuW8rp3KgvorSatieronyeYxobK1oK5neP1tVxyb7Powfow7l2
         prDQ==
X-Gm-Message-State: AOAM530vlyXXgEAv7Y+vxEOY5qAk+Rm9pUGSfEHjOB4f73+L1rrRzJvd
        XzVptpsJvzqMoFp9oJKYEY00
X-Google-Smtp-Source: ABdhPJx2Ys8NN3Y6xjU35ij5aXME0P/12yOrukdOS/Zp++voxL7+vuyVsUTWhtxyW82O88OOzN7Azw==
X-Received: by 2002:a65:6405:: with SMTP id a5mr74536513pgv.389.1609840027454;
        Tue, 05 Jan 2021 01:47:07 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id f64sm60073921pfb.146.2021.01.05.01.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 01:47:06 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 07/18] ARM: dts: qcom: sdx55: Add support for TCSR Mutex
Date:   Tue,  5 Jan 2021 15:16:25 +0530
Message-Id: <20210105094636.10301-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105094636.10301-1-manivannan.sadhasivam@linaro.org>
References: <20210105094636.10301-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add TCSR Mutex node to support Qualcomm Hardware Mutex block on SDX55
SoC.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index 927f43a7414c..e48ec7a1971b 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -166,6 +166,17 @@ sdhc_1: sdhci@8804000 {
 			status = "disabled";
 		};
 
+		tcsr_mutex_block: syscon@1f40000 {
+			compatible = "syscon";
+			reg = <0x1f40000 0x20000>;
+		};
+
+		tcsr_mutex: hwlock {
+			compatible = "qcom,tcsr-mutex";
+			syscon = <&tcsr_mutex_block 0 0x1000>;
+			#hwlock-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b210000 {
 			compatible = "qcom,sdx55-pdc", "qcom,pdc";
 			reg = <0x0b210000 0x30000>;
-- 
2.25.1

