Return-Path: <linux-arm-msm+bounces-66395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F13B0FD5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 01:26:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D7CEAA0807
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 23:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A227273D76;
	Wed, 23 Jul 2025 23:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b="Oq4KiSYM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.ionic.de (ionic.de [145.239.234.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8620272E5C;
	Wed, 23 Jul 2025 23:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.234.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753313075; cv=none; b=TE3HBdR4RttVoHJhkiAzTZEvXuHLkmaLDiP/1aKuZvS71+wxnpAkUMSdUeGVX1G+83Cb2GxEeNn0wjYpQr+CBhS1I6p+hcxJve/ntzCIEv/m9Sgv2933vSvBAh8hMMrVtdL1dXyUnaHDv+55CdE+MLwxSCP2OQa4wDuxq71dHi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753313075; c=relaxed/simple;
	bh=9lzfcbJu6Nzo+5HL6N1vId/uz0CZMjPh5lNc9QOzbic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eEIA5MkQxSSQ+WLRjF/ThU1qO4GGlIWEQA+3bbLnacij26KMzQIkZX/eSJu/4S5A2VfAJ96Wk2v0o0/FJnNNWpWdyKt8uJja4t8SuyYcrx5J7t23XkEVpwGmyJkfpPEw91MVBESLvpU4yVfvYdNshMO5LXWXeT5G9b1YaENt0/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de; spf=pass smtp.mailfrom=ionic.de; dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b=Oq4KiSYM; arc=none smtp.client-ip=145.239.234.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionic.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1753313065; bh=9lzfcbJu6Nzo+5HL6N1vId/uz0CZMjPh5lNc9QOzbic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Oq4KiSYM4GIaDye6+TIvX0AT9H0A3/HZfwo7jnSMqKtdmaOETlajQcSUkr2a3Hlhi
	 BxqwS/rPpkLj3RjaeR2iK9r1mnPexn2RdEprQrptYE0F6Ggc2YpaodM21QVQCUlfPX
	 55v/YKSnvYUvcAEeTywKhmSietMLVV55Z04sOchU=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id 30BB714886F8;
	Thu, 24 Jul 2025 01:24:25 +0200 (CEST)
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
Subject: [PATCH v3 01/11] net: qrtr: ns: validate msglen before ctrl_pkt use
Date: Thu, 24 Jul 2025 01:23:58 +0200
Message-ID: <a3bc13d1496404e96723a427086271107016bdd6.1753312999.git.ionic@ionic.de>
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

The qrtr_ctrl_pkt structure is currently accessed without checking
if the received payload is large enough to hold the structure's fields.
Add a check to ensure the payload length is sufficient.

Signed-off-by: Denis Kenzior <denkenz@gmail.com>
Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
Reviewed-by: Andy Gross <agross@kernel.org>
Signed-off-by: Mihai Moldovan <ionic@ionic.de>
Fixes: 0c2204a4ad71 ("net: qrtr: Migrate nameservice to kernel from userspace")

---

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


