Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE8F42EA7DA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 10:47:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728377AbhAEJra (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 04:47:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727991AbhAEJr2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 04:47:28 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91D0CC061794
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 01:46:48 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id n10so20930908pgl.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 01:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DxgWqwKwqFym7GE4OKnS1/iwRMLr+x+z7Qj6uMJA0Lc=;
        b=uNO7lsPcigzGyvnfvGlMtGL0O5sN2pyDctEdHp4CcM2Qk98zGURhOhtSdY3UiwMwYA
         E6ljNirfccv4lx1hkCSVl1XQU9WO09+v7e2pmRYKwDj376vE+4geZDcfsM5K4vZg1lTx
         g+eU1ZyzdYU5EzUuJ9EpaGy+WuTUDk57Rc1gt8tIy5AowXCVohzTcwu4COhppFfm+oJj
         oRJIKe5MEVPPfYDjYD5JfTMMhhao0eIXUdtBtD6a454tsa5c6zIIBZW2Daj+NluS6oM6
         o1s/5EMsVeAiVZvM/9bOgRZqYN4yRN9jAbvi657CCqXWN/9SD4rise/Jf8Y8f9146rHC
         QA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DxgWqwKwqFym7GE4OKnS1/iwRMLr+x+z7Qj6uMJA0Lc=;
        b=aSY4YPLbpMhM1XjN1p+l+bsk1xk0FkY3O0rDlI7xIQG+HPK8LVn5BdHtCI9Ko5mpMQ
         lkcZ5mTjxJj9uJZIhDozJ7tpkudA/gG3kDpKt31n5XJptuJzmS1rH/F3vd0cAcof7gPD
         X97WZNzNACxBekRDqoz6ajg8yqnTe96beQj2LYCPMYcdb4H/Gp/y3FJ0jMi8xxhsfAMN
         1NmYVmcP49TT4BTTgeWmFxEWNQTlFVaCto1qLlz3wE1+ma7MG9xgRs7YYFBxbFvr+jA+
         rVMsf4aIiW8FPFoYo6rlT0HlvXuON27zDTfnTRaqFtQWRjBnW7IWXyIeZdp1LemHbGm0
         bs4Q==
X-Gm-Message-State: AOAM530VUkMtUx+GM6fEgPTCGJMQbNuS6AfigjoAuJ7KRKfIjR9MyTPU
        DoVro2N0McxM0S1qBBKttHwJ
X-Google-Smtp-Source: ABdhPJxv+3P5vBEOvGlRs1OTxWkKu+DOh7l5qSP+JJ0YegF3N6g5RjHYB+VfIohjDypoUpJZE8fgqg==
X-Received: by 2002:a63:e24f:: with SMTP id y15mr73939036pgj.366.1609840008183;
        Tue, 05 Jan 2021 01:46:48 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id f64sm60073921pfb.146.2021.01.05.01.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 01:46:47 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 01/18] ARM: dts: qcom: sdx55: Add pincontrol node
Date:   Tue,  5 Jan 2021 15:16:19 +0530
Message-Id: <20210105094636.10301-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105094636.10301-1-manivannan.sadhasivam@linaro.org>
References: <20210105094636.10301-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

This adds pincontrol node to SDX55 dts.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index ca7d4e4f5d11..08b4a40338fa 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -96,6 +96,16 @@ pdc: interrupt-controller@b210000 {
 			interrupt-controller;
 		};
 
+		tlmm: pinctrl@f100000 {
+			compatible = "qcom,sdx55-pinctrl";
+			reg = <0xf100000 0x300000>;
+			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
 		intc: interrupt-controller@17800000 {
 			compatible = "qcom,msm-qgic2";
 			interrupt-controller;
-- 
2.25.1

