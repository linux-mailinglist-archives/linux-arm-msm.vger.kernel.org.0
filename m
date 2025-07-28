Return-Path: <linux-arm-msm+bounces-66922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 880F4B140A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 18:47:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C4307AA03A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 16:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F56127A92B;
	Mon, 28 Jul 2025 16:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b="PWCoWbAk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.ionic.de (ionic.de [145.239.234.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22156277C9B;
	Mon, 28 Jul 2025 16:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.234.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753721151; cv=none; b=cXqgJ8eVj9bVPbYv6GhMvCN8bBOeUyiwl4HoiYbBiw9zgZgX1C/k+FnSeN+/yZWmty7Zeygj8du6jZ5tD1YOoeKQnjMSwncJyycvDyFsBIgxZSHwcn2TQCOqfX/GhWOJ6BJl8GDA1MPenUx79jsM5ZimzKEFymH5XhcSmmjbFfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753721151; c=relaxed/simple;
	bh=IR8/da2OxoESOTMBqP1MrVkIJMK+E5kDzsXkiUg7Bag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WNrBQRBj7A34Ts9s+ApXFLGEF00GfplFXBV9YIA+Xj6pYD8V1wMmJ0M+iqwS18PNELo++aUfyE5IMlatcT+OKWmnXKptQWKVI7cvTAXc++Nfibvlx/i/CjoipUnaRB7Adto4jqzzgDv3PgNrB3+OYQum7tn6CUYQ2T6TVbji+1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de; spf=pass smtp.mailfrom=ionic.de; dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b=PWCoWbAk; arc=none smtp.client-ip=145.239.234.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionic.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1753721139; bh=IR8/da2OxoESOTMBqP1MrVkIJMK+E5kDzsXkiUg7Bag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PWCoWbAkJX/zH8m80X5/yN0mtl1sRe/rT0ajhSM0MmiP/iSZmPFIfWktBH8it8rRB
	 VVIeGGKIWMrOUIW7li+GkaOlIP20EdEUfYICF7buRWqa2750nv3oup0M5kDIztofZs
	 xD+L/AFr+LN/Ul/It5mrV4Vgorou8K9FhdKhcIas=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id 54E2D1489141;
	Mon, 28 Jul 2025 18:45:39 +0200 (CEST)
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
Subject: [PATCH v4 09/11] net: qrtr: Drop remote {NEW|DEL}_LOOKUP messages
Date: Mon, 28 Jul 2025 18:45:26 +0200
Message-ID: <1ebb6174fcc0e7068f7f695470dc1d380f540377.1753720935.git.ionic@ionic.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <cover.1753720934.git.ionic@ionic.de>
References: <cover.1753720934.git.ionic@ionic.de>
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

v4:
  - no changes
  - Link to v3: https://msgid.link/05625051f520eb1aa091f422a745d048d5c8112e.1753313000.git.ionic@ionic.de

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
index a7ab445416e4..fb89ef14cecc 100644
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


