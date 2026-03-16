Return-Path: <linux-arm-msm+bounces-97901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AymCBnbt2mcWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:27:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1B5297E61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:27:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F890303A25B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3007138E5FB;
	Mon, 16 Mar 2026 10:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VTKLSBVN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB1238E132
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773656822; cv=none; b=pbDSRWbg9o2QmVtGJZ8b+PLRPB/Btv/tgH9i/u49P9UF6VOxmY4JWU/zRM9lDoZoIa9Z9/s5+cHinIoWuh3i+ygee5qep4wVk2blKtookMPW4xaYuvMhHWXBZnTTiKw7qrUfO+aZPu00To1yXuw8hOf4/kE5m+bazAsy2uaNmVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773656822; c=relaxed/simple;
	bh=CTyuTsqF6nSc++2PoNxY7q8/cdFLBbL212G+8NdfoAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CNU/orAzDpj8yZqhpShcZ5k9UsrWmJL22kkEvTeNPeHPKvyLIL54qX/jdsYByssbpfz1ivecuGsLVCt2QI4kmqqYs8fYjMmGdhg1fC/Y7/PU1AokKJYyEtk7mlnAUI+jlMrCELN1cHxnJOIzdQMZQ9Y4J3pYpnkJeqg1nLGzB8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VTKLSBVN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773656819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r8m8IcajGQNMVwrmqAYyudFloa04huldYXf4p+hCjN8=;
	b=VTKLSBVNcB3D+D6jqgXTyAPSydcnjMhadTZfaAk0TYbCuWUj99Bahcn3cQGPtya0ByoOnC
	LkSopNzl42oRzZDpAtSqa5KkiXq2VPO8du1jrMQbCVcPhVRXEldbQGaiNjD1OFVOi9MUKa
	9k0yx4b/8lOoJuyUAipuAxO9+1XuW4Q=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-632-cPYknJvbOa2H5i7pxXkhzg-1; Mon,
 16 Mar 2026 06:26:56 -0400
X-MC-Unique: cPYknJvbOa2H5i7pxXkhzg-1
X-Mimecast-MFC-AGG-ID: cPYknJvbOa2H5i7pxXkhzg_1773656815
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 478FE1956062;
	Mon, 16 Mar 2026 10:26:55 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.22.35])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3EAA6300019F;
	Mon, 16 Mar 2026 10:26:52 +0000 (UTC)
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
Subject: [PATCH 2/2] mailbox: qcom-ipcc: amend qcom_ipcc_irq_fn() to report errors
Date: Mon, 16 Mar 2026 11:26:18 +0100
Message-ID: <20260316102618.7953-3-gpaoloni@redhat.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-97901-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7B1B5297E61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

check the virq value returned by irq_find_mapping(), also
check the return value of generic_handle_irq(); return IRQ_NONE
if either of the checks fails.

Signed-off-by: Gabriele Paoloni <gpaoloni@redhat.com>
---
 drivers/mailbox/qcom-ipcc.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
index c23efaaa64a1..0795184591f0 100644
--- a/drivers/mailbox/qcom-ipcc.c
+++ b/drivers/mailbox/qcom-ipcc.c
@@ -75,7 +75,7 @@ static irqreturn_t qcom_ipcc_irq_fn(int irq, void *data)
 {
 	struct qcom_ipcc *ipcc = data;
 	u32 hwirq;
-	int virq;
+	int virq, ret;
 
 	for (;;) {
 		hwirq = readl(ipcc->base + IPCC_REG_RECV_ID);
@@ -83,8 +83,14 @@ static irqreturn_t qcom_ipcc_irq_fn(int irq, void *data)
 			break;
 
 		virq = irq_find_mapping(ipcc->irq_domain, hwirq);
+		if (unlikely(!virq))
+			return IRQ_NONE;
+
 		writel(hwirq, ipcc->base + IPCC_REG_RECV_SIGNAL_CLEAR);
-		generic_handle_irq(virq);
+
+		ret = generic_handle_irq(virq);
+		if (unlikely(ret))
+			return IRQ_NONE;
 	}
 
 	return IRQ_HANDLED;
-- 
2.48.1


