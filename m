Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3614F42BE0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 12:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232206AbhJMK61 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 06:58:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232772AbhJMK6T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 06:58:19 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD247C061776
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 03:56:11 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id g5so1553326plg.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 03:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YqRxF9ZTUxEEoaYTLJmLJv0gPuDDV1X9LB6m0mfziFw=;
        b=u1NY/FtKqX9+bZ5mB5nQyKPwhE2B+7rt3Ya3tXX7L26u0BeCYgaufRt//+Vq1XRQyU
         tljbLydbOzIwyOj9yYe0xxukP7tBcLYPMfhKrxw37sa78nvQpoTD7cXq/ll5hvXc3A9u
         7PUtxD28f00LUD7T6dkDPk1oWWmHo4GxHRztfgtPS3I8e4UIsCLR5ToVm2/BvGHLSQIN
         ep4rEMbCitsfxdGPSLfxGdZkIuanMeEswAK4gFA4fi9hga+l/o1AIHevK8mk+QghQDxC
         0Ld3oo7CVSHDFsjz0F4PhR+cIwFeJLpWaFMiKAtVlIRLLK9elWejog5Haam4BoH/AGQZ
         I5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YqRxF9ZTUxEEoaYTLJmLJv0gPuDDV1X9LB6m0mfziFw=;
        b=sYZw4nJAA0Z0Tbj4dgDfrksPf0iiF/dD8n3kFRQiFhsp4vPgfbxHNr1g9kCI1q3Dt+
         Bx+sZKKzRhqUGDrVxyjnWARCxv2IlzGjRnN7ovUUM9GH2jPkmGj7+9azujcAphtWYI1x
         QJ3rvY+bGOWu7Zjoh+rUDBpTwer49vWhRv2CoQl0XKYa6PpfngRYQLFuPHjftXYkhswt
         /Go/0+UOLOTDIuyJKq3pLLDnN/IlvO77v8Ih8jEjR7w/z3+fItX42CtUhAq+hYSO51Hj
         EV8X2osXG2PLFNe/StdJEp+cnSZlrE2lw90EL8Lb+5rEFa6L8ke6Bkc050Pe2YLd/w0/
         BMwA==
X-Gm-Message-State: AOAM531TiWlfgSlKNiyOyv9ylNxWHKt37BKyo6spOa+8/o4+DogPAoq5
        2fw725rpslODtatynmHYtExqkitctfgJoQ==
X-Google-Smtp-Source: ABdhPJxhXjUdadL1vOJu0nmmuB6U/wMetuPlkzlUFn6z3zR6qp4XVxt/116l5JgRVwlTAAwZohz9xQ==
X-Received: by 2002:a17:902:b60b:b0:13e:dfc0:139 with SMTP id b11-20020a170902b60b00b0013edfc00139mr35423858pls.80.1634122571016;
        Wed, 13 Oct 2021 03:56:11 -0700 (PDT)
Received: from localhost.name ([122.161.48.68])
        by smtp.gmail.com with ESMTPSA id b13sm6155351pjl.15.2021.10.13.03.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 03:56:10 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v4 03/20] arm64/dts: qcom: ipq6018: Remove unused 'iface_clk' property from dma-controller node
Date:   Wed, 13 Oct 2021 16:25:24 +0530
Message-Id: <20211013105541.68045-4-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
References: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

'iface_clk' clock is not used by the
qcom, bam_dma driver, so remove the same from 'ipq6018' dts.

This is a preparatory patch for subsequent patch in
this series which converts the qcom_bam_dma device-tree
binding into YAML format.

Without this change, 'make dtbs_check' leads to the following
error:
 $ arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml:
     dma-controller@7984000: clock-names: ['iface_clk', 'bam_clk']
     is too long

Fix the same.

Cc: Thara Gopinath <thara.gopinath@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 6a05ee82547f..55c961b5f1ab 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -346,9 +346,8 @@ qpic_bam: dma-controller@7984000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0x0 0x07984000 0x0 0x1a000>;
 			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_QPIC_CLK>,
-				 <&gcc GCC_QPIC_AHB_CLK>;
-			clock-names = "iface_clk", "bam_clk";
+			clocks = <&gcc GCC_QPIC_AHB_CLK>;
+			clock-names = "bam_clk";
 			#dma-cells = <1>;
 			qcom,ee = <0>;
 			status = "disabled";
-- 
2.31.1

