Return-Path: <linux-arm-msm+bounces-101756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id I8LRMRzf0Gk4BgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 11:51:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5335139A98D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 11:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4EED43014500
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 09:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2CAE3A9D85;
	Sat,  4 Apr 2026 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bvWKbutA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C6F3A8750;
	Sat,  4 Apr 2026 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775296273; cv=none; b=NL9Kg8awlJ7cJZTEYhqgffBjYmoljlinTkW90K7knd2WFpVSmH1iES11j8phLsiQWAA1luBGrFY+FncDQImgWuyckAAxcg7zbQdv5Rssr78AJfQvysihpyW2t7IwDtZKuUlTSAp+8lv8594jqqmW6WqTbHxLetFF2X4bSradTcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775296273; c=relaxed/simple;
	bh=pf7w5tEPxeOOou+A5EAQoMnY3SiSO2iuLXfRP9MTBGw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CPX7GzHrQKOVpv6I9eQHitahyfw6dr99VbnNrgzL3u5LiHxfPerX1+ugj7Sx/ddxAqnfRs/3OPBS/IvHYHFCcnpt74HFml+kM5VUOt3wfPdquHjDJ6rYf4ZAOr++kDY2Vc5wogg9k0GD/jQy7bEdjTttbvkDbYClgMN0BfBvKB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bvWKbutA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61533C19421;
	Sat,  4 Apr 2026 09:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775296273;
	bh=pf7w5tEPxeOOou+A5EAQoMnY3SiSO2iuLXfRP9MTBGw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=bvWKbutAi7I1s3qfdCR1W1A1zUmrvyCazlz8JJSqn6gTbAUFBlq12cf4dbjbdzhTM
	 /727A72Lp8+KA24XnuaLMOuP++L6MbJpI79MDGzVfgQpsvZf2/0R67GSVZbZWB9Ibi
	 rYSZYYinogzdw7HngQbuIKsfD+LNv84wZTtrHI2wofyRR7yb0d254ykcek2cpTjT0K
	 Qnm51JcYN1LYQItmSUmK0EStOMr44FGTIHmwP2MsCBBV6kw8I7PfcRbkktwn+TyqDx
	 bC+vPgT+tvLdnhMLXy6JhNg5jbUiUvFsFhVsLu6Ia0uB3lMxbqzJhITnKShl0TNlLJ
	 qdZPI6Wab4oWg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E225E88D90;
	Sat,  4 Apr 2026 09:51:13 +0000 (UTC)
From: Joe Sandom via B4 Relay <devnull+jsandom.axon.com@kernel.org>
Subject: [PATCH 0/5] arm64: dts: qcom: add QCS8550 RB5Gen2 support
Date: Sat, 04 Apr 2026 10:50:53 +0100
Message-Id: <20260404-rb5gen2-dts-v1-0-895f8fc494fc@axon.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP3e0GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwMT3aIk0/TUPCPdlJJiXUMLg+SUVIMkc0OzZCWgjoKi1LTMCrBp0bG
 1tQBwNxKLXQAAAA==
X-Change-ID: 20260404-rb5gen2-dts-180cde0b716c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joe Sandom <jsandom@axon.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775296270; l=1631;
 i=jsandom@axon.com; s=20260319; h=from:subject:message-id;
 bh=pf7w5tEPxeOOou+A5EAQoMnY3SiSO2iuLXfRP9MTBGw=;
 b=PQNR4qc+QRQmaWCTDKAfsavia3smfw0tdbcQvNnxWMbOcp6cpL75Jrot+IXFhLwx4GSnnE5Ck
 Ud+/OLc1uv8BwQly/+AOlIvjKgEToO+yCc3VqDqMBiYYqWQM+cNPUF+
X-Developer-Key: i=jsandom@axon.com; a=ed25519;
 pk=Q/yflwj2WhkgBVTskrS9Vl5oScD0Bp3vTzDi+OxskTo=
X-Endpoint-Received: by B4 Relay for jsandom@axon.com/20260319 with
 auth_id=687
X-Original-From: Joe Sandom <jsandom@axon.com>
Reply-To: jsandom@axon.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101756-lists,linux-arm-msm=lfdr.de,jsandom.axon.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	HAS_REPLYTO(0.00)[jsandom@axon.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[axon.com:email,axon.com:replyto,axon.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,thundercomm.com:url]
X-Rspamd-Queue-Id: 5335139A98D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds device tree support for the Thundercomm RB5Gen2
development kit, based on the Qualcomm QCS8550 chipset.

Patches 1-3 prepare the SM8550 device tree by adding MHI register regions
and port labels to the PCIe controller nodes, then update the existing
HDK and QRD board files to match the renamed labels.

Patches 4-5 add the dt-bindings documentation and the board device tree
for the RB5Gen2. This initial submission covers the main board; the vision
mezzanine will be supported in a follow-up series.

Product page:
https://www.thundercomm.com/product/qualcomm-rb5-gen-2-development-kit

Signed-off-by: Joe Sandom <jsandom@axon.com>
---
Joe Sandom (5):
      arm64: dts: qcom: sm8550: add PCIe MHI register regions and port labels
      arm64: dts: qcom: sm8550-hdk: update PCIe port label reference
      arm64: dts: qcom: sm8550-qrd: update PCIe port label reference
      dt-bindings: arm: qcom: document QCS8550 RB5Gen2 board
      arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2 board support

 Documentation/devicetree/bindings/arm/qcom.yaml |    6 +
 arch/arm64/boot/dts/qcom/Makefile               |    1 +
 arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts    | 1610 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts         |    2 +-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts         |    2 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi            |   14 +-
 6 files changed, 1627 insertions(+), 8 deletions(-)
---
base-commit: af241225893ac4933bb8f0615f2dfda8ea2326ce
change-id: 20260404-rb5gen2-dts-180cde0b716c

Best regards,
-- 
Joe Sandom <jsandom@axon.com>



