Return-Path: <linux-arm-msm+bounces-30546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96ECD96A6DB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 20:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7DC71C244C5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 18:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32D91922DB;
	Tue,  3 Sep 2024 18:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Y4JsSm1q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9554C19258E;
	Tue,  3 Sep 2024 18:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725389255; cv=none; b=QdJ6n3E0Gxsl0nBxRDN9omNm+IC8D2+dVWz3gxelyiME4VXQ9Zm25WNMsnL6gToy7p/aRx+9fusT3M3bSVpr9CrPKpW46EBDYq8ycJWgctN/Mx8tRcB0KSod2W2kVxFIK08S6R4Sq25FVumQ5BAss9WX4Y2UlCXhg7W065jaVH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725389255; c=relaxed/simple;
	bh=ssgzH7Oc3qh676QCEo9CYK0VCZM8yF5XfpuYiyIoGkg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eSWdWaWfECVAKWv0hTMb2qvRwh/ggNOBPr2AH1Gzfk4sKv7+28ON+jbdBi1BLQ4TI9weNzRxiRREKvz4UPGLAUE0uqDgovkHV1DcniNHwh2NLcIAbM6Agfwnud7XcGfhpEKPcVcaqxm85X2q5FZZzxYRIMqS0HdFyT/6XbBGg6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Y4JsSm1q; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 483IlD8l014660;
	Tue, 3 Sep 2024 13:47:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725389233;
	bh=FTqTyrECFvbLD17NBUWn4/583otSS6XLuEd+TP20G+I=;
	h=From:To:CC:Subject:Date;
	b=Y4JsSm1q5fFCVCyu7U7R/zp9O4h3Ge7Fo9rsYjLUds7t3Lip38a0++nzk0EsGTzj4
	 Mvi107htYdS9aBxknJ/fuzpXEAh5W8pfgPSjpCOBqi386Kp04mRnyFuCeoZ35Tw124
	 E/zsKSKZWmnL8OSn3R9bOvssyvBipDhTrfcyPtYo=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 483IlDLW008470;
	Tue, 3 Sep 2024 13:47:13 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Sep 2024 13:47:12 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Sep 2024 13:47:12 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 483IlCbZ127692;
	Tue, 3 Sep 2024 13:47:12 -0500
From: Nishanth Menon <nm@ti.com>
To: Lee Jones <lee@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Nishanth Menon <nm@ti.com>,
        Mark Brown
	<broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli
	<florian.fainelli@broadcom.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH V2] mfd: syscon: Use regmap max_register_is_0 as needed
Date: Tue, 3 Sep 2024 13:47:10 -0500
Message-ID: <20240903184710.1552067-1-nm@ti.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Texas Instruments, Inc.
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

syscon has always set the optional max_register configuration of
regmap to ensure the correct checks are in place. However, a recent
commit 0ec74ad3c157 ("regmap: rework ->max_register handling")
introduced explicit configuration in regmap framework for register
maps that is exactly 1 register, when max_register is pointing to a
valid register 0. This commit solved a previous limitation of regmap
framework.

Update syscon driver to consistent in regmap configuration for
all sizes of syscons by using this new capability by setting
max_register_is_0, when the max_register is valid and 0.

Signed-off-by: Nishanth Menon <nm@ti.com>
---

Based on my search
https://gist.github.com/nmenon/d537096d041fa553565fba7577d2cd24, the
pattern of syscon registers that may potentially be impacted by this
patch (that are exactly 1 register wide) is probably limited, though
this patch in itself was inspired by a buggy driver code fixed in
https://lore.kernel.org/linux-pm/20240828131915.3198081-1-nm@ti.com/
I have tried to Cc lists that may be interested in looking closer to
avoid un-intended side-effects.

Changes since V1:
* Incorporate review comments by rewording commit message and $subject
  and dropped Fixes.
* No functional change to the patch.
* Expand the CC list to notify potential users.

V1: https://lore.kernel.org/all/20240828121008.3066002-1-nm@ti.com/

Cc: Mark Brown <broonie@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>

 drivers/mfd/syscon.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
index 2ce15f60eb10..3e1d699ba934 100644
--- a/drivers/mfd/syscon.c
+++ b/drivers/mfd/syscon.c
@@ -108,6 +108,8 @@ static struct syscon *of_syscon_register(struct device_node *np, bool check_res)
 	syscon_config.reg_stride = reg_io_width;
 	syscon_config.val_bits = reg_io_width * 8;
 	syscon_config.max_register = resource_size(&res) - reg_io_width;
+	if (!syscon_config.max_register)
+		syscon_config.max_register_is_0 = true;
 
 	regmap = regmap_init_mmio(NULL, base, &syscon_config);
 	kfree(syscon_config.name);
@@ -357,6 +359,9 @@ static int syscon_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	syscon_config.max_register = resource_size(res) - 4;
+	if (!syscon_config.max_register)
+		syscon_config.max_register_is_0 = true;
+
 	if (pdata)
 		syscon_config.name = pdata->label;
 	syscon->regmap = devm_regmap_init_mmio(dev, base, &syscon_config);

-- 
2.46.0


