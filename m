Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD59620451
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 00:58:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233217AbiKGX6T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 18:58:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233089AbiKGX5u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 18:57:50 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 737712B1A3
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 15:57:16 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id l14so18550750wrw.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 15:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZQLjGoduVqD0wlKsPJy2lXXDh0v/l/LzOg/AbKNcSA=;
        b=EgrZ49A68mod9q5z/E3StSm6Tp/6svbIfXe0QLF94JKBSU2q1bx54pCcvC0hilVFOk
         JOUK3bo4yIoDMPp3Y3RJ3puRfw349VQ1bm7Yxv4x2UNGaAqQ69Btu1VmkewGZ/7qK9Tn
         6/k6sv6pAmtNQhhcRvcxda2jtg0Jt34tQPkVvVV0sMGcwua9qs29OFnECNFz11x+wGuI
         +e77SVueDJBOi8qcKlPwyWwM/6257/kuL3txw/LJR4SOWCoBzuXV2Iv8XBUmerf2i9Xe
         46mbX9wEuSqVSoPXfgKvl1+c/BweZp4CaA28fiVMY6IDZkzLSQuEE3UW8HcTqnbPS3tx
         XODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tZQLjGoduVqD0wlKsPJy2lXXDh0v/l/LzOg/AbKNcSA=;
        b=2TUvM3XX1M8o1E4rZR4PG8c0ySC+hL/2BNFsnO+5Hp2rXeNOYVVGgIRRg2YjD+TtIT
         X1sUwZl/fHRrDdoU65D0FMgryctY3YtblO5h1gCtUc6e0IpgqMHg17IEdaIrEyF2WnuM
         0zsLoFsx5t6aeWn+vN/KuuJfmgZvYdLJLCvyxMV+qepTjqZeIZuWjePap8dtPR4tI5+H
         MZ+g5Ci++J0UJ2DlNkl2Kw5iLpETxXHVZQ/l4t7BtKIH5XhL47o/zk9tKP9WheMMJaH9
         je7Qd5LMoTBAitmvnrH665ocC76C1nrjvS1xSqHQYtBrXUuu/W3Ydb9ySYeYDHxxZoK2
         Hb4w==
X-Gm-Message-State: ACrzQf3mpIU6Hgvsaddedyw3omnbVg2wrJgroVrxceMVTnp53VDfylK7
        0h6P+AWa8qqpi28+0tjo+EiOwA==
X-Google-Smtp-Source: AMsMyM4W9lXFVpAVI5g9Nz+fu49Nfc5TSfZY/NV49wOuR7rMsEdtgcnOa8Lq4/ilO5j8m9s0jRNM1g==
X-Received: by 2002:adf:eb41:0:b0:22e:fb16:cc43 with SMTP id u1-20020adfeb41000000b0022efb16cc43mr32174941wrn.489.1667865434968;
        Mon, 07 Nov 2022 15:57:14 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b18-20020a056000055200b00236545edc91sm8386161wrf.76.2022.11.07.15.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 15:57:14 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, quic_mkrishn@quicinc.com,
        linux-arm-msm@vger.kernel.org
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 17/18] arm64: dts: qcom: sdm845: Add compat qcom,mdss-dsi-ctrl-sdm845
Date:   Mon,  7 Nov 2022 23:56:53 +0000
Message-Id: <20221107235654.1769462-18-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,mdss-dsi-ctrl-sdm845 to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sdm845 against the yaml documentation.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rajendra Nayak <rnayak@codeaurora.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 5420205417c81..8d19611362ffb 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4522,7 +4522,8 @@ opp-430000000 {
 			};
 
 			dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,mdss-dsi-ctrl-sdm845",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -4593,7 +4594,8 @@ dsi0_phy: dsi-phy@ae94400 {
 			};
 
 			dsi1: dsi@ae96000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,mdss-dsi-ctrl-sdm845",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae96000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

