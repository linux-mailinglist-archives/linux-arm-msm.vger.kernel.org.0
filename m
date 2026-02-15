Return-Path: <linux-arm-msm+bounces-92873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGYwJWsmkmmGrQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 21:02:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B0713F913
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 21:02:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 435163016535
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 20:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0BA27280A;
	Sun, 15 Feb 2026 20:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DChgquxl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723F0236453;
	Sun, 15 Feb 2026 20:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771185762; cv=none; b=ZPbaYJoM95+XdySYJfHtIuLu5SaHD7G3FhU8eefm5V0+ME9UaxsXGqqjnm0W6CtWa9wIhwqk6YRK57YAkyeAd4MAuQIlGvFZqprFR6lt1YGq5+L6N62BG9FlnchFjyfOdJjYMFdzeZ2l2yMzETCZcPkvvnw1WREWSxOtto4KIZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771185762; c=relaxed/simple;
	bh=proQ2lVOeY8Ifp0RN4ZSzNk9g+lN71uVKJ7QJ4Aj5vY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WeaMg/Beuset6f1R+9VNZxeZddaUDm5IIN3u7kLhonFAGxFth4kuigTt5bgGP/XtmlC2nmZjz72zxHDJQXNDIN2HbgqTzPw9sbJTtAOj4Z77G76EbYYPLdXXjkslU/Wee0al+SVjDS7u3dqetvZEUraM1H3b1+kIYKYbIQY+Xrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DChgquxl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D685C19425;
	Sun, 15 Feb 2026 20:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771185762;
	bh=proQ2lVOeY8Ifp0RN4ZSzNk9g+lN71uVKJ7QJ4Aj5vY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DChgquxlqzCdSTNx9DSEXT4psz6jdGZhAU9Bi9SgQgC19Apyx9xVenDfY7Bkt5BBz
	 tSn5d7hwRuOo8EEcd294yDDF8ZbEKGlA1DUPIArTRe0tJdHDEmbdx9k+D3g/+WPYme
	 QkSrwkYQA2FSgmtVZHvRoz9mT71F6zcUNZUzMcH9NvIgHkaThUAyvqGw8q+6wzDgOk
	 tl+e4uihSKOnxrAQNgq+LxF0SLmw2FTvtdo5+31CuRFCIPFkMYl4qUiUeVftHiqD2J
	 MYQ0Gd/sAx0VxHCnQH8fzdX26+sU8LUiEyPjSQ8+9xHJh8IX+bvEMiEpbYpEwg5RPO
	 0LCEC4i8GGTdw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F36E63F12;
	Sun, 15 Feb 2026 20:02:42 +0000 (UTC)
From: Paul Adam via B4 Relay <devnull+adamp.posteo.de@kernel.org>
Date: Sun, 15 Feb 2026 21:02:01 +0100
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: add WIKO SAS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260215-wiko-chuppito-v1-1-9ee6b89606a0@posteo.de>
References: <20260215-wiko-chuppito-v1-0-9ee6b89606a0@posteo.de>
In-Reply-To: <20260215-wiko-chuppito-v1-0-9ee6b89606a0@posteo.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Paul Adam <adamp@posteo.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771185760; l=782;
 i=adamp@posteo.de; s=20260215; h=from:subject:message-id;
 bh=WxaLDx/r7/v6qmLwcXM2Ea/I3b4jXeW05Xoj4K0hxkk=;
 b=kUK1sfAW3zrDZM+vYudoBiqdtU6H3zPbIwc8WYEpJKJpNe8IGXYVSTTluTEifeMJLgbCAgmiH
 xl+L1WhETtjAE9iBG3tKcEWXkFwvFOkFKxlRFr08Oe74x832U4xZ2kZ
X-Developer-Key: i=adamp@posteo.de; a=ed25519;
 pk=mtrPhSn7htywc4S5zrKNrWM6laAdfnaJzIs0BDiCyAs=
X-Endpoint-Received: by B4 Relay for adamp@posteo.de/20260215 with
 auth_id=640
X-Original-From: Paul Adam <adamp@posteo.de>
Reply-To: adamp@posteo.de
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92873-lists,linux-arm-msm=lfdr.de,adamp.posteo.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[adamp@posteo.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:mid,posteo.de:email,posteo.de:replyto]
X-Rspamd-Queue-Id: 38B0713F913
X-Rspamd-Action: no action

From: Paul Adam <adamp@posteo.de>

Wiko is a french smartphone company: https://wikomobile.com

Signed-off-by: Paul Adam <adamp@posteo.de>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index edbce100cae4..187089eef983 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1819,6 +1819,8 @@ patternProperties:
     description: Wi2Wi, Inc.
   "^widora,.*":
     description: Beijing Widora Technology Co., Ltd.
+  "^wiko,.*":
+    description: Wiko SAS
   "^wiligear,.*":
     description: Wiligear, Ltd.
   "^willsemi,.*":

-- 
2.52.0



