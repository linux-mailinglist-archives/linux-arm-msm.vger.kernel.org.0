Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF98175756
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2020 10:39:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727452AbgCBJjL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Mar 2020 04:39:11 -0500
Received: from zimbra2.kalray.eu ([92.103.151.219]:37840 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbgCBJjL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Mar 2020 04:39:11 -0500
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id DFC0727E0309;
        Mon,  2 Mar 2020 10:39:08 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id OVcSk0bXJ0zi; Mon,  2 Mar 2020 10:39:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 80F0327E035B;
        Mon,  2 Mar 2020 10:39:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 80F0327E035B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1583141948;
        bh=n+U0zthKoV9vrRbdzy8AknPEHik5gFzG6eQnzyz5s2k=;
        h=From:To:Date:Message-Id;
        b=Sc3D3SqeW7plv4WrSfNzAWIhpvFK7hxzJF36qsG0FzoYMvQythy8CoI2RrYGSAEwI
         kPzXgmekb2/OW4tqHVkriC6nYghsufxECMDBTpHEq5leV3n4yNTHSpb68WE9xEzaK/
         DDXYX8R6UMxh+thY5o4RzfDdS5A49m5ayjcIlWLU=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id H2qCIA2D7NYT; Mon,  2 Mar 2020 10:39:08 +0100 (CET)
Received: from triton.lin.mbt.kalray.eu (unknown [192.168.37.25])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id 56C0A27E0309;
        Mon,  2 Mar 2020 10:39:08 +0100 (CET)
From:   Clement Leger <cleger@kalray.eu>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-remoteproc@vger.kernel.org
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Loic PALLARDY <loic.pallardy@st.com>, s-anna <s-anna@ti.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Clement Leger <cleger@kalray.eu>
Subject: [PATCH v5 0/8] remoteproc: Add elf64 support
Date:   Mon,  2 Mar 2020 10:38:54 +0100
Message-Id: <20200302093902.27849-1-cleger@kalray.eu>
X-Mailer: git-send-email 2.15.0.276.g89ea799
In-Reply-To: <20200210162209.23149-1-cleger@kalray.eu>
References: <20200210162209.23149-1-cleger@kalray.eu>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This serie add support for elf64 in remoteproc (elf loader, coredump). 
First three patches modifies the type of len argument (in da_to_va),
boot_addr and rproc_mem_entry len field in order to allow loading elf64
segment with a u64 size and a u64 entry point.
Next patches introduce a set of macros to access elf64 and elf32
transparently.
Last patches are the actual modifications in the elf loader and
remoteproc coredump support to add elf64 support.

Changes v4 -> v5:
 - Add rproc_elf_sanity_check renaming to rproc_elf32_sanity_check
 - Fix checkpatch warning on > 80 column line
 - Change u64 len type for size_t in da_to_va and add checks in loader
 - Modify rproc_mem_entry size field type from int to size_t
 - Add a patch to override sanity_check function

Changes v3 -> v4:
 - Adapt coredump to elf64 file format
 - Rename remoteproc_elf_loader.h to remoteproc_elf_helpers.h
 - Update copyright year in remoteproc_elf_helpers.h
 - Rename macros elf_hdr_* to elf_get_hdr_* for coherency with elf_hdr_set_*
 - Split elf64 loader patch in 3:
   - boot_addr u64 change
   - remoteproc_elf_helpers.h creation
   - elf64 loading

Changes v2 -> v3:
 - da_to_va len type changed from int to u64
 - Add check for elf64 header size
 - Add comments for name table parsing
 - Fix typo in "accommodate
 - Add ELF64 support in documentation

Clement Leger (8):
  remoteproc: Use size_t type for len in da_to_va
  remoteproc: Use size_t instead of int for rproc_mem_entry len
  remoteproc: Use u64 type for boot_addr
  remoteproc: Add elf helpers to access elf64 and elf32 fields
  remoteproc: Rename rproc_elf_sanity_check for elf32
  remoteproc: Add elf64 support in elf loader
  remoteproc: Allow overriding only sanity_check
  remoteproc: Adapt coredump to generate correct elf type

 Documentation/remoteproc.txt                |   2 +-
 drivers/remoteproc/imx_rproc.c              |  11 +-
 drivers/remoteproc/keystone_remoteproc.c    |   4 +-
 drivers/remoteproc/qcom_q6v5_adsp.c         |   2 +-
 drivers/remoteproc/qcom_q6v5_mss.c          |   2 +-
 drivers/remoteproc/qcom_q6v5_pas.c          |   2 +-
 drivers/remoteproc/qcom_q6v5_wcss.c         |   2 +-
 drivers/remoteproc/qcom_wcnss.c             |   2 +-
 drivers/remoteproc/remoteproc_core.c        |  86 +++++++------
 drivers/remoteproc/remoteproc_debugfs.c     |   2 +-
 drivers/remoteproc/remoteproc_elf_helpers.h |  96 ++++++++++++++
 drivers/remoteproc/remoteproc_elf_loader.c  | 189 +++++++++++++++++++---------
 drivers/remoteproc/remoteproc_internal.h    |  14 ++-
 drivers/remoteproc/st_remoteproc.c          |   4 +-
 drivers/remoteproc/st_slim_rproc.c          |   6 +-
 drivers/remoteproc/stm32_rproc.c            |   2 +-
 drivers/remoteproc/wkup_m3_rproc.c          |   4 +-
 include/linux/remoteproc.h                  |  13 +-
 18 files changed, 317 insertions(+), 126 deletions(-)
 create mode 100644 drivers/remoteproc/remoteproc_elf_helpers.h

-- 
2.15.0.276.g89ea799

