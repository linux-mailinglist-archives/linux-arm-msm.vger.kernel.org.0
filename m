Return-Path: <linux-arm-msm+bounces-103013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJmcIYdZ3WnYcwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 23:00:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F653F3551
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 23:00:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBDD93047534
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 20:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C9BA3921F8;
	Mon, 13 Apr 2026 20:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="NXUWCaiW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cornsilk.ash.relay.mailchannels.net (cornsilk.ash.relay.mailchannels.net [23.83.222.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B1C30BBB8;
	Mon, 13 Apr 2026 20:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776113688; cv=pass; b=twGzqwuCQQmpZ5rjgMkljIV2UrbpDE/D/dZwwoFcqBXRhcFQ+WsuY9OWfilh7eMKCTkp/Y9w3t7ECEuxwSa9aOb98Efp0Ipd4wyYCoMDQahQuA+YoUZM2m7SAsU0Di+o/o+Fn2pGYtHnAI1s3e734ynWAllxKIRbuBMGYdCGtDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776113688; c=relaxed/simple;
	bh=U6pA1aVfY84fYP2Mcf/JJjk/A5tY6QAInlV/pSog1bU=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=ToezqeyKc38R7/RkkrPPQXAKhVJ9Sd9ww22Eul/dkhypqC1VoH8K6jKI7wRmR6Z2r6LfMBP/zeW3MygnX25GGTFcZGH7l3nCVSiFT5Z/9ghp9IZgYYQfy3cmzCT8WTJr3X9N8aZIMDgbItF5jmZNqbsPzBXhT0RogMr2jwut/ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=NXUWCaiW; arc=pass smtp.client-ip=23.83.222.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id F3DBF7E2AA9;
	Mon, 13 Apr 2026 18:33:03 +0000 (UTC)
Received: from fr-int-smtpout18.hostinger.io (trex-green-6.trex.outbound.svc.cluster.local [100.123.14.186])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id E5D547E0D5D;
	Mon, 13 Apr 2026 18:32:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1776105183;
	b=0BBq547em35IjlTX5qCI/Ccdlp94OBsl1D+aMDZxrsmsEKThHOOgiX09weHgCSK/a3xA8t
	3irEIL1S66Aqlh4oU5QAe5A25VHCkAuBgE2bu93/Ph4x20odVUEbmTNHELG0NPiexTOohW
	ujIT/mpVYXZ7kR3I3hdEPVOyOY4NehFEoP+13TMP5t1ucscKGegHWS4nfrwnpe+MDS9vSI
	48/1HRJytwFlw200jFOlQRf9INFXmr5+bmmSYJbVveSX1BYuZ9bvW4IHXXIVq8oc9WRwtI
	iVgn+K/4RsfxX+KSz+MY/WOJOS3nnTR7BIECb4EsYONC5H65qlwDuhZPxtd6rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1776105183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=gweJvZokbOBgUbozqmqR8MK+vNTuBwBArwOt+IkuJTM=;
	b=Wx/rsBoN2LmdTDPqVYqkCLmPrZLicpd7Nny5CgrjF3Yp/LFylSrBA33+5M+nVpCcRno3Qp
	MsZEJjZ5+zJAiLuQCq9vGiuDqdGZetEZmd91zVcwL7oip+znOxHXWAoZ4CKdXolmB6oNXx
	nsW0MglvDuTQ/LiukimMDvKsXGm27j5x7mhcPPAjvNB0NDoBh+Hl6eCEIT6GYK+pO5chS4
	oujIBwEq/k/IfW7Sk7N0/IGeTpckq8tPnJO+sqsthbLro7qr25vvxkHhdyJT1DV1Hh2vcQ
	HKnFKVUdYueyBuAVK7RxiczB6Iz+imMPTgRoRVOLpMzYIgRSX8BLGcIzWczBBw==
ARC-Authentication-Results: i=1;
	rspamd-7d86dcc447-rcb8t;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Abiding-Gusty: 07eb788b0f2cbdda_1776105183746_3176115138
