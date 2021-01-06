Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5E602EBE0B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 13:57:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725803AbhAFM4F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jan 2021 07:56:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726957AbhAFMzm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jan 2021 07:55:42 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F0EDC06136B
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jan 2021 04:54:17 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id c79so1670131pfc.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jan 2021 04:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UgCTOZP+iS7Zpfo/UYMAHF9VQ2ZJFjb723cKr3RX7Qg=;
        b=IK70e9NPRwV1gMZ/EU7occBXqZpRyUhyDuGkW9/mVy9xRT97IL8mcm5Mp//snREkHF
         +3GNX51QIwzU9hxWEBp2dMqsOyllsDYBeVfc5ik56T92OB+bcJ48Zz7T05lr9w+XBeHz
         8QvxqIzH+u6V0BjDIktM8124iJR1J0+rMMlH8r+6eEpSyQ9OGBd1Jl7ZisQ1SXcJSJ1f
         85ZCm5UbQ5jKs5B0oHTDfZsqyGSsZ950NEks/wRqWhlJvlx/N1QWtFOy17lVDYkenHPB
         k2V7wacuIaYX4XuDJgScPuMwi4DFvMJLR2aaTWsvxFJWk5kaLjA6H3DytD9mZCFGbA6t
         lySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UgCTOZP+iS7Zpfo/UYMAHF9VQ2ZJFjb723cKr3RX7Qg=;
        b=SIBXa79nnFb/3/7byYI6BrXG9ROXom3cxjPlkqjmeFaPX88aM/Uh9vskT1MPprRRjl
         ATkP0JcGaIOzZYdg6M1zP6v3+0bQr2ZmY4KhX9d5aMD+maCadIvBNQssoccDe9HMCN9b
         t+fXxJzQWlvrCIPsMpG124LGztQc/oHhuwPRtYFEd47JRP5v2agaWDXi9G9aJ6xngat1
         5UZXe/kAhx4rLvmvvn0v40gDv95yJlJb5voIJGskJoC0hDcxTIdQROgl/NIhMJseFxAj
         QJFn8BmSlEwE3tmIXb0ND6sLFUOZDSqdteBG0eFZtbKs7gOLkLfois6bJsYTQKfc0fm2
         Pl1g==
X-Gm-Message-State: AOAM5331fzoyS0RD6L3LKM9PIwC6SgcHRiJ59T75SUQV0/RQANKmP+IL
        MsqsgBgIm40owHbo+NCXEkj8
X-Google-Smtp-Source: ABdhPJzoOIOZrSRTRNRWtwHlbXCPcZou+nUjpIvVzVg0TjhQi5r+9UQDEp5sBG3GlX2AL6FdhJ+xbw==
X-Received: by 2002:a63:1865:: with SMTP id 37mr4435531pgy.206.1609937656963;
        Wed, 06 Jan 2021 04:54:16 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6102:e7a2:51f0:bf72:bf80:ec88])
        by smtp.gmail.com with ESMTPSA id n128sm2918182pga.55.2021.01.06.04.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 04:54:16 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v3 09/18] ARM: dts: qcom: sdx55: Add QPIC BAM support
Date:   Wed,  6 Jan 2021 18:23:13 +0530
Message-Id: <20210106125322.61840-10-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210106125322.61840-1-manivannan.sadhasivam@linaro.org>
References: <20210106125322.61840-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add qpic_bam node to support QPIC BAM DMA controller on SDX55 platform.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index 5c091787c458..fde3a9da68e7 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -139,6 +139,18 @@ blsp1_uart3: serial@831000 {
 			status = "disabled";
 		};
 
+		qpic_bam: dma-controller@1b04000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x01b04000 0x1c000>;
+			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rpmhcc RPMH_QPIC_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			status = "disabled";
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x01f40000 0x40000>;
-- 
2.25.1

