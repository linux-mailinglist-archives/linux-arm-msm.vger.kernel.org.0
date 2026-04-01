Return-Path: <linux-arm-msm+bounces-101387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBNADTCBzWlveQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 22:33:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CB01E380358
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 22:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D38953070555
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 20:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D94A3364958;
	Wed,  1 Apr 2026 20:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kqXfuo6f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5553624CB;
	Wed,  1 Apr 2026 20:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775075534; cv=none; b=eDOX0zPe5Egu5kODaSyGysB80/JOQIJly9bGn9f7nqMInwkLyhz0SJ8jy04tlxUKmWiCAm1GkZUuE0V17CHR95GeZxvudDb2Uo0sKsdY7WdAFAroLethsgTjS6ymYAwlbt8O8q5HwgZPO6Dpk+/ejbGeuT6IOz0uOk2f1fvhxXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775075534; c=relaxed/simple;
	bh=yd6xIu1ELgN4dc0E5oWBea0q1TRYAi4cof/2S/O3510=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ix6YKz0uJPxFsnky2rIzVcGEJAgFOXizMxQfyDFhsxvZfuy9+A+KM3SZQm9E6SKdP3FEm0u/oYjdi4gemJ2Ram35wu8++sLX4C4LWlbeNzdbenOmVUgl+n+g108mCtzzrncOhwuArXewnMamKDjXXHBCXyaRzOS+Zj31Y20XSG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kqXfuo6f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5577EC116C6;
	Wed,  1 Apr 2026 20:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775075534;
	bh=yd6xIu1ELgN4dc0E5oWBea0q1TRYAi4cof/2S/O3510=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=kqXfuo6fMUuhkn14Q9TqZJ+z4aaay4Und4UcDyaWE82ZHfTxmlsMN4ilhkHcOtk/N
	 nb3MsmRXoaPTwdH/EkxWZD7v7H1xhNL7yJ/pTa8ZZRkCF4+dteaeQbMhRbIbQKxv9p
	 DKcJ4vqn+PF4tDx1F+iV6bCQ8WDzOWvp4GFeevpnCf+9VeyidX82ACmXU13OxtRrKM
	 hhQ5GCTOH3azH/oAJl9NjyPp2DD1KJi5vVS/0o1JAssSBWBclHRK+GBk1brxdvLOIg
	 4H6TN/jVY/p08m/0Dx+/t4vlTDHhLbnp+XTOzRqyoiAvvttXVWmF5xfaoPetxy3N0D
	 ibBNel3eXBhIw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E451076395;
	Wed,  1 Apr 2026 20:32:14 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Subject: [PATCH v3 0/4] Reorganize DTS and add fuel-gauge to
 samsung-expressatt
Date: Wed, 01 Apr 2026 13:32:12 -0700
Message-Id: <20260401-expressatt_fuel_guage-v3-0-9674cfc0b5a2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WS62obMRCFX2XZ390gjUY3U0rfoy1Glxl7iTdO9
 0ZC8Lt3vKYkaVOKfh1xzqfhjF7aicaepnbXvLQjrf3Unx9EmE9NW47p4UBdX0W3oMApY3RHT48
 jTVOa5z0vdNofliQmdLZyNhx8yq1kxcP908b99uOmR/q5CH6+XbaPaS5Hge++L6AEzrUq4mSpJ
 qshI0IOQaBBeY9VJ6+Mr+w3+O9oo6FCdBxMKVlnmSBU5ZIHQu8yW53IMpIr71MpepUKgwpKo2E
 Um4rG1grF+py9ZpvZmPAudRuTK1gmtsEqUyzZwh6BfMwaMGIonl2OocYPoi5IgckFlcUK2tuIw
 ioQIjnNBdFceaVeo8O14a37XfNZqpdGlH1TfTefl3K8p+du1Z0cRMwRfIlsvh6G1J/uynn48hH
 pryWWNNCY9nxK07FbsVMda4qR0aPVf9JymqgTMfTzrlndnY7tdbvHfprP4/P2iVa9rfc//2UbG
 0zVNVhw2cXXhzbiCq8UVP+kgIwb0UeAYLCyfku5XC6/AHX8UXbeAgAA
X-Change-ID: 20260331-expressatt_fuel_guage-465dfb3f87ab
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775075533; l=2567;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=yd6xIu1ELgN4dc0E5oWBea0q1TRYAi4cof/2S/O3510=;
 b=h60YI8+uFyz1L63WCxxYV0eYIQd880tYkAT6/Rc9VmB2D7eUtf+6ClHyGfSknxQJBxKEvCDTp
 qixT5SNt4hUBSpYD50/5d+8/j8jDSpOAXx9tHgT1Ou+W0zgICp4pwkU
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101387-lists,linux-arm-msm=lfdr.de,guptarud.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,oss.qualcomm.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.974];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CB01E380358
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Reorganized the samsung-expressatt DTS and msm8960 DTSI to be more in
line with mainline standards. Introduce GSBI5 I2C

Tested battery by doing `cat /sys/class/power_supply/battery/capacity`
in upstream Linux and comparing the value with downstream Linux. Booted
on upstream Linux first, as the upstream Linux seems to use a lot
more battery than downstream, and then put the battery into another
expressatt running downstream Android to compare values. There are
some slight differences, but overall seems to line up pretty well with
downstream.

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
Changes in v3:
- Flatten i2c pinctrl subnodes in msm8960 dtsi
- change comment format from // to /* */
- \n before status
- use interrupts-extended instead
- Link to v2: https://lore.kernel.org/r/20260401-expressatt_fuel_guage-v2-0-947922834df1@gmail.com

Changes in v2:
- Previous changes were based on some outdated dependencies. Update them
- Reorganized expressatt DTS
- Switch to GSBI5
- Link to v1: https://lore.kernel.org/r/20260331-expressatt_fuel_guage-v1-1-23d1d8526b69@gmail.com

---
Rudraksha Gupta (4):
      ARM: dts: qcom: msm8960: expressatt: Sort node references and includes
      ARM: dts: qcom: msm8960: Flatten I2C pinctrl state subnodes
      ARM: dts: qcom: msm8960: Add GSBI5 I2C controller
      ARM: dts: qcom: msm8960: expressatt: Add MAX17048 fuel gauge

 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 423 +++++++++++----------
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           | 171 +++++----
 2 files changed, 313 insertions(+), 281 deletions(-)
---
base-commit: e9ec05addd1a067fc7cb218f20ecdc1b1b0898c0
change-id: 20260331-expressatt_fuel_guage-465dfb3f87ab
prerequisite-patch-id: 6fdd0efa5eda512b442b885df80774d1a7037df7
prerequisite-patch-id: 12d296f83ccb1bdfb8d06a72e476bf51ae5f4e6c
prerequisite-patch-id: a970acf2080143f41ae0935dd2c57bb71f5bf338
prerequisite-patch-id: fd25fef58503c5e5cf742e79b124948c7f6b98d9
prerequisite-patch-id: 68603a680b24921759425fc289e61fc4435e5ccd
prerequisite-message-id: <20251205-expressatt-touchkey-v1-1-1444b927c9f3@gmail.com>
prerequisite-patch-id: 8de4de7909722ccaf385c4224f25a623eaa72c28
prerequisite-message-id: <20260331-expressatt_camera_flash-v4-0-f1e99f474513@gmail.com>
prerequisite-patch-id: ab8b8d87fd2d518c4c5b5dace3f22238d1abbe49
prerequisite-patch-id: 47e32e653e520a27770bb05d99135694b0128ba0
prerequisite-patch-id: 7ef7df61e7ef6476a35811d765f522f793d9ecc7

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>



