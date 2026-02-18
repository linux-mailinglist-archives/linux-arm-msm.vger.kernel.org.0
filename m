Return-Path: <linux-arm-msm+bounces-93247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CNoHH9nlWk/QgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 08:17:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C85DA15396B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 08:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8BA53010B8B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 07:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A14C30648C;
	Wed, 18 Feb 2026 07:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="Ng4Qh6MC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from slategray.cherry.relay.mailchannels.net (slategray.cherry.relay.mailchannels.net [23.83.223.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F443230BD9;
	Wed, 18 Feb 2026 07:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771399009; cv=pass; b=JSpGOkSFssfvz8DDwYCpPM+9lUX+fgaO8YhuPv/boPw6uFrZbY8CctfflxXJ0itnuXBjhMwI8EBja6G7Bxo56C8udzYEZaAm49WytyexSlFoDNTT32E1pFRWBMFHga90Ew60oF44S+qDs8bSRNhmI8TjBu09sdKtGFeosARZrqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771399009; c=relaxed/simple;
	bh=U6pA1aVfY84fYP2Mcf/JJjk/A5tY6QAInlV/pSog1bU=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=Mw/qZ7p1RV9cBm9Fd+e4dKRCjpt5jNbyxRC1uoVkbjkszciZC7Ky0vS5/hWH9sH1XuaMNSc/HVDoezYxBvvS4yJc8rdz8uioc/RUCEYPk5wmBkG+0E7DllnjllRVBmsc4ZW65j3i/G+/EEN/gBYBBUFWFQKflwupAWs4S8gCP48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=Ng4Qh6MC; arc=pass smtp.client-ip=23.83.223.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 750DC7E31DD;
	Wed, 18 Feb 2026 06:59:14 +0000 (UTC)
Received: from fr-int-smtpout18.hostinger.io (100-96-86-174.trex-nlb.outbound.svc.cluster.local [100.96.86.174])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id D1C627E2CF5;
	Wed, 18 Feb 2026 06:59:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1771397952;
	b=YiFo9JmpA2fW8KENvsFKKlrXHVpTU2hIU1sD96d2lbBFcN3V8zZavV91znrQTKzTTynfiQ
	PhI8KoOep74yOPX/NY2ePW0G+C/9vo+GubogmxY8mZvR/v5sYpeh4QS0A+4zgIFrPFa59a
	F1HWzXSxtYkayljoKEX1ocpYxLlnzY3imP5/LHMJbAeFdps36EJGwFnfXOv6WCRNFouY40
	ger/Jr48W1FIWF7wdML34wWG2wsfEQjgOksMfgk5QFi4zCdiXD715xuALgZx3FuoztG4yH
	fKUI5VupHSWGVBk/EB2f5jxIZBfC12D+M0nWzpVAZ3wLiXQL2hS4PuCUFVq62g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1771397952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=gweJvZokbOBgUbozqmqR8MK+vNTuBwBArwOt+IkuJTM=;
	b=IYzb0G0/2f2T/eu3ugEpKUxW1uO7w8bAUnu4f8CckDnFebv87cbPexqD6ti3l8ylPqYGlM
	Mx5Bz6kc4r7PJ/Fw9cOx9WZqUYAo/Dt4n0Ny2oO5UKmj0YkJcFxqnzeVB7NMvURYNpYmKO
	ql9AHHJm0NVlUQlpgpcHKpR3UCu7nGCDm2BKq+Qb5XDkQKkI4mrVjooWLPp1V2MIkaTi6m
	aoq7hOMJ4lmqgQVaRjNQ1TWufmh9MIRDZGvDK2gdYSO0h3AHnKa4bCepO7dqvL6/H0awJW
	Hc0snE1TBuO9v2IQTHmkyagViwuJ1x/+28PjXIegHEVrPB/oAziFk0T40Q1QTA==
ARC-Authentication-Results: i=1;
	rspamd-659f7bc6cc-zv8tt;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Company-Bottle: 026f467f1bdfb1df_1771397954179_113406036
