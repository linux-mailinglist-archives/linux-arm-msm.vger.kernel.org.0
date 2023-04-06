Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3B5E6DA24F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Apr 2023 22:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238772AbjDFUIQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Apr 2023 16:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238817AbjDFUIE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Apr 2023 16:08:04 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CCD2B4
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Apr 2023 13:07:57 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id e18so40643307wra.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Apr 2023 13:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1680811675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcLDl5zaOYWwAhlZEE9+Zq17qlKyOQ/cxtb1MGt9wUU=;
        b=vU9yUEqsjMPlZaeCeBTofsfDXEdQJGRl8rkdjBu/GAufV/5nrTZXR36QNEQpPnAOYS
         t7MO0v6A4a4J+7+fjiXZfRNZtEjhYIBwKrzwg5IDDvGpmOvsVqopZpdeFB06cQc3SEML
         f4B0VON+u9c4TVFLLJ4yqCj+tv3rRJFhywZPgEEZz7RNNqJLd1WviAbQJnmhorwG9Et/
         aW9EJf/va+L9u2X2rN/wdBrwgjL15aJWbivqf5pg15c4QKaHycD7h9eJzIfcvOr+U+6n
         4xvMWW9vAGEf/aOfpeR/pfe1vYXg72u7PMPZb33qeFjDzYfliEkB6Ixc7SmxY1FnVEfD
         TssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680811675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XcLDl5zaOYWwAhlZEE9+Zq17qlKyOQ/cxtb1MGt9wUU=;
        b=XyhCVPaYirdgNb155m8JRhQJiiUempVUnpH4OkGFhKuzCz12q7V7gsEaWRb/O47oCv
         k9Tohj6fi7vvr/TQVod6XXhtZOWWkBEjn9hx4e6caQXIbojkoUQ4aXwbKvEZ6yoRdMga
         tBRKrrlV2d3+CjH0xBseaOyk8CMqUaaRYQgX/Aqtk/NhEP4GeGiuKng4PO8K71EpR5+L
         eC8HwDEaExw+PFRF8vfy+qpSahM2UD92jgmOVA3Z8yA6EKO5npexuWUYu3aOryeq2D35
         zlVz40xZ6kkSgi24BnqotZcBieXgUE6GKMYtH72GJ+yPE3t0JDy0OfTZRtwl+XZcC9tv
         vHDA==
X-Gm-Message-State: AAQBX9dmC55dMjujdxW2h+wbLcAZLTpdPnCNrW32D7rHjv4P/RNs5u0T
        bH3qohC/HNHDWyg783vsl7KY5w==
X-Google-Smtp-Source: AKy350Yrmdt3INslyyyhAPup3k+yv6f1f5mezU+xD9oCLhEcsgVyUlPmXAAyo370ROFIj5f1zFc8eQ==
X-Received: by 2002:a5d:480b:0:b0:2d7:998c:5aee with SMTP id l11-20020a5d480b000000b002d7998c5aeemr7418660wrq.17.1680811675442;
        Thu, 06 Apr 2023 13:07:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4793:cb9a:340b:2f72])
        by smtp.gmail.com with ESMTPSA id c11-20020adfe74b000000b002d89e113691sm2560506wrn.52.2023.04.06.13.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 13:07:55 -0700 (PDT)
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
Subject: [PATCH v2 6/7] arm64: dts: qcom: sa8775p: add the GPU clock controller node
Date:   Thu,  6 Apr 2023 22:07:22 +0200
Message-Id: <20230406200723.552644-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230406200723.552644-1-brgl@bgdev.pl>
References: <20230406200723.552644-1-brgl@bgdev.pl>
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
index 9ab630c7d81b..f799cb5abb87 100644
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

