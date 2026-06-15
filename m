Return-Path: <linux-arm-msm+bounces-113262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tX47LLp/MGpkTwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:42:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D9468A6DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:42:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=EsMH3Dk1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113262-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113262-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C2E8530089BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 22:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6F23B9920;
	Mon, 15 Jun 2026 22:42:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D0830C35E;
	Mon, 15 Jun 2026 22:41:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781563320; cv=none; b=q1h+o9Rd0PXTkGq03Z0O4bapHsPK10Eqqeo/bXRL0r+eIO3QPG/9lYBFwPVcvQBwvCft3pMf5sP5qAxoASGmqNPIjncgCl9IJxC1lpsKsU0Oc0ZNH+95qtm4THWebWlZldLeNyB5xSKlFSC+8nmbIXO1aUc1a878m8EaEMKLvlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781563320; c=relaxed/simple;
	bh=DL/CjOy+iSZNPgP1M/Et+S6+sLElS0zHa3yvR43jBT0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e7b3c/0PrHkrYzP88av9lLxjdClpWkSuLz74rJw4AYs/w0L8BgitvTI6Sqx/5bShBcL0JKq26LsQ95FUdKOrC9YUcRnK+Q47hz8MswXqIoXh5/d6R42EGq8KPLTtKGeHqNVD/j4kyVouLGEZHNsKrV5eJTeHBXoT6gOnaJn0SJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EsMH3Dk1; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 921361F000E9;
	Mon, 15 Jun 2026 22:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781563318;
	bh=5Jl9m7V3yXQnZ43d8h9Ezxg3t6oL0GlfUij+HhmVmGE=;
	h=From:To:Cc:Subject:Date;
	b=EsMH3Dk1sSUjznLIsLC+/vrUoyHpnANemJqsICM2dLhfcSmiyajyKWgPq6HAwVKux
	 7cS9yzB4+VMgPdNBUYVL6GUEXhzD2FcyxU3wLuAhJDij4JESbuPErfWhu7BfPhWn8W
	 ZULz/g0aVXQLy4qlGi1mIFEXJIdlstIUWfpWApg8qbi1NC41A28djO2twXu6UJqAo7
	 lSwKd9glGp4z6j+5zaUAeiZRxHvsICZdA1m6yYIsjn/YekmJgGy2qc7GOFaG21ROn2
	 SkFBj6qTWLwkgQkHSHzOVKP4ww/CWsSovF2yJl8Q/j+Sv1XhDNfKff0biqrV/CbBv8
	 VFcAcq7TFF+kA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-kernel@vger.kernel.org,
	Gaurav Jain <gaurav.jain@nxp.com>,
	=?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Corentin Labbe <clabbe.montjoie@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 0/7] Finish removing crypto_rng from drivers/crypto/
Date: Mon, 15 Jun 2026 15:41:24 -0700
Message-ID: <20260615224131.69370-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113262-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-crypto@vger.kernel.org,m:herbert@gondor.apana.org.au,m:linux-kernel@vger.kernel.org,m:gaurav.jain@nxp.com,m:horia.geanta@nxp.com,m:pankaj.gupta@nxp.com,m:clabbe.montjoie@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:ebiggers@kernel.org,m:clabbemontjoie@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ebiggers@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,nxp.com,gmail.com,oss.qualcomm.com,kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 52D9468A6DE

This series finishes removing the unused, redundant, and frequently
broken crypto_rng support from drivers/crypto/.  It applies to
cryptodev/master.

Patches 1-4 are a resend of
https://lore.kernel.org/linux-crypto/20260608175848.2045229-1-ebiggers@kernel.org/

Please consider these patches for 7.2, considering that most of these
drivers had security vulnerabilities which would have needed to be fixed
right away anyway.  And the qcom hwrng fixes are important too.

Eric Biggers (7):
  crypto: qcom-rng - Enable clock in hwrng case
  crypto: qcom-rng - Allow zero as a random number
  crypto: qcom-rng - Remove crypto_rng interface
  hwrng: qcom - Move qcom-rng.c into drivers/char/hw_random/
  crypto: sun8i-ce - Remove crypto_rng interface
  crypto: sun8i-ss - Remove crypto_rng interface
  crypto: caam - Remove crypto_rng interface

 arch/arm/configs/multi_v7_defconfig           |   2 +-
 arch/arm/configs/qcom_defconfig               |   2 +-
 arch/arm64/configs/defconfig                  |   2 +-
 drivers/char/hw_random/Kconfig                |  11 +
 drivers/char/hw_random/Makefile               |   1 +
 drivers/{crypto => char/hw_random}/qcom-rng.c | 156 ++----------
 drivers/crypto/Kconfig                        |  12 -
 drivers/crypto/Makefile                       |   1 -
 drivers/crypto/allwinner/Kconfig              |  16 --
 drivers/crypto/allwinner/sun8i-ce/Makefile    |   1 -
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c |  63 -----
 .../crypto/allwinner/sun8i-ce/sun8i-ce-prng.c | 159 ------------
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  |  29 ---
 drivers/crypto/allwinner/sun8i-ss/Makefile    |   1 -
 .../crypto/allwinner/sun8i-ss/sun8i-ss-core.c |  45 ----
 .../crypto/allwinner/sun8i-ss/sun8i-ss-prng.c | 177 -------------
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h  |  23 --
 drivers/crypto/caam/Kconfig                   |   9 -
 drivers/crypto/caam/Makefile                  |   1 -
 drivers/crypto/caam/caamprng.c                | 241 ------------------
 drivers/crypto/caam/intern.h                  |  15 --
 drivers/crypto/caam/jr.c                      |   2 -
 drivers/gpu/drm/ci/arm64.config               |   2 +-
 23 files changed, 41 insertions(+), 930 deletions(-)
 rename drivers/{crypto => char/hw_random}/qcom-rng.c (53%)
 delete mode 100644 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c
 delete mode 100644 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-prng.c
 delete mode 100644 drivers/crypto/caam/caamprng.c


base-commit: 6ea0ce3a19f9c37a014099e2b0a46b27fa164564
-- 
2.54.0


