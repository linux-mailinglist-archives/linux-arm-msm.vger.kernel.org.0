Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 387D772BC74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 11:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234747AbjFLJaa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 05:30:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233776AbjFLJ3n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 05:29:43 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C057EE41
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 02:24:32 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f6195d2b3fso4808160e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 02:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686561871; x=1689153871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=su4Ml188NZQl7/ApV7N4YWW8KD5ToBDayqEyMhucvL0=;
        b=wTReWTESrXF8MQdnFv0BcbECvhA5k1jp/UpUNoz5an+amSVMTnDq4zSy8OhgF+QIHP
         VxqnfBT6c8Gc9esMda2ao0ri3AX9tE/Rej1L2iPODh3z23iryd54EdmTxXf8Akqd40iz
         UUREr/Vua1XefWoHpGHQw9UxoR0Aktnkb6PKHg6zaQXmUGDFO6+IDX5d1DXhwizay6wi
         Sd3rbsJxq7tmZEsN+gMmSOGdFdNh6xTDJfT5ymd+QoUGgf0D1fTFl1R9WITy+EMgUGVI
         c3WesnH2AJ3Dw4o2uhkFqpDxTeAZJc1xoHaxEpGONEJDz97NZzhNi6uUAzStEDQHePL+
         Mdaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686561871; x=1689153871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=su4Ml188NZQl7/ApV7N4YWW8KD5ToBDayqEyMhucvL0=;
        b=DunFcpn8y2JtaB6JKWSErJdXgYyDku3B0c/2opLxb7350C9sOPYogLHo4aPkveMFhi
         2XMkfukBRu2z54rpo6x6cVfWEAElTkMe6Ww1WctR96W72uaDknQHeHGwf5pqCZcfpYGG
         Hi7O9r47Hopdam2ebKm9g4ESJFAEnYVb4NMgbuzCEGQMsjh5Zt6z2WcaLz2e99G/x8wk
         IRfIRwgwlgdROL7sJxhYQvX5XdF3SQ9ZxMxIUmN0vkPqcmKwAwU5gJq3jfp/Fw3J2rHL
         tQQnqCaOwhHdZZLy9oKTQZz9o8k1ifaPNyG52SHKQJIbapcK0QEDLnN+FUycmy3M0Tpj
         edbg==
X-Gm-Message-State: AC+VfDwMLM0B17rbjofzyPiSH+KnX2Ur4elmuChQ0ANnphXVBI49JvUo
        Ncv1x3ggA+TkwdSL3Fey4p2eqQ==
X-Google-Smtp-Source: ACHHUZ6avE4dbfTuPulQJx5CHawnorQOK0WS0NUfFL8AJner9iIRg49w5a0WkmL8BvBwi9Ny+W3Ubg==
X-Received: by 2002:a19:6601:0:b0:4f6:5bf2:63bc with SMTP id a1-20020a196601000000b004f65bf263bcmr3203042lfc.3.1686561871076;
        Mon, 12 Jun 2023 02:24:31 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a222:bbe9:c688:33ae])
        by smtp.gmail.com with ESMTPSA id p14-20020a7bcc8e000000b003f727764b10sm10892044wma.4.2023.06.12.02.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:24:30 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>
Cc:     netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [PATCH 04/26] arm64: defconfig: enable the SerDes PHY for Qualcomm DWMAC
Date:   Mon, 12 Jun 2023 11:23:33 +0200
Message-Id: <20230612092355.87937-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612092355.87937-1-brgl@bgdev.pl>
References: <20230612092355.87937-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Enable the SGMII/SerDes PHY driver. This module is required to enable
ethernet on sa8775p platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 8d850be05835..f62c96fd4335 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1367,6 +1367,7 @@ CONFIG_PHY_QCOM_USB_HS=m
 CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
 CONFIG_PHY_QCOM_USB_HS_28NM=m
 CONFIG_PHY_QCOM_USB_SS=m
+CONFIG_PHY_QCOM_SGMII_ETH=m
 CONFIG_PHY_R8A779F0_ETHERNET_SERDES=y
 CONFIG_PHY_RCAR_GEN3_PCIE=y
 CONFIG_PHY_RCAR_GEN3_USB2=y
-- 
2.39.2

