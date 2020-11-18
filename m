Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB7B52B81D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Nov 2020 17:27:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbgKRQZ0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Nov 2020 11:25:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727869AbgKRQZZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Nov 2020 11:25:25 -0500
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 776B6C061A48
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2020 08:25:23 -0800 (PST)
Received: by mail-oo1-xc35.google.com with SMTP id 123so562877ooi.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2020 08:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kQp2cNfKa5X28/YG3R1vCmhJk3CF5jkW5A40DKbTPKE=;
        b=VARu1I+MeMwU8wJ0YZKIaKBEtAUUidbUqA1e1BkoqyElSGYHqfYNdCqlLoL/F5UPXg
         jTF+Fjp8E8F3rQaNUXINFkTRFpVyizyZdWdedQriIF1z7KdMaKUnlbQqfYtrbHHIgdjB
         OyZHCI4QgCNpwzhgLzLLx2k/92/xB1PKHcHhDR/TgcNl/ELb1Fxm80aMwFMOe/aBYHG6
         9AY3BNaE8qPJ3iJC0Bzfj0BhkHX/OKekd/dVrh8ocGODq7quyfS20QlxdR6K9qzWPDLy
         5c8enhzVTtoTHbjrg3d8dfEs/3ypnmJPm+K99571gFkKzG7dzC1mFQjnHjRDqamLEMNp
         RnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kQp2cNfKa5X28/YG3R1vCmhJk3CF5jkW5A40DKbTPKE=;
        b=drx+XrJzDdkTzioIwVpeQrSeo0g5ARDCywLUwvzfcDGZbR9vQ7YKXocQmpVVGBwF65
         KitSQF6OwQv6v+bWh+lPIGAjJTskWiMKp2L7ZtZeexBwUF4y4ifyzXxKL+xGibaYVuW4
         1d7dd3a+oWTdXReY1q5v6Tq4it0xUbQjAD2qPS5w7dDi63NXIMGuYOf/AfG5iIyur+qH
         mRmqVonafw/yiLHlJr/GG0Z8pf9HQb1laRHprKM53orQD1kwFuzDU08mx9MVQf6OORZh
         TAWYQYot+p1npsqdtJpxIIfKmgcA/78dZLndty6o6AFEyUScoT6dEhLCeWYhOrXnN1Hk
         qh/g==
X-Gm-Message-State: AOAM531JDFOOlaMfAJoiJ47qYGdMnjRN/TEAecBNbuNO3Nm3jJwk6UDt
        to1BoVAhuyg2/d97l4IJAzkwbw==
X-Google-Smtp-Source: ABdhPJw4YAJzpT+zNUpHvivY9tYpOxCNj7a8sThWiC6r2JG+YYR2aMiZnRurtTkQVADUFdXt25MoGg==
X-Received: by 2002:a4a:8519:: with SMTP id k25mr7072948ooh.32.1605716722739;
        Wed, 18 Nov 2020 08:25:22 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x69sm6125494oix.1.2020.11.18.08.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 08:25:22 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Olof Johansson <olof@lixom.net>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, John Stultz <john.stultz@linaro.org>
Subject: [PATCH] arm64: defconfig: Enable QCOM_SCM as builtin
Date:   Wed, 18 Nov 2020 08:25:28 -0800
Message-Id: <20201118162528.454729-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm SCM driver was never explicitly enabled in the defconfig.
Instead it was (apparently) selected by DRM_MSM and by the recent change
to make it tristate now became =m.

Unfortunately this removes the ability for PINCTRL_MSM and ARM_SMMU to
be =y and with deferred_probe_timeout defaulting to 0 this means that
things such as UART, USB, PCIe and SDHCI probes with their dependencies
ignored.

The lack of pinctrl results in invalid pin configuration and the lack of
iommu results in the system locking up as soon as any form of data
transfer is attempted from any of the affected peripherals.

Mark QCOM_SCM as builtin, to avoid this.

Cc: John Stultz <john.stultz@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d129340a7ed1..287ccf98dc41 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -99,6 +99,7 @@ CONFIG_ARM_SCPI_PROTOCOL=y
 CONFIG_RASPBERRYPI_FIRMWARE=y
 CONFIG_INTEL_STRATIX10_SERVICE=y
 CONFIG_INTEL_STRATIX10_RSU=m
+CONFIG_QCOM_SCM=y
 CONFIG_EFI_CAPSULE_LOADER=y
 CONFIG_IMX_SCU=y
 CONFIG_IMX_SCU_PD=y
-- 
2.28.0

