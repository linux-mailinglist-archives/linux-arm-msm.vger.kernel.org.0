Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 267386DDB6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 14:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbjDKM7h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 08:59:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230073AbjDKM7c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 08:59:32 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D3984C3E
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 05:59:22 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id gw13so4478479wmb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 05:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1681217960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RxXk1daPTunKtbomjZDgpJNAfBR2cR6YhtK/lfK/SI=;
        b=jkNhgbAqj8TzggObBJHle31q6oTTOf6YNouhVEYNpiAFkPPJUDhi13yN2zkBMTkbCb
         Jd5LL4XnPSRxsSDR69wQwpMJgD4zo34dsiqtuEAPt4NiF2NT8t/t7DCs99RsrV+B6dS6
         5XiY/o/CZc+jl2jpa03WzBu9VUtl5mHZTBkr2+XDyGBBUdMDrxh8TWrj+MjV5qD6VCxA
         XbQaYuCghyZbRe+1pp9Zjjh2rkBoR2uj7oMsy3rtP21ly1JHx3AbPkhmLGsIinwE6795
         Oozk32Misl05fmnPFUTsf3I1UAbdm/7vd8B8DNMN5DXqVFhGJ4vh6P5BmQZnX4a9AP3W
         h0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681217960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RxXk1daPTunKtbomjZDgpJNAfBR2cR6YhtK/lfK/SI=;
        b=IxBcTsIXlK1f1CgTjFq7XPEmbycvZewyfwAT8oZnWm7b2jY2sl3hjaHTFDZwqLwFrY
         782KA2g5HEdIviw7t0pvWDSmtHtDBYOTsSlmCRuqOitf7V16t6h3wv0Z/vnolv5yIdaE
         Q4VLze31TCekv2rVqM/62ghnbhwMwP/sF2nJbALhfBadLh+yxVBj3gHyzxbAews3fV1i
         eiggWdnwFqKG2QWW++C6WuUfoZsuWC/b9OBzJFdjBc0/rJeQlZJ3gGwKvm0gSYwqBDrJ
         Q8g+0vmEJA+rB3HW6/tumn+PKfS80f8pL9yyQT+g8q+ZLAk2c7tusdi181de7elxa6if
         ASIQ==
X-Gm-Message-State: AAQBX9drAvMU6AeSKN6H3nlNt47Yoyg9qkmy9/FshiMJ6YiwpLMEcbDI
        jMZWdyV9BYiDMxyeY03ptPHK5A==
X-Google-Smtp-Source: AKy350YjbZY7jeWKHHTUtlE+U08TBjTTL9TQeEw/gUMD0lhQNwkuZRGNiz34nBSlMwOKYeudFtovUA==
X-Received: by 2002:a05:600c:4e44:b0:3ed:de03:7f0a with SMTP id e4-20020a05600c4e4400b003edde037f0amr9427917wmq.10.1681217960343;
        Tue, 11 Apr 2023 05:59:20 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a099:fc1d:c99a:bfc3])
        by smtp.gmail.com with ESMTPSA id e24-20020a05600c219800b003eae73f0fc1sm16944591wme.18.2023.04.11.05.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 05:59:19 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 5/7] arm64: dts: qcom: sa8775p: add the GPU clock controller node
Date:   Tue, 11 Apr 2023 14:59:08 +0200
Message-Id: <20230411125910.401075-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230411125910.401075-1-brgl@bgdev.pl>
References: <20230411125910.401075-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the GPUCC node for sa8775p platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index a23175352a20..191b510b5a1a 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -591,6 +591,20 @@ tcsr_mutex: hwlock@1f40000 {
 			#hwlock-cells = <1>;
 		};
 
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,sa8775p-gpucc";
+			reg = <0x0 0x03d90000 0x0 0xa000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+			clock-names = "bi_tcxo",
+				      "gcc_gpu_gpll0_clk_src",
+				      "gcc_gpu_gpll0_div_clk_src";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sa8775p-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x30000>,
-- 
2.37.2

