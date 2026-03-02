Return-Path: <linux-arm-msm+bounces-94773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gH+MFNbZpGlhuAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 01:29:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FB11D21B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 01:29:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F7383026594
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 00:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 132EE1DA60D;
	Mon,  2 Mar 2026 00:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NzvW44r+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B9C183CC3;
	Mon,  2 Mar 2026 00:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772411283; cv=none; b=ZmOs13BJpExysLGX6mbZ1Wx//L0qhje3L0mUVq/5OrhgklpulTJbqLBneI8Tq20OkjgAyYWSYG2N5s3sSYZs2TZ7RN1cHpvRkX5mKkwcIBJTBnyyy8bNR+s2uutrQlQ6gU207nc3AYGgLIon0/cVtd/1Lt5dBhinjZHdpNWfeSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772411283; c=relaxed/simple;
	bh=mpHa2etVTegNvRHxQPUatcpwMpSIUumnV/toW8Oz2rQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NUcqPTNyh961J+szQFw7jAH63oIHynx5Hv1YFerRKE5Cg9naVF5CstPx4Mfsrwu6GE0fkLPr3It3uYpQ0VU/ItbOCyXY1QD0aepo71Iq79OxNTEQ9+WM7Xd2oRvEShdLl/1FGlRDPub1N7PMRCbIMRMBRJwsfruFGWhpV5j2R1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NzvW44r+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D51B4C2BC9E;
	Mon,  2 Mar 2026 00:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772411282;
	bh=mpHa2etVTegNvRHxQPUatcpwMpSIUumnV/toW8Oz2rQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NzvW44r+tVFEDwhwm8qNt48B77/fjOA1FiiN0NiiW23HKHSZgHmobL8ISZNmLbybk
	 Av8JV4lqJsFoawidt9D7yLlDywdn7zh6xblJvnPnONifm4CJG/GkaL5EGFSdOBoRE6
	 qM1NJpPiY5TMk5eDaXS1WfIS/6HeFvSOgpox09Rfos7qxJTaF1MGLtvS1+9nXg6NAB
	 WiOiwfzSMZG7DsfN5nUff9lxJ7INFLuzq9qJ9pWDjRXr0I+7YakqFwxiCLv5gSYHwE
	 wC7tk1/bQKCGLBcy5HYW/zMqLYUXqKxIzL79qCQgFG0woRs316+iW9OXs2daF0PmSN
	 AxAOtkhUWHbig==
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
Subject: [PATCH 2/3] hwmon: axi-fan: don't use driver_override as IRQ name
Date: Mon,  2 Mar 2026 01:25:57 +0100
Message-ID: <20260302002729.19438-3-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302002729.19438-1-dakr@kernel.org>
References: <20260302002729.19438-1-dakr@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94773-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E2FB11D21B3
X-Rspamd-Action: no action

Do not use driver_override as IRQ name, as it is not guaranteed to point
to a valid string; use dev_name() instead.

Fixes: 8412b410fa5e ("hwmon: Support ADI Fan Control IP")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/hwmon/axi-fan-control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/axi-fan-control.c b/drivers/hwmon/axi-fan-control.c
index b7bb325c3ad9..ec4bbb104449 100644
--- a/drivers/hwmon/axi-fan-control.c
+++ b/drivers/hwmon/axi-fan-control.c
@@ -507,7 +507,7 @@ static int axi_fan_control_probe(struct platform_device *pdev)
 	ret = devm_request_threaded_irq(&pdev->dev, ctl->irq, NULL,
 					axi_fan_control_irq_handler,
 					IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
-					pdev->driver_override, ctl);
+					dev_name(&pdev->dev), ctl);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret,
 				     "failed to request an irq\n");
-- 
2.53.0


