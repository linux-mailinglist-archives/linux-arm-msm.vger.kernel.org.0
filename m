Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D28B6BCDE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 12:17:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbjCPLRh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Mar 2023 07:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230270AbjCPLRb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Mar 2023 07:17:31 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5282C488E
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 04:17:17 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id f18so1867602lfa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 04:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678965435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q8t94EnhxhC2ZUF1cUhDWiKKp0aSTni9kWKdYuzKvts=;
        b=IchcS0EtnIS80/0CPEtftBm5AMOXu+vBHvkqypfrzBNATsHTxDtbHOSEywHtq+b7b5
         hqZ25VewO4d2Hk7zKbUjYg4+SiVqnqFeIiMFyzfplVsACIVTDj43qK+rc6HRHax7+rHs
         vZlKyxXR0qP6AtTpcDz+3b7UdwylqG4ij1XhtYl5ZWbUvHfDf5ieAcl1YZcI8oxCyWad
         iRDGrpY4HQwjzX/e6rHtWXh3+p2Ls24Cb0Tj9CAQKKQFvqzUMd0HOGJ09QMChZRCyvuJ
         uXyBBVwm1l96CCDGX+/YTg4lH5SRo9//6eoREyw1FmL3DfaxPCMu5q8yn50h2rtKjXza
         NOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678965435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q8t94EnhxhC2ZUF1cUhDWiKKp0aSTni9kWKdYuzKvts=;
        b=ZfV6NO1azUsPTC2DnVmDcLjWJF3/d9MtavAkgdIk+jfvvI8db3ZDlD7WNCReuXj8q5
         Kx9E4DwIsanG5icqhycJXRFWN5zA/XGg/NLopkcyTBk+SnO33OHz1Hs4O5RuXoZi6QhX
         YA7EIQsV+cXq/l0mmDxMQ8YtgSEdFQIy+50TZ2BWJXo6ad5x2JZ4Ei35zx8pnPsJUsOr
         mKQk5I+wQX6rbdOLLF+IIegS6eY8O/KECTJbyXSIhELODp8oy3YVqzmrX5bK7yS/MH28
         dICLD8udg1mHDyYlJ1NnA73e/vHR0mEC9dTO32PXoEC9wJIuZt/Zvb1Bp8eS/KmCHOmM
         s6vw==
X-Gm-Message-State: AO0yUKUejzdlQy2qBd98N5HRv3Z9pdzEeIpO5Mo+iwFyA32eke4wpOqj
        jzOLc3QevPxMxZsIbqP2+9oo5A==
X-Google-Smtp-Source: AK7set/qFPkxuRPBsm5LRIYo/fXXQH+HYhJ1WWGzq4ye+vGaMkMiAjRxJHriNfNVA7SPOIVSpgNCgg==
X-Received: by 2002:a05:6512:11e1:b0:4db:2cdf:4c12 with SMTP id p1-20020a05651211e100b004db2cdf4c12mr2620875lfs.43.1678965435065;
        Thu, 16 Mar 2023 04:17:15 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id u28-20020ac243dc000000b004db2978e330sm1194222lfl.258.2023.03.16.04.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 04:17:14 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 16 Mar 2023 12:17:00 +0100
Subject: [PATCH 5/5] arm64: dts: qcom: sm6350: Fix ZAP region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230315-topic-lagoon_gpu-v1-5-a74cbec4ecfc@linaro.org>
References: <20230315-topic-lagoon_gpu-v1-0-a74cbec4ecfc@linaro.org>
In-Reply-To: <20230315-topic-lagoon_gpu-v1-0-a74cbec4ecfc@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678965426; l=1198;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=U/Bw3E38fEF8jRRzaXOryssKT6fka2DSqTWTV4ocpSA=;
 b=FZq6+bZWyPDPG79SPJXQgWMUALXc7JoCk5eDIYdobDAZMVCQOw9q8wZUWV8Udto2y4Yyubxykc6P
 3HZ83basBb+Ua3BceNy+jApWcW2cEL/Tux1dLECNslyXJL3tGFGU
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Konrad Dybcio <konrad.dybcio@somainline.org>

The previous ZAP region definition was wrong. Fix it.
Note this is not a device-specific fixup, but a fixup to the generic
PIL load address.

Fixes: 5f82b9cda61e ("arm64: dts: qcom: Add SM6350 device tree")
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index e967d06b0ad4..3fe4a5fa3021 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -466,11 +466,6 @@ pil_ipa_gsi_mem: memory@8b710000 {
 			no-map;
 		};
 
-		pil_gpu_mem: memory@8b715400 {
-			reg = <0 0x8b715400 0 0x2000>;
-			no-map;
-		};
-
 		pil_modem_mem: memory@8b800000 {
 			reg = <0 0x8b800000 0 0xf800000>;
 			no-map;
@@ -491,6 +486,11 @@ removed_region: memory@c0000000 {
 			no-map;
 		};
 
+		pil_gpu_mem: memory@f0d00000 {
+			reg = <0 0xf0d00000 0 0x1000>;
+			no-map;
+		};
+
 		debug_region: memory@ffb00000 {
 			reg = <0 0xffb00000 0 0xc0000>;
 			no-map;

-- 
2.39.2

