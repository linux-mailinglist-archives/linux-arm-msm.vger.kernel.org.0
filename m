Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14CC265D436
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jan 2023 14:32:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239448AbjADNcG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Jan 2023 08:32:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239316AbjADNb3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Jan 2023 08:31:29 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1D192BF1
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jan 2023 05:29:22 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id x11so11023460ljh.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jan 2023 05:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBIconjpYg789mB0QT5q7S9l7fWGDmPA4DJamBY4g6A=;
        b=U+hXx0tTejf3KpT91LTZpZ/IIbEvzvPrJyR88hzVodj3pks/L6funeMplJtlek8pB+
         tQT2X7nuQ7DxXTlnuhIhkshekSq2b/8ASqJDQSVAe5Jx9ab5MSmUMtkEHUG+OXXBhLOo
         S0bZAXfOfG+KojpBEkDhELmRofUQ2kDiXlCWsH6e5PCLH9X7PX2dzrarr3Bi0eLXBgvy
         H/0gXL7LJNY0hZK9dZZnBw9pVn3GmwN286xLggAi+ercqmJiGSv681JAnjMT83d4PvVE
         fxfmdx3/r+WBAHy2wofRExy0Bb+kfG+spc5Zapb10Oj2OxKJxsw5RD/18So/gchWWzFs
         7BqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pBIconjpYg789mB0QT5q7S9l7fWGDmPA4DJamBY4g6A=;
        b=g9STH3hf9WSAvka2j6nPapjgnR2YYHCGSH+789d8p5QEca3F1Z9A1t21ihUc13pwCC
         rx/ByMBWce2tJmxjHyB1rVA0NaPy+eYQaFf0ywsUMVhMfEu2bARxLf7MSzjSeq7NZkRN
         G0nFbYIRedaJs6edP6tK2IgXQSA+Qq79sYVr2l0edsEYmeZpOnsYbdiPtWVllkjH/V3S
         mdSn478Y26+39iGbjfD88Zm7Cjwnu8i1oWiDW4KfPNNBYStYwG8hjM9I6Nb67ZmSDkWf
         CI76jas6y++usW41ve8PHOyYmirJijTQkrJwYUH8dPprGPJhLL//X0Vx4SYHD6OWuLlD
         EZHw==
X-Gm-Message-State: AFqh2konfRHHc1vqui4L3f0q588AUm4VIy/LEkzZMFsRHDYphCYuFOGR
        eEMkHKiNhP4hKskC4FL+Pv8kOqb0rMAlJDsU
X-Google-Smtp-Source: AMrXdXuZZOFT7sp31iYHcW3oVp0oLXHUtW6nnUQzuidZUJrQMnqAHkafblzJteIm/SWRxQ8j7JLHiQ==
X-Received: by 2002:a2e:bf2a:0:b0:27f:a95e:94b9 with SMTP id c42-20020a2ebf2a000000b0027fa95e94b9mr20835808ljr.18.1672838960991;
        Wed, 04 Jan 2023 05:29:20 -0800 (PST)
Received: from localhost.localdomain (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id k23-20020a2e92d7000000b0027fd02c99d4sm1947071ljh.75.2023.01.04.05.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 05:29:20 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: qcom: sm6350: Add OSM L3 node
Date:   Wed,  4 Jan 2023 14:29:14 +0100
Message-Id: <20230104132915.667946-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230104132915.667946-1-konrad.dybcio@linaro.org>
References: <20230104132915.667946-1-konrad.dybcio@linaro.org>
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

Enable the OSM block responsible for scaling the L3 cache.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index e71ffc31d41e..893a1ffb5e3d 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2040,6 +2040,16 @@ apps_bcm_voter: bcm-voter {
 			};
 		};
 
+		osm_l3: interconnect@18321000 {
+			compatible = "qcom,sm6350-osm-l3", "qcom,osm-l3";
+			reg = <0x0 0x18321000 0x0 0x1000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
+			clock-names = "xo", "alternate";
+
+			#interconnect-cells = <1>;
+		};
+
 		cpufreq_hw: cpufreq@18323000 {
 			compatible = "qcom,cpufreq-hw";
 			reg = <0 0x18323000 0 0x1000>, <0 0x18325800 0 0x1000>;
-- 
2.39.0

