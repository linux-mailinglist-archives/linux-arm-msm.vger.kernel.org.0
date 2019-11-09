Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAD85F5C5F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Nov 2019 01:40:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbfKIAkl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 19:40:41 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:35376 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730159AbfKIAkl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 19:40:41 -0500
Received: by mail-pf1-f193.google.com with SMTP id d13so6166560pfq.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Nov 2019 16:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=705HB2azoG200nwS3o3zO3rtDYqxCRBnG4hOOCQq8EM=;
        b=vBtJh5iZty4ax9mbgk+Lt9/4w+HA8JQ8hKBUrXr3gdOy84AhmP8L4Ltjt+B3mrqM4x
         WViU03gq39CuEruIjdcPij9fd0OMEGBpGV58E8SVMW+xZv5Ozklur6FJI0JTcqs9VZQQ
         ra7XVIIKa9KXR9/g5uIAav0qS41V9/dwBscejKuHM5cd5i7KTUXIa7yzA+jmtR4Jazfh
         UqoE4mdJLnhjSIvuTvJS99sTo6C5vaD/9HHUgJkQfDRxqEr4b6k0r9VpS9Ect6Id3LPy
         DjAOf5XHZskq3Sp8nzUKAOmbOQNd5zccJVRbegg+zM/IUPKAQx6hCgqcbFZA1zIhV7xb
         zP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=705HB2azoG200nwS3o3zO3rtDYqxCRBnG4hOOCQq8EM=;
        b=chsY06Lpf52GYh6yi8Y2uzBp6BtCcXk55+kvxF5jzAdd8VKo7kMwcOKPB4kFGKFr0L
         ksYiZHt12ptimNF1ArIKs87s/HMZI/0RdhUitIYeGmI9GnIQzHitCUhsTlljRRLOSLyu
         +n3pXlFkjAR7XFQmABIGTtnY8owkwW93Qx2OXoqNKKG8SnAaxtHH7SDfvOrDvrPgPuxx
         7+SQi697DoCrJNpH0rMpqKboUSZMMB8/oFbK79EIsLTI6ufzygwZ4ITVGzPz1zhwzPmc
         fc34plM4BP0S9q1fQ1q3qIsh7n8OM0lh+NYfL1EVj66JJmtkBph0wxqgy1kMKXkQedV9
         Gqpg==
X-Gm-Message-State: APjAAAWqqrcR0Hzcx0BoQL2cG23/sMAnbzBV9qZSqJXkH2oLn0lvDkKK
        OLNtD9Y97NH41J7bWVQKJe1n7A==
X-Google-Smtp-Source: APXvYqwplgsd9NKexroKKfh0xLnRA4IYQ8y4EtnaHnQJoQHbtj18y/kjZD5tBU0IFEqUvlf9P4cfwQ==
X-Received: by 2002:a63:f441:: with SMTP id p1mr15349274pgk.362.1573260040059;
        Fri, 08 Nov 2019 16:40:40 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y36sm6681461pgk.66.2019.11.08.16.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 16:40:39 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v2 2/2] remoteproc: qcom_q6v5_mss: Validate each segment during loading
Date:   Fri,  8 Nov 2019 16:40:33 -0800
Message-Id: <20191109004033.1496871-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191109004033.1496871-1-bjorn.andersson@linaro.org>
References: <20191109004033.1496871-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The code used to sync with the MBA after each segment loaded and this is
still what's done downstream. So reduce the delta towards downstream by
switching to a model where the content is iteratively validated.

Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Tested-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Picked up Jeff's r-b and t-b

 drivers/remoteproc/qcom_q6v5_mss.c | 76 ++++++++++++++++++++----------
 1 file changed, 51 insertions(+), 25 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index efab574b2e12..914d5546e1cf 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -358,23 +358,29 @@ static void q6v5_pds_disable(struct q6v5 *qproc, struct device **pds,
 }
 
 static int q6v5_xfer_mem_ownership(struct q6v5 *qproc, int *current_perm,
-				   bool remote_owner, phys_addr_t addr,
+				   bool local, bool remote, phys_addr_t addr,
 				   size_t size)
 {
-	struct qcom_scm_vmperm next;
+	struct qcom_scm_vmperm next[2];
+	int perms = 0;
 
 	if (!qproc->need_mem_protection)
 		return 0;
-	if (remote_owner && *current_perm == BIT(QCOM_SCM_VMID_MSS_MSA))
-		return 0;
-	if (!remote_owner && *current_perm == BIT(QCOM_SCM_VMID_HLOS))
-		return 0;
 
-	next.vmid = remote_owner ? QCOM_SCM_VMID_MSS_MSA : QCOM_SCM_VMID_HLOS;
-	next.perm = remote_owner ? QCOM_SCM_PERM_RW : QCOM_SCM_PERM_RWX;
+	if (local) {
+		next[perms].vmid = QCOM_SCM_VMID_HLOS;
+		next[perms].perm = QCOM_SCM_PERM_RWX;
+		perms++;
+	}
+
+	if (remote) {
+		next[perms].vmid = QCOM_SCM_VMID_MSS_MSA;
+		next[perms].perm = QCOM_SCM_PERM_RW;
+		perms++;
+	}
 
 	return qcom_scm_assign_mem(addr, ALIGN(size, SZ_4K),
-				   current_perm, &next, 1);
+				   current_perm, next, perms);
 }
 
 static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
