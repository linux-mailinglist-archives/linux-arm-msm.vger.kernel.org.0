Return-Path: <linux-arm-msm+bounces-85126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F90CBA1EE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 01:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1791B300D677
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 00:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F26D21CC62;
	Sat, 13 Dec 2025 00:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0l5qgOjL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4120F1C84D7
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 00:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765586175; cv=none; b=UNLBoDgCin6CfkuDddzebM3M8YGyLN/zk5GEzOYecb+YwE3P/rhbJrpB566tZVdf6j3qnj0G1L9EpDJb9wNUvWFzNkFSvKsdilD2cRRq2VMKfFjdmpSFT6Wcyy1/XlWvL5gejboeIZNx6QM2+Th5f1hIQE3i1zDvgQIhl151r6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765586175; c=relaxed/simple;
	bh=obJeW+yR8v5oV+R7HwlGldU5VTZhgJUm/Wkxg+dV8rA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=RfElPNOnuMqSNpnMY8vWDQ8SV5GYcg2eziZJPQb8pr1LfZFkbR4bfjUZmFWqogoNdLuyUZWoa6zpQgUacckk1So1JfU8fCgSOQW7SvGP6Bx+GwaICBckKviq86Sno1de6EjKr0oyZu+Bx8coPma0BuB8WUq4WeovWB2MA6xfUEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0l5qgOjL; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c0bead25feeso1466267a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 16:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765586169; x=1766190969; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y304Om/Rs6KWkLyCesTTtwlzminlNXBQ0TRY3rgTYW8=;
        b=0l5qgOjLYp8ftSC6yYDqBx629VEZOmYCZZRRTkF3huDnELuHSZyycO4HQId6B2jYiv
         7yHRuFTFG/UK3eLU9bo3xxPfj+cow9q5CAOhroM4tknwvUc8Q7gwApibiu282QCA7vf7
         u1x/dIjUqAoVdQAWGOEcbws75lULAhMDYuXDlcPAYiE4ZoUj4la27yr0MIRR8IdLDFWo
         6e1TvqErVX0bayi+5McWnt/tWrVpRCk26zun9Yrx5RN5e5NC+ASSatVigjH2lrrABu/d
         faP6Yl4esnoZ2jrNb/OgK2+uoMQFoZQljQyEPtQgHtRiKIbvsafKMD6ZPyT4NqSNCxDF
         te8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765586169; x=1766190969;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y304Om/Rs6KWkLyCesTTtwlzminlNXBQ0TRY3rgTYW8=;
        b=rU2R/ANEE3e3qsGWstAa2up5/F601+citlk9QZOSqPtGr8uh2XnKaxSVHKlJgcStRr
         hodCqYdYexXb7t9rKN5epNpbQSGtqzDDl9yRBmD2DwCGT4HNc0YnW9wL6e55BIYmHinA
         dMoftgb+mVGjpVylGfB1OhkTJEHS9m2Pb+GSbfzvMQ0aNr6Lh0dYRRZMcgAMvyByscH2
         5eer2r0wDjL1RKTFpd6UYbIJp26apY/ZOrQ8PR4XIyZfGVdTdzJ+X07Yct54onYpwAFm
         qt12I1p+nA5lavJXo5p1EEhDCXKflibAtmmOyV2x2ik2ueTVeEcn2tM/vC2fuBkXlkmV
         LRQw==
X-Forwarded-Encrypted: i=1; AJvYcCVlEuDoeOLS0u6xtYt/Zy4o7Qhv6R7TO+Z/zZ5UQDruxmmlcVumMCJPePR2c4CMuTQqGQWrqVmkiEPPnoO/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/+l7Z5nUUukwHOQcz5vwOvaAMPhNfRtqTB70zNT/h48QEQvYk
	BvbCZH7JNRqASNWYJ2bJJK3KYiMjSb+qb0T4Ji+X6RwcomR2ZB46Z4GSukEFp1COGlYop/9M/l2
	ZHgpHUNKMFw==
X-Google-Smtp-Source: AGHT+IFCjAocyQLdypiIE/9dmNf64LiYFy8Sy7KhvYXdM2iXkpMoERdoj6YCW2K6aAkKHZxqRehTIgv0reJ/
X-Received: from dycpg3.prod.google.com ([2002:a05:7300:dd03:b0:2a2:2846:c507])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:102:b0:2a4:3593:466c
 with SMTP id 5a478bee46e88-2ac301da803mr2217970eec.8.1765586169321; Fri, 12
 Dec 2025 16:36:09 -0800 (PST)
Date: Sat, 13 Dec 2025 00:36:00 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPC0PGkC/3WPy4oCMRBFf6Wp9RSkIpq2twN+gFtxkUe11qITT
 aIo4r8bZhpx4/LW5RzqPqBwFi4wdA/IfJUiKbZAPx34o40HRgktg1Z6SUqv8ezThCV5iWPC0C9
 6480YHHloyCnzKLc/3Q62m1/Y/x8zny9NXefmbR66t7cp0UkMEg8F106ZBTkfHIfhSvD5zQdjQ
 0CONafTHcelYdLsmEh9QTRprNnGMl0qY2/dSpmVUcr2M+BsYWz7JqlDF/lWceYU7J/PF/ND3WE sAQAA
X-Change-Id: 20251029-qcom-socinfo-d8387c7fdb1c
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765586168; l=63340;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=obJeW+yR8v5oV+R7HwlGldU5VTZhgJUm/Wkxg+dV8rA=; b=UTu518EXI8YakzV105CuxhNjr3jWcxuVOzw8APTeV+rC4XFugKpLp4/um5tmA4HOWvGfYsFib
 nRR5RHw8V1iAhhfqUUDDQufPtuvbVo71MlKD7BOB5C0Q2ojhz6KjeXP
X-Mailer: b4 0.14.2
Message-ID: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com>
Subject: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
From: Matthew Maurer <mmaurer@google.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Re-implements qcom-socinfo driver in Rust, using `Scoped`-based DebugFS
bindings.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
This patch converts the QC socinfo driver to Rust, intended to be the
first Rust driver in Android that is owned by a vendor rather than the
platform.

This driver is currently quirk-compatible in DebugFS-exported values. If
the maintainers do not believe that maintaining the exact formats is a
benefit, we could simplify the code further by dropping some of the
custom formatting functions used to match the output.

I sent an earlier draft of this privately a while back that was much
rougher, but didn't get much feedback.

Now that we've got all the interfaces we need for this driver reasonably
available (DebugFS was the one that took a bit here), I wanted to bring
it up again, this time as an RFC. With the new features, the only place
it needs `unsafe` is to define an abstraction over `qcom_get_smem`.

I have tested this on a SM8650-HDK by diffing the contents of the
exported DebugFS and examining the files under /sys/bus/soc/devices/soc0

