Return-Path: <linux-arm-msm+bounces-108035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLChMTq/CWrDnwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 15:14:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8640A561226
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 15:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D32523003624
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 13:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5657F391E7B;
	Sun, 17 May 2026 13:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t5bG4KDy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0966B390234;
	Sun, 17 May 2026 13:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779023665; cv=none; b=T6H1KpQbx4crBUcrzibes1WLoadN6FxIUBctFUL0HrXy9Tua2ch4QYQXy1PkbeLBEIh+IGdETTRio0e+8sJa+pIp6BZx8CvjGPIOcLU5LyqvgOG2+mDhPaHX99Qy3P73XccoOVluPUm//UHA8T9XTiJ22UMmfO0GxZl/25gzhs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779023665; c=relaxed/simple;
	bh=0JDKftZzllRx57QClANlVptlc3OG+Um+N/I9UT2bo3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oV9JFhN5+S4gkpYU7f4U4jahdCh+qy9ke6Y9QTOJMhB8infPXQ7YJPED3trBQ8csEuyO9EuDZP200baoPuNYgpZTRHluWD3eGPcglTshGZsYK8wXKbVJg8Cg5z9j1q+6QAUA9hqNxhicN4ahcuLVuUP3oKY4LFw+isnwGQ0NQiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t5bG4KDy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0EA94C2BCB8;
	Sun, 17 May 2026 13:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779023663;
	bh=0JDKftZzllRx57QClANlVptlc3OG+Um+N/I9UT2bo3s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=t5bG4KDyc1x2itpzpDJ6WkX1gFCcaP8zBfWgf3QRHB+IVw8otEf/RDNGTx+i+4CLR
	 tjrWp8zmlRfotinS+ZDt2T+X5AGlBCfugKrdxPBMcxpTDGDn70upGvs/lr7El0Oi6k
	 sighNfWgp9wm5n02KY3SnNee5DISDmMg6YDYC5k7RApMA4VZGIeRRiRzx0GqJb7KAt
	 pEWOFdhzmLPHG8Z7Qh0XJcMLILPQTSIVS+oVdG+k5Pp+dEzdtmVn8p8A7JFRjLQ69W
	 AORZGZ8i9QLienu4zfWvnnKBiaUWaKF8Jk/B85wMf/rTMgdwGBAauXKaBSvyvDjf1Q
	 6O5plvNuy6EMg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F15AFCD4F21;
	Sun, 17 May 2026 13:14:22 +0000 (UTC)
From: Alexandre Hamamdjian via B4 Relay <devnull+azkali.limited.gmail.com@kernel.org>
Date: Sun, 17 May 2026 20:14:20 +0700
Subject: [PATCH v3 1/4] dt-bindings: arm: qcom: document the Ayaneo Pocket
 DS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-pocketds-v3-1-d5910c801756@gmail.com>
References: <20260517-pocketds-v3-0-d5910c801756@gmail.com>
In-Reply-To: <20260517-pocketds-v3-0-d5910c801756@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Alexandre Hamamdjian <azkali.limited@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779023659; l=835;
 i=azkali.limited@gmail.com; s=20260510; h=from:subject:message-id;
 bh=NYdtjmtd1UJX19KWh8T30Z3zmyp1DHDS/k4hVHOJ4EM=;
 b=HVWy1Z93IjkHW0ng0OVfPSA+tvmakwuLPZzEwYM9olKU/Q2c2Dld8t+j5acpltu8BEmQGESiR
 HVVP02gcfNcCBQxJPD7NPqfPCQyRXrP0vvlMQP69UEWcf9tqCYo0VyA
X-Developer-Key: i=azkali.limited@gmail.com; a=ed25519;
 pk=I0Z0IdCdQJqNGX+FQUnXhrHg950u3cM6Xzz3YT6JOyQ=
X-Endpoint-Received: by B4 Relay for azkali.limited@gmail.com/20260510 with
 auth_id=774
X-Original-From: Alexandre Hamamdjian <azkali.limited@gmail.com>
Reply-To: azkali.limited@gmail.com
X-Rspamd-Queue-Id: 8640A561226
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108035-lists,linux-arm-msm=lfdr.de,azkali.limited.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[azkali.limited@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Alexandre Hamamdjian <azkali.limited@gmail.com>

Document the Qualcomm QCS8550 based Ayaneo Pocket DS gaming console.

Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 2741c07e9f41..f130a6b092b9 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1107,6 +1107,12 @@ properties:
           - const: qcom,qcs8550
           - const: qcom,sm8550
 
+      - items:
+          - enum:
+              - ayaneo,pocketds
+          - const: qcom,qcs8550
+          - const: qcom,sm8550
+
       - items:
           - enum:
               - ayaneo,pocket-s2

-- 
2.54.0



