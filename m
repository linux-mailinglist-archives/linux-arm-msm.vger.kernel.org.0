Return-Path: <linux-arm-msm+bounces-110338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /cLZGudGGmrP2ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 04:09:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B08AE60AE20
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 04:09:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 774723047418
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 02:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21CFE310784;
	Sat, 30 May 2026 02:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d/d5oZN7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2220F768EA;
	Sat, 30 May 2026 02:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780106831; cv=none; b=Fji0+PB64OmDscldUhXBBcv7gaCM2M/m/7u2ANMC47CLMikP706LXPNYm5eK/CNoxM+ASczg40sloXWqo3aBJ2ts6zziKqDC/mnCRpYVRh72FPPs6hohn9y2FpACSd4/L8FlnEcld0FSpynCLfRRqz7nNdsjER+OlgX1F3ZGipo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780106831; c=relaxed/simple;
	bh=D6Y7LkS+4Ug9cuUqLdTI7BCQwA/dMN9E+f3gXcLslsw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J7p0j48gZzaMXibNBdMZFFcd3leC77K/O4j8WgDxjbtVUPlLdVesB1qJ8W76oAi4Oica9gy+DmPQsevX2+lO8hvShZvPlVDHwyOGRc57r1m5eSu53jcXo2zdWJm1qJPWjEy+8cIW0WclqUhnuEjoO30SuXnaIVcMXYCATnrqs9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d/d5oZN7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BFC51F00893;
	Sat, 30 May 2026 02:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780106829;
	bh=pPyJS3QIPzkvmjhvTqjOfTZhcj4mFErXU6nWdVkUxME=;
	h=From:To:Cc:Subject:Date;
	b=d/d5oZN7NczMhKa9LYopaDwiQjNZYVZZRC3Ic5cIHbUaiciGZLRhUogeEeHe5cLoX
	 +4USSQQAHmn7F4y8HcQRutTJHCUuD7EY9xhVWHh/FmIpfvlLNwTyXphR2T1qnsweF1
	 byGvvmKcNZGSHAnpKq7Gt3LXDABzSm5MkLm8jfYddfAm3FHaIBEDxsudta7GvzfndU
	 MmAwUqaWkvb/gpeo6E3sRvkq3J3BkH8Oi2836+/UFu++D+65HKBP3xisKWgPcrQiZx
	 WQgNdrjDxh+ZvP886nTqFez1u2DTcmbY4MLIRq2oUjMeCKpfM7N0hZLkoqmoHg3jsx
	 XhS6HZkCo5XXw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Om Prakash Singh <quic_omprsing@quicinc.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Olivia Mackall <olivia@selenic.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 0/4] qcom-rng fixes and cleanups
Date: Fri, 29 May 2026 19:03:28 -0700
Message-ID: <20260530020332.143058-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110338-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B08AE60AE20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series fixes several bugs in qcom-rng, including failure to enable
the clock before accessing the hardware, generating biased random
numbers, and generating duplicate or non-random numbers due to missing
locking.  To fix the latter bug, it drops the support for the
duplicative crypto_rng interface, which isn't used in practice, leaving
just hwrng which is the one that actually matters.

This series is targeting cryptodev/master

Eric Biggers (4):
  crypto: qcom-rng - Enable clock in hwrng case
  crypto: qcom-rng - Allow zero as a random number
  crypto: qcom-rng - Remove crypto_rng interface
  hwrng: qcom - Move qcom-rng.c into drivers/char/hw_random/

 arch/arm/configs/multi_v7_defconfig |   2 +-
 arch/arm/configs/qcom_defconfig     |   2 +-
 arch/arm64/configs/defconfig        |   2 +-
 drivers/char/hw_random/Kconfig      |  11 ++
 drivers/char/hw_random/Makefile     |   1 +
 drivers/char/hw_random/qcom-rng.c   | 132 +++++++++++++
 drivers/crypto/Kconfig              |  12 --
 drivers/crypto/Makefile             |   1 -
 drivers/crypto/qcom-rng.c           | 276 ----------------------------
 drivers/gpu/drm/ci/arm64.config     |   2 +-
 10 files changed, 148 insertions(+), 293 deletions(-)
 create mode 100644 drivers/char/hw_random/qcom-rng.c
 delete mode 100644 drivers/crypto/qcom-rng.c


base-commit: 5624ea54f3ba5c83d2e5503411a31a8be0278c1e
-- 
2.54.0


