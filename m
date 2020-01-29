Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEDCC14D382
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2020 00:20:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbgA2XUl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jan 2020 18:20:41 -0500
Received: from onstation.org ([52.200.56.107]:33836 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726939AbgA2XUl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jan 2020 18:20:41 -0500
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 6FAC73F0A4;
        Wed, 29 Jan 2020 23:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1580340040;
        bh=xhEqO9D9gJzGJNJNQBriXn442xN0cKXRCxa1IMwgTcs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PHBbhLjF3F7GceQZaJXW7pWkfnS1sKXsU3el/cbnoc9DfNU5CDItQ7s846xJMx5No
         uPeG2aXE017VQzCStVY3cZYaqZn4calhWlR//MZCF5UuicxlpAkb6XUR/dQFTftIS8
         /Xt1Ds2YleqcM5CjctAZauqyzc0NaZo2UzTSyDMY=
From:   Brian Masney <masneyb@onstation.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jonathan@marek.ca
Subject: [PATCH 1/3] ARM: qcom_defconfig: add Broadcom bluetooth options
Date:   Wed, 29 Jan 2020 18:20:29 -0500
Message-Id: <20200129232031.34538-2-masneyb@onstation.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200129232031.34538-1-masneyb@onstation.org>
References: <20200129232031.34538-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add Broadcom bluetooth options and serial bus in order to support
Bluetooth on the Nexus 5 phone.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 arch/arm/configs/qcom_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index cdc75ef7d529..a00765b7225f 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -50,6 +50,9 @@ CONFIG_IP_PNP_DHCP=y
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
+CONFIG_BT=m
+CONFIG_BT_HCIUART=m
+CONFIG_BT_HCIUART_BCM=y
 CONFIG_CFG80211=m
 CONFIG_MAC80211=m
 CONFIG_RFKILL=y
@@ -111,6 +114,7 @@ CONFIG_SERIO_LIBPS2=y
 # CONFIG_LEGACY_PTYS is not set
 CONFIG_SERIAL_MSM=y
 CONFIG_SERIAL_MSM_CONSOLE=y
+CONFIG_SERIAL_DEV_BUS=y
 CONFIG_HW_RANDOM=y
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
-- 
2.24.1

