Return-Path: <linux-arm-msm+bounces-93549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBv5AiccmmnZYgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Feb 2026 21:57:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AA016DDF4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Feb 2026 21:57:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4678830626D1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Feb 2026 20:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C48E369212;
	Sat, 21 Feb 2026 20:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RyANbFDY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713C5313E3B;
	Sat, 21 Feb 2026 20:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771707383; cv=none; b=W3rlEk6mVzVcWHmM9kWXzlOxwJ5B/CFSoSD8WMiO2ax9F45CTIe6X0BBzeqqjYXFbp1YDuFgb5E6QMrjfmblc/WVo3N/FqWL5yJjg1c/j6USaFt7q+ZCuty7yeeNfqboJ5Kll63arzz2FUUc6hb+AbLT37UE79RVE+d2/F9uV5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771707383; c=relaxed/simple;
	bh=lXYKro8HSgqEmBZklng70PXuewbePjXBxXhhRpdMi34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BcFxD4BF0IbFvrqrF9S6/qMx+GNdhH1wkCUCyD7Xe+l1YhcCwvDhaqQR7WHL6wNZ+otitqyu+tnNF0tE2GRMs5MdV0xuY2elN0NBLmYglNnYyH9swIqJdBuEUHlf6EqcGI/vKIDkYilqemCaxqAg9ZnIAJKaMmlSrwgF6aE2fzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RyANbFDY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52378C2BCB0;
	Sat, 21 Feb 2026 20:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771707383;
	bh=lXYKro8HSgqEmBZklng70PXuewbePjXBxXhhRpdMi34=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RyANbFDYwWEEJFbnNvo35HFxSh5rnK7++quVdqOVcIGdQSNx+phmNu0xXR45H8COC
	 2Wy3tLOMsdZSGLDGzXIsEiylbnazi2Mjm8CjMiKhjbqziHAK84coECDuWrVLmNJr6X
	 eiYIeECvmyOeizu9osC3FL/cLlA5zhYLtmmXZZB2Fx168Mx3ynKoRxq84n+Vdh9DJf
	 Lyng18JESsmO9HhBvpIWDH5zc3ydJHn6ClgQiTClDXsj7FuolmTLj36NZSCg3S+ppO
	 jYFXRekx39Bhj5v361cW3QSk+bPAQ7xPBSqNmUttFT3RUkxgZocFwINQmEIIVPc5nS
	 E/qsCxlPLneNA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B7EC61DFB;
	Sat, 21 Feb 2026 20:56:23 +0000 (UTC)
From: Paul Adam via B4 Relay <devnull+adamp.posteo.de@kernel.org>
Date: Sat, 21 Feb 2026 21:55:40 +0100
Subject: [PATCH v2 2/3] dt-bindings: arm: qcom: add wiko,chuppito
 compatible string
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260221-wiko-chuppito-v2-2-6336b1b12389@posteo.de>
References: <20260221-wiko-chuppito-v2-0-6336b1b12389@posteo.de>
In-Reply-To: <20260221-wiko-chuppito-v2-0-6336b1b12389@posteo.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Paul Adam <adamp@posteo.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771707381; l=721;
 i=adamp@posteo.de; s=20260215; h=from:subject:message-id;
 bh=wLOaGkFmyUQde9kh0HFArEBPrWfyqvUjaJBrO7MX19I=;
 b=m1rro/7hs7Z4FF0Xm9njEJ/1S1Q5Fq/P3VQ85amohSZptxIUvG7KYkQ+yHDextmXuPTn4OC6y
 B4inj3RUsnmD7SouFSAUqIwro9Ep5CGkMziasJ96o/2gzfnddrtMre2
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93549-lists,linux-arm-msm=lfdr.de,adamp.posteo.de];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[adamp@posteo.de];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,posteo.de:mid,posteo.de:email,posteo.de:replyto]
X-Rspamd-Queue-Id: A9AA016DDF4
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
2.53.0



