Return-Path: <linux-arm-msm+bounces-111944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id szS6LhAEJ2rWpwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:04:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26588659852
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:04:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LLiCPT7U;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111944-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111944-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 605C6301451C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 18:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844BA367B81;
	Mon,  8 Jun 2026 18:01:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850842517AC;
	Mon,  8 Jun 2026 18:01:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780941688; cv=none; b=oqopgnFg7PpbwRpPyt+c/kENrgNg3y6mLLWt15NhYIQ0vn87AmdWd5F8f0CDCiQOqvsOVgRtPTrS1n6obvjsr/7xIIqieRhv91kSq7pPKlVp0JnVD1cnZW5vKl4QEjCiM0eOjhmN7+aWpX9L3pBFPZQ2/2ZgViCLFpaXijhBhN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780941688; c=relaxed/simple;
	bh=+jT5XmHMFc85JUhWM7jAkGctPxS8ldMV+kNN3EDIm1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DFZKWIAG73C3lbiSGg1dRB+YjPl+fJpmvG2DWo667rN/Bucjtiouxi1jbd50GVwml6rWTSQaPxgUsF/Q09T0Ix2t65NHxBAXZtByazeaElurzmcTa/VoK39l4vuCMiRnrs+xArXY/Bop4XM/zu5LzlVzfdfpkGTfRYDOAwwO6/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LLiCPT7U; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C35D61F00893;
	Mon,  8 Jun 2026 18:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780941687;
	bh=n5i3xT3L2qpED+pWiLfyOeX9JWGnVgD43DrRzyZk8yM=;
	h=From:To:Cc:Subject:Date;
	b=LLiCPT7U9zav1a4LMWSpVaJK0BQ/jMefCWwKXWBF6vYaYgu7JM+ctC8ag3y/beCb2
	 WhNMaavniMXWONoBIKJBaU/Z66Mhe9q9pKanpamVqODMh579UhTsoyUzL/6n7AdWNr
	 RPDPP80xrzDyoiCLcxNFSVG0JRuTZHUcTvLsC8cyc2x2NVJdfgPdleiuX7lY1FO6KE
	 Pa4BGHvQD3+nt0XiWpKsAIkWejB0I1RBRMI+cKC7AXAwR7+N+L/Gnxnvg7Rduj1v/X
	 R5nm7fG9Uqa7R/3JbsQVwfT+H06DGc9IUq7j5tNtglcUSEoQpCSqgBZL6DFY/grdtS
	 LMsvtNzJ+ezcQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Om Prakash Singh <quic_omprsing@quicinc.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Olivia Mackall <olivia@selenic.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 0/4] qcom-rng fixes and cleanups
Date: Mon,  8 Jun 2026 17:58:44 +0000
Message-ID: <20260608175848.2045229-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.54.0.1064.gd145956f57-goog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-111944-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[ebiggers@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-crypto@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:quic_omprsing@quicinc.com,m:quic_bjorande@quicinc.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:olivia@selenic.com,m:ebiggers@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26588659852

This series fixes several bugs in qcom-rng, including failure to enable
the clock before accessing the hardware, generating biased random
numbers, and generating duplicate or non-random numbers due to missing
locking.  To fix the latter bug, it drops the support for the
duplicative crypto_rng interface, which isn't used in practice, leaving
just hwrng which is the one that actually matters.

This series is targeting cryptodev/master

Changed in v2:
  - Changed patch 3 to make the driver continue to be bound even when
    hwrng is unsupported.
  - Added blank line in patch 2
  - Added Reviewed-by

Eric Biggers (4):
  crypto: qcom-rng - Enable clock in hwrng case
  crypto: qcom-rng - Allow zero as a random number
  crypto: qcom-rng - Remove crypto_rng interface
  hwrng: qcom - Move qcom-rng.c into drivers/char/hw_random/

 arch/arm/configs/multi_v7_defconfig           |   2 +-
 arch/arm/configs/qcom_defconfig               |   2 +-
 arch/arm64/configs/defconfig                  |   2 +-
 drivers/char/hw_random/Kconfig                |  11 ++
 drivers/char/hw_random/Makefile               |   1 +
 drivers/{crypto => char/hw_random}/qcom-rng.c | 156 +++---------------
 drivers/crypto/Kconfig                        |  12 --
 drivers/crypto/Makefile                       |   1 -
 drivers/gpu/drm/ci/arm64.config               |   2 +-
 9 files changed, 41 insertions(+), 148 deletions(-)
 rename drivers/{crypto => char/hw_random}/qcom-rng.c (53%)


base-commit: 79bbe453e5bfa6e1c6aa2e8329bfc8f152b81c9b
-- 
2.54.0.1064.gd145956f57-goog


