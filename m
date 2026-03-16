Return-Path: <linux-arm-msm+bounces-97899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JOyCPHat2mcWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:26:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B81297E43
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7CE533005676
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE41638D69E;
	Mon, 16 Mar 2026 10:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ehnx1/pE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7979A38D012
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773656814; cv=none; b=MEZ6q1QyFGD8IILX7jyeZeL9bx/ZSaXelkucogXQK4iJtZ6QDqU82la09FoioUVNAbdSgt89rBkd11iiVCLzsia563hs45+R20+sZqE6kNMS3UXigORtJC9EHqoGSKEw2LosTKjZP+DNILDYz4HPkVaR3W+1NN5Jm6+UnaPvPT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773656814; c=relaxed/simple;
	bh=gKunLYGnheRC3C78VwILJ1Mu41YgeAGFttnmZzYJ8KM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O7BUzpjJ536P2ZgWHfgIbjJUF9D/W9VEIN6TMOKuRFEWdNLzn8jOm1wF3Lb+bSgQhv0ChB/zpIfQo+yeG8VGcMuFUcJWzq9jQF16RpacVQjfaYNpKU55zKTh3zFcon1NfpAuVAe8oro58MBF8ChCbO0J12mtZt55x0nByqRMOlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ehnx1/pE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773656812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zzMDyD7JyNcZKGEu0CWJOmKWntHD4AFSxAgahlLhEaI=;
	b=Ehnx1/pEoBy1myKgGqXmmWpLO9NRcE8UM7ml0VagJGpNudWfF58PRTps4qqxR6ROM2zHyj
	p2QXMvzV7xMJg7m1lhDE+2z0ioDy2kpubsH3r+1nIOKj7VP0sRe9hv+5YbCzB3i0Uwjjj3
	Yro4NXnB4uNIPl4vcC36ZNvHb4OQeJQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-180-VAedSaDhNzypdtPVCzaqJA-1; Mon,
 16 Mar 2026 06:26:49 -0400
X-MC-Unique: VAedSaDhNzypdtPVCzaqJA-1
X-Mimecast-MFC-AGG-ID: VAedSaDhNzypdtPVCzaqJA_1773656808
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 10527195609D;
	Mon, 16 Mar 2026 10:26:48 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.22.35])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9EDDB300019F;
	Mon, 16 Mar 2026 10:26:44 +0000 (UTC)
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
Subject: [PATCH 0/2] mailbox: qcom-ipcc: fix error reporting paths
Date: Mon, 16 Mar 2026 11:26:16 +0100
Message-ID: <20260316102618.7953-1-gpaoloni@redhat.com>
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
	TAGGED_FROM(0.00)[bounces-97899-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 84B81297E43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patchset implements a couple of fixes to ensure errors being
properly reported in the qcom-ipcc driver.

Thanks
Gab

Gabriele Paoloni (2):
  mailbox: qcom-ipcc: amend qcom_ipcc_domain_map() to report errors
  mailbox: qcom-ipcc: amend qcom_ipcc_irq_fn() to report errors

 drivers/mailbox/qcom-ipcc.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

-- 
2.48.1


