Return-Path: <linux-arm-msm+bounces-93248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPFiA6lnlWk/QgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 08:18:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 391EB153993
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 08:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2A83A3007A4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 07:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E400330E0DC;
	Wed, 18 Feb 2026 07:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="EgjzMTmE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from dormouse.ash.relay.mailchannels.net (dormouse.ash.relay.mailchannels.net [23.83.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DFC2848BB;
	Wed, 18 Feb 2026 07:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771399074; cv=pass; b=Opamx6Eedbl/G4ZMI+DUgozoM83nN5HpDNlumUnQftStVkN5tZeSGQU5aWR38OF3g7d/aJZagJhfMoxBuALsP14cfBjBBxkEztapFNwkuxc6CH98C8aX2PCRTMMZAzN42eiAWLoAXGzHMV4JeyNhHS1SI5vEZuCX9ynViXDIAvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771399074; c=relaxed/simple;
	bh=fEw/y24WYxs3hZSqPEGoague+XwX1gBkuWg1clx2OLM=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=nr1eETfBcgsxX1qISPIKo+v88rjuxkGIr1qYQ2As0mJ0HEZ8CeR5eoe+rGds8PIlB7Yc9CyCSezUN9d+d6L6GWV95i6wIs20hxl6MKjp981BMRXdB8oFHIYxWcLGw4utsHLMmixyqZ54rn6cXvX/2yYtWO8+wVlmzu5pBya6fe8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=EgjzMTmE; arc=pass smtp.client-ip=23.83.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id C6C088221C7;
	Wed, 18 Feb 2026 06:59:15 +0000 (UTC)
Received: from fr-int-smtpout18.hostinger.io (trex-green-3.trex.outbound.svc.cluster.local [100.99.12.77])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 337A98221C2;
	Wed, 18 Feb 2026 06:59:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1771397955;
	b=k46qzY8lz5//YwcXORpt4uib8Umz4Po1QAVFMQ2PhdcPdyCDpZ/rTpxOSCdTeQwIZiO72q
	xwu9ogQSntGfmhi8TeEMPDos+7NH3x6JdkDvD9XlVcAbLywcFcQXkYVs+DgkLeIevuRaFr
	o1sW4f/ha8qMZoVILcjaxq4Hb0j5w3DcdZsL7/KXxvyy8RDF5YQzVYZbMIJE0kDRCeUWMr
	Uqki10eeArfkfUb4oX081OGOaFlUW37rg4u+pW3M5NMWFyEslS0VY7MB0vlxgdXV4K8PKD
	akDGu2tlPIuKMjTeu1iYkSibufPpIZJ+O3E5rX5wtCVjZFuh8BSmh5dFTWeU1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1771397955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=OLUnfi6HeX0ASpLx7V0UtygFHbY07vXAaWDDvuPcoso=;
	b=IGZIsV1Q6DOTRHVhOH9IK+AnFInanArk3m2ebU+UEyZumnmXsYQmaaDPugLLGtMHDeIgsm
	r/u4V6Hgc1EsYBOsCqUQHn+BgrNijyT5/7B7dP3PQfL+ApFhpJe5jaOOVZP+h12o86Rvna
	e9jXHAbGfjROkdRUc71gYECIXaSlARP55b5XIwUML32wRwOzz+6te3A+A2HJZYsIKmHEwa
	TVtX07qFfjySrIAz3lZdYRpQAyFuUwYpCg+rjU49Q7YUrdvFg1c2aUmTSvAWlK0ifJGE2C
	dLEhUtP4IYMakTTGZGPk/ktUHTyror2iASfkPEK/hLH1cLAxLJwYJz1dURw55A==
ARC-Authentication-Results: i=1;
	rspamd-659f7bc6cc-w45qc;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Decisive-Tart: 531994080228eef7_1771397955706_3347118843
