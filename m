Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A994D3249FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 06:18:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbhBYFSq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 00:18:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbhBYFSp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 00:18:45 -0500
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4794EC061574;
        Wed, 24 Feb 2021 21:18:05 -0800 (PST)
Received: by mail-qv1-xf2b.google.com with SMTP id fb15so2251226qvb.3;
        Wed, 24 Feb 2021 21:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rzXO5uwkd4UlJ7sr2WOeKxv8d9eLoFxx3aBaT5I3Xd0=;
        b=ZJRCL2r0C+HbOuYbiyAWOvbDfAqZt1dx0AtXgIxOymVm+utGFfMI4/qORweKTvi05g
         qWhVVFkYyDRl7UDQCuKYAYSAUcZtrF+fLSkhTjnkyVkI+yDx/JxDTs1mMvqcmg0+ZZHe
         r5GM1tx1g5ZeI2MaKHuOEYaSxhNcCsOGWaASTN3G6QjLzTox9KgnKIhc9z7y+hptA+kR
         G15VfT6U7jXUjoUGwknEhVMvrod44GUIQQJxrGVA7tP+0wLgTiJgM9LLoQzeUgY9iEXH
         GIOyulNq8rJEt5iMOvJtufmYvZCOwICYByrXQ/qmYlRZdA4MB8CKNRTCFVxq5XrQgzNf
         /w6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=rzXO5uwkd4UlJ7sr2WOeKxv8d9eLoFxx3aBaT5I3Xd0=;
        b=Jcq4PiBTVmS3ybiDk6ViOV8f/A4rGcquN5odpyUjY1wUujaIrB69XVT4+0K3TNrr6W
         9G9q7tt7L65PXB4V7ZFd+hdblhdss958k2b0ffEWxuS33ov8jMC8FsUaxa4QkrTns1vj
         tg3nbb9Oew5GhRQUT4Ih8p4kbZKtTZjKgXeq0Yi90I/tDmTAkeDEI3d12WBBjsZqNixE
         etiVbeUwZlsKdaAcFBuUE21uzwGpXfgfFk/gpslrkKFBoCLnr7F9TOSK5mbNZ4lv5SiY
         ltO++jJADmbcO41JIUlp/eX2h6VLSUSgkefv5caWGy+8AaHrYUL5cbSiaET8Jwma9qOe
         ha+w==
X-Gm-Message-State: AOAM532fNcVLL8TffZFq+KI24ayTk61ey3ocYBdJ5NpnaQR7DIwpgrli
        TO5vExqtOmEcsIjvyI1duPlZV22AeKd0She7
X-Google-Smtp-Source: ABdhPJxflpIx46zPBJhXW4XDyazDOUN/AsFVwOfmBAZBV4IEfJONclMiliI+1lTx2XziqMEUxGgjEw==
X-Received: by 2002:a05:6214:a88:: with SMTP id ev8mr1165384qvb.38.1614230284569;
        Wed, 24 Feb 2021 21:18:04 -0800 (PST)
Received: from kde-neon-desktop.orld.fl.wtsky.net ([208.64.158.251])
        by smtp.gmail.com with ESMTPSA id i16sm3265237qkk.104.2021.02.24.21.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 21:18:03 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
From:   Julian Braha <julianbraha@gmail.com>
To:     linus.walleij@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: pinctrl: qcom
Date:   Thu, 25 Feb 2021 00:17:25 -0500
Message-Id: <20210225051725.7312-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When PINCTRL_MSM is enabled, and GPIOLIB is disabled,
Kbuild gives the following warning:

WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
  Depends on [n]: GPIOLIB [=n]
  Selected by [y]:
  - PINCTRL_MSM [=y] && PINCTRL [=y] && (ARCH_QCOM || COMPILE_TEST [=y])

This is because PINCTRL_MSM selects GPIOLIB_IRQCHIP,
without selecting or depending on GPIOLIB, despite
GPIOLIB_IRQCHIP depending on GPIOLIB. Having PINCTRL_MSM
select GPIOLIB will cause a recursive dependency error.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/pinctrl/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 6853a896c476..d42ac59875ab 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -3,7 +3,7 @@ if (ARCH_QCOM || COMPILE_TEST)

 config PINCTRL_MSM
 	tristate "Qualcomm core pin controller driver"
-	depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
+	depends on GPIOLIB && (QCOM_SCM || !QCOM_SCM) #if QCOM_SCM=m this can't be =y
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
--
2.27.0
