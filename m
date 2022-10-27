Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D394760F036
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 08:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234603AbiJ0Gaw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 02:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234447AbiJ0Gaq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 02:30:46 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE07A160EC4
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 23:30:35 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id v28so376620pfi.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 23:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+oNMWjwF5SpspioafdolHZIqZWxnCSDsNsWJlArBnr0=;
        b=JJheuPFrZj1MnqzU6PMWCSrD8v+QV387IuiqqR2iAiaQ/gYzyf/do0vznbussRzQti
         ynIRsPmYNdm2KCDwPRYDVkjy++9JVIpdIkJ4/BSVoWF4nVh5uVSTHvIFJ4xL8wVvWTho
         96Z9POS8G/YhIZYINKRsknfo1DieqEV3+H8DrUcb4hr/LpWhlNODoqrqXppIccpvmYTa
         YJQZKBBhPSORBNz9X/63lsa8ua93V1vqPw9zNJgWWzl/2PMCpaI9+AHgqu81LCons3cR
         Ctee1yK+fGiZXY+B6rQmBmFXaPX5YcwvLo96qZWmp+5zFNIa4OpmHxE7W43yEOQnMcEv
         4Tog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+oNMWjwF5SpspioafdolHZIqZWxnCSDsNsWJlArBnr0=;
        b=MJxKlO217BByCktg1XiSLh034fmSF/CZCfUcB69MDGiF2WTZ4bSO4rBG2f3sDf1Hd9
         7ZHPH6M3FD+HEXUHNXOdRVl1Z58p1zZduX1SdehEMjYa+iFqUbtgLAI98ILifv0TA+dq
         dWG7OxSCJLq05h3bW4Ivjyrumnza9bwFdRwpq4Qto2L6wWKYrCcvJ8BadP95H7wF4NO4
         6htpn6018uLA+DOCtQ+xwG0pUHaOh7T6p71wEWJYIND3RqTOnFxj9ZanG1t8h5Nr1A/S
         J1DlivNyygJwPUHRcAdToIemiE3YEseFchYObpT+nr/bJ31dUkZfT6+lQetzW+1fule0
         UeoA==
X-Gm-Message-State: ACrzQf0wV8TYrUYyMjvQdjoqD/cfRsNaWYN9NUzI2Ee/x1J6XXinSqN6
        6vmIr8390Sbx3oNZoQ72xYC6
X-Google-Smtp-Source: AMsMyM5/tWR2zz635iZSAUZwHbIsDVTedFVDiQrgA4jSnvJxRhMNeHm+jF+4gq1xzsO04w0zWkMHCQ==
X-Received: by 2002:a63:5425:0:b0:450:738:9a78 with SMTP id i37-20020a635425000000b0045007389a78mr39812555pgb.429.1666852235394;
        Wed, 26 Oct 2022 23:30:35 -0700 (PDT)
Received: from localhost.localdomain ([117.193.208.123])
        by smtp.gmail.com with ESMTPSA id i126-20020a626d84000000b00561d79f1064sm446041pfc.57.2022.10.26.23.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 23:30:34 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 04/11] arm64: dts: qcom: sc8280xp-pmics: Add support for PMK8280 RESIN input
Date:   Thu, 27 Oct 2022 11:59:59 +0530
Message-Id: <20221027063006.9056-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221027063006.9056-1-manivannan.sadhasivam@linaro.org>
References: <20221027063006.9056-1-manivannan.sadhasivam@linaro.org>
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

The RESIN input can be used to reset the PMK8280 PMIC. Enabling the
RESIN block allows the PMK8280 to detect reset input via RESIN_N pin.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
index 397ff4995003..4a3464f5e6e9 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
@@ -68,6 +68,12 @@ pmk8280_pon_pwrkey: pwrkey {
 				linux,code = <KEY_POWER>;
 				status = "disabled";
 			};
+
+			pmk8280_pon_resin: resin {
+				compatible = "qcom,pmk8350-resin";
+				interrupts = <0x0 0x13 0x6 IRQ_TYPE_EDGE_BOTH>;
+				status = "disabled";
+			};
 		};
 	};
 
-- 
2.25.1

