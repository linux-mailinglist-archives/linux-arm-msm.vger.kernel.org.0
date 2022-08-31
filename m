Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 349FC5A7FA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Aug 2022 16:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231651AbiHaOMZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Aug 2022 10:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231583AbiHaOMY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Aug 2022 10:12:24 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE25FD5E9F
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 07:12:23 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id y10so11625683ljq.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 07:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=gzK10rJm3kDakU95ZOzVvw37oOA+zuu1InnZT0+0zc8=;
        b=anQU10e8+GPGyhXsYmOKXNVsuNiBAq3vGn1CRMFCzYLiizIl40pIiNmHHoYfrI5ilg
         DOaYNSzwJFoK5Gx3jOl6YVRafg3lVDuOH7Rbf5kZE9KegehB7Kvr3ldUZy3pGSA/kIRq
         qCQIyxz7PVY/FIobzmokwfaK/HUO/IhDpZr+x1yacobSB73dOcFFSoZo9FRzmEw37b0B
         zimmgXZ4urYhkmRMBxPtoJNjt9zebub8jFiCGy3SyDqd5q2L4HRfmR8iDU9YuedLiak4
         +V7qo2bRf/hdYpawdUUSKDttDRBOIZUZp1LxJ6nqKJGY3w6f/rYeRQ0TM5y47/yNaoP2
         eWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=gzK10rJm3kDakU95ZOzVvw37oOA+zuu1InnZT0+0zc8=;
        b=sCkTEoSckkSo8KrsPZf0T6t/zOREvdMFxOc0vdy8Dd9xcA24lSYNTHBWG8eCEXiv5D
         RfyOauVTf89lLCeVAjpx6wE3pMoKuNdr57LVc2/SRYMmT/F9qRjOQQrDVXuC1P6iOP2P
         vnz+k64tmSbA6WFzTbirUrpMWx38tjgJtxNLxoqDwjm10DzeUBMj7Jeuzk0/21j6e4Xn
         ijYwQNPyei5Pjxl99cPXpz81sK1h6XDbY4Gd7v/HRXpLgtPoif8AYhUjQMPJXh09TJLT
         yv+GAUg4yhltHsyimGNW/jyDYWoYOWpvCoLL0XshPmzOMW0CV3PNyu6FPHxqZgKtU3eb
         D6WQ==
X-Gm-Message-State: ACgBeo2q+2snVhIRvJ955y5tIcO3UKj19bDwE0aXIzXZ5F7dxbaCfZP+
        nPXLZbKTOwQjqvlWRlrMA1oNvw==
X-Google-Smtp-Source: AA6agR6Kxd376mZM7+9hyHIlzFnsCVzTl9sipNPdfLu+aWFjls/ZvCjq2m3yABlLucRA6u5J71yppg==
X-Received: by 2002:a05:651c:901:b0:261:ca36:951a with SMTP id e1-20020a05651c090100b00261ca36951amr9030862ljq.36.1661955142051;
        Wed, 31 Aug 2022 07:12:22 -0700 (PDT)
Received: from krzk-bin.. (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id h5-20020ac24d25000000b00494603953b6sm1523745lfk.6.2022.08.31.07.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 07:12:21 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, arm@kernel.org,
        soc@kernel.org, Olof Johansson <olof@lixom.net>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH] arm64: defconfig: enable newer Qualcomm SoC sound drivers
Date:   Wed, 31 Aug 2022 17:12:18 +0300
Message-Id: <20220831141218.516100-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Enable sound support (machine drivers) for Qualcomm SC7180 and SC7280
SoCs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Resending because I missed ARM SoC maintainers and Bjorn.

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 265454620682..644d084c6888 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -792,6 +792,8 @@ CONFIG_SND_SOC_APQ8016_SBC=m
 CONFIG_SND_SOC_MSM8996=m
 CONFIG_SND_SOC_SDM845=m
 CONFIG_SND_SOC_SM8250=m
+CONFIG_SND_SOC_SC7180=m
+CONFIG_SND_SOC_SC7280=m
 CONFIG_SND_SOC_ROCKCHIP=m
 CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
 CONFIG_SND_SOC_ROCKCHIP_RT5645=m
-- 
2.34.1

