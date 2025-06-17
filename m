Return-Path: <linux-arm-msm+bounces-61521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68499ADBFFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 05:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 149331687FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 03:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5FE1C5485;
	Tue, 17 Jun 2025 03:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ar8hT+LR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B928F54;
	Tue, 17 Jun 2025 03:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750131774; cv=none; b=M9j1LsgyAnOfUHKSN/uuXRLoOU5ysx25roM43omsMJl0+GXo8P37qa5RfAqeaFgCfz83TutycfcS9yTbcVJp21TWsC3NE0XO9tO1aOv3Hs0DchxceNWZKKQfeHRchxDXZTShHPM4FTHVzPbi8MztiYKIIUglpLKje5hoPWDDwzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750131774; c=relaxed/simple;
	bh=WqqMW+qsiOfAWMlck+pU6E3joWu1LWgnjALA2SeRfBM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kqm6n4tN1duduwWdjOOZHv/Gt5nek4pjzP8TR3E5Je7fTkZx9CEM9EWdUxPH3uGyoaxgYWjZmx8JcxLl0WhmajqKKnYHhntC9xAa1zUWqrJpP2IE2b4ZyeGlZ0ZsP2GuzaebcVK87l3dlr5Vw68+t8kbqo9bPgaW6A1jg52nizc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ar8hT+LR; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=xNzm8JTZrL0Z+qIuK4t25ph3zxJy8ovZdHxX/XhkomY=; b=ar8hT+LRFuEQwMuvFTpHjF8sTS
	OSj7wPZtHc7grShSNi7S3IAWCTHVLBWiOqnSlV122P0nDOby+uB2IzKxJBpJacdO8rNMv6vVwFByC
	LDHJ5RKiIoVU37aElKs/8Qwf1LT2FBKlhej8s9K/AjmmtE4g/iGxGzmGSsIwgNd/zzjPNIfYZBpoG
	rRyCqdLzBeH4veiwvaXkUfKVyupJdGg326kCN/MbkG74xQsLoy4+HGnu+AUUar9fq5O8z1llJxCqx
	ohN1tPZ7g9Pvx0O1ATmKZ93olz0p+bcqGROPXIsGExSniidGgmM2z8iWxJmo3kewOjQq6OIHaFBpa
	fVkLok+w==;
Received: from [50.53.25.54] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRNDm-000000067FP-24iY;
	Tue, 17 Jun 2025 03:42:50 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] phy: qcom: add linux/bitfield.h header to fix a build error
Date: Mon, 16 Jun 2025 20:42:49 -0700
Message-ID: <20250617034249.2067135-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the <linux/bitfield.h> header to prevent a build error:

drivers/phy/qualcomm/phy-qcom-m31-eusb2.c: In function 'm31eusb2_phy_init':
drivers/phy/qualcomm/phy-qcom-m31-eusb2.c:210:37: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
  210 |                                     FIELD_PREP(FSEL, data->fsel));

Fixes: 9c8504861cc4 ("phy: qcom: Add M31 based eUSB2 PHY driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-phy@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
---
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20250616.orig/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ linux-next-20250616/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/err.h>

