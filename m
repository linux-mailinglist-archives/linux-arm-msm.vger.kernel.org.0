Return-Path: <linux-arm-msm+bounces-105392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGiNFud+82nH4QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 18:10:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 733DC4A5696
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 18:10:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 98096303D22F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 16:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCA2246AF3C;
	Thu, 30 Apr 2026 16:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJeUz0a5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87017363085;
	Thu, 30 Apr 2026 16:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564992; cv=none; b=fXSGU3Cd7FLfzUelCytPh9AYeY+wRLfuQo76mY+RHLK1VOcX7YWfuH28E2KkZ8zkP/l8csQZmjEK+16eRWmhCOnLTG96cRfzwQsrQjHAItfhKqZFJDxptcExKJXrWSmwdeq+zVA57JCckAlWbx1+Yky5g0r4UMvXzQeLzGo6DPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564992; c=relaxed/simple;
	bh=owyYkRSPmgKR2r1SO/KyPS1mx+dKql64OAp/MSZ4IH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uYuaCinkiNU3t+BwsidMyO2DZLw4Qr1V/0dCmb+wXvgcYPWHTSOh4kPsEuhR0eIMCc5BgYANZhbgkfiH5JJiTb40ZPsKiVewHP1dNB7GkjDvczhgv33r/gsTSGPP2nfdc1RwcdiUrEUQiyEJZ+GYQtHlsZDAWY3GJ1GGbaa4rmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJeUz0a5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39071C2BCC6;
	Thu, 30 Apr 2026 16:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777564992;
	bh=owyYkRSPmgKR2r1SO/KyPS1mx+dKql64OAp/MSZ4IH8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HJeUz0a5Qf8rTa4qVKx6c40OxDPn/ZjUYRVnPJ7UGK2aAv6e69Pvt9ctGGN5AnJac
	 d/Hr5iC/6EB/MCMTzA3RunHu3t9VVtXSMFCm/f3YsNqmBjjDhHAKnYvInMcG+Rb2rA
	 0vTfnBw3OqGKHH0hwucAh3PfR83rMX2+VQ1Qwd0dyeRoxLVzIvnQzIXO3AqQS2/wXs
	 q1ZlnOctT6soKgi2JvzFzOHToTdtmGnNZDiXAbZ2UaEKsPEO0aLF/+vbuRGWIMR12j
	 ZwJlu3pzO2xfSSdRH8eou8Z+NW9ZpHIIwB6s/ytCBiyfmfxpLtt8ryOYeZGlZ2NBjh
	 8v5ei9n8Mgm6A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B141CD13DA;
	Thu, 30 Apr 2026 16:03:12 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Thu, 30 Apr 2026 11:03:04 -0500
Subject: [PATCH v6 1/6] dt-bindings: vendor-prefixes: Add AYN Technologies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-ayn-qcs8550-v6-1-06a7e7b54aaa@gmail.com>
References: <20260430-ayn-qcs8550-v6-0-06a7e7b54aaa@gmail.com>
In-Reply-To: <20260430-ayn-qcs8550-v6-0-06a7e7b54aaa@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Xilin Wu <wuxilin123@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777564991; l=950;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=gOQhZByrG6tU19fKVlrU7N5RaAgEuR2DnSgZYTk4CCU=;
 b=N9bzox8gY6UJcQse7qhvP3kdt6RRIfIv5YH0PJi8q+LdZ0n9ZRhKFXWlGzJWEuKnB92UbU5ok
 5+NxVSHT3G4Bx3v/GkzKmkF8boCKb+LG0qkfxVdKpg8ayl3NCU8CTmg
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
X-Rspamd-Queue-Id: 733DC4A5696
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105392-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ayntec.com:url]

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



