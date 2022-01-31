Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 750E24A4C77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jan 2022 17:51:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349846AbiAaQvA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 11:51:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380618AbiAaQu7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 11:50:59 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D133C061714
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 08:50:59 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id x23so28239456lfc.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 08:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GioSKIaU13MEvW/d+kgEmzBl7St+VTT+z4XpTJBpYUY=;
        b=SBoPxDB6moY9deewUj5it+ctmz5+3GQAHytVwtXh769U8fnQfYIwfHro339m133DQD
         ugBeiN9xMjxV+diGLmEWHQgfZyh2ly9ru8uCfUtMTwbJmWf6aZbN++FmTRhtBPEnVWXL
         IsMi9VenqKPUD++oadn88CTvz6GaESlUMqSgJ5k8adS4hXCiCTGmbH3S72pTErcKZmJs
         1Up/NBzRfeDuPxYrtqSbn4bZigisIqA6tcUx3vCV0IOjk1AtPuycbaYK/jHWuYQnlVqa
         jjm/IQ+N01GRkTiIqVf3A7AdUruaSYwvZvQtTU54BxDl90/o5pQWZjG5Lq1QtPLADbY5
         qQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GioSKIaU13MEvW/d+kgEmzBl7St+VTT+z4XpTJBpYUY=;
        b=A9CLXstqYY6M+xB/mVtz69qMnjBWAN0UCng2S4UPhungtihVpOfkCWL8V7gXHc7aYh
         FWp8g61HYhsNae8cuF22sOCt2MMwylhutOWh7/SNNp73VGhNynOET4TcodSTU8vWDgUZ
         +XTbyK9bb/zKrBwcFNr/x2TxgIhUQbgmBIlsiWOsjGKngY/AE3TlNAfHbGeBTvtk9tke
         f0RThTz84Vd7aKeE1tsf159TpC7EpJIOKFP2QUkiFahQSb3y0qquSPVVJCEyVTloJhrK
         qhoyvduDpFs88k85aAs5MkLtMQ4q6HdeNatAyxYx7LEFnUuB50ZMNHfuueqqNo1yzXMc
         zyFw==
X-Gm-Message-State: AOAM532SisPdXAtRsoYzwzen5ugEn/4dvAdEzomcIsxPI+LIpLlAuIkq
        8i0I5g3SCH4ADXt3rfWwsEnG7w==
X-Google-Smtp-Source: ABdhPJwVwIWSYC+eSXNXGue1cqc+/4LydpFv+yebWeUXw2DP8kiqQ0P8B9vHFpUbVYeUZMeNT0HhLw==
X-Received: by 2002:a05:6512:1686:: with SMTP id bu6mr16325223lfb.125.1643647857618;
        Mon, 31 Jan 2022 08:50:57 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i19sm2749853ljm.51.2022.01.31.08.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 08:50:57 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/5] arm64: defconfig: Enable some Qualcomm drivers
Date:   Mon, 31 Jan 2022 19:50:52 +0300
Message-Id: <20220131165056.2117434-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable coincell, fastrpc, mailbox and adc-tm5 drivers to be built as
modules. These driver are used on many of Qualcomm platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 30516dc0b70e..ab1920df6c27 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -270,6 +270,8 @@ CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_NBD=m
 CONFIG_VIRTIO_BLK=y
 CONFIG_BLK_DEV_NVME=m
+CONFIG_QCOM_COINCELL=m
+CONFIG_QCOM_FASTRPC=m
 CONFIG_SRAM=y
 CONFIG_PCI_ENDPOINT_TEST=m
 CONFIG_EEPROM_AT24=m
@@ -586,6 +588,7 @@ CONFIG_TEGRA_SOCTHERM=m
 CONFIG_QCOM_TSENS=y
 CONFIG_QCOM_SPMI_TEMP_ALARM=m
 CONFIG_QCOM_LMH=m
+CONFIG_QCOM_SPMI_ADC_TM5=m
 CONFIG_UNIPHIER_THERMAL=y
 CONFIG_WATCHDOG=y
 CONFIG_SL28CPLD_WATCHDOG=m
@@ -1050,6 +1053,7 @@ CONFIG_FSL_DPAA=y
 CONFIG_FSL_MC_DPIO=y
 CONFIG_FSL_RCPM=y
 CONFIG_MTK_PMIC_WRAP=y
+CONFIG_MAILBOX=y
 CONFIG_QCOM_AOSS_QMP=y
 CONFIG_QCOM_COMMAND_DB=y
 CONFIG_QCOM_GENI_SE=y
-- 
2.34.1

