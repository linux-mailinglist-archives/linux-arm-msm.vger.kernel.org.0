Return-Path: <linux-arm-msm+bounces-101699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PShM1D0z2lT2AYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 19:09:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 37395396D39
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 19:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A22573010BBE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDFFB3B27FA;
	Fri,  3 Apr 2026 17:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZchdwm3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E1E2701BB;
	Fri,  3 Apr 2026 17:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775236116; cv=none; b=ENzOqyVLi+Nag2yXLFC3h4QYkMbFEhBSJp5RYWJHYeZGJUJjR8WEMnNg6QVqHPHcQ2k/+dvJyLVj2yoOwxveCNcIs7IsYlDYWMrTHmGaguWZbMYuux+oa5woNoT/ZIGtj8Cz/ndju1epq+2nxL4hrc2w8E0okbLmGXK9gd8PdPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775236116; c=relaxed/simple;
	bh=GlKYN/zZxt8aijzn4oIdQuv3Z0rJb0I1333hvIbLwMw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=coJQPiRgk8Qn1MsUNKSia5D29U+Tzts+tS9X+nyT/YLFWZu6DFYr1fu5OvgW4PAzWHCFxOFBBFti4AuJXUkkrlogantIekUhcUzerP/aebWtMvbiETo9b2tIXdv3zXcU7X+MZ2N1qDd8x+uqWz/cDZYWNNCia3baikwVShk7quM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZchdwm3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62892C4CEF7;
	Fri,  3 Apr 2026 17:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775236116;
	bh=GlKYN/zZxt8aijzn4oIdQuv3Z0rJb0I1333hvIbLwMw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=OZchdwm3Ry93yItR+6UNZXN34uWDQ7gZvJK2HAVZl/Qq2cvq9bdpSu34AsF1KWwXF
	 Ag7g7med83zCKIraZaGQUYsGmKxTCu1qs1L1zjKdmVQC7JjGbfvvaQm3v7LPD0ZKD3
	 BtE/fiACsNTQSmWksigJ/WblVyXNIFXqiDfngPflknrKnodGv87n6lrpX0aoHJtWvm
	 18JaTngPC0it1TbNBpTEPf2HKn6L+m732WFLUp98CNTLxoBhxXA57Tak+3AnxRZ4Zs
	 FmSkWC4cGAuLoAjrGtGwr0qWvIsqdVL1snlngdkepn6grRlYIJox6sU02kwyRyMNQl
	 mowISHbQyVFRQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A577E85386;
	Fri,  3 Apr 2026 17:08:36 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH WIP v3 00/11] Input: support for STM FTS5
Date: Fri, 03 Apr 2026 19:08:29 +0200
Message-Id: <20260403-stmfts5-v3-0-5da768cfd201@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA30z2kC/02Muw7CIBSGX8WcWQwHSi9Orm5uDsahUGrPYGuAk
 GrTd5cwWMf/8n0LeOvIejjuFnA2kqdpTEHud2CGdnxYRl3KILgoucCC+fDsg1dMF5VE7HVXSQH
 p/XK2pzmbbnA9X+CeyoF8mNw72yPmKYskx58oIuNMCFOoWjetKesTzRQO5pMNUfxRqDZKJKri2
 tTS2kY1uFHrun4B4OVZ4dcAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2782; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=GlKYN/zZxt8aijzn4oIdQuv3Z0rJb0I1333hvIbLwMw=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpz/QPbgkGGQZL6Ms1VT4v9eXov9xd9EfrPAqIV
 RcjKaBA9EKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac/0DwAKCRBgAj/E00kg
 ciZGD/0VTy2p4LA7wUhf9zj4p6BQTIB91aIJN/nsxu35iLgxPUdqZqVKXN2OAOq5Jrr8g6LwlJ9
 B04oKF2XCz96GCSdXkC3FUo/Cxz5aeBx7+SQIXCXMYqilQnqhtSiRoog9DKTYyxWDsXBkOhsBCs
 UE3XebZX2Lcyh48cRBrGMEZ0NPsuesYofpsWmPGmRp6CRbnI+PhAgL+wk4vSxh+5kwPNvTUcNDQ
 tK6K4aYmPLoP/zxLyV5G2Lm+z6oFcq4quGWd4l1EbEZZLAavoWQuErfbyXXn9En5Xo8a1LEICFV
 WJ9Bb9R9pb5cclH4veK7RlM/mKrchaoqC+t07OtjNSfPjfO3pk+x8EGMDy8K+PyHjc3jU7s34C6
 mTBCYWtMnu4CuTLyEcuBPTPxuO09UC/4+Q6AnokmjduA555YQhOsEHD94qiF1nUYkO3hHmBUG2N
 D9cNOllkF5TlbkcexZcREw3MQP6NkoaIYx3sqG91GRJGGQbLJdAhViBB7PsZFPXdjnCjvLn3f6B
 C6fUx3jnH9Xe10yNcLSb94FApuY7dNvCBsfyYj/cN56C4y74wWvbQgtnXVw+Ur9CAnZPkLmVuDS
 O3aSmGOu/0CCBWEj8CWZMkWTAyOuncNtnXwtm7Lvq98ogYcwcKhC5IiYr0B+sNchfOmFYSkcTok
 UOK94K2QqppkkkQ==
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101699-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[protonmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,kernel.org,ixit.cz];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 37395396D39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Used on various phones. Minimal basic support.

Includes device-tree enabling touchscreen on Pixel 3.

Sending as WIP, as not all comments we're addressed, but please feel
free to apply any patch which does look ready for inclusion.

What is missing:
 - switching between AP and SLPI mode (to be able to wake up phone by touch)
 - firmware loading
 - anything above basic touch

Signed-off-by: David Heidelberg <david@ixit.cz>
---
TODO for v4:
- wrap everything below enabling the supplies into stmfts_configure()
  to avoid bunch of gotos to power off on error? (Dmitry T.)
- finish chip specific ops and potentinally remove is_fts5. (Dmitry T.)

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
 drivers/input/touchscreen/stmfts.c                 | 594 +++++++++++++++++++--
 4 files changed, 574 insertions(+), 60 deletions(-)
---
base-commit: cc13002a9f984d37906e9476f3e532a8cdd126f5
change-id: 20260214-stmfts5-b47311fbd732

Best regards,
-- 
David Heidelberg <david@ixit.cz>



