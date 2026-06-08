Return-Path: <linux-arm-msm+bounces-111644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x6EGCGoyJmpdTQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 05:09:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF08652634
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 05:09:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SPALk4g9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111644-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111644-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18AB7300BD93
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 03:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D15133AD8A;
	Mon,  8 Jun 2026 03:08:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3EA3290B0
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 03:08:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780888132; cv=none; b=P+sf2yt8GDl9tyzCPSpWv5eWE5hK4g3YJaXTimmKYKNDeYpGxzywfLXVIYutW75nJEAWFwb6NIlcr5hZVXUrNHA7qyGzDTwtOK+7cHC8h4eOmEhbT8VuELvpviP3VYm2KFk4K02yyn6aSk4O+vsOC7Gexj9/k6qpIwHvGq9Wf0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780888132; c=relaxed/simple;
	bh=YcKwHB8U71PQcf67kPqmjgufYxmAQFBtHtM+9y9QGOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CoyVfdmJrDmRGsm/BZlYMtqon9+LJpKi30WG4y6/R1FQ5FZhcka6dXQNMatFRK7WBDNZG+S3f5HCTMmxLPcR5U8t7vCpf3B2x94PLuYFwTXjs7HbA8Wi+xFUnVP9f9obGJgitM74q7XM6tsS9ZfGEb+TecTLpSl7gkB0e0HffQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SPALk4g9; arc=none smtp.client-ip=209.85.160.177
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5176fc0cc72so41175911cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 20:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780888130; x=1781492930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6S6dXQ26u/Br+eaWfk8QstdVjG8sRpZI+a8oo+fYY5M=;
        b=SPALk4g9cI1UaEwym8S6elTZPl5fvdtqqSFt7b2r40l1rNMdH60FF9sXDazT2tI4HQ
         qSnjSqiKLj8k+jGeuaQ5NuKLLgLrqO6twpHRWJATLE9gmAJSZ9Y/YRL6vO/EtsffGsI8
         tgzxh3/qKDup8JHxebXjWcIZIQXBlaSDaxUsM0RmG2EtqNj7u4Dji3LbFm1dP46Vh5uO
         EhQQ0AwhLkYLsI90/kIp3SwpIUw6bLot/cmGUy2Wpojl99RmYmlpf0EMKh6iO78muB3Z
         Hv31y7L3lJ6wp+lrrEoeHFNeocOkBeKhKQ4CTcAwd8Zy76aEV5sajiqC/oZ0FUZ8+6y3
         j16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780888130; x=1781492930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6S6dXQ26u/Br+eaWfk8QstdVjG8sRpZI+a8oo+fYY5M=;
        b=ooZkQCVBS/9JTii3amwFX1M7tRX3F/h2ZHRvwOUuKDF98/2wQ9GbSOqR7dRg5OuilP
         JIjTJUGpMMwG3aAUkIsO5iTicuwiWpthDpePJG1FoC7BOP1iRiQN3bIRgGZKWJ0q1t4M
         vX9uxrxWv0CBNIJDC2Q7VxS8K7ihZOkiGPkX0WReDamqtpf1Dt4gRqhMS2XSpy+yMLQz
         1OBhvSuky/raI62wVrn/tI9nGuHaFuVhymop8qzxMp9cNAgXqArh2PUs9uJNHIqToQAY
         yUIiKD4ayEyL+MQWhd6XOuTCQOQmVfFdsrYVt+y1NhmfpZl+v6Ee4geZXoEUmf/V9cbH
         e2ig==
X-Forwarded-Encrypted: i=1; AFNElJ8BK56CKR0y5vM5cDUrgUcJ33fY0nPFSe2XnRCoTFtrSXcuD1kjXUsaS8XLjBVF8N50kYR3VtkcK2KjFEDS@vger.kernel.org
X-Gm-Message-State: AOJu0YyrExEc4I2uPFoAsBnfeTvY1FeRuEn9lm5OrALqi8LPWSEddgAB
	996K8qTxlFsFhRFN9gP18ObldpjZdDwIxgi89m/LxOpkZ/hm/ImNJQOV
