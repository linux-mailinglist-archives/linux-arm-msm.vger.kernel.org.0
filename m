Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAC3B5F6673
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 14:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231467AbiJFMre (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 08:47:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231229AbiJFMrb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 08:47:31 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E727A2876
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 05:47:13 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 10so2540394lfy.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 05:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=LEP7LBVvpmeVA8/+OWTvoqrCZYU/QBAuWRLz/C2JiGY=;
        b=La+2iQqvg8AbSUqEnzhQ6E4taMkoQMdMqxwaOESpUlfuRwsHv+byLuptnRr5K2QPRq
         yhCOXICh9BX8oc0+e/1RpU3RqYPb5aHh8NuoVHgjLGEgyjfPfHU/SNZwKHtkpjM/l+2c
         hCp/yAx2aQKE8sKZ8VEMPztnf4KkWztIIgxxyebFEglR+YY9b6PgaHck35K08b/tCVnb
         I2v7JXij5pjvN4aDBNsex2sw23S0r4WeAr+eUOivmII+JfknFmYAIlTQRQN6TeNnNCXT
         dQaNow7gmFYJrEX9vRzFQi4f2NKOz+9Fgy8b45fSkzQFFCf/X+znl6xSlVhd2VJU74Zb
         KP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=LEP7LBVvpmeVA8/+OWTvoqrCZYU/QBAuWRLz/C2JiGY=;
        b=WI/JG9L9kMQsCqhVDf7jegvNUID9jHbnnW/Kv+go2op+oaw/ReUocCcrUC4UuV7Yaa
         PPDiZBhT2uhCvQuIicnWHtVbFiRlSpyuvF4YJtuKOZnMLMwVUH5JAkG8Ew0SlNe0HXut
         QDRL7yQ2S8Fnfye581nwd8PknIaN/mmsmo1+mhi9HNDoGBtspgvqD2M76fc/6q4RK1L7
         UFjw81DTo4LQ9zpUxPSogiKfdLELxoJJ9Kcn+Doxzk3zEMDEe9M40jIRasEQWK/k+zht
         Wk3EoWVtHGWuDW61dDgVZGOT6nERid3ziRcPwMK6jePB7ZILb9cRGXCSYFT2PrqOAbyl
         H7Cw==
X-Gm-Message-State: ACrzQf3lKzhdvzm8XCrEvDM/qb4cSRjyXbsM903RqhmVlgnT7kYw9FF+
        Nm3iaRjRzuu7/gISzX299LWCew==
X-Google-Smtp-Source: AMsMyM6WdQN2aHj9leIpBw6QKQ26qNUcAClVcIHE7RkZSuF0WCa+vzKyWOY1JJ32HMVH00/8X35AYQ==
X-Received: by 2002:a05:6512:3606:b0:4a2:71df:7938 with SMTP id f6-20020a056512360600b004a271df7938mr1267894lfs.279.1665060431210;
        Thu, 06 Oct 2022 05:47:11 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497a3e2a191sm2687659lfb.112.2022.10.06.05.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:47:10 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 08/34] dt-bindings: pinctrl: qcom,ipq6018: add qpic_pad function
Date:   Thu,  6 Oct 2022 14:46:33 +0200
Message-Id: <20221006124659.217540-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
References: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
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

The IPQ6018 pinctrl driver supports qpic_pad and DTS already uses it:

  'qpic_pad' is not one of ['adsp_ext', 'alsp_int', 'atest_bbrx0', ...

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
index 9c6e2cb0c6a5..0bd1aded132d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
@@ -92,9 +92,9 @@ patternProperties:
                 qdss_ctitrig_in_b0, qdss_ctitrig_in_b1, qdss_ctitrig_out_a0,
                 qdss_ctitrig_out_a1, qdss_ctitrig_out_b0, qdss_ctitrig_out_b1,
                 qdss_traceclk_a, qdss_traceclk_b, qdss_tracectl_a, qdss_tracectl_b,
-                qdss_tracedata_a, qdss_tracedata_b, reset_n, sd_card, sd_write,
-                sec_mi2s, smb_int, ssbi_wtr0, ssbi_wtr1, uim1, uim2, uim3,
-                uim_batt, wcss_bt, wcss_fm, wcss_wlan, webcam1_rst ]
+                qdss_tracedata_a, qdss_tracedata_b, qpic_pad, reset_n, sd_card,
+                sd_write, sec_mi2s, smb_int, ssbi_wtr0, ssbi_wtr1, uim1, uim2,
+                uim3, uim_batt, wcss_bt, wcss_fm, wcss_wlan, webcam1_rst ]
 
       drive-strength:
         enum: [2, 4, 6, 8, 10, 12, 14, 16]
-- 
2.34.1

