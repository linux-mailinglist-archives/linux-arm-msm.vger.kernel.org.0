Return-Path: <linux-arm-msm+bounces-92620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIWAJrTojGnquwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 21:38:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DFE127731
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 21:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C9C4303AF3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 20:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005CF347FF8;
	Wed, 11 Feb 2026 20:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dm9MeB6e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF53A1632E7;
	Wed, 11 Feb 2026 20:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770842284; cv=none; b=egpIu0hTFgLV8uTSlaKg7b41WUgSnQ2znrVPtHXtv9YOlgPzo8oPnpZIDIcntQfU8sU6hJ624gdvM0tls4rLbWnerfTSBHtJ+k+WJr0sU5OI6uH5SW5bCS1GE7y9CzwHkeHQRNohCeVzWeLqRrvFmmkB5bhPYbNw926qyvQxrc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770842284; c=relaxed/simple;
	bh=9uy3ca8jBm4QbhCLimg5w0X3oo5zFuFyi86NaLP6fms=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T2VoK9jJK7/gbvKEvMFy8TM3MPzGAKeKknVlLSyHt2LVNmIDSS8B1vYaG5TXCOQu5fhV9+i1cIsv4ZazcN8UUrINMd1GXYMSJ2BnMCIk+S9zXJ6T3dRli96Ti4GgngETvY3CjlEJ2bMCnNFiHIKwo7K05C/hHiDMwBdjMA3DB8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dm9MeB6e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31C17C4CEF7;
	Wed, 11 Feb 2026 20:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770842284;
	bh=9uy3ca8jBm4QbhCLimg5w0X3oo5zFuFyi86NaLP6fms=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Dm9MeB6eqPXzl1dkWDVKzMolPdB5H5JFLefZCyQvL2JKGXRs+JQRh+ur77m8bML8I
	 o02qGg9ELnwmY1H/t5/BP0BHXeldcdw4hCkGi7mzp8+HlN1/fzKHlSrr77XECecXpu
	 bkuEXbtGi0sDfiakD3kCBl+SNDZ9TEVM6KASebYLLLNg08LSGR7EX6mcIcCbWFpYU0
	 h0NTtigZ2OWfip/mw1w13yVUAejGuM3WrWCN4R52e0bwxpiOoLEB4Rq2Nr/tKw0F1n
	 MQ+7EzmbDAeGlmC3vGjiOwpwp24T7Q5VZHt8MUyCXsI4GpQ0tXnY0vaM0W3HHLgh7z
	 ZPslE4ZNhlleg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 089AFECD6EB;
	Wed, 11 Feb 2026 20:38:04 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH v2 0/4] arm64: qcom: x1-vivobook-s15: add X1P42100 variant,
 restructure dts files
Date: Wed, 11 Feb 2026 21:37:49 +0100
Message-Id: <20260211-b4-vivobook-v2-0-9f500415d2ed@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ/ojGkC/1XOwQ6CMAzG8VchPTuzDUbAk+9hODAo0kioWXFRC
 e/uxJPH/5f0l64gGAgFTtkKASMJ8ZzCHjLoxna+oqI+NVhtS21MpXyhIkX2zDfVa+eKEgfsKgv
 p4h5woOeuXZrUI8nC4bXj0XzXn2P1vxON0ipva+/QuLzW9ZmnXrqReRKeHkv6SY6e3tBs2/YBp
 p09PbMAAAA=
X-Change-ID: 20260118-b4-vivobook-d05546efec82
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maud Spierings <maud_spierings@hotmail.com>, 
 "Colin K. Williams" <colin@li-nk.org>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770842282; l=1861;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=9uy3ca8jBm4QbhCLimg5w0X3oo5zFuFyi86NaLP6fms=;
 b=rBTWjNNgm4TS99uGK0CrMOQ+a1eabNWPOQXA1/1fYcQy/TpENKM3zKzsd1pI9gRhKnk0x2ZBf
 PsOuvBo8qAnCV7L5HgoRBSLtwPNsgtewOkoIW669r3+MjC5BGUyNwKR
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92620-lists,linux-arm-msm=lfdr.de,jens.glathe.oldschoolsolutions.biz];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,hotmail.com,li-nk.org,oldschoolsolutions.biz,oss.qualcomm.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[jens.glathe@oldschoolsolutions.biz];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oldschoolsolutions.biz:mid,oldschoolsolutions.biz:email,oldschoolsolutions.biz:replyto]
X-Rspamd-Queue-Id: F3DFE127731
X-Rspamd-Action: no action

This patchset adds the X1P42100 variant of the ASUS Vivobook S15 [1]. To avoid
redundant code, it pulls the part that is identical to both variants into
x1-asus-vivobook-s15.dtsi.

I have maintained the X1P42100 variant on my tree for about a year now, it has
been tested by quite a few users. Also added sound (not in this patchset) and
users operate this successfully.

[1]: https://www.asus.chhdakhdkom/de/laptops/for-home/vivobook/asus-vivobook-s-15-s5507/techspec/

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
Changes in v2:
- Fixed the bindings mixup and the redundant gpu node in the Purwa dts
- Re-partitioned the patch set to have no new dangling file
- Rebased onto next-20260210
- Thanks to all that commented on the patches.
- Link to v1: https://lore.kernel.org/r/20260208-b4-vivobook-v1-0-3a9b5e153909@oldschoolsolutions.biz

---
Jens Glathe (4):
      dt-bindings: arm: qcom: Add ASUS Vivobook X1P42100 variant
      firmware: qcom: scm: allow QSEECOM on ASUS Vivobook X1P42100 variant
      arm64: dts: qcom: x1-vivobook-s15: create a common dtsi for Hamoa and Purwa variants
      arm64: dts: qcom: x1-vivobook-s15: add Purwa-compatible device tree

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    2 +
 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi | 1357 ++++++++++++++++++++
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 1347 +------------------
 .../boot/dts/qcom/x1p42100-asus-vivobook-s15.dts   |   43 +
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 6 files changed, 1405 insertions(+), 1346 deletions(-)
---
base-commit: fd9678829d6dd0c10fde080b536abf4b1121c346
change-id: 20260118-b4-vivobook-d05546efec82

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



