Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA3064B9760
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 04:59:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233369AbiBQEAL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 23:00:11 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233259AbiBQEAK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 23:00:10 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5B442A22AA
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 19:59:57 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id s8so2139955oij.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 19:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rfLKwg8PamWIA2bebhajKCGVnkyH3vwg/Pv0q1HOFLM=;
        b=ZMf4BV0KP8L+USvDar3m93blThnsXgzjl8wOq4680xUB24ABwgQaBmU4PytLXVGz7Y
         3sV7rCVzciwLtGaB1/OxEWtkLvmqG5TyuQy43mftooraQ8R+srDid53so0Sb8mxlxnyW
         sejMpXW7i0hH837AVHKVQuFFvZZK/0F57EFGBngrEIx9swcmS9O3DE6JZZn2+ehp8kOk
         Ts8JCwgtGNsUwLPNEphn+kbeq9QXUrp9RAOgVXVKAs6haZ0Pk52HAEzp/YnM1kvlTKrH
         JRussk2R8/kYh0+JRoqJqWidY7h3aiUHeIeQZCR2AePTZpoFjgE+YgldPPAkmwMeIj5b
         QVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rfLKwg8PamWIA2bebhajKCGVnkyH3vwg/Pv0q1HOFLM=;
        b=dBH7ZBx8FkcqFGWTC7dfG8/6Y2EYo6pvGM11nqBKTNS9Iqvk30lFJXYrBZSjI9GbmM
         40u+7esW+h+emHj3/nRPnnuQKQBM/MzMZg8ucBQ/Hu9s0C4gkpI1ir8PEXpvLPiVuPew
         h/eRDcIgZWr+mKP7VYdQk0hGR3bZCsy9COwZ6qvFOiH7gH8nvDgDKpYeEk/pxkHhLWzf
         uthAC2DEQWYimwYGlT2fa9g1ofUxSrH9ZLE2LmJk3XvpMYgtXjGemqF8lNyHv/ktEixz
         B45yC9Nu5D+lfzbXDgOqkvogpbywDfJ96lX2tLqjArQWXJC1TK/adMILXO3M2lyhqcqM
         0Z3g==
X-Gm-Message-State: AOAM532rxbuvG5ZNIkQTBsobqFr5kWhYiLzO+5yTaU6jg56tO3EnoD4E
        VHf05Sr2/aVJ+YGdVOEltwtFLdBXOhNtjQ==
X-Google-Smtp-Source: ABdhPJxpHan0B6xTsycJb0UXwXvViChOYC7Ygu91HAfuFedbR/EixKvpcMZiXae3ojllLrV7d3lu8A==
X-Received: by 2002:a05:6808:d51:b0:2d2:fb3b:9f4f with SMTP id w17-20020a0568080d5100b002d2fb3b9f4fmr1966591oik.175.1645070396993;
        Wed, 16 Feb 2022 19:59:56 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id h27sm15799031ote.57.2022.02.16.19.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 19:59:56 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: defconfig: Enable Qualcomm PCIe Gen2 PHY
Date:   Wed, 16 Feb 2022 20:02:05 -0800
Message-Id: <20220217040205.1898644-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
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

The Qualcomm QCS404 platform uses the PCIe Gen2 PHY, enable the driver
for this to ensure that PCIe is functional.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 30a0853b6230..90578f76f176 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1160,6 +1160,7 @@ CONFIG_PHY_HISTB_COMBPHY=y
 CONFIG_PHY_HISI_INNO_USB2=y
 CONFIG_PHY_MVEBU_CP110_COMPHY=y
 CONFIG_PHY_MTK_TPHY=y
+CONFIG_PHY_QCOM_PCIE2=m
 CONFIG_PHY_QCOM_QMP=m
 CONFIG_PHY_QCOM_QUSB2=m
 CONFIG_PHY_QCOM_USB_HS=y
-- 
2.33.1

