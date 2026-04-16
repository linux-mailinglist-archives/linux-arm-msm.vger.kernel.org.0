Return-Path: <linux-arm-msm+bounces-103457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOlrG3tl4WlyswAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 00:40:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5E2415453
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 00:40:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5FBCC30197C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 22:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 715F6381B02;
	Thu, 16 Apr 2026 22:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Bzruaxjs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A3330EF9B;
	Thu, 16 Apr 2026 22:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776379252; cv=none; b=i7FhfZRqpZhoSCnEHXhWLyKh0up6fchlQjRiWx6S3eYR+O6oe5qRQpz4UH30/QcRae/ioE576Sm8QGqYdjpDQnXDQWOhUn9zvKIqiS+BGR81VOc9zxgPZP5GeCfnGROzaf3u3ob18K73ovRFKQ675Bw837N5CYINpanqk8qAA9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776379252; c=relaxed/simple;
	bh=E2jfzlGWdIEVZfKPLwUQIqJJnZOIsiSeZErf/ASbVNY=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HJYQiMQSFiUBBs7Pr+HWZ8XIJ6tN4yPqadYK//jeaTIs1v2jeQirXWynDu6Nkm7goUFnPSE4qWX0x8qdK9LtbJnORVrpOC8dQx0QBFSPwArO2YuU1rvo+f1HdHUsolgtoSUV4VEJYTVxPMw9c4ztE+O7SxXCbmrNimnVOZ0G+aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Bzruaxjs; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776379247; x=1776638447;
	bh=nSVLpgT9Fujjh8kwizztM5UtGLZI3NVgc50rTOSdKz4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Bzruaxjs6lIYUhhl5eY4/jzVhua3vr/FIcIWiTM1K8ewfvchIuBgv46ziRcsW5Wj0
	 6sjYtuNn7o8qdMcGQg7eePWIH1De1dCe8sQVGUZJm4GX1xw7FllXqUoDVYfCwQak/F
	 A6lkj+u4UUkpmOf88LiBX1mrnkyOtjd7KAajNuy6vaBJdLmol/+tW1YlNXNCLQUA4M
	 22qB35+J468i487pJaBDcnPNMNyVE6PyPE2/AghT7P/EA8c13Cwes+l9yUTy6aowyI
	 zsiQq+nu9Lai+1o6bMoZoFqPT1lnRimnrQRolr+PMC6u8QFrHx4yP0Esx22QnEXT1J
	 mTro3jSTbXQwQ==
Date: Thu, 16 Apr 2026 22:40:43 +0000
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH RFC 0/4] net: ipa: add support for Eliza SoC (IPA 5.5)
Message-ID: <20260416-eliza-ipa-v1-0-f4109a8e43c4@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 2c430487b9b94c3ac200b83b57e977aa71d9773d
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103457-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,codelinaro.org:url]
X-Rspamd-Queue-Id: EE5E2415453
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds support to the IPA driver for the Eliza SoC (IPA 5.5).

Wanted some feedback on how best to handle the difference in the Q6 FNR
counters between Eliza & SM8550/SM8650, since it also changes the memory
layout [1].

I was thinking about something like checking firmware version after
loading IPA firmware and if above X version, use increased FnR counters
but I am not sure what firmware version this was introduced in.

For now I am just doing it with a seperate Eliza compatible but this
feels kind of meh. I'm also not sure if it's possible there's some Eliza
variant out there that actually has firmware that is too old, and then
68 for FnR counters is too much.

I also wanted some clarification on the general need to pass hw filter
stats info, downstream this is marked as "optional", but seems very
much needed for Eliza.

Is this actually optional and there is just some other misconfiguration
or is firmware broken? Hard to debug what modem wants since system does
a complete halt shortly after starting IPA if I don't pass this.

[1]: https://git.codelinaro.org/clo/la/platform/vendor/opensource/dataipa/-=
/commit/0a3c432e4fd294eba6def56378acb6fa39feb400

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Alexander Koskovich (4):
      dt-bindings: net: qcom,ipa: document Eliza compatible
      net: ipa: fix IPA v5.5 configuration data
      net: ipa: add new QMI request for HW filter stats info
      net: ipa: add Eliza configuration data

 .../devicetree/bindings/net/qcom,ipa.yaml          |   1 +
 drivers/net/ipa/data/ipa_data-v4.5.c               |   1 +
 drivers/net/ipa/data/ipa_data-v4.7.c               |   1 +
 drivers/net/ipa/data/ipa_data-v4.9.c               |   1 +
 drivers/net/ipa/data/ipa_data-v5.0.c               |   1 +
 drivers/net/ipa/data/ipa_data-v5.5.c               | 180 +++++++++++++++++=
+++-
 drivers/net/ipa/ipa.h                              |   3 +
 drivers/net/ipa/ipa_data.h                         |   4 +
 drivers/net/ipa/ipa_main.c                         |   4 +
 drivers/net/ipa/ipa_mem.c                          |   2 +
 drivers/net/ipa/ipa_qmi.c                          |  18 +++
 drivers/net/ipa/ipa_qmi_msg.c                      |  58 +++++++
 drivers/net/ipa/ipa_qmi_msg.h                      |  15 +-
 13 files changed, 280 insertions(+), 9 deletions(-)
---
base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
change-id: 20260416-eliza-ipa-c26a88213ff3

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



