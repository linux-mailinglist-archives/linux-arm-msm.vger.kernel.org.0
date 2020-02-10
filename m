Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 974A7157FA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 17:24:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727895AbgBJQX6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 11:23:58 -0500
Received: from zimbra2.kalray.eu ([92.103.151.219]:58604 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727579AbgBJQX6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 11:23:58 -0500
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 4F5FD27E0658;
        Mon, 10 Feb 2020 17:23:56 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id ibnmg7bxNp1D; Mon, 10 Feb 2020 17:23:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id F170F27E079C;
        Mon, 10 Feb 2020 17:23:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu F170F27E079C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1581351836;
        bh=7i8uswkEMsftUzWNZaWpKTwl9chv4VQD7b+VNxGWpY0=;
        h=From:To:Date:Message-Id;
        b=qAhbOVR6uHF47yqt08wvNxUitSKT79LG9tDghJ9PGjGXVx3jVvVxOAH2ZwRgwnwbA
         7EMOxbbTOFsmJeca9Y+WZvQMqlik1PegV/cQQ/QWC3rZggzSuWNKYpE0sgf6jIqecm
         kOKedq+2K+ZoRRbJnzTPriuK0W/FKDPrBL0OAiaI=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id yPulY8mreZhE; Mon, 10 Feb 2020 17:23:55 +0100 (CET)
Received: from triton.lin.mbt.kalray.eu (unknown [192.168.37.25])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id D1B4627E0658;
        Mon, 10 Feb 2020 17:23:55 +0100 (CET)
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
Subject: [PATCH v4 0/5] remoteproc: Add elf64 support
Date:   Mon, 10 Feb 2020 17:22:04 +0100
Message-Id: <20200210162209.23149-1-cleger@kalray.eu>
X-Mailer: git-send-email 2.15.0.276.g89ea799
In-Reply-To: <527785289.2852303.1581062223707.JavaMail.zimbra@kalray.eu>
References: <527785289.2852303.1581062223707.JavaMail.zimbra@kalray.eu>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This serie add support for elf64 in remoteproc (elf loader, coredump). 
First two patches modifies the type of len argument (in da_to_va) and
boot_addr in order to allow loading elf64 segment with a u64 size
and a u64 entry point.
Next patch introduce a set of macros to access elf64 and elf32
transparently.
Last two patches are the actual modification in the elf loader and
remoteproc coredump support to add elf64 support.

Changes from V3:
 - Adapt coredump to elf64 file format
 - Rename remoteproc_elf_loader.h to remoteproc_elf_helpers.h
 - Update copyright year in remoteproc_elf_helpers.h
 - Rename macros elf_hdr_* to elf_get_hdr_* for coherency with elf_hdr_set_*
 - Split elf64 loader patch in 3:
   - boot_addr u64 change
   - remoteproc_elf_helpers.h creation
   - elf64 loading

Clement Leger (5):
  remoteproc: Use u64 len for da_to_va
  remoteproc: Use u64 type for boot_addr
  remoteproc: Add elf helpers to access elf64 and elf32 fields
  remoteproc: Add elf64 support in elf loader
  remoteproc: Adapt coredump to generate correct elf type

 Documentation/remoteproc.txt                |   2 +-
 drivers/remoteproc/imx_rproc.c              |  11 +-
 drivers/remoteproc/keystone_remoteproc.c    |   4 +-
 drivers/remoteproc/qcom_q6v5_adsp.c         |   2 +-
 drivers/remoteproc/qcom_q6v5_mss.c          |   2 +-
 drivers/remoteproc/qcom_q6v5_pas.c          |   2 +-
 drivers/remoteproc/qcom_q6v5_wcss.c         |   2 +-
 drivers/remoteproc/qcom_wcnss.c             |   2 +-
 drivers/remoteproc/remoteproc_core.c        |  69 +++++++------
 drivers/remoteproc/remoteproc_elf_helpers.h |  95 ++++++++++++++++++
 drivers/remoteproc/remoteproc_elf_loader.c  | 150 ++++++++++++++++++----------
 drivers/remoteproc/remoteproc_internal.h    |   4 +-
 drivers/remoteproc/st_remoteproc.c          |   2 +-
 drivers/remoteproc/st_slim_rproc.c          |   4 +-
 drivers/remoteproc/wkup_m3_rproc.c          |   4 +-
 include/linux/remoteproc.h                  |   7 +-
 16 files changed, 252 insertions(+), 110 deletions(-)
 create mode 100644 drivers/remoteproc/remoteproc_elf_helpers.h

-- 
2.15.0.276.g89ea799

