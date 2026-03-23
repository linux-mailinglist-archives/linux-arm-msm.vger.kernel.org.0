Return-Path: <linux-arm-msm+bounces-99453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qA5LHNXKwWlUWgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:20:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0432FEE02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:20:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D5E28300D0E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2053845D8;
	Mon, 23 Mar 2026 23:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bS3wMMOX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5945C3806C8;
	Mon, 23 Mar 2026 23:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774308044; cv=none; b=KgxDEjfKdx5oaMa0BEThyLr3iCSdi1qBMs1t5nvGhY4Mh5znw9fDw+joVDd3/7cQAlF3Xs3OlNf8jU1yQexL2P/4mz7Lx9eai2acljDD+RH1WwLCH/S1BWm3OpCuH3s2bvYjnrVy/zxQX88mUe1ZFEEB7pnLo1Wbm8t2M0Xyw/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774308044; c=relaxed/simple;
	bh=DTkjcea9B8KRecgVExXsvF5s2GkNdZDwc4sp+EiE1ZI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RXSlX5MQrH01PnSs59gWHKgm9WVhAJYTB76gZEigVvSsUab1coscsvsOEn6R7/C2qhglvlUmnX/10/n8Zqt1h3IHSrVwItarV9NqfdmauaTiM4AqHKMEJ2ZkY0s6xE7v7wIP6NuySpDt5G9JTG4v0T3GFeF147JZTTe5Ct+iRqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bS3wMMOX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB659C4CEF7;
	Mon, 23 Mar 2026 23:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774308044;
	bh=DTkjcea9B8KRecgVExXsvF5s2GkNdZDwc4sp+EiE1ZI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=bS3wMMOXzGL6NZcuwp/LEpAFW3kem3EdCtXolIqllVBEB4S0jqQ7QUIX5YvydUGAP
	 JpS+WcU3+lQUreU6XwqjuVGKD+8AHwp+OcUgLbJPpiGkUe25TJ1CvwdHL7Ph8Wokn0
	 UmNSVME7N/ZzoN+U5RfJr9U5M9PTvwPlFDaNBu5y9JQKd93iFKsUWzca9d7VXYXT/W
	 gA5FfN08DjhtgmGmoUc7OW9hxRvfoHjJnCiMU7zTtUpz1IkIBXJdixT1IaHm/di3nT
	 PwuiKiv/b6hMC8u8Lyvh3+suyIOWw1Z6Lsg13UepykBNh0w6tp+XGumKGfMr2a3Yo1
	 2se3EWF4uKzxg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8EE3F483DB;
	Mon, 23 Mar 2026 23:20:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v2 0/2] NFC support for two Qualcomm SDM845 phones
Date: Tue, 24 Mar 2026 00:20:38 +0100
Message-Id: <20260324-oneplus-nfc-v2-0-3eef052c9bc6@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMbKwWkC/1XMQQ6CMBCF4auQWVvTjtSoK+5hWGCZkUlMIS02K
 OndLexc/i953wqRglCEW7VCoCRRRl8CDxW4ofNPUtKXBtRojTEXNXqaXu+oPDvltCY2rufu+oD
 ymAKxLLt2b0sPEucxfHY8mW3dnLM+If45ySitLCOyrWvWhI0sMh/dF9qc8w8SIr7KpAAAAA==
X-Change-ID: 20251118-oneplus-nfc-c00ef1cdfa9b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Martinz <amartinz@shift.eco>
Cc: Petr Hodina <petr.hodina@protonmail.com>, 
 biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, oe-linux-nfc@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=995; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=DTkjcea9B8KRecgVExXsvF5s2GkNdZDwc4sp+EiE1ZI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpwcrK6HzKCQoxBnDKPKHQiGdLFIHTx8Ukl2wsm
 cptojhQUxeJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCacHKygAKCRBgAj/E00kg
 co5cEADDmglzvpHlEw87TYP9XDKl4ARiyplmy1OtuKf2YBd+eCfa4x85EpaVy75QUU2r9PUbCi6
 M4QcP5RzFvDvtzSQuyWyH+lvu4jxYSkQY6fJCvYWVrXSzfezHpEt2+kSat38qyDB4r50dcne7mF
 B2ESIpclwq8FfiWM/mJ/bDVnYH+MDbNJAANzvoKAIgS6N8L1wjmDwNiQbWkCNYv2IRsUMwnou1J
 UJzPkISOcmycHt27Qo3zYMqt10N/Gl4Tb5d0BdYP330MvnmKUDt7HdW7TSGqF7+9pVffOFRZJkV
 9DCDIucmfFa6FgAJNQfu2JDaWA52KiEIb515FCjKASk+Mh3mO5Zc8hnqhub95VQIU99dwd/0bHg
 moBEHwH79TQXjG+24D6kt/7Nu+TJmFePVT73no4uzk0dF59sJFPVIK24XIbHHjNYzKeJehcNO3C
 pQWRHcoSqMIC1xvUxKcJ3EoDS/1sqR+7o+bCNPfOpcrNxbDtmpHzdgfjRqkGsxZUGseMKEgx13y
 0qjLYgnng88wNt0C3T6JQKJfzJZl4P6OIhw4rucMAXmsO0qLeDbl46AzCr7O946UndqY+NeV8Cv
 eXU/+vBHs7oJQFePRXW3/kybg/8v4silyQgx9EsjpGC9c1AQk/JJQEAeBm7MnzqUOJy0vcjYTxf
 AuphiWhykkApbKw==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99453-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,gmail.com,vger.kernel.org,lists.linux.dev,ixit.cz];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ixit.cz:email,ixit.cz:replyto,ixit.cz:mid]
X-Rspamd-Queue-Id: 6A0432FEE02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Verified with neard and

nfctool -d nfc0 -p

successfully detecting a tag.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v2:
- Use interrupts-extended. (Konrad)
- Dropped QUESTION prefix, as it's verified this settings work.
- Added compatible for OnePlus 6 based on schematics.
- Corrected axolotl NFC compatible based on information from Alexander (SHIFT).
- Link to v1: https://lore.kernel.org/r/20260322-oneplus-nfc-v1-0-5f22f544f0e2@ixit.cz

---
David Heidelberg (1):
      arm64: dts: qcom: sdm845-shift-axolotl: Enable NFC

biemster (1):
      arm64: dts: qcom: sdm845-oneplus: Enable NFC

 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 31 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  | 33 ++++++++++++++++++++++
 2 files changed, 64 insertions(+)
---
base-commit: 09c0f7f1bcdbc3c37a5a760cbec76bf18f278406
change-id: 20251118-oneplus-nfc-c00ef1cdfa9b

Best regards,
-- 
David Heidelberg <david@ixit.cz>



