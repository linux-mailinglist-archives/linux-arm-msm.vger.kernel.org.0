Return-Path: <linux-arm-msm+bounces-106484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HfnB3+6/Gl2TAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 18:14:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB374EC020
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 18:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7880F30407EB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 16:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E2A4657F5;
	Thu,  7 May 2026 16:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kMw6DyNu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAA344E025;
	Thu,  7 May 2026 16:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169978; cv=none; b=ke+x5lTjQWcQZhx/+IoPfWkFaf0BNrKmklMpA7i0lGvKrUzjDqotSclTej+rUxgtAZ/Yi67V1h7DEugvsZt8yFhcy2Aj8CYOxRz+cv7qPmaBvyzrpjLhgXRfS3ttddTLeHPoJSCHvfJ+5+5wwfc8bJxM6YkWRH1ULNg0yIApgQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169978; c=relaxed/simple;
	bh=EZPpoMOL9WihziC/MK2MjaWdKbXNphkZbHMgn6LGG0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iwAPRQ2Li0qIqlLKkeORcuYBYRmkaYNW5s3byTV7nhvNPjc3CQDAhiepP/v0yktkDq8k1x8um79mdPyEjU83RMEcgb5SZXoUQBkSppaiPh4xmh7MKc/zGLyw9LrGxC+SquQTMEzAoYuJgIp63DHUvUsBhwiiFFo+HqzCYBwYS10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kMw6DyNu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70E82C2BCB8;
	Thu,  7 May 2026 16:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778169978;
	bh=EZPpoMOL9WihziC/MK2MjaWdKbXNphkZbHMgn6LGG0g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kMw6DyNuD4OBY1OXoPpw5iYUZUwrrc2DHGel+8V5gT3acFALfxOcCHYzMnbqdWX78
	 Cm6H+hAVonovQBlSG9BJZEAs0xy7pq8N+Je+dRrJO0pk7ZgZ+fOX6aVyTBCECjzSAC
	 7sfuf9n533Q5SiY/M4DqbB+1vHSDm9S+qDtlKHRmgutrmVYios+W9MVTmhc4l0ObYp
	 suPCRCVISVzNiIU6ZdFULRix2Dnlhsitec2Wa9DVqgtSssJNfkM5qDlhpYJ78CpHMe
	 WPpg2RSNRaGPp+JQ2yaXSNwgJIWex09nvxjGoVomN1Z/kUiC9qvdIp4liCXEb76XLC
	 9teC/wgP94+gw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B18BCD37A7;
	Thu,  7 May 2026 16:06:18 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Thu, 07 May 2026 21:36:16 +0530
Subject: [PATCH v2 8/9] power: sequencing: Add an API to return the pwrseq
 device's 'dev' pointer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-pwrseq-m2-bt-v2-8-1740bd478539@oss.qualcomm.com>
References: <20260507-pwrseq-m2-bt-v2-0-1740bd478539@oss.qualcomm.com>
In-Reply-To: <20260507-pwrseq-m2-bt-v2-0-1740bd478539@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Shuai Zhang <quic_shuaz@quicinc.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>, 
 Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1996;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=rxWzd4lr/8TaHGBWfbY6c8DXpO+mcIR8KKWvZPYGs/8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBp/Lh3s0snxu5XC7qLccfWlPE3hKIzKV4GGi7e3
 8QeFiRRSwSJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCafy4dwAKCRBVnxHm/pHO
 9V6sB/9dGLubTojDBWN2BmdXreaZ18o+YkI9g8c06570gHpIzSqGQwMHDpveuJBSustypNYCWL+
 zgdNYOwlUPKOGtggun8PmHXi4F9XwgiDQmOZaDJK7703pt37dT3CNBs6G3exxUzj1I7Wy3twwt0
 KLdqje33t3XIqFVNK999y6xSChc9VjFn6QGw0Lvm595kBD85xio0GKgc/DXeP31rBj167WnHuhj
 /r1Z2zyN/3nP1UGzcINgeBW0el+wh7cMnO/O2EbHTNG5VWhaBirrxaX7/5RRt5HeRltTlbvwcKs
 NsEJ/uo4ckZzOOH1mqre+ruIraL18RyYpmItzOniTQC5urk9
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Rspamd-Queue-Id: BCB374EC020
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106484-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com]
X-Rspamd-Action: no action

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

The consumer drivers can make use of the pwrseq device's 'dev' pointer to
query the pwrseq provider's DT node to check for existence of specific
properties.

Hence, add an API to return the pwrseq device's 'dev' pointer to consumers.

Note that since pwrseq_get() would've increased the pwrseq refcount, there
is no need to increase the refcount in this API again.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/power/sequencing/core.c | 9 +++++++++
 include/linux/pwrseq/consumer.h | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
index 4dff71be11b6..96ad557297f5 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -965,6 +965,15 @@ int pwrseq_power_off(struct pwrseq_desc *desc)
 }
 EXPORT_SYMBOL_GPL(pwrseq_power_off);
 
+struct device *pwrseq_to_device(struct pwrseq_desc *desc)
+{
+	if (!desc)
+		return NULL;
+
+	return &desc->pwrseq->dev;
+}
+EXPORT_SYMBOL_GPL(pwrseq_to_device);
+
 #if IS_ENABLED(CONFIG_DEBUG_FS)
 
 struct pwrseq_debugfs_count_ctx {
diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/consumer.h
index 7d583b4f266e..3c907c9e1885 100644
--- a/include/linux/pwrseq/consumer.h
+++ b/include/linux/pwrseq/consumer.h
@@ -23,6 +23,8 @@ devm_pwrseq_get(struct device *dev, const char *target);
 int pwrseq_power_on(struct pwrseq_desc *desc);
 int pwrseq_power_off(struct pwrseq_desc *desc);
 
+struct device *pwrseq_to_device(struct pwrseq_desc *desc);
+
 #else /* CONFIG_POWER_SEQUENCING */
 
 static inline struct pwrseq_desc * __must_check
@@ -51,6 +53,11 @@ static inline int pwrseq_power_off(struct pwrseq_desc *desc)
 	return -ENOSYS;
 }
 
+static inline struct device *pwrseq_to_device(struct pwrseq_desc *desc)
+{
+	return NULL;
+}
+
 #endif /* CONFIG_POWER_SEQUENCING */
 
 #endif /* __POWER_SEQUENCING_CONSUMER_H__ */

-- 
2.51.0



