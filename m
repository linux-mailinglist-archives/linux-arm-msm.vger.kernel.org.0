Return-Path: <linux-arm-msm+bounces-102997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MqzIQE73Wk3awkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 20:50:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F02F3F23C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 20:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 837C33004D22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 18:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9171D38D68F;
	Mon, 13 Apr 2026 18:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="R2dA/3n1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from slategray.cherry.relay.mailchannels.net (slategray.cherry.relay.mailchannels.net [23.83.223.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9238423EAB2;
	Mon, 13 Apr 2026 18:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776106181; cv=pass; b=ac/nYT/+lA5AP/QBJ82VNjWYHQAcvTaAussJPbLWmoXqom/ZGO6FaDww8PoyLOkgq2/RfddKkz3jQdCQo5fB3JoVN/ffWew0gBZCdb6L8gxnFN+gQerLISI5Z32+miSJIUnky7Ru09KmrSlSqxh92lC7U2BwiaG9tUiAQOAC+JQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776106181; c=relaxed/simple;
	bh=fEw/y24WYxs3hZSqPEGoague+XwX1gBkuWg1clx2OLM=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=YVU8CXZHiiVY8laMgxukE2zgN3bfltAc0NJBvPQYB0D2w7yr8OX9+ExsDDuLqfd37opzqF14t5qg23Fneas8cz/avuxJL93oLP/hIx7CQJrrHwcQEUsMoLVEz5QQD56Pf9zdHZCxM2GccRPmv7vXiWUh28sbWpMzd8EIYQHSSb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=R2dA/3n1; arc=pass smtp.client-ip=23.83.223.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id CBA117E3D08;
	Mon, 13 Apr 2026 18:33:07 +0000 (UTC)
Received: from fr-int-smtpout18.hostinger.io (trex-green-1.trex.outbound.svc.cluster.local [100.100.158.21])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 8B2237E2DA5;
	Mon, 13 Apr 2026 18:33:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1776105185;
	b=JhV4IHRfBMve8AswBRy63ev/gOVPJaV5pnb46IMcYOgU7PAL4xP/nASSK5X2xezB+AHBEb
	wkaOhvCEdSpvjXcF1gqQZGKQu2LTwWKt969kMAi/qloNfefsgpWSC8A/WISydn0bwWWu1O
	2JXG5ep6Gs+B9yCYDAT+PMe2mxmgkrFhWVQWwPJcPEt1f/pA90RLGJQZSuEXtUPAbBb0+n
	m/xhJZjMwlsmzfyh1mipXJMIZcZLEhACk06A5F489Cavz5aRNtPTCUqJhhaT+AjHjrG53H
	E8k8Lu4LuUcMdOuO+/d9XIKoRSlXC9mlgginNC8ogSq5UKze4gQHGrf98PPBtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1776105185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=OLUnfi6HeX0ASpLx7V0UtygFHbY07vXAaWDDvuPcoso=;
	b=c98iDaofH660buqK4pJI2MTTwfOzutMHaDxzgDrct6PamCuYVAx+oR9cGlniV6fTVXsYRF
	TbWEC8Mft6FZ9x5QS8zUFZvueMb+Ay8wFG1VF2bXXb2Y/dMCz2cwzqfFJJIEo3pGXurQ2n
	h4d3xe2JNbNwGyLvVOnCa8qe8P11kHSlqSKb2OqqPQGWXCimm1XK5VHiaVR1XWpQIeOp4u
	OlTyb1zZuRi2BZ62o7swL0gZwacUSS2/V78Rm6RnFAdTLM5E5Ye3uXTo1B0103tkcNYR/+
	Ff1SIM9EBnjWquP81QELUQ0ihbszUe8j17acmIyECIGm/XKcJkeiQAKY50xRFw==
ARC-Authentication-Results: i=1;
	rspamd-7d86dcc447-rcb8t;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Wiry-Ski: 26e69828523c7718_1776105187665_4020689506
