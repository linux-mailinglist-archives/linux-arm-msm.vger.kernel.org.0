Return-Path: <linux-arm-msm+bounces-66913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AEDB14090
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 18:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDE6E3A780B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 16:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C3E27057B;
	Mon, 28 Jul 2025 16:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b="YQuZsz85"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.ionic.de (ionic.de [145.239.234.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0941C5F13;
	Mon, 28 Jul 2025 16:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.234.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753721148; cv=none; b=u60QjAwHrG3cRxy56SvicE1QrO8UbpKFEfti7mVPbOE+q6CgDp/Va8g7XG8RKTPPIwOiNgB4eZuPFgpqf4qiNZ9xk2hX5V15d4qIftSpMAghsNrxVoqDC0kxwGkJBnnLtflCHtlw6OARaM/EzTWXYQGd6PUgfecbuKyqzqQvBRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753721148; c=relaxed/simple;
	bh=+2JvhvfPPXwyexOfFnmN12zI5ndOKsvqBC97gE+vWfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mrv4+ta2Ec7egMPO2vayx2zYxFOzrk2yxVUJCd9gmzekGVrYJKkb5LpnicukLe8jF3dbbAm0BE7Sjanm8gDnqqR9+KRe110PhGO4fmOaURYopy18YdUf7++9RhqjsKRUKgjld+vbeZjxK6oMJ8VVUgSmj1zjFRYmHdE020yu5Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de; spf=pass smtp.mailfrom=ionic.de; dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b=YQuZsz85; arc=none smtp.client-ip=145.239.234.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionic.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1753721137; bh=+2JvhvfPPXwyexOfFnmN12zI5ndOKsvqBC97gE+vWfs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YQuZsz85mls6du6i+1Xuj/XUQkJy7pL61W/LcCjEWnfpiv72A1plafeF3CwWQBH5F
	 AmsMADFC5/fazcqQPqcrL41h5gDNvBCZlUTQVHvHuCjRD3U+JQx6pRRigXVHkKV2yK
	 evIah4M+MSK7iA8LPvGq8Po5s5dNn9m9uHsALIzQ=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id 4E0E31480984;
	Mon, 28 Jul 2025 18:45:37 +0200 (CEST)
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
Subject: [PATCH v4 01/11] net: qrtr: ns: validate msglen before ctrl_pkt use
Date: Mon, 28 Jul 2025 18:45:18 +0200
Message-ID: <456d8dff226c88657c79f1dbadf0dcaba8b905ae.1753720934.git.ionic@ionic.de>
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

The qrtr_ctrl_pkt structure is currently accessed without checking
if the received payload is large enough to hold the structure's fields.
Add a check to ensure the payload length is sufficient.

Signed-off-by: Denis Kenzior <denkenz@gmail.com>
Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
Reviewed-by: Andy Gross <agross@kernel.org>
Signed-off-by: Mihai Moldovan <ionic@ionic.de>
Fixes: 0c2204a4ad71 ("net: qrtr: Migrate nameservice to kernel from userspace")

---

v4:
  - no changes
  - Link to v3: https://msgid.link/a3bc13d1496404e96723a427086271107016bdd6.1753312999.git.ionic@ionic.de

v3:
  - add Fixes: tag
  - rebase against current master
  - Link to v2: https://msgid.link/866f309e9739d770dce7e8c648b562d37db1d8b5.1752947108.git.ionic@ionic.de

v2:
  - rebase against current master
  - use correct size of packet structure as per review comment
  - Link to v1: https://msgid.link/20241018181842.1368394-2-denkenz@gmail.com
---
 net/qrtr/ns.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
index 3de9350cbf30..2bcfe539dc3e 100644
--- a/net/qrtr/ns.c
+++ b/net/qrtr/ns.c
@@ -619,6 +619,9 @@ static void qrtr_ns_worker(struct work_struct *work)
 			break;
 		}
 
+		if ((size_t)msglen < sizeof(*pkt))
+			break;
+
 		pkt = recv_buf;
 		cmd = le32_to_cpu(pkt->cmd);
 		if (cmd < ARRAY_SIZE(qrtr_ctrl_pkt_strings) &&
-- 
2.50.0


