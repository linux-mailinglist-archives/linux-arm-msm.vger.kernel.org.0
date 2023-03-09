Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 401E26B2933
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 16:57:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231469AbjCIP5l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 10:57:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230376AbjCIP5k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 10:57:40 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65A5BF2F98
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 07:57:39 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id u9so8972362edd.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 07:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678377458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bjlUx5x6vS+To2IpstTUtxk2XeY09dWXfk09le6pMHk=;
        b=Zd+MhC8mamSaa6SVfrfnVh48O4MJ9SbI4b/ZRMopl+ylMcl5StZKyQ2XFvGE5cA7Wx
         riDDV2T7BdXLNNpwXRzdutLcq+b+GzaRt37cfpt4+oZCmSVfX5R1QYV2LKSXBbs0MSxm
         mNfLVIgEVUl/3cageFFkTx7ojYX/NGwSorNrAlSlrjlxlstd4v99qTerOEW7NThHtN1T
         +C99SUiSb9dLCShSmVxr/Dw/La8+bsrYeqf8NWxkxFG42TdpqITzdziYNR7izrlAYrvR
         mNSnebp6q5D0alPpMPFhGmbgOBHIB/Pov9M3LQ9UPW2DCrZQFd8uRrWVIy8lqIvtkZ3Z
         vDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678377458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bjlUx5x6vS+To2IpstTUtxk2XeY09dWXfk09le6pMHk=;
        b=VlUiUlkQb6T+caULzzjtrfAcWXu5h4U46H9H+Izi2vAhvwPQS2hWuwfMu+r2eXc1dM
         HUcFNp9iM9RsgpWSD6yY7L2YewPby7P8sVSmZgXWMhbutMGa+Bu3V5AvrUB1yeDrdVoq
         V1+U+jJ9257O3jxCurIhQ+Aci4s/MZmQvX5BwXrqDtPgcWleI3t8xU4djCF8Ab5L01ID
         Wn+umHWdr9r/3GF+6OeIeGv30yHMtw6FHIWZCPlYrA/MNU1yXU/7bJwzdVUR12INcMXO
         yZuElg+fzEuSWV0lgsx/RqTy2MmY2xrhZdQTG54i++WgpRx6S7Oq1Ov2uLKZEcZ3S0ZK
         iMIg==
X-Gm-Message-State: AO0yUKVylMSkiCClibvJmOMSi1d9z77zJ0YUeZrQkPeAS30wXV5E9p6n
        pElgfrAuhOptOMrqWCP0wQySSg==
X-Google-Smtp-Source: AK7set8qC0MHvLl0r0hr97XkcCTqiptS8ovYpUAWINTlJNKt8q+nFa/LHV/CoCGiISVVSWgN1J/wxQ==
X-Received: by 2002:a17:906:edb1:b0:8f7:68ca:c004 with SMTP id sa17-20020a170906edb100b008f768cac004mr20474901ejb.64.1678377457946;
        Thu, 09 Mar 2023 07:57:37 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id v16-20020a50a450000000b004af6c5f1805sm9867871edb.52.2023.03.09.07.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:57:37 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: defconfig: enable Qualcomm pin controller drivers
Date:   Thu,  9 Mar 2023 16:57:33 +0100
Message-Id: <20230309155733.662043-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Enable pin controller drivers for several Qualcomm SoCs, as they are
necessary for basic system functionality:
 - main Top Level Mode Multiplexer as built-in for QDU1000, SDM660,
   SDM670, SM6125, SM6350 and SM6375.
 - Low Power Audio (LPASS) TLMM as module for SC7280, SC8280XP, SM8450
   and SM8550.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/configs/defconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7790ee42c68a..1d22f1685628 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -556,19 +556,29 @@ CONFIG_PINCTRL_QCM2290=y
 CONFIG_PINCTRL_QCS404=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
+CONFIG_PINCTRL_QDU1000=y
 CONFIG_PINCTRL_SA8775P=y
 CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SC7280=y
+CONFIG_PINCTRL_SC7280_LPASS_LPI=m
 CONFIG_PINCTRL_SC8180X=y
 CONFIG_PINCTRL_SC8280XP=y
+CONFIG_PINCTRL_SDM660=y
+CONFIG_PINCTRL_SDM670=y
 CONFIG_PINCTRL_SDM845=y
 CONFIG_PINCTRL_SM6115=y
+CONFIG_PINCTRL_SM6125=y
+CONFIG_PINCTRL_SM6350=y
+CONFIG_PINCTRL_SM6375=y
 CONFIG_PINCTRL_SM8150=y
 CONFIG_PINCTRL_SM8250=y
 CONFIG_PINCTRL_SM8250_LPASS_LPI=m
 CONFIG_PINCTRL_SM8350=y
 CONFIG_PINCTRL_SM8450=y
+CONFIG_PINCTRL_SM8450_LPASS_LPI=m
+CONFIG_PINCTRL_SC8280XP_LPASS_LPI=m
 CONFIG_PINCTRL_SM8550=y
+CONFIG_PINCTRL_SM8550_LPASS_LPI=m
 CONFIG_PINCTRL_LPASS_LPI=m
 CONFIG_GPIO_ALTERA=m
 CONFIG_GPIO_DAVINCI=y
-- 
2.34.1

