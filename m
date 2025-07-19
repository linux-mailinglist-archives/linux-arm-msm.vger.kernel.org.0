Return-Path: <linux-arm-msm+bounces-65743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1F7B0B17F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 20:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B72317CEB8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 18:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7362253F2;
	Sat, 19 Jul 2025 18:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b="mwDhVTvM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.ionic.de (ionic.de [145.239.234.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9337421FF27;
	Sat, 19 Jul 2025 18:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.234.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752951582; cv=none; b=X0x4NO1Qx6SxstnHofX3CyKvCJSZqiZ2/TJGX/15cvMDn+Ud3TmyQE7atURVj8eoHsJyBuO8PqAZtgtudBw3k2FaePgowVL152NmXSyGVJwAiW29UeFxakcAx0k+CltNAEjafK50D0W0ud5iQBVgpoFyDnZJK6KZyaVu7IAP9sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752951582; c=relaxed/simple;
	bh=5WNVUfHylyAj4ZyLXapU3bnDcOlJ2/W3vLBcHDDqmY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VS0xbbjjxnYiIRXO5awaohBg26Ng9FvjiY4ytjv+IrP2qFRWY8W4nkxmSnGQwjbMKg1qPCPaRRBRsKVm+ie+4YJZtQwUEVxB2eqfHRsA8P6nD5IuL+fLj+lPtaxDHjQdjf3MFIIwoPx51YNPjuJmB69EqP7a7QpHTj8318pxmJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de; spf=pass smtp.mailfrom=ionic.de; dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b=mwDhVTvM; arc=none smtp.client-ip=145.239.234.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionic.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1752951577; bh=5WNVUfHylyAj4ZyLXapU3bnDcOlJ2/W3vLBcHDDqmY0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mwDhVTvMdjUD9TIbesJfQL21s22ImJ4GOkMeRseyrij47gne6YgnBHY9W0pzyBmEE
	 Luko0yqMD+dmSEWR7FJY6tVe+mXdRa5iOfrIAPKVmZH2YrOO4A3wycNOj1hgwiJBHn
	 jaVmSGuIAHIf880hoTjiXl9K+Y06xmpwwAkVb8k4=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id 01B061488382;
	Sat, 19 Jul 2025 20:59:36 +0200 (CEST)
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
Subject: [PATCH v2 01/10] net: qrtr: ns: validate msglen before ctrl_pkt use
Date: Sat, 19 Jul 2025 20:59:21 +0200
Message-ID: <866f309e9739d770dce7e8c648b562d37db1d8b5.1752947108.git.ionic@ionic.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <cover.1752947108.git.ionic@ionic.de>
References: <cover.1752947108.git.ionic@ionic.de>
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

---

v2:
  - rebase against current master
  - use correct size of packet structure as per review comment
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


