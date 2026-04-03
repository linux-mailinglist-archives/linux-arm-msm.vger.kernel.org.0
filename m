Return-Path: <linux-arm-msm+bounces-101683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPcMD6Xmz2kS1gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 18:11:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D48D83961BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 18:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48B61300B9FC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 16:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8EBF3CCA1F;
	Fri,  3 Apr 2026 16:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V31zpHGX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6C83C9ECD;
	Fri,  3 Apr 2026 16:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775232380; cv=none; b=c8D+84odO38UIga93Y9ve8854CaRmg98SMDmkhbwZiDksy95QB64zuKqviG9us2ExvfcA+nEFRCijk1flkanQbxPzyICtjIZVjk+SZG4xvk4G7CYVnYUrQwN6zyFHDOOjgKMu5URIrxF97KIhgUOR6Hea6g1Oly4NLIPc6pNC2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775232380; c=relaxed/simple;
	bh=vYHiRwhsDAzLREfvrBGT0BNZkK9bUpTZpszFUTATl3Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mpW+a+6G76tdZcO+Mjj80bfu08WroYEC8DmRz/TyWfGcIMXVO5TTDr1pTtryLEOmZKxEXKOxEa/7kYCzwSCkOoNSRA9kWAaz2jrju+wlT4R+AKL0Uo0wNQnPTDIipR74EvS3gThNWfDQGROjOuMda8Ia8AYVAGvmVRt+Ve9nj7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V31zpHGX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29AA2C2BCAF;
	Fri,  3 Apr 2026 16:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775232380;
	bh=vYHiRwhsDAzLREfvrBGT0BNZkK9bUpTZpszFUTATl3Q=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=V31zpHGX8t7/gXHQYN/NATQFdqMqXzTjWwCyq1BKskH7B5hMFobEYxWivm/BdBMeV
	 T2UJCiBVjdWfyhcgJNGchKr2/7i9NQD0t7gTFQWBRBQmUEwVBLFKxLfTsFmhvk/Na+
	 G6YSLMFaGDl+FZGbq9DAhOBpzojhmN38BIFwcXPxKMqzu7ACUiPfpFGdo9/UWyGSuj
	 +fGeONtGDQBRKSdn69xK+8Am7dADeN6CRI9zza83tkZ9UBwuB1ls9lJ8b2mxs9dBCc
	 PQnxfXEX9WD9ikuPxaXUNR8HLS3D1zCrx/H25R0ovywX7AjaWPUylLyKEHEd6E2jjr
	 YmKZktpBK5+iw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D557E85371;
	Fri,  3 Apr 2026 16:06:20 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Subject: [PATCH v2 0/5] net: qrtr: ns: A bunch of fixs
Date: Fri, 03 Apr 2026 21:36:03 +0530
Message-Id: <20260403-qrtr-fix-v2-0-f88a14859c63@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGvlz2kC/02MQQ6CMBBFr0Jm7RA6UIKuvIdxQXEKFS06LcaEc
 HeLbly+n/ffAoHFcYBDtoDwywU3+QS0y6AbWt8zuktioILqoiwVPiUKWvdGowvqqGZtqxqS/hB
 O8zd1Ov84zObKXdz+m2FlumMchNu/JO0pdXWVU6M0NRUqHGfTHkcWz7d8kh7W9QNUDa5ipwAAA
 A==
X-Change-ID: 20260331-qrtr-fix-b502c26e5f46
To: Manivannan Sadhasivam <mani@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Yiming Qian <yimingqian591@gmail.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1032;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=vYHiRwhsDAzLREfvrBGT0BNZkK9bUpTZpszFUTATl3Q=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpz+VzOfxpKLoJEkpNrmUhIgZ6WHuk8IT6hFx/d
 2hFZmeo9cKJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCac/lcwAKCRBVnxHm/pHO
 9b2oB/9RkPyY+LUXDdx9G/ddlzlq37DdOq9PsAO2f6xg+x5bop/uatsBxpbjVqzyG2BznrMk5sA
 CmEmgrL7EeDbPCqg2ZdOf3lq+6BpmuZSxKfhTtjPZRu0/YaMgkPnfNRNAs2UUwi0+w+ZgDqkG7R
 l/viU1X+06/9+1TfPRplcT970mQ1OrICMnLL9BLzv9gKnNfsOrdksDHjSKE7DLrPW3HbziA3QRI
 OKwqfke3ev8DUBlXy5q4rHX7ren0TW0upeklKbEsyqGLDTsM4QKDQbChxyvQG/0BQjHtxbedB/b
 ngoOMt4NQ9O/dJ3FVL58NJs7NxXAokTLULep0lwnUKZAPe4l
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101683-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,oss.qualcomm.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:replyto,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: D48D83961BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

This series fixes a bunch of possible memory exhaustion issues in the QRTR
nameserver.

Manivannan Sadhasivam (2):
  net: qrtr: ns: Limit the maximum server registration per node
  net: qrtr: ns: Limit the maximum lookups per socket

 net/qrtr/ns.c | 38 ++++++++++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 4 deletions(-)

--
2.51.0

---
Manivannan Sadhasivam (5):
      net: qrtr: ns: Limit the maximum server registration per node
      net: qrtr: ns: Limit the maximum number of lookups
      net: qrtr: ns: Free the node during ctrl_cmd_bye()
      net: qrtr: ns: Limit the total number of nodes
      net: qrtr: ns: Fix use-after-free in driver remove()

 net/qrtr/ns.c | 71 ++++++++++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 61 insertions(+), 10 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260331-qrtr-fix-b502c26e5f46

Best regards,
--  
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>



