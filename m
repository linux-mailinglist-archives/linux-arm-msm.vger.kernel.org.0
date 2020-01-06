Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B064A131344
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 14:57:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgAFN52 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 08:57:28 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33773 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726300AbgAFN52 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 08:57:28 -0500
Received: by mail-wm1-f66.google.com with SMTP id d139so12024472wmd.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2020 05:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YQDFMpYyGBn6bXzxZ449ZPkj1Jf1C+zZL4H3jiyqIIA=;
        b=iT8ZO8xKQksEOxISYiRCdatyU1Jo6C8LHzxnO+k8NguYoJDiwzKtDYa3AGqVqh6NRZ
         om+HCqJG0mXk7U0N5bZMWxFO6iX/ckiakq3U8rn5txan+6MWrRkx3Pc5Q5djyL256ieL
         WSZoROj8lhODtQmWn1PU/LZJif5Qa+a2kKboxMmsCvYSh/TO/w79/rSj0KRv+iQ6tzqM
         2HBHKgPwnY5pg/lFmttejq29r/g3vHjHGqiM7SoSWmKXoXm697K/ko775+ioLDDRyXme
         g8uD5HlXjusIf+pRPEyqJYnlJfDZ73XZn01Z7hQ4vWNf6qRHLUg4zH1JtqK6ztpXC32u
         hhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YQDFMpYyGBn6bXzxZ449ZPkj1Jf1C+zZL4H3jiyqIIA=;
        b=RrKlvXLr8fqTGydvMmusSouaqP2m1IBQUloaegDsLYh/4il5CJJ1omTGIlRmzO7Aif
         myakqm5kTEKAK3JTYncihatBjGPc8br985mmd1unEQQRcCGPRqTUusZsodaf6IteF/jP
         zfO94Q3C7nqXx5q++G4LpGMXQQngopn0aSi6IXsVCRk2gv6wzd3hhlrpTgimAWYEXSQX
         rUmSTDw+esCVfX++K8JyIIefIYCEtqqBhN+GEXMB7VweE/cMTtMpSCtTUtSU2rfd7iKh
         cWgCP5tIhDC0atj1fcNL3WXOU/80P5bbx9s/2rddBg9j8ml6+w/pzLJDzdGXvGWRVfxV
         nSGQ==
X-Gm-Message-State: APjAAAWP3aC7toEN+JviNhtTKK+iRdNJ+d7hcu9Lppi2atVaAPZv8dXA
        VtqoLGJQ/stXyaLRHVsdCrEZgQ==
X-Google-Smtp-Source: APXvYqzlPEFlJdR8xklm5Wdu2DsFlg+3S3h22rrEphj9UIzDu689PptdBUTN1JDDDZ3EIPamzu+dNA==
X-Received: by 2002:a7b:cf39:: with SMTP id m25mr35323729wmg.146.1578319046260;
        Mon, 06 Jan 2020 05:57:26 -0800 (PST)
Received: from localhost.localdomain (93-137-254-179.adsl.net.t-com.hr. [93.137.254.179])
        by smtp.googlemail.com with ESMTPSA id t1sm23239792wma.43.2020.01.06.05.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 05:57:25 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, linux@armlinux.org.uk, arnd@arndb.de,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc:     Christian Lamparter <chunkeey@gmail.com>,
        John Crispin <john@phrozen.org>,
        Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH] ARM: qcom: Add support for IPQ40xx
Date:   Mon,  6 Jan 2020 14:57:15 +0100
Message-Id: <20200106135715.1159420-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Christian Lamparter <chunkeey@gmail.com>

Add support for the Qualcomm IPQ40xx SoC in Kconfig.
Also add its appropriate textofs.

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
Signed-off-by: John Crispin <john@phrozen.org>
Tested-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
 arch/arm/Makefile          | 1 +
 arch/arm/mach-qcom/Kconfig | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index db857d07114f..3db642722af0 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -152,6 +152,7 @@ textofs-$(CONFIG_PM_H1940)      := 0x00108000
 ifeq ($(CONFIG_ARCH_SA1100),y)
 textofs-$(CONFIG_SA1111) := 0x00208000
 endif
+textofs-$(CONFIG_ARCH_IPQ40XX) := 0x00208000
 textofs-$(CONFIG_ARCH_MSM8X60) := 0x00208000
 textofs-$(CONFIG_ARCH_MSM8960) := 0x00208000
 textofs-$(CONFIG_ARCH_MESON) := 0x00208000
diff --git a/arch/arm/mach-qcom/Kconfig b/arch/arm/mach-qcom/Kconfig
index ecbf3c4eb878..1772eccb5caf 100644
--- a/arch/arm/mach-qcom/Kconfig
+++ b/arch/arm/mach-qcom/Kconfig
@@ -12,6 +12,11 @@ menuconfig ARCH_QCOM
 
 if ARCH_QCOM
 
+config ARCH_IPQ40XX
+	bool "Enable support for IPQ40XX"
+	select CLKSRC_QCOM
+	select HAVE_ARM_ARCH_TIMER
+
 config ARCH_MSM8X60
 	bool "Enable support for MSM8X60"
 	select CLKSRC_QCOM
-- 
2.24.1