X-Gm-Gg: Acq92OH3dWLATvzWElSVuhp0JhgCnNODRz6uDcRKnZK1NW2cYQEuiuJ4czpvJ0HtBP0
	6v3D5mJG9TDcHvRIHqBKNWIUk/muPcgZfGAkfadnOYuvcTsES8JO6ItG/d/WgnMtnwKSD4RnsKi
	KAsmbueMl/Jg6hsbR7nu+3mO3aXlq6gYm8F/DPLgkyyu5yM2icNDjuVUECcwFc+dNIZ0FdqD5tp
	SdOkHeXAcqNeAsF2JGIVP3oZ72sIsmd5ieeibly1kvXzE0ssy53LPQ7PTVLBWpsUO0Orejd8i01
	oo5ElpFantTd/PjTrHh+oSUXwHVOzZ2+kPkXqyxTwhohTzZNwo/3lxRQdy3rYAWblLl8t/xTcHJ
	jdheohXsyE0JKpYepEV9/7YKA84ZM58ss/m64Tr67Mg08Hn/zqyTW2qhFVpqXc80gil+sIfS/hK
	jbe7L79cVrKPS43YtLFgla6QuanagjlWr2JxulUVE4xVYf1qEcVthvJMui4dob5A==
X-Received: by 2002:a05:622a:834d:b0:517:a133:7b91 with SMTP id d75a77b69052e-517a1337de6mr125318111cf.16.1780888129733;
        Sun, 07 Jun 2026 20:08:49 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd0535b0sm152128986d6.28.2026.06.07.20.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 20:08:49 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] dmaengine: qcom: hidma-mgmt: Fix sysfs cleanup on setup failure
Date: Sun,  7 Jun 2026 23:08:46 -0400
Message-ID: <20260608030846.2602111-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,lists.infradead.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111644-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:okaya@kernel.org,m:dmaengine@vger.kernel.org,m:Frank.Li@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dbgh9129@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dbgh9129@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dbgh9129@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6EF08652634

hidma_mgmt_init_sys() creates the chanops kobject, per-channel
kobjects and sysfs files incrementally. If a later creation step fails,
the function returns without tearing down the objects already created.

Those sysfs callbacks reference devm-managed driver data. A later probe
failure can free that data while the sysfs entries and kobjects remain
registered.

Track the chanops kobject in struct hidma_mgmt_dev, unwind the sysfs
files and channel kobjects on setup failure, and register the same
cleanup with devm after successful setup.

Fixes: 7f8f209fd6e0 ("dmaengine: add Qualcomm Technologies HIDMA management driver")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/dma/qcom/hidma_mgmt.h     |  1 +
 drivers/dma/qcom/hidma_mgmt_sys.c | 65 +++++++++++++++++++++++++------
 2 files changed, 55 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/qcom/hidma_mgmt.h b/drivers/dma/qcom/hidma_mgmt.h
index 30e8095988bf..4fb6759e3371 100644
--- a/drivers/dma/qcom/hidma_mgmt.h
+++ b/drivers/dma/qcom/hidma_mgmt.h
@@ -24,6 +24,7 @@ struct hidma_mgmt_dev {
 	resource_size_t addrsize;
 
 	struct kobject **chroots;
+	struct kobject *chanops;
 	struct platform_device *pdev;
 };
 
diff --git a/drivers/dma/qcom/hidma_mgmt_sys.c b/drivers/dma/qcom/hidma_mgmt_sys.c
index 930eae0a6257..280b3af6ec03 100644
--- a/drivers/dma/qcom/hidma_mgmt_sys.c
+++ b/drivers/dma/qcom/hidma_mgmt_sys.c
@@ -231,20 +231,52 @@ static int create_sysfs_entry_channel(struct hidma_mgmt_dev *mdev, char *name,
 	return sysfs_create_file(parent, &chattr->attr.attr);
 }
 
