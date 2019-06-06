Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14F7F3783C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2019 17:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729156AbfFFPiu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jun 2019 11:38:50 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:47922 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729137AbfFFPit (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jun 2019 11:38:49 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x56FVgpD018120;
        Thu, 6 Jun 2019 17:38:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=0pAtotSJEz0Oq/4HijmUh/DcrMTc2nG2Sv62SxAD2VI=;
 b=LwP8SIjFnyThM2xV6pxcguKkhdQw8+gNWiDZqb1wkpIKecKY5aRfxv/brHabnorZwefm
 CE0aM4SWpdEaX3ayjsQ+3HQW/AnSuL8APjwtK3immLwl2cDmDeqwNA7Eg5FYKFCYZlHu
 nqfv/ns/BTlMZSghUVRqj4RhrSDM5szN8A/a/CkOffU+kvp8FLvjtAPA3txZ7S4LyRWA
 nT60t89Cd9W3eRtHEHUIeO6VJ9tm2aB03B87STrwQzioiv17+hWfcZjwpbb3d9IBvgRj
 dUQd5EFVNBuQnhBrjrhOJcQ2OGlozfDCegkOA2GKf4xRGeJotUyQSDxv580a7ilDhAr6 QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2sxqycv5v8-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Thu, 06 Jun 2019 17:38:47 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A8BF23A;
        Thu,  6 Jun 2019 15:38:46 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8160D2A49;
        Thu,  6 Jun 2019 15:38:46 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 6 Jun 2019
 17:38:46 +0200
Received: from localhost (10.48.0.131) by webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 6 Jun 2019 17:38:45 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@st.com>
Subject: [PATCH] remoteproc: debug: fix va dump format in carveout list
Date:   Thu, 6 Jun 2019 17:38:39 +0200
Message-ID: <1559835519-8165-1-git-send-email-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.48.0.131]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-06-06_11:,,
 signatures=0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Standardize dump presentation for va, dma and da dumps by adding
"0x" prefix for virtual address.

Fixes: 276ec9934231("remoteproc: replace "%p" with "%pK"")

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index 6da934b8dc4b..91d3a75f0b41 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -298,7 +298,7 @@ static int rproc_carveouts_show(struct seq_file *seq, void *p)
 	list_for_each_entry(carveout, &rproc->carveouts, node) {
 		seq_puts(seq, "Carveout memory entry:\n");
 		seq_printf(seq, "\tName: %s\n", carveout->name);
-		seq_printf(seq, "\tVirtual address: %pK\n", carveout->va);
+		seq_printf(seq, "\tVirtual address: 0x%pK\n", carveout->va);
 		seq_printf(seq, "\tDMA address: %pad\n", &carveout->dma);
 		seq_printf(seq, "\tDevice address: 0x%x\n", carveout->da);
 		seq_printf(seq, "\tLength: 0x%x Bytes\n\n", carveout->len);
-- 
2.7.4

