Return-Path: <linux-arm-msm+bounces-97900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JMxKffat2mcWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:27:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5909C297E52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:27:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 010BB3005ADD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448C038E13E;
	Mon, 16 Mar 2026 10:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PX7YYhEh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2DF38D012
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773656820; cv=none; b=CWxage7sJHLCoYgYy66mrW2NJY9ruX58MSUBhX+7NQb6/Oorua/0eOL0K17hdhtNtXrW2K7F4LoRkYaBOh9hRLP0YXkoZ61Zx0eForz0+La3a16YiIUjG+/W0DRN1W1XlH1LhSbfri4w0oq2W9HKN6qQrFSJc8F7hfZQZ3WuXzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773656820; c=relaxed/simple;
	bh=S18KoAj9plDc5O1oGaRC/KEj55fDZXVXAG19mKOOd9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L6mhs/N92Koe8dtXIEpF+jVWNEIJ+colUBToQC9eKt8/1zZ6ed9HdQkxG3o7HvDuluxv+WhJnzTQTIshSA/CQaRJmQM9Gw727l+wbroX2ZVWH5r1nna5Bsloptb3Zy6Vf3VZLtk/+l/Z5Ev9nYJjasckQHOfDi8FpuAsXOed7Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PX7YYhEh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773656818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dVMn+BOwra53uz2RNGywNko5dhB69EFMoWHU0PbUSDI=;
	b=PX7YYhEhD6Jlnne8uZl2Ghp7WZwF7B0goo0gnrfNK//oSY6epnizf1LGbT5EbZ8JjIrAFz
	QKAr8gbNMZsprN368rR3oHt0WfEo/KTZwxSPssQVhmI4AYezhMKvjbEzT1DGO/c4aAB2jG
	fAU6XNWy5+lHuy+NQxDpa+QbQLhbV1o=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-623-1E9g0U6YMWq1LEBwakGlMw-1; Mon,
 16 Mar 2026 06:26:53 -0400
X-MC-Unique: 1E9g0U6YMWq1LEBwakGlMw-1
X-Mimecast-MFC-AGG-ID: 1E9g0U6YMWq1LEBwakGlMw_1773656811
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B5515195606F;
	Mon, 16 Mar 2026 10:26:51 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.22.35])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9722F30001A2;
	Mon, 16 Mar 2026 10:26:48 +0000 (UTC)
From: Gabriele Paoloni <gpaoloni@redhat.com>
To: mani@kernel.org,
	jassisinghbrar@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: gpaoloni@redhat.com,
	mpapini@redhat.com,
	dnita@qti.qualcomm.com,
	rballati@qti.qualcomm.com,
	bijothom@qti.qualcomm.com,
	wchadwic@redhat.com
Subject: [PATCH 1/2] mailbox: qcom-ipcc: amend qcom_ipcc_domain_map() to report errors
Date: Mon, 16 Mar 2026 11:26:17 +0100
Message-ID: <20260316102618.7953-2-gpaoloni@redhat.com>
In-Reply-To: <20260316102618.7953-1-gpaoloni@redhat.com>
References: <20260316102618.7953-1-gpaoloni@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-97900-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[gpaoloni@redhat.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5909C297E52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently qcom_ipcc_domain_map() ignores errors returned by
irq_set_chip_data() and invokes irq_set_chip_and_handler()
that in turn ignores errors returned by irq_set_chip().
This patch fixes both issues; no other functional changes
are implemented.

Signed-off-by: Gabriele Paoloni <gpaoloni@redhat.com>
---
 drivers/mailbox/qcom-ipcc.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
index d957d989c0ce..c23efaaa64a1 100644
--- a/drivers/mailbox/qcom-ipcc.c
+++ b/drivers/mailbox/qcom-ipcc.c
@@ -116,12 +116,20 @@ static struct irq_chip qcom_ipcc_irq_chip = {
 static int qcom_ipcc_domain_map(struct irq_domain *d, unsigned int irq,
 				irq_hw_number_t hw)
 {
+	int ret;
 	struct qcom_ipcc *ipcc = d->host_data;
 
-	irq_set_chip_and_handler(irq, &qcom_ipcc_irq_chip, handle_level_irq);
-	irq_set_chip_data(irq, ipcc);
-	irq_set_noprobe(irq);
+	ret = irq_set_chip(irq, &qcom_ipcc_irq_chip);
+	if (ret)
+		return ret;
+
+	irq_set_handler(irq, handle_level_irq);
 
+	ret = irq_set_chip_data(irq, ipcc);
+	if (ret)
+		return ret;
+
+	irq_set_noprobe(irq);
 	return 0;
 }
 
-- 
2.48.1


