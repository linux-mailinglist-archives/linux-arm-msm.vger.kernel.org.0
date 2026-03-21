Return-Path: <linux-arm-msm+bounces-99023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AREFM24vmksYgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 16:27:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4D02E6137
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 16:27:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B17BE30219B3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 15:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34229392C43;
	Sat, 21 Mar 2026 15:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W69FnWkd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5EA3921FF
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 15:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774106827; cv=none; b=oL5X3HkHjd9aEa3SS2zVnb/Sa7mvU/NFymFVe0eo0kDyZ7W8DShKkBOR9NYn7Q2AiCsosVqtqxorysJMN8yVGqn9UFMKWx2Mm6wCfNdWZPHrsCZhcc2LNja9TJCyiavq+9r6528XGaSvojfZnnw7YLRZ3FdT0VkOT2MUJ+ucPpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774106827; c=relaxed/simple;
	bh=gD1KUdHWKgzqXvmgI09/pjrAQQdwKIdoly7XN5YFXaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Aj59Rrx4ghjxKP5XJBmDwr6XuENQEhX4nmJ8iY67l8B7z3+qbpc4kSOLTE9Pd5xwE8npiGakeK9V9VnASNat7GjNjGHM2DF+W64foPpkyUzWdemQKNiVIpykIgGvjPBuM/7hXwAqTveWoeMibFw+54LxZMaJusOMBKO9hB6/MGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W69FnWkd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774106825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZGyjEWAH5/aiYT+QXDnPyH8sIz3yJQUrrdKs8bHauX8=;
	b=W69FnWkd1yztLzvsBE7CI2gwHkbuN6NzGRmZ7xEMfoKQeLkgh8E1MamRmsTB8q0en0AHtr
	z60jm8ELqNmhyESqXWykhdvenHByPUPXc/SbKmN2yQh4wlQnByCI53qR57GoEQNY+TcADt
	eTKmF08Q/uldhJAB76P02g8BazCHqOI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-422-g7aKnlqvObGuhG9pdnTmHQ-1; Sat,
 21 Mar 2026 11:26:59 -0400
X-MC-Unique: g7aKnlqvObGuhG9pdnTmHQ-1
X-Mimecast-MFC-AGG-ID: g7aKnlqvObGuhG9pdnTmHQ_1774106818
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 21513195609E;
	Sat, 21 Mar 2026 15:26:58 +0000 (UTC)
Received: from thinkpad-p1.localdomain.com (unknown [10.22.64.6])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 885A61955F21;
	Sat, 21 Mar 2026 15:26:56 +0000 (UTC)
From: Radu Rendec <rrendec@redhat.com>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Lei wang <quic_leiwan@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 2/2] soc: qcom: socinfo: Add SoC ID for SA8650P
Date: Sat, 21 Mar 2026 11:23:07 -0400
Message-ID: <20260321152307.9131-3-rrendec@redhat.com>
In-Reply-To: <20260321152307.9131-1-rrendec@redhat.com>
References: <20260321152307.9131-1-rrendec@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99023-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rrendec@redhat.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,quicinc.com:email]
X-Rspamd-Queue-Id: CE4D02E6137
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lei wang <quic_leiwan@quicinc.com>

Add SoC ID table entry for Qualcomm SA8650P.

Signed-off-by: Lei wang <quic_leiwan@quicinc.com>
Signed-off-by: Radu Rendec <rrendec@redhat.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 003a2304d535c..01eae575afd27 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -488,6 +488,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(SM8475) },
 	{ qcom_board_id(SM8475P) },
 	{ qcom_board_id(SA8255P) },
+	{ qcom_board_id(SA8650P) },
 	{ qcom_board_id(SA8775P) },
 	{ qcom_board_id(QRU1000) },
 	{ qcom_board_id(SM8475_2) },
-- 
2.53.0


