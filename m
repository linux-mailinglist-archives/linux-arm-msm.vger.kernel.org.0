Return-Path: <linux-arm-msm+bounces-94768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKGiN/y9pGn1qQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 23:30:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 872FE1D1DBA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 23:30:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0046F300DF58
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 22:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD02375AC4;
	Sun,  1 Mar 2026 22:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQ3YFNDq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEF3375AD6;
	Sun,  1 Mar 2026 22:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772404211; cv=none; b=Vjsz49ZOLdfv82GBBzD8Q288qchLUOnleGjYNtMVCj0eyDsi0jq0eV4TsijRJQ1GC9hdqpaYu20m5/2Hnt7UlBwKIV9+smtQYtPxkujGZM7KuPlRyi5RrxQOy9xBzM5Z+r/CesowDjLqoEca8iTwD/2Zlhgmlj0TU9U1qt5eWgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772404211; c=relaxed/simple;
	bh=dQI5AaRN9kQoOur5mR9n344XaBUPCGCsHOMIOiHYfZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GzA1Ch+RUs7lD4JAojnvtnqTRWw52ef8BMzwM9ephCtoTWo6H66NsJ+kZYHT2ALCgSCjUGaTdFyvfgAh6k7xNDjhjN1gWQHa+DVcBgDhHO7lZlcATponvDcaLs2QcJlFFIG70OiFKwHlPy5uuu4X+0S00yUKzxFpzja/0NUVp3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQ3YFNDq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF9FFC2BCB5;
	Sun,  1 Mar 2026 22:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772404210;
	bh=dQI5AaRN9kQoOur5mR9n344XaBUPCGCsHOMIOiHYfZM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GQ3YFNDqyoIB1wNLfc75lKbaBj2aLcTv8mzi0LJ4qDQUtDd0j1qW/XJaB5paTLH22
	 R0jknbVxyXyf+tCUf7q9jnVYroqd3U+zhqU3/YDNEQd74c9VDx0hl7zC6TBHT6xlZi
	 yHhbkAnCmESucwlgzoIRSLqEFE34YDXsgJJDa7/aXdth2LZDKov/1eKmHGQuAWIB5q
	 HaKyYgwt3uY9FDxht1bdJVmjyQ+swt0iyRI49dJdMuOpQmUnQd5BQutNuyuBhgGKBH
	 MbvPWZ1eXCcepbyZNok3xOepOQXd7woXX/ULHgkFoj9HEd8ithO8quO0WoX3zksOJQ
	 LnCeDdxVk7J1g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC659C5DF6E;
	Sun,  1 Mar 2026 22:30:10 +0000 (UTC)
From: Paul Adam via B4 Relay <devnull+adamp.posteo.de@kernel.org>
Date: Sun, 01 Mar 2026 23:29:18 +0100
Subject: [PATCH v3 2/3] dt-bindings: arm: qcom: add wiko,chuppito
 compatible string
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-wiko-chuppito-v3-2-9b36a2a7aed5@posteo.de>
References: <20260301-wiko-chuppito-v3-0-9b36a2a7aed5@posteo.de>
In-Reply-To: <20260301-wiko-chuppito-v3-0-9b36a2a7aed5@posteo.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Paul Adam <adamp@posteo.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772404208; l=811;
 i=adamp@posteo.de; s=20260215; h=from:subject:message-id;
 bh=L22ne3Q6rMpTpkTkP/rKSYuGR0NhqH7BLqT9DvYenoM=;
 b=/FbazqWAs07vAdS50IF1uwLL4+0US93jLCny7cMT81n01mGwfoSkofuVQ3UtVn1VsbZG3G0+u
 CkxFjrDw2QZAf2bcJoqSLC3hvaZYtJuswcRFnAmO6UdF8Fucs2y2WLB
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94768-lists,linux-arm-msm=lfdr.de,adamp.posteo.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 872FE1D1DBA
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



