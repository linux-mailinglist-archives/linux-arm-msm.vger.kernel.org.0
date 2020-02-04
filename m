Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94DDA151FC1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 18:44:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727466AbgBDRoY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 12:44:24 -0500
Received: from zimbra2.kalray.eu ([92.103.151.219]:55282 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727392AbgBDRoY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 12:44:24 -0500
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 1A23327E058F;
        Tue,  4 Feb 2020 18:44:22 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id Ys8Ffw7v27r6; Tue,  4 Feb 2020 18:44:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id C1C4227E158A;
        Tue,  4 Feb 2020 18:44:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu C1C4227E158A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1580838261;
        bh=bHc8ecf+O1GHjcUaIbdPBRw5CR726pP6ptPTXIyMhg0=;
        h=From:To:Date:Message-Id;
        b=JSngqOY3TgTe/kh+Rip/yR8PGrKQ9/gorw3B3e/Ho8DDu4cNz/+18TV+4crNZDs8P
         Z25QO+vKUa6R2mZvYSLNCeklUedzIWCKptn1/L3mY6zwBrEZJRV7FhXF0R9CBdoUA7
         GXJ2hgLiTOeuxntW2CbTZ8jXti+NzN7rqN+v5gVs=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id ak2UB6XEtKtu; Tue,  4 Feb 2020 18:44:21 +0100 (CET)
Received: from triton.lin.mbt.kalray.eu (unknown [192.168.37.25])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id A45BE27E058F;
        Tue,  4 Feb 2020 18:44:21 +0100 (CET)
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
Subject: [PATCH v3 0/2] remoteproc: Add elf64 support to elf loader
Date:   Tue,  4 Feb 2020 18:44:10 +0100
Message-Id: <20200204174412.16814-1-cleger@kalray.eu>
X-Mailer: git-send-email 2.15.0.276.g89ea799
In-Reply-To: <20200129163013.GA16538@xps15>
References: <20200129163013.GA16538@xps15>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This serie add support for elf64 in remoteproc elf loader. 
First patch modifies the type of len argument (in da_to_va) in order
to allow loading elf64 segment with a u64 size.
Second patch is the actual modification in the elf loader to support
elf64 type by using a set of generic macros.

Changes from V2:
 - da_to_va len type changed from int to u64
 - Add check for elf64 header size
 - Add comments for name table parsing
 - Fix typo in "accommodate"

Clement Leger (2):
  remoteproc: Use u64 len for da_to_va
  remoteproc: Add elf64 support in elf loader

 Documentation/remoteproc.txt               |   2 +-
 drivers/remoteproc/imx_rproc.c             |   9 +-
 drivers/remoteproc/keystone_remoteproc.c   |   2 +-
 drivers/remoteproc/qcom_q6v5_adsp.c        |   2 +-
 drivers/remoteproc/qcom_q6v5_mss.c         |   2 +-
 drivers/remoteproc/qcom_q6v5_pas.c         |   2 +-
 drivers/remoteproc/qcom_q6v5_wcss.c        |   2 +-
 drivers/remoteproc/qcom_wcnss.c            |   2 +-
 drivers/remoteproc/remoteproc_core.c       |   2 +-
 drivers/remoteproc/remoteproc_elf_loader.c | 147 ++++++++++++++++++-----------
 drivers/remoteproc/remoteproc_elf_loader.h |  69 ++++++++++++++
 drivers/remoteproc/remoteproc_internal.h   |   4 +-
 drivers/remoteproc/st_remoteproc.c         |   2 +-
 drivers/remoteproc/st_slim_rproc.c         |   4 +-
 drivers/remoteproc/wkup_m3_rproc.c         |   2 +-
 include/linux/remoteproc.h                 |   6 +-
 16 files changed, 184 insertions(+), 75 deletions(-)
 create mode 100644 drivers/remoteproc/remoteproc_elf_loader.h

-- 
2.15.0.276.g89ea799

