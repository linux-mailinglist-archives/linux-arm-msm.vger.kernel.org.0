Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 182DED552F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Oct 2019 10:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728897AbfJMIIN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Oct 2019 04:08:13 -0400
Received: from onstation.org ([52.200.56.107]:42510 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728843AbfJMIIM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Oct 2019 04:08:12 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id BE28B3F237;
        Sun, 13 Oct 2019 08:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1570954092;
        bh=SDGRQ8nMMwuZGNNoNh3BLpNDiemqbax6/A4Jb1RyV3c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rBm0PBNKNl5HAo495kQlYlZYn942N+QK5K8eqEVWqzp3z+3DYdO6CMhFttA/QeceC
         C7OjgDWiyBXYcSwDVBD7WHCs5ukz8jC/Ke/glKSiPKqnzQXmpCSJCJnLrfm0xXQsKv
         W+0FxqLe1bE7F+NVCRbsURXdiq01ypt3o8p7K9V0=
From:   Brian Masney <masneyb@onstation.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/5] ARM: qcom_defconfig: add msm8974 interconnect support
Date:   Sun, 13 Oct 2019 04:08:01 -0400
Message-Id: <20191013080804.10231-3-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191013080804.10231-1-masneyb@onstation.org>
References: <20191013080804.10231-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add interconnect support for msm8974-based SoCs in order to support the
GPU on this platform.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 arch/arm/configs/qcom_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index b6faf6f2ddb4..32fc8a24e5c7 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -252,6 +252,9 @@ CONFIG_PHY_QCOM_IPQ806X_SATA=y
 CONFIG_PHY_QCOM_USB_HS=y
 CONFIG_PHY_QCOM_USB_HSIC=y
 CONFIG_QCOM_QFPROM=y
+CONFIG_INTERCONNECT=m
+CONFIG_INTERCONNECT_QCOM=y
+CONFIG_INTERCONNECT_QCOM_MSM8974=m
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT3_FS=y
-- 
2.21.0

