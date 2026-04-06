Return-Path: <linux-arm-msm+bounces-101953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IljGo6z02kdkgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 15:22:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D818E3A3822
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 15:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E332B3010B94
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 13:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD906351C27;
	Mon,  6 Apr 2026 13:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fsgW6wgG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB44A2F5A12
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 13:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775481701; cv=none; b=sg7hj09A2pvfD+4IBirw44GoZPBv1vQmrJEi2AqSkYLKGTQPYebjnYIsK40QoxXAmJBvwQvKHbM0gUTAwU7qfNr2TC6QXsvqV2kO5B6Dri0v339DTBreIEYKTD3vAPFArx9ZqHyq/6OGLgsy8rgDgQBMox/i8Zg73f1cvdd0ahI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775481701; c=relaxed/simple;
	bh=gMzvZgJhPQDGhuIKuU+VTQeMpr2RvuGJOM4ZILaIqFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qkj3/ckFHlJMB9JQZgDF7KxEKWaTGbQfxorfKnbiksmXZ+vEk02+sss7Fe3ooEGwbcBDku8IipByxzyyfzd75vnp3Pl37yibAFahyy4FJHkcPYBwgGnVLpX8msZRXPhdPZnCrGxEDBJWSVEnrphDqKjOKy7zJsqyt6KhzEM5Nw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fsgW6wgG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5CB9C4CEF7;
	Mon,  6 Apr 2026 13:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775481701;
	bh=gMzvZgJhPQDGhuIKuU+VTQeMpr2RvuGJOM4ZILaIqFM=;
	h=From:To:Cc:Subject:Date:From;
	b=fsgW6wgGxQgAydwtbIDhTk+P+JSilrn1Tax8ZmMrcV+Lk2Pca7Vwn6KzcjoppNSBo
	 +z15AhJqxG4SvBN8legbu7ORAtxK+8tvlPnTKzS77w9pNmMsosqr2TkxXKQdSN5seZ
	 BHn3SYsmIKXRrUJ+GBSlqB1dDjSJqUs29KHvbJOvbEmNzlHofD5zukbFBz80Tqj7Xu
	 cyUwAM+nFcSIcj63J8NRUy9ifU8PUfwHpbH+SOQXuJ0n5NFcvH0bKzoqgIV1WeUaGP
	 APnZ56ai67I5jUlkIAY54LXp5kfIZK3KX+0CUR1BBFtfOJf3Fm5UV2YIBoxnW10H+H
	 bDmrBaJslID/Q==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [GIT PULL] One more Qualcomm driver update for v7.1
Date: Mon,  6 Apr 2026 08:21:38 -0500
Message-ID: <20260406132138.2265013-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101953-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D818E3A3822
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


The following changes since commit d6e766e391ef0b2be62682e007223fc72ba7764f:

  Merge branch '20260125-iris-ubwc-v4-1-1ff30644ac81@oss.qualcomm.com' into drivers-for-7.1 (2026-03-30 12:46:14 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-7.1-2

for you to fetch changes up to a31ad9339eff4ce401dec816b01a94b4e3c47898:

  firmware: qcom: scm: Allow QSEECOM on Lenovo IdeaCentre Mini X (2026-04-02 16:09:01 -0500)

----------------------------------------------------------------
One more Qualcomm driver update for v7.1

Flag Lenovo IdeaCentre Mini X to have functional QSEECOM/uefisecapp.

----------------------------------------------------------------
Bjorn Andersson (1):
      firmware: qcom: scm: Allow QSEECOM on Lenovo IdeaCentre Mini X

 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

