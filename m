Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32A764C5792
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Feb 2022 19:41:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232718AbiBZSlj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Feb 2022 13:41:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232714AbiBZSlh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Feb 2022 13:41:37 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAAAA1E6945
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Feb 2022 10:41:02 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id m13-20020a17090aab0d00b001bbe267d4d1so9722026pjq.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Feb 2022 10:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=odwahtVFzAzlKqhquo0uPKSN5JsFWwMZV4g7eN1U7jo=;
        b=lYLbQXPEa1vpkOtydIcf+0oqQQRMIrmfI1/ytGLK/zehTXihFSDcpMlm498wB9Mwuv
         OWlRYpORDB/ciXwMkWKBPIsTn1gPP/6INJ4b35jb31krUAr7KA+wrgTx3e15Whf/Ekgg
         XYLLwU0pG25lnHp4EN3iFFBHi3KixIwxx6jPaAu3z1zRViTyIG8zFIcBhiwGclMvIEsv
         v3JHrbkpMjQaCooCOxRM7a4m0+m8HA/fwhhaGCZulqpUpw2sHfLbkKbrhcDtThveyxfA
         4neppAFCfBlvsd4xts4zVzZLnzTg68OeBXFDjk0Tb7CXKp9E9QS+sXboSF3f7ioFjaFT
         464Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=odwahtVFzAzlKqhquo0uPKSN5JsFWwMZV4g7eN1U7jo=;
        b=ilzRC07xf7noqSXuQbu47ID9JXKNnA/mpOLWJKi/kls1swJ08Y378vFAO8OZgAU7+D
         xVlo3y6rYjLCVsrkDt+RmrlkXmMG9ZK6ttD7cP6fyHthGQFzbGhbJWn3yrH+yoqL8HuU
         XAhNttYxSPM82ugJG+d0SFPDtKgI6v4zpUWiWQPEqPZ9Lz0AFLjWp+G8Olcu/vDWd06c
         yiVVX1p4ewi7m5NPddHLnfjLTzHzNRF+7UU9Mq3oWtFQjT7ub6jiFscdztAlSVuEf/KK
         jmXzFDmMf17sLYInDEl0FNxbHNQmrMMQ7VApGD3Klksm0jdaU2zYpIYqdVbcg3xZQCb7
         E86Q==
X-Gm-Message-State: AOAM532DIHEDKkTweak+RpyesisoxXL0a4YdWFu/Q1ItZEwkvm8k7sxu
        ldKAXPYFOQ5bUq/2EaCqAFJGswWcvuydEw==
X-Google-Smtp-Source: ABdhPJwkVmVcpOLaVwOHR/BqAG50M3qFkbhnE4lpEn7vRc0GTxhqyvfU6USBye7jzCaoScptMnmvyg==
X-Received: by 2002:a17:902:f70c:b0:14e:f1a4:d894 with SMTP id h12-20020a170902f70c00b0014ef1a4d894mr13096570plo.65.1645900862295;
        Sat, 26 Feb 2022 10:41:02 -0800 (PST)
Received: from localhost.localdomain ([223.179.136.225])
        by smtp.gmail.com with ESMTPSA id b187-20020a621bc4000000b004f3c8f3b560sm7049319pfb.129.2022.02.26.10.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 10:41:02 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, maz@kernel.org,
        quic_mkshah@quicinc.com, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 3/4] arm64: dts: qcom: sm8150: Add pdc interrupt controller node
Date:   Sun, 27 Feb 2022 00:10:27 +0530
Message-Id: <20220226184028.111566-4-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220226184028.111566-1-bhupesh.sharma@linaro.org>
References: <20220226184028.111566-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add pdc interrupt controller for sm8150.

Cc: Maulik Shah <quic_mkshah@quicinc.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 6012322a5984..aaeacd379460 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1626,6 +1626,16 @@ system-cache-controller@9200000 {
 			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		pdc: interrupt-controller@b220000 {
+			compatible = "qcom,sm8150-pdc", "qcom,pdc";
+			reg = <0 0x0b220000 0 0x400>;
+			qcom,pdc-ranges = <0 480 94>, <94 609 31>,
+					  <125 63 1>;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+		};
+
 		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sm8150-ufshc", "qcom,ufshc",
 				     "jedec,ufs-2.0";
-- 
2.35.1

