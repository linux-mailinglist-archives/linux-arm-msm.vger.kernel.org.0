Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 485DD2DCB2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Dec 2020 04:05:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727287AbgLQDEw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Dec 2020 22:04:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727231AbgLQDEw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Dec 2020 22:04:52 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA001C061794
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Dec 2020 19:04:11 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id x18so8239552pln.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Dec 2020 19:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=2OShYK3cxttn34XBpwf6upnK9s0bIYer5Kl6XYLdf3g=;
        b=mtcwFqcGIhXVaOQzBmuoweU6wes3MKwesB6hNJhtfaGrUtHMulZK5oR1A1hAV7Pd4Y
         qFnULivaUIKPeFOQzZoXf08RrBBSd++PBugZgCXPhiJLERPBsHWUj37gdNEStB0oPhv+
         5laHL0h/jqNldFsbpx3FcYtJj0e4CXlLm5/a2LOS6e7jqwGC8Y8XXXp9uU/ydFf9ka2t
         YdipjftiSutrDfKDfvx+UTCbf/ij6OTAllFGkEI35z1/dNEkqjaFlPgNJdkg3LQkt+x7
         57scNyn4i7WJRE8p5T2/yUu4nBPe1d0ee3tFUvcz+OXJH+hGBFoHY1ecnpNokveJZEqv
         fcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=2OShYK3cxttn34XBpwf6upnK9s0bIYer5Kl6XYLdf3g=;
        b=hXm9FIxnQni6dZTN48SQyo4luoC54g3y1DCemGivxjA0EjNWk898dCQqIG346dLSF9
         YVHP91nKRMyUp2CzWSJqN4mZWIRowe1yE3s88FnpJXCoU/Ix0+qUhalfj2MEnVQ8IfwP
         HZuwUPrUm+2wrbxwGCWhIyftx0xBcPHWkGRVmxVhQEZ/FoBRZAVjzxfGAO52pP6/xF97
         U9i2ngO2RUFphbbgz/FEHy5kqe+r1PEHEBW/Q5oyq9CmS3asfMD2S+7cvh3XeclirMdt
         vdmCF6x/ss5ozjed63Cmr4xqruJNsQTcbcsb/iFrRgisu0rEI8gPHBqt0O7DzLggaH5d
         RhMg==
X-Gm-Message-State: AOAM533FLHfRulhIPTY9IC40oS7U9wTa3pJpIpU/TqAdG8aDxKNrvWIW
        Kb/B33INT67TQnZFbv4HeRXvQQ==
X-Google-Smtp-Source: ABdhPJzjsGhTbXQUP6JIFv2xSVy9MTdU2w93YM+Nji7Dqa0++qRPapAO4Bk/Km/Fdxn3qmj6Nwe5Lw==
X-Received: by 2002:a17:902:848e:b029:dc:1aa4:114d with SMTP id c14-20020a170902848eb02900dc1aa4114dmr4382311plo.18.1608174251173;
        Wed, 16 Dec 2020 19:04:11 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 3sm3810675pfv.92.2020.12.16.19.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 19:04:10 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] remoteproc: qcom: add more help text qcom options
Date:   Thu, 17 Dec 2020 11:04:00 +0800
Message-Id: <20201217030400.6235-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

With these more help text added, hopefully it's easier to understand the
distinctions of these qcom remoteproc drivers.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/remoteproc/Kconfig | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index d99548fb5dde..062a990a7d19 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -150,7 +150,9 @@ config QCOM_Q6V5_ADSP
 	select QCOM_RPROC_COMMON
 	help
 	  Say y here to support the Peripheral Image Loader
-	  for the Qualcomm Technology Inc. ADSP remote processors.
+	  for the non-TrustZone part of Qualcomm Technology Inc. ADSP and CDSP
+	  remote processors. The TrustZone part is handled by QCOM_Q6V5_PAS
+	  driver.
 
 config QCOM_Q6V5_MSS
 	tristate "Qualcomm Hexagon V5 self-authenticating modem subsystem support"
@@ -167,7 +169,8 @@ config QCOM_Q6V5_MSS
 	select QCOM_SCM
 	help
 	  Say y here to support the Qualcomm self-authenticating modem
-	  subsystem based on Hexagon V5.
+	  subsystem based on Hexagon V5. The TrustZone based system is
+	  handled by QCOM_Q6V5_PAS driver.
 
 config QCOM_Q6V5_PAS
 	tristate "Qualcomm Hexagon v5 Peripheral Authentication Service support"
@@ -185,7 +188,9 @@ config QCOM_Q6V5_PAS
 	help
 	  Say y here to support the TrustZone based Peripherial Image Loader
 	  for the Qualcomm Hexagon v5 based remote processors. This is commonly
-	  used to control subsystems such as ADSP, Compute and Sensor.
+	  used to control subsystems such as ADSP (Application DSP),
+	  CDSP (Compute DSP), MPSS (Modem Peripheral SubSystem), and
+	  SLPI (Sensor Low Power Island).
 
 config QCOM_Q6V5_WCSS
 	tristate "Qualcomm Hexagon based WCSS Peripheral Image Loader"
@@ -202,7 +207,8 @@ config QCOM_Q6V5_WCSS
 	select QCOM_SCM
 	help
 	  Say y here to support the Qualcomm Peripheral Image Loader for the
-	  Hexagon V5 based WCSS remote processors.
+	  Hexagon V5 based WCSS remote processors on e.g. IPQ8074.  This is
+	  a non-TrustZone wireless subsystem.
 
 config QCOM_SYSMON
 	tristate "Qualcomm sysmon driver"
@@ -231,8 +237,10 @@ config QCOM_WCNSS_PIL
 	select QCOM_RPROC_COMMON
 	select QCOM_SCM
 	help
-	  Say y here to support the Peripheral Image Loader for the Qualcomm
-	  Wireless Connectivity Subsystem.
+	  Say y here to support the Peripheral Image Loader for loading WCNSS
+	  firmware and boot the core on e.g. MSM8974, MSM8916. The firmware is
+	  verified and booted with the help of the Peripheral Authentication
+	  System (PAS) in TrustZone.
 
 config ST_REMOTEPROC
 	tristate "ST remoteproc support"
-- 
2.17.1

