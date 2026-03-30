Return-Path: <linux-arm-msm+bounces-100873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGDCOfe1ymmE/QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 19:42:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 515F835F692
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 19:42:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4408730247EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 17:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F3C3A6F1A;
	Mon, 30 Mar 2026 17:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dj8Qo/vO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581C03DBD64
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 17:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774892401; cv=none; b=c3CzhNWDFBG3aGSCYfL21/2KemiPsUzWXUOfqGe6ue9XuATZ49J2FEa11vdfvzRy34wTBXrIs8aj6zsNiICc8GRiwYayP5lUo7Gs4708LBWATR+iYAF0d9J7gJ8wuIxDLj2fqIFdqQck08/13zX9tkThzR44/sAaLFrBD5k1E10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774892401; c=relaxed/simple;
	bh=MmonoAx1361qvYCSdrtWQwdUQUNtBdSPQ/Yy/qcDpbE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZQfzOniVTP4ysYyM4cfO596S/cky36Z3lk9Urt0OQM9sboyP69qKIfwt2Eb9jHvonK6KO53T9/ocFXAIEqm2CCYGXTtnrEp4Gp7D28MEDcGvFlDAJ45VYnB+NkpRlsDdvUE1pdvYUD0j/rqc4TGjbfhIqe8PZPF4tKPGII7AlfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dj8Qo/vO; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774892397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=joPdK440VeWntNfhQggHWZlGE83OY4yxxCUVtLRFu2w=;
	b=dj8Qo/vOtZG9Ebv7bkvPOvJvaSLQpSoxbaAWQQsNmfnjaTHtJYmzuMOrAI0W8Ojl9X1WPE
	/beumUXfuI11JTx/DiBygGjUMRvVoUerT+GDzUWEEjMsWYNWUm+lRfyTacH07xd+7p2VtU
	Ag+ml8ALsg0n9AO4dMju/SP5eqitGV4=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-crypto@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: qce - simplify qce_xts_swapiv()
Date: Mon, 30 Mar 2026 19:39:25 +0200
Message-ID: <20260330173923.479407-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1254; i=thorsten.blum@linux.dev; h=from:subject; bh=MmonoAx1361qvYCSdrtWQwdUQUNtBdSPQ/Yy/qcDpbE=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJmntnr7Vc2wndQmG602+0BV9+c3z8IN6j+UP18W6OmTr X2gXmxXRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEykmIfhv7NqU35Zc+CxeQlL Zgj2zQ0/VSD2q/qk3vfPfQeaX/hVzmNk6OSfsvW5j1yVTH+Db1lA/Y9L7BuEfXfNX6FTnrtahmc +DwA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net];
	TAGGED_FROM(0.00)[bounces-100873-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:dkim,linux.dev:email,linux.dev:mid]
X-Rspamd-Queue-Id: 515F835F692
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Declare 'swap' as zero-initialized and use a single index variable to
simplify the byte-swapping loop in qce_xts_swapiv(). Add a comment for
clarity.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/qce/common.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/qce/common.c b/drivers/crypto/qce/common.c
index 04253a8d3340..54a78a57f630 100644
--- a/drivers/crypto/qce/common.c
+++ b/drivers/crypto/qce/common.c
@@ -280,17 +280,17 @@ static u32 qce_encr_cfg(unsigned long flags, u32 aes_key_size)
 #ifdef CONFIG_CRYPTO_DEV_QCE_SKCIPHER
 static void qce_xts_swapiv(__be32 *dst, const u8 *src, unsigned int ivsize)
 {
-	u8 swap[QCE_AES_IV_LENGTH];
-	u32 i, j;
+	u8 swap[QCE_AES_IV_LENGTH] = {0};
+	unsigned int i, offset;
 
 	if (ivsize > QCE_AES_IV_LENGTH)
 		return;
 
-	memset(swap, 0, QCE_AES_IV_LENGTH);
+	offset = QCE_AES_IV_LENGTH - ivsize;
 
-	for (i = (QCE_AES_IV_LENGTH - ivsize), j = ivsize - 1;
-	     i < QCE_AES_IV_LENGTH; i++, j--)
-		swap[i] = src[j];
+	/* Reverse and right-align IV bytes. */
+	for (i = 0; i < ivsize; i++)
+		swap[offset + i] = src[ivsize - 1 - i];
 
 	qce_cpu_to_be32p_array(dst, swap, QCE_AES_IV_LENGTH);
 }

