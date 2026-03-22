Return-Path: <linux-arm-msm+bounces-99047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ExrF7D7v2m9CQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 15:24:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DA52E9A39
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 15:24:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73FAD300FEE2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 14:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49834363C69;
	Sun, 22 Mar 2026 14:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ei1+DEwY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD132DF3FD;
	Sun, 22 Mar 2026 14:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774189462; cv=none; b=sXK8hePdwri6tEy3GilagELpqMeZTewBC20vDdW4Dx7dYoA9NDd4PyhmPAFwUDZufY3LZ7B6Z/DGHTEkLejSTspK/DKUgssiVapLDOvDc4BYjjB74Iwm/Hui3xBunxr1GUFlLWAM30ZynU+jbVKGPwHVQKW2jMq6qyCt3+G3d4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774189462; c=relaxed/simple;
	bh=0y+vz9QItdufZS4Gg1aj8uk09vnC7uOD1Z32a7tIeRg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cQoYQ3XvpejmSw75Mirln3s8VIzxCABX19NzeR/1X9bcsvXtzruq1cy5jrdhCRG8Fhv65jA7ZNqtt6EctGldqlKpAMe9FnsmowG44INZiEgHkJmTNmH9lBpnUltQNm2QBzjIE7F2YDGxGYRaC3c4J7YHrhV3PBBA9Oid/DE3fRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ei1+DEwY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A63D7C19424;
	Sun, 22 Mar 2026 14:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774189461;
	bh=0y+vz9QItdufZS4Gg1aj8uk09vnC7uOD1Z32a7tIeRg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Ei1+DEwY7ZM+wqpz2Zgm+3/3DVfJB7cGCQeTzHKzfH/5dEJ6VVfh/rz3dSL/BffuO
	 fxemgNDV2E6xps7ZAMrOG2f0udBFQ9dRskehTyv5xtlsCfkb/85N1+xE7T1SKjpwl3
	 78R7OEnisCV16N8e3Gm4cZTBRm/X+BFc5xD3v/E70Of3nhc+ojQViP4SaiTRNr6j/y
	 ihN52SVHy+awrPcVKweLuaGc7uHoGv6iZM2+bpNuUsIkd5lKVhmlg8i/ae1FB328zz
	 Ah4ybp5+MhzyWMfIP/5pjJyb5de7/jL1ZPjFA/TnVebx1c70wjbCZ6xh246YJwNXpQ
	 qs/4ndDr1lrZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D6CBFC72C6;
	Sun, 22 Mar 2026 14:24:21 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH QUESTION 0/2] NFC support in Linux (and support for
 Qualcomm SDM845 devices)
Date: Sun, 22 Mar 2026 15:24:18 +0100
Message-Id: <20260322-oneplus-nfc-v1-0-5f22f544f0e2@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJL7v2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0ML3fy81IKc0mLdvLRk3WQDg9Q0w+SUtETLJCWgjoKi1LTMCrBp0Uq
 Boa7BIZ7+fkqxtbUAFlwnv2cAAAA=
X-Change-ID: 20251118-oneplus-nfc-c00ef1cdfa9b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, 
 biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, oe-linux-nfc@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1991; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=0y+vz9QItdufZS4Gg1aj8uk09vnC7uOD1Z32a7tIeRg=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpv/uUtZf7rj034FIS1wsfZrfec7TNLugbDYF7R
 C+mgBKhrreJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCab/7lAAKCRBgAj/E00kg
 cuV9EADQlJ4AcLuzCdke6vz8uKtFi3LaQOIqic0KyvwHlDp+iSQqpo+q4muU3H4juTjatvmVK5G
 XMHc4TL31G5HNqmJhWqmmySxXnHDOiYu5Ql7oJ1WonCv1bmHUaJWMXwIWDxM0cHpPZdx6CvqbWJ
 aMlqrxyWAHv6L/bFwtzWemA6ksOrWhxf4Ni+kR6PGHlx6VxbeSzK1g2SM5L4S8MrBFFpmcRpwV5
 TYQobX1Yc4i6i+4R9QBkfQ12stVgfzmDahkAYg+zLOlR1n15tyjiIYqcDrtcVhM00s4i29vlwUT
 ftQLSQfDTkO79tZxrwEjQEpJSSRfXd2Zm8F/junJvqicQe620B7/kuuC18rRWAMOnkgMfKk/g35
 HAS9Ix2yNCR33d6LPWnP6/ZUSuoV0FtW9LlynGRngPw6Gj3xg6Jlgew6V+f78niy+ea/V9TOt/Q
 YFaO3F2u8vliJgkXY2W+xCbC7j58OVHU9v21SN9soCjkVnQrv7QKryuM5Wjmg7mzKwFmKwJ80mK
 YXD9TA6CGwdYTQgXRqBCdUwTBomwtpEpnj6ytQPxKEviwR/kYO9uk/K8BrUBbXFQQbLqKkd0zK2
 oFxytPIG7qMZ/Y7WvQYg8CpqQtMlCllYog9Lg9Es7ScX/LRKgoNRQm9EjfppdniQJRlmPUj6QfI
 aMOYx1GrDk8NzXw==
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99047-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B6DA52E9A39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There isn't upstream driver.

I'm openining this as a starter. We need a NFC drivers I assume. I tried
quick check, but both of NFC drivers register

nfc: nfc_init: NFC Core ver 0.1
NET: Registered PF_NFC protocol family

but efficiently does nothing. In the See section, there are some ways
how to make NFC work, but rely on patched vendor libs, missing updates
etc.

1. What hardware is present on Snapdragon 845, is there some
   documentation? It seems that both sdm845 devices has almost identical
   setup, thus it's NFC solution integrated? @Qualcomm

2. What's the right approach to continue? Should we upstream these
   definitions and then start developing user-space stack? @netdev (I
   see orphaned)

Since looking at NFC mailing list (oe-linux-nfc) and seeing it's pretty
much dead, would be cool to revive it.

Also there is some effort from Arch people [1], but likely without clean
path to mainline.

Can we revieve the NFC effort? I'm offering limited maintanance (in case
people would send patches).

See:
 - https://gitlab.com/sdm845-mainline/linux/-/merge_requests/62
 - https://github.com/NXPNFCLinux/linux_libnfc-nci/
   - https://github.com/biemster/pmos-openbox-conky/blob/main/libnfc-nci.patch
   - https://github.com/biemster/pmos-openbox-conky/blob/main/nfctest.patch
   - pull request
   - full of hacks

 - [1] https://github.com/zmr-233/linux-nxp-nfc-fix

Signed-off-by: David Heidelberg <david@ixit.cz>
---
David Heidelberg (1):
      arm64: dts: qcom: sdm845-shift-axolotl: Enable NFC

biemster (1):
      arm64: dts: qcom: sdm845-oneplus: Enable NFC

 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 32 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  | 33 ++++++++++++++++++++++
 2 files changed, 65 insertions(+)
---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20251118-oneplus-nfc-c00ef1cdfa9b

Best regards,
-- 
David Heidelberg <david@ixit.cz>



