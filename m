Return-Path: <linux-arm-msm+bounces-111664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gK5RKY5OJmqFUgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 07:09:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC81652B59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 07:09:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="K1/SG5D/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111664-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111664-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 92C423003495
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 05:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5339356740;
	Mon,  8 Jun 2026 05:09:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCC14071ED;
	Mon,  8 Jun 2026 05:09:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780895366; cv=none; b=r1bwBcB0cG/9f0qkkImwjfGSKrkhB8m+Maid21tuKfqXEg/ZEcfEv6nUtLKHkJsMW2bA2nY4KZ3/53RgOvpxFj2Bn+luds68R94LI28QGjiHD36OpsVYI8jYaxg/F1tjBbQXcfxDK4qsFumvxLycQUz3a8gHnN1TjCT3R/566TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780895366; c=relaxed/simple;
	bh=mUbPbxGPsJq6zrKufoKUIDyht+0XfDJdNp0bjmYdApw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mHbbssb2+0e5ENVjarCsZtx6eiBR5BA3ofE24M06e6VyNrlx14JDcagdJGWp71B7f3kEHST31H6iG293jxuR+3jCVDJMExfCVdo1Oh8bN7xww7+LWfYNJdJx+WQm9kNikhODotErbzSkDlVwNQNYA987zBLllwfnmlydlyBvWD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K1/SG5D/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 244A6C2BCB0;
	Mon,  8 Jun 2026 05:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780895366;
	bh=mUbPbxGPsJq6zrKufoKUIDyht+0XfDJdNp0bjmYdApw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=K1/SG5D/mw++6Hs4NCTZEaluXP2Dxho1FWzDvqsWNpUGcdKFtt1UTE91dc/NK2iQ1
	 UctrfZsVNaBhfe4FgdvelewXUrUTt84Fx/kwtyOg7JZfXCjT7RjhVkBi4K59NoVBIz
	 vzxDooYAqk4OGGraI4yw8WZpQ9WEzpl1le8SUxSMftRYA5M1+8KI9DREqpRL12GcKx
	 rkaztB/3pSxG7muk2SDtwZ/BIJrWghC4WsD5TxMlBC4h2Rdc48ZkZk7DWKhOJzs0s3
	 Ac60TYAsLZmWfQFqAtnjHV2QMgv5JRsahmh03KNVkPATHDnbRAF5hD2Nd7avuGkXYS
	 tsQNtDVxFFmGQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B73CD8C8E;
	Mon,  8 Jun 2026 05:09:26 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Subject: [PATCH v4 0/4] IPQ5018: Add and enable GEPHY RX and TX clocks
Date: Mon, 08 Jun 2026 09:09:15 +0400
Message-Id: <20260608-ipq5018-gephy-clocks-v4-0-fb2ccd56894b@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNQQ6CMBCF4auQrq3pDFCKK+9hXDSlhQakSJFIC
 He3sMJE4vJ/yXwzE697qz25RDPp9Wi9dW2I5BQRVcm21NQWoQky5IwzoLZ7pgwELXVXTVQ1TtW
 eaiExSRhkQjISTrteG/ve2Ns9dGX94Ppp+zLCuv4BR6CMYmEEiiwDVPHVvYbGufqs3IOs5Ih7B
 g8YDAxPJRgohADzg4n3THrAxIExGGORK8lyzr+ZZVk+y8m7/UgBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780895363; l=3901;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=mUbPbxGPsJq6zrKufoKUIDyht+0XfDJdNp0bjmYdApw=;
 b=j7PTfT+AVzYO+QNVp70e0WTB6PJKkIvNwd26NqzHAbGAZa614pThDXkeei12jc9rIqCUIC7F2
 Uy9jcDNr118Di5TGlTudxPyi32XDeR93hQTJflcHcyV8RKbyxdIVuPr
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:f.fainelli@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:george.moussalem@outlook.com,m:conor.dooley@microchip.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:ffainelli@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111664-lists,linux-arm-msm=lfdr.de,george.moussalem.outlook.com];
	FREEMAIL_REPLYTO(0.00)[outlook.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,outlook.com:mid,outlook.com:email,outlook.com:replyto,vger.kernel.org:from_smtp];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBC81652B59

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
Changes in v4:
- Removed code to enable/disable clocks upon link state changes.
- Enable the RX/TX clocks during probe and removed them from priv struct
  as we don't need to manage them after enabling during probe.
- Link to v3: https://lore.kernel.org/r/20260605-ipq5018-gephy-clocks-v3-0-f232d9ca0966@outlook.com

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

 .../devicetree/bindings/net/ethernet-phy.yaml         |  9 ++++++---
 Documentation/devicetree/bindings/net/qca,ar803x.yaml | 19 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi                 |  3 +++
 drivers/net/phy/qcom/at803x.c                         | 12 ++++++++++++
 4 files changed, 40 insertions(+), 3 deletions(-)
---
base-commit: 7da7f07112610a520567421dd2ffcb51beaefbcc
change-id: 20260601-ipq5018-gephy-clocks-e8a2440178a0

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>



