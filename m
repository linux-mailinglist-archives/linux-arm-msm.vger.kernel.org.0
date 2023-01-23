Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACBF6677C00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 13:57:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231941AbjAWM5B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 07:57:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231921AbjAWM5A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 07:57:00 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD6762102
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 04:56:59 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id h16so10695065wrz.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 04:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftLlYAYAzfSmxLN9WbVnkDIlxb5HQCjXDiqYgrrXe2c=;
        b=rBj+aPCVTO71uZPWYTSu/R/CjUFfLRVcjPJ3Fsehp/85t39CzNav179fvoIr9VBGqb
         yOeceDYZxcKD7zhPegr39LxGrM1NxVEZYimXTn9zqOrJCroMDC+/V8B5M/FO3LauH+1y
         LJgoDrIWxeULtIB5WfcY9SJJAEqgIsvulOW6P1rxpYnzcLw1eVg5lcIUq8ZlEldBW8Na
         XXhPiMfa4GITb+W0BDp3V2cOMBkhuWonp7j+6y/WwzVigaDR5LsE2ZVwXOSq8El6KiYg
         8Xn2iPfKm9ZXy8ud9UrX5w2H3u06pLy9nWzfEWS25WgADgvmeeTNGFzj5IbFBHHtGYFw
         i0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftLlYAYAzfSmxLN9WbVnkDIlxb5HQCjXDiqYgrrXe2c=;
        b=S8HY1ucGSayoZkE3mRdfMPVAIG+zQJACSyFI6lf+IvEzqT9aAdr3Mp8eWAm0M+hkTV
         DGnJPkBv2X0E4nPyezb6xjIYh0e7IbHRwZoPzv4l4HWtj2bHBZIQ+88I/zpPpUYrM0ng
         KZkwSzsrThKLDln7NYF0qAdd1aAUB+30p4I/1Bek5tgmc3yQbDZC2R6xX98wC5yTrNta
         67az8Ae8a0QrPYzXtW18syEllf13zUQcFnmbb5vqe8pXvdOamlnW/IiAnfEKlDOlpXau
         Mt5bx1kphJ5IT4s9bWy3IfNfaIXQKmqT7SKIp/lRa+RK5awuq89K7fSsurya2i271/tZ
         gLSQ==
X-Gm-Message-State: AFqh2kqVmnBFzK8FoWpWSnDCRP5J+3XTiqGhoewKWmRi2P6rDvmwd0FI
        yCUHrIvEx7XIucSnGFqUyncQVKVtyAzMHds9
X-Google-Smtp-Source: AMrXdXsZE7WqgbyFGmR+qZOKO6zjk8/nGNDzltIiEFXd+AD9jS1cD/NohG+/WQuurvTqXVy3qR3qnA==
X-Received: by 2002:a5d:43cd:0:b0:26b:8177:a5e6 with SMTP id v13-20020a5d43cd000000b0026b8177a5e6mr20361476wrr.51.1674478618386;
        Mon, 23 Jan 2023 04:56:58 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id a10-20020a056000100a00b00297dcfdc90fsm4569616wrx.24.2023.01.23.04.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 04:56:58 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 4/4] arm64: dts: qcom: sm8550: drop incorrect cells from serial
Date:   Mon, 23 Jan 2023 13:56:12 +0100
Message-Id: <20230123125612.154840-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123125612.154840-1-krzysztof.kozlowski@linaro.org>
References: <20230123125612.154840-1-krzysztof.kozlowski@linaro.org>
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

The serial/UART device node does not have children with unit addresses,
so adderss/size cells are not correct.

Fixes: 377972ac743f ("arm64: dts: qcom: sm8550: add I2C Master Hub nodes")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. New patch
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 6ff135191ee0..0307b853ec4f 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1582,8 +1582,6 @@ uart7: serial@a9c000 {
 				interconnect-names = "qup-core", "qup-config";
 				interconnects =	<&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 				status = "disabled";
 			};
 		};
-- 
2.34.1

