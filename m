Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 169AA2B2A23
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Nov 2020 01:50:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbgKNAti (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 19:49:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:44148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725866AbgKNAth (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 19:49:37 -0500
Received: from sol.attlocal.net (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8D3042225E;
        Sat, 14 Nov 2020 00:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605314977;
        bh=qBaAL4MQUHwMWUUhiKf9tMwN4kN0fQHr7+CN7eAoXTI=;
        h=From:To:Cc:Subject:Date:From;
        b=R1xjm4MuS5ug9mWAuq31K5jPWEMl9OXX2DXqSl6aMu3xUtft9xO9PEnU9edRvKzJO
         +/p3G4/OwzKeMH4EFyQlJWZjd2wPyt8Q7uquE4ai9nNS+46w3qwFcVKhtVtm3CS5Jf
         /FpK6qu9GzMFH+qgQ+lUttyns9RoXe4q6ix84G2Q=
From:   Eric Biggers <ebiggers@kernel.org>
To:     linux-scsi@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, Satya Tangirala <satyat@google.com>
Subject: [PATCH] scsi: ufs-qcom: only select QCOM_SCM if SCSI_UFS_CRYPTO
Date:   Fri, 13 Nov 2020 16:47:54 -0800
Message-Id: <20201114004754.235378-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Eric Biggers <ebiggers@google.com>

QCOM_SCM is only needed to make the qcom_scm_*() calls in
ufs-qcom-ice.c, which is only compiled when SCSI_UFS_CRYPTO=y.  So don't
unnecessarily enable QCOM_SCM when SCSI_UFS_CRYPTO=n.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 drivers/scsi/ufs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/Kconfig b/drivers/scsi/ufs/Kconfig
index dcdb4eb1f90ba..3f6dfed4fe84b 100644
--- a/drivers/scsi/ufs/Kconfig
+++ b/drivers/scsi/ufs/Kconfig
@@ -99,7 +99,7 @@ config SCSI_UFS_DWC_TC_PLATFORM
 config SCSI_UFS_QCOM
 	tristate "QCOM specific hooks to UFS controller platform driver"
 	depends on SCSI_UFSHCD_PLATFORM && ARCH_QCOM
-	select QCOM_SCM
+	select QCOM_SCM if SCSI_UFS_CRYPTO
 	select RESET_CONTROLLER
 	help
 	  This selects the QCOM specific additions to UFSHCD platform driver.
-- 
2.29.2