X-MC-Loop-Signature: 1771397954179:1684169542
X-MC-Ingress-Time: 1771397954179
Received: from fr-int-smtpout18.hostinger.io (fr-int-smtpout18.hostinger.io
 [148.222.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.86.174 (trex/7.1.3);
	Wed, 18 Feb 2026 06:59:14 +0000
Received: from [172.17.0.2] (unknown [125.163.207.118])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fG6n52MXdz1xpP;
	Wed, 18 Feb 2026 06:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1771397948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gweJvZokbOBgUbozqmqR8MK+vNTuBwBArwOt+IkuJTM=;
	b=Ng4Qh6MCcyIObh3bMIT4h4OmU7RjAwKVDZFFrZalIF6tdKaDT7ahXka3Ei+k8KRdtXNlWZ
	Oc8mo5VJT1UXRqyF6xtGagSr0AWJsTryy4QDv1fu5wYTxUWQ0bPZ0qQTW9k5Lsec0iV/RL
	dRPuTpdrnC+l4m0Ln7Bn21/tDpIw2qXk1lX2nmI69Hux5SGt0pIkQX4tu07eQK6sUSADUd
	9LtOJSjsGMIrDcvrDDsQgPm/IyPKIQVrzT9dOZ8/KaCyxRZxIrrgEnV7dAWf6yHh9wFHlh
	zZNcrlCYPVDq1mvMmBOj99POXoWB5loZcPvMpsHfML8f0UKLThCMMI+gNVZDmg==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH 1/2] dt-bindings: clock: qcom,rpmcc: add msm8960 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-msm8960-sps-rpm-bindings-v1-1-bbc11c0d4f24@smankusors.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771397941; l=1316;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=U6pA1aVfY84fYP2Mcf/JJjk/A5tY6QAInlV/pSog1bU=;
 b=Mvio+PmX/5VRm2cqYyDPGGRGRZ+RYOBsVR9GI/0FfOIilT4IJUEOJo492luvzdJJBcrAlXoh9
 y04VzMa0MCuDWAB0w0a6VpHBFaVj/WWHl4ahO2gDTTHnfv21Y30hEZp
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Wed, 18 Feb 2026 06:59:05 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Gq4Q+V1C c=1 sm=1 tr=0 ts=6995633c a=QVpbo7x4j/ax8PIbKattOw==:117 a=QVpbo7x4j/ax8PIbKattOw==:17 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=eyO_MXq6ogTu2Ra450oA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfPx/POv8oITj4jBhzcReGKI0+z9S+viQDY5KEtRvP8QSw6KUdkdD5OOS9p70f1puOZ7BztxK9Zy1I9ZcVG2G82jsfAHso1ddT/NGbtUSP2bHd/Zp4ldc jFXCYFyCo7/1ttXCcCqgZeIczkXzET34SbHr3PFOmbpYfMZiMqL2mw2jY1TeJPuKjZbTIr61E9cmG9LNAeDXIk1M2h2groxyxT2Un6rq3Alqp0DVn2DotmEB R6fvzzUpzFsWtbI0/VS3tXM904VYoaU9fKU+hqHKc6M/tBB/cz9wIHqa2BI61lcCiSdf1OHUnJi8M1MAAyeZ9Ij+8NH81xS836+3xnCqsDDEBr5s0F859NdK vT4KaixNW1DmjZevgPQGUF+fkvzmOY882z0aCV1dLCMfIrsui7P+tWLKDhFdJY5Tbz6oUaAqlHtSuOsj2MHcCeWbnCfCRpu+YmrhR8I0HbqL4GOf4pAldghC HpW39U/pVmZqPmnOb/HVQSNA3uaTc6TZ3el70xr60H7+os+59wJdiYeV09Qg6UerP4dOIgeC7alJVE2QWA4gPkzYvOMoB7Z1A1L5y7Sj+gpRyiUCz9wQN1qG SE7g6BQyrdMlmi0FkC8yLDceIwbQ5ReQtGobcUhQmllSlQ==
X-AuthUser: linux@smankusors.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93247-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[smankusors.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C85DA15396B
X-Rspamd-Action: no action

Document the qcom,rpmcc-msm8960 compatible.

The MSM8960 platform shares the same RPM clock definitions as
APQ8064, so extend the existing conditional schema to treat
qcom,rpmcc-msm8960 the same as qcom,rpmcc-apq8064.

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
index ab97d4b7dba8bc8d38903b399d2bd4bda087db8a..f84d08199e47f45ecb176d350eeb7df8c3ff506b 100644
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


