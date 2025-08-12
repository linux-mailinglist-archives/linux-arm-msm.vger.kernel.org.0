Return-Path: <linux-arm-msm+bounces-68611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DC7B21A51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 03:45:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45BD846489B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 01:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED78D2D780C;
	Tue, 12 Aug 2025 01:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b="aCVEc0E4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.ionic.de (ionic.de [145.239.234.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDFF2D94AE;
	Tue, 12 Aug 2025 01:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.234.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754963150; cv=none; b=tH55B/76cke1pkf6qQIQVB9kg+VMIddQQN1z+G6zBLd36UQcfQPF63TeUoiuC8pVamvD1h6+uwqy0gFYkgKivnfrBGbFkgQyORhUhPON/96JrA6d3P0RAcQ8z3z5vbrdN70PmL2h3TXPMv4ZyQqQnHGf2f73zvdm2hpkVTMxdMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754963150; c=relaxed/simple;
	bh=HZOWBOnkMz9lOVjEhn42nXGr3iJiaTfCoFTk+GYveYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AeCv9jIVqJe88GRBEy342jd8n8MYu34fXCiykBAPZwgwAXpkFgjz6RnT1a38CAqR27fCC5/PtD8FQ0sTyxLXm2sNW7qr8LoeD1sN38W/jTWE7ilaZQwpZl7ZpUwb00SZThR+vMfpPTtHvATmUfGPI5jGF9I9USpLD1CBiaZPaAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de; spf=pass smtp.mailfrom=ionic.de; dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b=aCVEc0E4; arc=none smtp.client-ip=145.239.234.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionic.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1754962548; bh=HZOWBOnkMz9lOVjEhn42nXGr3iJiaTfCoFTk+GYveYg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aCVEc0E4l30tQDmvaMNqB0Dp6lm5neJ2Cl0uCwJT7rOQRDQY3dJ1WPk/21MbkdmGt
	 eN8ZGu6zt70tqGo3tlcy4WuGItNAkCYhidQ+dtUUh4RuYP8oVyuUNqtQhihqASkCNG
	 8cI6TYkvBoVGBtYp9O/5yoohdzaSDu2UKgv5Ti/4=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id 553D91488502;
	Tue, 12 Aug 2025 03:35:48 +0200 (CEST)
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
Subject: [PATCH v5 01/11] net: qrtr: ns: validate msglen before ctrl_pkt use
Date: Tue, 12 Aug 2025 03:35:27 +0200
Message-ID: <161d8d203f17fde87ac7dd2c9c24be6d1f35a3c1.1754962436.git.ionic@ionic.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <cover.1754962436.git.ionic@ionic.de>
References: <cover.1754962436.git.ionic@ionic.de>
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
v5:
  - no changes
  - Link to v4: https://msgid.link/456d8dff226c88657c79f1dbadf0dcaba8b905ae.1753720934.git.ionic@ionic.de

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


