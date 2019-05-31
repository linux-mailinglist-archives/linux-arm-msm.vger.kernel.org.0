Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B583E30BEE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2019 11:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727016AbfEaJqd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 May 2019 05:46:33 -0400
Received: from onstation.org ([52.200.56.107]:51364 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726649AbfEaJqc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 May 2019 05:46:32 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 674EB45089;
        Fri, 31 May 2019 09:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1559295991;
        bh=GfSdmq3XfKPVisM175rcc6VtQUZljvT4gXjyX0xcI2U=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=vJmnZN7Me1oWPD6ETPN6lypSi4hRmEhZMfiqd+SGabybfHG8C5JATXKvWyxng8XfC
         3JqOo6y1rOKQjOKcgQi0NhxVais/esj18VEXHfGdUmbpbir9q1Xclg7OuRdqQSetXd
         Uefc/r0EBBJ2pLn12ahYg17aEuieQ3w9S0scx4LY=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, sean@poorly.run,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        jonathan@marek.ca, robh@kernel.org, jeffrey.l.hugo@gmail.com
Subject: [PATCH v3 3/6] ARM: qcom_defconfig: add display-related options
Date:   Fri, 31 May 2019 05:46:16 -0400
Message-Id: <20190531094619.31704-4-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190531094619.31704-1-masneyb@onstation.org>
References: <20190531094619.31704-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the CMA (Contiguous Memory Allocator) for the MSM DRM/KMS driver,
the simple panel, and the TI LM3630A driver in order to support the
display on the LG Nexus 5 (hammerhead) phone.

Signed-off-by: Brian Masney <masneyb@onstation.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/configs/qcom_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index c1854751c99a..4f02636f832e 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -37,6 +37,7 @@ CONFIG_ARM_CPUIDLE=y
 CONFIG_VFP=y
 CONFIG_NEON=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_CMA=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -146,12 +147,14 @@ CONFIG_REGULATOR_QCOM_SMD_RPM=y
 CONFIG_REGULATOR_QCOM_SPMI=y
 CONFIG_MEDIA_SUPPORT=y
 CONFIG_DRM=y
+CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_FB=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_BACKLIGHT_LCD_SUPPORT=y
 # CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 # CONFIG_BACKLIGHT_GENERIC is not set
+CONFIG_BACKLIGHT_LM3630A=y
 CONFIG_BACKLIGHT_LP855X=y
 CONFIG_SOUND=y
 CONFIG_SND=y
@@ -262,6 +265,8 @@ CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ASCII=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_UTF8=y
+CONFIG_DMA_CMA=y
+CONFIG_CMA_SIZE_MBYTES=256
 CONFIG_PRINTK_TIME=y
 CONFIG_DYNAMIC_DEBUG=y
 CONFIG_DEBUG_INFO=y
-- 
2.20.1

