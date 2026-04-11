Return-Path: <linux-arm-msm+bounces-102782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CTnLX4e2mmdyggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 12:12:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7B53DF428
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 12:12:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0362301F33B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 10:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589DF33A6EB;
	Sat, 11 Apr 2026 10:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fhSmV+4Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F6C32E6B8;
	Sat, 11 Apr 2026 10:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775902324; cv=none; b=Zp0LCzDcfhFnprZcd6rEX3QrjlPVdUjP7g337VLZ0HvemtMhQOnOXfTuRUnmFTfXDxbxYwyp/KGsDUvO+soe8k7T8Q1pNfhMi4M7BRDi4Vg0oXSiFJUjJk75vXRsudKoMw4LL7ItPZP9/Is0gvk2wZn4y8aQI1jdIjE2xnZxGHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775902324; c=relaxed/simple;
	bh=DLOxbxkuhfRrndcN7Pp5N2eb7duuklgQrYckDIDbI0s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fTomE2DIDrOo+vN0xBMy6WTbgGjhOEGAhjmXrBGJrFLUzVKrGGjehX9gqfduQDYHlsNxpAJGWRSvNka2hYCSQXac8dB2wFMb1RUT2NLVQ7SE1Kqs2Ec1QYKLmTybmdIn2qXqYuiJKbzETtlm4a4XkYOa/qNXENQV8noB46EYb+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fhSmV+4Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0AB4C4CEF7;
	Sat, 11 Apr 2026 10:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775902323;
	bh=DLOxbxkuhfRrndcN7Pp5N2eb7duuklgQrYckDIDbI0s=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=fhSmV+4ZfjkYG+CPowdTbhn9zbEkv+3k2p3jI4XNHC1+JA/afof6L4qIpU6Regkd2
	 Y3h79D+yy7quEu8rxg4WiE7zDwKwmJ38lE0m7ZV3Mj6Cmis0zO2hyt0mj0nj2/YA6B
	 jncnG2wUVrw655yUZ/nwOwPPX4Khl+WPNpxhnSts15KfuUxaWrHawyXRAiUe1iqMOr
	 Xjc0oX2EEvpLOpdNNI4TsdysWsYQKx/1iMp+0cmHTVGHh3j/lejGEy95nLNnWQZpn0
	 gpqnDjQcBtP2kuA2TdppMsfSQ6x/EWi9Uy6BqCB6jLFaYMRk79J0bE96UGulGYLxin
	 9SSbUNvFr8MRQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A3BF4487B;
	Sat, 11 Apr 2026 10:12:03 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v2 0/2] Add initial dual front camera and rear flash
 support for Pixel 3 / 3 XL
Date: Sat, 11 Apr 2026 12:12:01 +0200
Message-Id: <20260411-pixel3-camera-v2-0-41b889abb14c@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHEe2mkC/13MQQ6CMBCF4auQWTumLbZQV97DsCh1kEkUSEsIS
 np3i+5c/pN53waRAlOEc7FBoIUjj0MOdSjA9264E/ItNyihjCilxolXepTo3ZOCQ2dtbdtO15Y
 I8mYK1OWH3bs2uXuO8xheX36R+/UnnaT8kxaJAlWlKyOMlro1F155Pvo3NCmlD4dHHG+oAAAA
X-Change-ID: 20260315-pixel3-camera-a9989bf589ee
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, 
 Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=890; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=DLOxbxkuhfRrndcN7Pp5N2eb7duuklgQrYckDIDbI0s=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp2h5yHbY9dH0lvE0VfYTk/4S24aBifMgf50F0+
 1ojp091LzWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadoecgAKCRBgAj/E00kg
 ctlKEACG0RG2U5WBXLLDbuCpUaNeRVOiZvCkIRRBRJxM9QQzTEthaaa7wq8hItNc/AiKNmO+hSv
 T6nFnV2w8xzhaZjilYfgAs2dNGti5YJrViyfCfOm2GSp1eOGtC7RxJeO/ECNnXVipvrA3EEv/KC
 +V0ydCoVNRIxHyoK3R7LLqEOw46GvSK6mMHbCNUFmqU6ciapKcl4tlTw08S/18ZrptmU8Z9uRUj
 wpKvmvCVuAdA2exbiL7kV7KIFnTkfTp2liGDs57AG3EKjY7n1jdAIExaMb8VrRyKrMH0wMD6zk4
 J7k3fmsj0RgHziQn0aEgKBaJwnEaDVv4I3kdEq4L9iWKovaKLmiXs4X5F5timOyZYtqvwUyrOir
 pCkY/zDIeaNsxhZHcC+2mfFCjOe7DflVgRJMUsE6eRM4igFnKhQ3jHlQT5OilVT0kRDQQ7iBmLm
 iWaWJcl2Bh+QB7MPqh5tovRaryafO3EQ+bU/bKtNDYi2nJ+aW+jZ72TTbQmQq1GFtzqlYbZqG/y
 Qq8diq53lVy8IGDW2v0D3vME9nRc/7jpE9/kZxSpr/e5wVR0o5CbvaWPbOsfTxmTaF9LjNI3qMv
 WPXnWPw0YV2aLAr4Q3WPnK+cdMbjJfEJOihk6YiqxT3jX3i5sACx3/0reZvmPexzXICVitjthF9
 o2okzcb/6dMfKcw==
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
	TAGGED_FROM(0.00)[bounces-102782-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,gmail.com,vger.kernel.org,ixit.cz];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,ixit.cz:replyto,ixit.cz:mid]
X-Rspamd-Queue-Id: 5E7B53DF428
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Describe the dual front-facing IMX355 sensors (standard and wide)
and enable the PMI8998 flash LED with hardware-accurate limits.

This brings up the basic camera topology and flash support in DT.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v2:
- leds.h include escaped the initial submission. Fixed.
- Link to v1: https://lore.kernel.org/r/20260411-pixel3-camera-v1-0-2757606515b6@ixit.cz

---
David Heidelberg (2):
      arm64: dts: qcom: sdm845-google: Add dual front IMX355 cameras
      arm64: dts: qcom: sdm845-google: Enable PMI8998 camera flash LED

 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 201 ++++++++++++++++++++-
 1 file changed, 200 insertions(+), 1 deletion(-)
---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260315-pixel3-camera-a9989bf589ee

Best regards,
-- 
David Heidelberg <david@ixit.cz>



