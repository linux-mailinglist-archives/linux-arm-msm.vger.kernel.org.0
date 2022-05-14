Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1D08527398
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 21:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234805AbiENTBr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 15:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234804AbiENTBp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 15:01:45 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A29928717
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 12:01:43 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id a23so5735841ljd.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 12:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ypxafSXytWa1pPBeHJ41K2y3Cfr7QvnghKr6SvtMtAA=;
        b=P8vNmWGsgblpRkkMncBh+RVeTPV8ltEX0EKgVDA9IxtnvEyaRDKXQaNGOJmxo41s47
         IM/ctJRTABw9RCjd8AtM/6zTlbq3vv8WfbeTzq+GjY90bZMBXrM3uFmtA+8lmXy8bFtU
         lfZCj76W52hUjhAltEOVBVye9inNXQcdOEbMrxCUGQnhiczCId9AJHGIPxL/VZ3YWmrS
         5ZqXup1GEZqcN0hCRa7LSh06sQBK4LxD+sLtEgMrPDNE6cFSJFyf+w7D3mI4mMS8CfeX
         uW0akGslPzgl45ynxETjahCxhta/afZkTYZzPNU0GxERz2IIk4UPhg59ErWJc7hGGdNy
         OKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ypxafSXytWa1pPBeHJ41K2y3Cfr7QvnghKr6SvtMtAA=;
        b=KVmU75vt09S3QNKlloMSyj1L9/ez3tYDjnSBHZMyrxZe2L04XiKuvhbzsEgrjX+9OD
         pL8Ys46HLLGtHxjfsWOBatdV/BHNo+TYfWwED9Q0TkOpgR6HIQj4QxwNV6hcHPfp8Qs9
         84f8hPz+/nkA935TjOR5MNQVK3N6x8ZI1bjdOODq2WtHruHMBVNO2PoX4mtgXIFeAxdw
         hCUVA/3tLsQu3vaffAA7ik0r+P22deW+5L0uwLroLAh8EWxe39tjn6YlZfSZ3uST5Gtu
         QpWOQyeMklUQMVCXljYkH2kdgPlbgAJJdrfHe5w6p9wvh/pKShFlf5NTSVa/y5SUnIPF
         qLjw==
X-Gm-Message-State: AOAM531H2VZq4ReeV49cSuHMFtwfI73obqh8PMAhIpX4c588pQODbIdJ
        JzZpzhP92U2acHUNR9o1AxATZQ==
X-Google-Smtp-Source: ABdhPJxD2+eKgBxYjX8VA5oL4Gsc4Ckr3oHg6tgp6/thwfsCuXkAZCASCIyVW7OgyrAWiagpIeCSDw==
X-Received: by 2002:a2e:9ecb:0:b0:24b:4e2a:a555 with SMTP id h11-20020a2e9ecb000000b0024b4e2aa555mr6638709ljk.149.1652554901693;
        Sat, 14 May 2022 12:01:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([93.92.200.201])
        by smtp.gmail.com with ESMTPSA id y26-20020ac255ba000000b0047255d210f4sm787427lfg.35.2022.05.14.12.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 12:01:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v5 02/12] arm64: dts: qcom: sdm660: disable dsi1/dsi1_phy by default
Date:   Sat, 14 May 2022 22:01:28 +0300
Message-Id: <20220514190138.3179964-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220514190138.3179964-1-dmitry.baryshkov@linaro.org>
References: <20220514190138.3179964-1-dmitry.baryshkov@linaro.org>
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

Follow the typical practice and keep DSI1/DSI1 PHY disabled by default.
They should be enabled in the board DT files. No existing boards use
them at this moment.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index eccf6fde16b4..023b0ac4118c 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -192,6 +192,8 @@ dsi1: dsi@c996000 {
 		phys = <&dsi1_phy>;
 		phy-names = "dsi";
 
+		status = "disabled";
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -225,6 +227,7 @@ dsi1_phy: dsi-phy@c996400 {
 
 		clocks = <&mmcc MDSS_AHB_CLK>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
 		clock-names = "iface", "ref";
+		status = "disabled";
 	};
 };
 
-- 
2.35.1

