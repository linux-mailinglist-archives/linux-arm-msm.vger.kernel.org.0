Return-Path: <linux-arm-msm+bounces-96885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKIgGMcPsWlwqQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 07:46:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 411D025CF68
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 07:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C0AF930379C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903422D2496;
	Wed, 11 Mar 2026 06:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p6RAbRP9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A15295DAC;
	Wed, 11 Mar 2026 06:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773211586; cv=none; b=bxdzQc5OrDPAt7z3pktlsW4hhc/7zRmAxWRfLe6R52k9UYO6R9szBjIrIv7kykJBpOEYwfjV7kTlXVrQZ1yEHXr7bfg7RUfwlMJmAxe2T3CQUzwzfmLM04Dt+FkV96OhGQZ/j9wQ+XKGdPmj2dJlf9mKqsnd4p9YLDKXsfn/WJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773211586; c=relaxed/simple;
	bh=rB99ecEotGCkphZ8eWraRpsWMoAZ5MBKddrud5VAW7I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CwU7EqG0t64ny8HPGbs+lGFEZgAuFyBn3ZLHIldgctpq5oEa7L+s+044JEnMkCv2o7g/1GfGkBuwAwcD9JYPl10q0N/O9fBRzaJfjocid7qs0XUApUa1l6hdozmy9MSEpnoc8sORC1bwEMsj6eIjHEhJfkRy3KC9pQN3dMU8pKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p6RAbRP9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16F90C4CEF7;
	Wed, 11 Mar 2026 06:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773211586;
	bh=rB99ecEotGCkphZ8eWraRpsWMoAZ5MBKddrud5VAW7I=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=p6RAbRP9NUHKpS6kqcr3DMBtMI9ZIoH78HAXAYkZXeJnkrgZ7lvMTwkZqtgF5QM+B
	 hc43dD4d5P0qq+ayVexmb90anOzWZP5oo3w+jCvCNq5ZFIcmFGhUUjsi9Xof0n49/t
	 jgA723W+aR1+ez9CtjF/iofcNxH1Dag2msx4FijWJJ2giLHzcXmriSIGGdrA9Fk/78
	 lFKYkEjRrsqHqu3d4K0Z+YbmIQ4wpLMikhbOMpTNKFo41sUpuaVwaZPcl9s8QcJ1T9
	 GaYg/HlRHvC112nfZFqPL/XVAF4zGbusNljDS4O/r4iVwW3JtTUMwD/TcbiA+swERi
	 EvL4yoEZdz9LQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C5E1FD062F;
	Wed, 11 Mar 2026 06:46:26 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH 0/5] arm64: dts: qcom: Support AYN QCS8550 Devices
Date: Wed, 11 Mar 2026 01:46:03 -0500
Message-Id: <20260311-ayn-qcs8550-v1-0-fe8b2faad1ea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OO27DMBAFryKwDgHuUruidJXABT/LhIWlmHTkB
 IbvHsZqUqScB8zD3FWTWqSpZbirKntpZVs7wMug4rtf30SX1FmhQTYIk/bfq77E5oiMBo5mCmy
 TIKtufFTJ5ev59no6uMrls59ej1EF30TH7Xwu12XIMouVFNgjEAElgNEli57iOFKkkNI0A2f1N
 2YZjhQ0z5Rd1rRV7YEssIs4B1x2+M+w0I2bc8Cs803PxobMkxhG+DVOj8cPDPGoHA0BAAA=
X-Change-ID: 20260217-ayn-qcs8550-16c07b63de26
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Teguh Sobirin <teguh@sobir.in>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773211585; l=2253;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=rB99ecEotGCkphZ8eWraRpsWMoAZ5MBKddrud5VAW7I=;
 b=NxlmJvOo8WdRXKVhPcg8tIJKmIFRzNKf6kTs/g7eXdiuDaB9xshDw0lJG5TRliqEAa7BwyqRL
 8PfMYTksVFaAWEAA70jZA1zdbmw5+zamS0z8mHkADLEtLpBYm4m1YnK
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
X-Rspamd-Queue-Id: 411D025CF68
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96885-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,sobir.in];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

This specifically includes:
* Odin 2 Mini
* Odin 2 Portal
* Thor

The original Odin 2 dtso is not currently included as it has not yet
been verified.

The initial port was done by Teguh Sobirin for ROCKNIX and was made
available on the AYN github [0].

Support has been removed for things not yet supported by the upstream
kernel, these will be added later when the related drivers are submitted
and picked up. Such includes:

* All panels
* The Odin 2 Mini backlight and touch
* All rgb leds
* The built-in uart gamepad

This series depends on two other series as described in b4 deps. Namely,
one adding the AYN vendor [1] and one adding bindings for firmware-name
in aw88166 nodes [2]. Both must be merged first for schema checks to
succeed.

[0] https://github.com/AYNTechnologies/linux/commits/sm8550/v6.17.5/
[1] https://lore.kernel.org/all/20260220-ayn-vendor-v1-1-292cbbb682b3@gmail.com/
[2] https://lore.kernel.org/all/20260310-aw88166-fw-v1-1-2777563bb673@gmail.com/

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Aaron Kling (1):
      dt-bindings: arm: qcom: Add AYN QCS8550 Devices

Teguh Sobirin (4):
      arm64: dts: qcom: Add AYN QCS8550 Common
      arm64: dts: qcom: Add AYN Odin 2 Mini
      arm64: dts: qcom: Add AYN Odin 2 Portal
      arm64: dts: qcom: Add AYN Thor

 Documentation/devicetree/bindings/arm/qcom.yaml    |   10 +
 arch/arm64/boot/dts/qcom/Makefile                  |    7 +
 arch/arm64/boot/dts/qcom/qcs8550-ayntec-common.dts | 1778 ++++++++++++++++++++
 .../boot/dts/qcom/qcs8550-ayntec-odin2mini.dtso    |  147 ++
 .../boot/dts/qcom/qcs8550-ayntec-odin2portal.dtso  |   79 +
 arch/arm64/boot/dts/qcom/qcs8550-ayntec-thor.dtso  |  223 +++
 6 files changed, 2244 insertions(+)
---
base-commit: fe9e3edb6a215515d1148d32a5c445c5bdd7916f
change-id: 20260217-ayn-qcs8550-16c07b63de26
prerequisite-change-id: 20260220-ayn-vendor-a153168c29b2:v1
prerequisite-patch-id: 042cab8f04748207ba5395dd0f23c445955aaa2b
prerequisite-change-id: 20260310-aw88166-fw-903bf67e0621:v1
prerequisite-patch-id: 07d4bb3f77ef2c2ab22b4c2875761e440156e241
prerequisite-patch-id: 0a9b339adadf6fd550bb9b74c163dc68dd2573d2

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



