Return-Path: <linux-arm-msm+bounces-103000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CO+fMak93WmqbAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 21:02:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3CE3F25E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 21:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B53113010724
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 19:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CBAF3914F7;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tDAEj316"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623DB390CA1;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776106822; cv=none; b=jJ0DwuRqxTCaZY2fnIysgatgrNRldf/3zAzWtR42C7ydmOgNMqjg/UU3AqSkYJjkmgGkCJsv+0b8L5bCWs3sx4cPBEA9sA/ZphmxoOblcnYBPCweTo33vLu6j6AOwe4W3dh3NBVrv4nN/T64jz8XxO1T5awtDcj+lEUfhZsAYsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776106822; c=relaxed/simple;
	bh=VnVnLTTc+p4K3IOzfgyVsIm4JfQUPs5lxWj/VqDBs2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b0eFh9w6+84msfK6cuBoTCYLwb0/K4JZGOIwBOPshEFeks3Yw6ZHtx/Moz8N1KZ5/qzqnRA7TpFk97+DFMCPUSYXkKzdl4ZXUdM07v/ZRjXF6S6Gi7RFtno8vzuN1yqrjtRo7FyOGotdYwdEOZgSNV49OSCb/OLrJr7/+2PnA4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tDAEj316; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A7F7C2BCB3;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776106822;
	bh=VnVnLTTc+p4K3IOzfgyVsIm4JfQUPs5lxWj/VqDBs2c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tDAEj316UW21FLwwbUhMWDbQ1EOczdsCMk76Uf39nbrQYCzSWGNx1h6+eI6EYOVIa
	 JDIwkE+lnbHyGPd93duIJluUK31tRNfUN7o9aNBng196yyr1clCMuhypxViHpn5c6W
	 gH20xHkUrfru3juKtMfq71p3/bg05kqqaawTIVUNfHNl57Jh7VOzn0lwhgEh1zmsir
	 2awoyd4auF41YB9l8OqFdDIHh3HZlDFwU9v/0iMR3LU+dFPfG3fWHwSsOsh/xUFmAh
	 FCtw29QDYfpxlY7GBuHDY8ROXlqVGwOZ8g5gTQ9ooqK3epZ6xeP+m1LXeReiDYKFxp
	 EPxe9Z2ULhBDQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067A6F531C6;
	Mon, 13 Apr 2026 19:00:22 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Date: Tue, 14 Apr 2026 01:55:28 +0700
Subject: [PATCH 01/10] dt-bindings: clock: qcom,rpmcc: add msm8960
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-msm8960-wifi-v1-1-007fda9d6134@smankusors.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
In-Reply-To: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776106820; l=1260;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=1wSMQ0upQbQ8gZkIBGj7bAHKHl2mdsM0ZEnITpOYnso=;
 b=Lttd5AAQmW6e4FfATiHZkrW9wh903AbL1msUWYN3jhbdqqhuztWBQlat9hUVnErBV0vKLlp+z
 mi+xXdoESUZD+kXuOwlwNCpNNqtohCM48zRqnvhDcOn4RWtaFYn4iOS
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
X-Endpoint-Received: by B4 Relay for linux@smankusors.com/20250609 with
 auth_id=733
X-Original-From: Antony Kurniawan Soemardi <linux@smankusors.com>
Reply-To: linux@smankusors.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103000-lists,linux-arm-msm=lfdr.de,linux.smankusors.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,smankusors.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[linux@smankusors.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,smankusors.com:email,smankusors.com:replyto,smankusors.com:mid]
X-Rspamd-Queue-Id: 1E3CE3F25E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Antony Kurniawan Soemardi <linux@smankusors.com>

Document the qcom,rpmcc-msm8960 compatible.

The MSM8960 platform shares the same RPM clock definitions as
APQ8064, so extend the existing conditional schema to treat
qcom,rpmcc-msm8960 the same as qcom,rpmcc-apq8064.

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
index ab97d4b7dba8..f84d08199e47 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
@@ -36,6 +36,7 @@ properties:
           - qcom,rpmcc-msm8937
           - qcom,rpmcc-msm8940
           - qcom,rpmcc-msm8953
+          - qcom,rpmcc-msm8960
           - qcom,rpmcc-msm8974
           - qcom,rpmcc-msm8976
           - qcom,rpmcc-msm8992
@@ -90,7 +91,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,rpmcc-apq8064
+            enum:
+              - qcom,rpmcc-apq8064
+              - qcom,rpmcc-msm8960
     then:
       properties:
         clocks:

-- 
2.34.1



