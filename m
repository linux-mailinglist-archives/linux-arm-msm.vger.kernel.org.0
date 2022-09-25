Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA785E92AF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Sep 2022 13:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232021AbiIYLVb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Sep 2022 07:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231893AbiIYLV3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Sep 2022 07:21:29 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5AFF2E688
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Sep 2022 04:21:28 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id j16so6836368lfg.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Sep 2022 04:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=rUZfqbO7efGjHVd0Lx2uboZ3GbifHtRwoPmKODDcpMs=;
        b=YwN8OmypiVALfJRmj6vXPiaxCPoJqO5x/xOQqW8mBvKoiuCYhTjMMmehq06iahPL0C
         tHAb531tODnhQWgygRkdMT5o2pbg4B/70KV4Pr6iCCcGs+b8KNa4hJ8FtWf3Bey7L0c/
         iKc4hXGR7uxSKjUCIanqjj5T2IptL7h68bvUjX1mVi/mw9uWfhowOQu6gCTY8CuNEJfl
         RRJTIlCCcm2VWWP+LWX5Ti+BB8n0u8LpJMw3WtEiBfjUgHBHEVafejxtAy1CHcsoiCXr
         Z/uBbfSS54o0lFDEtPPCnnN93MPCMHsznHHsMB95+TIYfhSXum1Sq5UcJILK45+sg2E5
         i/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=rUZfqbO7efGjHVd0Lx2uboZ3GbifHtRwoPmKODDcpMs=;
        b=P4cpSpY1JWATAjZAZb6jtpvpTATMg9tZQQBxVP3lZnn0x3lid7FZ8Th6Xr0/5+YSo/
         WAcWoh5aY6jLbvuquD8sWHe8G1pY5gnPiR6tV93LUhpp0PVy8tdsJxIFPvR010t4/6Xi
         V4gz1PwzQ+7YrfxGbp3FmfknJmeFICQbSV2emGyjNw2pognBiAtjO2KHSWoEuQQUvTJl
         9T0UwHOY4O/U7YuAYz3b6C4QwsWnmDnHIP/7CPcg+QetHeAkJmizVYVSpLra8hma3f3u
         0kps1UoSbxIdW1NdmOYjdiEpKJuVD8N9G1DKjBJi4KtMig8D0R8we2MSYoiTJ+tB+kcj
         dOlg==
X-Gm-Message-State: ACrzQf2Ncmpk4/mMikaI67tzpFULYcqbUqf/zZW9d7GnF0xXLy2IlQrv
        K+GInxqG0rfclLFWaAP4farJjw==
X-Google-Smtp-Source: AMsMyM5zClLlAE7McyGBYi/AEkOO36jJMcxPqM6/LHC6PX6t9D697ff9Z4ZuAYmS4zKytqBWz9swZw==
X-Received: by 2002:a05:6512:1047:b0:49d:a875:8d90 with SMTP id c7-20020a056512104700b0049da8758d90mr7087827lfb.630.1664104887191;
        Sun, 25 Sep 2022 04:21:27 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c16-20020ac25f70000000b004946748ad4dsm2178053lfc.159.2022.09.25.04.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 04:21:26 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] ARM: qcom_defconfig: enable rest of ARMv7 SoCs pinctrl drivers
Date:   Sun, 25 Sep 2022 13:21:22 +0200
Message-Id: <20220925112123.148897-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable rest of ARMv7 SoCs pin controller drivers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Do not enable MSM8976 (Stephan)
---
 arch/arm/configs/qcom_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 7d8b6884fd00..b41716c1ec64 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -131,14 +131,19 @@ CONFIG_PINCTRL_APQ8064=y
 CONFIG_PINCTRL_APQ8084=y
 CONFIG_PINCTRL_IPQ4019=y
 CONFIG_PINCTRL_IPQ8064=y
+CONFIG_PINCTRL_MSM8226=y
 CONFIG_PINCTRL_MSM8660=y
 CONFIG_PINCTRL_MSM8960=y
+CONFIG_PINCTRL_MDM9607=y
 CONFIG_PINCTRL_MDM9615=y
 CONFIG_PINCTRL_MSM8X74=y
+CONFIG_PINCTRL_MSM8909=y
+CONFIG_PINCTRL_MSM8916=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_QCOM_SSBI_PMIC=y
 CONFIG_GPIOLIB=y
 CONFIG_PINCTRL_SDX55=y
+CONFIG_PINCTRL_SDX65=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_POWER_RESET=y
 CONFIG_POWER_RESET_MSM=y
-- 
2.34.1

