Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DAA4694578
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 13:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbjBMMLy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 07:11:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbjBMMLS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 07:11:18 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 028C21A49F
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 04:10:44 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id hx15so31237059ejc.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 04:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JwitY1QgTn2wW32f2EWY7DiZlNcao6/ffQYXSOSkgM=;
        b=hGvnAsUOiAo8e5XcrV48vO8k565QbdVnV75roqlQVSvdFxJxTvTQOQLz7BHO+B50vI
         RHkrT0HDr85tVr/1L45VwNonktRigwIYL59ygol+VfkoyhnTD3w+yeCZvhD1uJ2e9f8w
         tysowusaNeRWUdr8mApnOVAULocSOn8iC4/f6Cuam+6iF2e+PzlmhVKBbKgL5UpxGKPT
         MTS0nHr2WnEN0UYLdk/Z3GYU+gngVviUfGLxq07nCwYVeQvoX4Ud5rZMOHzNxXb6aNkF
         nfUgNsL/YYHBQL8oRZCWZmPJrliqhgNkZkXvhlouoPRdaNiVvE2Y3so3NEUGqcA/5cBR
         LrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7JwitY1QgTn2wW32f2EWY7DiZlNcao6/ffQYXSOSkgM=;
        b=eGoOvwr+3NoZltxbdKSfxLXrgycTtYhLIXBv9M1gczbrEhttMVEXOw3vEpBxEC3y+M
         fXr1LX1yPVFNBUddp21ZlWC4dYufn9OrDOhkLFKn1xB7A+vrwmJUXKz5G/CCf2qIms76
         6hsRnO03YTZ4zRSGn58am+bfYlJJdihhvKbN8hK6Tco966655dOUsx0YGMfO6+kE5NVr
         tlWvHHez+VrJ/TqS71y5WqifkhFxAEgNdivqlV0/PlFsut9b05AUxoCw08JBoVSg2h+i
         VUmjy5KaklKvXCJ2ovDYD4UMX3JJ2YSk7nyFVKyPnsxVwoHP68aj0jhDJuThv8L4Z7nq
         WwDA==
X-Gm-Message-State: AO0yUKXm8oBg7ALEO2G3y8Tuuzp1GyMEy1Q/pAOOMAMQ3zQjNwUyOA9P
        XQoAfMbKtFT8eK+uGhQCAfvyosQv1YmDVamH
X-Google-Smtp-Source: AK7set+6SrDx4uI0vo7NNZ4t0XgIX4cAV1njud9Qx+eGFNMTsJqmUI6+eio5NQ41tcqkR3g//ppAiQ==
X-Received: by 2002:a17:907:9a0d:b0:8af:3fcc:2b05 with SMTP id kr13-20020a1709079a0d00b008af3fcc2b05mr14287763ejc.12.1676290240723;
        Mon, 13 Feb 2023 04:10:40 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id dt19-20020a170906b79300b0088ed7de4821sm6651586ejb.158.2023.02.13.04.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 04:10:40 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 9/9] arm64: dts: qcom: sm6115: Use the correct DSI compatible
Date:   Mon, 13 Feb 2023 13:10:12 +0100
Message-Id: <20230213121012.1768296-10-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
References: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
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

Use the non-deprecated, SoC-specific DSI compatible.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index bff067ed2e94..15811be82acc 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1447,7 +1447,7 @@ opp-384000000 {
 			};
 
 			mdss_dsi0: dsi@5e94000 {
-				compatible = "qcom,dsi-ctrl-6g-qcm2290";
+				compatible = "qcom,sm6115-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0x0 0x05e94000 0x0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.39.1

