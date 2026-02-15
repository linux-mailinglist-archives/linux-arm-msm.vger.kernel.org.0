Return-Path: <linux-arm-msm+bounces-92874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JDICGgmkmmGrQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 21:02:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DE513F903
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 21:02:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D844300A52F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 20:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F81274B59;
	Sun, 15 Feb 2026 20:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lbCA06hS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7391723A9B0;
	Sun, 15 Feb 2026 20:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771185762; cv=none; b=hbPlUOQZfQyDY/Vtq5lZEpwr7jrcoG0BKiEJg5CliN1a48UWOmBj8gtK47zsjcYW0Mgm3zdJka91VgyIU9ll+nrwT9dDdHEVziNluGXAiI63yxCzo6e8qQm2gGeNETV2fFaT+elvPUC6KgZEpNa08gCtFIv47rltX739qt4zH/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771185762; c=relaxed/simple;
	bh=1kBmXExWfIFWYfvQ0ndF0VY1I5Wlo2sXe30+9+34SRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EdYxnkZxlniysFRVXbAI589HJ37D+1f0dEnZN+8XvIC9GYG5SlQ/x+BxxOUky7BvaebAhbqqHlEmrXoAng1sX+LLBK1A6VlNZQC+wgFQKKrJx1ZeX3f9bBMZSO+eH3HC2kUHdngwtj1WnYN1azTtTYOFgHsEQY4LMIboTRRbT60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lbCA06hS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3EC4DC2BCB0;
	Sun, 15 Feb 2026 20:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771185762;
	bh=1kBmXExWfIFWYfvQ0ndF0VY1I5Wlo2sXe30+9+34SRc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lbCA06hSv5TZqMEWTYYZ6pZOBumI+ytGnPJzZb8p6Iw9/P1m2taCfwQbZvLuqJPdL
	 WMwJGFWKlV4wvNfA3HTqAKrKxl2+RucbpLXbdGCmH5VLY6AAL6y+/t1juDJbruzTcC
	 EvcJRKAgevBPdCQSOPnRJxc1yOsIRrmZ13h+RTtitMOGEaTLM32A9VFDbittefzw3g
	 /zffMRHdI3ThGvxuS1rsxBt9XXjab+Q0IoS1wG4DubyMMllApjoZdxXlQvuIZmB8tC
	 2T6aPEoA05HIPRDqnrsBETjtv6Ne6pgqsDkShwYCL9NyecvPpGcXIPySDCGmmqofps
	 5u/NaWjlrJtSA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D44E63F14;
	Sun, 15 Feb 2026 20:02:42 +0000 (UTC)
From: Paul Adam via B4 Relay <devnull+adamp.posteo.de@kernel.org>
Date: Sun, 15 Feb 2026 21:02:02 +0100
Subject: [PATCH 2/3] dt-bindings: arm: qcom: add wiko,chuppito compatible
 string
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260215-wiko-chuppito-v1-2-9ee6b89606a0@posteo.de>
References: <20260215-wiko-chuppito-v1-0-9ee6b89606a0@posteo.de>
In-Reply-To: <20260215-wiko-chuppito-v1-0-9ee6b89606a0@posteo.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Paul Adam <adamp@posteo.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771185760; l=721;
 i=adamp@posteo.de; s=20260215; h=from:subject:message-id;
 bh=o8HRUe7LYr0/of9eNdmUYxCEkXR2/26lshOqtHLjO3A=;
 b=JNX5ZxCvOPwJDaKn1juVYBfcC7GiGyb6RERGa+kYuPS9hquTqRf/QP2qs09liWeSa/n6xSYuI
 1h5HDq0WXQ7DDJ2foMip0nK8YfVyImdWpg/YyKeUO7Nl25k6yo8G15x
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92874-lists,linux-arm-msm=lfdr.de,adamp.posteo.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[adamp@posteo.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:mid,posteo.de:email,posteo.de:replyto,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D4DE513F903
X-Rspamd-Action: no action

From: Paul Adam <adamp@posteo.de>

Add a compatible for Wiko PULP 4G

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
2.52.0