X-MC-Loop-Signature: 1776105183745:2538366678
X-MC-Ingress-Time: 1776105183745
Received: from fr-int-smtpout18.hostinger.io (fr-int-smtpout18.hostinger.io
 [148.222.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.123.14.186 (trex/7.1.5);
	Mon, 13 Apr 2026 18:33:03 +0000
Received: from [172.17.0.2] (unknown [180.247.251.74])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fvbck0kMJz1xqN;
	Mon, 13 Apr 2026 18:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1776105177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gweJvZokbOBgUbozqmqR8MK+vNTuBwBArwOt+IkuJTM=;
	b=NXUWCaiWtjLOwuo3iNIYVx3Wzqxq+UQBfjwHhWJVhCXIksu+mLLMPRwOxzfc4aoSwE2yXb
	merSvwtX3lPAuw714Mtt0rjyknuIARwdOghJ+0Z23Hvs6uIv8fWjdhF801wTolp2vlHmGW
	IIgWhHpQB148D7b3CKwdLNW89FquBZ/lms9I6R0SHAsYPrTSVkYL2VDf3HiyF3Bf/Tu9To
	CjU4f49T46Em8XtzIAoQfrR5oknPAPomrfzDgoUlBh84XGxWKkYFK4x0AlVyGSJ22RDnGE
	NXLWyXb2HcaMoNDAUoUEfKGdTsjWcNQMM3E59JPKXxkIe/NPPNfXXz2tq18iNA==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
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
Message-Id: <20260414-msm8960-wifi-v1-1-01c081e54610@smankusors.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776105169; l=1316;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=U6pA1aVfY84fYP2Mcf/JJjk/A5tY6QAInlV/pSog1bU=;
 b=uwEnY1ble7sSF78syhQpXffCxdtR7rPEiwh3JFH+/iMEn5zvOd3W9LKmEIwMHjCem+ZnO1ViP
 zK8xuQ6KQxDCY2gnSRC5OQjnS6kBesWimsnNt6MpH7jNL/f7c/vguIa
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Mon, 13 Apr 2026 18:32:53 +0000 (UTC)
X-CM-Envelope: MS4xfG/QsaR8NFMUliYCCXcisZpy8QGAwERd9v8CwfJnc0uSCzZNjB/EtnP+X+v4XiXcsLqHOFY5xZDMxDINhNiJiYuuXV4A0zD1n3YnI7Dyeu3f6IFeC9Sb 4rKru40xrVExBe3hTYFQ0tNl/KVK5ibqlvM9R8BEzcroPuawPwLn4l8CGgyGzmaMOV+tyMkpT1YqSiCiyAbI+Sn+en8V3fJknuLqJ0UctuNRBvMgbfWnsZ85 g036R2jIp2Xvt4SadwoOartRi+93TQX3x6xO3zD2Eqph4wquY7/zipNAVgpn1KtlHY1/6jn344UCp4Toz3AVbJQUGM2hqg4Ujq7zYkwi1nUb6g8/gbTAsv5X dAQIEIOobU1mDeMLLc0JCsv6q5/60Kk7WZbiFvtcd55+dgnHMtZB+MNS6v7jcX/GCdej1bcWNb9Vrsbhk82k0cYD7smMvyFBUmRMdQMDb1ysHFW9P1FVr/fD UG8XCxo+i8013u81TFaBMX8PiHWlYJOEMTwq9cp3l91ri0a8mocfJVDM2Xd0BMWJZi+ocULXI4rXsUJ8E1BKw0J64UW5HkvgMkx6EJXjZeWvh1HnpysIwIne QOm7TKlJ4u5imaoyU9TdCpaNyurQS+QeG2Fz3C7yFOdiWtSbMCwi4gmjB+OyqsPGbQw9E1RYD1u35wVeX73Yo/eP
X-CM-Analysis: v=2.4 cv=Gq4Q+V1C c=1 sm=1 tr=0 ts=69dd36d9 a=iMBLmzX4nuXcozcv68JNPw==:117 a=iMBLmzX4nuXcozcv68JNPw==:17 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=eyO_MXq6ogTu2Ra450oA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,smankusors.com];
	TAGGED_FROM(0.00)[bounces-103013-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smankusors.com:dkim,smankusors.com:email,smankusors.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[smankusors.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 05F653F3551
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


