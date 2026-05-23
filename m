Return-Path: <linux-arm-msm+bounces-109485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDRYIi36EWpYtAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 21:04:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4355C0647
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 21:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 57CE6300844C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 19:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34C06357CE8;
	Sat, 23 May 2026 19:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ncgstb4+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2DA2D12F3;
	Sat, 23 May 2026 19:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779563045; cv=none; b=jpBK+aTxjYkt1CPmfoP1umdQF6aVimvZyRosofTRcjxtRl99r09oUqrY3Dwwt0CBe/1IiqSruheXE5ZxMrthrykKA1ccDZ53VxsGRZGinIexI5EOfoSSqYNyljgIvvRAs+HYT6Wjm/JCLuC+A5//2WEk052tgZFa35CUg/RHZy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779563045; c=relaxed/simple;
	bh=qKdKW12reljmkI9Y5GL96UhP5eGpAEu75do6kp2GrbQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bZNX9jqF2o6wzAqd/hU/H39DfFkJr7uYaQIrd18IoIGYIduOLBrqT6QN6C6ch1vPwKlKs3U1702Vd6uvh+eal7nBjIE1SrmzwJto2u4Q4wjhzTSF4ZA0C4M7aaA4/UiLTykj4ifX2ns+bpfKFN5VZosfIoGKhw0MPzr1+SU0LXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ncgstb4+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 876E6C2BCB4;
	Sat, 23 May 2026 19:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779563044;
	bh=qKdKW12reljmkI9Y5GL96UhP5eGpAEu75do6kp2GrbQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Ncgstb4+cU6Kr/5vk8rsYFyV4+Vp9eGMDxhnXQVVqjvXKekp7P5Mvrg2rKjmFIeM6
	 Wu7KH2kzMzCpMVfUG1Vvf81mVhWYdikI1QG/7SR1hByDyv8lAngLOlu7nqTTL7gx4b
	 MGWLaH6ZRhXxbVIKTFaYwkSxc0XfcMfPYp30s+Polf8A0ix9xeIHIxK5vZlU0dddMX
	 gBnz5J2FtdgQl7mMv9nA2wWJhyVB9C4vElAyGqIwnZQy7nAEjDEbGXhXD9gp4MINOk
	 VVDHAU8/uM8OwFnaOCmu0R6IMB0x9DmP0dRMRfKxgvSflDZJsHgQXKEjb1lVGupk/y
	 x0tJS52KuBE2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D9A0CD5BB1;
	Sat, 23 May 2026 19:04:04 +0000 (UTC)
From: Demi Marie Obenour via B4 Relay <devnull+demiobenour.gmail.com@kernel.org>
Subject: [PATCH 0/2] Delete the Qualcomm crypto engine
Date: Sat, 23 May 2026 15:03:55 -0400
Message-Id: <20260523-delete-qce-v1-0-86105cd7f406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyNj3ZTUnNSSVN3C5FRdA2Mz4xQjo0QLU0szJaCGgqLUtMwKsGHRsbW
 1AAdO39VcAAAA
X-Change-ID: 20260523-delete-qce-0363d22a8596
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779563043; l=2071;
 i=demiobenour@gmail.com; s=20250731; h=from:subject:message-id;
 bh=qKdKW12reljmkI9Y5GL96UhP5eGpAEu75do6kp2GrbQ=;
 b=TtSJ+IKiIz4+J8ZUozDqY5sbAF3vqtXPpM9l1sFNxConO52NyijO6g3Vw49p+zAa/n1QHX5tt
 xTSDIB65+CJC+aZ2Q+K518avBn4FicGdDE2+6UFcs1UfpBdkIoLYdjs
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109485-lists,linux-arm-msm=lfdr.de,demiobenour.gmail.com];
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
	NEURAL_HAM(-0.00)[-0.974];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,lists.infradead.org,gmail.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[demiobenour@gmail.com]
X-Rspamd-Queue-Id: 8A4355C0647
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The only realistic uses I can think of are:

1. Very weak devices where QCE is actually faster.
2. Devices without bitsliced NEON.

Do any such devices exist in the wild?  I have no idea.

Not even compile-tested, but should be trivial as it just deletes code.
I didn't change the device tree beyond marking the bindings as
deprecated.

Signed-off-by: Demi Marie Obenour <demiobenour@gmail.com>
---
Demi Marie Obenour (2):
      crypto: Delete Qualcomm crypto engine driver
      devicetree: Mark QCE bindings as deprecated

 .../devicetree/bindings/crypto/qcom-qce.yaml       |   3 +
 MAINTAINERS                                        |   8 -
 arch/arm/configs/multi_v7_defconfig                |   1 -
 arch/arm64/configs/defconfig                       |   1 -
 drivers/crypto/Kconfig                             | 111 ---
 drivers/crypto/Makefile                            |   1 -
 drivers/crypto/qce/Makefile                        |   9 -
 drivers/crypto/qce/aead.c                          | 841 ---------------------
 drivers/crypto/qce/aead.h                          |  56 --
 drivers/crypto/qce/cipher.h                        |  56 --
 drivers/crypto/qce/common.c                        | 595 ---------------
 drivers/crypto/qce/common.h                        | 104 ---
 drivers/crypto/qce/core.c                          | 271 -------
 drivers/crypto/qce/core.h                          |  64 --
 drivers/crypto/qce/dma.c                           | 135 ----
 drivers/crypto/qce/dma.h                           |  47 --
 drivers/crypto/qce/regs-v5.h                       | 326 --------
 drivers/crypto/qce/sha.c                           | 545 -------------
 drivers/crypto/qce/sha.h                           |  72 --
 drivers/crypto/qce/skcipher.c                      | 529 -------------
 20 files changed, 3 insertions(+), 3772 deletions(-)
---
base-commit: 49e05bb00f2e8168695f7af4d694c39e1423e8a2
change-id: 20260523-delete-qce-0363d22a8596

Best regards,
-- 
Demi Marie Obenour <demiobenour@gmail.com>



