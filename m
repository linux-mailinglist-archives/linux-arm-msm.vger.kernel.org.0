Return-Path: <linux-arm-msm+bounces-114075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B+ltJOvlOWpRywcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 03:48:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5A26B3603
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 03:48:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=kT79ttHi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114075-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114075-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 181063031AC0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 01:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD873859EB;
	Tue, 23 Jun 2026 01:44:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54761378D82;
	Tue, 23 Jun 2026 01:44:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782179061; cv=none; b=JA3qs1ADDVkRb+Yp4dnba2UBfvNUrArmKv+265cv/5JCXZtWgsgwZBJd2WTj/2sde5StHxhv9X/67jMjUjNjUTTjqr6iisLhgWlTGpTyUP9QkyksjlL5xbTP4Kpqjp69cca3sr7UAzQiliDZkiarETXhKPnjZuu7pseQuwSb2YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782179061; c=relaxed/simple;
	bh=WqY7LEhsoR33ic8KDIs1qJmmlmw/mQOzPyENBlR+Sc4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o/zHB2Nd8PqourVxQe7R+gPy1Ii2PF1stk0LurGL3lj6uyaxYy9MusXWO8hAPpXJCS7smZjI0uPX7EKRPrwRzIkqLSqBBkyA7c1G1N9TynHeV6Ufs+ENEc83YdpgtXe+a1IRKxzOTuCc/yFsNFa45aBCXmLAUH0WQfQFjcuX4IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kT79ttHi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04C65C2BCC6;
	Tue, 23 Jun 2026 01:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782179061;
	bh=WqY7LEhsoR33ic8KDIs1qJmmlmw/mQOzPyENBlR+Sc4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=kT79ttHiwYztemidPvBGK7d1LoR5bdGPlcQjt8gvS4Hr9Qdy0On4RdYnDYjP96oyS
	 4Be0RLmVwemij1j/tRLzdPXakWqvqy+XKeqdqKniYqpbv5oOQLTuH8Wydsto7egN1q
	 c9k6J2t2B3or1i2V2NTBARCy3AR6x8+y8QI32z7nZnHm+/GO9wN+ME+j2G8lj83G1N
	 oCqAjeq+FyKwExnWsMUoLD8QiPHm0r3sXRSCqPR+fgJEYwMRV17LZo+GjGq0xay1gq
	 k4b+TjALBiM2wceNfYvs+4XIbJpzGzvgEiVHiVIeWFxloFAVkmEURU5RSCMDE3hS8Y
	 EYGDPZN5O2z6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF09CDB46B;
	Tue, 23 Jun 2026 01:44:20 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Subject: [PATCH 0/3] SM8450 IPA support
Date: Mon, 22 Jun 2026 21:44:16 -0400
Message-Id: <20260622-sm8450-ipa-v1-0-532f0299f96e@proton.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDWpRktcRSyKKSPxkw4ikd5ds
 fwW793A6AkZquQGjycxrUtElibQjXYZUFAfDUoqI41Sgucy11LQZoXubZk5U2BrNMRg8+jo+mZ
 185uPdsJufw8QwgNmge/VbgAAAA==
X-Change-ID: 20260622-sm8450-ipa-5da81f67eb65
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782179059; l=1359;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=WqY7LEhsoR33ic8KDIs1qJmmlmw/mQOzPyENBlR+Sc4=;
 b=eLqzm+hzX0hr4/X3p2jgMNy1H3N9C/SRQMjI+Qr9zldSQarf9TCUBMJcw/XQD6XdDHHv/vSUp
 s+RNH1ZyqCfBWCFWxZ1CMISh+u5unjDwZTrzddJ5GLOGDw9E64csddt
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114075-lists,linux-arm-msm=lfdr.de,esteuwu.proton.me];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:elder@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:esteuwu@proton.me,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[esteuwu@proton.me];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,proton.me:replyto,proton.me:email,proton.me:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E5A26B3603

This series adds support for the IPA subsystem found in the SM8450 SoC.
While IPA v5.0 is very similar to IPA v5.1 (heck, it even managed to
properly get the modem up and running), it wasn't perfect, since the
modem would sometimes hang when rebooting or powering the AP off.
After a thorough investigation, I managed to create the proper data file
required for IPA v5.1.

Regards,
Esteban

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
Esteban Urrutia (3):
      arm64: dts: qcom: sm8450: Add IPA support
      dt-bindings: net: qcom,ipa: Add SM8450 compatible string
      net: ipa: Add IPA v5.1 data

 .../devicetree/bindings/net/qcom,ipa.yaml          |   1 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  55 ++-
 drivers/net/ipa/Makefile                           |   2 +-
 drivers/net/ipa/data/ipa_data-v5.1.c               | 477 +++++++++++++++++++++
 drivers/net/ipa/gsi_reg.c                          |   1 +
 drivers/net/ipa/ipa_data.h                         |   1 +
 drivers/net/ipa/ipa_main.c                         |   4 +
 drivers/net/ipa/ipa_reg.c                          |   1 +
 8 files changed, 536 insertions(+), 6 deletions(-)
---
base-commit: 948efecf22e49aa4bf55bb73ec79a0ddcfd38571
change-id: 20260622-sm8450-ipa-5da81f67eb65

Best regards,
--  
Esteban Urrutia <esteuwu@proton.me>



