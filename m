Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC5D91E5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2019 09:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725958AbfHSH4K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Aug 2019 03:56:10 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45348 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbfHSH4K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Aug 2019 03:56:10 -0400
Received: by mail-pg1-f196.google.com with SMTP id o13so719522pgp.12;
        Mon, 19 Aug 2019 00:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CfD4pxcmsBOD0JzPOjdXmaU+TeQQm+86Lzg/ymH88+k=;
        b=BArwRWm1ImVBI8S4DBJT/VvuVmBZnlj9RnPnF5Wi9GHZ0l3LeIfYbKTGMKYe2uEeG9
         +o+4yfpSLOqP2BulTYzUtrt8ydxadNV+EUkxe3sif6Mnq6c/KThkgyrGo9alPuVw1P5W
         amiZeXP9PY5q+sFaqz9wZF92NtZU2b4oQgTgc2XobhDrh3LROIo6zFvO+obysEWKMEPZ
         0JyrT6chmjuCwlIt+Q+Kv5wp0UbJKcEMAQhPdIGx4L1Bqrf6JHxzw3q7T5cPh0COpI2I
         MOJO8rsrhzzcbt3cYU7hFh3VC2osh5A0wKN0R67QGFF7YkU8FaKZOZPL/8zJsTWK/Wbc
         7dkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CfD4pxcmsBOD0JzPOjdXmaU+TeQQm+86Lzg/ymH88+k=;
        b=GJcUcrSwQaTSrl6F/XuXocYkvnF1WVjdCcAYop0LP6HLd+JsWvZgmStlmpTmaNnvli
         MQSISyI7EUZhFUK3M4NAzm37vTlf4ShFHt0RdK01c9FBBpwtySyb0Jwu73cEtXmhhUe9
         T1iqxji2JvDvo/oEmfmYkl8OP0q+9Vv/CIpHOQUQin8I2z3Yv+vN0jIU+gf8rrjuKr+I
         8s1V2pBLdRA0OGnnN6n9hSnQDm8DkhMEH8pnzpAR2JDVT6sxvQAdVnC89k+R4Tzuhf6+
         UOLRRIFw0Vz1zf0VodfNL5VkLg9ymGw4KcO5Hxp5XBVGiAsI3TIrk8LeoOCr7S+4t4bG
         M51w==
X-Gm-Message-State: APjAAAUCetI5/OBv5sH1ElZG3jdAy5Yi9z7BqK2KxiYKtS1iJnGFCu9C
        znKpLEqWIlAZjuvppxsaeSk=
X-Google-Smtp-Source: APXvYqwrzXMMw4vjlEp/kre9mkNnD1+WQhWHfjp7nEGi7/gdILYk21UrhrkUeenIx3QOJXF6ASVjRQ==
X-Received: by 2002:a63:fa11:: with SMTP id y17mr18873142pgh.267.1566201369424;
        Mon, 19 Aug 2019 00:56:09 -0700 (PDT)
Received: from localhost.localdomain ([110.225.16.165])
        by smtp.gmail.com with ESMTPSA id e13sm19148162pfl.130.2019.08.19.00.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 00:56:09 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     agross@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        pedrom.sousa@synopsys.com, jejb@linux.ibm.com,
        martin.peterson@oracle.com, linux-scsi@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] scsi: ufs-qcom: Make structure ufs_hba_qcom_vops constant
Date:   Mon, 19 Aug 2019 13:25:57 +0530
Message-Id: <20190819075557.1547-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Static structure ufs_hba_qcom_vops, of type ufs_hba_variant_ops, is used
only once, when it is passed as the second argument to function
ufshcd_pltfrm_init(). In the definition of ufshcd_pltfrm_init(), its
second parameter (corresponding to ufs_hba_qcom_vops) is declared as
constant. Hence declare ufs_hba_qcom_vops itself constant as well to
protect it from unintended modification.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/scsi/ufs/ufs-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index ee4b1da1e223..4473f339cbc0 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -1551,7 +1551,7 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
  * The variant operations configure the necessary controller and PHY
  * handshake during initialization.
  */
-static struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
+static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.name                   = "qcom",
 	.init                   = ufs_qcom_init,
 	.exit                   = ufs_qcom_exit,
-- 
2.19.1

