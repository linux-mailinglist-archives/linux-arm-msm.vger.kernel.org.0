Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84FC52EA7EE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 10:50:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728664AbhAEJs2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 04:48:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728629AbhAEJsZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 04:48:25 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D3B4C0617BB
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 01:47:17 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id f14so1357870pju.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 01:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZEQtO1e8ZH0DZv0MklF41IoEYYDJNhijOrvf4ipkaaE=;
        b=Ia9GBnQk/EbKp2yUQOW0HYQLNR7wYzDXFHngkyRqz/ZGxw/j/VFStrfdR8zagzk12v
         f1WfayykGdopEAAwY8bvWadyQ8V97J79t7VCSKr8lFYVAQ8lYUSzXlk5cTvjJq9dFeTL
         5Xu4q/gqaeaJR77D1dyORKutEq2ASIThOKVAuSw3qODpAIg+z4qqX6MkuIOZ7eaW7NLL
         2wDcJCGsWydtpzBDLOD1tDXjXw8wS3s8vltjF/9HDPwJNCEz/iORr8xW8M55fZ0XaFbZ
         S4dDN+a8AmWe1frmLemT6qtnL6RnJgmYjgM7MGBrG84G564GvxfaaGYIEoovMgktslUc
         lSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZEQtO1e8ZH0DZv0MklF41IoEYYDJNhijOrvf4ipkaaE=;
        b=ifPcXj2DvWOSTplPqC2GiJi18hH5us/wnQZ5vIrnS04of8bnW5AETpgxB1Qcj4kpQI
         QoeWMrgsGA19jp4FdpVXqV12xee3RxrzpSGu5w6JkStsqlHK5124ANA2Ys+pgoox4WRx
         4IJb7oGZiUhD2fRK51NxfJiaorvLWLUz09/uAHz3NjrVs+FxEe6Zu/GtosaUjlMYntBH
         YHU9Vs+1C8RZZsAU5JZSNvPmy9NIKfqFxWPJ0Ikku/4xJ/cdkW9XuVo7yuyRjtfoB917
         zAn2ZH0dcP8U8pJnTwTSUitpQd61zlqeChK5iBW7GCZtrZLNizXLjrkuV0kr4xoATAqb
         OIqA==
X-Gm-Message-State: AOAM533//ZbGUwFAh6RIsEI2W+S+6fD4IrRllVPNHj27N7T2o+KOtGwx
        j1E4OLwn38SVj0Oakwa01IyM
X-Google-Smtp-Source: ABdhPJxxkqFpUlr0ExPeYtUE9r+veyD+07dGeu7zaFmLNnn/fx5IaXZ75Go266s/hMl7zVXltgJQHg==
X-Received: by 2002:a17:902:6b01:b029:da:d295:2582 with SMTP id o1-20020a1709026b01b02900dad2952582mr77213478plk.14.1609840036588;
        Tue, 05 Jan 2021 01:47:16 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id f64sm60073921pfb.146.2021.01.05.01.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 01:47:16 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 10/18] ARM: dts: qcom: sdx55: Add QPIC NAND support
Date:   Tue,  5 Jan 2021 15:16:28 +0530
Message-Id: <20210105094636.10301-11-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105094636.10301-1-manivannan.sadhasivam@linaro.org>
References: <20210105094636.10301-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add qpic_nand node to support QPIC NAND controller on SDX55 SoC.
FIXME: Remove the fixed clock and source real clock.

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

