Return-Path: <linux-arm-msm+bounces-119164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rS2HMOkxV2rZHAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:08:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 683E575B4C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:08:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=D5RuqhSL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119164-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119164-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AFF2302EE9A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 07:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F885333442;
	Wed, 15 Jul 2026 07:07:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FD531F9B7;
	Wed, 15 Jul 2026 07:07:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784099253; cv=none; b=gap5i+jVGR3oorz1vtKxVo37M8V1YPaKB0VjOJsVN/R4RHmh+LIkzcke61QdrE1gGwaReiiE2QFoAcKgbP03wtu2U1TmmqyXn0rYjnYjqp7OBg5Hg8x27Yj5uuW7m1I0ZJNlhlpD2IrAbfk2P4xUWeCEqnvugDCa6qDLRfQ7O0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784099253; c=relaxed/simple;
	bh=t27yyUkbtJ63OblVXNLeuoM4AskzDQ+ORg37wek6PuI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=h4IljW+r6GzqvzFU2kztw8a+nUNzttGTQ4AjBPhUfgl7JkYwgPrCUyMG3bgXhCq1Y/auvtKyUj5ClZgr8DilqQBQnB0Y8to1ltGMDuXiUkiB7YdwbkdgqIRwlAcn3NX7tZWQz8sqZOqFKZTvMC2aBf95KGEwAGY0v5JoYI/+gEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D5RuqhSL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0744EC2BCB9;
	Wed, 15 Jul 2026 07:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784099252;
	bh=t27yyUkbtJ63OblVXNLeuoM4AskzDQ+ORg37wek6PuI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=D5RuqhSLkZoVwuCln1qvC4lIQwE3yE2a5jKf2NWTItHuBD68nACDmRXND/rnNiGjG
	 0tqcOIAXFCx6nwEoS/uHciOKvRBjkHqzJGhhe/DZbYO9WOQl8kSe3Rks4bYofely+o
	 lWh3IpY7pf6fyc5GwtbPHn88Boxn2dP7BhhqpEhm1Gz3HSayc01FcZ/qJuPameScOS
	 0wCSrcxMRzzB9R/erbjVK3nbPsaX87Bbnrxq8hgyu8exDWyOuUePjZIl2/15LYYgaL
	 sTgNu5O8+6EVccnL6VSOmQopoSh7nEWv0yZAiJcT4aHpkBcm3zx89aWSERWBRE4aeR
	 PM7xoH2akDHAg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F44C4450B;
	Wed, 15 Jul 2026 07:07:31 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Subject: [PATCH v2 0/3] Initial QMP USB PHY support for SM8475
Date: Wed, 15 Jul 2026 03:06:53 -0400
Message-Id: <20260715-sm8475-bup-usbss-v2-0-2d8def39b190@proton.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OwQ6CMBBEf4Xs2TW0VIqe/A/DweIiNZFityUaw
 r9bwKPHl8y8mQmYvCWGUzaBp9GydX0Cucug6a79ndDeEoPMZZlroZCfldIHNHHAyIYZqawKdVS
 6aEuCVBs8tfa9Ki/1xhzNg5qweJZEZzk4/1k3R7Hk/upHgTkaWWlhSBpFzXnwLrh+/ySo583s6
 RXT5/Cbm+cvKsStF9EAAAA=
X-Change-ID: 20260714-sm8475-bup-usbss-e68349473f6e
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784099250; l=1426;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=t27yyUkbtJ63OblVXNLeuoM4AskzDQ+ORg37wek6PuI=;
 b=uPsi2rUF9M6thEvBqtonyXw0DDhZ28DRs8306mJSSJr6aU7F+JMjb6FUMycE6xaK/Hh8it/ja
 66CgB/sqH9QD/64RCz05pjGvrNtrUnMJcF89KalVmF0uJ3Aun3u4LJ5
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119164-lists,linux-arm-msm=lfdr.de,esteuwu.proton.me];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:esteuwu@proton.me,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[esteuwu@proton.me];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,proton.me:mid,proton.me:email,proton.me:replyto,msgid.link:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 683E575B4C0

Based on the following patch:
[1] https://lore.kernel.org/all/20260711-sm8450-qol-qmp-v2-2-d14353bd6ff4@proton.me/

This series adds support for the QMP USB PHY found in the SM8475 SoC.
The initialization sequence varies noticeably when compared to the one used
in the SM8450 SoC, hence the need to add support for this PHY.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
Changes in v2:
- Split series in subseries (pcie, usbss)
  - Sorry, it should have been like this from the start!
- Add notice about base commit
  - Reason why calibrate_dp_phy is not present
- Modify referenced swing and pre-emphasis tables
- Move v1 PLL tables to SM8475 support patch
  - Warnings are generated at build time otherwise
- Link to v1: https://patch.msgid.link/20260714-sm8475-bup-v1-0-b2871be2b4ec@proton.me

---
Esteban Urrutia (3):
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add SM8475 QMP PHY
      phy: qcom: qmp-combo: Specify PLL version in qmp_v6_dp_serdes_tbl structs
      phy: qcom: qmp-combo: Add SM8475 support

 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 259 +++++++++++++++++----
 2 files changed, 215 insertions(+), 45 deletions(-)
---
base-commit: 43d250aa1ba24a4124162b7310a7010ff6a141be
change-id: 20260714-sm8475-bup-usbss-e68349473f6e

Best regards,
--  
Esteban Urrutia <esteuwu@proton.me>



