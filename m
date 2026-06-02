Return-Path: <linux-arm-msm+bounces-110719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBzhIQJ+HmrnjgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 08:53:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AAA629364
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 08:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E04D3051A91
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 06:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F843A8758;
	Tue,  2 Jun 2026 06:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vFLwoTrG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95BB39989D;
	Tue,  2 Jun 2026 06:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780383047; cv=none; b=CoY2PqUXLwYq5YwKgxGcNJiIIspSbwC4WWAdedZeRrHpDWn7nEOHxBFl1LfdzI7wGht+76Ha6xr7M2SMXDYLUebntoJQloRlp7WJtniAc7Iegi4BWy7xaQJsoFsi+VQD/iJ5TSoDvRut3RStpAlGuvKj3xNCMH+oxt3Gdv7q6Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780383047; c=relaxed/simple;
	bh=x4Q1M/+Pp3nWliQF7KEhNioFN1//0DQ/+C/kk4UWXBk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PbC2HPGjT6eAhnNWnn6YCV1cdf+CQiGD/1Cx9CPYP0CTf7wGIG7ro+9n8fds+pEsn6WaRxC8GBa5O8z+TCPRNI1k4r5DbZdBwkF6SXW4kuNI3CNrwUpvqaTbcmqMj8v8I+mqqapknw5nSjQgoSbC+R3bs4A50cnLwJuucU/jnZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vFLwoTrG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 424B0C2BCB4;
	Tue,  2 Jun 2026 06:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780383047;
	bh=x4Q1M/+Pp3nWliQF7KEhNioFN1//0DQ/+C/kk4UWXBk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=vFLwoTrGBzftr97irN3Z8jIMDsL+jZAD9H/GpfOx64uZZYi2Oq70KDs7XMOX+LwwH
	 1cGCENpIFDIBR/77bWtmzVOO0MLizEpfvOmL5OhbQjE6lycBbz8uqTb5qMbRqoK6e1
	 HG0tgyU7auGBku8jCf2V16l2A9dXEZpczUeAjAAY7MvFxZeP0wkhme5N27qEXCZmlJ
	 NZHhBAhH0XgpvavWL2vfZSsnJLY8R0HcyterLEzf3N2aiyDwnbNT7QUA7brElqtSSe
	 Q1iW93NLk8VcQkm16f7iGkGb573GfgkE3WZV5Sv0I1SeVUJ1FMueqpTZ348liE6NWg
	 Jd4pgCdgYc6+Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29375CD6E57;
	Tue,  2 Jun 2026 06:50:47 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Subject: [PATCH v2 0/4] IPQ5018: Add and enable GEPHY RX and TX clocks
Date: Tue, 02 Jun 2026 10:50:36 +0400
Message-Id: <20260602-ipq5018-gephy-clocks-v2-0-65a1f1d881f3@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jmbc10RGhceQ/DgpQBJiDFFomE9
 O5WLuDyveS/v0NgLxzglu3geZUgbkpApwxsX08dK2kSAyEVWKBWMr+uqI3qeO43ZUdnh6DY1JT
 nqEtTI6Tp7LmVz5F9VIl7CYvz2/Gy6p/9E1y1QkVNa8iUpSZ7ubv3Mjo3nK17QhVj/AImZwjsu
 gAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780383045; l=2993;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=x4Q1M/+Pp3nWliQF7KEhNioFN1//0DQ/+C/kk4UWXBk=;
 b=s/OEDgvD5FIaEa87uEyc6ZAk0HlvNSssU59X2TEEz6f+21GnS9BRchA6qAr1Q6VotXlO8rFhP
 XsLaeT3GwQNDupoeIHHEKc+lefPRq74/n59abcV0Z5TtytUulk1GN0T
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110719-lists,linux-arm-msm=lfdr.de,george.moussalem.outlook.com];
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
	NEURAL_HAM(-0.00)[-0.908];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,outlook.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,outlook.com:replyto,outlook.com:mid,outlook.com:email]
X-Rspamd-Queue-Id: 29AAA629364
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
      dt-bindings: net: ethernet-phy: move clocks property to invidivual PHY bindings
      dt-bindings: net: qca,ar803x: Add clocks property for IPQ5018 PHY
      arm64: qcom: ipq5018: Add GEPHY RX and TX clocks
      net: phy: at803x: add RX and TX clock management for IPQ5018 PHY

 .../devicetree/bindings/net/ethernet-phy.yaml      |  6 ------
 .../devicetree/bindings/net/qca,ar803x.yaml        | 14 +++++++++++++
 .../devicetree/bindings/net/realtek,rtl82xx.yaml   |  6 ++++++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |  3 +++
 drivers/net/phy/qcom/at803x.c                      | 23 ++++++++++++++++++++++
 5 files changed, 46 insertions(+), 6 deletions(-)
---
base-commit: 7da7f07112610a520567421dd2ffcb51beaefbcc
change-id: 20260601-ipq5018-gephy-clocks-e8a2440178a0

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>



