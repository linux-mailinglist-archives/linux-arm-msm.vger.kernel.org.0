Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98A305EE001
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 17:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234449AbiI1PUm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 11:20:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234660AbiI1PUl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 11:20:41 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 703A958093
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:20:38 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id o2so20843794lfc.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=nJKdZtRvq8vBlaQZJuT8tYogYRM3UsmdrKTxy6xD2iw=;
        b=ECypbLZlEBc3Z0/O30Pgb3Wuvkjh6iruZJgk/EF/uCk7saaGA/yDzvJh62ro/qVt6b
         w01CCdQr1JDsRaOPdeIjbE3+gz4trI87d/gth247bcrjHFq2fF4ReuPcsU4FJhyzc9Sa
         jA0K66MaRwnzATCEm4PGvHFGm+YruNrK0uL+i6Md0v18eMAsriPGIBotwuMkPP3eD6vR
         m0VnTQbvUSyC9rH7zICG0YKNWVqINMlo5nCcc4maDICcnj8vuoAsLv3h1M+UK/2Jyu17
         fZhjp9Bb14lKA7ykxL/Iq/mGneg/12VAp7kG5MKPSa//z8tEHSRaUt5D08ua1R05CKmw
         qvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=nJKdZtRvq8vBlaQZJuT8tYogYRM3UsmdrKTxy6xD2iw=;
        b=Kj/bjbEtLK8ZCC50SHPwFDnRki3zcMlAm1kk8aJP3hRksjEd5Sz0EnIEmdwij8it8d
         sGelHNDFI9qo9s+ZFI1kgsPGmO4oDM//nxlmbD3aiRS7RtXJZ/ijL/rP+SnDBWe/TC3I
         jLXHhctRYW97UVGfx+3EMl+yOmxZm2bB8MAlb+AUEP1a3RBY9aUISK9oKF29rPrpgIev
         5IEkjfFxuHH9KHo+7qc9pphdBRm+OwqLqNe+dCTK64jAf7oMnnFFEbl1lddHL9TXIy6L
         UOJQhfYQ0z2RBcevFXxvUlsNyZiKKGwzb/ritrO5X+sUdVyyW0pMN1v0tPT+jsR35Ay8
         QxQg==
X-Gm-Message-State: ACrzQf32pYTMPCtLeP2/yDjasGzoHheTTrGGhyOs1qtpd/J1+5hvBDzP
        9bwSikrjtF8X/TIug9+Z7VHgmQ==
X-Google-Smtp-Source: AMsMyM4OvHn5df/1ZdYKcsHcWuHyLKD/5xwVshBRv1ealxyNmTVpj9vuLVX96fYV7ZzhhZFuf2GAZQ==
X-Received: by 2002:ac2:518d:0:b0:4a1:c4ad:fe2d with SMTP id u13-20020ac2518d000000b004a1c4adfe2dmr7519443lfi.222.1664378436849;
        Wed, 28 Sep 2022 08:20:36 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v2-20020a056512048200b00497a41b3a42sm503023lfq.88.2022.09.28.08.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 08:20:36 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 04/11] arm64: dts: qcom: mms8996: correct slimbus children unit addresses
Date:   Wed, 28 Sep 2022 17:20:20 +0200
Message-Id: <20220928152027.489543-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220928152027.489543-1-krzysztof.kozlowski@linaro.org>
References: <20220928152027.489543-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Correct slimbus address/size cells to match bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 903c443a867f..2c5908d104f7 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3320,15 +3320,15 @@ slim_msm: slim@91c0000 {
 			#size-cells = <0>;
 			ngd@1 {
 				reg = <1>;
-				#address-cells = <1>;
-				#size-cells = <1>;
+				#address-cells = <2>;
+				#size-cells = <0>;
 
-				tasha_ifd: tas-ifd {
+				tasha_ifd: tas-ifd@0,0 {
 					compatible = "slim217,1a0";
 					reg = <0 0>;
 				};
 
-				wcd9335: codec@1{
+				wcd9335: codec@1,0 {
 					pinctrl-0 = <&cdc_reset_active &wcd_intr_default>;
 					pinctrl-names = "default";
 
-- 
2.34.1

