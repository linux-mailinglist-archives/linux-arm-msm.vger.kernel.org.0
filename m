Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1B905F1180
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 20:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232193AbiI3SWW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 14:22:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232286AbiI3SWV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 14:22:21 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E2DF114732
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:22:19 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id g1so8078168lfu.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Bu+BUnwXxMmceAZlu0+NYrHn2hT+WRQf9uQVi5XhwGM=;
        b=nBJGsc9x33ILM7yYnAwYfW71AsApyhLmsYHj3jcLoETT63sW/xSFEKz3kKD+Rddm9t
         t8AHLP7BgleKA203L/XXRCGDuoWbx+7RNA5Ah3kWY3hJ+R/7rHjwSzPjYkgHHNupqqDt
         w3s+gh4L+MGjbYQp9e1HI+dd4kqZM/E6FH1c5vBXSXmk+zv4vjQgRboGI42HmzLWNeOS
         iazpBIBi9wUxnDbCUaTaaasS+jL5uKWirSueZYDWhTt8L92W9oudNDqfXScuucLSFwyl
         54Y4NP1CYwOJ3qi9MuF3M3ncWGoLtwlmo6k774xEPGKqh+fogq5+Ri0ebG/Fl7icnZqe
         SV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Bu+BUnwXxMmceAZlu0+NYrHn2hT+WRQf9uQVi5XhwGM=;
        b=a5t3lr9F3+ujRSezOyRHlHISDxFApjbPiRQoCdppx8weAS/FSecj8ArQ+A4C/nINS4
         z1vxjU3RmvchOhQW/oVsQRrELDspPpwcumf/8gYRFtXJrRGU7E6etbCSbnTp/lEO/+qA
         Vf7LNdSNdpOs5lb1yHuy1luBKU77xIweJsUPqL16X6b+x8aPCwcLJbtTkV+7VAiK4qQO
         ATyZq74d3FPvZs/o57B3DfT3569f4nGHr75xnr0IWtgGed3iOyxXUvCgywrwdCevoHJb
         tZRpSGRm//IaEyeqivKyI1zbPqdVVFy7MEqFJ8RaClKRvM8/mbHO4tcP62X/4EN4whlr
         MtvQ==
X-Gm-Message-State: ACrzQf3DdDDrwqs4GoqfxY9iuwkAeGJd30YOusuIr9881yiUNWyxToNR
        0LQGbvfUs8c3j+6/YRu22HSuqg==
X-Google-Smtp-Source: AMsMyM5ydW2gz33k4zQ+MAtjdRmefbdl9R8K4WdnugdRRJKKDTCwZqjULjuOp2oYL0eSs0Gm3vMHsQ==
X-Received: by 2002:a05:6512:308f:b0:49a:5a59:aa25 with SMTP id z15-20020a056512308f00b0049a5a59aa25mr3545932lfd.44.1664562137466;
        Fri, 30 Sep 2022 11:22:17 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x22-20020ac25dd6000000b00499b726508csm364006lfq.250.2022.09.30.11.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 11:22:17 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: qcom: sdm845-db845c: correct SPI2 pins drive strength
Date:   Fri, 30 Sep 2022 20:22:11 +0200
Message-Id: <20220930182212.209804-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930182212.209804-1-krzysztof.kozlowski@linaro.org>
References: <20220930182212.209804-1-krzysztof.kozlowski@linaro.org>
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

The pin configuration (done with generic pin controller helpers and
as expressed by bindings) requires children nodes with either:
1. "pins" property and the actual configuration,
2. another set of nodes with above point.

The qup_spi2_default pin configuration used second method - with a
"pinmux" child.

Fixes: 8d23a0040475 ("arm64: dts: qcom: db845c: add Low speed expansion i2c and spi nodes")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not tested on hardware.
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 132417e2d11e..a157eab66dee 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1123,7 +1123,9 @@ &wifi {
 
 /* PINCTRL - additions to nodes defined in sdm845.dtsi */
 &qup_spi2_default {
-	drive-strength = <16>;
+	pinmux {
+		drive-strength = <16>;
+	};
 };
 
 &qup_uart3_default{
-- 
2.34.1

