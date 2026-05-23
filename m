Return-Path: <linux-arm-msm+bounces-109486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACzxIy76EWpVtAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 21:04:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A735C064A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 21:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7C42F3008FDF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 19:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BAA4381B1B;
	Sat, 23 May 2026 19:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AOLantyx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F35630C606;
	Sat, 23 May 2026 19:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779563045; cv=none; b=cf4nDNuYcbb6YujWlv2R1NCMhh7un0mEmg0CDEJE7Z+yxxeDLEF/WLtyr2e4TJyL/FgairMiEIQ8IOCP+9MXbF74wQzgGQWvzd9Vhq+RqBMYcPpyd5BWxdkiGxzrH3bg3xBmL3WmbT4JPoEQHgSjZU43Ah0EuWc39hyWEZNKnt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779563045; c=relaxed/simple;
	bh=2SS07pcThfNT1tSaEjda22uwutm2wospJQwzUhdmOBw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OHBx0TrqnlyKvEettsu72OexnoSrMlToXpe94sqR19w5zQe+iFQRDr4NR9/mqbvGysI6NkiR+iDfYJaCriQg6Rij/4N1K18piIFT/jqYL4tHL7pnPMP2C+NUlhmLnGu58gpe6D15TFgBV5ynZq/Y1HewtyXDFS4Dz1XCkTUW2vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AOLantyx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1EE7C2BCC6;
	Sat, 23 May 2026 19:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779563044;
	bh=2SS07pcThfNT1tSaEjda22uwutm2wospJQwzUhdmOBw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AOLantyx44Tvmr2p/dvDDJ06EAAhkd5EeYQBxCkrRQ9m0xOm4GcCwybmlZdCJq+Q8
	 dqO+5dyhF1fZAvZNzgfdzK3QePjGmAEro6/l+mOOKGu/IFUJcdYTheI3Y7olKXELbd
	 vuBhRdFQXHwCpklmoiHpfkAsgI3J3nOAk2QhWMMgJlEzNin3hqr2+cixXg5giyBRiq
	 IKFvpX3BAPwpchEBFg/2Zyuet1Kj4Pz8UTzswH0D4EWlcX3rPVsBbwTN7qxEdHGvV6
	 RwccLENMhH3yJmPQSMV8sTm4pzM0IG0mUNmUVM1qqUTld1fxAdjBz9IoLMgPTi1jhw
	 KSsf0ZsWahz5Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4959CD5BC6;
	Sat, 23 May 2026 19:04:04 +0000 (UTC)
From: Demi Marie Obenour via B4 Relay <devnull+demiobenour.gmail.com@kernel.org>
Date: Sat, 23 May 2026 15:03:57 -0400
Subject: [PATCH 2/2] devicetree: Mark QCE bindings as deprecated
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-delete-qce-v1-2-86105cd7f406@gmail.com>
References: <20260523-delete-qce-v1-0-86105cd7f406@gmail.com>
In-Reply-To: <20260523-delete-qce-v1-0-86105cd7f406@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Thara Gopinath <thara.gopinath@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>, 
 Ard Biesheuvel <ardb@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Demi Marie Obenour <demiobenour@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779563043; l=938;
 i=demiobenour@gmail.com; s=20250731; h=from:subject:message-id;
 bh=UpFD3AMMc7/LD9RiWL4w2/RMipvwMvRcG8UHGJEaez0=;
 b=yo8EFawzIu9uowTwT6gx7418eSwz8NdE8eaN4nlUmJi9nZT0Xb5dT6bfPYa7PttwabD5CoOZk
 jPDSEapbCQmAEMcriUpUZqZEojgTId9Zs1zk5AxN8mRKDz79OkI9g2t
X-Developer-Key: i=demiobenour@gmail.com; a=ed25519;
 pk=4iGY+ynEKxIfs+fIUK9EzsvZ44yGE0GvXLeLTPKKPhI=
X-Endpoint-Received: by B4 Relay for demiobenour@gmail.com/20250731 with
 auth_id=473
X-Original-From: Demi Marie Obenour <demiobenour@gmail.com>
Reply-To: demiobenour@gmail.com
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109486-lists,linux-arm-msm=lfdr.de,demiobenour.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,gmail.com,kernel.org,armlinux.org.uk];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.946];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,lists.infradead.org,gmail.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[demiobenour@gmail.com]
X-Rspamd-Queue-Id: 94A735C064A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Demi Marie Obenour <demiobenour@gmail.com>

They are no longer used by the kernel.  Keep them to avoid unnecessary
churn and because I know next to nothing about devicetree.

Signed-off-by: Demi Marie Obenour <demiobenour@gmail.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 08febd66c22ba8220860f1a59403782d12f8531f..0f378073ddf550ff5954fbe169d5d262a4e46dcf 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -14,6 +14,9 @@ description:
   This document defines the binding for the QCE crypto
   controller found on Qualcomm parts.
 
+  This driver is no longer used and so this binding only exists
+  for backwards compatibility.
+
 properties:
   compatible:
     oneOf:

-- 
2.54.0



