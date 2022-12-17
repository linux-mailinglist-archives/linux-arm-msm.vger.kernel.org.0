Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA5C564F655
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 01:33:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbiLQAd4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Dec 2022 19:33:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbiLQAdz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Dec 2022 19:33:55 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BECDE1C12F
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 16:33:53 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id j4so6012230lfk.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 16:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m1XWxuEf2GfY3Vh2yJuAmipSdpdELNdFo6nzf1ZAoLo=;
        b=ABocsByR/xu+b2E/+TjAlA2ng2RFK0fSjTjwDq0rbGKDSmIQX8AZhxTQJrd0ggR58P
         9tyThRGufBbafNyNb4p4O20Yvci9HuXw373xHRv0yhuP5+CkXDjq7ICWfyv8ZSl8ygLg
         Cdjo+TsBBb3D0MtyY07uzOBYGLJwtev0+5qLZL+Bx55gVNODcLz4rRf1fv97sM3KzreO
         S55PULZ/Ghy5ABBlorZ6XGPraqXvUScmCCfne6uXN6hojDz5RCnEo78+pB/9fyjEil94
         1rQsO+eV6qioXqJjy8//coXONPe0oRYClo16MJ61kVTkDFVCRopKJxq4ZjrIRj6/wdd0
         Jh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m1XWxuEf2GfY3Vh2yJuAmipSdpdELNdFo6nzf1ZAoLo=;
        b=3v1EoziAAFXbF9nA74Asd92GVO+Bt+nuq771n7cuQCYfG1VvFarPMGqmwFlliVeldA
         59AXepnNzJaQhRJptIWzPMU4A2ApOO8tvvJdFoyixcCOmtTfZwNcPj5cFAKPZ0t09INd
         YKi7Ub6khZhHnQarsQYFXdoPNl1DB2rQpCTrteLXwUD3usbnXLTx3MfD98HrSgUk1OTz
         z837YK5jX6XOlkCOnvIjstdmj/Lh7tBvtznNho2xHK26vu/tsDQUytFUVyLaNN6NB8bl
         KpQu1uYW4jDHBB6/XEOlpaQacVtyoTSH6LPFPzywdkxmnHD0Aa787wgEmNFxyLhp49BW
         c7rg==
X-Gm-Message-State: ANoB5pn0J6dLEUieAljeBRkeU56hRmec88Z6gbY54Z5Few6D1uNVqXrY
        bKiRUq1/1OJPyC2RhdKJVGOgXw==
X-Google-Smtp-Source: AA0mqf59DI2cgoVKcbFIz7sHU/5hWlMGk+E8ZKkter1Hef9j92tC5mXubAoJYrHxqBLadq8ZC7At3g==
X-Received: by 2002:a05:6512:10cd:b0:4b6:ea92:69d9 with SMTP id k13-20020a05651210cd00b004b6ea9269d9mr8268039lfg.61.1671237232165;
        Fri, 16 Dec 2022 16:33:52 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u12-20020ac258cc000000b00497b198987bsm351458lfo.26.2022.12.16.16.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 16:33:51 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 2/5] arm64: dts: qcom: sm8450-qrd: add pmic files
Date:   Sat, 17 Dec 2022 02:33:46 +0200
Message-Id: <20221217003349.546852-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221217003349.546852-1-dmitry.baryshkov@linaro.org>
References: <20221217003349.546852-1-dmitry.baryshkov@linaro.org>
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

From: Vinod Koul <vkoul@kernel.org>

SM8450 QRD features bunch of PMICs, add the PMICs which we have already
upstream files

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
index ee62514fff68..e24bb77b2410 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
@@ -7,6 +7,9 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8450.dtsi"
+#include "pm8350.dtsi"
+#include "pm8350b.dtsi"
+#include "pmr735b.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. SM8450 QRD";
-- 
2.35.1

