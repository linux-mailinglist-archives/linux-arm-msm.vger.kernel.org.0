Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51CB652FF56
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 22:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238610AbiEUU1Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 16:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241198AbiEUU1Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 16:27:24 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CA365AA41
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 13:27:22 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id c19so6451736lfv.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 13:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+RgTCF6Ae4/KvPMsQo/XxnFRH2qjyDoAGXi+2vATcqM=;
        b=aesJHF4HPaa/rt3t39zXanSg9xBFEe1q00AMPI6dJHF2TUW6EX6/G1EZxOj/076UMd
         q0ECNgqs8HhRilV5n3HiDelrSKyaaLTA7v878MGWHdwUjvxHDk+Y3f10fzrLTrQx/d/I
         AASsFCn2FCtq+BWv5Z/N6Q9IfL1ymTpucOenuVvzO2CA1lO8GrFXqKW2OnGfklgfeCaL
         QujyXvu/CIlptsy5fu1Gcx5KngqalA3siwNP4jldAXa5a1NhsrFQQTFSVQyUkkwY5JyQ
         CdfSgy8Vwo6Nzv8JxdLe1002TEYEr5R9zw5+1IfnnhtL/cROHMPplvOKbgDYfwisW7Xi
         PWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+RgTCF6Ae4/KvPMsQo/XxnFRH2qjyDoAGXi+2vATcqM=;
        b=Ek8sf776UWx4lJDjYnCBXWT0KydWoVmIQDSzf0ffBXgnHKXxx12vfIfwBPosq30gjE
         IzY5GCKttbsf8miTQOuXM71HE8vZ3E7d+1K6+kmjaS/wPsKUBn5XS8hGcHzRjGBkZNxv
         lOYdohfCVl/cjGNAUpioG76aFwPszvytI2y8DmCUJI3+sngFKCfUwU6UdoKmTb7KbP+y
         rsdsu1vBav9MU7P0EKi6gAXGPYMyz0YEZTTJnXK73h1oeCOFm6/f+fo1TIvsdYQzHFYa
         yVnGcRR54rp4y5RTeQQlUt2pkRYzkiWjgKI7ZJyWOihGFyQ47PAwYURCBMHKQK1Nvgdo
         O33Q==
X-Gm-Message-State: AOAM530WHMzqgeHZNrKWKhTuj5QuTMZsVfc6h62hSrfnyDLLVyt54ooH
        t57djKSsN4Y8RMLnEdKVhEXmIA==
X-Google-Smtp-Source: ABdhPJxKw4BdcQWOsKGq9JvcwjzW/kSimd56w8WfzA0NyJNhqPu4LybYXqUL8xF2tU50ZUiYNv4dYg==
X-Received: by 2002:a19:5e55:0:b0:477:bae8:e5fc with SMTP id z21-20020a195e55000000b00477bae8e5fcmr10980317lfi.14.1653164840987;
        Sat, 21 May 2022 13:27:20 -0700 (PDT)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id x1-20020ac259c1000000b004786291114fsm317773lfn.140.2022.05.21.13.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 13:27:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v7 08/11] arm64: dts: qcom: sdm636-sony-xperia-ganges-mermaid: correct sdc2 pinconf
Date:   Sat, 21 May 2022 23:27:05 +0300
Message-Id: <20220521202708.1509308-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220521202708.1509308-1-dmitry.baryshkov@linaro.org>
References: <20220521202708.1509308-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the device tree node in the &sdc2_state_on override. The sdm630 uses
'clk' rather than 'pinconf-clk'.

Fixes: 4c1d849ec047 ("arm64: dts: qcom: sdm630-xperia: Retire sdm630-sony-xperia-ganges.dtsi")
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts b/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts
index b96da53f2f1e..58f687fc49e0 100644
--- a/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts
+++ b/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts
@@ -19,7 +19,7 @@ / {
 };
 
 &sdc2_state_on {
-	pinconf-clk {
+	clk {
 		drive-strength = <14>;
 	};
 };
-- 
2.35.1

