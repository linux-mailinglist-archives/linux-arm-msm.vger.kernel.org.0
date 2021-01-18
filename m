Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2A292F9961
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 06:41:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731837AbhARFk0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 00:40:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731910AbhARFkW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 00:40:22 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83F71C06179B
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 21:39:24 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id v19so10224090pgj.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 21:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IvutgIvovlr32sAkqBmvLcqZv4cWT/SnSypP81o82NY=;
        b=ek+iUELL80RHYSWiVHpaij78w9/Xg9PAlDp+IcWuuVwG2GUna4dyA34OcE9++B84BW
         a2UMPk/0pxPPgs32uK1YE+OY9yGuc3feu1POMGoY0bOAYjfMSrDMzgvOq4/Aih9xYozZ
         +kcxZDrKkWV36rlKjavN2L6mXRY54v8NtXey4b3nQWPnFnrpnebfIDvWYjuv0/xmiTjV
         BiFezVcShNy/WmdM6ejVEyEtVhjd6HODYw2mZgbGVUwKCgAvee0sf3ROPcPoT5pS7dAs
         YUBG8viPslFjYb5HZlsBNazqQvlWXPUdP0OEQaPyO109Iv24kzqGebn+psvU0N87TDkn
         0yMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IvutgIvovlr32sAkqBmvLcqZv4cWT/SnSypP81o82NY=;
        b=ZX9PEUvTMRN3VXUctahVGLG9koYjhrN7e8HzuGh8hg09scCJpJIvRajCW18CLvCwlf
         AZGYcvK2CVbGXmFH01C3PdGuAECejdhQ5Fk4cbB3ei2b+7rcSoSHplzerTV3d8a+t1lR
         p+ZBFVfNNESfJoEDdlGn0DIPOzawa7oH9dlI6BSaFzT8pYSJVm1T+A7P6lqSeqkoUjgo
         9bXDHrRcVkO3gRYC64mk601x1w51R6a+uPbqhTKgnkcMq5K5aiZRECCYIzLVVK2vEO9y
         9PC3MOpdIoZD7z5DgVrgrWmX/yAKdgujgdU+vusSkPxGADjzPe53pvt+jjus+HGYLmag
         8XLQ==
X-Gm-Message-State: AOAM530ZUFZfqcR22ae1bAJ7vlWzjuAJYhPrC5eFVM2BCcH2QxD97XYw
        m8YwDyDKHgqAT9H2gc/Q0qH4ksONbzvC
X-Google-Smtp-Source: ABdhPJzTSZaCqUsvq8omYRBaAQX8mhsGpm0r8ubsyUGqYqpIpWnwZ8S7yaFyfaOMnqN/L1gSO3sl6w==
X-Received: by 2002:aa7:804f:0:b029:1a9:5aa1:6235 with SMTP id y15-20020aa7804f0000b02901a95aa16235mr24568092pfm.1.1610948364100;
        Sun, 17 Jan 2021 21:39:24 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.182])
        by smtp.gmail.com with ESMTPSA id z6sm14627271pfj.22.2021.01.17.21.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 21:39:23 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 07/13] ARM: configs: qcom_defconfig: Enable DWC3 controller and PHYs
Date:   Mon, 18 Jan 2021 11:08:47 +0530
Message-Id: <20210118053853.56224-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210118053853.56224-1-manivannan.sadhasivam@linaro.org>
References: <20210118053853.56224-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable DWC3 controller, QMP PHY and SNPS HS PHY for using with platforms
like SDX55.
---
 arch/arm/configs/qcom_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 51eeefd264d3..77f234bf84c8 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -196,6 +196,7 @@ CONFIG_USB_CONFIGFS_ECM=y
 CONFIG_USB_CONFIGFS_F_FS=y
 CONFIG_USB_ULPI_BUS=y
 CONFIG_USB_ETH=m
+CONFIG_USB_DWC3=y
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=32
 CONFIG_MMC_ARMMMCI=y
@@ -263,6 +264,8 @@ CONFIG_PHY_QCOM_APQ8064_SATA=y
 CONFIG_PHY_QCOM_IPQ806X_SATA=y
 CONFIG_PHY_QCOM_USB_HS=y
 CONFIG_PHY_QCOM_USB_HSIC=y
+CONFIG_PHY_QCOM_QMP=y
+CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=y
 CONFIG_QCOM_QFPROM=y
 CONFIG_INTERCONNECT=y
 CONFIG_INTERCONNECT_QCOM=y
-- 
2.25.1

