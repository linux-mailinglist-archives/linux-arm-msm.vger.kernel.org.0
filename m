Return-Path: <linux-arm-msm+bounces-110603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Ps5F9eGHWrAbQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 15:19:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC54D61FE5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 15:19:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4A9F63012227
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 13:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7582D3A5456;
	Mon,  1 Jun 2026 13:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rNVnAzal"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D16A36BCDE;
	Mon,  1 Jun 2026 13:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780319953; cv=none; b=YreBlpW9lzi3V6p7HEAZKEnRF3OoKxOpXWM92/B1eDTcmp9c5BAo/tcgw1aFfDgHmSyXhBTapD0opDoXy78R8HXGcAOw2/W73j9nz/qU0tF8JXP632StwxE39T+MzY9f4xPHllgkkeujIiTdNKvSxkKe8D/M2DsZrgD9sR+pNqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780319953; c=relaxed/simple;
	bh=97pdXoZiUaNbUg/dCgG8k67el3mw2yrvAWwxG2/xB7E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W3oRGk2Y20pDLG9R0V6Iv14dYcFozKFXQ+/IC5gxXlAxFDZ35FRQh/AEmbMsjhusO7bwJqVir2Fj9K38sLSJPghepfdZ5A/FQ29potizMCm1Zff08H00PloETB0MK2yTaPKoqFiCb1XDUJooAgPCUT/WUTxuZXD/44eeKSeS/Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rNVnAzal; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBD2AC2BCB8;
	Mon,  1 Jun 2026 13:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780319953;
	bh=97pdXoZiUaNbUg/dCgG8k67el3mw2yrvAWwxG2/xB7E=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=rNVnAzallyb+NlbQL9+9CQ/jp+KfGxZUiIJa10QmYquSsARgjBOSBXER2nlAPs5Cv
	 fiQb90KMcorm4qXLRCoX7NmgiIA3k9fbGqX5lINH1waSFegBV9CjhpAQiJ0eUcvjhv
	 4GNViKxdbuzedwq3bNkhhsUWgFzuVwZhNfHnHVdsjaHuHa/rWVNVj9UwVq01plWJXZ
	 89T/7JH4av+wWxkX9kx16iNJ4W6mjkciZT12uFa/JgZ6TMuadVZfLJ39UHPcZJqaNM
	 zor1WdXCcbeB9XH0BzWwgyVUJ7bnzl55Sw+jRrWQWLvqLetY99T906Ry2QVQJ+UEAl
	 /Ibe3L1qq81Gg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A59CD6E55;
	Mon,  1 Jun 2026 13:19:12 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Subject: [PATCH 0/3] IPQ5018: Add and enable GEPHY RX and TX clocks
Date: Mon, 01 Jun 2026 17:19:07 +0400
Message-Id: <20260601-ipq5018-gephy-clocks-v1-0-2df8287712c3@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBsYxUq6SrQQm2ooyhSiiO6et
 HyL/x9IHIUTtMUDkU9Jsm8ZqizAz26bGGXIBk26ppoUSjgqUhYnDvONft39kpCt08aQaqwjyGm
 IPMr1b7v+fT8UZsxAZgAAAA==
X-Change-ID: 20260601-ipq5018-gephy-clocks-e8a2440178a0
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780319950; l=2139;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=97pdXoZiUaNbUg/dCgG8k67el3mw2yrvAWwxG2/xB7E=;
 b=NlWHkSLpvAxs/YmwWdPWhmxX66Jul+YmsKCW5EBMAYOgKHG7r/f6ZLNRlKX8EBD4I2V2bcMSf
 TyI9Kk35NwFDwxTdmAO3aF8TzLdJz7Jva0N9C9gWzyE6dXUhdTe9Zfj
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110603-lists,linux-arm-msm=lfdr.de,george.moussalem.outlook.com];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[outlook.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[george.moussalem@outlook.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,outlook.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:replyto,outlook.com:mid,outlook.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DC54D61FE5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Greetings,

This patch series addresses a missing hardware description issue for the
Qualcomm IPQ5018 Internal Ethernet PHY, where the data paths fail to
function correctly unless their dedicated RX and TX clocks are
explicitly enabled.

Further testing revealed that leaving these clocks unmanaged by the
kernel, they were inadvertently left enabled by the bootloader / QSDK
platform, which masked the issue. Testing a fresh network configuration
path exposed that the data link fails to work without explicit software
gating.

To correctly introduce the required multi-clock properties, the IPQ5018
binding definition must first be split away from the shared
qca,ar803x.yaml schema. This isolation is required because ar803x
references the generic ethernet-phy.yaml, which enforces a strict
single-clock limit constraint. 

- Patch 1: Splits the IPQ5018 definitions to its own bindings schema 
           to accommodate the multi-clock requirement.
- Patch 2: Appends the missing RX/TX clock definitions into the IPQ5018
           device tree before driver modification to avoid the driver
	   failing to probe.
- Patch 3: Updates the Qualcomm AT803x PHY driver framework to safely
	   acquire, enable, and gate these clocks upon link state
	   changes for runtime power optimization.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
George Moussalem (3):
      dt-bindings: net: qca,ipq5018: Split IPQ5018 PHY bindings from ar803x
      arm64: qcom: ipq5018: Add GEPHY RX and TX clocks
      net: phy: qca,at803x: add RX and TX clock management for IPQ5018 PHY

 .../devicetree/bindings/net/qca,ar803x.yaml        | 43 -------------
 .../devicetree/bindings/net/qca,ipq5018.yaml       | 75 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |  3 +
 drivers/net/phy/qcom/at803x.c                      | 23 +++++++
 4 files changed, 101 insertions(+), 43 deletions(-)
---
base-commit: 7da7f07112610a520567421dd2ffcb51beaefbcc
change-id: 20260601-ipq5018-gephy-clocks-e8a2440178a0

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>



