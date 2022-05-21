Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF8752FF4F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 22:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234971AbiEUU1V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 16:27:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234929AbiEUU1T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 16:27:19 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD8905A2E3
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 13:27:17 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id i23so13041876ljb.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 13:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z4aeLiu0x2d9QbBfW/Nm8Qz8r+XCUbHP42c+rJ88Kls=;
        b=ttUVAbHFbgBaooqpdIDiBriFMt+TWdNrj1x62dYVodkf/0Swk4ylezncWTVgKmhwS3
         mmaN/dQRKmtX2eTLZRm8z54AdYf06ThV4J1yv644uLR1gcfOImZqTuw8opaYqGctJYWm
         /swHFKa99ZLH2hacIWMpC/k0ESZM/4TPtYPQMZjID32jda6Ymi7e7iRrgfj9sfZVzr4e
         9Vyh7/BK3BwBjv5Thi6osGPPSWZFyzxZBDAVvxFAwUYy53PoxIssVbVU7QOP9Nl1rrBq
         lmCdhJ/9Flr37e0yvLavnpIdrtC4dBjgynEmP3P8i/bOB+jTUMREmAFj0FiEtjrFUuFK
         qlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z4aeLiu0x2d9QbBfW/Nm8Qz8r+XCUbHP42c+rJ88Kls=;
        b=JVn50BI4O9oCuV0nPvRY8gvyLkr1N/rh//8LUiKcu2geIveqK/BplqmZmPe70XhX3j
         U+rOBnLDeRiX0GjZCtY7ItE8DArOrlGmZIL38+K++eExZ1fzqGw9Kv9yUGkaXMDDhkQZ
         XE28Ijm00rhaZXKcaqVEn7DmWJnieAE2/s+rkedkFB2/rXXr5KTvJpkHKv4b578Z1O7U
         7cyV71hFw0qqJCTDq0tfHBGIuJyVNbyt2OgG7kHkIs5W51EnNVwDBqFrdg1r/7WbBJ9n
         ZDdk5zGsZ2u35BEaOl/0mOwdz5yHFagMHJc8rUNmauDXwW3n6J6/YhIzBLXBC5vQk8ZW
         CvMQ==
X-Gm-Message-State: AOAM531sd5NFnDjaSvMam0I/n0wd5tUNliVrK3Ft6kD9UOxk74pYZWat
        7llv7HVgmYWUiv8XW3KCqfZp3A==
X-Google-Smtp-Source: ABdhPJy9d1KPHuk8IypCJ8TZa2ghyRYn+5CYnBoKSJKMCfkNvMSa+bIDFGWHHH7qN2RSSrlZPOYb/w==
X-Received: by 2002:a2e:9094:0:b0:253:c354:9c93 with SMTP id l20-20020a2e9094000000b00253c3549c93mr8874077ljg.226.1653164836019;
        Sat, 21 May 2022 13:27:16 -0700 (PDT)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id x1-20020ac259c1000000b004786291114fsm317773lfn.140.2022.05.21.13.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 13:27:15 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v7 04/11] arm64: dts: qcom: sdm630: fix the qusb2phy ref clock
Date:   Sat, 21 May 2022 23:27:01 +0300
Message-Id: <20220521202708.1509308-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220521202708.1509308-1-dmitry.baryshkov@linaro.org>
References: <20220521202708.1509308-1-dmitry.baryshkov@linaro.org>
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

According to the downstram DT file, the qusb2phy ref clock should be
GCC_RX0_USB2_CLKREF_CLK, not GCC_RX1_USB2_CLKREF_CLK.

Fixes: c65a4ed2ea8b ("arm64: dts: qcom: sdm630: Add USB configuration")
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index ac4e688a717a..0ffd8e382d8c 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1266,7 +1266,7 @@ qusb2phy: phy@c012000 {
 			#phy-cells = <0>;
 
 			clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
-				<&gcc GCC_RX1_USB2_CLKREF_CLK>;
+				 <&gcc GCC_RX0_USB2_CLKREF_CLK>;
 			clock-names = "cfg_ahb", "ref";
 
 			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
-- 
2.35.1