While I believe I have everything correctly exported via DebugFS, I have
not checked equivalence across a large swath of devices, only the one.
---
 drivers/soc/qcom/Kconfig             |   1 +
 drivers/soc/qcom/Makefile            |   2 +-
 drivers/soc/qcom/socinfo.c           | 931 -----------------------------------
 drivers/soc/qcom/socinfo/Makefile    |   2 +
 drivers/soc/qcom/socinfo/bindings.rs |  59 +++
 drivers/soc/qcom/socinfo/data.rs     | 424 ++++++++++++++++
 drivers/soc/qcom/socinfo/socinfo.rs  | 362 ++++++++++++++
 rust/bindgen_parameters              |   1 +
 rust/bindings/bindings_helper.h      |   6 +
 9 files changed, 856 insertions(+), 932 deletions(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 2caadbbcf8307ff94f5afbdd1481e5e5e291749f..16d553f66f0cf1101d3a8c7d401d7c4d6a65dac7 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -222,6 +222,7 @@ config QCOM_SMSM
 config QCOM_SOCINFO
 	tristate "Qualcomm socinfo driver"
 	depends on QCOM_SMEM
+	depends on RUST
 	select SOC_BUS
 	help
 	 Say yes here to support the Qualcomm socinfo driver, providing
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index b7f1d2a5736748b8772c090fd24462fa91f321c6..6f6688c76a00a91ce99600f298a8e6e0fefed806 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -28,7 +28,7 @@ obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
 CFLAGS_smp2p.o := -I$(src)
 obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
 obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
-obj-$(CONFIG_QCOM_SOCINFO)	+= socinfo.o
+obj-$(CONFIG_QCOM_SOCINFO)	+= socinfo/
 obj-$(CONFIG_QCOM_SPM)		+= spm.o
 obj-$(CONFIG_QCOM_STATS)	+= qcom_stats.o
 obj-$(CONFIG_QCOM_WCNSS_CTRL) += wcnss_ctrl.o
diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
deleted file mode 100644
index 003a2304d535c2655db566c644342dbc387e24a9..0000000000000000000000000000000000000000
--- a/drivers/soc/qcom/socinfo.c
+++ /dev/null
@@ -1,931 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (c) 2009-2017, The Linux Foundation. All rights reserved.
- * Copyright (c) 2017-2019, Linaro Ltd.
- */
-
-#include <linux/debugfs.h>
-#include <linux/err.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/random.h>
-#include <linux/slab.h>
-#include <linux/soc/qcom/smem.h>
-#include <linux/soc/qcom/socinfo.h>
-#include <linux/string.h>
-#include <linux/stringify.h>
-#include <linux/sys_soc.h>
-#include <linux/types.h>
-
-#include <linux/unaligned.h>
-
-#include <dt-bindings/arm/qcom,ids.h>
-
-/* Helper macros to create soc_id table */
-#define qcom_board_id(id) QCOM_ID_ ## id, __stringify(id)
-#define qcom_board_id_named(id, name) QCOM_ID_ ## id, (name)
-
-#ifdef CONFIG_DEBUG_FS
-#define SMEM_IMAGE_VERSION_BLOCKS_COUNT        32
-#define SMEM_IMAGE_VERSION_SIZE                4096
-#define SMEM_IMAGE_VERSION_NAME_SIZE           75
-#define SMEM_IMAGE_VERSION_VARIANT_SIZE        20
-#define SMEM_IMAGE_VERSION_OEM_SIZE            32
-
-/*
- * SMEM Image table indices
- */
-#define SMEM_IMAGE_TABLE_BOOT_INDEX     0
-#define SMEM_IMAGE_TABLE_TZ_INDEX       1
-#define SMEM_IMAGE_TABLE_TZSECAPP_INDEX	2
-#define SMEM_IMAGE_TABLE_RPM_INDEX      3
-#define SMEM_IMAGE_TABLE_SDI_INDEX      4
-#define SMEM_IMAGE_TABLE_HYP_INDEX      5
-#define SMEM_IMAGE_TABLE_ADSP1_INDEX	6
-#define SMEM_IMAGE_TABLE_ADSP2_INDEX	7
-#define SMEM_IMAGE_TABLE_CDSP2_INDEX	8
-#define SMEM_IMAGE_TABLE_APPSBL_INDEX	9
-#define SMEM_IMAGE_TABLE_APPS_INDEX     10
-#define SMEM_IMAGE_TABLE_MPSS_INDEX     11
-#define SMEM_IMAGE_TABLE_ADSP_INDEX     12
-#define SMEM_IMAGE_TABLE_CNSS_INDEX     13
-#define SMEM_IMAGE_TABLE_VIDEO_INDEX    14
-#define SMEM_IMAGE_TABLE_DSPS_INDEX     15
-#define SMEM_IMAGE_TABLE_CDSP_INDEX     16
-#define SMEM_IMAGE_TABLE_NPU_INDEX	17
-#define SMEM_IMAGE_TABLE_WPSS_INDEX     18
-#define SMEM_IMAGE_TABLE_CDSP1_INDEX    19
-#define SMEM_IMAGE_TABLE_GPDSP_INDEX    20
-#define SMEM_IMAGE_TABLE_GPDSP1_INDEX   21
-#define SMEM_IMAGE_TABLE_SENSORPD_INDEX	22
-#define SMEM_IMAGE_TABLE_AUDIOPD_INDEX	23
-#define SMEM_IMAGE_TABLE_OEMPD_INDEX	24
-#define SMEM_IMAGE_TABLE_CHARGERPD_INDEX	25
-#define SMEM_IMAGE_TABLE_OISPD_INDEX	26
-#define SMEM_IMAGE_TABLE_SOCCP_INDEX	27
-#define SMEM_IMAGE_TABLE_TME_INDEX	28
-#define SMEM_IMAGE_TABLE_GEARVM_INDEX	29
-#define SMEM_IMAGE_TABLE_UEFI_INDEX	30
-#define SMEM_IMAGE_TABLE_CDSP3_INDEX	31
-#define SMEM_IMAGE_TABLE_AUDIOPD_ADSP1_INDEX	32
-#define SMEM_IMAGE_TABLE_AUDIOPD_ADSP2_INDEX	33
-#define SMEM_IMAGE_TABLE_DCP_INDEX	34
-#define SMEM_IMAGE_TABLE_OOBS_INDEX	35
-#define SMEM_IMAGE_TABLE_OOBNS_INDEX	36
-#define SMEM_IMAGE_TABLE_DEVCFG_INDEX	37
-#define SMEM_IMAGE_TABLE_BTPD_INDEX	38
-#define SMEM_IMAGE_TABLE_QECP_INDEX	39
-
-#define SMEM_IMAGE_VERSION_TABLE       469
-#define SMEM_IMAGE_VERSION_TABLE_2	667
-
-/*
- * SMEM Image table names
- */
-static const char *const socinfo_image_names[] = {
-	[SMEM_IMAGE_TABLE_ADSP1_INDEX] = "adsp1",
-	[SMEM_IMAGE_TABLE_ADSP2_INDEX] = "adsp2",
-	[SMEM_IMAGE_TABLE_ADSP_INDEX] = "adsp",
-	[SMEM_IMAGE_TABLE_APPSBL_INDEX] = "appsbl",
-	[SMEM_IMAGE_TABLE_APPS_INDEX] = "apps",
-	[SMEM_IMAGE_TABLE_AUDIOPD_INDEX] = "audiopd",
-	[SMEM_IMAGE_TABLE_AUDIOPD_ADSP1_INDEX] = "audiopd_adsp1",
-	[SMEM_IMAGE_TABLE_AUDIOPD_ADSP2_INDEX] = "audiopd_adsp2",
-	[SMEM_IMAGE_TABLE_BOOT_INDEX] = "boot",
-	[SMEM_IMAGE_TABLE_BTPD_INDEX] = "btpd",
-	[SMEM_IMAGE_TABLE_CDSP1_INDEX] = "cdsp1",
-	[SMEM_IMAGE_TABLE_CDSP2_INDEX] = "cdsp2",
-	[SMEM_IMAGE_TABLE_CDSP3_INDEX] = "cdsp3",
-	[SMEM_IMAGE_TABLE_CDSP_INDEX] = "cdsp",
-	[SMEM_IMAGE_TABLE_CHARGERPD_INDEX] = "chargerpd",
-	[SMEM_IMAGE_TABLE_CNSS_INDEX] = "cnss",
-	[SMEM_IMAGE_TABLE_DCP_INDEX] = "dcp",
-	[SMEM_IMAGE_TABLE_DEVCFG_INDEX] = "devcfg",
-	[SMEM_IMAGE_TABLE_DSPS_INDEX] = "dsps",
-	[SMEM_IMAGE_TABLE_GEARVM_INDEX] = "gearvm",
-	[SMEM_IMAGE_TABLE_GPDSP1_INDEX] = "gpdsp1",
-	[SMEM_IMAGE_TABLE_GPDSP_INDEX] = "gpdsp",
-	[SMEM_IMAGE_TABLE_HYP_INDEX] = "hyp",
-	[SMEM_IMAGE_TABLE_MPSS_INDEX] = "mpss",
-	[SMEM_IMAGE_TABLE_NPU_INDEX] = "npu",
-	[SMEM_IMAGE_TABLE_OEMPD_INDEX] = "oempd",
-	[SMEM_IMAGE_TABLE_OISPD_INDEX] = "oispd",
-	[SMEM_IMAGE_TABLE_OOBNS_INDEX] = "oobns",
-	[SMEM_IMAGE_TABLE_OOBS_INDEX] = "oobs",
-	[SMEM_IMAGE_TABLE_QECP_INDEX] = "qecp",
-	[SMEM_IMAGE_TABLE_RPM_INDEX] = "rpm",
-	[SMEM_IMAGE_TABLE_SDI_INDEX] = "sdi",
-	[SMEM_IMAGE_TABLE_SENSORPD_INDEX] = "sensorpd",
-	[SMEM_IMAGE_TABLE_SOCCP_INDEX] = "soccp",
-	[SMEM_IMAGE_TABLE_TME_INDEX] = "tme",
-	[SMEM_IMAGE_TABLE_TZ_INDEX] = "tz",
-	[SMEM_IMAGE_TABLE_TZSECAPP_INDEX] = "tzsecapp",
-	[SMEM_IMAGE_TABLE_UEFI_INDEX] = "uefi",
-	[SMEM_IMAGE_TABLE_VIDEO_INDEX] = "video",
-	[SMEM_IMAGE_TABLE_WPSS_INDEX] = "wpss",
-};
-
-static const char *const pmic_models[] = {
-	[0]  = "Unknown PMIC model",
-	[1]  = "PM8941",
-	[2]  = "PM8841",
-	[3]  = "PM8019",
-	[4]  = "PM8226",
-	[5]  = "PM8110",
-	[6]  = "PMA8084",
-	[7]  = "PMI8962",
-	[8]  = "PMD9635",
-	[9]  = "PM8994",
-	[10] = "PMI8994",
-	[11] = "PM8916",
-	[12] = "PM8004",
-	[13] = "PM8909/PM8058",
-	[14] = "PM8028",
-	[15] = "PM8901",
-	[16] = "PM8950/PM8027",
-	[17] = "PMI8950/ISL9519",
-	[18] = "PMK8001/PM8921",
-	[19] = "PMI8996/PM8018",
-	[20] = "PM8998/PM8015",
-	[21] = "PMI8998/PM8014",
-	[22] = "PM8821",
-	[23] = "PM8038",
-	[24] = "PM8005/PM8922",
-	[25] = "PM8917/PM8937",
-	[26] = "PM660L",
-	[27] = "PM660",
-	[30] = "PM8150",
-	[31] = "PM8150L",
-	[32] = "PM8150B",
-	[33] = "PMK8002",
-	[36] = "PM8009",
-	[37] = "PMI632",
-	[38] = "PM8150C",
-	[40] = "PM6150",
-	[41] = "SMB2351",
-	[44] = "PM8008",
-	[45] = "PM6125",
-	[46] = "PM7250B",
-	[47] = "PMK8350",
-	[48] = "PM8350",
-	[49] = "PM8350C",
-	[50] = "PM8350B",
-	[51] = "PMR735A",
-	[52] = "PMR735B",
-	[54] = "PM6350",
-	[55] = "PM4125",
-	[58] = "PM8450",
-	[65] = "PM8010",
-	[69] = "PM8550VS",
-	[70] = "PM8550VE",
-	[71] = "PM8550B",
-	[72] = "PMR735D",
-	[73] = "PM8550",
-	[74] = "PMK8550",
-	[78] = "PMM8650AU",
-	[79] = "PMM8650AU_PSAIL",
-	[80] = "PM7550",
-	[82] = "PMC8380",
-	[83] = "SMB2360",
-	[91] = "PMIV0108",
-};
-
-struct socinfo_params {
-	u32 raw_device_family;
-	u32 hw_plat_subtype;
-	u32 accessory_chip;
-	u32 raw_device_num;
-	u32 chip_family;
-	u32 foundry_id;
-	u32 plat_ver;
-	u32 raw_ver;
-	u32 hw_plat;
-	u32 fmt;
-	u32 nproduct_id;
-	u32 num_clusters;
-	u32 ncluster_array_offset;
-	u32 num_subset_parts;
-	u32 nsubset_parts_array_offset;
-	u32 nmodem_supported;
-	u32 feature_code;
-	u32 pcode;
-	u32 oem_variant;
-	u32 num_func_clusters;
-	u32 boot_cluster;
-	u32 boot_core;
-	u32 raw_package_type;
-};
-
-struct smem_image_version {
-	char name[SMEM_IMAGE_VERSION_NAME_SIZE];
-	char variant[SMEM_IMAGE_VERSION_VARIANT_SIZE];
-	char pad;
-	char oem[SMEM_IMAGE_VERSION_OEM_SIZE];
-};
-#endif /* CONFIG_DEBUG_FS */
-
-struct qcom_socinfo {
-	struct soc_device *soc_dev;
-	struct soc_device_attribute attr;
-#ifdef CONFIG_DEBUG_FS
-	struct dentry *dbg_root;
-	struct socinfo_params info;
-#endif /* CONFIG_DEBUG_FS */
-};
-
-struct soc_id {
-	unsigned int id;
-	const char *name;
-};
-
-static const struct soc_id soc_id[] = {
-	{ qcom_board_id(MSM8260) },
-	{ qcom_board_id(MSM8660) },
-	{ qcom_board_id(APQ8060) },
-	{ qcom_board_id(MSM8960) },
-	{ qcom_board_id(APQ8064) },
-	{ qcom_board_id(MSM8930) },
-	{ qcom_board_id(MSM8630) },
-	{ qcom_board_id(MSM8230) },
-	{ qcom_board_id(APQ8030) },
-	{ qcom_board_id(MSM8627) },
-	{ qcom_board_id(MSM8227) },
-	{ qcom_board_id(MSM8660A) },
-	{ qcom_board_id(MSM8260A) },
-	{ qcom_board_id(APQ8060A) },
-	{ qcom_board_id(MSM8974) },
-	{ qcom_board_id(MSM8225) },
-	{ qcom_board_id(MSM8625) },
-	{ qcom_board_id(MPQ8064) },
-	{ qcom_board_id(MSM8960AB) },
-	{ qcom_board_id(APQ8060AB) },
-	{ qcom_board_id(MSM8260AB) },
-	{ qcom_board_id(MSM8660AB) },
-	{ qcom_board_id(MSM8930AA) },
-	{ qcom_board_id(MSM8630AA) },
-	{ qcom_board_id(MSM8230AA) },
-	{ qcom_board_id(MSM8626) },
-	{ qcom_board_id(MSM8610) },
-	{ qcom_board_id(APQ8064AB) },
-	{ qcom_board_id(MSM8930AB) },
-	{ qcom_board_id(MSM8630AB) },
-	{ qcom_board_id(MSM8230AB) },
-	{ qcom_board_id(APQ8030AB) },
-	{ qcom_board_id(MSM8226) },
-	{ qcom_board_id(MSM8526) },
-	{ qcom_board_id(APQ8030AA) },
-	{ qcom_board_id(MSM8110) },
-	{ qcom_board_id(MSM8210) },
-	{ qcom_board_id(MSM8810) },
-	{ qcom_board_id(MSM8212) },
-	{ qcom_board_id(MSM8612) },
-	{ qcom_board_id(MSM8112) },
-	{ qcom_board_id(MSM8125) },
-	{ qcom_board_id(MSM8225Q) },
-	{ qcom_board_id(MSM8625Q) },
-	{ qcom_board_id(MSM8125Q) },
-	{ qcom_board_id(APQ8064AA) },
-	{ qcom_board_id(APQ8084) },
-	{ qcom_board_id(MSM8130) },
-	{ qcom_board_id(MSM8130AA) },
-	{ qcom_board_id(MSM8130AB) },
-	{ qcom_board_id(MSM8627AA) },
-	{ qcom_board_id(MSM8227AA) },
-	{ qcom_board_id(APQ8074) },
-	{ qcom_board_id(MSM8274) },
-	{ qcom_board_id(MSM8674) },
-	{ qcom_board_id(MDM9635) },
-	{ qcom_board_id_named(MSM8974PRO_AC, "MSM8974PRO-AC") },
-	{ qcom_board_id(MSM8126) },
-	{ qcom_board_id(APQ8026) },
-	{ qcom_board_id(MSM8926) },
-	{ qcom_board_id(IPQ8062) },
-	{ qcom_board_id(IPQ8064) },
-	{ qcom_board_id(IPQ8066) },
-	{ qcom_board_id(IPQ8068) },
-	{ qcom_board_id(MSM8326) },
-	{ qcom_board_id(MSM8916) },
-	{ qcom_board_id(MSM8994) },
-	{ qcom_board_id_named(APQ8074PRO_AA, "APQ8074PRO-AA") },
-	{ qcom_board_id_named(APQ8074PRO_AB, "APQ8074PRO-AB") },
-	{ qcom_board_id_named(APQ8074PRO_AC, "APQ8074PRO-AC") },
-	{ qcom_board_id_named(MSM8274PRO_AA, "MSM8274PRO-AA") },
-	{ qcom_board_id_named(MSM8274PRO_AB, "MSM8274PRO-AB") },
-	{ qcom_board_id_named(MSM8274PRO_AC, "MSM8274PRO-AC") },
-	{ qcom_board_id_named(MSM8674PRO_AA, "MSM8674PRO-AA") },
-	{ qcom_board_id_named(MSM8674PRO_AB, "MSM8674PRO-AB") },
-	{ qcom_board_id_named(MSM8674PRO_AC, "MSM8674PRO-AC") },
-	{ qcom_board_id_named(MSM8974PRO_AA, "MSM8974PRO-AA") },
-	{ qcom_board_id_named(MSM8974PRO_AB, "MSM8974PRO-AB") },
-	{ qcom_board_id(APQ8028) },
-	{ qcom_board_id(MSM8128) },
-	{ qcom_board_id(MSM8228) },
-	{ qcom_board_id(MSM8528) },
-	{ qcom_board_id(MSM8628) },
-	{ qcom_board_id(MSM8928) },
-	{ qcom_board_id(MSM8510) },
-	{ qcom_board_id(MSM8512) },
-	{ qcom_board_id(MSM8936) },
-	{ qcom_board_id(MDM9640) },
-	{ qcom_board_id(MSM8939) },
-	{ qcom_board_id(APQ8036) },
-	{ qcom_board_id(APQ8039) },
-	{ qcom_board_id(MSM8236) },
-	{ qcom_board_id(MSM8636) },
-	{ qcom_board_id(MSM8909) },
-	{ qcom_board_id(MSM8996) },
-	{ qcom_board_id(APQ8016) },
-	{ qcom_board_id(MSM8216) },
-	{ qcom_board_id(MSM8116) },
-	{ qcom_board_id(MSM8616) },
-	{ qcom_board_id(MSM8992) },
-	{ qcom_board_id(APQ8092) },
-	{ qcom_board_id(APQ8094) },
-	{ qcom_board_id(MSM8209) },
-	{ qcom_board_id(MSM8208) },
-	{ qcom_board_id(MDM9209) },
-	{ qcom_board_id(MDM9309) },
-	{ qcom_board_id(MDM9609) },
-	{ qcom_board_id(MSM8239) },
-	{ qcom_board_id(MSM8952) },
-	{ qcom_board_id(APQ8009) },
-	{ qcom_board_id(MSM8956) },
-	{ qcom_board_id(MSM8929) },
-	{ qcom_board_id(MSM8629) },
-	{ qcom_board_id(MSM8229) },
-	{ qcom_board_id(APQ8029) },
-	{ qcom_board_id(APQ8056) },
-	{ qcom_board_id(MSM8609) },
-	{ qcom_board_id(APQ8076) },
-	{ qcom_board_id(MSM8976) },
-	{ qcom_board_id(IPQ8065) },
-	{ qcom_board_id(IPQ8069) },
-	{ qcom_board_id(MDM9650) },
-	{ qcom_board_id(MDM9655) },
-	{ qcom_board_id(MDM9250) },
-	{ qcom_board_id(MDM9255) },
-	{ qcom_board_id(MDM9350) },
-	{ qcom_board_id(APQ8052) },
-	{ qcom_board_id(MDM9607) },
-	{ qcom_board_id(APQ8096) },
-	{ qcom_board_id(MSM8998) },
-	{ qcom_board_id(MSM8953) },
-	{ qcom_board_id(MSM8937) },
-	{ qcom_board_id(APQ8037) },
-	{ qcom_board_id(MDM8207) },
-	{ qcom_board_id(MDM9207) },
-	{ qcom_board_id(MDM9307) },
-	{ qcom_board_id(MDM9628) },
-	{ qcom_board_id(MSM8909W) },
-	{ qcom_board_id(APQ8009W) },
-	{ qcom_board_id(MSM8996L) },
-	{ qcom_board_id(MSM8917) },
-	{ qcom_board_id(APQ8053) },
-	{ qcom_board_id(MSM8996SG) },
-	{ qcom_board_id(APQ8017) },
-	{ qcom_board_id(MSM8217) },
-	{ qcom_board_id(MSM8617) },
-	{ qcom_board_id(MSM8996AU) },
-	{ qcom_board_id(APQ8096AU) },
-	{ qcom_board_id(APQ8096SG) },
-	{ qcom_board_id(MSM8940) },
-	{ qcom_board_id(SDX201) },
-	{ qcom_board_id(SDM660) },
-	{ qcom_board_id(SDM630) },
-	{ qcom_board_id(APQ8098) },
-	{ qcom_board_id(MSM8920) },
-	{ qcom_board_id(SDM845) },
-	{ qcom_board_id(MDM9206) },
-	{ qcom_board_id(IPQ8074) },
-	{ qcom_board_id(SDA660) },
-	{ qcom_board_id(SDM658) },
-	{ qcom_board_id(SDA658) },
-	{ qcom_board_id(SDA630) },
-	{ qcom_board_id(MSM8905) },
-	{ qcom_board_id(SDX202) },
-	{ qcom_board_id(SDM670) },
-	{ qcom_board_id(SDM450) },
-	{ qcom_board_id(SM8150) },
-	{ qcom_board_id(SDA845) },
-	{ qcom_board_id(IPQ8072) },
-	{ qcom_board_id(IPQ8076) },
-	{ qcom_board_id(IPQ8078) },
-	{ qcom_board_id(SDM636) },
-	{ qcom_board_id(SDA636) },
-	{ qcom_board_id(SDM632) },
-	{ qcom_board_id(SDA632) },
-	{ qcom_board_id(SDA450) },
-	{ qcom_board_id(SDM439) },
-	{ qcom_board_id(SDM429) },
-	{ qcom_board_id(SM8250) },
-	{ qcom_board_id(SA8155) },
-	{ qcom_board_id(SDA439) },
-	{ qcom_board_id(SDA429) },
-	{ qcom_board_id(SM7150) },
-	{ qcom_board_id(SM7150P) },
-	{ qcom_board_id(IPQ8070) },
-	{ qcom_board_id(IPQ8071) },
-	{ qcom_board_id(QM215) },
-	{ qcom_board_id(IPQ8072A) },
-	{ qcom_board_id(IPQ8074A) },
-	{ qcom_board_id(IPQ8076A) },
-	{ qcom_board_id(IPQ8078A) },
-	{ qcom_board_id(SM6125) },
-	{ qcom_board_id(IPQ8070A) },
-	{ qcom_board_id(IPQ8071A) },
-	{ qcom_board_id(IPQ8172) },
-	{ qcom_board_id(IPQ8173) },
-	{ qcom_board_id(IPQ8174) },
-	{ qcom_board_id(IPQ6018) },
-	{ qcom_board_id(IPQ6028) },
-	{ qcom_board_id(SDM429W) },
-	{ qcom_board_id(SM4250) },
-	{ qcom_board_id(IPQ6000) },
-	{ qcom_board_id(IPQ6010) },
-	{ qcom_board_id(SC7180) },
-	{ qcom_board_id(SM6350) },
-	{ qcom_board_id(QCM2150) },
-	{ qcom_board_id(SDA429W) },
-	{ qcom_board_id(SM8350) },
-	{ qcom_board_id(QCM2290) },
-	{ qcom_board_id(SM7125) },
-	{ qcom_board_id(SM6115) },
-	{ qcom_board_id(IPQ5010) },
-	{ qcom_board_id(IPQ5018) },
-	{ qcom_board_id(IPQ5028) },
-	{ qcom_board_id(SC8280XP) },
-	{ qcom_board_id(IPQ6005) },
-	{ qcom_board_id(QRB5165) },
-	{ qcom_board_id(SM8450) },
-	{ qcom_board_id(SM7225) },
-	{ qcom_board_id(SA8295P) },
-	{ qcom_board_id(SA8540P) },
-	{ qcom_board_id(QCM4290) },
-	{ qcom_board_id(QCS4290) },
-	{ qcom_board_id(SM7325) },
-	{ qcom_board_id_named(SM8450_2, "SM8450") },
-	{ qcom_board_id_named(SM8450_3, "SM8450") },
-	{ qcom_board_id(SC7280) },
-	{ qcom_board_id(SC7180P) },
-	{ qcom_board_id(QCM6490) },
-	{ qcom_board_id(QCS6490) },
-	{ qcom_board_id(SM7325P) },
-	{ qcom_board_id(IPQ5000) },
-	{ qcom_board_id(IPQ0509) },
-	{ qcom_board_id(IPQ0518) },
-	{ qcom_board_id(SM6375) },
-	{ qcom_board_id(IPQ9514) },
-	{ qcom_board_id(IPQ9550) },
-	{ qcom_board_id(IPQ9554) },
-	{ qcom_board_id(IPQ9570) },
-	{ qcom_board_id(IPQ9574) },
-	{ qcom_board_id(SM8550) },
-	{ qcom_board_id(IPQ5016) },
-	{ qcom_board_id(IPQ9510) },
-	{ qcom_board_id(QRB4210) },
-	{ qcom_board_id(QRB2210) },
-	{ qcom_board_id(SAR2130P) },
-	{ qcom_board_id(SM8475) },
-	{ qcom_board_id(SM8475P) },
-	{ qcom_board_id(SA8255P) },
-	{ qcom_board_id(SA8775P) },
-	{ qcom_board_id(QRU1000) },
-	{ qcom_board_id(SM8475_2) },
-	{ qcom_board_id(QDU1000) },
-	{ qcom_board_id(X1E80100) },
-	{ qcom_board_id(SM8650) },
-	{ qcom_board_id(SM4450) },
-	{ qcom_board_id(SAR1130P) },
-	{ qcom_board_id(QDU1010) },
-	{ qcom_board_id(QRU1032) },
-	{ qcom_board_id(QRU1052) },
-	{ qcom_board_id(QRU1062) },
-	{ qcom_board_id(IPQ5332) },
-	{ qcom_board_id(IPQ5322) },
-	{ qcom_board_id(IPQ5312) },
-	{ qcom_board_id(IPQ5302) },
-	{ qcom_board_id(QCS8550) },
-	{ qcom_board_id(QCM8550) },
-	{ qcom_board_id(SM8750)  },
-	{ qcom_board_id(IPQ5300) },
-	{ qcom_board_id(SM7635) },
-	{ qcom_board_id(SM6650) },
-	{ qcom_board_id(SM6650P) },
-	{ qcom_board_id(IPQ5321) },
-	{ qcom_board_id(IPQ5424) },
-	{ qcom_board_id(QCM6690) },
-	{ qcom_board_id(QCS6690) },
-	{ qcom_board_id(SM8850) },
-	{ qcom_board_id(IPQ5404) },
-	{ qcom_board_id(QCS9100) },
-	{ qcom_board_id(QCS8300) },
-	{ qcom_board_id(QCS8275) },
-	{ qcom_board_id(QCS9075) },
-	{ qcom_board_id(QCS615) },
-};
-
-static const char *socinfo_machine(struct device *dev, unsigned int id)
-{
-	int idx;
-
-	for (idx = 0; idx < ARRAY_SIZE(soc_id); idx++) {
-		if (soc_id[idx].id == id)
-			return soc_id[idx].name;
-	}
-
-	return NULL;
-}
-
-#ifdef CONFIG_DEBUG_FS
-
-#define QCOM_OPEN(name, _func)						\
-static int qcom_open_##name(struct inode *inode, struct file *file)	\
-{									\
-	return single_open(file, _func, inode->i_private);		\
-}									\
-									\
-static const struct file_operations qcom_ ##name## _ops = {		\
-	.open = qcom_open_##name,					\
-	.read = seq_read,						\
-	.llseek = seq_lseek,						\
-	.release = single_release,					\
-}
-
-#define DEBUGFS_ADD(info, name)						\
-	debugfs_create_file(__stringify(name), 0444,			\
-			    qcom_socinfo->dbg_root,			\
-			    info, &qcom_ ##name## _ops)
-
-
-static int qcom_show_build_id(struct seq_file *seq, void *p)
-{
-	struct socinfo *socinfo = seq->private;
-
-	seq_printf(seq, "%s\n", socinfo->build_id);
-
-	return 0;
-}
-
-static int qcom_show_pmic_model(struct seq_file *seq, void *p)
-{
-	struct socinfo *socinfo = seq->private;
-	int model = SOCINFO_MINOR(le32_to_cpu(socinfo->pmic_model));
-
-	if (model < 0)
-		return -EINVAL;
-
-	if (model < ARRAY_SIZE(pmic_models) && pmic_models[model])
-		seq_printf(seq, "%s\n", pmic_models[model]);
-	else
-		seq_printf(seq, "unknown (%d)\n", model);
-
-	return 0;
-}
-
-static int qcom_show_pmic_model_array(struct seq_file *seq, void *p)
-{
-	struct socinfo *socinfo = seq->private;
-	unsigned int num_pmics = le32_to_cpu(socinfo->num_pmics);
-	unsigned int pmic_array_offset = le32_to_cpu(socinfo->pmic_array_offset);
-	int i;
-	void *ptr = socinfo;
-
-	ptr += pmic_array_offset;
-
-	/* No need for bounds checking, it happened at socinfo_debugfs_init */
-	for (i = 0; i < num_pmics; i++) {
-		unsigned int model = SOCINFO_MINOR(get_unaligned_le32(ptr + 2 * i * sizeof(u32)));
-		unsigned int die_rev = get_unaligned_le32(ptr + (2 * i + 1) * sizeof(u32));
-
-		if (model < ARRAY_SIZE(pmic_models) && pmic_models[model])
-			seq_printf(seq, "%s %u.%u\n", pmic_models[model],
-				   SOCINFO_MAJOR(die_rev),
-				   SOCINFO_MINOR(die_rev));
-		else
-			seq_printf(seq, "unknown (%d)\n", model);
-	}
-
-	return 0;
-}
-
-static int qcom_show_pmic_die_revision(struct seq_file *seq, void *p)
-{
-	struct socinfo *socinfo = seq->private;
-
-	seq_printf(seq, "%u.%u\n",
-		   SOCINFO_MAJOR(le32_to_cpu(socinfo->pmic_die_rev)),
-		   SOCINFO_MINOR(le32_to_cpu(socinfo->pmic_die_rev)));
-
-	return 0;
-}
-
-static int qcom_show_chip_id(struct seq_file *seq, void *p)
-{
-	struct socinfo *socinfo = seq->private;
-
-	seq_printf(seq, "%s\n", socinfo->chip_id);
-
-	return 0;
-}
-
-QCOM_OPEN(build_id, qcom_show_build_id);
-QCOM_OPEN(pmic_model, qcom_show_pmic_model);
-QCOM_OPEN(pmic_model_array, qcom_show_pmic_model_array);
-QCOM_OPEN(pmic_die_rev, qcom_show_pmic_die_revision);
-QCOM_OPEN(chip_id, qcom_show_chip_id);
-
-#define DEFINE_IMAGE_OPS(type)					\
-static int show_image_##type(struct seq_file *seq, void *p)		  \
-{								  \
-	struct smem_image_version *image_version = seq->private;  \
-	if (image_version->type[0] != '\0')			  \
-		seq_printf(seq, "%s\n", image_version->type);	  \
-	return 0;						  \
-}								  \
-static int open_image_##type(struct inode *inode, struct file *file)	  \
-{									  \
-	return single_open(file, show_image_##type, inode->i_private); \
-}									  \
-									  \
-static const struct file_operations qcom_image_##type##_ops = {	  \
-	.open = open_image_##type,					  \
-	.read = seq_read,						  \
-	.llseek = seq_lseek,						  \
-	.release = single_release,					  \
-}
-
-DEFINE_IMAGE_OPS(name);
-DEFINE_IMAGE_OPS(variant);
-DEFINE_IMAGE_OPS(oem);
-
-static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
-				 struct socinfo *info, size_t info_size)
-{
-	struct smem_image_version *versions;
-	struct dentry *dentry;
-	size_t size;
-	int i, j;
-	unsigned int num_pmics;
-	unsigned int pmic_array_offset;
-
-	qcom_socinfo->dbg_root = debugfs_create_dir("qcom_socinfo", NULL);
-
-	qcom_socinfo->info.fmt = __le32_to_cpu(info->fmt);
-
-	debugfs_create_x32("info_fmt", 0444, qcom_socinfo->dbg_root,
-			   &qcom_socinfo->info.fmt);
-
-	switch (qcom_socinfo->info.fmt) {
-	case SOCINFO_VERSION(0, 23):
-	case SOCINFO_VERSION(0, 22):
-	case SOCINFO_VERSION(0, 21):
-	case SOCINFO_VERSION(0, 20):
-		qcom_socinfo->info.raw_package_type = __le32_to_cpu(info->raw_package_type);
-		debugfs_create_u32("raw_package_type", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.raw_package_type);
-		fallthrough;
-	case SOCINFO_VERSION(0, 19):
-		qcom_socinfo->info.num_func_clusters = __le32_to_cpu(info->num_func_clusters);
-		qcom_socinfo->info.boot_cluster = __le32_to_cpu(info->boot_cluster);
-		qcom_socinfo->info.boot_core = __le32_to_cpu(info->boot_core);
-
-		debugfs_create_u32("num_func_clusters", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.num_func_clusters);
-		debugfs_create_u32("boot_cluster", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.boot_cluster);
-		debugfs_create_u32("boot_core", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.boot_core);
-		fallthrough;
-	case SOCINFO_VERSION(0, 18):
-	case SOCINFO_VERSION(0, 17):
-		qcom_socinfo->info.oem_variant = __le32_to_cpu(info->oem_variant);
-		debugfs_create_u32("oem_variant", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.oem_variant);
-		fallthrough;
-	case SOCINFO_VERSION(0, 16):
-		qcom_socinfo->info.feature_code = __le32_to_cpu(info->feature_code);
-		qcom_socinfo->info.pcode = __le32_to_cpu(info->pcode);
-
-		debugfs_create_u32("feature_code", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.feature_code);
-		debugfs_create_u32("pcode", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.pcode);
-		fallthrough;
-	case SOCINFO_VERSION(0, 15):
-		qcom_socinfo->info.nmodem_supported = __le32_to_cpu(info->nmodem_supported);
-
-		debugfs_create_u32("nmodem_supported", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.nmodem_supported);
-		fallthrough;
-	case SOCINFO_VERSION(0, 14):
-		qcom_socinfo->info.num_clusters = __le32_to_cpu(info->num_clusters);
-		qcom_socinfo->info.ncluster_array_offset = __le32_to_cpu(info->ncluster_array_offset);
-		qcom_socinfo->info.num_subset_parts = __le32_to_cpu(info->num_subset_parts);
-		qcom_socinfo->info.nsubset_parts_array_offset =
-			__le32_to_cpu(info->nsubset_parts_array_offset);
-
-		debugfs_create_u32("num_clusters", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.num_clusters);
-		debugfs_create_u32("ncluster_array_offset", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.ncluster_array_offset);
-		debugfs_create_u32("num_subset_parts", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.num_subset_parts);
-		debugfs_create_u32("nsubset_parts_array_offset", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.nsubset_parts_array_offset);
-		fallthrough;
-	case SOCINFO_VERSION(0, 13):
-		qcom_socinfo->info.nproduct_id = __le32_to_cpu(info->nproduct_id);
-
-		debugfs_create_u32("nproduct_id", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.nproduct_id);
-		DEBUGFS_ADD(info, chip_id);
-		fallthrough;
-	case SOCINFO_VERSION(0, 12):
-		qcom_socinfo->info.chip_family =
-			__le32_to_cpu(info->chip_family);
-		qcom_socinfo->info.raw_device_family =
-			__le32_to_cpu(info->raw_device_family);
-		qcom_socinfo->info.raw_device_num =
-			__le32_to_cpu(info->raw_device_num);
-
-		debugfs_create_x32("chip_family", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.chip_family);
-		debugfs_create_x32("raw_device_family", 0444,
-				   qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.raw_device_family);
-		debugfs_create_x32("raw_device_number", 0444,
-				   qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.raw_device_num);
-		fallthrough;
-	case SOCINFO_VERSION(0, 11):
-		num_pmics = le32_to_cpu(info->num_pmics);
-		pmic_array_offset = le32_to_cpu(info->pmic_array_offset);
-		if (pmic_array_offset + 2 * num_pmics * sizeof(u32) <= info_size)
-			DEBUGFS_ADD(info, pmic_model_array);
-		fallthrough;
-	case SOCINFO_VERSION(0, 10):
-	case SOCINFO_VERSION(0, 9):
-		qcom_socinfo->info.foundry_id = __le32_to_cpu(info->foundry_id);
-
-		debugfs_create_u32("foundry_id", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.foundry_id);
-		fallthrough;
-	case SOCINFO_VERSION(0, 8):
-	case SOCINFO_VERSION(0, 7):
-		DEBUGFS_ADD(info, pmic_model);
-		DEBUGFS_ADD(info, pmic_die_rev);
-		fallthrough;
-	case SOCINFO_VERSION(0, 6):
-		qcom_socinfo->info.hw_plat_subtype =
-			__le32_to_cpu(info->hw_plat_subtype);
-
-		debugfs_create_u32("hardware_platform_subtype", 0444,
-				   qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.hw_plat_subtype);
-		fallthrough;
-	case SOCINFO_VERSION(0, 5):
-		qcom_socinfo->info.accessory_chip =
-			__le32_to_cpu(info->accessory_chip);
-
-		debugfs_create_u32("accessory_chip", 0444,
-				   qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.accessory_chip);
-		fallthrough;
-	case SOCINFO_VERSION(0, 4):
-		qcom_socinfo->info.plat_ver = __le32_to_cpu(info->plat_ver);
-
-		debugfs_create_u32("platform_version", 0444,
-				   qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.plat_ver);
-		fallthrough;
-	case SOCINFO_VERSION(0, 3):
-		qcom_socinfo->info.hw_plat = __le32_to_cpu(info->hw_plat);
-
-		debugfs_create_u32("hardware_platform", 0444,
-				   qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.hw_plat);
-		fallthrough;
-	case SOCINFO_VERSION(0, 2):
-		qcom_socinfo->info.raw_ver  = __le32_to_cpu(info->raw_ver);
-
-		debugfs_create_u32("raw_version", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.raw_ver);
-		fallthrough;
-	case SOCINFO_VERSION(0, 1):
-		DEBUGFS_ADD(info, build_id);
-		break;
-	}
-
-	for (i = 0, j = 0; i < ARRAY_SIZE(socinfo_image_names); i++, j++) {
-		if (!socinfo_image_names[i])
-			continue;
-
-		if (i == 0) {
-			versions = qcom_smem_get(QCOM_SMEM_HOST_ANY,
-						 SMEM_IMAGE_VERSION_TABLE,
-						 &size);
-		} else if (i == 32) {
-			versions = qcom_smem_get(QCOM_SMEM_HOST_ANY,
-						 SMEM_IMAGE_VERSION_TABLE_2,
-						 &size);
-			if (IS_ERR(versions))
-				break;
-
-			j = 0;
-		}
-
-		dentry = debugfs_create_dir(socinfo_image_names[i],
-					    qcom_socinfo->dbg_root);
-		debugfs_create_file("name", 0444, dentry, &versions[j],
-				    &qcom_image_name_ops);
-		debugfs_create_file("variant", 0444, dentry, &versions[j],
-				    &qcom_image_variant_ops);
-		debugfs_create_file("oem", 0444, dentry, &versions[j],
-				    &qcom_image_oem_ops);
-	}
-}
-
-static void socinfo_debugfs_exit(struct qcom_socinfo *qcom_socinfo)
-{
-	debugfs_remove_recursive(qcom_socinfo->dbg_root);
-}
-#else
-static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
-				 struct socinfo *info, size_t info_size)
-{
-}
-static void socinfo_debugfs_exit(struct qcom_socinfo *qcom_socinfo) {  }
-#endif /* CONFIG_DEBUG_FS */
-
-static int qcom_socinfo_probe(struct platform_device *pdev)
-{
-	struct qcom_socinfo *qs;
-	struct socinfo *info;
-	size_t item_size;
-
-	info = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_HW_SW_BUILD_ID,
-			      &item_size);
-	if (IS_ERR(info)) {
-		dev_err(&pdev->dev, "Couldn't find socinfo\n");
-		return PTR_ERR(info);
-	}
-
-	qs = devm_kzalloc(&pdev->dev, sizeof(*qs), GFP_KERNEL);
-	if (!qs)
-		return -ENOMEM;
-
-	qs->attr.family = "Snapdragon";
-	qs->attr.machine = socinfo_machine(&pdev->dev,
-					   le32_to_cpu(info->id));
-	qs->attr.soc_id = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%u",
-					 le32_to_cpu(info->id));
-	qs->attr.revision = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%u.%u",
-					   SOCINFO_MAJOR(le32_to_cpu(info->ver)),
-					   SOCINFO_MINOR(le32_to_cpu(info->ver)));
-	if (!qs->attr.soc_id || !qs->attr.revision)
-		return -ENOMEM;
-
-	if (offsetofend(struct socinfo, serial_num) <= item_size) {
-		qs->attr.serial_number = devm_kasprintf(&pdev->dev, GFP_KERNEL,
-							"%u",
-							le32_to_cpu(info->serial_num));
-		if (!qs->attr.serial_number)
-			return -ENOMEM;
-	}
-
-	qs->soc_dev = soc_device_register(&qs->attr);
-	if (IS_ERR(qs->soc_dev))
-		return PTR_ERR(qs->soc_dev);
-
-	socinfo_debugfs_init(qs, info, item_size);
-
-	/* Feed the soc specific unique data into entropy pool */
-	add_device_randomness(info, item_size);
-
-	platform_set_drvdata(pdev, qs);
-
-	return 0;
-}
-
-static void qcom_socinfo_remove(struct platform_device *pdev)
-{
-	struct qcom_socinfo *qs = platform_get_drvdata(pdev);
-
-	soc_device_unregister(qs->soc_dev);
-
-	socinfo_debugfs_exit(qs);
-}
-
-static struct platform_driver qcom_socinfo_driver = {
-	.probe = qcom_socinfo_probe,
-	.remove = qcom_socinfo_remove,
-	.driver  = {
-		.name = "qcom-socinfo",
-	},
-};
-
-module_platform_driver(qcom_socinfo_driver);
-
-MODULE_DESCRIPTION("Qualcomm SoCinfo driver");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:qcom-socinfo");
diff --git a/drivers/soc/qcom/socinfo/Makefile b/drivers/soc/qcom/socinfo/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..8cdd77f46a22aeb97bcf1eeb90418db8f6352d3b
--- /dev/null
+++ b/drivers/soc/qcom/socinfo/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_QCOM_SOCINFO) += socinfo.o
diff --git a/drivers/soc/qcom/socinfo/bindings.rs b/drivers/soc/qcom/socinfo/bindings.rs
new file mode 100644
index 0000000000000000000000000000000000000000..edd0e0a416e6666b9e2bab2f00a41cf520ded5ce
--- /dev/null
+++ b/drivers/soc/qcom/socinfo/bindings.rs
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2025 Google LLC.
+
+use kernel::error::from_err_ptr;
+use kernel::ffi::c_char;
+use kernel::macros::{AsBytes, FromBytes};
+use kernel::prelude::*;
+use kernel::transmute::AsBytes;
+
+pub(crate) fn qcom_smem_get(host: i32, item: u32) -> Result<&'static [u8]> {
+    let mut size = 0;
+    // SAFETY: qcom_smem_get only requires that the size pointer be a writable size_t,
+    // host and item are error checked in the qcom_smem module.
+    let err_ptr = unsafe { kernel::bindings::qcom_smem_get(host as u32, item, &mut size) };
+    let ptr = from_err_ptr(err_ptr)?;
+    // SAFETY: If qcom_smem_get does not return an error, the returned pointer points to a readable
+    // byte buffer with its size written into size. Because these buffers are derived from the
+    // static ranges in the DT, this buffer remains accessible even if the qcom_smem module is
+    // unloaded, so 'static is appropriate. The underlying buffer cannot mutate, so upgrading it
+    // to a reference is allowed.
+    Ok(unsafe { core::slice::from_raw_parts(ptr as *const u8, size) })
+}
+
+pub(crate) const SMEM_IMAGE_VERSION_TABLE: u32 = 469;
+pub(crate) const SMEM_IMAGE_VERSION_TABLE_2: u32 = 667;
+
+pub(crate) use kernel::bindings::socinfo;
+
+/// Produce `socinfo` by initializing from a byte buffer that may be too small.
+/// Code using the resulting value is expected to use the info_fmt field to determine
+/// which fields have meaningful values.
+pub(crate) fn socinfo_from_partial_bytes(soc_info_mem: &[u8]) -> socinfo {
+    let mut soc_info = socinfo::default();
+    let byte_view: &mut [u8] = soc_info.as_bytes_mut();
+    let len = core::cmp::min(soc_info_mem.len(), byte_view.len());
+    byte_view[..len].copy_from_slice(&soc_info_mem[..len]);
+    soc_info
+}
+
+#[derive(AsBytes, FromBytes)]
+#[repr(C)]
+pub(crate) struct PmicEntry {
+    pub(crate) model: u32,
+    pub(crate) die_rev: u32,
+}
+
+const SMEM_IMAGE_VERSION_NAME_SIZE: usize = 75;
+const SMEM_IMAGE_VERSION_VARIANT_SIZE: usize = 20;
+const SMEM_IMAGE_VERSION_OEM_SIZE: usize = 32;
+
+#[derive(AsBytes, FromBytes)]
+#[repr(C)]
+pub(crate) struct ImageVersion {
+    pub(crate) name: [c_char; SMEM_IMAGE_VERSION_NAME_SIZE],
+    pub(crate) variant: [c_char; SMEM_IMAGE_VERSION_VARIANT_SIZE],
+    pub(crate) pad: c_char,
+    pub(crate) oem: [c_char; SMEM_IMAGE_VERSION_OEM_SIZE],
+}
diff --git a/drivers/soc/qcom/socinfo/data.rs b/drivers/soc/qcom/socinfo/data.rs
new file mode 100644
index 0000000000000000000000000000000000000000..a3cb8698a3e0d840153d835df62c5b6c82dc6b0e
--- /dev/null
+++ b/drivers/soc/qcom/socinfo/data.rs
@@ -0,0 +1,424 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2025 Google LLC.
+
+//! Data tables for QCom SocInfo driver
+use kernel::c_str;
+use kernel::prelude::*;
+
+macro_rules! id_entry {
+    ($id:ident) => {
+        kernel::macros::paste! {
+            SocId {
+                id: kernel::bindings::[<QCOM_ID_ $id>],
+                name: c_str!(stringify!($id)),
+            }
+        }
+    };
+    ($id:ident, $name:tt) => {
+        SocId {
+            id: kernel::macros::paste!(kernel::bindings::[<QCOM_ID_ $id>]), name: c_str!($name),
+        }
+    }
+}
+
+pub(crate) struct SocId {
+    pub(crate) id: u32,
+    pub(crate) name: &'static CStr,
+}
+
+pub(crate) static SOC_IDS: &[SocId] = &[
+    id_entry!(MSM8260),
+    id_entry!(MSM8660),
+    id_entry!(APQ8060),
+    id_entry!(MSM8960),
+    id_entry!(APQ8064),
+    id_entry!(MSM8930),
+    id_entry!(MSM8630),
+    id_entry!(MSM8230),
+    id_entry!(APQ8030),
+    id_entry!(MSM8627),
+    id_entry!(MSM8227),
+    id_entry!(MSM8660A),
+    id_entry!(MSM8260A),
+    id_entry!(APQ8060A),
+    id_entry!(MSM8974),
+    id_entry!(MSM8225),
+    id_entry!(MSM8625),
+    id_entry!(MPQ8064),
+    id_entry!(MSM8960AB),
+    id_entry!(APQ8060AB),
+    id_entry!(MSM8260AB),
+    id_entry!(MSM8660AB),
+    id_entry!(MSM8930AA),
+    id_entry!(MSM8630AA),
+    id_entry!(MSM8230AA),
+    id_entry!(MSM8626),
+    id_entry!(MSM8610),
+    id_entry!(APQ8064AB),
+    id_entry!(MSM8930AB),
+    id_entry!(MSM8630AB),
+    id_entry!(MSM8230AB),
+    id_entry!(APQ8030AB),
+    id_entry!(MSM8226),
+    id_entry!(MSM8526),
+    id_entry!(APQ8030AA),
+    id_entry!(MSM8110),
+    id_entry!(MSM8210),
+    id_entry!(MSM8810),
+    id_entry!(MSM8212),
+    id_entry!(MSM8612),
+    id_entry!(MSM8112),
+    id_entry!(MSM8125),
+    id_entry!(MSM8225Q),
+    id_entry!(MSM8625Q),
+    id_entry!(MSM8125Q),
+    id_entry!(APQ8064AA),
+    id_entry!(APQ8084),
+    id_entry!(MSM8130),
+    id_entry!(MSM8130AA),
+    id_entry!(MSM8130AB),
+    id_entry!(MSM8627AA),
+    id_entry!(MSM8227AA),
+    id_entry!(APQ8074),
+    id_entry!(MSM8274),
+    id_entry!(MSM8674),
+    id_entry!(MDM9635),
+    id_entry!(MSM8974PRO_AC, "MSM8974PRO-AC"),
+    id_entry!(MSM8126),
+    id_entry!(APQ8026),
+    id_entry!(MSM8926),
+    id_entry!(IPQ8062),
+    id_entry!(IPQ8064),
+    id_entry!(IPQ8066),
+    id_entry!(IPQ8068),
+    id_entry!(MSM8326),
+    id_entry!(MSM8916),
+    id_entry!(MSM8994),
+    id_entry!(APQ8074PRO_AA, "APQ8074PRO-AA"),
+    id_entry!(APQ8074PRO_AB, "APQ8074PRO-AB"),
+    id_entry!(APQ8074PRO_AC, "APQ8074PRO-AC"),
+    id_entry!(MSM8274PRO_AA, "MSM8274PRO-AA"),
+    id_entry!(MSM8274PRO_AB, "MSM8274PRO-AB"),
+    id_entry!(MSM8274PRO_AC, "MSM8274PRO-AC"),
+    id_entry!(MSM8674PRO_AA, "MSM8674PRO-AA"),
+    id_entry!(MSM8674PRO_AB, "MSM8674PRO-AB"),
+    id_entry!(MSM8674PRO_AC, "MSM8674PRO-AC"),
+    id_entry!(MSM8974PRO_AA, "MSM8974PRO-AA"),
+    id_entry!(MSM8974PRO_AB, "MSM8974PRO-AB"),
+    id_entry!(APQ8028),
+    id_entry!(MSM8128),
+    id_entry!(MSM8228),
+    id_entry!(MSM8528),
+    id_entry!(MSM8628),
+    id_entry!(MSM8928),
+    id_entry!(MSM8510),
+    id_entry!(MSM8512),
+    id_entry!(MSM8936),
+    id_entry!(MDM9640),
+    id_entry!(MSM8939),
+    id_entry!(APQ8036),
+    id_entry!(APQ8039),
+    id_entry!(MSM8236),
+    id_entry!(MSM8636),
+    id_entry!(MSM8909),
+    id_entry!(MSM8996),
+    id_entry!(APQ8016),
+    id_entry!(MSM8216),
+    id_entry!(MSM8116),
+    id_entry!(MSM8616),
+    id_entry!(MSM8992),
+    id_entry!(APQ8092),
+    id_entry!(APQ8094),
+    id_entry!(MSM8209),
+    id_entry!(MSM8208),
+    id_entry!(MDM9209),
+    id_entry!(MDM9309),
+    id_entry!(MDM9609),
+    id_entry!(MSM8239),
+    id_entry!(MSM8952),
+    id_entry!(APQ8009),
+    id_entry!(MSM8956),
+    id_entry!(MSM8929),
+    id_entry!(MSM8629),
+    id_entry!(MSM8229),
+    id_entry!(APQ8029),
+    id_entry!(APQ8056),
+    id_entry!(MSM8609),
+    id_entry!(APQ8076),
+    id_entry!(MSM8976),
+    id_entry!(IPQ8065),
+    id_entry!(IPQ8069),
+    id_entry!(MDM9650),
+    id_entry!(MDM9655),
+    id_entry!(MDM9250),
+    id_entry!(MDM9255),
+    id_entry!(MDM9350),
+    id_entry!(APQ8052),
+    id_entry!(MDM9607),
+    id_entry!(APQ8096),
+    id_entry!(MSM8998),
+    id_entry!(MSM8953),
+    id_entry!(MSM8937),
+    id_entry!(APQ8037),
+    id_entry!(MDM8207),
+    id_entry!(MDM9207),
+    id_entry!(MDM9307),
+    id_entry!(MDM9628),
+    id_entry!(MSM8909W),
+    id_entry!(APQ8009W),
+    id_entry!(MSM8996L),
+    id_entry!(MSM8917),
+    id_entry!(APQ8053),
+    id_entry!(MSM8996SG),
+    id_entry!(APQ8017),
+    id_entry!(MSM8217),
+    id_entry!(MSM8617),
+    id_entry!(MSM8996AU),
+    id_entry!(APQ8096AU),
+    id_entry!(APQ8096SG),
+    id_entry!(MSM8940),
+    id_entry!(SDX201),
+    id_entry!(SDM660),
+    id_entry!(SDM630),
+    id_entry!(APQ8098),
+    id_entry!(MSM8920),
+    id_entry!(SDM845),
+    id_entry!(MDM9206),
+    id_entry!(IPQ8074),
+    id_entry!(SDA660),
+    id_entry!(SDM658),
+    id_entry!(SDA658),
+    id_entry!(SDA630),
+    id_entry!(MSM8905),
+    id_entry!(SDX202),
+    id_entry!(SDM670),
+    id_entry!(SDM450),
+    id_entry!(SM8150),
+    id_entry!(SDA845),
+    id_entry!(IPQ8072),
+    id_entry!(IPQ8076),
+    id_entry!(IPQ8078),
+    id_entry!(SDM636),
+    id_entry!(SDA636),
+    id_entry!(SDM632),
+    id_entry!(SDA632),
+    id_entry!(SDA450),
+    id_entry!(SDM439),
+    id_entry!(SDM429),
+    id_entry!(SM8250),
+    id_entry!(SA8155),
+    id_entry!(SDA439),
+    id_entry!(SDA429),
+    id_entry!(SM7150),
+    id_entry!(SM7150P),
+    id_entry!(IPQ8070),
+    id_entry!(IPQ8071),
+    id_entry!(QM215),
+    id_entry!(IPQ8072A),
+    id_entry!(IPQ8074A),
+    id_entry!(IPQ8076A),
+    id_entry!(IPQ8078A),
+    id_entry!(SM6125),
+    id_entry!(IPQ8070A),
+    id_entry!(IPQ8071A),
+    id_entry!(IPQ8172),
+    id_entry!(IPQ8173),
+    id_entry!(IPQ8174),
+    id_entry!(IPQ6018),
+    id_entry!(IPQ6028),
+    id_entry!(SDM429W),
+    id_entry!(SM4250),
+    id_entry!(IPQ6000),
+    id_entry!(IPQ6010),
+    id_entry!(SC7180),
+    id_entry!(SM6350),
+    id_entry!(QCM2150),
+    id_entry!(SDA429W),
+    id_entry!(SM8350),
+    id_entry!(QCM2290),
+    id_entry!(SM7125),
+    id_entry!(SM6115),
+    id_entry!(IPQ5010),
+    id_entry!(IPQ5018),
+    id_entry!(IPQ5028),
+    id_entry!(SC8280XP),
+    id_entry!(IPQ6005),
+    id_entry!(QRB5165),
+    id_entry!(SM8450),
+    id_entry!(SM7225),
+    id_entry!(SA8295P),
+    id_entry!(SA8540P),
+    id_entry!(QCM4290),
+    id_entry!(QCS4290),
+    id_entry!(SM7325),
+    id_entry!(SM8450_2, "SM8450"),
+    id_entry!(SM8450_3, "SM8450"),
+    id_entry!(SC7280),
+    id_entry!(SC7180P),
+    id_entry!(QCM6490),
+    id_entry!(QCS6490),
+    id_entry!(SM7325P),
+    id_entry!(IPQ5000),
+    id_entry!(IPQ0509),
+    id_entry!(IPQ0518),
+    id_entry!(SM6375),
+    id_entry!(IPQ9514),
+    id_entry!(IPQ9550),
+    id_entry!(IPQ9554),
+    id_entry!(IPQ9570),
+    id_entry!(IPQ9574),
+    id_entry!(SM8550),
+    id_entry!(IPQ5016),
+    id_entry!(IPQ9510),
+    id_entry!(QRB4210),
+    id_entry!(QRB2210),
+    id_entry!(SAR2130P),
+    id_entry!(SM8475),
+    id_entry!(SM8475P),
+    id_entry!(SA8255P),
+    id_entry!(SA8775P),
+    id_entry!(QRU1000),
+    id_entry!(SM8475_2),
+    id_entry!(QDU1000),
+    id_entry!(X1E80100),
+    id_entry!(SM8650),
+    id_entry!(SM4450),
+    id_entry!(SAR1130P),
+    id_entry!(QDU1010),
+    id_entry!(QRU1032),
+    id_entry!(QRU1052),
+    id_entry!(QRU1062),
+    id_entry!(IPQ5332),
+    id_entry!(IPQ5322),
+    id_entry!(IPQ5312),
+    id_entry!(IPQ5302),
+    id_entry!(QCS8550),
+    id_entry!(QCM8550),
+    id_entry!(SM8750),
+    id_entry!(IPQ5300),
+    id_entry!(SM7635),
+    id_entry!(SM6650),
+    id_entry!(SM6650P),
+    id_entry!(IPQ5321),
+    id_entry!(IPQ5424),
+    id_entry!(QCM6690),
+    id_entry!(QCS6690),
+    id_entry!(SM8850),
+    id_entry!(IPQ5404),
+    id_entry!(QCS9100),
+    id_entry!(QCS8300),
+    id_entry!(QCS8275),
+    id_entry!(QCS9075),
+    id_entry!(QCS615),
+];
+
+pub(crate) const PMIC_MODELS: [Option<&str>; 92] = {
+    let mut models = [None; 92];
+    models[0] = Some("Unknown PMIC model");
+    models[1] = Some("PM8941");
+    models[2] = Some("PM8841");
+    models[3] = Some("PM8019");
+    models[4] = Some("PM8226");
+    models[5] = Some("PM8110");
+    models[6] = Some("PMA8084");
+    models[7] = Some("PMI8962");
+    models[8] = Some("PMD9635");
+    models[9] = Some("PM8994");
+    models[10] = Some("PMI8994");
+    models[11] = Some("PM8916");
+    models[12] = Some("PM8004");
+    models[13] = Some("PM8909/PM8058");
+    models[14] = Some("PM8028");
+    models[15] = Some("PM8901");
+    models[16] = Some("PM8950/PM8027");
+    models[17] = Some("PMI8950/ISL9519");
+    models[18] = Some("PMK8001/PM8921");
+    models[19] = Some("PMI8996/PM8018");
+    models[20] = Some("PM8998/PM8015");
+    models[21] = Some("PMI8998/PM8014");
+    models[22] = Some("PM8821");
+    models[23] = Some("PM8038");
+    models[24] = Some("PM8005/PM8922");
+    models[25] = Some("PM8917/PM8937");
+    models[26] = Some("PM660L");
+    models[27] = Some("PM660");
+    models[30] = Some("PM8150");
+    models[31] = Some("PM8150L");
+    models[32] = Some("PM8150B");
+    models[33] = Some("PMK8002");
+    models[36] = Some("PM8009");
+    models[37] = Some("PMI632");
+    models[38] = Some("PM8150C");
+    models[40] = Some("PM6150");
+    models[41] = Some("SMB2351");
+    models[44] = Some("PM8008");
+    models[45] = Some("PM6125");
+    models[46] = Some("PM7250B");
+    models[47] = Some("PMK8350");
+    models[48] = Some("PM8350");
+    models[49] = Some("PM8350C");
+    models[50] = Some("PM8350B");
+    models[51] = Some("PMR735A");
+    models[52] = Some("PMR735B");
+    models[54] = Some("PM6350");
+    models[55] = Some("PM4125");
+    models[58] = Some("PM8450");
+    models[65] = Some("PM8010");
+    models[69] = Some("PM8550VS");
+    models[70] = Some("PM8550VE");
+    models[71] = Some("PM8550B");
+    models[72] = Some("PMR735D");
+    models[73] = Some("PM8550");
+    models[74] = Some("PMK8550");
+    models[78] = Some("PMM8650AU");
+    models[79] = Some("PMM8650AU_PSAIL");
+    models[80] = Some("PM7550");
+    models[82] = Some("PMC8380");
+    models[83] = Some("SMB2360");
+    models[91] = Some("PMIV0108");
+    models
+};
+
+pub(crate) const IMAGE_NAMES: &[&CStr] = &[
+    c_str!("boot"),
+    c_str!("tz"),
+    c_str!("tzsecapp"),
+    c_str!("rpm"),
+    c_str!("sdi"),
+    c_str!("hyp"),
+    c_str!("adsp1"),
+    c_str!("adsp2"),
+    c_str!("cdsp2"),
+    c_str!("appsbl"),
+    c_str!("apps"),
+    c_str!("mpss"),
+    c_str!("adsp"),
+    c_str!("cnss"),
+    c_str!("video"),
+    c_str!("dsps"),
+    c_str!("cdsp"),
+    c_str!("npu"),
+    c_str!("wpss"),
+    c_str!("cdsp1"),
+    c_str!("gpdsp"),
+    c_str!("gpdsp1"),
+    c_str!("sensorpd"),
+    c_str!("audiopd"),
+    c_str!("oempd"),
+    c_str!("chargerpd"),
+    c_str!("oispd"),
+    c_str!("soccp"),
+    c_str!("tme"),
+    c_str!("gearvm"),
+    c_str!("uefi"),
+    c_str!("cdsp3"),
+    c_str!("audiopd"),
+    c_str!("audiopd"),
+    c_str!("dcp"),
+    c_str!("oobs"),
+    c_str!("oobns"),
+    c_str!("devcfg"),
+    c_str!("btpd"),
+    c_str!("qecp"),
+];
diff --git a/drivers/soc/qcom/socinfo/socinfo.rs b/drivers/soc/qcom/socinfo/socinfo.rs
new file mode 100644
index 0000000000000000000000000000000000000000..bff1bf8fd672e3c461352075aa85ef8fdedff953
--- /dev/null
+++ b/drivers/soc/qcom/socinfo/socinfo.rs
@@ -0,0 +1,362 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2025 Google LLC.
+
+//! Re-implementation of Qualcomm's Socinfo driver in Rust
+use core::fmt;
+use core::fmt::Formatter;
+use kernel::debugfs::{Scope, ScopedDir};
+use kernel::device::Core;
+use kernel::module_platform_driver;
+use kernel::platform::{self, Device};
+use kernel::prelude::{fmt, pin_data, Error, PinInit, Result};
+use kernel::soc;
+use kernel::str::{CStr, CStrExt, CString};
+use kernel::transmute::FromBytes;
+use kernel::{c_str, pr_warn, try_pin_init};
+use pin_init::pin_init_scope;
+
+mod bindings;
+mod data;
+
+use bindings::*;
+use data::{IMAGE_NAMES, PMIC_MODELS, SOC_IDS};
+
+module_platform_driver! {
+    type: QcomSocInfo,
+    name: "qcom-socinfo",
+    authors: ["Matthew Maurer"],
+    description: "Qualcomm SoCinfo driver",
+    license: "GPL",
+    alias: ["platform:qcom-socinfo"],
+}
+
+#[pin_data]
+struct QcomSocInfo {
+    #[pin]
+    registration: soc::DeviceRegistration,
+    #[pin]
+    params: Scope<Params>,
+}
+
+fn fmt_pmic_model(model: &u32, f: &mut Formatter<'_>) -> fmt::Result {
+    let model = SocInfo::version_split(*model).1;
+    if let Some(Some(model)) = PMIC_MODELS.get(model as usize) {
+        writeln!(f, "{model}")
+    } else {
+        writeln!(f, "unknown ({})", model)
+    }
+}
+
+fn fmt_pmic_die_rev(rev: &u32, f: &mut Formatter<'_>) -> fmt::Result {
+    let (major, minor) = SocInfo::version_split(*rev);
+    writeln!(f, "{major}.{minor}")
+}
+
+fn fmt_pmic_model_array(array: &&'static [PmicEntry], f: &mut Formatter<'_>) -> fmt::Result {
+    for pmic_entry in *array {
+        let (die_rev_major, die_rev_minor) =
+            SocInfo::version_split(u32::from_le(pmic_entry.die_rev));
+        let model_idx = SocInfo::version_split(pmic_entry.model).1 as usize;
+        if let Some(Some(model)) = PMIC_MODELS.get(model_idx) {
+            writeln!(f, "{model} {die_rev_major}.{die_rev_minor}")?
+        } else {
+            writeln!(f, "unknown ({})", pmic_entry.model)?
+        }
+    }
+    Ok(())
+}
+
+#[derive(Default)]
+struct Params {
+    info_fmt: u32,
+    build_id: [u8; 32],
+    raw_version: Option<u32>,
+    hardware_platform: Option<u32>,
+    platform_version: Option<u32>,
+    accessory_chip: Option<u32>,
+    hardware_platform_subtype: Option<u32>,
+    pmic_model: Option<u32>,
+    pmic_die_rev: Option<u32>,
+    foundry_id: Option<u32>,
+    pmic_model_array: Option<&'static [PmicEntry]>,
+    chip_family: Option<u32>,
+    raw_device_family: Option<u32>,
+    raw_device_number: Option<u32>,
+    nproduct_id: Option<u32>,
+    chip_id: Option<[u8; 32]>,
+    num_clusters: Option<u32>,
+    ncluster_array_offset: Option<u32>,
+    num_subset_parts: Option<u32>,
+    nsubset_parts_array_offset: Option<u32>,
+    nmodem_supported: Option<u32>,
+    feature_code: Option<u32>,
+    pcode: Option<u32>,
+    oem_variant: Option<u32>,
+    boot_core: Option<u32>,
+    boot_cluster: Option<u32>,
+    num_func_clusters: Option<u32>,
+    raw_package_type: Option<u32>,
+    versions: Option<&'static [ImageVersion]>,
+    versions2: Option<&'static [ImageVersion]>,
+}
+
+#[derive(Copy, Clone)]
+struct SocInfo<'a> {
+    soc_info: socinfo,
+    soc_info_mem: &'a [u8],
+    version_mem: &'a [u8],
+    version_mem2: Option<&'a [u8]>,
+}
+
+impl<'a> SocInfo<'a> {
+    fn from_mem(
+        soc_info_mem: &'a [u8],
+        version_mem: &'a [u8],
+        version_mem2: Option<&'a [u8]>,
+    ) -> Self {
+        Self {
+            soc_info: socinfo_from_partial_bytes(soc_info_mem),
+            soc_info_mem,
+            version_mem,
+            version_mem2,
+        }
+    }
+    fn id(&self) -> u32 {
+        u32::from_le(self.soc_info.id)
+    }
+    fn version_split(ver: u32) -> (u16, u16) {
+        let major = (ver >> 16) as u16;
+        let minor = (ver & 0xFFFF) as u16;
+        (major, minor)
+    }
+    fn version_fuse(major: u16, minor: u16) -> u32 {
+        (u32::from(major) << 16) | u32::from(minor)
+    }
+    fn version(&self) -> (u16, u16) {
+        Self::version_split(self.soc_info.ver)
+    }
+    fn serial(&self) -> u32 {
+        u32::from_le(self.soc_info.id)
+    }
+    fn machine(&self) -> Result<Option<CString>> {
+        for soc in SOC_IDS {
+            if soc.id == self.id() {
+                return Ok(Some(soc.name.to_cstring()?));
+            }
+        }
+        Ok(None)
+    }
+    fn device_attribute(&self) -> Result<soc::DeviceAttribute> {
+        Ok(soc::DeviceAttribute {
+            family: Some(c_str!("Snapdragon").to_cstring()?),
+            machine: self.machine()?,
+            revision: Some(CString::try_from_fmt(fmt!(
+                "{}.{}",
+                self.version().0,
+                self.version().1
+            ))?),
+            serial_number: Some(CString::try_from_fmt(fmt!("{}", self.serial()))?),
+            soc_id: Some(CString::try_from_fmt(fmt!("{}", self.id()))?),
+        })
+    }
+}
+
+macro_rules! u32_le_versioned {
+    { $params:expr, $self:ident,
+        [ $( { $major:expr, $minor:expr, { $( $dst:ident: $src:ident ),* } } ),*  ] } => {$(
+        if $params.info_fmt >= SocInfo::version_fuse($major, $minor) {
+            $( $params.$dst = Some(u32::from_le($self.soc_info.$src).into()) );*
+        }
+    )*}
+}
+
+impl SocInfo<'static> {
+    fn build_params(&self) -> Result<Params> {
+        let mut params = Params {
+            build_id: self.soc_info.build_id,
+            info_fmt: u32::from_le(self.soc_info.fmt),
+            ..Default::default()
+        };
+        u32_le_versioned! { params, self, [
+            {0, 2, { raw_version: raw_ver }},
+            {0, 3, { hardware_platform: hw_plat }},
+            {0, 4, { platform_version: plat_ver }},
+            {0, 5, { accessory_chip: accessory_chip }},
+            {0, 6, { hardware_platform_subtype: hw_plat_subtype }},
+            {0, 7, { pmic_model: pmic_model, pmic_die_rev: pmic_die_rev }},
+            {0, 9, { foundry_id: foundry_id }},
+            {0, 12, {
+                chip_family: chip_family,
+                raw_device_family: raw_device_family,
+                raw_device_number: raw_device_num
+            }},
+            {0, 13, { nproduct_id: nproduct_id }},
+            {0, 14, {
+                num_clusters: num_clusters,
+                ncluster_array_offset: ncluster_array_offset,
+                num_subset_parts: num_subset_parts,
+                nsubset_parts_array_offset: nsubset_parts_array_offset
+            }},
+            {0, 15, { nmodem_supported: nmodem_supported }},
+            {0, 16, { feature_code: feature_code, pcode: pcode }},
+            {0, 17, { oem_variant: oem_variant }},
+            {0, 19, {
+                boot_core: boot_core,
+                boot_cluster: boot_cluster,
+                num_func_clusters: num_func_clusters
+            }},
+            {0, 20, { raw_package_type: raw_package_type }}
+        ]};
+        if params.info_fmt >= SocInfo::version_fuse(0, 11) {
+            let offset = u32::from_le(self.soc_info.pmic_array_offset) as usize;
+            let num_pmics = u32::from_le(self.soc_info.num_pmics) as usize;
+            let size = num_pmics * core::mem::size_of::<PmicEntry>();
+            params.pmic_model_array =
+                PmicEntry::from_bytes_to_slice(&self.soc_info_mem[offset..offset + size]);
+        }
+        if params.info_fmt >= SocInfo::version_fuse(0, 13) {
+            params.chip_id = Some(self.soc_info.chip_id);
+        }
+        params.versions = ImageVersion::from_bytes_to_slice(self.version_mem);
+        params.versions2 = self
+            .version_mem2
+            .and_then(ImageVersion::from_bytes_to_slice);
+        Ok(params)
+    }
+}
+
+macro_rules! value_attrs {
+    ($builder:ident, $params:ident, @) => {};
+    ($builder:ident, $params:ident, @ $s:ident $($rest:tt)*) => {
+        if let Some(v) = $params.$s.as_ref() {
+            $builder.read_only_file(c_str!(stringify!($s)), v);
+        }
+        value_attrs!($builder, $params, @ $($rest)*)
+    };
+    ($builder:ident, $params:ident, @ {$s:ident, $cb:expr} $($rest:tt)*) => {
+        if let Some(v) = $params.$s.as_ref() {
+            $builder.read_callback_file(c_str!(stringify!($s)), v, $cb);
+        }
+        value_attrs!($builder, $params, @ $($rest)*)
+    };
+    ($builder:ident, $params:ident, {$($items:tt),*}) => {
+        value_attrs!($builder, $params, @ $($items)*)
+    };
+}
+
+fn no_quirk<const SIZE: usize>(buf: &[u8; SIZE], f: &mut Formatter<'_>) -> fmt::Result {
+    if buf[0] == 0 {
+        writeln!(f)
+    } else {
+        nul_array(buf, f)
+    }
+}
+
+fn nul_array<const SIZE: usize>(buf: &[u8; SIZE], f: &mut Formatter<'_>) -> fmt::Result {
+    if let Some(end) = buf.iter().position(|x| *x == 0) {
+        if end == 0 {
+            // Match original driver quirk - empty strings don't have a trailing newline
+            return Ok(());
+        }
+        let Ok(c_str) = CStr::from_bytes_with_nul(&buf[0..=end]) else {
+            pr_warn!("Creating CStr from bytes with known first NUL failed?");
+            return Ok(());
+        };
+        let Ok(str) = c_str.to_str() else {
+            pr_warn!("Non-unicode-compatible character in string");
+            return Ok(());
+        };
+        writeln!(f, "{str}")
+    } else {
+        writeln!(f, "Missing NUL: {buf:?}")
+    }
+}
+
+impl ImageVersion {
+    fn build_debugfs<'a>(&'a self, dir: &ScopedDir<'a, '_>, image_name: &CStr) {
+        let subdir = dir.dir(image_name);
+        subdir.read_callback_file(c_str!("name"), &self.name, &nul_array);
+        subdir.read_callback_file(c_str!("variant"), &self.variant, &nul_array);
+        subdir.read_callback_file(c_str!("oem"), &self.oem, &nul_array);
+    }
+}
+
+fn hex(x: &u32, f: &mut Formatter<'_>) -> fmt::Result {
+    writeln!(f, "{x:#010x}")
+}
+
+impl Params {
+    fn build_debugfs<'data>(&'data self, dir: &ScopedDir<'data, '_>) {
+        dir.read_callback_file(c_str!("info_fmt"), &self.info_fmt, &hex);
+        dir.read_callback_file(c_str!("build_id"), &self.build_id, &no_quirk);
+        value_attrs!(dir, self, {
+            raw_version,
+            hardware_platform,
+            platform_version,
+            accessory_chip,
+            hardware_platform_subtype,
+            {raw_device_number, &hex},
+            {raw_device_family, &hex},
+            {chip_family, &hex},
+            {chip_id, &nul_array},
+            nproduct_id,
+            nsubset_parts_array_offset,
+            num_subset_parts,
+            ncluster_array_offset,
+            num_clusters,
+            nmodem_supported,
+            pcode,
+            feature_code,
+            oem_variant,
+            boot_core,
+            boot_cluster,
+            num_func_clusters,
+            foundry_id,
+            raw_package_type,
+            {pmic_model, &fmt_pmic_model},
+            {pmic_die_rev, &fmt_pmic_die_rev},
+            {pmic_model_array, &fmt_pmic_model_array}
+        });
+        let versions = self.versions.unwrap_or(&[]);
+        let versions2 = self.versions2.unwrap_or(&[]);
+        for (version, image_name) in versions
+            .iter()
+            .take(32)
+            .chain(versions2.iter())
+            .zip(IMAGE_NAMES.iter())
+        {
+            version.build_debugfs(dir, image_name);
+        }
+    }
+}
+
+impl platform::Driver for QcomSocInfo {
+    type IdInfo = ();
+    const OF_ID_TABLE: Option<kernel::of::IdTable<Self::IdInfo>> = None;
+    fn probe(_dev: &Device<Core>, _id_info: Option<&Self::IdInfo>) -> impl PinInit<Self, Error> {
+        pin_init_scope(|| {
+            let soc_info_mem = qcom_smem_get(
+                kernel::bindings::QCOM_SMEM_HOST_ANY,
+                kernel::bindings::SMEM_HW_SW_BUILD_ID,
+            )?;
+            let version_mem = qcom_smem_get(
+                kernel::bindings::QCOM_SMEM_HOST_ANY,
+                bindings::SMEM_IMAGE_VERSION_TABLE,
+            )?;
+            let version_mem2 = qcom_smem_get(
+                kernel::bindings::QCOM_SMEM_HOST_ANY,
+                bindings::SMEM_IMAGE_VERSION_TABLE_2,
+            )
+            .ok();
+            let info = SocInfo::from_mem(soc_info_mem, version_mem, version_mem2);
+            let backing = info.build_params()?;
+            kernel::rand::add_device_randomness(soc_info_mem);
+            Ok(try_pin_init!(Self {
+                registration <- soc::DeviceRegistration::register(info.device_attribute()?),
+                params <- Scope::dir(backing, c_str!("qcom_socinfo"),
+                                     Params::build_debugfs),
+            }? Error))
+        })
+    }
+}
diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
index 60910ba8731180516b4980b9e0dc5fb0c297da55..da13dc073ae1f41e9f0a835510fdc36b23ff1a4d 100644
--- a/rust/bindgen_parameters
+++ b/rust/bindgen_parameters
@@ -72,3 +72,4 @@
 # We can't auto-derive AsBytes, as we need a const-time check to see if there
 # is padding involved. Add it explicitly when you expect no padding.
 --with-derive-custom-struct cpumask=AsBytesTrait
