Return-Path: <linux-arm-msm+bounces-105975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YG/PFUv2+WlYFgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 15:53:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1AE4CEE1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 15:53:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1703330531D5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 13:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C49EA47ECEF;
	Tue,  5 May 2026 13:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eq5VI6mt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1DD47ECD6;
	Tue,  5 May 2026 13:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777989130; cv=none; b=RRUp/KMe5ngzlwYBJH/HTGm42LxIGjlSWjD3zDVanxUVAk6llP1Qk5sYHo0ICAPxglEdK8iXBumOQu0zN+zLyqUqDZCaGcmwCNzh8M7XvgzdHKgbcjVghLMeR+GE4sT7ZQqoAiu4PjHEOMOK35ophD9hOuywCQ7tGglsUVKXifA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777989130; c=relaxed/simple;
	bh=ZWIongSi2sHc0KkDpAKN24XGWS3ZeBA/lRfNTAcOLT4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PZYEgWu3YBygdSixWp82uumkp4uJzVF9AyOOdZPdpcyiNvN0AAiUwfo3ufbSg9rUAN/FX9Ol3BVJ8c06DOvMHRpZAads93fc0lzmnOY6cuwAIDPe4appXZE6EVkA3LHZLe+Wslo6UkOYCR1sp8ynFGrSMHcyxxZU5LSLyzgaON0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eq5VI6mt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44E8FC2BCB4;
	Tue,  5 May 2026 13:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777989130;
	bh=ZWIongSi2sHc0KkDpAKN24XGWS3ZeBA/lRfNTAcOLT4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=eq5VI6mtZXu4eRP43OoaLYy16/viZ+OFOC9+dvAWoC/MhpKcdDBakRCC8xcWUmh/+
	 rNm4xAthULbOBOLiDNMvVN2UGNJSD0wpFtWE8VwFWaYagxwwH/bQScfvhTCJKowr/S
	 u+u3w+duwgk1QhNhl3F9Oux6ERoPQXXAO2kbYYpcyvipopRprCF19Efamc892d/DDD
	 TjeRxJ0PQfCQzHQyHQZJVetH2ZtgPVA1FvNYLYKZaFRPG7Kl4fUM6ynuCa4Dn1hOSJ
	 3yrZGmh7lARHnlLxeUXcuNOTluz0ilABI88UY37UEoOHTU/jk+f4Xjev4HiOmxoavp
	 bFDIfosPndk4g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F9ECD3436;
	Tue,  5 May 2026 13:52:10 +0000 (UTC)
From: David Wales via B4 Relay <devnull+daviewales.disroot.org@kernel.org>
Subject: [PATCH v3 0/2] Add initial device tree for Motorola Moto G (2014)
Date: Tue, 05 May 2026 23:51:40 +1000
Message-Id: <20260505-device-motorola-titan-mainline-v3-0-8fcfa280e5d0@disroot.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WOywrCMBBFf6VkbSSZPnXlf4iLmE7akZpIEotS+
 u+mVRBXLg9czrkTC+gJA9tnE/M4UiBnE+SbjOle2Q45tYkZCKhEIQreppFGfnXReTcoHikqy6+
 K7EAWuTFV1ZgcygoMS5KbR0OPNXA8vTnczxfUcbEui55CUj3XB6Ncdp8Y5P9io+SCo2xkrgQ0W
 jeHloJ3Lm6d79iSG+ErLAX8FUIS6nonoa51XQj1K5zn+QXJJjkLMQEAAA==
X-Change-ID: 20260404-device-motorola-titan-mainline-ff668f32562f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Wales <daviewales@disroot.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1418;
 i=daviewales@disroot.org; h=from:subject:message-id;
 bh=ZWIongSi2sHc0KkDpAKN24XGWS3ZeBA/lRfNTAcOLT4=;
 b=owEBbQGS/pANAwAKAW1jV4FG9KFmAcsmYgBp+fYDtsh6c0D6MTX5TZ/FaZu87Vt6A22Yz/mIU
 pkVNHm8hPWJATMEAAEKAB0WIQTXikd3yUPmOPWSLPJtY1eBRvShZgUCafn2AwAKCRBtY1eBRvSh
 ZpyoB/9rIGoZkdaH4kIEMPWptwYrA3OXiR3YgdAcqATr1gaKXt4jfQkwUPzQ5ZsgyES3d73vyuu
 n/FqWlfT7L/b3az1GytJtLUmY7Ii2toaBWBaZHMsRrjdMOjcysa9mSQXpMcxewTv1DiAQTmR3X6
 NCb7yi2jnKtBtt/l39jhX/z84iKPU9JeW2dbrJrovR5h8kF9Sx451Ycc0NOvpxuXJZOK3dbu7D6
 uag9kYJsitqshOU99+WOu6yd9cJhjVSRMP3nOoDdS0dy/5F3IHt9rJHmr6oBt30brFA5bATPWcm
 XPbetOSCgC12auRfRjLr+pn1rQzP2MhzlFNs2VjFFx8HFuQq
X-Developer-Key: i=daviewales@disroot.org; a=openpgp;
 fpr=8F5BAFB15444A769DC3B61684022B817D275D037
X-Endpoint-Received: by B4 Relay for daviewales@disroot.org/default with
 auth_id=737
X-Original-From: David Wales <daviewales@disroot.org>
Reply-To: daviewales@disroot.org
X-Rspamd-Queue-Id: 1A1AE4CEE1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105975-lists,linux-arm-msm=lfdr.de,daviewales.disroot.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_REPLYTO(0.00)[daviewales@disroot.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,disroot.org:email,disroot.org:replyto,disroot.org:mid,msgid.link:url]

The Motorola Moto G (2014) is the second device in the Moto G series,
with codename motorola-titan.

This series documents the motorola-titan, and adds an initial device
tree.

These patches have been previously discussed and merged into the
downstream msm8226-mainline fork:
https://github.com/msm8226-mainline/linux/pull/18

Signed-off-by: David Wales <daviewales@disroot.org>
---
Changes in v3:
- Add missing trailers to commits
- Link to v2: https://patch.msgid.link/20260502-device-motorola-titan-mainline-v2-0-c791277c740a@disroot.org

Changes in v2:
- Remove active-high from reg_lcd_default.
- Add reg_vddio_disp_default, which I somehow missed in the last version.
  (Assuming this also shouldn't use active-high)
- Link to v1: https://patch.msgid.link/20260423-device-motorola-titan-mainline-v1-0-e1813a028cc8@disroot.org

---
David Wales (2):
      dt-bindings: arm: qcom: Add Motorola Moto G2 (2014)
      ARM: dts: qcom: Support Motorola Moto G2 (2014)

 Documentation/devicetree/bindings/arm/qcom.yaml   |   1 +
 arch/arm/boot/dts/qcom/Makefile                   |   1 +
 arch/arm/boot/dts/qcom/msm8226-motorola-titan.dts | 357 ++++++++++++++++++++++
 3 files changed, 359 insertions(+)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260404-device-motorola-titan-mainline-ff668f32562f

Best regards,
--  
David Wales <daviewales@disroot.org>