X-MC-Loop-Signature: 1776105187665:2041444484
X-MC-Ingress-Time: 1776105187664
Received: from fr-int-smtpout18.hostinger.io (fr-int-smtpout18.hostinger.io
 [148.222.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.100.158.21 (trex/7.1.5);
	Mon, 13 Apr 2026 18:33:07 +0000
Received: from [172.17.0.2] (unknown [180.247.251.74])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fvbcn58m5z1xmL;
	Mon, 13 Apr 2026 18:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1776105180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OLUnfi6HeX0ASpLx7V0UtygFHbY07vXAaWDDvuPcoso=;
	b=R2dA/3n1XEqxCGaBh/ELxE4nP/ix8tznQi2Fhv0WWRGX3kn8kh4IwI/LHHB+yAvBLaqTMS
	ueAico+WXBg5r/we9+6iGp71WWoRNUH12i59wek2uVvI5TdkmCz9a5o0TLNeBitSvKn5W1
	OuUoEKKuICxpA83wr0fi3SoZyXI+mIWm4TRrLgFjCq68FeL2qW+bnro/rEdADJupaRtEFg
	3FRfvqe3P2uc58NWFytsskUibJQlUpc6wQdbttxZ/QBm+qU1712XPy5+FFQF3Zv4A+q1hx
	HzxI7v6kWI9AJ8FRsvkj3l6u+Z8mLwie80iJsGtDQKe42526udE+ZPTdi8CTjQ==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH 02/10] dt-bindings: mfd: syscon: add qcom,msm8960-sps-sic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-msm8960-wifi-v1-2-01c081e54610@smankusors.com>
References: <20260414-msm8960-wifi-v1-0-01c081e54610@smankusors.com>
In-Reply-To: <20260414-msm8960-wifi-v1-0-01c081e54610@smankusors.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776105169; l=1176;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=fEw/y24WYxs3hZSqPEGoague+XwX1gBkuWg1clx2OLM=;
 b=aTWlKY+p/2tRwy0b+nB5DCaP1PEdFcTPGfKHraawDAetUha5eWQ0MoC8U7Tjdc4/rQTY46ipx
 1j9hIqrsjfNAD8nfyeUAgh7C7i5CNYDrogXGWuJYDGrwmpcPXRD+cT4
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Mon, 13 Apr 2026 18:32:57 +0000 (UTC)
X-CM-Envelope: MS4xfGi14sXGME7uZwgcuu4nMkT3dYKapNrFMv/kuWuSkLcxx017t84pfr8BUYrwLjYFFRnUH1dn5zwsoSIjzG+BVxoflL+aOehfnmcX27qzGHwv5dT2e9yy VXClVoyNXEYvnkM+7wuMREQeiL3GTgtHMuXMUBjK+/zhODB++ROa2lxPdzfKb1ToBMcFeeoIGtJPZrM+ONS6W+Il2kbJv1lWwKSX6byhg05uQuT5DTbZVaxW uA5NiwPoc0BOQ2fJBRhLfd+meOtTjh3Jk1XbIn02Cc5q+P1NaFSjxl85195SL75TUt3bD0uXi2YO0x+N2pG4K8YdQs8C+7l6m8+Qcvx09YFPTJFQNSDL79YY 7t/0W1ioqWW7eSHGaJd9aE88ykSTUBRgxQJjh7S5hSkN1fIRlFZ8deHQG9gEZiwNL7cSZf9heW4sDdv+wOeoHA3acnroQl13JE+m8kSWHPstb1nqDFpnnw5A DKSFjz6T1u73t1pmS8V+E6MDDe+6zBxo0dIfuCU4R1KTVh02uRm6Lhd3RIWYBscn+PBvtZF6VoCHwO6leyJABa15X2FxbnuscwRu7plKUNNYvk3W/NzTDWFz N/icmsUfHHHHymW1sL66O0L38q925Kxd7VxaWsFdLiaww2lySvOAtvXiz4a8IRXlt4aRpOUrsNFej5CxCHhNltdD
X-CM-Analysis: v=2.4 cv=UN2PHzfy c=1 sm=1 tr=0 ts=69dd36dc a=iMBLmzX4nuXcozcv68JNPw==:117 a=iMBLmzX4nuXcozcv68JNPw==:17 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=Gjla_oY5Z_Fy-GYXBTcA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,smankusors.com];
	TAGGED_FROM(0.00)[bounces-102997-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smankusors.com:dkim,smankusors.com:email,smankusors.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[smankusors.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7F02F3F23C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add compat for Smart Peripheral System (SPS) Interrupt Controller (SIC)
present on Qualcomm MSM8960 SoC.

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index e57add2bacd30b0582e037ae69dd9f2b55d13066..39a24c3ff9cfb543d46ef30a21edbd074e22a0de 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -106,6 +106,7 @@ select:
           - nxp,s32g3-gpr
           - qcom,apq8064-mmss-sfpb
           - qcom,apq8064-sps-sic
+          - qcom,msm8960-sps-sic
           - rockchip,px30-qos
           - rockchip,rk3036-qos
           - rockchip,rk3066-qos
@@ -219,6 +220,7 @@ properties:
               - nxp,s32g3-gpr
               - qcom,apq8064-mmss-sfpb
               - qcom,apq8064-sps-sic
+              - qcom,msm8960-sps-sic
               - rockchip,px30-qos
               - rockchip,rk3036-qos
               - rockchip,rk3066-qos

-- 
2.34.1


