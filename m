Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF2E198705
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2020 00:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729810AbgC3WK7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Mar 2020 18:10:59 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46354 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728987AbgC3WK7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Mar 2020 18:10:59 -0400
Received: by mail-pl1-f195.google.com with SMTP id s23so7294997plq.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2020 15:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OUGH6boV97QY3HPRNrCFz2qqIfy/MTKq/GJOXJzP+wg=;
        b=MQVSNn2B3F3HsK9ir4fS2ndd9PcObJReFqU2iu8kOgjtsyNLT82Qh4PZ6+Ja+j1o/g
         CLWS+vO5Vm29wR/P+4euN23K32dR3Mw1J/oWBOXuaADswvearulbVUSrv1l9nfP4ubic
         Q5Xb2IbiDvftfxjFmes7agaI80lcocbh6OK8Tr542ZZ2Oj0xtyXp2nZkVtF3qOldfwaR
         GZrXB9NwQ0gbVRceWn32m85JeffhCfu4/UDGBgz6QQRNwY3MpRuaRCQz709U7lLwXStn
         tAtifNytyx+jL6AHs+86VRzaiblHu8aIrhN2i0VEI79XdejDPDbqRTHbtiQ5jjk/qHhR
         mlsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OUGH6boV97QY3HPRNrCFz2qqIfy/MTKq/GJOXJzP+wg=;
        b=FW9Adbhzu7Rt5DG+6Q1CV7dK/yCOiJ0gBorNn+NnsYowYsaU7+KlkaMpv434QilBC6
         ZfSo4HRWHrBaA6uCIoNBRAFf6WEanmbuCMtd4lPx1n5KvYtJxv5lBb3JEECLOOnr46IM
         hE2UgT9PvPhdTfGyheHxIoeWW/4TU9XIevrd1N4P3/HryAPCiYc0OdF3Xasf7m8TkDve
         5BalUMv1tqcfdSgPM3+fTZNrqyRypyRHuwXRONtKLtkFsjmPP9IAtZ5iTMi/87Gfrpul
         0GDFoOGuBob93/OdZcq5CwrjreJ7CtdoQRNqnhBCVJzOYKK++hkEHrPwIBmCo4Jkxf2i
         w1MQ==
X-Gm-Message-State: AGi0PuYA3DF/sovXcBtOtzEnxKRdzoVQbGgSIaKXwnmSAOLyJ6vihgoZ
        ImXgW7SORj/NiIyfyRp5k0t03g==
X-Google-Smtp-Source: APiQypKhqTu8qeFVMWXm7jXDzhpHz3/DkGaphHnvsFkrjRrbxpQPVyvnJLqt2kjIU1+rUuz/dxjILg==
X-Received: by 2002:a17:902:9682:: with SMTP id n2mr1154759plp.44.1585606258179;
        Mon, 30 Mar 2020 15:10:58 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a24sm10958283pfl.115.2020.03.30.15.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 15:10:57 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     soc@kernel.org
Cc:     agross@kernel.org, linux@armlinux.org.uk, arnd@arndb.de,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Christian Lamparter <chunkeey@gmail.com>,
        John Crispin <john@phrozen.org>,
        Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH] ARM: qcom: Add support for IPQ40xx
Date:   Mon, 30 Mar 2020 15:10:54 -0700
Message-Id: <20200330221054.76441-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <CAK8P3a1_eyVSTgKDk+qph6CCKswWFWhPfX=yi3=jAeUf4uWC6w@mail.gmail.com>
References: 
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
Link: https://lore.kernel.org/r/20200106135715.1159420-1-robert.marko@sartura.hr
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

soc, please pick this up for 5.7, per the replied to mail.

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
2.23.0

