Return-Path: <linux-arm-msm+bounces-106958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YACFGv/sAWrTmQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:51:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 872F0510963
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:51:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D13C3056D51
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C19743FE666;
	Mon, 11 May 2026 14:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BLK6hae5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CC73D9028
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 14:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510522; cv=none; b=NExML0QIPv7qX0kZ7CtIb8LtV36k7aOMM8iHBSGfCc+eVd9tqDFW7mQJ4DS5rpMlKUncgAdl/7YRVnT963ehh0dsRNGJ1BA4/SLTZeIyL/7tAl0Hz4GJxKHNXeSi/Pm/duJLQVkW0Qxf2/7NZ+6liGcRPDUKZbKc5vJqc0c3EEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510522; c=relaxed/simple;
	bh=Y73P+DS/FTU/93/7veziKipaMWdTKZWFtdrT9hZPEZ8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=evdECXyCc0h0JfqORmi6vfEG+TFMcUFGEysj1JCgX2MijIa9974tIjlCNCdAaNhnOghPajiSK2qEfOYmwUDmfFgxnOB/9Q2maUe8on8fRFtkBxSID9aIhnQef12J6xkkL5RuIcpcgNcn6o3BEoX+/+3bFZ0wUMVn+/m3ewhH2gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BLK6hae5; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c8025500cc7so3132825a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 07:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778510520; x=1779115320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1QMruzNzp/w/H8WMl6Rm7xeR7IZKT2QV9Y6KPDlL64Q=;
        b=BLK6hae51WcGJrI7CQVOQVyqr0fs6P7kAD1QXrbHTBEjCyLLbxepzGX6GNWNBsJ2k3
         KWFi6PHCVB9oRtsJue5pveKBG4gz3YaoS4aNhYtfxvPVtLGkFjm+H79ZnLxx/wgeZbIk
         rp0fk1yXcgosa4v567iQvjTkFPU7o+XHg4YD0jak/RJvEIqXr4sW3+XD5PkHbzUm+tBa
         vRumId3R7vS3JZxeB6xYAD7HfH8TBPruwMsoaiGFd3dUmOWEig5CxJvZcRQAH4AJZr9n
         DQuTXaUGTgU1sL7aoJ2VbX28K2kZrP0pk23cRdbRsUzEHnUZ3cSYZY0xCFK2AG82V/j3
         /pog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510520; x=1779115320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1QMruzNzp/w/H8WMl6Rm7xeR7IZKT2QV9Y6KPDlL64Q=;
        b=BBYwPKpm+5YOt8wetAaCOA5WovCxo4jEiRjVlQv2PZWIOjDzcKz84qg7Ixoky8lSEn
         OhRH1eqpBhaPCQr246HjdIYSLzB/f0HeRqlcgEJYhqynrm/RQ8W7NcqmbnGYKMEbOK0k
         Cmy9v96wAAun4McmQsX5MZ1w98WsBsuA7LNsun247Zs/nZCYzsRByZm6pfIoQamOHm+k
         AliKYsfi3YbM/ur2Wx/2CPGI7yhNYGebvlLRmkFVypt/EXIQgSmNIK4GtqWlaf/xdbFz
         IMUI4xcudjNpPW5XAH6B2+amOcrXwxMoncJUu2rueo0FT19UBzC9PbacCMTxziIv/3r7
         JjGQ==
X-Gm-Message-State: AOJu0YwPrAkvMz6HGzYXbOhNMCetMj3E0AKxCqKicwpPjIG57QOZdgGU
	m8SJ0qvck67EBkSWRdtJDSJsmkq1b/QzO909wkqg9ahy+mXYwFAQf5MIa+SR1b895bo=
