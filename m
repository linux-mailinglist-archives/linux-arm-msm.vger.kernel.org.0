Return-Path: <linux-arm-msm+bounces-107538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +F2tAehzBWocXQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 09:04:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0461253EA9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 09:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EF00830171CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 07:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 497923D0BE4;
	Thu, 14 May 2026 07:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xzd1pJ15"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238E73A6F1C;
	Thu, 14 May 2026 07:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778742242; cv=none; b=dtbeZcrFDWI6TReFtbHz8CfE2bWbwLyIXJ5YCgaNQkdPeCYHuEKOy7XwCfrKYLKiXztEaNs4Q8e3YAocbiL46xgLhymb07JTnXKqJEqdn7yTVh4hMnMKoZ6M12Eywlz244qEQt8PIUCZUo5kY+f8eOHAWtM5Ay71Grea7q3QEB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778742242; c=relaxed/simple;
	bh=gnBNB2f/S7tRA17HfkNyztEuzXrqrHY6BCF9ckDYP48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e5GfmLrtCaNgqPR9iiJL87z4qBwzrJuoEitvAEUh/kJjVJeGyA7h6JYHqjFAGhM1/KhNmlAkLbIIuYPC/rwZol5YREGnJTSXaUtNGS0TeUg8sFE6m8f4Wk9i41lZSqkIv5JNGnuYZBWAL8m7aBCwJSxYMQtiQPNNXPm0RPhC1uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xzd1pJ15; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3CEEC2BCC6;
	Thu, 14 May 2026 07:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778742241;
	bh=gnBNB2f/S7tRA17HfkNyztEuzXrqrHY6BCF9ckDYP48=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Xzd1pJ15eSBSN/5GwUPQXWlqBPYSDgGgtd2MlkJlTP8mJaUeGWww2i2KSv2cApewU
	 /7MVXabedbI8Fw8ZhDKA1u+ECJMmgiWUNVMGrjw9DSVuhEeAg7tGxOAHTxAJ7Oxpyg
	 Krv35TFv2updKCw5bOqI+J9W0CeE81j8kLZfZBq3RqPf8dHFL9LLY3NIy6qxZKUPlZ
	 +n7zufpNdZlK0iFtYOLDOS8n8STXk6lvgr4Q/Lb5cWl8W9k7Ok6pA2MdJwCmEyDP/L
	 qmC/hMD69tRp7vNSxYuVvM80asJtquzgFMvkN/8fys2F9bhlfh2ScQzVX4UEAWhLeY
	 zQ36+9Sn3A3qw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3937CD4F25;
	Thu, 14 May 2026 07:04:01 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Thu, 14 May 2026 00:04:00 -0700
Subject: [PATCH 1/3] dt-bindings: soc: qcom: saw2: Rename MSM8960 SAW2
 compatible to v1.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-expressatt_cpufreq-v1-1-487fd2d78859@gmail.com>
References: <20260514-expressatt_cpufreq-v1-0-487fd2d78859@gmail.com>
In-Reply-To: <20260514-expressatt_cpufreq-v1-0-487fd2d78859@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778742241; l=1155;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=kNjii0mqGqmFn4GGiHWFBoaRtbaipmmzXSF2oiS82cc=;
 b=oHPl67Wu2/1eEYL7Ap56R6la/LoJQOJlgUWbNVXT9BpjaTveGN63qmGT5W00v6e06kE2IVR5Q
 JB0al5j5FOODpa+vw1qPw7WDP2OEMQ/CeLcSbil6uAoeK3731gsNqkO
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com
X-Rspamd-Queue-Id: 0461253EA9D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107538-lists,linux-arm-msm=lfdr.de,guptarud.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Rudraksha Gupta <guptarud@gmail.com>

Rename qcom,msm8960-saw2-cpu to qcom,msm8960-saw2-v1.1-cpu to follow
the naming convention used by other SAW2 compatibles that include the
hardware version (e.g. qcom,apq8064-saw2-v1.1-cpu).

The MSM8960 uses SAW2 v1.1, the same hardware version as the APQ8064.

Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
index c2f1f5946cfa..ff0e2697a7c6 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
@@ -37,7 +37,7 @@ properties:
           - qcom,msm8939-saw2-v3.0-cpu
           - qcom,msm8226-saw2-v2.1-cpu
           - qcom,msm8226-saw2-v2.1-l2
-          - qcom,msm8960-saw2-cpu
+          - qcom,msm8960-saw2-v1.1-cpu
           - qcom,msm8974-saw2-v2.1-cpu
           - qcom,msm8974-saw2-v2.1-l2
           - qcom,msm8976-gold-saw2-v2.3-l2

-- 
2.54.0



