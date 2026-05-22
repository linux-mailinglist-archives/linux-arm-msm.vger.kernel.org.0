Return-Path: <linux-arm-msm+bounces-109248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIi2By81EGqqUwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:51:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D49F65B27D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:51:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1D5A30CE0CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 10:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A003D3334;
	Fri, 22 May 2026 10:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2pQjDKv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B953CDBD8;
	Fri, 22 May 2026 10:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779446625; cv=none; b=hjvjilrPPKmzPAGVjiDpa7iyPXt27vhjuVXtT33Xsqq2Q52TOwVfneqiTKoatqJGoir4P/Gw8zNksMyYJgnC0Ys1nz51/vrsUAjZxT4Hq9muo5+wSXjHuRTDA0NOqGh/aZlHOmyhjKRIv+kINDpc3ZZQwzEZLknGxIFhQWJW9dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779446625; c=relaxed/simple;
	bh=irxIhZ6k1GrtmGJb1YpRm0XRzp3/Js4t6j+aLIg3dKs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TlpvrXUEg+pvBXQ7IdY6Bhrk1Ulf7Gleb4VM4mnXHXIQgCmn4WUriL6xgRyZDw6l1BV40kMWpszOIRsNQ7RdTV9SnIVFV7cvVjl/7lTXuvOUTVjWE6xka3QQ9ZHUTfGJcY/FUxJGD9GYBn2Nl5OlqDF4u5ejeJftMc/JIZKg440=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2pQjDKv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11918C2BCB8;
	Fri, 22 May 2026 10:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779446625;
	bh=irxIhZ6k1GrtmGJb1YpRm0XRzp3/Js4t6j+aLIg3dKs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=M2pQjDKvmtEH/3ulRVdQgMU01Lq1QXf/WdiMYLkRJ5ogwSzPO4Iielhu0HLJas0TN
	 V7xhUyg5VfzMVXBEx9kD8vYbGEjOPBCctNYGZnO/liQVa+1drv2PZ6vKWmJaSmgqaP
	 wMeBE+Uw8maJxoKNfd8e3xAy6/WX1Ag6Da3eGmjrHfK4kvadYpVB9FA5umPC76+nJ0
	 cliCmR8MxpNCw/zWwz/3uWTX+l5h9aPADM2z8kWn3peKKvz3gYhaLGZvSKn88Cu6Q+
	 DDzS1xu/T5qYkhxzSEQ+U/lop6x0Joe+KpmiKbKVgwZ5Z00oWP3BEKg7o9qIuqhVlb
	 cx0tFyM6jFPzQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07598CD4F5B;
	Fri, 22 May 2026 10:43:45 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Subject: [PATCH v2 00/10] Microsoft Surface Pro 9 5G update
Date: Fri, 22 May 2026 12:43:16 +0200
Message-Id: <20260522-surface-sp9-5g-for-next-v2-0-dd9d477407f5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEQzEGoC/4WNQQ6DIBBFr2JYdwydlKJd9R6NC8BBSSoYsMTGe
 PeiF+jyJe+/v7FE0VFij2pjkbJLLvgCeKmYGZUfCFxfmCHHOxfIIX2iVYYgzS2IAWyI4GldQDa
 tNFpze0PDynqOZN16ll9dYa0SgY7Km/HoZVnzQxtdWkL8nv/5esj/r/IVOLS9FSgEatvI5zAp9
 65NmFi37/sPHhuR8tUAAAA=
X-Change-ID: 20260520-surface-sp9-5g-for-next-7897cbb0f42c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779446623; l=1924;
 i=jerome.debretagne@gmail.com; s=20260520; h=from:subject:message-id;
 bh=irxIhZ6k1GrtmGJb1YpRm0XRzp3/Js4t6j+aLIg3dKs=;
 b=NOSLd7sF2MWxhkxnaNfms5y9agY3AwNtPGV7zT1dRmJiAcXdQ203Em7hbWMboSng7PkErw+m+
 Csz/RtuLHRTA6xgdWtNf4E+zboFeu7DU4+N9Sd0GfXEocwx4d8t74xT
X-Developer-Key: i=jerome.debretagne@gmail.com; a=ed25519;
 pk=3/JYhgYjGg5V9mlFxc0A0+pFiyjsuDB/TtDlNMId9fk=
X-Endpoint-Received: by B4 Relay for jerome.debretagne@gmail.com/20260520
 with auth_id=785
X-Original-From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Reply-To: jerome.debretagne@gmail.com
X-Spamd-Result: default: False [1.93 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.59)[subject];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109248-lists,linux-arm-msm=lfdr.de,jerome.debretagne.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.993];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,oldschoolsolutions.biz,oss.qualcomm.com,linaro.org];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[jerome.debretagne@gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D49F65B27D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series updates the support for the Microsoft Surface 9 5G
(Arcata), bringing it more up-to-date and aligned with the other
sc8280xp models such as the Lenovo ThinkPad X13s.

As highlights, it finally enables the built-in screen, it fixes
Display Port alt mode on the top left-side USB-C port, it enables
the volume up/down keys and the lid switch.

Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
Changes in v2:
- The panel-edp patch was accepted as a subset. Removed from this series [Doug]
- Update the backlight patch to keep only the necessary nodes
- Add R-by: tags and move a Fixes tag [Konrad]
- Strip details from the "Enable the eDP display" commit message [Konrad]
- Fix misleading commit message about USB-C orientation [Konrad]
- Link to v1: https://lore.kernel.org/r/20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com

---
Jérôme de Bretagne (10):
      arm64: dts: qcom: sc8280xp-arcata: Enable backlight
      arm64: dts: qcom: sc8280xp-arcata: Enable the eDP display
      arm64: dts: qcom: sc8280xp-arcata: add USB-C orientation GPIOs
      arm64: dts: qcom: sc8280xp-arcata: Fix top USB-C DP alt mode
      arm64: dts: qcom: sc8280xp-arcata: Enable 4-lane DP support
      arm64: dts: qcom: sc8280xp-arcata: Add volume up/down GPIO keys
      arm64: dts: qcom: sc8280xp-arcata: Add lid switch
      arm64: dts: qcom: sc8280xp-arcata: model the PMU of the on-board wcn6855
      arm64: dts: qcom: sc8280xp-arcata: Switch to uefi rtc offset
      arm64: dts: qcom: sc8280xp-arcata: Drop duplicate DMIC supplies

 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    | 279 ++++++++++++++++++---
 1 file changed, 243 insertions(+), 36 deletions(-)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260520-surface-sp9-5g-for-next-7897cbb0f42c

Best regards,
-- 
Jérôme de Bretagne <jerome.debretagne@gmail.com>