@@ -681,7 +687,7 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
 
 	/* Hypervisor mapping to access metadata by modem */
 	mdata_perm = BIT(QCOM_SCM_VMID_HLOS);
-	ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, true, phys, size);
+	ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, false, true, phys, size);
 	if (ret) {
 		dev_err(qproc->dev,
 			"assigning Q6 access to metadata failed: %d\n", ret);
@@ -699,7 +705,7 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
 		dev_err(qproc->dev, "MPSS header authentication failed: %d\n", ret);
 
 	/* Metadata authentication done, remove modem access */
-	xferop_ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, false, phys, size);
+	xferop_ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, true, false, phys, size);
 	if (xferop_ret)
 		dev_warn(qproc->dev,
 			 "mdt buffer not reclaimed system may become unstable\n");
@@ -786,7 +792,7 @@ static int q6v5_mba_load(struct q6v5 *qproc)
 	}
 
 	/* Assign MBA image access in DDR to q6 */
-	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true,
+	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, false, true,
 				      qproc->mba_phys, qproc->mba_size);
 	if (ret) {
 		dev_err(qproc->dev,
@@ -820,8 +826,8 @@ static int q6v5_mba_load(struct q6v5 *qproc)
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
 
 reclaim_mba:
-	xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, false,
-						qproc->mba_phys,
+	xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true,
+						false, qproc->mba_phys,
 						qproc->mba_size);
 	if (xfermemop_ret) {
 		dev_err(qproc->dev,
@@ -888,7 +894,7 @@ static void q6v5_mba_reclaim(struct q6v5 *qproc)
 	/* In case of failure or coredump scenario where reclaiming MBA memory
 	 * could not happen reclaim it here.
 	 */
-	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, false,
+	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true, false,
 				      qproc->mba_phys,
 				      qproc->mba_size);
 	WARN_ON(ret);
@@ -915,6 +921,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 	phys_addr_t boot_addr;
 	phys_addr_t min_addr = PHYS_ADDR_MAX;
 	phys_addr_t max_addr = 0;
+	u32 code_length;
 	bool relocate = false;
 	char *fw_name;
 	size_t fw_name_len;
@@ -965,9 +972,19 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 	}
 
 	/* Try to reset ownership back to Linux */
-	q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, false,
+	q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, true, false,
 				qproc->mpss_phys, qproc->mpss_size);
 
+	/* Share ownership between Linux and MSS, during segment loading */
+	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, true, true,
+				      qproc->mpss_phys, qproc->mpss_size);
+	if (ret) {
+		dev_err(qproc->dev,
+			"assigning Q6 access to mpss memory failed: %d\n", ret);
+		ret = -EAGAIN;
+		goto release_firmware;
+	}
+
 	mpss_reloc = relocate ? min_addr : qproc->mpss_phys;
 	qproc->mpss_reloc = mpss_reloc;
 	/* Load firmware segments */
@@ -1016,10 +1033,24 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 			       phdr->p_memsz - phdr->p_filesz);
 		}
 		size += phdr->p_memsz;
+
+		code_length = readl(qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
+		if (!code_length) {
+			boot_addr = relocate ? qproc->mpss_phys : min_addr;
+			writel(boot_addr, qproc->rmb_base + RMB_PMI_CODE_START_REG);
+			writel(RMB_CMD_LOAD_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
+		}
+		writel(size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
+
+		ret = readl(qproc->rmb_base + RMB_MBA_STATUS_REG);
+		if (ret < 0) {
+			dev_err(qproc->dev, "MPSS authentication failed: %d\n", ret);
+			goto release_firmware;
+		}
 	}
 
 	/* Transfer ownership of modem ddr region to q6 */
-	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, true,
+	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, false, true,
 				      qproc->mpss_phys, qproc->mpss_size);
 	if (ret) {
 		dev_err(qproc->dev,
@@ -1028,11 +1059,6 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 		goto release_firmware;
 	}
 
-	boot_addr = relocate ? qproc->mpss_phys : min_addr;
-	writel(boot_addr, qproc->rmb_base + RMB_PMI_CODE_START_REG);
-	writel(RMB_CMD_LOAD_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
-	writel(size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
-
 	ret = q6v5_rmb_mba_wait(qproc, RMB_MBA_AUTH_COMPLETE, 10000);
 	if (ret == -ETIMEDOUT)
 		dev_err(qproc->dev, "MPSS authentication timed out\n");
@@ -1061,7 +1087,7 @@ static void qcom_q6v5_dump_segment(struct rproc *rproc,
 		ret = q6v5_mba_load(qproc);
 
 		/* Try to reset ownership back to Linux */
-		q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, false,
+		q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, true, false,
 					qproc->mpss_phys, qproc->mpss_size);
 	}
 
@@ -1101,8 +1127,8 @@ static int q6v5_start(struct rproc *rproc)
 		goto reclaim_mpss;
 	}
 
-	xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, false,
-						qproc->mba_phys,
+	xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true,
+						false, qproc->mba_phys,
 						qproc->mba_size);
 	if (xfermemop_ret)
 		dev_err(qproc->dev,
-- 
2.23.0

