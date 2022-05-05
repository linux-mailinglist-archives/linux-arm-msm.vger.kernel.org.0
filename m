Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6849D51C2FE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 16:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380815AbiEEOyt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 10:54:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380821AbiEEOyq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 10:54:46 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A19DB57114
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 07:51:06 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id bu29so7939921lfb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 07:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lRc9IGABGvftqpS+3iYeCYsbh0JkHVTocwAQoePYuiw=;
        b=tyod/wGLJMWySv6x8UupJ5Hzh1UWSkGnWELKzgPJknAucEsCaPhwal6tylpUB0oBK4
         91CaxrFjdPPV+R63yizDYJvMeKBpiUl4QzAKmaqGFA3PWDP2ZceFqeVddKzliPe/TsR2
         I5jcudRiN0FYMZ/f3rgnDafhfcoiiVJZgHR/99qKE6JLpm0Vq9gWQeU9qW6WUibUuFwA
         AoWjzqX28XdR5dl1Vdrk1RlUr12Lz113tI7uvbfkwQAjiROfPHC+bEcn6r3T9ObsFHQ5
         kArd8B0zuiYErWzIukBrL7jKXjas3urz+YLdI47s2KMVvjT/g13CzpdqhVSrKBIbG9hY
         QCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lRc9IGABGvftqpS+3iYeCYsbh0JkHVTocwAQoePYuiw=;
        b=0jJV85+yLL0AusrWKzNcxNowcGa3ePdABfxBl6nJIQFAfb+/OD0jCFi+ks7CrVWqrk
         ZN60g4XNqlHvxc4w7UM8qlKhl3gAZW3k3CfIkp/Qdov80nsJorHcGo7GsosDdw98QHmh
         S7yevVv5cMDDj/VpHfvQbEV8Cn7HPuqpU1jbGDoFIAWPeSuAukFjwOg+XkFB97u2ikip
         abuSBLQEG/baSvjgV8njflr3w0AigvP2jUCYAiKuzoXodbUYrQ6PHcrZs1xCyCoA4Cjm
         ua8Z05eRuvjB4QOPfNguVVan1YTbBPm2zgek89P4CtqZATKTuYxvxYhASE29JrNbwrjO
         M/8Q==
X-Gm-Message-State: AOAM5318BrPT7c0IGnf+GUHns9ZsuoU2FK1VkHLTG5A7MsNrNjPq+gDU
        6EWvxOZdxwKR3aM+5JMXEEwDPQ==
X-Google-Smtp-Source: ABdhPJya+kuNJ/w50Fr2WbSf1FGZK6p2BT0HlKQqodJ64EmHAj4l+WvoiMBGhCFZvjKmrU3/A5W5Bg==
X-Received: by 2002:a05:6512:32ca:b0:473:cb3d:6ca2 with SMTP id f10-20020a05651232ca00b00473cb3d6ca2mr3945418lfg.261.1651762264912;
        Thu, 05 May 2022 07:51:04 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h5-20020a05651c114500b0024f3d1dae8bsm227238ljo.19.2022.05.05.07.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 07:51:04 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: pm8150l: add Light Pulse Generator device node
Date:   Thu,  5 May 2022 17:51:01 +0300
Message-Id: <20220505145102.1432670-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505145102.1432670-1-dmitry.baryshkov@linaro.org>
References: <20220505145102.1432670-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device node defining LPG/PWM block on PM8150L PMIC chip.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8150l.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8150l.dtsi b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
index 52f094a2b713..2b598c45ee7e 100644
--- a/arch/arm64/boot/dts/qcom/pm8150l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
@@ -114,5 +114,16 @@ pmic@5 {
 		reg = <0x5 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+
+		pm8150l_lpg: lpg {
+			compatible = "qcom,pm8150l-lpg";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#pwm-cells = <2>;
+
+			status = "disabled";
+		};
+
 	};
 };
-- 
2.35.1

