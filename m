Return-Path: <linux-arm-msm+bounces-102364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EPfE5rT1mksJAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 00:15:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CF43C44FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 00:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F296C301CF9C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245D93603FB;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XOZut4nQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38D132692B;
	Wed,  8 Apr 2026 22:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775686551; cv=none; b=FngIohSvKY5NzSczjJJuTHM2jGN7xkZwDZwdDBkrCHKXK9BBNQpD82AFHIsYrE+Zb6J0byHV9vFAMSReRJCnVg2Wv0bkybY45PTFKpHmlGE5rDS0VFkSAzJx3zkuf2aD60CuwKxMauLzMANs5qDRIRUX5z0LKXv5VCUvn6Vk4eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775686551; c=relaxed/simple;
	bh=KEpr4zJFKU/KOf0lTdcERja2Oc3rB1xw26v3jW80j10=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UySDxvxkK33KOagdu3mwurDm1BhbGkC5Sb5QNaa8xttctH+56k78JivNImfIQWv6ZBWErtmsjrg5UsHGaQnT9cZKM7J4ako9KTXAXf9+3rvPlhj/FBwbO48UnDMnXC3UmqRRhkqjurpgRNRQyxehk/y9pO0Kf0ROxos+0UljNng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XOZut4nQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9064DC19421;
	Wed,  8 Apr 2026 22:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775686550;
	bh=KEpr4zJFKU/KOf0lTdcERja2Oc3rB1xw26v3jW80j10=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=XOZut4nQBQJ2CIRnCGrF1f+AW8dfr1zSluVBXW2d7pVbH401hUsz3rsirs2g4mX5F
	 KgCOg5H6xPiaTH4hKVuJLS/2USqCzUitTI6Ikow4DQjUCXSr3zc9xibS9S9w4jbkSG
	 KYhAwU4uIcHtwMs9oNY8sT83/RvDoMKUjIhsVlXTFOptX1pKF4P2h/xDOy2ohUi1xL
	 eLKRsMoz8RGrFPlGjFdk0rxUD8OlLIRP9We1IjrVT9hxL1JuCLVJMSsHjhNPJ1Octv
	 D+Uqh094QDn9NLkQzNIl13rgjqvxi1yuBk+ntGgQ/rPNnaYmOWM75tJV1qbu7nl7qh
	 0PQcPMrXh4VxQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C9010FC453;
	Wed,  8 Apr 2026 22:15:50 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v4 00/11] Input: support for STM FTS5
Date: Thu, 09 Apr 2026 00:15:43 +0200
Message-Id: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI/T1mkC/1XMTQ7CIBCG4asY1mJggNK68h7GRfmzLGwNEFJte
 ndpTWxdfpN53glFG7yN6HyYULDZRz/0ZfDjAemu7e8We1M2AgIVAcpxTA+XosCKS0apU0YyQOX
 7Gazz41q63srufExDeK3hTJfrt8EI/TUyxQQDaC5q1bS6qi9+9Omk32gpZNgpKjYFRUmidM2sb
 URD/xXbFCdsU6woYVpZ1doZIDs1z/MHAYjuawgBAAA=
