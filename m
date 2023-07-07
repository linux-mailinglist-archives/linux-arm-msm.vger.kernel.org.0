Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE12474B0E5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 14:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232663AbjGGMao (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 08:30:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232600AbjGGMal (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 08:30:41 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13E5D2125
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 05:30:34 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b701dee4bfso29535671fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 05:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688733032; x=1691325032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lvtanpZ92WUBFRdOaKgxHw3kXibz5BcF/5lJ267JFA=;
        b=r6DjFYU7TMrk48/8ywwWcJpg299u+3E78tM569vbym+0k7JJdQDGDumTJEzbbFzJu1
         NsFG7ejlFoKomS+19cayMojb4Tf8A7hL64HjCor1MfAY0iSNWx/XD0+GrN3MVcWLnBvy
         3j5IOqm+9tbnYZs1LF+zZ4QD8IR+vIYokhsqII43darEdhPhOx6ulZ2JTK1T/siaCKDe
         GBsX/dj5UW6ccOcO+VaV1O3O/fz3LPMPQEBC2DkPP8pgUN6oZoJqIcb9dPZdA1oMcTys
         YoS03Hph3i5+9oP6/YQqZKsT/EoQL4tvRN89tAtBx/UyGPj7bM6uKIKhH9WABeGmW0VV
         2iyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688733032; x=1691325032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3lvtanpZ92WUBFRdOaKgxHw3kXibz5BcF/5lJ267JFA=;
        b=FWgV0KMmGttDJcxB9lXNV6qg3OBpDCy3sIMYZVYR3aQZbyCKJkaUKME4cUxm94DxUd
         ESDAfCEj1zhckdF5uOGq8duKl+pM/n82GHP/D5EbJOr1mCAkWOef69NlMNgiLeUia0ga
         UadR7rJPcdP+2dAEMi2ypsjLJJOjuPAhmvb7UxFKBrqyO/YBnWIfgzlSZm0OWID7EZgs
         lE+m8EAFMu5/Xk+B2D12oBbxAcBvhuD+ULcnrCn2syREOSaAfLFSSj09Uip+vFYxvKrG
         sWlbfNzBHUNrgZWZ7WdbzH3oi0g4DoGdeeAlV+3TTVwGjKme//DhcO5czkIdffqCLoHy
         uZEg==
X-Gm-Message-State: ABy/qLb+zF5X+DZzl/HhnssdGHG72UjEFaOFw5GH6AaMtzdEZkLVa4tm
        5zohjnolpX9t8cWSN6ui86e1YQ==
X-Google-Smtp-Source: APBJJlGObOywR0a8IYbmlxF4Ssy6sZF9mRZeSMKzVzYcGYrzKhaJwi+ml9/JicMgvXlctFWgPNn9TA==
X-Received: by 2002:a2e:3313:0:b0:2b6:fa3e:f2fa with SMTP id d19-20020a2e3313000000b002b6fa3ef2famr3704396ljc.32.1688733032364;
        Fri, 07 Jul 2023 05:30:32 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id l5-20020a2e8685000000b002b6ee99fff2sm756803lji.34.2023.07.07.05.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 05:30:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org
Subject: [PATCH v2 5/8] arm64: dts: qcom: pmk8350: fix ADC-TM compatible string
Date:   Fri,  7 Jul 2023 15:30:24 +0300
Message-Id: <20230707123027.1510723-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230707123027.1510723-1-dmitry.baryshkov@linaro.org>
References: <20230707123027.1510723-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The commit b2de43136058 ("arm64: dts: qcom: pmk8350: Add peripherals for
pmk8350") for the ADC TM (thermal monitoring device) have used the
compatible string from the vendor kernel ("qcom,adc-tm7"). Use the
proper compatible string that is defined in the upstream kernel
("qcom,spmi-adc-tm5-gen2").

Fixes: b2de43136058 ("arm64: dts: qcom: pmk8350: Add peripherals for pmk8350")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmk8350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pmk8350.dtsi b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
index bc6297e7253e..1eb74017062d 100644
--- a/arch/arm64/boot/dts/qcom/pmk8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
@@ -59,7 +59,7 @@ pmk8350_vadc: adc@3100 {
 		};
 
 		pmk8350_adc_tm: adc-tm@3400 {
-			compatible = "qcom,adc-tm7";
+			compatible = "qcom,spmi-adc-tm5-gen2";
 			reg = <0x3400>;
 			interrupts = <PMK8350_SID 0x34 0x0 IRQ_TYPE_EDGE_RISING>;
 			#address-cells = <1>;
-- 
2.40.1

