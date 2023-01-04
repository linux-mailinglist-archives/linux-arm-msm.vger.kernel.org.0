Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE1965DB0D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jan 2023 18:17:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239925AbjADRQz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Jan 2023 12:16:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239792AbjADRQx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Jan 2023 12:16:53 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABFDB13CDD
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jan 2023 09:16:49 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bq39so43563665lfb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jan 2023 09:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQ2K0kYnRt+YlD+PL9WGp6KBl813c0oprYOBplj3bv4=;
        b=szXPsA0QOxmO8j4kyf6xPafkQvC5VentVyIlxxl27L+xV3FCYT5IgdKfbLJYzJoafs
         +nr6QdisZKtL8jUYIsHkVphXY09VEoBLiMqQi1Bg0XLSRmZ6GUiqEx5iZc00IEsqh44E
         2Qbp9A5TY2L0m1ikGnfvM3+NDcmu8JmQCEEwvf8/cJJucsyOGUgO+Yx7hKbE95B3Tc9F
         gvcdfO0sVVACBB7z3RlbskMAu6MyDJrKzh9d8VO4v/euVgXlKb+Xiqdt5A2KuUhO2jZv
         3Uooe6c0eKlmZ7f7664coF/cUdcemyTJY5vZa+t6jOII+riO5iO1XkLa9oGzYvezFcRr
         ZdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQ2K0kYnRt+YlD+PL9WGp6KBl813c0oprYOBplj3bv4=;
        b=DxyUm4TDIHziBIpL/YoGho4+rLT4oZlXEM0t3NSxlUrpz+juDPStGrKWJ4B+543CgJ
         SVYgGAjSig6CeMHvci9aGWw3gy5oq+NaNG7EYLG5QSeSkQuDM2WIuwgJxh3WloIO5VT8
         8zo1xmZQr2847EnYNU7UDxhZliLvcsqh0VQl1zCkh9nrya83AYb5E6EWYn5H2TuC7FdY
         TUYwQ9G4wrF5jTzTKMpdpA8a5eHfQ4zNmiLWr0tQ+T9BVjVM1hitnc9l+GU/fa0YWjT8
         l+M4q1grOcInCrbGMSxwh8fsfnLsdfTWUpwA4JNz0arKTAMxWytcbYn6G/hOn/Op2gGI
         DF3w==
X-Gm-Message-State: AFqh2kovdYUUPtg1pzRCrU9IEPMx9PzbIMZvpxCblF/aj2J6ZDhWNZrZ
        g+rrTNGu33/1sJsmWD0gcfsQ25G33i5IwTdf
X-Google-Smtp-Source: AMrXdXscXw0c3pCpDcMCnQnPl+ncC64J815G9Ky1zt0LltxWhrlPa2H6iSrRjGLzuQdj2BZMsp7xZA==
X-Received: by 2002:a19:e611:0:b0:4a4:68b9:608a with SMTP id d17-20020a19e611000000b004a468b9608amr12873814lfh.21.1672852607749;
        Wed, 04 Jan 2023 09:16:47 -0800 (PST)
Received: from localhost.localdomain (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id o22-20020a056512051600b004a44ffb1050sm5179520lfb.171.2023.01.04.09.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 09:16:47 -0800 (PST)
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
Subject: [PATCH v2 2/3] arm64: dts: qcom: sm6350: Add OSM L3 node
Date:   Wed,  4 Jan 2023 18:16:41 +0100
Message-Id: <20230104171643.1004054-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230104171643.1004054-1-konrad.dybcio@linaro.org>
References: <20230104171643.1004054-1-konrad.dybcio@linaro.org>
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
v1 -> v2:
No changes

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

