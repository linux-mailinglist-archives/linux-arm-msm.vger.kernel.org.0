Return-Path: <linux-arm-msm+bounces-92165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKc6HF7/iGkY0QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 22:25:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CE210A350
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 22:25:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 581633007F6C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Feb 2026 21:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99FD53491C8;
	Sun,  8 Feb 2026 21:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XwS+t1tz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C10248F5A;
	Sun,  8 Feb 2026 21:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770585947; cv=none; b=XFGxjf6X38isW760eL7qKCGXn6ZVH487QsZX7mwOIAPCmLZzo2rFnq4TSVfzTfJl1qG+tVUZLyfrrQtjpewal0v0gxZ2MM47ghQHBmIM7OmjTxx26cOHQsSoYWP6ihgIUTtysr0sxzIqZWHw6i41sYVkNW+VQvt5cpYNrDiiCrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770585947; c=relaxed/simple;
	bh=AErkvYvhoh0IZtGd3TEa/a8AWqYbTt0GVgZ4S8XP7Og=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y6Blv/+X1q5xxOXpm5SMi7QiG+1ucvujgga4See2e3tBZX45Gq9/nIzlQX3EAgbGCNODPkQLYTbcBp15bo9Os/mYfugp38dZvaeQkzRMHgb3JIbT6c2Sh2aAWSvzYzpA5xB0iV6QvLSMrjhox70l+T34lm0tpe3wIBRxvlZArV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XwS+t1tz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D5D2C4CEF7;
	Sun,  8 Feb 2026 21:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770585947;
	bh=AErkvYvhoh0IZtGd3TEa/a8AWqYbTt0GVgZ4S8XP7Og=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=XwS+t1tziUYwPrrMG/01ttQydHrWToIR+L18wCKiLPz+QGIp4HvUNqLYBWwZEHVXq
	 eGKtOqklLmVHwH1SWs9FPg0gVayDdQXhjjo9LscBikhRZZ6wuaO7Uo55CHw/i72VSG
	 YWLD3D+4Rzb9PkrSofWjbMy62NoNgjI6Lwv6/B12Rva5mlmcAEah3ZdGTClgwvc0hB
	 qsvUUJv0kEnLUdjjmwuqq11HUIauzX8eak+GmLigK/b1dyzFIuGqGnJ5l8HQiKLGoG
	 w+iGiKVQGuet5hZpktMRFKivtpSDvg/kk2wAllv9I1C26J/dCV5tvBIG9pH8rDlRaE
	 uy9IQMqkI2Tsg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 434B9EF06EE;
	Sun,  8 Feb 2026 21:25:47 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH 0/4] arm64: qcom: x1-vivobook-s15: add X1P42100 variant,
 restructure dts files
Date: Sun, 08 Feb 2026 22:25:37 +0100
Message-Id: <20260208-b4-vivobook-v1-0-3a9b5e153909@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFL/iGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0ML3SQT3bLMsvyk/Pxs3RQDU1MTs9S01GQLIyWgjoKi1LTMCrBp0bG
 1tQDABIfIXQAAAA==
X-Change-ID: 20260118-b4-vivobook-d05546efec82
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maud Spierings <maud_spierings@hotmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770585945; l=1539;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=AErkvYvhoh0IZtGd3TEa/a8AWqYbTt0GVgZ4S8XP7Og=;
 b=96tOpgcPUhlalmFO/TElWkBIoRbsxe9cel2IFIgVea7urX8+WuQbC7Q7XLDQ7jHbU9DJWbSbg
 jg95txZmNJ1BAEQcBRiAZuiqykRuD7AVQfxccc1IwAMV0/oxtNx3Pqz
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92165-lists,linux-arm-msm=lfdr.de,jens.glathe.oldschoolsolutions.biz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,hotmail.com,oldschoolsolutions.biz];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	HAS_REPLYTO(0.00)[jens.glathe@oldschoolsolutions.biz];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C3CE210A350
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
Jens Glathe (4):
      dt-bindings: arm: qcom: Add ASUS Vivobook X1P42100 variant
      firmware: qcom: scm: allow QSEECOM on ASUS Vivobook X1P42100 variant
      arm64: dts: qcom: x1-vivobook-s15: create a common dtsi for Hamoa and Purwa variants
      arm64: dts: qcom: x1-vivobook-s15: add Hamoa- and Purwa-compatible device trees

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    2 +
 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi | 1357 ++++++++++++++++++++
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 1347 +------------------
 .../boot/dts/qcom/x1p42100-asus-vivobook-s15.dts   |   47 +
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 6 files changed, 1409 insertions(+), 1346 deletions(-)
---
base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
change-id: 20260118-b4-vivobook-d05546efec82

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



