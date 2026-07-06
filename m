Return-Path: <linux-arm-msm+bounces-116985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id crqjB5D8S2qXeAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:05:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 925DD714CB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:05:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=BoYcUPvo;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116985-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116985-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D92C349BA16
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 17:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA1F3BB103;
	Mon,  6 Jul 2026 17:27:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617D23B1EFE;
	Mon,  6 Jul 2026 17:27:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783358846; cv=none; b=TBqghH8199Yx1KlMxCFdOPJehIHp92hYpePa6fFFQnaWekNbDsji4Ei3/Bvd+xvnCf46kFokGEgdbWzTgN71fbpqi+rtbADfEmfWoHVKluvZw4jxG9Tgwver///NoYepX3uGqCnVswgohgzQXyEZWpkKbi/lXxjiocvWC9wud5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783358846; c=relaxed/simple;
	bh=DIcPgbrEJz5BYjvlk6j1aB/9gcZjOaZgBL/8SSMWLps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W1TiAYfqZ5tl0YriT22uaA8qyEyW89Nl8gBNzN+IYyavB5B5KrW8dzr3cVVwHpHqFId6B8NxZaqy0+38b/CW/jZeDP7UVKB8Zh6waHf7m1XG9O3NEVlX90IbfrZ83uufeMrX2DQzfu6FZxDmS9bH6QEU11h+oLb6ud3PlQu0xDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BoYcUPvo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25DECC2BCF7;
	Mon,  6 Jul 2026 17:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783358846;
	bh=DIcPgbrEJz5BYjvlk6j1aB/9gcZjOaZgBL/8SSMWLps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BoYcUPvouDb94AZrLsWlzO6YVFEgVbXy+TJKbF5feBBfQT1GllNxGMFRdKpt0eFHn
	 yl+Fd4VzZjZi9J/SqpLxMW0Vqdo8MruMqawWS33gAsjkfo6bNxlJlEdRCoR8EVO1EM
	 yndtphC2l/v2VPK77ptVjxcjpkAkGBTLYbBzWFVkPResKBkiXHKFFjc6o7LbuL2cOR
	 F4kOOXMQo6W9/IMMtwIXeZcMBvy7miJWwl5/wlZSDi4KXwlWv7OxIe+BjfyB2lrHhQ
	 iWETFoiQ2WXaBM/4KBFParDBzwUbj/QHfrnMjRk2Ly0KGP3aAZBLqehDA+WWdnw8h1
	 VhNmubq/mG0Aw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E3C9C44500;
	Mon,  6 Jul 2026 17:27:26 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 06 Jul 2026 21:26:22 +0400
Subject: [PATCH v4 6/6] MAINTAINERS: Add entry for Qualcomm IPQ5018
 Bluetooth driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-ipq5018-bluetooth-v4-6-350262a30959@outlook.com>
References: <20260706-ipq5018-bluetooth-v4-0-350262a30959@outlook.com>
In-Reply-To: <20260706-ipq5018-bluetooth-v4-0-350262a30959@outlook.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783358843; l=976;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=fusdp9JpTX7vO3BYR/LY+GGHauTOjlTp30gMmTqFQZk=;
 b=5v0IEiybgFFGnLpsFG0Ksr4J6prLoXu88B1GDtJUIjZ68VyjzMFi0lfeXr/kqcXuXMAxwyNvm
 7wQ9V0Cps0kArmKByuYBuxchb5zNs9/1t81GzLSgakyxBk15bWLs2a7
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116985-lists,linux-arm-msm=lfdr.de,george.moussalem.outlook.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:george.moussalem@outlook.com,m:bartosz.golaszewski@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_REPLYTO(0.00)[outlook.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,pengutronix.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,outlook.com:replyto,outlook.com:mid,outlook.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[george.moussalem@outlook.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,outlook.com,oss.qualcomm.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 925DD714CB4

From: George Moussalem <george.moussalem@outlook.com>

Add maintainers entry for Qualcomm IPQ5018 Bluetooth driver.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0b9d7c8276ac..60f7251d1a16 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22289,6 +22289,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
 F:	drivers/regulator/vqmmc-ipq4019-regulator.c
 
+QUALCOMM IPQ5018 BLUETOOTH DRIVER
+M:	George Moussalem <george.moussalem@outlook.com>
+L:	linux-bluetooth@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/bluetooth/qcom,ipq5018-bt.yaml
+F:	drivers/bluetooth/btqcomipc.c
+
 QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
 M:	Vikash Garodia <vikash.garodia@oss.qualcomm.com>
 M:	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

-- 
2.53.0



