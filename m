Return-Path: <linux-arm-msm+bounces-91050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPC3MFcpeml/3gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 16:20:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECD9A3AEB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 16:20:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3FADF3003737
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDDE236A03F;
	Wed, 28 Jan 2026 15:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uOQNpUVN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC45336B075
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 15:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769613612; cv=none; b=aNWWVCiZ1Di0hhedfk2vQs4XRPKydsJSmclSOQ79DmoexRK0bQNsE5gIzyf/ems1VwI6ggX2xygGDUlfb6/pjxYV/K7tIE3BQ1V702QdbtL7gHfygrgwSFoJ9cMi36vfUJ8P25LlqR7UzFoIuj5yNIgtze+hSq4aPD5j7/2k3y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769613612; c=relaxed/simple;
	bh=n5r/uUVLuNiFYvHFPNXrYj+DESSqzslGS1XqaqDCoPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jT0HiDmSe/KH3N3UPrwAhW/8VRqGzLLBbc4II57cojzykyBb845eypkRfxiaIr5OR5mJS53ZK8Y13Hgy7lEMkQmU7wir05DBzx8k7OrbSV8QIZBneGA1y/vdats1vNnI+EYMxnYqg8ZTVuJJMKk6FwDBUoWj58rJ6VAk4rlw9bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uOQNpUVN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5CEDC4CEF7;
	Wed, 28 Jan 2026 15:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769613612;
	bh=n5r/uUVLuNiFYvHFPNXrYj+DESSqzslGS1XqaqDCoPM=;
	h=From:To:Cc:Subject:Date:From;
	b=uOQNpUVNNZKRvk1Pa2JvusSosDc32YrYzAu/YhJ8p+K+OI3Syeltdx44Uy9qxKwVz
	 9d/6xiGIB0yKhdMW1zl3mhlrbUc7U9aTIsrGYsdF5ruEXH6qSzPun8viohS5PPrQUo
	 PY0T9xNmTkcZuWWIe3i8WLGXFdsnMcLNkbRYu3uY3B2w2ieIwchOnYXCDfV9Fhph9V
	 WzbCZyLnB4RwQSTlWCmE8VXr4rjKa0YqX5+QoQ97nc4srmNH0ImOK3h5Vq1LZD72tZ
	 fzsmTVj7UbGIbmcBQ2ehpHTzNK703f5sn1dnV3bNnAZwzaGKN1XJdICFhFy/TMjtcu
	 YqaYzsy//JyOQ==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: [GIT PULL] Qualcomm driver fix for v6.19
Date: Wed, 28 Jan 2026 09:20:10 -0600
Message-ID: <20260128152011.2091082-1-andersson@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91050-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN_FAIL(0.00)[4.211.64.104.asn.rspamd.com:query timed out];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arndb.de,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9ECD9A3AEB
X-Rspamd-Action: no action


The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-6.19

for you to fetch changes up to f2090ebdb59d0546cbd7b55d9dd63a77133efc03:

  soc: qcom: smem: fix qcom_smem_is_available and check if __smem is valid (2026-01-28 09:10:53 -0600)

----------------------------------------------------------------
Qualcomm driver fix for v6.19

The changes to the logic in the Qualcomm SMEM driver for separating
"failed to probe" from "not yet probed", did not change the
qcom_smem_is_available() function, with the result that clients sees
SMEM as always available. Clients might then proceed to interact with
SMEM in codepaths that aren't suited to cope with -EPROBE_DEFER.

----------------------------------------------------------------
Christian Marangi (1):
      soc: qcom: smem: fix qcom_smem_is_available and check if __smem is valid

 drivers/soc/qcom/smem.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

