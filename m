Return-Path: <linux-arm-msm+bounces-90030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIiSCMzjcGk+awAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 15:33:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 827CD587BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 15:33:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 074C7A67104
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 14:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C8F3F23CD;
	Wed, 21 Jan 2026 14:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jnrou/d2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602FC35CB8B;
	Wed, 21 Jan 2026 14:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769004772; cv=none; b=lt3E0x2+CjejSZA8wbelDhErKqeNW+rLXZGI5gMmd5eK0qkS3qTAJ7Ey27ozLOwrTFLyizzskBll+BunuAst6AZi96mPCtOvgRhk9klFHvmsTZVYf3EuCzC1MizfQ1YBHGdYjUahQPc4Hv+tfJtlAfBkHJO0AlOXDpQHcbz1dsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769004772; c=relaxed/simple;
	bh=NMeGPeN4Az86A7XdQHvtysmamsBih2zJZhBWozZM4e0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HXr9COzgNmhv+jhOLNAW/Glt36fFzpBcUKwWzho0vjykqN3fAZ9sHy52vQszxps3X0IUv4ayeRV4oDzPHUlMkWYMtJiSLiop1Zc6rxjXDN7hM/YNUFvP53NL/hH6hDeMRW4naAum66fhGN2cc/vGm2vEMy3uN0k0YnF4IPDrCzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jnrou/d2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 949F2C4CEF1;
	Wed, 21 Jan 2026 14:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769004771;
	bh=NMeGPeN4Az86A7XdQHvtysmamsBih2zJZhBWozZM4e0=;
	h=From:To:Cc:Subject:Date:From;
	b=Jnrou/d2+f/Q+JxskKoN2Xnk3JHGwvdCE0OypowZPhGFCZC18fd1kbjH7IWgJQ2C+
	 Z+aU1xoVL2gH8akofw5dzGDbtVbrYe2k05gWEvWdpd6rH8IpfchqB8Dmr4PbmNDOm5
	 FE4WJhjACV9J4Ce+9eAMjLmNHCffqPLmWLZJykpioT7Zua3P1sTVfODxiGwAUtfs3W
	 7e3Qe2q8WagrTvZ6bxFMZ1hoSxZKctzQ+dFlUAf+RnI7QWZffcLLqMXgR/UrnimBcS
	 ssrmW4m6bJyP/aeJhkW5j10LaMV6Obka2UBmGIOV33xrf3MtgXsSqArERGlH796a2K
	 g/NgaYhyQSRFw==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	broonie@kernel.org,
	will@kernel.org,
	robin.murphy@arm.com,
	joro@8bytes.org,
	robin.clark@oss.qualcomm.com,
	hanguidong02@gmail.com,
	quic_c_gdjako@quicinc.com,
	dmitry.baryshkov@oss.qualcomm.com
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] iommu/arm-smmu-qcom: do not register driver in probe()
Date: Wed, 21 Jan 2026 15:12:01 +0100
Message-ID: <20260121141215.29658-1-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90030-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,arm.com,8bytes.org,oss.qualcomm.com,gmail.com,quicinc.com];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 827CD587BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit 0b4eeee2876f ("iommu/arm-smmu-qcom: Register the TBU driver in
qcom_smmu_impl_init") intended to also probe the TBU driver when
CONFIG_ARM_SMMU_QCOM_DEBUG is disabled, but also moved the corresponding
platform_driver_register() call into qcom_smmu_impl_init() which is
called from arm_smmu_device_probe().

However, it neither makes sense to register drivers from probe()
callbacks of other drivers, nor does the driver core allow registering
drivers with a device lock already being held.

The latter was revealed by commit dc23806a7c47 ("driver core: enforce
device_lock for driver_match_device()") leading to a deadlock condition
described in [1].

Additionally, it was noted by Robin that the current approach is
potentially racy with async probe [2].

Hence, fix this by registering the qcom_smmu_tbu_driver from
module_init(). Unfortunately, due to the vendoring of the driver, this
requires an indirection through arm-smmu-impl.c.

Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/lkml/7ae38e31-ef31-43ad-9106-7c76ea0e8596@sirena.org.uk/
Link: https://lore.kernel.org/lkml/DFU7CEPUSG9A.1KKGVW4HIPMSH@kernel.org/ [1]
Link: https://lore.kernel.org/lkml/0c0d3707-9ea5-44f9-88a1-a65c62e3df8d@arm.com/ [2]
Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_device()")
Fixes: 0b4eeee2876f ("iommu/arm-smmu-qcom: Register the TBU driver in qcom_smmu_impl_init")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 14 +++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 14 +++++++++----
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 24 +++++++++++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  5 +++++
 4 files changed, 52 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
index db9b9a8e139c..4565a58bb213 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
@@ -228,3 +228,17 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
 
 	return smmu;
 }
+
+int __init arm_smmu_impl_module_init(void)
+{
+	if (IS_ENABLED(CONFIG_ARM_SMMU_QCOM))
+		return qcom_smmu_module_init();
+
+	return 0;
+}
+
+void __exit arm_smmu_impl_module_exit(void)
+{
+	if (IS_ENABLED(CONFIG_ARM_SMMU_QCOM))
+		qcom_smmu_module_exit();
+}
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 573085349df3..22906d2c9a2d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -774,10 +774,6 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
 {
 	const struct device_node *np = smmu->dev->of_node;
 	const struct of_device_id *match;
-	static u8 tbu_registered;
-
-	if (!tbu_registered++)
-		platform_driver_register(&qcom_smmu_tbu_driver);
 
 #ifdef CONFIG_ACPI
 	if (np == NULL) {
@@ -802,3 +798,13 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
 
 	return smmu;
 }
+
+int __init qcom_smmu_module_init(void)
+{
+	return platform_driver_register(&qcom_smmu_tbu_driver);
+}
+
+void __exit qcom_smmu_module_exit(void)
+{
+	platform_driver_unregister(&qcom_smmu_tbu_driver);
+}
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 5e690cf85ec9..1e218fbea35a 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -2365,7 +2365,29 @@ static struct platform_driver arm_smmu_driver = {
 	.remove = arm_smmu_device_remove,
 	.shutdown = arm_smmu_device_shutdown,
 };
-module_platform_driver(arm_smmu_driver);
+
+static int __init arm_smmu_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&arm_smmu_driver);
+	if (ret)
+		return ret;
+
+	ret = arm_smmu_impl_module_init();
+	if (ret)
+		platform_driver_unregister(&arm_smmu_driver);
+
+	return ret;
+}
+module_init(arm_smmu_init);
+
+static void __exit arm_smmu_exit(void)
+{
+	arm_smmu_impl_module_exit();
+	platform_driver_unregister(&arm_smmu_driver);
+}
+module_exit(arm_smmu_exit);
 
 MODULE_DESCRIPTION("IOMMU API for ARM architected SMMU implementations");
 MODULE_AUTHOR("Will Deacon <will@kernel.org>");
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 2dbf3243b5ad..26d2e33cd328 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -540,6 +540,11 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu);
 struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu);
 struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu);
 
+int __init arm_smmu_impl_module_init(void);
+void __exit arm_smmu_impl_module_exit(void);
+int __init qcom_smmu_module_init(void);
+void __exit qcom_smmu_module_exit(void);
+
 void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx);
 int arm_mmu500_reset(struct arm_smmu_device *smmu);
 

base-commit: dc23806a7c47ec5f1293aba407fb69519f976ee0
-- 
2.52.0


