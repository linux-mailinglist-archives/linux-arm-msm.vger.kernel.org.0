Return-Path: <linux-arm-msm+bounces-100115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNp0BPQ2xWlX8QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 14:39:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4413361E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 14:38:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3D58301B739
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 13:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8490B2DCC1C;
	Thu, 26 Mar 2026 13:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="atlSNU+x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615BF2C21C2
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 13:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774531883; cv=none; b=QOcOq98rSFA6VyzzoMR8eZ+wLYc4jtwYlTv7EQstUcfDXq44oMnXVP/9x4VadvmWAeDNbcPdZeyNr3p3SCxJE0FBOe7X7IxS+fWTXenyA8mnUgiO9jSMAOBEM3zreIH16AVK21gLr4mdAfe3vmD0Cxy3UdXcd2NtAhBydZ0ouVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774531883; c=relaxed/simple;
	bh=si+jevF1tez+sJmAqLfZ+PpqgojMBaE2vdJxM1Sql6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S44DlhAL7zHzFSA1jgtaSfjIl4SGssGYB508LL45D5DKxZqUItxPcnKphB2BX4RmumbHOktCI7+kZbfvghPXzsk8VrSHBpknT2E9TiHNyTbv6GZ5ayeOsUQDVUxk/YWwCmpnEhgiKIPuhMb3/cnuQtRZg8GiVhaaPt+YOOhEYmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=atlSNU+x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30EDEC116C6;
	Thu, 26 Mar 2026 13:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774531883;
	bh=si+jevF1tez+sJmAqLfZ+PpqgojMBaE2vdJxM1Sql6s=;
	h=From:To:Cc:Subject:Date:From;
	b=atlSNU+xyyR3FPljR6Eqa/bAswPaibNUdndeJMiCKNuPeY2HU2Yz/k24VwHxHfoCp
	 TbRve90y0wRkoy6xqKC3Rkegq5ce/XO1XPNvM/rZdxyDAQdIc84ve+KVmpw10Ri2h0
	 evPvQs4GaPAW4G6G+jv3CEbV1fgQ47ZjlwEniKD8mdtaEnNfOMyHpqEO3AdFKA+Tud
	 dI7Dybo0l2YGwDVYjBlJ9rRYZwlJyG7Ur3yPA63r9VYb9ItzmZj3Wc+zr7yZQN2E9m
	 5DllpWAH4EzvKvnUi2MKcwwQplviH82fPBdVgLGrHOeQIg+CsSj6JPEe7HpKRRi7bX
	 lGtT5skPuKJ6g==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm driver fixes for v7.0
Date: Thu, 26 Mar 2026 08:31:19 -0500
Message-ID: <20260326133119.66268-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100115-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5D4413361E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-7.0

for you to fetch changes up to a343fb1e03cfc9f6dc83a5efb2a8d33e9cdaf6b9:

  soc: qcom: pmic_glink_altmode: Fix TBT->SAFE->!TBT transition (2026-03-18 21:51:11 -0500)

----------------------------------------------------------------
Qualcomm driver fixes for v7.0

Fix the length of the PD restart reason string in pd-mapper to avoid
QMI decoding errors, resulting in the notification being dropped.

Fix the newly introduce handling of TBT/USB4 notifications in pmic_glink
altmode driver, as it broke the handling of non-TBT/USB4 DisplayPort
unplug events.

----------------------------------------------------------------
Konrad Dybcio (2):
      soc: qcom: pmic_glink_altmode: Fix SVID=DP && unconnected edge case
      soc: qcom: pmic_glink_altmode: Fix TBT->SAFE->!TBT transition

Mukesh Ojha (1):
      soc: qcom: pd-mapper: Fix element length in servreg_loc_pfr_req_ei

 drivers/soc/qcom/pdr_internal.h       |  2 +-
 drivers/soc/qcom/pmic_glink_altmode.c | 39 +++++++++++++++++++++++++----------
 drivers/soc/qcom/qcom_pdr_msg.c       |  2 +-
 include/linux/soc/qcom/pdr.h          |  1 +
 4 files changed, 31 insertions(+), 13 deletions(-)