X-Gm-Gg: Acq92OEK0TWariOcl3H1RnE+xzFcZ0d/eiR58+O4WcDggk55OTpcszkMKGffxrsxWLn
	z2oqlqTmQkBi5CehEr6xyLEdHB9xRR9ezgFREpsvIcZcK7uHmXH5pA7J/yxDaq9vHjNkEgAcTf8
	m2KXb1ll3xlS0ypJu6tNjkgvD08jSS0/hTcagpD9kUq2YuchB2xgMg4QzTVhAAQBt2aGdtGT9bk
	LIrorIPdcMGDL8DPmzdAPrGqC0KOe9mxzN7FByh7UM+RXj7fHR+mNcEfMKVyeE+2GA2DbW1a2xZ
	E/o9wk4ccan6jhfkphxfVrJTXGzHbJEZ6x4MmSsJS+1YI1/RleD6zeI6PxuTSOJe+kPdIShYJH6
	Z2cjTu/vaXKHKtsQimshF2rnnXDIs/dqqQfLWGeBWC81LLU4VRjMdBTxNnE8nUYGjxuVftZ9Nkl
	Oa+8aMu6YqRyAPCIsUnDNY8Qsxp6niGMlOsWGvMMHtP2I61k7kyoeqvwmigjZw696JrgP9vn89p
	2grn1AP0+siZA==
X-Received: by 2002:a05:6a20:a106:b0:3a8:21e0:1ffa with SMTP id adf61e73a8af0-3aa5aadcc7amr26724961637.27.1778510520189;
        Mon, 11 May 2026 07:42:00 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.lan ([58.164.4.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm26012405b3a.3.2026.05.11.07.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:41:59 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: linux-arm-msm@vger.kernel.org,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/8] platform/surface: SAM: Add support for Surface Pro 12in
Date: Tue, 12 May 2026 00:40:52 +1000
Message-ID: <60b41585fc437d8f0090466d774161f1ea2fefd7.1778498477.git.harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
References: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 872F0510963
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com,kernel.org,linux.intel.com];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-106958-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harrisonvanderbyl@gmail.com,linux-arm-msm@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add a SAM client device node group and registry entry for the
Microsoft Surface Pro, 12-inch with Snapdragon.

This set enables the use of the following devices.
1: cover keyboard
2: cover touchpad
3: pen stash events.

The battery info and charger info devices have been
purposefully omitted as they are also reported by
other drivers and cause conflicts.

Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
---
 .../surface/surface_aggregator_registry.c         | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index 0599d5adf02e..884049961415 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -422,6 +422,19 @@ static const struct software_node *ssam_node_group_sp11[] = {
 	NULL,
 };
 
+/* Devices for Surface Pro 12" first edition (ARM/QCOM) */
+static const struct software_node *ssam_node_group_sp12in[] = {
+	&ssam_node_root,
+	&ssam_node_hub_kip,
+	&ssam_node_tmp_sensors,
+	&ssam_node_hid_kip_keyboard,
+	&ssam_node_hid_sam_penstash,
+	&ssam_node_hid_kip_touchpad,
+	&ssam_node_hid_kip_fwupd,
+	&ssam_node_pos_tablet_switch,
+	NULL,
+};
+
 /* -- SSAM platform/meta-hub driver. ---------------------------------------- */
 
 static const struct acpi_device_id ssam_platform_hub_acpi_match[] = {
@@ -500,6 +513,8 @@ static const struct of_device_id ssam_platform_hub_of_match[] __maybe_unused = {
 	{ .compatible = "microsoft,arcata", (void *)ssam_node_group_sp9_5g },
 	/* Surface Pro 11 (ARM/QCOM) */
 	{ .compatible = "microsoft,denali", (void *)ssam_node_group_sp11 },
+	/* Surface Pro 12in First Edition (ARM/QCOM) */
+	{ .compatible = "microsoft,surface-pro-12in", (void *)ssam_node_group_sp12in },
 	/* Surface Laptop 7 */
 	{ .compatible = "microsoft,romulus13", (void *)ssam_node_group_sl7 },
 	{ .compatible = "microsoft,romulus15", (void *)ssam_node_group_sl7 },
-- 
2.53.0