+static void hidma_mgmt_uninit_sys(struct hidma_mgmt_dev *mdev,
+				  unsigned int sysfs_count,
+				  unsigned int chroot_count)
+{
+	unsigned int i;
+
+	for (i = 0; i < sysfs_count; i++) {
+		struct attribute attr = { .name = hidma_mgmt_files[i].name };
+
+		sysfs_remove_file(&mdev->pdev->dev.kobj, &attr);
+	}
+
+	for (i = 0; i < chroot_count; i++) {
+		kobject_put(mdev->chroots[i]);
+		mdev->chroots[i] = NULL;
+	}
+
+	if (mdev->chanops) {
+		kobject_put(mdev->chanops);
+		mdev->chanops = NULL;
+	}
+}
+
+static void hidma_mgmt_uninit_sys_action(void *data)
+{
+	struct hidma_mgmt_dev *mdev = data;
+
+	hidma_mgmt_uninit_sys(mdev, ARRAY_SIZE(hidma_mgmt_files),
+			      mdev->dma_channels);
+}
+
 int hidma_mgmt_init_sys(struct hidma_mgmt_dev *mdev)
 {
+	unsigned int chroot_count = 0;
+	unsigned int sysfs_count = 0;
 	unsigned int i;
-	int rc;
 	int required;
-	struct kobject *chanops;
+	int rc;
 
 	required = sizeof(*mdev->chroots) * mdev->dma_channels;
 	mdev->chroots = devm_kmalloc(&mdev->pdev->dev, required, GFP_KERNEL);
 	if (!mdev->chroots)
 		return -ENOMEM;
 
-	chanops = kobject_create_and_add("chanops", &mdev->pdev->dev.kobj);
-	if (!chanops)
+	mdev->chanops = kobject_create_and_add("chanops", &mdev->pdev->dev.kobj);
+	if (!mdev->chanops)
 		return -ENOMEM;
 
 	/* create each channel directory here */
@@ -252,9 +284,12 @@ int hidma_mgmt_init_sys(struct hidma_mgmt_dev *mdev)
 		char name[20];
 
 		snprintf(name, sizeof(name), "chan%d", i);
-		mdev->chroots[i] = kobject_create_and_add(name, chanops);
-		if (!mdev->chroots[i])
-			return -ENOMEM;
+		mdev->chroots[i] = kobject_create_and_add(name, mdev->chanops);
+		if (!mdev->chroots[i]) {
+			rc = -ENOMEM;
+			goto err_uninit;
+		}
+		chroot_count++;
 	}
 
 	/* populate common parameters */
@@ -262,7 +297,9 @@ int hidma_mgmt_init_sys(struct hidma_mgmt_dev *mdev)
 		rc = create_sysfs_entry(mdev, hidma_mgmt_files[i].name,
 					hidma_mgmt_files[i].mode);
 		if (rc)
-			return rc;
+			goto err_uninit;
+
+		sysfs_count++;
 	}
 
 	/* populate parameters that are per channel */
@@ -271,15 +308,21 @@ int hidma_mgmt_init_sys(struct hidma_mgmt_dev *mdev)
 						(S_IRUGO | S_IWUGO), i,
 						mdev->chroots[i]);
 		if (rc)
-			return rc;
+			goto err_uninit;
 
 		rc = create_sysfs_entry_channel(mdev, "weight",
 						(S_IRUGO | S_IWUGO), i,
 						mdev->chroots[i]);
 		if (rc)
-			return rc;
+			goto err_uninit;
 	}
 
-	return 0;
+	return devm_add_action_or_reset(&mdev->pdev->dev,
+					hidma_mgmt_uninit_sys_action, mdev);
+
+err_uninit:
+	hidma_mgmt_uninit_sys(mdev, sysfs_count, chroot_count);
+
+	return rc;
 }
 EXPORT_SYMBOL_GPL(hidma_mgmt_init_sys);
-- 
2.43.0


