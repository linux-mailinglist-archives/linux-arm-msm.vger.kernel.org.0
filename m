Return-Path: <linux-arm-msm+bounces-101654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOcmIu/Iz2lH0QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 16:04:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 030D9394EAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 16:04:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 409873068F0F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 13:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7FBC39C639;
	Fri,  3 Apr 2026 13:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4pKeBMt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0CF33B6D1;
	Fri,  3 Apr 2026 13:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224734; cv=none; b=glbRKbVErbhwfuOtl/XdSY3yUdbyaTbmP7Ozf2fQH3eCbEYTWbWl0smI08aKMhkoTwTkcz3tj93sO1wi8e/ZXjhx3qnHJ3004OLx3S8m3d9ttb663ir0lhcti2jgbHcvwNz4ILpTI3iUWruIsOZ7bh9VyphaaZnyQ8oOqVjG6h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224734; c=relaxed/simple;
	bh=dXC2Ls22VsTuntAg533+4rpSlzX0Ms0eP5VcFmrXtfk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QQQ9RRUSHzQN4ZmCA0tIo9muOgnirUX0ft4ppctX9nSdYPzZ7M5c9/OE+VMAunQtkc12+EjImC6fJxtjlllHLw7QdBbc250q9wbV29mr88hRk5LlKDHAw3udm8MWj4Q2jLY1RLb1se+t6d9WN9eE9QmTuLm30IvAgr62i37gf74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4pKeBMt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B80D3C4CEF7;
	Fri,  3 Apr 2026 13:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775224733;
	bh=dXC2Ls22VsTuntAg533+4rpSlzX0Ms0eP5VcFmrXtfk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=L4pKeBMt3oVlmgHqSo7Tr5zXtpXKdtn7FNCKQSoFiW0K5EOJezn4h36X9Iv1rHfKZ
	 xrVOzTIDVANCDgn7a4vY3M1RIMjWw+MD/7a/vQGgCz1c7OgTYzKkSRXBopQLS5cywr
	 2SnYHbzFto/c4bR8WK0S8wjIVv9Kpq/ZXvLfeMEFctsGEuNKFc4AiFHNGEfsx71SVN
	 QEBqoMCelctaXvDB4AK6IpR6JPsBSM5dbFe9SsuyeWlUByQeN58TyCxji229h0pIEc
	 10pOt9H1NEgHzXCGxGJMEGpfhRgS4ZT7SyfTiKmA8JOIoGrPS/rsS3x4xvuoM9hcu9
	 zHjezSNCF2kwg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3CDCE85370;
	Fri,  3 Apr 2026 13:58:53 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v3 0/5] NFC support for five Qualcomm SDM845 phones
Date: Fri, 03 Apr 2026 15:58:45 +0200
Message-Id: <20260403-oneplus-nfc-v3-0-fbdce57d63c1@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJXHz2kC/1XMQQ6CMBCF4auQrq1pB0rEFfcwLqDMyCSmkBYbl
 HB3Cxtl+V7yf4sI6BmDuGaL8Bg58ODSyE+ZsH3jHii5S1uAAqO1vsjB4fh8BenISqsUkrYdNVU
 rUjF6JJ537XZPu+cwDf6941Fv7+aUKgc4OFFLJQ0BkCkKUgg1zzyd7UdsSoT/sjiWkMockZQBW
 7W2/JXrun4BT7IzEN4AAAA=
