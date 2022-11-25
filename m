Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0825B638A31
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Nov 2022 13:37:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbiKYMhu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Nov 2022 07:37:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230244AbiKYMhO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Nov 2022 07:37:14 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7821F2D1C1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Nov 2022 04:37:04 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id d1so6553528wrs.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Nov 2022 04:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJAlFZkHe4ktdw1E/cS67Ub6i2g6utdoyS6sjNqUgDg=;
        b=mVuinoJgB7IthUjEQhTD3EMD0e6+DnGe4ZmuRbJDAXx8EPbM9lfIGQ49m2ohc+f34o
         9InsAJ7BMUJs8k9Rd47KHPOAvnkoyZNVJC1X0aKvVYNn6ZyflmE6SKGBIpP+Wvj+DxPN
         EgOhi2QzJ68zFFGnrUTA7X+3v+z49LxSZmLmdurSO2Dc4XHdEmw1niicgFfUxm4wCtLK
         8IwefwpQ8Xf6Yip+S4+Vh5rzMqYUPwBmr1XHzt6z8zKh3fuM8RR1pShep+aCx0Y6a9rG
         05vb1co4p5rsDYn49s18Lri8HxG24HQBbvZfj+mAkmfAkyk/Ng8O2avZlbwKJJc0ALRy
         /dLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fJAlFZkHe4ktdw1E/cS67Ub6i2g6utdoyS6sjNqUgDg=;
        b=bGxwqweiAhv/eijgorhUI/kZOC+GgPkfU7Og/f+sOsVRQgKwhWnEN16b04+eLCDLtf
         zhglaahqhZMRnfq7ONULUzjImODVZxcrUTnrR8mf7HWyylnnRAtbG8qQ/eqvdcFTGI8C
         pxTzuYupdCvsm4FRx7KpA6TEcPUW9wpJn6BzEUxVrmoTceA2qc+tGnZ3g2YyXTwDgMIb
         At/kJm4YWaFtLjYJtuRcj3g3tlEgkMuVEah7bI60khfo24LR39aKuhwGvmcu7JU/Kxld
         UGxez4Fy6XbsyQmzcghWWz7V5Jat6roh0TyTKsUCFEK4+MPF7eqvD5kg00vTwvg+Q5vJ
         tu9g==
X-Gm-Message-State: ANoB5pnXIpNTNtvTZ4u3RuGM0rN/jOwOM9y9uPV2wllHNrzydETCV0sj
        4ssCmcRDc7QuRcufwqIul1+V3GZxP4hVeQ==
X-Google-Smtp-Source: AA0mqf5o4GXzn2rwCzo4feptXecVWUcVKuDVfArlCF6nlH1io+wxtYfxtih7DQD6/ykjZzuqflnvng==
X-Received: by 2002:adf:ed4b:0:b0:241:d4c2:e741 with SMTP id u11-20020adfed4b000000b00241d4c2e741mr14849813wro.628.1669379823882;
        Fri, 25 Nov 2022 04:37:03 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k15-20020a5d6d4f000000b002366dd0e030sm3574111wri.68.2022.11.25.04.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 04:37:03 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org, dianders@chromium.org,
        david@ixit.cz, krzysztof.kozlowski+dt@linaro.org,
        swboyd@chromium.org, konrad.dybcio@somainline.org,
        agross@kernel.org, andersson@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v4 18/18] arm64: dts: qcom: sm8250: Add compat qcom,sm8250-dsi-ctrl
Date:   Fri, 25 Nov 2022 12:36:38 +0000
Message-Id: <20221125123638.823261-19-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,sm8250-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sm8250 against the yaml documentation.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 0d47c5b7148e1..8a73f1b487043 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3528,7 +3528,8 @@ opp-460000000 {
 			};
 
 			dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sm8250-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -3619,7 +3620,8 @@ dsi0_phy: dsi-phy@ae94400 {
 			};
 
 			dsi1: dsi@ae96000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sm8250-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae96000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

