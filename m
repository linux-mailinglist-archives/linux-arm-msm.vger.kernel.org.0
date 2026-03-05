Return-Path: <linux-arm-msm+bounces-95678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IQfIha+qWnNDQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 18:32:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 214B0216456
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 18:32:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E49D63054B92
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 17:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80FB83DFC8B;
	Thu,  5 Mar 2026 17:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="LbG9uoR+";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Vfp/1i9g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E5C27FD51;
	Thu,  5 Mar 2026 17:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772731834; cv=none; b=ExTluTd57ubLPRJYd7oQLNWayW6asDhyrhbDnRYomvlWnc5zeQD1BIKcG9ytEuTY6WdcXh1wKSosqrpyOvbmZUzMPcKhTgjXgrjoNFYo+oNdFhaYDnaokjY9LbkDxe2Uba+rbRpyLmhij91vktMw2i2o6IDlMUlS0XNKaTCxk4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772731834; c=relaxed/simple;
	bh=/GcNDf8Le2y9WYQ6PzY/tDb5Cx6PVMBWYf8Pp4VTUrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oS3FVdb6ycEmE/nuct86M2bMOZWjSEVbO1RFxPNvBarqfh2RnppIQ2WCE73aBNuIies7LqQy78O+fRMuBtVrK0R0VFFrzWdjgTSD3B52ODEeUFSegylc9uGOKoApFf8Kqxez3O7oM68V8HDVWj6PBNcijpufdQYFbsZ93eCmvGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=LbG9uoR+; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Vfp/1i9g; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1772731729; bh=twxBg2YtPKl+2EDai1tJgJt
	ObGne7C503mZU+v4n3b0=; b=LbG9uoR+7Urz/0b0tF+g+HB40Dxt31I+CxyM82FuDCesCsuRHy
	EWE335HOLTRBS9nwLOdP+cRUs3FNbb2f5Nq6Dq6payMC2oUBoeeVAxs7h8yvzcVddkvtbEPilxU
	A7luqlkb+cXmxtPozj1/v8abUdColyTzn1wH/Xhr6Mu1sPCLDTformMgu/FCyxmQvjwCT8EXe6s
	tgG7NOBWAc8Fh2AuGNroN40MHIkNviMWXKOIbPb8cPrLLiYhQedYq4gj295TCn3X47yLsrNyH98
	h/rRegAaMBMqToZVDqybhRlJ3eYVR15/fD5CPV1rm7WkvfABKcBRtWsXHgJgMZ1LVjg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1772731729; bh=twxBg2YtPKl+2EDai1tJgJt
	ObGne7C503mZU+v4n3b0=; b=Vfp/1i9gxfHvyAluqiwLqUuCs6IaGKVvZO2xzCg+MhZg01m7bF
	NoyrG7SOapGL1/feYPeuBokHaHFr8jtIO1DQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Thu, 05 Mar 2026 18:28:36 +0100
Subject: [PATCH 4/5] dt-bindings: arm: qcom: Add Redmi Go
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260305-riva-common-v1-4-436f1f4b7399@mainlining.org>
References: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
In-Reply-To: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, phone-devel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772731726; l=666;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=/GcNDf8Le2y9WYQ6PzY/tDb5Cx6PVMBWYf8Pp4VTUrE=;
 b=RWC356mCtejYnoUc/HR4AVBE+Jujf1RH9a65G6xpaYnohTvaxK2Rsr3LS23OEdwaOOIVa35am
 7G1iScV2iKbA/3MxQRCEjHqp5fzV+OatBhjdDF+0Qhmn+s0VkF0B2cu
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
X-Rspamd-Queue-Id: 214B0216456
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	R_MIXED_CHARSET(1.15)[subject];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95678-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mainlining.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Add Redmi Go (tiare).

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 456c1a382cc2..1bdf2d8c9b47 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -201,6 +201,7 @@ properties:
           - enum:
               - xiaomi,riva
               - xiaomi,rolex
+              - xiaomi,tiare
           - const: qcom,msm8917
 
       - items:

-- 
2.53.0


