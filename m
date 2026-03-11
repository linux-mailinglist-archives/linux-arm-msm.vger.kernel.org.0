Return-Path: <linux-arm-msm+bounces-97040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YALjLRqqsWmzEQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 18:44:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A41982682A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 18:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 17BB8301BDCF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 17:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 561843E5573;
	Wed, 11 Mar 2026 17:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sd3/oEOD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30B23E51C3;
	Wed, 11 Mar 2026 17:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773251089; cv=none; b=ZmMFpSxWlHy7LcrBC/myoPDDz4kvfdJP2ujQSuCzQAu7KZJKFoPPJL1U3Y/skDxPHR5XTAPCfor2EXn0AfuKNHyAm4Mk19nCCGV57f9ewW3jrj0TjTYYgs5n+ciSRWJp81hsEvPv0pDHzj2pKWfK6QPx07PEv6+7MYSdK6TiZy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773251089; c=relaxed/simple;
	bh=DHrlRUrGIAsGAgBu1A4lPkHX7PV0jeBMaHF4PfPMRP8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b5wUL7hgaXDSXr6Qzr3dwWpUqX5hfu92y8bETae7VQqXGR/zj+n+DMdGN2vmzQHV0JjZphtNVTwcdHm1QfI622kMsaAnhPi4rp/4LMJ7Gf8gCQnClxNuWxzd3vY6Ag3B0cGlII+GrupkUkiV66cyiVt1BQKMLDZlbZ1OlUOcDg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sd3/oEOD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A0C7C19421;
	Wed, 11 Mar 2026 17:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773251088;
	bh=DHrlRUrGIAsGAgBu1A4lPkHX7PV0jeBMaHF4PfPMRP8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=sd3/oEODlVvpC/z5o7CSA81BN4zCXcRezVz1JFaEhU5vH/QWkCidhy4KSragrH0oq
	 1RoCXNDjR2dHaMb+MngFyrdfZXXEfnUb/Dyq8xeJvadalrSFNoA5398ICXF26Cgwoq
	 W2pp//p6mbbUlXx3h/xQGDEHS2d6TvQGbE9LF/T6GyVus26GEHloxX8qi2HTB+HDBV
	 x+h97H9u4jvtZfoL0GmjiN200pr8FNalf/AdFX/a8/vwUKj+JFSNcdK5nfx3FeUtsh
	 jIHeaO0WPn30g+nTCHx/QbQXEHyzj0GkXS3UWe2V3oIpfMOwWLCkdHkVohum2ruQHh
	 5tT1LB3gHL8lw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7130C112585A;
	Wed, 11 Mar 2026 17:44:48 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH v2 0/5] arm64: dts: qcom: Support AYN QCS8550 Devices
Date: Wed, 11 Mar 2026 12:44:36 -0500
Message-Id: <20260311-ayn-qcs8550-v2-0-e66986e0f0cb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WPzW6DMBCEXwXtua68C9jAqe9R5eCfdWKpQGJT1
 Cji3es4l/Y4I83MNw/InCJnmJoHJN5jjutSBL014C5mObOIvmggSUoSamHui7i5PPS9FKic1Fa
 1nklBSVwTh/hT2z5PL5349l1Kt5cJ1mQWbp3nuE1NGKUxPqBT2g22G9XokXtWvgteE2njreLOa
 /gLU9gqCsmKsvPi1yQM9i2qwdFoadoRnuuXmLc13eu1Yj3na7RF/PdiRyFF4MFSKDjI5uM8m/j
 1XjDhdBzHL56r29gkAQAA
X-Change-ID: 20260217-ayn-qcs8550-16c07b63de26
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Teguh Sobirin <teguh@sobir.in>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773251087; l=2199;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=DHrlRUrGIAsGAgBu1A4lPkHX7PV0jeBMaHF4PfPMRP8=;
 b=cE91nB4s1qND9l9JvQ+bXa4SZqjDNCqWkN7H5CqHMAwaxWYhzWxGrRhx9dI3xba66K/jZcb7X
 KsFqFfSIj9nC+3gCeMHBHfUmcP6wgIuD8Fd5P4hzL2/8n/2c2mS7TsB
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97040-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,sobir.in];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A41982682A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

This series depends on one other series as described in b4 deps. Namely,
the one adding the AYN vendor [1]. This must be merged first for schema
checks to succeed.

[0] https://github.com/AYNTechnologies/linux/commits/sm8550/v6.17.5/
[1] https://lore.kernel.org/all/20260220-ayn-vendor-v1-1-292cbbb682b3@gmail.com/

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Changes in v2:
- Drop awinic bindings dep as a duplicated patch already exists
- Change Co-authored-by tags to Co-developed-by
- Drop alias to currently unused uart15 in patch 2
- Link to v1: https://lore.kernel.org/r/20260311-ayn-qcs8550-v1-0-fe8b2faad1ea@gmail.com

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
 arch/arm64/boot/dts/qcom/qcs8550-ayntec-common.dts | 1777 ++++++++++++++++++++
 .../boot/dts/qcom/qcs8550-ayntec-odin2mini.dtso    |  147 ++
 .../boot/dts/qcom/qcs8550-ayntec-odin2portal.dtso  |   79 +
 arch/arm64/boot/dts/qcom/qcs8550-ayntec-thor.dtso  |  223 +++
 6 files changed, 2243 insertions(+)
---
base-commit: f90aadf1c67c8b4969d1e5e6d4fd7227adb6e4d7
change-id: 20260217-ayn-qcs8550-16c07b63de26
prerequisite-change-id: 20260220-ayn-vendor-a153168c29b2:v1
prerequisite-patch-id: 042cab8f04748207ba5395dd0f23c445955aaa2b

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



