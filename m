Return-Path: <linux-arm-msm+bounces-97731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONCbGggAt2mKLQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 19:52:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2702629207E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 19:52:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8638B3002B15
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 18:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB7537B021;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tKhXCPf2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E2F366549;
	Sun, 15 Mar 2026 18:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773600773; cv=none; b=hT5jxiq22Z8QxQR9FTkQBaz6PEFyZ6JOuzx4PzJgkzyzW7yd3Mx/SjuCYb9128YbPjmFMmvuHvCLM/hOrKTBVIXs8q8u0FyjJ/3PoP93MlwAnfyx14scbtzlhkyicP2Ae5mJ5W3xAkTNoA2OUDddSXhY6DiZv/1S/+DmIYxU/kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773600773; c=relaxed/simple;
	bh=o4sD9z+DOoFeCBJ7SrXYHJ3jpMK6dfrsLjScjTrYeek=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cEJtwwFkCOrCTl2hjOq93UgG4jEq4/4JOlppw3lIqx08h1k5QwPI+JEjjj3T3rFz83bmpRFo932TxPHqYw3cRWP3dHOS0b7uJnHYr2w/kNNtC5RNT9eSSD3uBzm/qnE81YPU7CrriD/I+wZWK0emCl9r1SLY0hmy40UtzcB+vl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tKhXCPf2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1770C4CEF7;
	Sun, 15 Mar 2026 18:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773600772;
	bh=o4sD9z+DOoFeCBJ7SrXYHJ3jpMK6dfrsLjScjTrYeek=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=tKhXCPf2GQT+E+C8PX+LlsT2TS0EDRQMxLyIWA9ZTCMJQVeG5TAvUFGfQFGPNwnfB
	 iY3JzHRxmkn/RB+I//IoldWAy+vh6/UIo4tlyDYD+RVbyWhXpcCuangPQXSmJxO0dZ
	 KRhrCrtyngk9q+fbXv1IQWJ/MHuFalRO0m7qL8UA5Q9bmL9EaF87eKt3lA19lXrAS0
	 4BKfGhMsTnFJGZ8tOmmXNA8wqNbmgIlcGmi3EKAyOhJ3AZnlKSEgWtdhUtyQErNDLu
	 nHajTnU/HxzeTwcfIvvG881x0rtuX1cNL5iPT8UUg/lVvQe/qaKqMtKWXLw0PbbyIq
	 ljFBXRf84p2Dw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA8ADF30280;
	Sun, 15 Mar 2026 18:52:52 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH WIP v2 00/11] Input: support for STM FTS5
Date: Sun, 15 Mar 2026 19:52:36 +0100
Message-Id: <20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPT/tmkC/z3Muw7CIBQG4FdpziwGDvSik6ubm4PpUCi1Z7A1Q
 Ei14d0lDI7/Jd8O3jqyHs7VDs5G8rQuOeChAjMPy9MyGnMG5NhwFIr58JqCr5lWrRRi0mMrEfL
 77exEW5EecL/eoM/lTD6s7lP0KMpUIMnFH4qCcYZoVN3p02Ca7kIbhaP5Qp9S+gE5EevqoQAAA
 A==
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
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2295; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=o4sD9z+DOoFeCBJ7SrXYHJ3jpMK6dfrsLjScjTrYeek=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBptv/5jsfTlXQXhPhxCDEmBDtICy4aS4OGijRGR
 eKk3Yv8mWuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabb/+QAKCRBgAj/E00kg
 cqgbD/9XPEettkTdq7HsP8ymzT+1/jEZLNLoqIu8npKK7gPL2EhVadWpF6N8smn+5TjulTrCvJB
 YMf6zNPtF1qnBuR1eucX94IPn8RXaen5eNvKXcQ8vBZSx+PHMdJeUa8UqEY2+Rb2Zo5epFcKWno
 dFPzqn874nsJOb/2QC43eFaiiSL6g06RLbNJStWnEGRH9UVXpbw4N8IhjUpjwbu/aw0aMNXLUUV
 yhL6s5N9n51+ZNWsIATdwfj2VkX8WFRKg/ontk7eKcJcsQJcVvZrrO0zBa3VvnTNmQVkc83FWvw
 1ypgCNDSQHQkhGupxGEAJTZJcHcjf+0mDya65u4kKZU/ngeQr8rrReJ0PtRe2Q1cNU21bsNVt2U
 ryZGszRXz1QG2kwQugOVEWlrqspr1roU0Z8ErhNLyvTPA3uyvlhoweq/dfSxkpfvRrduu6ApMKN
 8FoUPiQAe21HjeHjdmMmEPyYEpfHe8OluUsssqbUnp6EMbQAifvHgQYut2sXsJPXnrGvligcH2w
 K580k7rJ0Qzo5sc0yHq6RVAgK0b5yL3CgJfTb8hNjHAn/NOQKSDZf58GZfuDWB37sgmsiE94V9M
 lDBhb+9f8Teo3VH1DnpJk6Ar+rsqUoWUnAZQAJd/Vww6Q/XQwAMQz5VrrLBqvNddGlqHru8lbcF
 iG3eqYq0SsgjcQg==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97731-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[protonmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,kernel.org,ixit.cz];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz]
X-Rspamd-Queue-Id: 2702629207E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Used on various phones. Minimal basic support.

Includes device-tree enabling touchscreen on Pixel 3.

Sending as WIP, as not all comments we're addressed, but please to apply
any patch which does look ready for inclusion.

What is missing:
 - firmware loading
 - switching between AP and SLPI mode (to wake up phone by touch)
 - anything above basic touch

Signed-off-by: David Heidelberg <david@ixit.cz>
---
TODO for v3:
- wrap everything below enabling the supplies into stmfts_configure()
  to avoid bunch of gotos to power off on error? (Dmitry T.)
- finish chip specific ops and potentinally remove is_fts5. (Dmitry T.)
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
 .../arm64/boot/dts/qcom/sdm845-google-blueline.dts |  20 +-
 drivers/input/touchscreen/stmfts.c                 | 593 +++++++++++++++++++--
 3 files changed, 573 insertions(+), 59 deletions(-)
---
base-commit: 9cdfeb2399709fcc7e5ec0e6a29e283d0d9a9902
change-id: 20260214-stmfts5-b47311fbd732

Best regards,
-- 
David Heidelberg <david@ixit.cz>



