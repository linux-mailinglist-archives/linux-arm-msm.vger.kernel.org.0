Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EA846C9671
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Mar 2023 17:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232624AbjCZP6W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Mar 2023 11:58:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232555AbjCZP6J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Mar 2023 11:58:09 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E1D92D59
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Mar 2023 08:58:05 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id b20so26302431edd.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Mar 2023 08:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679846285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eEUV/ec94Wotg9Hhb2xBcb28brvFttAYM3Vi7/wLTwA=;
        b=u5erdxyihBEEejbU+Cn6QS2Am+QsJaBezqxTurKyqnVq44AwlVjP3WrWAOs1uUXAOB
         u9JvnCsIzM+4Solp1zuYgE0Uvx8J4WXB2+V4rAsE44IB8mhOJ5seLKe42AEzLtiU0QrD
         hjo1UlTmcTRJ8xKSNVMbR6Mqs6FjxEbv1QJNT74G5+gTHT9HtmY6LGcKK2PpkIfmNfWM
         DF0zn5OImCtrY8dz9fHxudfqdRXH5URqe4+DoSY0rkBTjpXViEE4jUvtvi7qA4WZBgsC
         vQ4im+uD6BsoAst66Ri5bN4ij9nUud4nH9XKjggH0wZjrSsdlpuxrvqwThs+CQa/30ms
         LgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679846285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eEUV/ec94Wotg9Hhb2xBcb28brvFttAYM3Vi7/wLTwA=;
        b=SSKm5JO2pbaUdsNml4imozd3cuv6N4OdCcK+4SyiYwY3k5NOS0bv7I766zg7DWjouL
         Oop7Uv4yDNt+CLE6OPxfsQo5yH00GRMYqLxta1PBGSYp31RXA/rXH1ipeAT62kHVpSS6
         qj2PCoWeGJomdyLKZrXAmS57oS/GkjzuHecxHtM8wD4OrLtm8DM+CMqGjA4sUxb4tVE5
         KDj6G4UtSTUcYcXgL7q6JKgCaHVmMGMVcG+bIpIp0Au0LH7tAatDsa7jrazeqBgYrpFI
         op6ueimYMfxXcbTITEZ3PfRFsCIKWTH+GyjlENaPjQqRlSmkBOAuczX6hS0NYbBK93rQ
         R/dg==
X-Gm-Message-State: AAQBX9fhV88Wv4ZIYbUK3to/NfcQWbAByHhT2f+H5jg5edhyitbICgl8
        qlbkDi3wJzzXAMhjYKf/avag5A==
X-Google-Smtp-Source: AKy350YvV0YzCsC/BZdf9c+5607UZjRRJlkBETWBxvmg+0vXgs9BFj/NkimmAxIszPLgMtTCtjSwNQ==
X-Received: by 2002:aa7:d314:0:b0:502:62:7c with SMTP id p20-20020aa7d314000000b005020062007cmr8639495edq.24.1679846284961;
        Sun, 26 Mar 2023 08:58:04 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:eca3:3b8f:823b:2669])
        by smtp.gmail.com with ESMTPSA id q3-20020a50cc83000000b004fc86fcc4b3sm13705502edi.80.2023.03.26.08.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 08:58:04 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 09/11] arm64: dts: qcom: sdm845-oneplus: drop invalid panel properties
Date:   Sun, 26 Mar 2023 17:57:51 +0200
Message-Id: <20230326155753.92007-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230326155753.92007-1-krzysztof.kozlowski@linaro.org>
References: <20230326155753.92007-1-krzysztof.kozlowski@linaro.org>
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

Panel does not have children with unit-addresses thus address/size-cells
are not valid:

  panel@0: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index b01542d79ae2..0c268c560d37 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -347,8 +347,6 @@ &dsi0 {
 	display_panel: panel@0 {
 		status = "disabled";
 
-		#address-cells = <1>;
-		#size-cells = <0>;
 		reg = <0>;
 
 		vddio-supply = <&vreg_l14a_1p88>;
-- 
2.34.1