+--with-derive-custom-struct socinfo=AsBytesTrait
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 9fdf76ca630e00715503e2a3a809bedc895697fd..b076b847731d97cf345d8ef80df9c315a79c8fab 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -95,6 +95,12 @@
  */
 #include <../../drivers/base/base.h>
 
+#if IS_ENABLED(CONFIG_QCOM_SOCINFO)
+#include <dt-bindings/arm/qcom,ids.h>
+#include <linux/soc/qcom/smem.h>
+#include <linux/soc/qcom/socinfo.h>
+#endif
+
 #if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
 // Used by `#[export]` in `drivers/gpu/drm/drm_panic_qr.rs`.
 #include <drm/drm_panic.h>

---
base-commit: 4b31c90f86768367c84cc6e99e1deee0ec55197b
change-id: 20251029-qcom-socinfo-d8387c7fdb1c
prerequisite-change-id: 20251029-soc-bindings-9b0731bcdbed:v1
prerequisite-patch-id: e4da423ddabec93bd9a64004691266f9b740e0c5
prerequisite-patch-id: 5097ff622f8cb1d38354674cf70c1c946ac87f6c
prerequisite-change-id: 20251029-add-entropy-f57e12ebe110:v1
prerequisite-patch-id: 657de204912d2c5efff9898d3f4c51e52684d8e6
prerequisite-change-id: 20251212-transmute-8ab6076700a8:v1
prerequisite-patch-id: 4f5f7cb002d02d232083ab5c3ce6b3cb90650bd6
prerequisite-patch-id: 01a1f3d727e549c173dd142180741f5b6a3c866e
prerequisite-patch-id: ff801a7ae439876b1554b4d1132d94c825bbe74f

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>


