Return-Path: <linux-arm-msm+bounces-95989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0I3zNRBfrGmlpAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 18:23:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1CE22CF10
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 18:23:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60E9D301A507
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 17:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A82D332EC5;
	Sat,  7 Mar 2026 17:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k4sEcLw9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD2531E833;
	Sat,  7 Mar 2026 17:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772904204; cv=none; b=NnpMfRubQQaUFglpuwV86fbSmBBc4prxHYJpz1En5ys0IfZdl+4KTZlzH+4pb5WwqMlqOBCiKclptXFUro0Mn5bPu/zOkrguOEH0RGxLAHTJMdEPO1BxXHF5j1Xv41lhBi9c9ywxSc3XZf+VinaZXh8kL2bl708BXE10MHKUHEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772904204; c=relaxed/simple;
	bh=dQI5AaRN9kQoOur5mR9n344XaBUPCGCsHOMIOiHYfZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X22AxCXlNngK8tTPraCtJeB6BSuxusKR9d0GH5/TWGtquWpFGR47s21ihyA9NnQXQXoeVpAuwjdWTkVFWXeKcE5l+lfEwPESlKjG72YFhvwUwJV2CfMy+iyEYcMdBdCmkXOtu0cC7i5zBuZy5akWwWwiMDav/ikeJNk573K/d1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k4sEcLw9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C92FBC2BCB1;
	Sat,  7 Mar 2026 17:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772904203;
	bh=dQI5AaRN9kQoOur5mR9n344XaBUPCGCsHOMIOiHYfZM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=k4sEcLw9esOC3PWOhrG8GpE7A2bYBbLL1j1wmAPCDYprsJjwdhOnQEB3/Ck+/kgMp
	 aU7M82Kmlo/S48J/Qf3SQ8qAwJTwdyEC8R7Rak6sRNwFmi0Y2kTQcoKt47KhjXnOrI
	 AK2zHYCiScDo3g+TOCsJlelUwRPfZn3WXSboQJd/7bceW8wtjv2UT8QAs7lmhKUTaP
	 6byaOszgyvp2FOG3gV4eZWz3rWiNf92ERRCbwVWPFQqrxyUxHqnFDKyskkqePop5zc
	 PgHkKI6ssx7gbLWIWS0BQgCWp6wguRTEtOaKtMRLOHngS082+LEMdOcKHptwRdL+CF
	 ByYWUr0TQjC5A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0205F55106;
	Sat,  7 Mar 2026 17:23:23 +0000 (UTC)
From: Paul Adam via B4 Relay <devnull+adamp.posteo.de@kernel.org>
Date: Sat, 07 Mar 2026 18:23:11 +0100
Subject: [PATCH v4 2/3] dt-bindings: arm: qcom: add wiko,chuppito
 compatible string
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-wiko-chuppito-v4-2-325ac66ae338@posteo.de>
References: <20260307-wiko-chuppito-v4-0-325ac66ae338@posteo.de>
In-Reply-To: <20260307-wiko-chuppito-v4-0-325ac66ae338@posteo.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Paul Adam <adamp@posteo.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772904201; l=811;
 i=adamp@posteo.de; s=20260215; h=from:subject:message-id;
 bh=L22ne3Q6rMpTpkTkP/rKSYuGR0NhqH7BLqT9DvYenoM=;
 b=ndIZKgAzgzs/nKprlv8U5OlJZrvAL5Azob9ZJmJkSAsyjGc8sr7z+2QLNl+Izui0p5LA6nvm6
 ikamgrb4DJ7BuNXeHYxytDuKtvW8p+0FEdgyy8I4KIbREHOX5pwxInt
X-Developer-Key: i=adamp@posteo.de; a=ed25519;
 pk=mtrPhSn7htywc4S5zrKNrWM6laAdfnaJzIs0BDiCyAs=
X-Endpoint-Received: by B4 Relay for adamp@posteo.de/20260215 with
 auth_id=640
X-Original-From: Paul Adam <adamp@posteo.de>
Reply-To: adamp@posteo.de
X-Rspamd-Queue-Id: 8F1CE22CF10
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95989-lists,linux-arm-msm=lfdr.de,adamp.posteo.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[adamp@posteo.de];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.980];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:replyto,posteo.de:email,posteo.de:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

From: Paul Adam <adamp@posteo.de>

Add a compatible for Wiko PULP 4G, a phone from 2015.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Paul Adam <adamp@posteo.de>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..c9525b61f8ff 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -186,6 +186,7 @@ properties:
               - samsung,serranove
               - thwc,uf896
               - thwc,ufi001c
+              - wiko,chuppito
               - wingtech,wt86518
               - wingtech,wt86528
               - wingtech,wt88047

-- 
2.53.0



