Return-Path: <linux-arm-msm+bounces-108426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIRfNKYnDGq/XgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:04:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA2257ADA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8571530C2B94
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60A93F44CE;
	Tue, 19 May 2026 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AHWTDqHi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CB33F0AB6;
	Tue, 19 May 2026 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180964; cv=none; b=ZwmJmhMCZ49CT7usYlDoAjcSCimYggARXxqR8upZ7DP3CXaiLhyaoo9amWyT+QBBoDhmEkLt6uE6U9O9LxS3iBIs1uikvIWutd5EWtf+csUirJYiGXeNy0a0c/C4mnZOtvBiIQQaJ89a+OZCSG4zTvnZN74B5Tx5NU0apY1gG4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180964; c=relaxed/simple;
	bh=e/f51wmEbEvWCWfBhaFFQM1VJvMDz0N9wvz/68ZdRDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jMcVE+SKJ2yaMHNGRnSJsXAlJIfQTXtIp42wu6AfyhbhtM1kgxc6eu1khF0UCsroHjV6jgmRvWLOqsbYvkw0GHayQI7jzwfkX1nEUyDC4nEwuJb5L/VgCrODmJQ9GnWxrxdfz8NcVYDvR5C4OYDMYgFHgEDCXK74f8dCOQmEKG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AHWTDqHi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18BA2C2BCF5;
	Tue, 19 May 2026 08:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779180964;
	bh=e/f51wmEbEvWCWfBhaFFQM1VJvMDz0N9wvz/68ZdRDw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AHWTDqHiY4knOo8IxNzxg08wTedQtzUMkH3q/NVEy+xb9PXR0jRk561yGQ9lyT3rr
	 PTcO9NXJBAaG8OqG3OIwqUcb+Mlngdp3NSqoYptF031Wwu2lXa0Oi69N8yAQG6laJF
	 ksZC41HeVwfLPAF9Tum9GbBMR9JaRj1f9KOH4umz7IjhMS51v2uKJGipLYeicCYGfH
	 EO8FMIe1jhyvgCAgb8rqScbepU+RISoiBQXyKTS/nUtRJfpAEFmskZb2vazRRoXb6m
	 4nHJpIhPvJSHCg3LRSJDsR0lbEnzfBQsdIntHJ1JC/HtmduuFrMlDqhseLvD5RYIag
	 ctv9xV/q7mRGQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 118B1CD4851;
	Tue, 19 May 2026 08:56:04 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Tue, 19 May 2026 14:26:01 +0530
Subject: [PATCH v3 6/9] power: sequencing: Add an API to return the pwrseq
 device's 'dev' pointer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-pwrseq-m2-bt-v3-6-b39dc2ae3966@oss.qualcomm.com>
References: <20260519-pwrseq-m2-bt-v3-0-b39dc2ae3966@oss.qualcomm.com>
In-Reply-To: <20260519-pwrseq-m2-bt-v3-0-b39dc2ae3966@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2045;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=zADSByazZrrmfWmx+ulwGuogrsAOGSim5Z5uII1xUr4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqDCWfDRV7LdUoFWUtrVGtOhWtrgun+hmgmkALV
 BI78o07556JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCagwlnwAKCRBVnxHm/pHO
 9Q4VB/98OOJrEzs8nK5BnEwlQYPWPS0WHYJegif8o0X9ZYToRMTcvL6miALMbQtqz7yU9gTxq99
 8ceA2jp50JMMBTF4wBcFSDM6O8/xCZ0e6jUx90XfPMLjN9Xa+OC433UOQGh5qGALsf9IxoT5XmT
 FxbjmEB0OO+BSGjPEpzgUJYxd+dp5GVJEfQyWgMqwCew94cngjbKg4DYHABRmco5pApJZZNIITE
 /gSG4HFkfVzMFo5hcvHvhMWYmst2eu6wksQz8J59kcXbMRVlqiIPz7diSAQnTN+GPb0z9Hs98ZQ
 BR9OR/NJ3kstNajR5vsY30zqt8j632S9hSrpPpCc8TrV4gbA
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108426-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:replyto]
X-Rspamd-Queue-Id: 4FA2257ADA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

The consumer drivers can make use of the pwrseq device's 'dev' pointer to
query the pwrseq provider's DT node to check for existence of specific
properties.

Hence, add an API to return the pwrseq device's 'dev' pointer to consumers.

Note that since pwrseq_get() would've increased the pwrseq refcount, there
is no need to increase the refcount in this API again.

Tested-by: Wei Deng <wei.deng@oss.qualcomm.com>
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
2.48.1



