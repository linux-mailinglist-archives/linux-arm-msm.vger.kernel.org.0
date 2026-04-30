Return-Path: <linux-arm-msm+bounces-105412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UI4bOBSj82ly5QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 20:44:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A24D4A71BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 20:44:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9CE930293ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 18:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B655A47A0C3;
	Thu, 30 Apr 2026 18:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TjVPxMVb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E7036495B;
	Thu, 30 Apr 2026 18:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777574630; cv=none; b=oYdOXIarQUvM6rcZ8PKo8jAmTuGqnA/mTtJsOqmwQIt4DNNoRoN+7jYeprwz21bjGScmwek2T5qIXQaPD0t5Xj8i8+PXmhxBX3Xscmuffl3w/2kfCNHQBecHD7CdpeoKls0GB0Cwy0bQ8K5yn7mCC8DRNldbxtv9bvnpUFEW7/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777574630; c=relaxed/simple;
	bh=owyYkRSPmgKR2r1SO/KyPS1mx+dKql64OAp/MSZ4IH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TDeEqFvlYoGiG27wBU7FUU/lxd1bazuyBuZrZ8IUWRoeGZCampGUpLDx9pkBqfxdkc8Zc8ZuV40Hq4Cy39OrNVRXVdTghypZiL+Er4zpVJCEO0tYK1wa5IllelDQ9QqmtS9s4Eke/uterqqI5v1XaL33fG78ifhYKLSqUM9otOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TjVPxMVb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 597EDC2BCB8;
	Thu, 30 Apr 2026 18:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777574630;
	bh=owyYkRSPmgKR2r1SO/KyPS1mx+dKql64OAp/MSZ4IH8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TjVPxMVbQtay0mw79bL45Jq3yQSjDkZJ4BO13IOdWUOf6yvAuUw4P8mgGjDlJ7Iff
	 z5qKGg3492k2cFvn0z/dIg0w28Ylt5uwzJdeSxzUDGzYHyv8bnyndntS6sJzTaG8fo
	 04/aVYXhqByuW+zoshjAN600cN3Engbb+IaEhq8AFbNhnVqhtbnsR9e3P+ezgzjd7H
	 z8FBJWP4Pa6Qu1B8cz+y5dOex5XP0nhYF2m0GxH8lhmxhFaiIXIJRdF1w+6fqO40gg
	 qO+NdqBk1hCZeWzzXazM1GDpT5pgQ6aOYhlb1lkgEteFsn4HznhlaVin81wT4vysEV
	 W5pQxfMYdgycg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A03CD13D3;
	Thu, 30 Apr 2026 18:43:50 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Thu, 30 Apr 2026 13:43:36 -0500
Subject: [PATCH v7 1/6] dt-bindings: vendor-prefixes: Add AYN Technologies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-ayn-qcs8550-v7-1-591a96735fa3@gmail.com>
References: <20260430-ayn-qcs8550-v7-0-591a96735fa3@gmail.com>
In-Reply-To: <20260430-ayn-qcs8550-v7-0-591a96735fa3@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Xilin Wu <wuxilin123@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777574629; l=950;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=gOQhZByrG6tU19fKVlrU7N5RaAgEuR2DnSgZYTk4CCU=;
 b=Njd7S5K3gooQDA9IF0izWSoLUH3yp4DnMFF14KzjCPT/6PUg88DdnW/7Kb2kdudZSCk3vUfaN
 Wvj1i/hfvQgBj3vpavsziOjotaK+8HDs0NOrt0hsoHouAjP7CgV3i4M
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
X-Rspamd-Queue-Id: 6A24D4A71BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105412-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,oss.qualcomm.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]

From: Xilin Wu <wuxilin123@gmail.com>

Add an entry for AYN Technologies (https://www.ayntec.com/)

Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7ba5..b891d6d41f198a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -225,6 +225,8 @@ patternProperties:
     description: Axis Communications AB
   "^ayaneo,.*":
     description: Anyun Intelligent Technology (Hong Kong) Co., Ltd
+  "^ayntec,.*":
+    description: AYN Technologies Co., Ltd.
   "^azoteq,.*":
     description: Azoteq (Pty) Ltd
   "^azw,.*":

-- 
2.53.0



