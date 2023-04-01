Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5A86D3492
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Apr 2023 00:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbjDAWIV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Apr 2023 18:08:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbjDAWIR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Apr 2023 18:08:17 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D55783CD
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Apr 2023 15:08:16 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id z42so26613700ljq.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Apr 2023 15:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680386896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWojdc1ild/jkFKcyiUFlzgUKZw9Hjq+5anNECZfCIY=;
        b=Q9byt6+GUeEnSswYsjDJovP3MECz1PizUCuzOd+lX7l9yUJPgJIFTAzQs7+0ccTDtu
         v5ia7JGYlH1K+B6MpU3LxMq3povv6FD4j3/1xadfX3MGda1oL2dllKxdOF4u1wMESHCJ
         V4u1IxVLWHxIV6Yt19sC6LdrVjkaxToufu13vniOmlV2fbhd0n6H5LHD44UXxOODBB57
         e3MsuyF1pFTJ6fjLLg0k8A3Z5EfSdSfx+gH+5jxvR5yGu4elO6HSaULFcI2jWZHoLDQ4
         wsuFfk3ZkNKfQm9f2/+VLzo5zNJRB2URFEY6wRQwR0FMxuJVrQqiOu244oTZJ1tThlp7
         46ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680386896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BWojdc1ild/jkFKcyiUFlzgUKZw9Hjq+5anNECZfCIY=;
        b=2EEBxZcqDr7bHTm2u4oBw87u2JYAUbY4BRejm9dvVLW7goxDS225XSgDfO8JGCnDf/
         jiuEIyQt/uDZ7oBuGCFeoyta/EJ4AxFMm1sCEUXBTnN2YnNVfjUaCjl1CjkJhX3Mn88W
         YqvsFA9epeAfZ8MxRdpYFzgAxljxRA/ti+51SS9PWEmNffEpWZTBH42JGSTLz33mzpTq
         WzJKQMOIOubUPnnlDmjIV5+g/6WziWsTLHY/3LNs3C/rC4a0UznZjPOP+IeqU0l9n//9
         JP6XJ2n5WPgamo1yy9DjkoX7jvaD/SlaiWHTFVU2nOvtLyvndFm0Y66Ws8+u2I0kZ86G
         kPaw==
X-Gm-Message-State: AAQBX9e1GsStxQC5Z89Enrq+mxKBBrRNdcXqKsxLzBjsysw6mWKiAia4
        WLzCHWPzMK03Xo3Uw4BrsUJFjg==
X-Google-Smtp-Source: AKy350ZesZrciIaS34piWXf66NS5s/Sz5aXKdUb1T4ZUckmKU3mk6TM+tKJluPSPKVxTs8z/fkyUig==
X-Received: by 2002:a2e:80c9:0:b0:2a3:8903:f161 with SMTP id r9-20020a2e80c9000000b002a38903f161mr9259265ljg.42.1680386895999;
        Sat, 01 Apr 2023 15:08:15 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k17-20020a2e9211000000b0029bd4d0d3f2sm997590ljg.33.2023.04.01.15.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 15:08:15 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org
Subject: [PATCH v2 07/22] arm64: dts: qcom: pmk8350: port sdam_6 device from sc8280xp-pmics
Date:   Sun,  2 Apr 2023 01:07:55 +0300
Message-Id: <20230401220810.3563708-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230401220810.3563708-1-dmitry.baryshkov@linaro.org>
References: <20230401220810.3563708-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

sc8280xp-pmics.dtsi contains a copy of pmk8350 with one extra device,
nvram (sdam). Port its definition from sc8280xp-pmics.dtsi into main
pmk8350.dtsi file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmk8350.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmk8350.dtsi b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
index 455ffffb5f5c..26e40dbfc173 100644
--- a/arch/arm64/boot/dts/qcom/pmk8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
@@ -66,6 +66,15 @@ pmk8350_rtc: rtc@6100 {
 			status = "disabled";
 		};
 
+		pmk8350_sdam_6: nvram@8500 {
+			compatible = "qcom,spmi-sdam";
+			reg = <0x8500>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x8500 0x100>;
+			status = "disabled";
+		};
+
 		pmk8350_gpios: gpio@b000 {
 			compatible = "qcom,pmk8350-gpio", "qcom,spmi-gpio";
 			reg = <0xb000>;
-- 
2.30.2

