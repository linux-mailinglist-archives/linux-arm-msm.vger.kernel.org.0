Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBB88690DBF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 16:58:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbjBIP6j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 10:58:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231194AbjBIP6i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 10:58:38 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AEAF34035
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 07:58:37 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id ba1so2250641wrb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 07:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cFLfhaQ4iwqIS27WBBe1IT0dnfELwqgDx52SPdNJ0CU=;
        b=mAcJwDv3DH4+UIqM7xycDueELLyoKt6zwnmeHFnmwloVob7CaS/3tx86GobzPO8PWS
         s2UNB7WoewXRRgj5QgzbdLxbER8die9x3xaE08/NZSd4a/wIk4qYMH/Xa17T3/Nw/wib
         gIhyq5MBN0a0btnVVthCZsG/dCGVAkarJddxV9UnwhuC5pw+DtHc/f0jd+S3BdQY+Ahl
         glsQnr1EWRZ7MMAUi00DoeABr8ZedPuYMlrQFQwrgDgQJ94nPjsexlgdJ5HghVmYW+A+
         j4TBRnbKgM/M4tjX/0lJlWyUot3ymrM26wNJRN5ysMGvZ1KJjT0rrvGtXqt8FHLZz9II
         wl5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cFLfhaQ4iwqIS27WBBe1IT0dnfELwqgDx52SPdNJ0CU=;
        b=0203F0uPBUJVhxPWD2W5J6tcLrkSj2iediKT2Czg5UBziVdwplCN3bO25YLXF2RZCM
         jvRP6OcW+Og41cP5EVd0xgCApXGYH7+awQ7kM5+fIX+e+dGILL+KvcxSnuoNNPrpnE4J
         BWMfJ5o844AccIHb93EdB7VSfEms/1otZVbIGQE/4coL7LuH0bg0kGvwzpmpD67lH+Xh
         2UBIu9krcOqSdHNtgD0hfODqdpgfOOIwbMTWKykvZQ1JXtQNJwp4zF5rzdlKrzlV7AlP
         wlGeFamTWFZN8nyUG4jc52hVQi6h/E2kRm5rxpQjWapfsQEz/EQqjnTVyHS6Vt5NQYoN
         V7oQ==
X-Gm-Message-State: AO0yUKVGB5LjtyObEuE46tsv3Tj0+CufRvMnNXlTujE8SjBuIYGJvO4I
        WAog6MrQ8jL0887HsNcb9J6mhw==
X-Google-Smtp-Source: AK7set81BcIxNdQXc1rpl5C1gjuvRL67C9FprLDdh/YRs2TfVNTy8WyRyiQJizqcSXwW+f3QJPo38w==
X-Received: by 2002:adf:fcc8:0:b0:2c4:965:1a58 with SMTP id f8-20020adffcc8000000b002c409651a58mr3112886wrs.67.1675958315742;
        Thu, 09 Feb 2023 07:58:35 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id k21-20020a05600c1c9500b003dd1c45a7b0sm2381583wms.23.2023.02.09.07.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 07:58:35 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sm6115: bring back missing disable for spi@4a94000
Date:   Thu,  9 Feb 2023 16:58:31 +0100
Message-Id: <20230209155831.100066-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

spi@4a94000 should stay disabled in SoC DTSI and only enabled by
specific boards.

Fixes: 1d0d6a6e6f6b ("arm64: dts: qcom: sm6115: Add geni debug uart node for qup0")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 3eccfb8c16ce..39a63ff46fc1 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1001,6 +1001,7 @@ spi5: spi@4a94000 {
 				dma-names = "tx", "rx";
 				#address-cells = <1>;
 				#size-cells = <0>;
+				status = "disabled";
 			};
 		};
 
-- 
2.34.1

