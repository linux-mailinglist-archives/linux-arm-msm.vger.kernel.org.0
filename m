Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60286271B2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 08:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgIUG6X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 02:58:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbgIUG6W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 02:58:22 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCDC6C061755
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2020 23:58:22 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id z19so8438103pfn.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2020 23:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=l+k4hf5OXCuQHlmaPleF3nZ4d8xvrJB4FTQ3A66dbWY=;
        b=YMkm8UdIc+HNjhnLhrxFdhf2kuQCyhcN5ft5PFLeXek8Bp40vpStXSgAnH81GgafWz
         CkZFlbUry9uQU/yF67fSfTcMeECVmjOV7lJzFv6YaqQ3ds2cOb7l0iYXnIKnKhpRRbYH
         kcRSbM7mPf2D9WKEswu8fHzZZyVGrDxvjyrjQJKDhNh9AoljLdwM9hIkW4EK00gabnWZ
         hQuo4N2UthNQdWRt80fnLGHLOl4JqalkJqetCQqr/Q5yvtfso+/pP8dMtpX7v4BjL4xj
         gdYomLK1uWgemIhYHaXnOwzLG8QrKlCZnKH1cqxQ4qqd8JobZ4Us40sLPhKX1AF8xepH
         YKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=l+k4hf5OXCuQHlmaPleF3nZ4d8xvrJB4FTQ3A66dbWY=;
        b=UBAhZ3trnMVKp0NNNa47GuwqXyHag47tpUtEcUbvkD0q75YoWfu2Kx2Wwewvp1NSZw
         3rdU79NqjWFmSnVkWkcLegA7ISlKlTjOBnLfgTrg+m8YHbBCnaAkIbVQ623No/9uhfjJ
         +AmBTMdBdXpcQwMcmvXBziLE0vByafLsD25vRLdEYS/aaTf438fBXs2143u6wVNYM97b
         /0tG+SfRgjSyFEyxlZKiBo2eXh8FrB4ADdVwiYuSZ/T0pv8IQiuY1KOHvlLXnTJ+8RRm
         RU+NkGgg95/Eqz5iP6CQWRR4MdDYfiZ1tpeUu8jzHmmdp7RpVSdU8h3EQq0KZN3JNHqq
         ljPQ==
X-Gm-Message-State: AOAM532GZIfEZ/oy42jeDEdStz/KoywBXl4nGgcs9LfAH0FllV0fFltk
        J28xLmKSRm0sanlxeoBHCGsy
X-Google-Smtp-Source: ABdhPJy/A/KFuaNcc7y5eQfeh295Mj8RwjXTba609wyM9eA25I9pcq0QndqBdx/sKzqcXY0okbC2fA==
X-Received: by 2002:a63:491:: with SMTP id 139mr19715463pge.147.1600671502275;
        Sun, 20 Sep 2020 23:58:22 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6e9f:c6f8:302b:14bc:82f6:336a])
        by smtp.gmail.com with ESMTPSA id f28sm11135902pfq.191.2020.09.20.23.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 23:58:21 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        catalin.marinas@arm.com, will@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sm8250: Add support for PRNG EE
Date:   Mon, 21 Sep 2020 12:28:06 +0530
Message-Id: <20200921065806.10928-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

RNG (Random Number Generator) in SM8250 features PRNG EE (Execution
Environment), hence add devicetree support for it.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index d09cc46ae263..6fbf352f8653 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -420,6 +420,13 @@
 			#mbox-cells = <2>;
 		};
 
+		rng: rng@793000 {
+			compatible = "qcom,prng-ee";
+			reg = <0 0x00793000 0 0x1000>;
+			clocks = <&gcc GCC_PRNG_AHB_CLK>;
+			clock-names = "core";
+		};
+
 		qup_opp_table: qup-opp-table {
 			compatible = "operating-points-v2";
 
-- 
2.17.1