X-Change-ID: 20260214-stmfts5-b47311fbd732
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2723; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=KEpr4zJFKU/KOf0lTdcERja2Oc3rB1xw26v3jW80j10=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp1tORj8Tz8uq8GTC1dEqjNeUZc9jKY8+OcF1HE
 gWaiIeQF1OJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadbTkQAKCRBgAj/E00kg
 csZwEACUcK4e6blbpGOxU1nC7RkaviK2zL+5IB8QV5bmROBL3UOw8GzYJr9xKE5FDAjx08xsloV
 IeFAmw9cRqlVnSXFIp7wP6FsB/Z4n2mb/5aZxmh4loULzdzneXGEYm5Hu60nyMhpMc66WOZ+UkR
 sGfsfVaoQrJsL4SNeJItTYoayRwhYKcirluxBbsNxZpZ6/JHa61bbY9j3yLkxca+IHS+Vj+q+fi
 weAxo+naTXefK/v8EbRgrQXWv/TIFaZ8Mqi3tBqNEQVOdZ9rP6x/CsV3ySR2DudA7Uj6KaJwtV1
 S2/2pIYv3YpWBcknNuBThDLS8ZgIBpumUY1roXksBlFvAVGVxXiBTQ51M0CqFWpffSQYreeGpAo
 IG4M9uScArO91G6pWqIJRJkCM1MPZ9MpJbiNBBrr1+IH2e8a6B3d/ccJYKwk4D0noOXYqA2Ob2r
 qaqve6GK2KwWTHEWab3PBQg3R52v6o5gaLmX1B3QIS2au02qr9bwSP/KVJjC3CGJlESfsfm4KtL
 KnzMD6AwQK2rTdXiMQp2lL/oIa8HaJOZ59GELbUhgTYHK0zsjSsScjkwFLjAHUjx42QxHRxOJpo
 QCERx6t6yPC6eR1lLR3FewECmpwTWwxTYQBUtLlTrE6m3Q9L5uDJKgsbGEJ1aPgWnD8PNhdYmHB
 AXhpNMpFLZBpAxg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102364-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[protonmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,kernel.org,ixit.cz,oss.qualcomm.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 99CF43C44FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Used on various phones. Minimal viable driver.

Includes device-tree enabling touchscreen on Pixel 3.

What is missing:
 - switching between AP and SLPI mode (to be able to wake up phone by touch)
 - firmware loading
 - anything above basic touch

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v4:
- Wrap everything below enabling the supplies into stmfts_configure()
  to avoid bunch of gotos to power off on error (Dmitry T.)
- Finished chip specific ops and removed is_fts5. (Dmitry T.)
- Link to v3: https://lore.kernel.org/r/20260403-stmfts5-v3-0-5da768cfd201@ixit.cz

Changes in v3:
- s/touchscreen_pins/touchscreen_irq_n. (Konrad)
- Use interrupts-extended. (Konrad)
- Fixed rebase conflict against 8665ceb926ec ("Input: stmfts - use guard notation when acquiring mutex")
- Rename switch-gpios to mode-switch-gpios.
- Do not define properties in if:then: branches. (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz

Changes in v2:
- Fix typo in the binding s/switch-gpio/switch-gpios/.
- Deduplacate allOf. (Rob yamllint)
- Add missing S-off-by. (Dmitry B.)
- Dropped irq-gpios as it's not needed. (Konrad)
- Correct x and y touchscreen area size. (Konrad)
- Correct reset introduction commit description. (Krzysztof)
- Partially implemented chip specific ops. (Dmitry T.)
- Separeted license naming cleanup into separate commit (Dmitry T.)
- Link to v1: https://lore.kernel.org/r/20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz

---
David Heidelberg (7):
      Input: stmfts - Fix the MODULE_LICENSE() string
      Input: stmfts - Use dev struct directly
      Input: stmfts - Switch to devm_regulator_bulk_get_const
      Input: stmfts - abstract reading information from the firmware
      Input: stmfts - disable regulators when power on fails
      dt-bindings: input: touchscreen: st,stmfts: Introduce reset GPIO
      dt-bindings: input: touchscreen: st,stmfts: Introduce STM FTS5

Petr Hodina (4):
      Input: stmfts - use client to make future code cleaner
      Input: stmfts - add optional reset GPIO support
      Input: stmfts - support FTS5
      arm64: dts: qcom: sdm845-google: Add STM FTS touchscreen support

 .../bindings/input/touchscreen/st,stmfts.yaml      |  19 +-
 .../arm64/boot/dts/qcom/sdm845-google-blueline.dts |  19 +-
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi |   2 +-
 drivers/input/touchscreen/stmfts.c                 | 601 +++++++++++++++++++--
 4 files changed, 580 insertions(+), 61 deletions(-)
---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260214-stmfts5-b47311fbd732

Best regards,
-- 
David Heidelberg <david@ixit.cz>