X-MC-Loop-Signature: 1771397955706:2749205356
X-MC-Ingress-Time: 1771397955706
Received: from fr-int-smtpout18.hostinger.io (fr-int-smtpout18.hostinger.io
 [148.222.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.99.12.77 (trex/7.1.3);
	Wed, 18 Feb 2026 06:59:15 +0000
Received: from [172.17.0.2] (unknown [125.163.207.118])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fG6n84kxGz1xnT;
	Wed, 18 Feb 2026 06:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1771397951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OLUnfi6HeX0ASpLx7V0UtygFHbY07vXAaWDDvuPcoso=;
	b=EgjzMTmEVHZcbj8jFAZWG4MyR6to6AqUF0jgyJXn1+M0c0a/8zfGOEovg4H52Te6XuD8Am
	OX6yo8l+WAx0bYiKHtnudsY7OAhNcCdg/JOqaESYOhjpMbYxgCUbf0W0STF6bbngS1k761
	zudkdTWXBgcYYgEkeVRRjhxochEPBkfQXn1AhUIwt5bniDJtTjCFCnzexolm3SUjhLQS7A
	O3o98YSWI5Q8Whk5We+KdqE2P8D3nNxicnhbyyJLv9UtD4u3ci2ou/R/CtxVdnVizEAUlD
	sEg5bYYgBZo7nSdREjSrNp/7jc72l1f/GmGAg2NZRqadF/eCGy4gEk8MxrACvw==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH 2/2] dt-bindings: mfd: syscon: add qcom,msm8960-sps-sic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-msm8960-sps-rpm-bindings-v1-2-bbc11c0d4f24@smankusors.com>
References: <20260218-msm8960-sps-rpm-bindings-v1-0-bbc11c0d4f24@smankusors.com>
In-Reply-To: <20260218-msm8960-sps-rpm-bindings-v1-0-bbc11c0d4f24@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 phone-devel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771397941; l=1176;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=fEw/y24WYxs3hZSqPEGoague+XwX1gBkuWg1clx2OLM=;
 b=fS3ERPEii6z/P3sgvTDTdr3RSXI6MOt3o6FHaoDXb8JoDsl1p+W1oH/L7Nn8wF+qawReGCInG
 CeyWMB/lKx2CxgMqS7Y18NYXCTEUNYZJ0NkGRqHkF7FjQZOvHeDEfrg
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Wed, 18 Feb 2026 06:59:08 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=GMJaEfNK c=1 sm=1 tr=0 ts=6995633f a=QVpbo7x4j/ax8PIbKattOw==:117 a=QVpbo7x4j/ax8PIbKattOw==:17 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=Gjla_oY5Z_Fy-GYXBTcA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfBW7MvezkzdNDYgaPmkHEKwVlhXyiWFRef1AjUlhGEuz/PNKZoeOhgrqWk44JyHrH/oW0g6ZBgKMrxRTeQz8wzPMTfd9orWYUS8cwU+4uwTIznrxVdxH QZXKzXa8FVTP+MuBW4XMkDUX9q9IDWMjetYV9VZNT2Kdl0RAaL/tIYzmnJZ/BtycsI1Cd0taGC1vOZYmFUcKMAjf6236aoOFQvPcx7vZ7K+9xexNDfV8lxfm gp7OzRKWFucO6w6UysD+HFKuKIC9ZkFWX5MtO5Uz352lCsotFgBM783JShd6PlgGoyZch4/fQntt/g1E9iXwcYaWrPOk/AwJ50BUhZJIwQp5PxfaCBe5hkn4 tgO8dioBFQEjk8NJuX5SBy4y89YreZvhSpqdGBlflW4pbSrkhqayWzjeo0r+yDNwE9x+riNMzS5YaAKSWdsHR7/e8nGRH8TNwB/irWhVkhAOC/TB5JZS39PT ZTPyt4xBzsTaLiLaDznKvemwslA90JyoMAJpP3D1t2RYNzeFvTd7WJTR6aWtYFnVSzxW6GyRP5y4IeQmtlR6Y5yX6lD/el554FZAtYF98jcC3BmwdojA+dUu zZY/r2g0cMn9U4ZgTrju7BLH/hbEEFjBaxhTO9AULC1Tow==
X-AuthUser: linux@smankusors.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93248-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[smankusors.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 391EB153993
X-Rspamd-Action: no action

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


