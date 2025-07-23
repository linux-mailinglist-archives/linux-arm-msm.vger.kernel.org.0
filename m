Return-Path: <linux-arm-msm+bounces-66402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D5FB0FD76
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 01:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAF40584C6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 23:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A543927C158;
	Wed, 23 Jul 2025 23:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b="rWGS6Xac"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.ionic.de (ionic.de [145.239.234.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500FB27781B;
	Wed, 23 Jul 2025 23:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.234.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753313080; cv=none; b=SVAR68VGmTbLm0Y4duNVM3YsfXgZnqYuYHkz1xftg88Z/8kWrKsjsfNco2s1ZlrwFsByIR6YsXsB6A6Xs7u06nejUFJhZ322CPhHQGg+Mg8T8uHyj1mY3V0uyGPgvQWSoO2zeF7uQ+h6FM3VDt1TvWrxvblLdx+/2PePdlGSVn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753313080; c=relaxed/simple;
	bh=QhMTts3Iq7Yk25P+zAVUf7ONoauSZemexx6foMmnZOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VZj/YZ7++LnobCaRS57NzfH6yykDWXProjhUkG8bOpv/CRpi2mOcXwCmTS0D/g8ldl5J/eXFYb/KbqnpL+0Ko1kkGHiSDN+7j1+5UXzc2MrSIfWCi6ah8HxLyphWa3wFM4GW23sG+UwnV4Q4nmiLJPNTzxLj/NkW8Dj1qW48j9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de; spf=pass smtp.mailfrom=ionic.de; dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b=rWGS6Xac; arc=none smtp.client-ip=145.239.234.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionic.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1753313067; bh=QhMTts3Iq7Yk25P+zAVUf7ONoauSZemexx6foMmnZOU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rWGS6Xac9ogmFJAASt/wWoabeaeA2/slL8UoSkyogYvdpUdMOe985DcPc4NxlQr/l
	 7FTMHXZ26JJb+R4pJSw7eTl6qFIPFlxhuBy0tJvWg4TVqpOK+7nQXsx/oFEI4sL1y1
	 0W4gtSD7bfreBBHaFWjfA1NRg20XubL3029Nf+R4=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id 16AD8148A06C;
	Thu, 24 Jul 2025 01:24:27 +0200 (CEST)
From: Mihai Moldovan <ionic@ionic.de>
To: linux-arm-msm@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Denis Kenzior <denkenz@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v3 09/11] net: qrtr: Drop remote {NEW|DEL}_LOOKUP messages
Date: Thu, 24 Jul 2025 01:24:06 +0200
Message-ID: <05625051f520eb1aa091f422a745d048d5c8112e.1753313000.git.ionic@ionic.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <cover.1753312999.git.ionic@ionic.de>
References: <cover.1753312999.git.ionic@ionic.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Kenzior <denkenz@gmail.com>

These messages are explicitly filtered out by the in-kernel name
service (ns.c).  Filter them out even earlier to save some CPU cycles.

Signed-off-by: Denis Kenzior <denkenz@gmail.com>
Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
Reviewed-by: Andy Gross <agross@kernel.org>
Signed-off-by: Mihai Moldovan <ionic@ionic.de>

---

v3:
  - rebase against current master
  - Link to v2: https://msgid.link/ad089e97706b095063777f1eefe04d75cbb917f1.1752947108.git.ionic@ionic.de

v2:
  - rebase against current master
  - Link to v1: https://msgid.link/20241018181842.1368394-9-denkenz@gmail.com
---
 net/qrtr/af_qrtr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index fa22a27ec5d2..e0123bbe0bb5 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -629,6 +629,11 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 	if (!size || len != ALIGN(size, 4) + hdrlen)
 		goto err;
 
+	/* Don't allow remote lookups */
+	if (cb->type == QRTR_TYPE_NEW_LOOKUP ||
+	    cb->type == QRTR_TYPE_DEL_LOOKUP)
+		goto err;
+
 	if ((cb->type == QRTR_TYPE_NEW_SERVER ||
 	     cb->type == QRTR_TYPE_RESUME_TX) &&
 	    size < sizeof(struct qrtr_ctrl_pkt))
-- 
2.50.0


