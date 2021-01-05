Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E0FB2EAAD9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 13:30:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728804AbhAEM3M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 07:29:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730312AbhAEM3I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 07:29:08 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1080CC0617BE
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 04:27:30 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id b5so1614731pjl.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 04:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eKU2p5aR/XepehIlp9fHVnluEudBDhLBR2ItYfLDnIA=;
        b=QyjNAFDT17rOjldZ5jNIIxBQkpsJ/aIFtmaGrTx6N8u+utONVWy3WjoBqy4e7GzqKq
         i5iiRIC/0l4L+r+tfG+3kWOotfuj8BnUPFsFOQkJSV/RYhjI6IrRrqRtMVufEyyWlChl
         gkY4SfVZ16khTniyyFcBMP/VYsPWhX9ozhODkhvddfds+eHnZ9EgA2eFYHjRLEu7tRwz
         B3na4kwm2DcqBQgL5VsSUQvDMMmwHtw0IXjthfD3X05mXrl9xYNQkgfLDAE0CkcU3ch+
         CnA+jt/uU0Z3VdyHiOJDZsp4jU7UYkQewSqf7WUHkq/CyqDZqOu6n92dPl4/k+si0DJP
         W80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eKU2p5aR/XepehIlp9fHVnluEudBDhLBR2ItYfLDnIA=;
        b=DttWuK7kKY6Ey+9K7TTHyssH+0+pw0j3uUiFwkETMjO4N16CQKXFPMyotvHy58L6Z5
         HBBMdgxZou3dyAP8nSU3wYI6DMS31P2/Kj2kiEoUFMixC4vruKD7Qmp2UQPpqqtmInFw
         LAWjcJXEFnoHoJnr6RUcjayccfNZZaPTWixi6XplmoAUXR9NnvF1ZXiQqrURiwxDscY3
         AMpGwnalT73fz3e1Qc+DBGMvaEDTPYriMEPbeSdiTxdirtHgvZXlC3pY2BtBAieecz87
         vu3qflRppTOQT1NnRcuhmUcgQF9kCrV6r1wgxT9nA1TZJn2suBmTEuXh8+lw7co375fG
         YFqQ==
X-Gm-Message-State: AOAM530HRGwMYR7+DD9vitxfwIQ1PHlxConAtY7ZfMLdnzYAD2Wy2gKz
        +4ltxQKJaAxUs0f1Jy/D+BQ4
X-Google-Smtp-Source: ABdhPJz9d9LPihcIuIhAkRbhC+pcKnsprYg0A9RQQgN6KXpgxWUq6Rq91/NPPGatCVt3T1rmYURZ4Q==
X-Received: by 2002:a17:902:7d84:b029:db:feae:425e with SMTP id a4-20020a1709027d84b02900dbfeae425emr76429983plm.43.1609849649592;
        Tue, 05 Jan 2021 04:27:29 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id t22sm64745402pgm.18.2021.01.05.04.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 04:27:29 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 10/18] ARM: dts: qcom: sdx55: Add QPIC NAND support
Date:   Tue,  5 Jan 2021 17:56:41 +0530
Message-Id: <20210105122649.13581-11-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
References: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add qpic_nand node to support QPIC NAND controller on SDX55 platform.
Since there is no "aon" clock in SDX55, a dummy clock is provided.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index 1b9b990ad0a2..1a6947753972 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -41,6 +41,12 @@ pll_test_clk: pll-test-clk {
 			#clock-cells = <0>;
 			clock-frequency = <400000000>;
 		};
+
+		nand_clk_dummy: nand-clk-dummy {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32000>;
+		};
 	};
 
 	cpus {
@@ -178,6 +184,22 @@ qpic_bam: dma@1b04000 {
 			status = "disabled";
 		};
 
+		qpic_nand: nand@1b30000 {
+			compatible = "qcom,sdx55-nand";
+			reg = <0x01b30000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&rpmhcc RPMH_QPIC_CLK>,
+				 <&nand_clk_dummy>;
+			clock-names = "core", "aon";
+
+			dmas = <&qpic_bam 0>,
+			       <&qpic_bam 1>,
+			       <&qpic_bam 2>;
+			dma-names = "tx", "rx", "cmd";
+			status = "disabled";
+		};
+
 		tcsr_mutex_block: syscon@1f40000 {
 			compatible = "syscon";
 			reg = <0x1f40000 0x20000>;
-- 
2.25.1

