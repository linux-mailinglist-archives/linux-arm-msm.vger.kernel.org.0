Return-Path: <linux-arm-msm+bounces-104335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBS2OUkf6mntuQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 15:31:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57915452F78
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 15:31:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A23F9300B474
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 535F63F0AAC;
	Thu, 23 Apr 2026 13:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LWG6CYKM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4453E6DCC;
	Thu, 23 Apr 2026 13:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776950712; cv=none; b=FDzU4mxxvY+VsGaQquhkadHaVFEL8j8wfDjuEtI+bDpJbPN6wn2UV2WLSpPKQHM9Ho+drTxeYzGVLPpN7oFQZI0J9R2bMjCBzOJEXDU6LkGxO6/yumo89RUiU5lSNCFs2QJDVwKWXjNlm8BR/RC4zY2n0gVuUFJ7LRPbQ/cp6L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776950712; c=relaxed/simple;
	bh=hek54JpptwLJ3gA+UJA9MmgBD5QEgs6jDnBqWr+sU0Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GmgXPw6l9pjp769KxQOI/Gc5URILKFJUMN4u9RhCWBw9PjFz9UwGHK1dD2CaIH5WakRRegNdu+V1jH259oJw64VOr7wQXuVDzGL6OnSwD2Fqq2GWbYnVbOwE0YpilC66e0a2OtNMeFN/k5D58cJmNkyhPy0/pFzq+XETbgut2R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LWG6CYKM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3D00C2BCB3;
	Thu, 23 Apr 2026 13:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776950711;
	bh=hek54JpptwLJ3gA+UJA9MmgBD5QEgs6jDnBqWr+sU0Y=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=LWG6CYKMwak5A/YNpsU+DcmiGB7KzQVO7usOSCnmrtfvwj5iXW6ZvL9F31vcr8S5w
	 pTO3bpKn9HXh4sE/C2qyo4LVR3ujarSyi+LhN4PdlvIMBDeK+YB7WfWBad/LzREPk7
	 FJtgd4IwSW9Gm9CtDyv6D3Qv1Ta9B7cika2CRFAZFJgL8anaAzfEc/E9yDP7OTqti5
	 3MtwyIgQdGdqFEc5BBJn687dJeqB4X4Mnn2fOUfhMlauM9C+VwE9rhgf2t+Wfqc1UC
	 PpdZ+VK++z2ddpeEQ4KVpN+t+u5mTHM+RT3tkXo03sSdN1dXpfr3RW6UvcTvC8Lce7
	 Y42WWJWaBI1HA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E02F589D2;
	Thu, 23 Apr 2026 13:25:11 +0000 (UTC)
From: David Wales via B4 Relay <devnull+daviewales.disroot.org@kernel.org>
Subject: [PATCH 0/2] Add initial device tree for Motorola Moto G (2014)
Date: Thu, 23 Apr 2026 23:24:49 +1000
Message-Id: <20260423-device-motorola-titan-mainline-v1-0-e1813a028cc8@disroot.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQrCMBCF4auUWTsQYxvEq4iLmM60U9qJJFEKp
 Xdv1OUHj/9tkCkJZbg1GyT6SJaoFedTA2H0OhBKXw3WWGda02JfR4FwiSWmOHssUrzi4kVnUUJ
 m5658sZ2zDDXySsSy/g7uj7/z+zlRKN8q7PsBoSfGe4IAAAA=
X-Change-ID: 20260404-device-motorola-titan-mainline-ff668f32562f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Wales <daviewales@disroot.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=953;
 i=daviewales@disroot.org; h=from:subject:message-id;
 bh=hek54JpptwLJ3gA+UJA9MmgBD5QEgs6jDnBqWr+sU0Y=;
 b=owEBbQGS/pANAwAKAW1jV4FG9KFmAcsmYgBp6h2uKtbvjnotgEJEIl6vq44CE9KyZjUby642R
 0ZVxL0I9taJATMEAAEKAB0WIQTXikd3yUPmOPWSLPJtY1eBRvShZgUCaeodrgAKCRBtY1eBRvSh
 ZlQeCACSUJRRu6tFX7pQ/aeqftVA5qoiHh5/muMOtQMILRWeE1u/icTKmLxjcA2myd7WMCxR7vu
 7QBuhOq2rk1QjnGysenHKdraSve0V1nEK+fwFY1zIwkiJr0lETH/QdKWOz1Hgj5+V9E6yUmBz5O
 THM06MHlz8vqN/6OmVS67x9toIjhF19m7Y3ZmQw+n9aOY25WBYW9/D8pEszIBxGxOq5XzHQ496H
 f2tbTO/ePsWOKqmgXMBBrHC/QAc6WDj4zRwErFIqoHZObWoI9mzKJ3NO88RB2nBNXMcpiTPRGhD
 TVLkvLrp2Zvs0AW2mmezCryYa8xO1xgSSS9adtrhGZPIX16w
X-Developer-Key: i=daviewales@disroot.org; a=openpgp;
 fpr=8F5BAFB15444A769DC3B61684022B817D275D037
X-Endpoint-Received: by B4 Relay for daviewales@disroot.org/default with
 auth_id=737
X-Original-From: David Wales <daviewales@disroot.org>
Reply-To: daviewales@disroot.org
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_FROM(0.00)[bounces-104335-lists,linux-arm-msm=lfdr.de,daviewales.disroot.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[daviewales@disroot.org];
	MAILSPIKE_FAIL(0.00)[172.234.253.10:server fail];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,disroot.org:email,disroot.org:replyto,disroot.org:mid]
X-Rspamd-Queue-Id: 57915452F78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Motorola Moto G (2014) is the second device in the Moto G series,
with codename motorola-titan.

This series documents the motorola-titan, and adds an initial device
tree.

These patches have been previously discussed and merged into the
downstream msm8226-mainline fork:
https://github.com/msm8226-mainline/linux/pull/18

Signed-off-by: David Wales <daviewales@disroot.org>
---
David Wales (2):
      dt-bindings: arm: qcom: Add Motorola Moto G2 (2014)
      ARM: dts: qcom: Support Motorola Moto G2 (2014)

 Documentation/devicetree/bindings/arm/qcom.yaml   |   1 +
 arch/arm/boot/dts/qcom/Makefile                   |   1 +
 arch/arm/boot/dts/qcom/msm8226-motorola-titan.dts | 351 ++++++++++++++++++++++
 3 files changed, 353 insertions(+)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260404-device-motorola-titan-mainline-ff668f32562f

Best regards,
--  
David Wales <daviewales@disroot.org>



