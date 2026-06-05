Return-Path: <linux-arm-msm+bounces-111413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fFdbHJHFImoAdgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 14:48:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8265B6484DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 14:48:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=ak9vdtJ+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111413-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111413-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CE8483004D18
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 12:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9147F3BFAE1;
	Fri,  5 Jun 2026 12:41:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C06537D131;
	Fri,  5 Jun 2026 12:41:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780663299; cv=none; b=qqbaB/FAwjs2tJd2rzutdmhA8j1GZzZPID+Gfi0hxYbCwoyAj7efQo4W8tCY77h3HnZYRIfVqVe3eLXJyoIN8u7ePJgbxnSB5fji4Nz0ZkWMRBloBHBWAc1EUm1GALf0/tcM6FTzX9MnuqRlG7JlCrZwwqmzxCEk68xDn5F2b9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780663299; c=relaxed/simple;
	bh=vWoBVXItD2urAe47ImUviMmyYrwl8cRkGI9EK0YXHMU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DPDIXa45NI3Gx0R0kO1on/A0hzEb8yALA0uZ5uT32aoJ0bOnK9CSxB9vsX92lBG/BrQIG66WzH7Bq8mgftyl29bTEDIZQ9kA/M6dbGrr/+w1ikbFeGPQHHF6pzWtD6eJv1hW0MyaNZXjYkwB9q4vWKL5TzIktYQkvK0iT06SvWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ak9vdtJ+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A861C2BCB4;
	Fri,  5 Jun 2026 12:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780663299;
	bh=vWoBVXItD2urAe47ImUviMmyYrwl8cRkGI9EK0YXHMU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ak9vdtJ+YDBY4StqJyYE5aXcRcMpTz3uSyXEKXgbgXIVmC6F/MTIg69tgFxxbuf1i
	 Qs/OY2LjjqJwtFnUFj05Cuff7CAGDm7hSm6+XbB/XWGO0vZ577cQr65EpbU8kkJZOu
	 aFq5eDcp2N7ZyuTcHU9SG1kgVup01sBpTTC9THTJoeLNmaphfkHcwjnvR3t+1uIYPI
	 WWXb6eulNgkU1iHXdYszLBHblUx4QRQTsW/EOlnt3lUwR+uQUojHaiqEj9pZ8z26FS
	 TxZU0KP7whDfYQWkt+A4Cqal+kyvz1q4BSDTAtew1mnf86U+KXKgCX1l2E1A4C7HUn
	 WZlBNNibduUQQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0454CD6E74;
	Fri,  5 Jun 2026 12:41:38 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Subject: [PATCH v3 0/4] IPQ5018: Add and enable GEPHY RX and TX clocks
Date: Fri, 05 Jun 2026 16:41:25 +0400
Message-Id: <20260605-ipq5018-gephy-clocks-v3-0-f232d9ca0966@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNTQrCMBCG4auUrI1kpn+DK+8hLkKatKHV1KQGS
 +ndTbsSQVy+H8wzCwvaWx3YKVuY19EG6+4p8kPGVCfvrea2Sc1QYCUqAdyOj1IA8VaP3czV4FQ
 fuCaJRSGgJilYOh29Nva1s5dr6s6Gyfl5/xJhW/+AEbjg2BhCqmtAlZ/dcxqc64/K3dhGRvxk8
 AeDialKCQYaIjBfzLqub7iRLNcBAQAA
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
 George Moussalem <george.moussalem@outlook.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780663297; l=3562;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=vWoBVXItD2urAe47ImUviMmyYrwl8cRkGI9EK0YXHMU=;
 b=+DJfZpCccG8Uq/Zp3CvuEj60cWvw3CiDrhxFmmI0lC+JkpERrWg5GCD6uP5MnxXqKQMyTqAw1
 FBX737mUwTiBu1Ga7HWn7GQL7pFeYxlrYNLFe8Xw9v+AqBmxC6drmcZ
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com
X-Rspamd-Action: no action
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
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:f.fainelli@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:george.moussalem@outlook.com,m:conor.dooley@microchip.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:ffainelli@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111413-lists,linux-arm-msm=lfdr.de,george.moussalem.outlook.com];
	FREEMAIL_REPLYTO(0.00)[outlook.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:mid,outlook.com:email,outlook.com:replyto,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,outlook.com,microchip.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[george.moussalem@outlook.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8265B6484DD

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

- Patch 1: Moves the clocks property and its restriction out of the
	   generic ethernet-phy.yaml schema to individual bindings files
	   that need it to allow for PHYs that require multiple clocks.
- Patch 2: Add clocks property to qca,ar803x.yaml for the IPQ5018 PHY.
- Patch 3: Appends the missing RX/TX clock definitions into the IPQ5018
           device tree before driver modification to avoid the driver
	   failing to probe.
- Patch 4: Updates the Qualcomm AT803x PHY driver framework to acquire,
	   enable, and gate these clocks upon link state changes for
	   runtime power optimization.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
Changes in v3:
- Revert the change to move the clocks property out of the generic
  ethernet-phy.yaml schema and simple increase the maxItems limit to 2.
- Listed clocks, clock-names, and resets as required properties in the
  schema.
- Acquire the RX and TX clock during probe without enabling them. Then
  enable/disable the clocks in the link state change callback to ensure
  they are only active when needed with checks to avoid redundant
  enable/disable calls.
- Re-ran make dt_binding_check on all schemas in net folder without new
  issues.
- Link to v2: https://lore.kernel.org/r/20260602-ipq5018-gephy-clocks-v2-0-65a1f1d881f3@outlook.com

Changes in v2:
- Added patch 1 to move the clocks property and its restriction out of
  the generic ethernet-phy.yaml schema to individual bindings files that
  need it to allow for PHYs that require multiple clocks.
- Reverted splitting out IPQ5018 from the shared qca,ar803x.yaml schema
  and simply added the clocks and clock-names properties to the
  definition of the IPQ5018 PHY.
- Corrected / updated commit title of patch 4 (qca,at803x -> at803x)
- Link to v1: https://lore.kernel.org/r/20260601-ipq5018-gephy-clocks-v1-0-2df8287712c3@outlook.com

---
George Moussalem (4):
      dt-bindings: net: ethernet-phy: increase max clock count to two
      dt-bindings: net: qca,ar803x: Add clocks for IPQ5018 PHY
      arm64: qcom: ipq5018: Add GEPHY RX and TX clocks
      net: phy: at803x: add RX and TX clock management for IPQ5018 PHY

 .../devicetree/bindings/net/ethernet-phy.yaml      |  9 +++--
 .../devicetree/bindings/net/qca,ar803x.yaml        | 19 ++++++++++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |  3 ++
 drivers/net/phy/qcom/at803x.c                      | 43 ++++++++++++++++++++++
 4 files changed, 71 insertions(+), 3 deletions(-)
---
base-commit: 7da7f07112610a520567421dd2ffcb51beaefbcc
change-id: 20260601-ipq5018-gephy-clocks-e8a2440178a0

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>



