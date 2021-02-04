Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE4A30EBD1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 06:23:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbhBDFXT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 00:23:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbhBDFXT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 00:23:19 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D1ABC0613ED
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Feb 2021 21:22:38 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id 36so2298306otp.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Feb 2021 21:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LNhjejt95hLlQiht+V60b6s/E974FjQJnxFYdOCYRnM=;
        b=DlwUkuVf8orbvgDKQ3JiFiCFhhM03z+4fon31xQD9E7LR7lhDRcydiyfIP+RzBxXH9
         CFomCtcZ8EbliBh3JC0hjnr73tnuePIP1zQmYMHp6aHeqER0siPM1muyQEhOl/2QCWx8
         p+aRjMfafNr2AQC4HegZJ/Up3hQ5iALsYLe+Lis7DNK6VToMAxeVE8rJG974vkj8nnF+
         dXi1OIPCUpZbqvO3Rh3wYwM2CuJDIMeZzrTaaK7loyYyJ7Wo858hSRG1PdEq4a3femrI
         n3mzolNijWn6BGD5nVjm4DJ377ivV4DjZQsqKDZ1Thk5G1wqgj0WBdLvsQbAbJY4xkJ0
         CELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LNhjejt95hLlQiht+V60b6s/E974FjQJnxFYdOCYRnM=;
        b=YfcYG+p1VeT/Fo7CqAHZGw2rbS/a4XWFUdzLhV1hHL90OnGXVlu0/z6TTNuBvN3CaZ
         qKmbcYmzIocsNAU3m5ytFTupNS+d4lqGT7UXYQ9y3yovUDfOGmHCmqL+ifQokXWCj2kQ
         uovk8pIISOhptICmlN/5Cz5ejCelfkCLcoaeU5VmuiSDtUElrz+HB6C/UCMRaO2obRSp
         mbVQQs5yql8RXu6Jlut0qgeLtUTM12SytwFe9Dqt4Jmr8XUQnimhRBv55EmNrdKzt/xk
         QYpj15ZcoqSHUy/Vj9e3SAHcEIXB/W/52Q3u8Vxz3JhhWmQdAA4XisI9VBKFVPdRLWbs
         8vUg==
X-Gm-Message-State: AOAM531vszjEsPB4mC8WnYvzMDfdtyWl674tilXOrn17DGkDmnu6h8Be
        fymPRYMWtZ+iR9PXGElwDuKryw==
X-Google-Smtp-Source: ABdhPJwRk5FvjI2WqtUWF/xkdj1I5szZZNy6I+YTkeIM7qbNATHuL7tJDSF/ybx+XIOUR6VYuML9UQ==
X-Received: by 2002:a9d:4b0d:: with SMTP id q13mr4581587otf.325.1612416157957;
        Wed, 03 Feb 2021 21:22:37 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id f6sm922390ote.28.2021.02.03.21.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 21:22:37 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [GIT PULL] Qualcomm ARM defconfig updates for 5.12
Date:   Wed,  3 Feb 2021 23:22:36 -0600
Message-Id: <20210204052236.388783-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-defconfig-for-5.12

for you to fetch changes up to f147d717b133bbecded354b28afff9f2c3e9164f:

  ARM: qcom_defconfig: Enable Command DB driver (2021-01-22 13:50:47 -0600)

----------------------------------------------------------------
Qualcomm ARM defconfig updates for 5.12

This enables various device drivers found on the newly introduced
Qualcomm SDX55 platform in the qcom_defconfig. Due to kernel image size
constraints the qcom_defconfig is used instead of multi_v7_defconfig,
for now.

----------------------------------------------------------------
Manivannan Sadhasivam (13):
      ARM: qcom_defconfig: Enable RPMh drivers
      ARM: qcom_defconfig: Enable SDX55 pinctrl driver
      ARM: qcom_defconfig: Enable SDX55 GCC driver
      ARM: qcom_defconfig: Enable SMEM partition parser
      ARM: qcom_defconfig: Enable MTD UBI driver
      ARM: qcom_defconfig: Enable UBI file system
      ARM: qcom_defconfig: Enable DWC3 controller and PHYs
      ARM: qcom_defconfig: Enable ARM SMMU
      ARM: qcom_defconfig: Enable RPMh regulator
      ARM: qcom_defconfig: Enable watchdog driver
      ARM: qcom_defconfig: Enable ARM PSCI support
      ARM: qcom_defconfig: Enable RPMh power domain driver
      ARM: qcom_defconfig: Enable Command DB driver

 arch/arm/configs/qcom_defconfig | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
