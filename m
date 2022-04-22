Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 891FA50C47B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Apr 2022 01:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232623AbiDVWTw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 18:19:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233244AbiDVWS2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 18:18:28 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63DB432B24B
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 14:10:10 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id p12so10817961lfs.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 14:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ugzBs2Kot7nDRgqzctSCPbKbp3TBExEgizD4VqmQZYs=;
        b=DlYf+2aIG+rU/KGj8TxzZAi63Qq/dclbvL6hxYpSunyukKrNx2Gf76s/nHeDztAola
         1OAkSC59p3yLixZG7oMeq7xhwYr51xJwzJYx5xncx+QMa4709e7FhVIQV59KKlMAQ2e4
         5hlDNm9XEUaP50PA8ssIfOhD6kxovvcvYvifPZICdTisIskXD/cRaqbsDiF1m8bRW6Vn
         l1bIvxz4m8+2FL/M5OoDiT9FA/SM6BqChaXnVjrfDD18dgeQjzvwqFWSZhnlyTd/QfHw
         1HlkP6gT8mp/rCP9SFu9OMBDtzapTf6Si91891RgQ+FLTAfPB9b8tLAaEZoIF63xmsXW
         QtwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ugzBs2Kot7nDRgqzctSCPbKbp3TBExEgizD4VqmQZYs=;
        b=PZxBxiytCB1B2wetN2x1ghZVMzEmO9ZwFgSA1gN1AnKvSFw3xfzAOjWEBWRLORKQe8
         qimxypavpvCMUz7jOzqYMJO1teEfpN8nfsEfDfzxJyqsX/foO+0CoRPRlkmeTKbfIW+S
         AjsL3AHWeeiSW3A6yjoWSVTDHVth7JJ+RKMoJU5QsQ0pydAOXu9V6RAO4Swa9kLczfr9
         FDl+TBtK44gRzpEpVPWKAkM31Mq2Kt0VSu6sB80c32qcnIacM5YZitxv4xd7jAYAOe5s
         3z3VJAfVRHbo1iqquDyUHU5WK5g1N+WUsXUEBRc9rgu7tI4KFh3xDGZUFQxZWcNyC0CN
         4k9w==
X-Gm-Message-State: AOAM533QuJm40vbRLB4/jX3H3MH7LZhgK7774WfxCnGPtARtV6zjTfm0
        3uI76LHwbhB2r10EHZwICyLviw==
X-Google-Smtp-Source: ABdhPJyFX2V/PTbKX0DremzFxHAy9NCacGDooP7NhmjEF5NEdeKhysGUH7SrLJGdzJQ3FBsNJs8GHw==
X-Received: by 2002:a05:6512:32ca:b0:471:d0ba:4383 with SMTP id f10-20020a05651232ca00b00471d0ba4383mr4325572lfg.240.1650661808585;
        Fri, 22 Apr 2022 14:10:08 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 6-20020ac24d46000000b0046bb728b873sm351240lfp.252.2022.04.22.14.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 14:10:08 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>
Cc:     Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 5/7] arm: dts: qcom: stop using snps,dw-pcie falback
Date:   Sat, 23 Apr 2022 00:10:00 +0300
Message-Id: <20220422211002.2012070-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422211002.2012070-1-dmitry.baryshkov@linaro.org>
References: <20220422211002.2012070-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm PCIe devices are not really compatible with the snps,dw-pcie.
Unlike the generic IP core, they have special requirements regarding
enabling clocks, toggling resets, using the PHY, etc.

This is not to mention that platform snps-dw-pcie driver expects to find
two IRQs declared, while Qualcomm platforms use just one.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 2 +-
 arch/arm/boot/dts/qcom-ipq4019.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index a1c8ae516d21..ec2f98671a8c 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1370,7 +1370,7 @@ gfx3d1: iommu@7d00000 {
 		};
 
 		pcie: pci@1b500000 {
-			compatible = "qcom,pcie-apq8064", "snps,dw-pcie";
+			compatible = "qcom,pcie-apq8064";
 			reg = <0x1b500000 0x1000>,
 			      <0x1b502000 0x80>,
 			      <0x1b600000 0x100>,
diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index a9d0566a3190..1e814dbe135e 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -412,7 +412,7 @@ restart@4ab000 {
 		};
 
 		pcie0: pci@40000000 {
-			compatible = "qcom,pcie-ipq4019", "snps,dw-pcie";
+			compatible = "qcom,pcie-ipq4019";
 			reg =  <0x40000000 0xf1d
 				0x40000f20 0xa8
 				0x80000 0x2000
-- 
2.35.1

