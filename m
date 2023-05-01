Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C225A6F3947
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 22:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbjEAUeR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 16:34:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233013AbjEAUeP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 16:34:15 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEBEB35AE
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 13:34:12 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2a8c28158e2so28076711fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 13:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682973251; x=1685565251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dtq6J1T5SaETo4KYX1pWYkqM6uP87lVD5G2k3rD0guM=;
        b=ZtpZX+g+sXtKqgT7v0f/T4X047b+bGVdWfUZR+qKsCV31ZSWIesjMBKZB0eyUnVwCp
         Cpoy1RQMVPkUsoleA+esh/KsLGvBhm9Djf6MKF8G+7OUj48ZW4GG7569f2GNxli9Bjuv
         m41YAFADRdmRHkvS07nijLRquQo+EWSPOPSV7vmMDbu/cH3rVuVdHR8PZjmd92PkNkE9
         vd2UuEpigtop/VZAxc/O2kX3Kvefe5RJ5HpdP7NxhCf2ZsZG631Zmro4lDM4jaxEHBpT
         JJrjZuZ4E1y4roQ4p8gwqT7GuFEl9DJwC80ViKDJGxetKF93P7Zu7xp57zTU3Cfz+xJd
         Fjmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682973251; x=1685565251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dtq6J1T5SaETo4KYX1pWYkqM6uP87lVD5G2k3rD0guM=;
        b=Zp+R27UjNdrWXh41/cwGoxNQGFZeGC59GrEB30AyTV18TIcfcyvDDNbEaIagRJ1maS
         6zLCMGDvjG+PQfiy8D2uyiFsF4bYernLHxjwZp1ct1TcnBiEUEJ0PHrcr/717FRac1mu
         6PY6IzHH1OAvHoV5uM9JR9Buww+ABnYzf+WT+b7BixrYshWAClGcNy0LIVE4DHPcXrSG
         3J0RWLNT3wYCuErlc6FEE28zpqo+YUTMBFttf19+ABiwVflWdDTyY7A67OpUNVD/51s1
         pC/O2CvC1oIBDmR8jshu0bzz4xGx03Ru/QXumzD3LvTHitdwVbenImrKyBSzYK3yDlK9
         gynA==
X-Gm-Message-State: AC+VfDwjDzDPjnoShVL9YNPpu8BO0uZwPrZ2KPolX83pCiicdYeQydpc
        j3g5edQW2/dTw3lXzy5EQnmAAB8I9yd/9VhFKPg=
X-Google-Smtp-Source: ACHHUZ6E7e/wTUNfAQwgw2IAiZMuYdpixqKVql55gkgnkWOKV8+7DtHKYx0NXu38Qb9EBfU/iklPfQ==
X-Received: by 2002:a2e:8543:0:b0:2a8:a65a:7313 with SMTP id u3-20020a2e8543000000b002a8a65a7313mr3817363ljj.31.1682973250850;
        Mon, 01 May 2023 13:34:10 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id f27-20020ac251bb000000b004eb018fac57sm4885909lfk.191.2023.05.01.13.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 13:34:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 10/10] ARM: dts: qcom-mdm9615: specify gcc clocks
Date:   Mon,  1 May 2023 23:34:01 +0300
Message-Id: <20230501203401.41393-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
References: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fully specify the clocks used by the GCC on the mdm9615 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-mdm9615.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
index 556abe90cf5b..e81e5e3196d9 100644
--- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
@@ -10,6 +10,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-mdm9615.h>
+#include <dt-bindings/clock/qcom,lcc-msm8960.h>
 #include <dt-bindings/reset/qcom,gcc-mdm9615.h>
 #include <dt-bindings/mfd/qcom-rpm.h>
 #include <dt-bindings/soc/qcom,gsbi.h>
@@ -106,6 +107,10 @@ gcc: clock-controller@900000 {
 			#power-domain-cells = <1>;
 			#reset-cells = <1>;
 			reg = <0x900000 0x4000>;
+			clocks = <&cxo_board>,
+				 <&lcc PLL4>;
+			clock-names = "cxo",
+				      "pll4";
 		};
 
 		lcc: clock-controller@28000000 {
-- 
2.39.2