X-Change-ID: 20251118-oneplus-nfc-c00ef1cdfa9b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Martinz <amartinz@shift.eco>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
Cc: Petr Hodina <petr.hodina@protonmail.com>, 
 biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, oe-linux-nfc@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1943; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=dXC2Ls22VsTuntAg533+4rpSlzX0Ms0eP5VcFmrXtfk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpz8eakJsX6gGd+ScB5FPM+p/JQi2wBwOsMnUt/
 Y+mx1bVEZCJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac/HmgAKCRBgAj/E00kg
 cvw2EACQpcKTZBTFP8x4aSpZdX/7zbcUPaMqqAgc1LEA1RcNxdW/5+v8cSHgTE69USU73OadJiR
 YBvX6FjhraJ+XpV0J9QJVAntl4yaUJUX/N7pHYo0DTGsvAa1xkTVNO7XIoDWm8OYBxB1c5cfiDh
 HP1bDeVfCet7LBkAGF41xLFYX478bo3PXUTWgPEp+EUpsHQ/mmpGbt+H3Br8w2M7vqcELo1r3FC
 kpyzezb7jQfsQSRXxbAZEE3JHqSnO/CVxBohOw1q5E1ncaubymGFMHwXOvU3MEa/MY4XUqd+62F
 lrV0Le1/DB+3Xp16aIhu5AC1igPEeLPLKV/2G225RAaJleEwOQOkbDa2pNPoa01hBH3M7L+Z+A1
 VFMi31buq9YJJXqid2bmT+s7uwEq3waDXSpV8qksH0Ysw6G7yIucbg/LaGCCsR0N5cilcKb0Axn
 mniYlTwKKSfmFTmWSkuMc5lvQiRR056g98KOHYxRBDc1BziFmR87P0QW4hg6wWSJaSSx5cCybdJ
 tJfDy+5EbkS1aK3kQZXGVfDFbgbHBpjMB0nbnGT/WExn7/jemnAIjD7TrPDBFPd9wuU3mUx4OeN
 nAzVrPuFC9trE09Ac5jp3St6IqwhhjeXzAUTVNt28/cP170+VPKRo7CD5PPpPHBebxUGR8Gu1Ah
 XgRMuOG02rDEUGA==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101654-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,gmail.com,vger.kernel.org,lists.linux.dev,kernel.org,ixit.cz];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz]
X-Rspamd-Queue-Id: 030D9394EAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

- OnePlus 6 / 6T
 - Pixel 3 / 3 XL
 - SHIFT 6MQ

Verified with NFC card using neard:

systemctl enable --now neard
nfctool --device nfc0 -1
nfctool -d nfc0 -p
gdbus introspect --system --dest org.neard --object-path /org/neard/nfc0/tag0/record0

or use gNFC:
  https://gitlab.gnome.org/dh/gnfc/

successfully detecting and reading a tag.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v3:
- Added Pixel 3 / 3 XL support.
- Lower drive-strength from <6>, to <2> which downstream kernel uses.
- Took full ownership of OnePlus 6 NFC patch as original author prefer to keep annonymous. (Krzysztof)
- Enable sleep states (pinctrl).
- Link to v2: https://lore.kernel.org/r/20260324-oneplus-nfc-v2-0-3eef052c9bc6@ixit.cz

Changes in v2:
- Use interrupts-extended. (Konrad)
- Dropped QUESTION prefix, as it's verified this settings work.
- Added compatible for OnePlus 6 based on schematics.
- Corrected axolotl NFC compatible based on information from Alexander (SHIFT).
- Link to v1: https://lore.kernel.org/r/20260322-oneplus-nfc-v1-0-5f22f544f0e2@ixit.cz

---
David Heidelberg (5):
      dt-bindings: nfc: nxp,nci: Document PN557 compatible
      arm64: dts: qcom: sdm845-oneplus: Enable NFC
      arm64: dts: qcom: sdm845-shift-axolotl: Correct touchscreen sleep state
      arm64: dts: qcom: sdm845-shift-axolotl: Enable NFC
      arm64: dts: qcom: sdm845-google-common: Enable NFC

 .../devicetree/bindings/net/nfc/nxp,nci.yaml       |  1 +
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 31 ++++++++++++
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 57 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  | 54 +++++++++++++++++++-
 4 files changed, 142 insertions(+), 1 deletion(-)
---
base-commit: cc13002a9f984d37906e9476f3e532a8cdd126f5
change-id: 20251118-oneplus-nfc-c00ef1cdfa9b

Best regards,
-- 
David Heidelberg <david@ixit.cz>



