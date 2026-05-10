Return-Path: <linux-arm-msm+bounces-106825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EqQtI/CsAGpMLgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 18:06:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E99F504FA0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 18:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 056A53002505
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 16:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783313ACEE3;
	Sun, 10 May 2026 16:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DG8I9DV2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7BD3ACA6A;
	Sun, 10 May 2026 16:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778429161; cv=none; b=pTGYq/F2fVTfet3oISDS1sNDl8aWUcJQb2mnqu7wjV1lIu90GSDGTfRdRIc4//wGSRLyq9QFTB4BnpxggNcorx7IwTZ50i80njxYTnvJQlPn7qd/zSxydHJvJF/CHH0qLhtEzzji/9iC7KOVWGaAq94WSMAQjIMYmYyig2FiC04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778429161; c=relaxed/simple;
	bh=zWM0yjWhrBGeyNEsiYlhIjWmf8MR0q9DFMYfprO6DpQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lt6ewYcVSuWDL816Akf2WJ0LgERZfbmVYWFLPGW3AmOSDGCrb4sjbk94hzibjezztKS0xnJN65yQhpqNswz9RyiEvsGxaNTyFhP9ZLxQoIsIen5bvjk0BQL6G0YCgkmT7QDQXiSifRlTjL0ywLaIpV2B9Yk5L6wZFNFB//najHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DG8I9DV2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE9F0C2BCFA;
	Sun, 10 May 2026 16:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778429160;
	bh=zWM0yjWhrBGeyNEsiYlhIjWmf8MR0q9DFMYfprO6DpQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=DG8I9DV2QdCtrpKsYOtl51qqd+m5rjCh12nh6LXvS5HRu/KCqWIJJPUSK1F6e+yMJ
	 0F1JYD1beooKWmOr+eqGNZqVJXmka536TCtVtkvCNaIUg7IsOVtAtrviMb/35J6Tff
	 ay/MjV2l2et62wFm5xuUyPVV5/ebeAF5azBJorIpf2SH2F765lmTYrS2AKtnK8GsvL
	 1J2ci1pO3ju1OUEEj24CpASjumYMuO7T1H1hcUwqlN4M5hYgZzFoeI1jYONWNw5KCM
	 VlhycbYqfQywi/TZsCGqZQM76p+yjeb/haywdN4zcpq1PxHJF2kgys6e5dc9oiqQj5
	 9DcJB4Kv+2uVw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6300CD37B2;
	Sun, 10 May 2026 16:06:00 +0000 (UTC)
From: Alexandre Hamamdjian via B4 Relay <devnull+azkali.limited.gmail.com@kernel.org>
Subject: [PATCH 0/2] arm64: qcom: add Ayaneo Pocket DS gaming console
Date: Sun, 10 May 2026 23:05:55 +0700
Message-Id: <20260510-pocketds-v1-0-cf05acec06af@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpAQBSE4VfRuba1CK1XkQvW4FBoD1Ly7haXX
 /0zFwkcQ6gILnI4WHiZPaIwIDvUcw/FrTfFOs50Gmm1LnbC1oqCRt4YY7skM+Tz1aHj87sqq9+
 yNyPs9u7pvh9tj0WwbAAAAA==
X-Change-ID: 20260510-pocketds-e0e7b99cf369
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Alexandre Hamamdjian <azkali.limited@gmail.com>, 
 Teguh Sobirin <teguh@sobir.in>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778429157; l=1248;
 i=azkali.limited@gmail.com; s=20260510; h=from:subject:message-id;
 bh=zWM0yjWhrBGeyNEsiYlhIjWmf8MR0q9DFMYfprO6DpQ=;
 b=pAr7WUGqunWuaodzubJ4K97YlUN6/wr7s/x78Tdh18R7mtAjc6EJbe0vIoF7nnuqe6MooiF2E
 JqqvhAk/kNeCDO+uA+uhpbJLwpl1cPbuiMJhevB43lJ2z35qlK4gVui
X-Developer-Key: i=azkali.limited@gmail.com; a=ed25519;
 pk=I0Z0IdCdQJqNGX+FQUnXhrHg950u3cM6Xzz3YT6JOyQ=
X-Endpoint-Received: by B4 Relay for azkali.limited@gmail.com/20260510 with
 auth_id=774
X-Original-From: Alexandre Hamamdjian <azkali.limited@gmail.com>
Reply-To: azkali.limited@gmail.com
X-Rspamd-Queue-Id: 7E99F504FA0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106825-lists,linux-arm-msm=lfdr.de,azkali.limited.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,sobir.in];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[azkali.limited@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

This series adds initial support for the Ayaneo Pocket DS, a handheld
gaming console built around the Qualcomm QCS8550 SoC.

This introduces the device tree itself, split into:
- qcs8550-ayaneo-pocket-common.dtsi: shared QCS8550 board base
  intended to be reused by future siblings in the same family.
- qcs8550-ayaneo-pocketds.dts: This device's DTS

Only the basics are wired up at this stage (boot to console, core
peripherals enabled in the common dtsi); additional functionality
will follow in later submissions.

Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
---
Teguh Sobirin (2):
      dt-bindings: arm: qcom: document the Ayaneo Pocket DS
      arm64: dts: qcom: add basic devicetree for Ayaneo Pocket DS gaming console

 Documentation/devicetree/bindings/arm/qcom.yaml    |    6 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../dts/qcom/qcs8550-ayaneo-pocket-common.dtsi     | 1596 ++++++++++++++++++++
 .../boot/dts/qcom/qcs8550-ayaneo-pocketds.dts      |  170 +++
 4 files changed, 1773 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260510-pocketds-e0e7b99cf369

Best regards,
--  
Alexandre Hamamdjian <azkali.limited@gmail.com>



