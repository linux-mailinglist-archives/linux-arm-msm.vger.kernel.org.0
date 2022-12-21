Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45459652B5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Dec 2022 03:05:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234078AbiLUCF4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Dec 2022 21:05:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234401AbiLUCFj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Dec 2022 21:05:39 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9887D20370
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 18:05:35 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id f34so6161721lfv.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 18:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zoaVmWyJl4WNoN6Z+gsogU9AbrAG75c6CnFCXvJAOg=;
        b=HNt79aGd8Ymyw+kN/PpyE4yEiT8O2z38v8wEhSFiEheFyvBXDJLVOpi3EKnDeRtkEb
         w9+kajSq/y/LsJSl6o10IoO7WOrd4rUWl4fkhskF06SLVhi9QrfLHn0E3OuuPQ0QwPvP
         i1IFHo+VkQDIHnlZR40I6t0ogqi0yDNqONsahNxZg39ZlcZwEc7h1RNlT9I8hsNY/TJp
         CA1FLQYi+oXr/ceSdOf8gcJpMrr85afcht9VdZq81gyMKe/r9HLsr1AixCitEJZiO9y8
         4+bujynPQfH+rmr3b9ih59t2yKH5j8ETFhbBUVDEXAnTx+RfAcu36Dgh/DJZsNqd7W49
         PCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3zoaVmWyJl4WNoN6Z+gsogU9AbrAG75c6CnFCXvJAOg=;
        b=OrTwa4D112TrBalEp+QyZPmygZfDk8b/RfnciTUCf7+hnmizL64kbtlOejgaNvDQJm
         GJpXXrssrL7792GYVGHQy6/NBwyVDBRrxw8jo2c+9nDFEZyKQISSe08Ow9Nnl4ztosjq
         ee23Wy8iUrQklsa2pmuuc+clHdg0lRJ6g/iEAb3/XQdByvR0G8DMA659cjwxVVjYM5vp
         +7A9PRrzVdltnsOvR/pLkE7Jg0WlG8LAlQN84XuGCSFfL12k791Z3TkyO7TqRsZAZdiP
         DP39u3qDLEY3rX8zll7PU9qik3ggyeffGVmwb3bhzQLDf7jQPLZPr1BigrSbkvCde3Li
         osXw==
X-Gm-Message-State: AFqh2krrlVp4f9LGV8XCoITrHSdMpRZ/zcEnrk6KW8vyE57tIMi2n15R
        BllILlxIULljbtAANXCYqPCb4Q==
X-Google-Smtp-Source: AMrXdXsIVWTlS43pziKjFPuxpA1NWDbx5qXkuKg3QHWMvTlPmagRIKRyKtOU4sgpN689GL+ffkb6kA==
X-Received: by 2002:ac2:58e1:0:b0:4b5:4606:7ad9 with SMTP id v1-20020ac258e1000000b004b546067ad9mr1110738lfo.39.1671588333965;
        Tue, 20 Dec 2022 18:05:33 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id q18-20020a056512211200b004b257fef958sm1673048lfr.94.2022.12.20.18.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 18:05:33 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 15/20] arm64: dts: qcom: msm8956: use SoC-specific compat for tsens
Date:   Wed, 21 Dec 2022 04:05:15 +0200
Message-Id: <20221221020520.1326964-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221221020520.1326964-1-dmitry.baryshkov@linaro.org>
References: <20221221020520.1326964-1-dmitry.baryshkov@linaro.org>
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

The slope values used during tsens calibration differ between msm8976
and msm8956 SoCs. Use SoC-specific compat value for the msm8956 SoC.

Fixes: 0484d3ce0902 ("arm64: dts: qcom: Add DTS for MSM8976 and MSM8956 SoCs")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8956.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8956.dtsi b/arch/arm64/boot/dts/qcom/msm8956.dtsi
index e432512d8716..668e05185c21 100644
--- a/arch/arm64/boot/dts/qcom/msm8956.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8956.dtsi
@@ -12,6 +12,10 @@ &pmu {
 	interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
 };
 
+&tsens {
+	compatible = "qcom,msm8956-tsens", "qcom,tsens-v1";
+};
+
 /*
  * You might be wondering.. why is it so empty out there?
  * Well, the SoCs are almost identical.
-- 
2.35.1

