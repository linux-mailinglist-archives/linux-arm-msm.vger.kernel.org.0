Return-Path: <linux-arm-msm+bounces-97065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GL/PIb64sWmTEwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 19:47:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2207A268D29
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 19:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 95A5030451E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 18:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9043EAC86;
	Wed, 11 Mar 2026 18:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FPz7JH+i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F9C3E9597;
	Wed, 11 Mar 2026 18:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773254826; cv=none; b=Dm9NW2UjXm8q0zeTfmMYF1bq5oS6GuS0a5/vqSbI0lJunLkrMFRAfqI73XD6gSQ4xM2yOz+vOJMOlJBul95kACKH9+9oM9NyCdqt44EHjwDf4lsUzgP8dY6flnhDpbsydLsITGuLb5lHfrJasEw59fd9gitXw3a8FFsyEYJEcus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773254826; c=relaxed/simple;
	bh=dQI5AaRN9kQoOur5mR9n344XaBUPCGCsHOMIOiHYfZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gN4vdzIZ4ImysPrlqBWxUD6VFgXP9IgKgQCkPAhnmWOC5emAy6ZGwWbK9Ufs3MBba1kad2/e3N4e+6Rl6rhCOPmAb0BmkzXOlyQQ695aa+LzqUn3P4THCjvNuW60IgZslFqxDCo/2TGokeRdFIZeWVV1fu5lbEkq7ovXPmW8IPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FPz7JH+i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0C37C4AF0D;
	Wed, 11 Mar 2026 18:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773254825;
	bh=dQI5AaRN9kQoOur5mR9n344XaBUPCGCsHOMIOiHYfZM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FPz7JH+ixHPaceo2C3zsjjC0BfTbYjTJkN86JV1ekB9AXTp6hXwY1dN229gV3Vgej
	 lyvcXCqMplAQxUtE0BTAE0L5PbJe1NZYDGtYZ5Ru2NTht+JhdmhTjvfQ5bqX7Pva5V
	 FmOeCdQnXe2AXe5RW/mG8wmMM7DihCGloBkfnJJn5uuyOPY1KhGUIP1DdVNWhXY9Av
	 AfkGceZTMk/c4NWeIvyzg9kBkAT2Mc/xbY7Nqc4fdTamVLTrce75W/zHIYMYlyLERb
	 LY1tlBT2EN+eqQ+KqhX5b95hlxOesw2HVEWH+qjyRsq7OnjPZvucXD0LWbkp5cyqOv
	 ccxAZIsC6MzHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE30B1125869;
	Wed, 11 Mar 2026 18:47:05 +0000 (UTC)
From: Paul Adam via B4 Relay <devnull+adamp.posteo.de@kernel.org>
Date: Wed, 11 Mar 2026 19:46:06 +0100
Subject: [PATCH v5 2/3] dt-bindings: arm: qcom: add wiko,chuppito
 compatible string
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-wiko-chuppito-v5-2-0a8656cca1b3@posteo.de>
References: <20260311-wiko-chuppito-v5-0-0a8656cca1b3@posteo.de>
In-Reply-To: <20260311-wiko-chuppito-v5-0-0a8656cca1b3@posteo.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Paul Adam <adamp@posteo.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773254823; l=811;
 i=adamp@posteo.de; s=20260215; h=from:subject:message-id;
 bh=L22ne3Q6rMpTpkTkP/rKSYuGR0NhqH7BLqT9DvYenoM=;
 b=StxlTKFfGMrQ4hlOVMoGzhx3Qo8J4BI18sm1xyp9OGI3VVwsBD/6JYaQwpJ9o8SmT5CPyOVAf
 O2sYX4wZuYKB5ixVIRZoAgSBgcuGwOHFzMiqAPkmJNWJrhlLHzXPZLH
X-Developer-Key: i=adamp@posteo.de; a=ed25519;
 pk=mtrPhSn7htywc4S5zrKNrWM6laAdfnaJzIs0BDiCyAs=
X-Endpoint-Received: by B4 Relay for adamp@posteo.de/20260215 with
 auth_id=640
X-Original-From: Paul Adam <adamp@posteo.de>
Reply-To: adamp@posteo.de
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97065-lists,linux-arm-msm=lfdr.de,adamp.posteo.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,posteo.de:email,posteo.de:replyto,posteo.de:mid]
X-Rspamd-Queue-Id: 2207A268D29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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



