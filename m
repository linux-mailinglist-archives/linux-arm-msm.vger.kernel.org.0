Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59CF3675F44
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 22:01:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbjATVB0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 16:01:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbjATVBU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 16:01:20 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DC3F95758
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 13:01:17 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id w14so8194622edi.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 13:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5vdvlTIe2SoUdgzeTBXtkOHkXv6c2FDuAp1y22eD7Ng=;
        b=rhSCbwWbjcUJKlgvQOopMWTQNS4FyCSdDOWhsdPizT6q+UQu4iVeyAmPOW5WKRQJgT
         +Nz4dkQwNjkwv6zsd0mbsgyNLAqj00cjWXRd69Cp5ucpmXVs1bV/fVM8wGV4BvO04Je8
         YeNmEXt7GOD9+3EqM/LVf1SyCiMqIlaBhijJ3nmrRCEMxwo0pX950AGQbeZq06vsaiGP
         IZ3hvWDZW/EI2BbE1Tl+kXiI2M//dNGYiYPsZjYiRFunyCT1lgNapZ0DFehZcWGvCW9X
         WYhAvM5EiJsEx0eKK9GRR3X7pu8e8HBGpq+oqpJe4fsIhXAYmvNxCkD0LYMDZngfwGsX
         tg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5vdvlTIe2SoUdgzeTBXtkOHkXv6c2FDuAp1y22eD7Ng=;
        b=du1st6SoyLGQyamiNNXCz8AOU6xPWTdcPPqMxy4qxPoeHSsKVgZp8snfvRjUlypPlI
         yy8cmXWRHslfXgLnXbgIO43KpYz98p2WMyE1zmJnNkyRSV/8m/ROPqFcbLuJblWSvvW/
         p0dXzRFTksM0ozS7eMIx6jwRfzvK4rTlxgWTIPQ46f3QEyObIJ4Njlczovpm0dO6RAuJ
         9iVY6JYdBTolD4Ta1MNTB6QaLsqhVrFR26KuJnqTW1UPTt8SYQbFptiCxaseUkXmbuOj
         VdSLyE0Jico+okgrTsfClXVMUI1YzXuGcC2aWkZ5uUO8oSDdOKArJABvzWkJk5p80Zn4
         DV1A==
X-Gm-Message-State: AFqh2krCWWy7q/tmpF8Z8eGXMDXeMfblFg1sF689wk4pQdiAzCDfkaLz
        ciTkZuQqAQODbMwfOrKmeSsKxL8hA4s1uwaL
X-Google-Smtp-Source: AMrXdXuA4bZe2r10Fa2xb6v7gUYLSpFAEboZqxVdFXr3Y8zk2kJnKU4qwAoDJTd+CPD8UbAuF6ivag==
X-Received: by 2002:a05:6402:1946:b0:48b:c8de:9d20 with SMTP id f6-20020a056402194600b0048bc8de9d20mr17986061edz.32.1674248475600;
        Fri, 20 Jan 2023 13:01:15 -0800 (PST)
Received: from localhost.localdomain (abyk37.neoplus.adsl.tpnet.pl. [83.9.30.37])
        by smtp.gmail.com with ESMTPSA id g22-20020a170906595600b0087221268e49sm6581229ejr.186.2023.01.20.13.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 13:01:15 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 2/8] arm64: dts: qcom: sm8350: Add missing #address/size-cells to DSIn
Date:   Fri, 20 Jan 2023 22:00:54 +0100
Message-Id: <20230120210101.2146852-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
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

Panels/DRM bridges definitely don't need 64bits of address space and
are usually not 32-bit wide. Set address-cells to 1 and size-cells to
0.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index dc84dbed81bb..c0ba67747c24 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2989,6 +2989,9 @@ mdss_dsi0: dsi@ae94000 {
 
 				phys = <&mdss_dsi0_phy>;
 
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 
 				dsi0_opp_table: opp-table {
@@ -3084,6 +3087,9 @@ mdss_dsi1: dsi@ae96000 {
 
 				phys = <&mdss_dsi1_phy>;
 
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 
 				dsi1_opp_table: opp-table {
-- 
2.39.1

