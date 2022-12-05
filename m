Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 504626438E0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 00:02:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233933AbiLEXCN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 18:02:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233946AbiLEXBg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 18:01:36 -0500
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C6D81EAC1;
        Mon,  5 Dec 2022 15:01:35 -0800 (PST)
Received: by mail-il1-x135.google.com with SMTP id g7so5804629ile.0;
        Mon, 05 Dec 2022 15:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47KrEjLNXNciXvVDsYUjuFz86syQOtCTJGhPHkeep7I=;
        b=Bf0Gk8z/nhI+SUv2Tj/ols7Rz51Mx4b7sz33uuf47XDCdzr3NdBohjuRofGwtW9dDr
         QMIAqteFgbr/adWNoy0Sbje5yT+wFVjVwQjuaopnLF5xusKqXTztu530FuRGwA7yiXns
         DDjsCyUJvLP1WjA08ETa+ivbzMR6gjjpJbLz4k8vjE2+SS/6PriU9yssmeciieONeEfZ
         z30RSv4/36VqbqAC6ZRsjnHlBqutI0pKPZiNE/ULz97kPCMWXrOjxWrjRopAMraOGqrM
         BisoYE1oMnbhVzf/YIHR7ro/IdYnVJa+ggw6LArWBLsGq+c+4XY6JLQPzsVdgew8/06x
         T1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47KrEjLNXNciXvVDsYUjuFz86syQOtCTJGhPHkeep7I=;
        b=4HKUU5IPVihoc3oj+Wq/0tlcNV2uju6g1RZJKjERgnoOHs4sb7rg5Z0bx5s2sgMql2
         9dWkh/1q2MT6tIcW30OU0Sll78LDW9L6tVdNYd2hdhluLzmcSmeBUXKaGK2+VF5YOf9s
         jLUcRFzu9J/FAvVnv2Eiw1fMwz9fHoSCOdLRi3BdmrRtOcvyAYpO7Lbo2l03GFv4Ticx
         XTm5KT6tGqULXCGJqFFB4nFXaAmYq0lPyLUNDWmZMduJMxMvBXkF2XbPQgqsEK6Uuoj4
         QD3GevXrYrKOvZTyHVRG4jdqQL9gpGHfdof28O7R2lnnKYjcpPnc82Wuwjmlc40Hvsgt
         i29A==
X-Gm-Message-State: ANoB5pmpe0uBe0j9VKUEY2C4b62s51zSPJP9lMwh1GDpdpEGcuwUVgJW
        4OUiZcl49TqridnxAiR03B8JXSSfidQ=
X-Google-Smtp-Source: AA0mqf5MgLCGLhQJqflcvrRLFWZgt1lddExHovgY9Tdp9ROtVCWBiy3GIi9fFhQc1/St1zjAR5A9vA==
X-Received: by 2002:a92:6b03:0:b0:302:55d5:8808 with SMTP id g3-20020a926b03000000b0030255d58808mr29198642ilc.152.1670281294461;
        Mon, 05 Dec 2022 15:01:34 -0800 (PST)
Received: from localhost ([2607:fea8:a2df:3d00::be63])
        by smtp.gmail.com with ESMTPSA id y9-20020a92c749000000b00300e7a459aasm5632707ilp.38.2022.12.05.15.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 15:01:34 -0800 (PST)
From:   Richard Acayan <mailingradian@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 3/3] arm64: dts: qcom: sdm670: add missing usb hstx nvmem cell
Date:   Mon,  5 Dec 2022 18:01:16 -0500
Message-Id: <20221205230116.2204-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221205230116.2204-1-mailingradian@gmail.com>
References: <20221205230116.2204-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This nvmem cell is present on SDM670 as well as SDM845. Add it in SDM670
so there is proper tuning.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 933ad2fabf3a..2a44cccc47ee 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -736,6 +736,11 @@ qfprom: qfprom@780000 {
 			reg = <0 0x780000 0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			qusb2p_hstx_trim: hstx-trim-primary@1eb {
+				reg = <0x1eb 0x1>;
+				bits = <1 4>;
+			};
 		};
 
 		sdhc_1: mmc@7c4000 {
@@ -1418,6 +1423,8 @@ usb_1_hsphy: phy@88e2000 {
 
 			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
 
+			nvmem-cells = <&qusb2p_hstx_trim>;
+
 			status = "disabled";
 		};
 
-- 
2.38.1

