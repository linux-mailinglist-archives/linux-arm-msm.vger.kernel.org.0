Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BABC11E1549
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2020 22:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390538AbgEYUlb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 16:41:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390437AbgEYUla (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 16:41:30 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EA6DC061A0E;
        Mon, 25 May 2020 13:41:30 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id m1so2792740pgk.1;
        Mon, 25 May 2020 13:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=RkZMhQLldIOys7nQpzJNFew5Ei3EG4rJ9hOJdxzbwfk=;
        b=krPQWD30ZCtO95s7MF8vMdQ5C1OlfmYMp3uv9JE2P3gqz+WkE/Hbqek1HDoCGzgJ6j
         of2+bh9iipH3npWs6AxtnHUYMK15Rl6mQfvW0I2GlbLBGz/0WWcKz2OkQpHaAjw+k0NM
         FFxi0fyinbgIdGgaAhPkfvSkkoYb1z8HBbHCJEdmvYkgZyQRjbo1n2AWYyeqISe7746T
         upgkB1/bvDOBPcAbVmegmYlKs6nZ/+OGxe2GskW3ihEddLjlv1buOzHSchSrwbivLv72
         qaALbI9W9/uOH8mZO5mj1SfnN5lLr47j77idBRYkx+uC2UW4fQCGTY/kSh3zGB+TUi8b
         wV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=RkZMhQLldIOys7nQpzJNFew5Ei3EG4rJ9hOJdxzbwfk=;
        b=SitZCAyF+RKclLN9zwBCqUr2LIZ68fquQyCfXNpibwKIRDqzXn1DRreZuEu2TVm+yN
         pdb/i+PUOwWmMRVESlRMJqxgwA8QCfT1VTJb0yrAK0Odyhd/ZVyi6MUYdVzQPLZQTGto
         XwhNTtkXiryq1cAKVjaeZiQfzW0+3/56wm1KVJAf4TdS7UG2B7zw9x2pD9orBSw9kooh
         L428kziYJIhklkvxAkxyzk4ysw1FxFM35zg+/oBkNALvnqCjijCZJ6j56UzcQUFsYSkP
         BcOsD7mJOv4X60iUXwbxZnEC/E4uokvKKh0BEzblqPZp54sGfjpoPM1XmMPj4jKnoIsf
         pegw==
X-Gm-Message-State: AOAM533H5bQcwya7TKnQZDgSESQZFYfm1FdxLSUMVHwu7Il+AVqP9gVz
        J24bkHh6QfK4liD1l5g8fYx+mLv3
X-Google-Smtp-Source: ABdhPJy18biZE6cpZtxmd7gPtm4MkApYXoZPl+nTvYgRXICZkwMwsscr+L+DR42ER3/ctduP0LdmeA==
X-Received: by 2002:a05:6a00:1490:: with SMTP id v16mr18061272pfu.173.1590439290104;
        Mon, 25 May 2020 13:41:30 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2sm13632095pfc.7.2020.05.25.13.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 13:41:29 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        alim.akhtar@samsung.com, avri.altman@wdc.com, jejb@linux.ibm.com,
        martin.petersen@oracle.com, subhashj@codeaurora.org,
        venkatg@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] scsi: ufs-qcom: Fix scheduling while atomic issue
Date:   Mon, 25 May 2020 13:41:25 -0700
Message-Id: <20200525204125.46171-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

ufs_qcom_dump_dbg_regs() uses usleep_range, a sleeping function, but can
be called from atomic context in the following flow:

ufshcd_intr -> ufshcd_sl_intr -> ufshcd_check_errors ->
ufshcd_print_host_regs -> ufshcd_vops_dbg_register_dump ->
ufs_qcom_dump_dbg_regs

This causes a boot crash on the Lenovo Miix 630 when the interrupt is
handled on the idle thread.

Fix the issue by switching to udelay().

Fixes: 9c46b8676271 ("scsi: ufs-qcom: dump additional testbus registers")
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/scsi/ufs/ufs-qcom.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 19aa5c44e0da..f938867301a0 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -1658,11 +1658,11 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
 
 	/* sleep a bit intermittently as we are dumping too much data */
 	ufs_qcom_print_hw_debug_reg_all(hba, NULL, ufs_qcom_dump_regs_wrapper);
-	usleep_range(1000, 1100);
+	udelay(1000);
 	ufs_qcom_testbus_read(hba);
-	usleep_range(1000, 1100);
+	udelay(1000);
 	ufs_qcom_print_unipro_testbus(hba);
-	usleep_range(1000, 1100);
+	udelay(1000);
 }
 
 /**
-- 
2.17.1

