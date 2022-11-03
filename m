Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 318EA617A63
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Nov 2022 10:59:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231458AbiKCJ7B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Nov 2022 05:59:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbiKCJ6y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Nov 2022 05:58:54 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5428F101F5
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Nov 2022 02:58:46 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id q1-20020a17090a750100b002139ec1e999so1335474pjk.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Nov 2022 02:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNnO/JypOAt/4mb47yViotiM/3nDhVevoD9t+FcxiWU=;
        b=MnQqLzC1dcTNZTUmJQcM/ExoY9toJj9ZiNQlLINvBsWD+o8Hy3z3Bj7Bk9f/ODYUFR
         EqTx6FqzMZLJQjgMFbe9IHnrDBTp8qQX/wpIpr2r5NkgN1TviVkz+VvStadTndUvmjXp
         OFWjJX+j31rfRAEcukiwFNrrnf0FitdO2U/GUlPk3DtzOgt4o/5I48+JqWYOkv38Vsx1
         8DCj0d3BxVDrPBOFgUOTFVIi2POp6DJILLsRoL6XVU+WVStQ16IRjKmOjgDGLFebN1wf
         Mkfnt2bOeuLLSpDCLInQ5cmh0Ldb5kjHCFRNXdfqCBfpdIEAyOUoFVE6XatjWvCT6eNZ
         rhlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sNnO/JypOAt/4mb47yViotiM/3nDhVevoD9t+FcxiWU=;
        b=j38ud6iB5jma5pqUEw36KGaS3N0sl02aVg5FNSC4uAAtmOeq5q9BXOLvl6ON+2/W08
         4gTqmS/ysqZb0ELhc1DIcvVsDSXoKpQp9Qn7Xw2IrEkoV2hg/c3pN+aEo9Q/uLnCLkK+
         f4xe+zw9xG8IDyyPdBazb2G3E8Dtxgnz9m3va8Fr0z23BGR8m087aXjAm3euz69hYcH3
         etqz0e9eUEExRPSATWmOhVfin19iqoN6YORs7gRbG4uOdHFVh4k8hht9E4GdABmdWQ+R
         znEINxND0p1kBH7hwS2qyCgxCg9O/DwcrHW5BzJCrY6AYJ0Si7Cikvzpp+5H4vFJdTlJ
         BjUw==
X-Gm-Message-State: ACrzQf1zz0UdGFozG47u/x765tHXujx8bdE10uka/hExCRTfNcmJkpZc
        59eBh7KQfVb0o49D0dmjzPE4
X-Google-Smtp-Source: AMsMyM6NE2XAYtsIflCWtUn7HZTycuQW5L/4/ih/H8gupzgoS/a0I8PIHJNQj6EwaNhvsBE6qi1s5w==
X-Received: by 2002:a17:902:aa44:b0:186:7a6b:7bbd with SMTP id c4-20020a170902aa4400b001867a6b7bbdmr29646730plr.78.1667469525676;
        Thu, 03 Nov 2022 02:58:45 -0700 (PDT)
Received: from localhost.localdomain ([117.193.208.64])
        by smtp.gmail.com with ESMTPSA id n6-20020a170902e54600b00186c54188b4sm161670plf.240.2022.11.03.02.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 02:58:44 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 04/12] arm64: dts: qcom: sc8280xp-pmics: Add support for PMK8280 RESIN input
Date:   Thu,  3 Nov 2022 15:28:02 +0530
Message-Id: <20221103095810.64606-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221103095810.64606-1-manivannan.sadhasivam@linaro.org>
References: <20221103095810.64606-1-manivannan.sadhasivam@linaro.org>
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

The RESIN input can be used to reset the PMK8280 PMIC. Enabling the
RESIN block allows the PMK8280 to detect reset input via RESIN_N pin.

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

