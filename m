Return-Path: <linux-arm-msm+bounces-118625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dLYYA35wVGpImAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 06:58:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 228D27472C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 06:58:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="QSQM/9Fw";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118625-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118625-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 56A7B3001FB5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 04:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F5634FF78;
	Mon, 13 Jul 2026 04:58:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4F334B1B0;
	Mon, 13 Jul 2026 04:58:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783918712; cv=none; b=KqZ+nKjfhRQxAxxrAA3dYHjPnG6NDLNKkmy2V/nzilXRHejv0CS3zV6OMUiF9UVUVp9ewVb+omuJnha8fcengoglx16gPkA/AnNe3CfkGZtGWT3EWHFJ8T3WRkm5DqxKQ3uL1VNZpbM1K1ix0M7HPhMhJ4mugNlfNvAN2tHNx6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783918712; c=relaxed/simple;
	bh=5njnKo29w8kc6JMHRuRJGIrtXmktba8Y7wx2HHDcCzU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BSJwFg29hZ5fsQzNZwP2eL3/P67m1wie8NtPZH/m3zPxY0TsIQDQ4Ud1VGxZ4u16c6ZHSpOYDJhDOV6pL1vkZ+s1eTXyuOi350xlROs8rojl6CQZ3CPV4xw66pLdrfftTLLmCYAYF96o7EgK2wwY817oX/buSZeOHbmuIvnrTXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QSQM/9Fw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 935DC1F000E9;
	Mon, 13 Jul 2026 04:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783918711;
	bh=KRUKLnvBs/SujqKpE+qYHik+YrUz1JqhUnXNKN/zyLI=;
	h=From:To:Cc:Subject:Date;
	b=QSQM/9Fw+cphQhyWjHsrTU5EheVronz7E+s057woHyKnzTP+s830YJyBpCf5wGsAc
	 slcNop12xvpL+k8kBzLHUddudjq6A/Qf3wIPov9F1cnVcEiV9RCr4zlppbJycmMJaD
	 /+bbSCCxxwTs7x9fP3LhMBOnzwQw7Cw7ApTgl/W8yBIY1Is9k/sA1lqkL+AG5ttv7Z
	 ijOOOSWBLxUwBvEODGxYa47CKGqv7DZQ04OCIYHhslwARYhSigINE9Mth2EsUT/z66
	 sitk5jPApDN6C1UgG/ppHC7X0OA4C5ZtpUhvGtqxSHomG9mmWJVcWbnDcGADWikT2M
	 CswpVgbiX0/qQ==
From: Sumit Garg <sumit.garg@kernel.org>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	linux-kernel@vger.kernel.org,
	bartosz.golaszewski@oss.qualcomm.com,
	harshal.dev@oss.qualcomm.com,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] firmware: qcom: scm: fold tzmem into the qcom-scm module
Date: Mon, 13 Jul 2026 10:28:11 +0530
Message-ID: <20260713045811.484554-1-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:sumit.garg@oss.qualcomm.com,m:lkp@intel.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118625-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[sumit.garg@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 228D27472C7

From: Sumit Garg <sumit.garg@oss.qualcomm.com>

qcom_scm and qcom_tzmem have a mutual symbol dependency: qcom_tzmem
calls qcom_scm_shm_bridge_{enable,create,delete}() while qcom_scm
calls qcom_tzmem_{alloc,free,to_phys}() and qcom_scm_get_tzmem_pool().
When both are built as modules this results in a circular module
dependency and depmod fails:

  depmod: ERROR: Cycle detected: qcom_scm -> qcom_tzmem -> qcom_scm

QCOM_TZMEM is an invisible tristate that is only ever selected by
QCOM_SCM, so the two are always enabled together. Build qcom_tzmem.o
as part of the qcom-scm composite module instead of as a separate
module. This breaks the cycle since the mutual symbol references
become intra-module.

With tzmem now internal to qcom-scm, the shm_bridge helpers are no
longer used outside the module, so drop their EXPORT_SYMBOL_GPL() and
move the declarations from the public header to the private one,
alongside qcom_scm_shm_bridge_enable().

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202607122327.3zkZCUaB-lkp@intel.com/
Assisted-by: Copilot:claude-opus-4.8
Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/firmware/qcom/Makefile         | 2 +-
 drivers/firmware/qcom/qcom_scm.c       | 3 ---
 drivers/firmware/qcom/qcom_scm.h       | 4 ++++
 include/linux/firmware/qcom/qcom_scm.h | 5 -----
 4 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
index 48801d18f37b..55751d282689 100644
--- a/drivers/firmware/qcom/Makefile
+++ b/drivers/firmware/qcom/Makefile
@@ -5,7 +5,7 @@
 
 obj-$(CONFIG_QCOM_SCM)		+= qcom-scm.o
 qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
-obj-$(CONFIG_QCOM_TZMEM)	+= qcom_tzmem.o
+qcom-scm-$(CONFIG_QCOM_TZMEM)	+= qcom_tzmem.o
 obj-$(CONFIG_QCOM_QSEECOM)	+= qcom_qseecom.o
 obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) += qcom_qseecom_uefisecapp.o
 obj-$(CONFIG_QCOM_PAS)		+= qcom_pas.o
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 1deee6aea387..3495cd8af715 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1813,7 +1813,6 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev)
 
 	return res.result[0];
 }
-EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_enable);
 
 int qcom_scm_shm_bridge_create(u64 pfn_and_ns_perm_flags,
 			       u64 ipfn_and_s_perm_flags, u64 size_and_flags,
@@ -1841,7 +1840,6 @@ int qcom_scm_shm_bridge_create(u64 pfn_and_ns_perm_flags,
 
 	return ret ?: res.result[0];
 }
-EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_create);
 
 int qcom_scm_shm_bridge_delete(u64 handle)
 {
@@ -1855,7 +1853,6 @@ int qcom_scm_shm_bridge_delete(u64 handle)
 
 	return qcom_scm_call(__scm->dev, &desc, NULL);
 }
-EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_delete);
 
 int qcom_scm_lmh_profile_change(u32 profile_id)
 {
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index caab80a73e17..0e7cd1e31d6f 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -84,6 +84,10 @@ int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
 
 struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void);
 int qcom_scm_shm_bridge_enable(struct device *scm_dev);
+int qcom_scm_shm_bridge_create(u64 pfn_and_ns_perm_flags,
+			       u64 ipfn_and_s_perm_flags, u64 size_and_flags,
+			       u64 ns_vmids, u64 *handle);
+int qcom_scm_shm_bridge_delete(u64 handle);
 
 #define QCOM_SCM_SVC_BOOT		0x01
 #define QCOM_SCM_BOOT_SET_ADDR		0x01
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index a0a6bc0229c4..b7d5f30876e1 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -133,11 +133,6 @@ bool qcom_scm_lmh_dcvsh_available(void);
 
 int qcom_scm_gpu_init_regs(u32 gpu_req);
 
-int qcom_scm_shm_bridge_create(u64 pfn_and_ns_perm_flags,
-			       u64 ipfn_and_s_perm_flags, u64 size_and_flags,
-			       u64 ns_vmids, u64 *handle);
-int qcom_scm_shm_bridge_delete(u64 handle);
-
 #ifdef CONFIG_QCOM_QSEECOM
 
 int qcom_scm_qseecom_app_get_id(const char *app_name, u32 *app_id);
-- 
2.53.0


