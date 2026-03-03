Return-Path: <linux-arm-msm+bounces-95126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOdmCt3OpmnHWgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 13:06:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D541EEFC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 13:06:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB2D830D0F7D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 11:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C3C345722;
	Tue,  3 Mar 2026 11:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LIy+Ev0i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA3330C359;
	Tue,  3 Mar 2026 11:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772539063; cv=none; b=tgua4IEWVKCRWd1DUyX13XTkSyDy89+O6TqvDRlxCTwmi4YTyLfpoSsDA+5Sse1Kt8iC/dMeWGobp515W+OSV3F9HXK0ABQNEiPP5kKhK/CYmJIdKdbuPyLZZyxij6zA3H8Fcvg4v/3hGeBSyOqyLWkhAeZRt/0SzbwWZibxhCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772539063; c=relaxed/simple;
	bh=+QuUzVAtygxEq4K2NyuuefSYb1+7X2pqddTzd+Vv4rs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sdfE3WDzuenvC7M2GZBfPqSsSVfzz25ELZyzi8aLuJOaxJi8i/x/3zN4G7uzydTvpSKAGlLBXTdYvhDu2SkQ7TvzzUorLpWX34qpNwHRJuB7DDftjbSI4ED38AzA+VRcVZyxBpLH7g6XUK82tNhkT2e2HXZWJbMO48gINukAI1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LIy+Ev0i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77286C19422;
	Tue,  3 Mar 2026 11:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772539063;
	bh=+QuUzVAtygxEq4K2NyuuefSYb1+7X2pqddTzd+Vv4rs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LIy+Ev0iUQHIhrpTlxpUBb7h12iXOaWHgwNdHcKB2DcWYrmwV2DI/zWY1L3QwEj7d
	 VRWLDxy3yula8EdWtuiHDss8XooOXLU/aV+C9tdAZ0c+6QDW/7urEgt2+bqV5ZhdV5
	 Eo11pAUCfpaXFK3L0ixJTYY7ukglmK2RtUVBj61VAZyyVJZzK8nKyIYcKfWBvjJmBx
	 0G1UMQDY8Od3IpBRZFMH2xaGsz8Sta+9LDDda9McC+O2jBe3HUPo4DlXXK+sHdCmec
	 P4+234ZWTS4Nk0xr0e0YqC2DOnAJNnkaZjGKQWh6Q1joiMZeljdkhTvU85guKHk7eM
	 /IlAhPe+3kM7g==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	hanguidong02@gmail.com,
	ysato@users.sourceforge.jp,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de,
	abelvesa@kernel.org,
	srini@kernel.org,
	s.nawrocki@samsung.com,
	nuno.sa@analog.com
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-sh@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 3/4] hwmon: axi-fan: don't use driver_override as IRQ name
Date: Tue,  3 Mar 2026 12:53:20 +0100
Message-ID: <20260303115720.48783-4-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303115720.48783-1-dakr@kernel.org>
References: <20260303115720.48783-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D4D541EEFC7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95126-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,gmail.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de,samsung.com,analog.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Do not use driver_override as IRQ name, as it is not guaranteed to point
to a valid string; use NULL instead (which makes the devm IRQ helpers
use dev_name()).

Fixes: 8412b410fa5e ("hwmon: Support ADI Fan Control IP")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/hwmon/axi-fan-control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/axi-fan-control.c b/drivers/hwmon/axi-fan-control.c
index b7bb325c3ad9..01590dfa55e6 100644
--- a/drivers/hwmon/axi-fan-control.c
+++ b/drivers/hwmon/axi-fan-control.c
@@ -507,7 +507,7 @@ static int axi_fan_control_probe(struct platform_device *pdev)
 	ret = devm_request_threaded_irq(&pdev->dev, ctl->irq, NULL,
 					axi_fan_control_irq_handler,
 					IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
-					pdev->driver_override, ctl);
+					NULL, ctl);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret,
 				     "failed to request an irq\n");
-- 
2.53.0


