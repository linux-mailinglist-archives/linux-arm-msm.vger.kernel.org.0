Return-Path: <linux-arm-msm+bounces-93246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NfQNIhklWkvQQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 08:04:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B5A1538AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 08:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2BDFE3008267
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 07:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB4962FB632;
	Wed, 18 Feb 2026 07:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="Gvp46lDR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from slategray.cherry.relay.mailchannels.net (slategray.cherry.relay.mailchannels.net [23.83.223.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2922459E7;
	Wed, 18 Feb 2026 07:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771398276; cv=pass; b=FShSPuvH7RvAJofyU07CqI8Y6p4ADyZbkQ4YgB+VqYwQA/KDZUvU/KV8Ody6GtA2MrczsOq/hmd0Kcqee4u7bxcyCUbpdRhaW3o5s1n1cszwMGojg3koiZS7NtQM2IxZj1K3f9qyMAU7uWvmPKIzN3r747xwrjitW1D8wvMjM7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771398276; c=relaxed/simple;
	bh=swv3hYBkdi0JsCJRel+eEr3E4QQyesYQ2NqlniSPIDY=;
	h=From:Subject:Message-Id:MIME-Version:Content-Type:To:Cc:Date; b=GmpMbxIOGdlZcZKbCZ46I3bj3ghvS49j6agGS49XeVVgGpW5t0ihefsklxR7CDqMG0eOJLI8QAm6xeh8JY1GjvopBguwn/L8U5BpTlwNP3UBDTC9OgRN7XUEVFt4LtRhyut9E8nXJctwPOrPw93TngaoHxU95bbEZ6HxVmHttKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=Gvp46lDR; arc=pass smtp.client-ip=23.83.223.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 2CEF4222865;
	Wed, 18 Feb 2026 06:59:13 +0000 (UTC)
Received: from fr-int-smtpout18.hostinger.io (100-96-86-174.trex-nlb.outbound.svc.cluster.local [100.96.86.174])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 8A7CE222728;
	Wed, 18 Feb 2026 06:59:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1771397950;
	b=TQIiyUULiw0knDhJO4XCyLODAd42W5n8hYsCEYLkKRTg20sRWhf+Re3ZHvu2lP67m5sxsi
	H92zuHYjnKMVY6oAJifPggijMMVFHJxo46AcCQFNoztloa6KAsk6z7md1m4pcC5DKluMTJ
	k6wulOWKJSUFtHeH+lL900iuYkVe52DmMO0n4aGOWKrGtOKlkMd5hMmg2AX9jIUVqIEQvJ
	sXudwWfMWVI/VuPEE8PB6SgFQ5OE7Y7ZB5ZcjvdQtBY9IJTWmQ4R66GPfYiyYKsNa2cGdM
	AW7Nu223cHnrBDKxP9ImQbhkJJHKHUVyOJocLe/3RQyi2kePNVcZJaQ8/FS52A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1771397950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=ZjHOklPPlCtgj5lUOA6rgXiaIe1UXVwMl1e67l6eL8o=;
	b=smlzCys9nvIuEayg+iLrcS7ha0o2VCEjUNJ7bXFEScVIet0uBRwqOEcimfVWPnVAl3qnBH
	G+K45A6/EQvgZ3Lvq4lAub1GG/TF4t4JgAqeCd5qFCjSTSuZ8AIi0gkXcr4hHmCy5WK+t7
	a1QjDJQfa7Zf33mpocs7f31x0z+rzRCkSXkmgL1Int5O5deaYJryGUJoOp60SEgWwFkU5X
	hOBpFd7YuLIjhfREOifWhYoKo/QjUusjB1lCUtnARN9V3cf6y+qJRoASeZWVNQnK2rDZkG
	KOMEFBihQIyuGMxq9ZuyVe+MlO+f5aeAXvNWZ+eotltWSQGL2sW2kOQDx9e77A==
ARC-Authentication-Results: i=1;
	rspamd-659f7bc6cc-cxhz5;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Descriptive-Descriptive: 4a8a0cec6d500cf0_1771397952747_2857215063
X-MC-Loop-Signature: 1771397952747:630210849
X-MC-Ingress-Time: 1771397952747
Received: from fr-int-smtpout18.hostinger.io (fr-int-smtpout18.hostinger.io
 [148.222.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.86.174 (trex/7.1.3);
	Wed, 18 Feb 2026 06:59:12 +0000
Received: from [172.17.0.2] (unknown [125.163.207.118])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fG6n16xcfz1xph;
	Wed, 18 Feb 2026 06:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1771397944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZjHOklPPlCtgj5lUOA6rgXiaIe1UXVwMl1e67l6eL8o=;
	b=Gvp46lDRzl+7Jj/nxI9VWO53lHCk9FhWlx6Sal/osZUvGvm47omMmhB6sFStzHPo5MMgRg
	XmnprHDGjtLizOTvE1teEx9pLUf1RSK0/FwbrryiCzIW5gApRaASrKWhTRRsONK7GvvsIU
	7MVwV1UpN1JPTMikt6mwRwWfgy8Ct105uvjAYUrs0sqtQdtuxw5aBkBTkuKe8y7kow+2oG
	YO5Eh4RAajjFB2afAcf6AwHfoYie/ZL2zcln858RBIAGJm6CW4j9FueO8rj/F5TI5XE7kM
	aehtr1V96W4S8J9q8CFcgAz4a+iUYx+FkW2ptK8ZIAMc5D+YB5q+44Ll0c+uZg==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH 0/2] dt-bindings: add MSM8960 SPS and RPM clock compatibles
Message-Id: <20260218-msm8960-sps-rpm-bindings-v1-0-bbc11c0d4f24@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM1ZlWkC/x3MQQqAIBBA0avErBtQKbOuEi0qp5qFJg5EEN09a
 fkW/z8glJkEhuqBTBcLn7FA1xWsxxx3QvbFYJSxymiHQYLrrUJJgjkFXDh6jrtg4xbr9dq0fae
 g5CnTxve/Hqf3/QAirh6RagAAAA==
X-Change-ID: 20260218-msm8960-sps-rpm-bindings-48b6d1c45970
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771397941; l=904;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=swv3hYBkdi0JsCJRel+eEr3E4QQyesYQ2NqlniSPIDY=;
 b=pLFKlOvuCv2GBZdVKSSXWszQGLCBht4tZTOwjuwcfXbN/shRcCslnEPwaimIBKg+6CI1DY5XH
 XXchFVpOrJvAr0J3ERFs897Xf8fnLZGB1kPrS5jvo28v97XSw79AUaX
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Wed, 18 Feb 2026 06:59:01 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=ZbRPNdVA c=1 sm=1 tr=0 ts=69956338 a=QVpbo7x4j/ax8PIbKattOw==:117 a=QVpbo7x4j/ax8PIbKattOw==:17 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=6VZjX0cPxt6Wj66i4iYA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfFvC2DJsdtyP5dxtYIHwOcnhV6LLD1zWkmixUmFaWw87Jvf+jn7ybEPEz/Ki+q3oz9PjCRggzvAjSPp1oAqO7y0aSZANkogsaB04paE2H+3W8nfkWtmj WgDJoavW4E0dv1bsNpbRdvVF1vBEwA6W7rtfrSKqqvz9RQI7484x0fOVumLFBOL+q66ndg4cm85rhZjZ3TUtXvChvuDToeh3HUjzsHy5uJWq9BcWE4XIA1ly 7AQgM1s1gLlKPZlZ0XISnO9veFCbI6VH85ZdO5n8uv42+6jCYRun3N55HoG/9FxTIBI7yNQ44JvdwE8mlaC24q/+YyrBvd/JpPmVYKfZ5ZkVFa+c2c12PU4V sF0U7z47JlEQDz2IEtLfEUKVqSHaECalGeiNbIfniQPvuby6KGEtoF2a+syv0qJImuNfe73y6K2P2VbTw8WXyfkXgjHei9d2L0V8R4ze+cTCQdY1HKSgO/Tc Vmws5uDKsroJeNOlJYrJFd1RKcvW1hhJPfbFsdYNacT+mIqkW9Sej+kaL9H0lVvPqgx0BUrTB6HwWqknjLgdpYwzl0aFVLPnPBqjlsIlUOdumItFl4xTo2Mv Rr96FL540NplNSZJC6lk2LhQydHWyz6PSJUWHb+xHl/G8Q==
X-AuthUser: linux@smankusors.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93246-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[smankusors.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C1B5A1538AD
X-Rspamd-Action: no action

This series adds device tree bindings for Qualcomm MSM8960 SoC:
- Add qcom,msm8960-sps-sic compatible for SPS Interrupt Controller
- Document qcom,rpmcc-msm8960 compatible for RPM clock controller

These bindings are required for enabling the Riva wireless subsystem
(Bluetooth + Wi-Fi) on MSM8960.

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
Antony Kurniawan Soemardi (2):
      dt-bindings: clock: qcom,rpmcc: add msm8960 compatible
      dt-bindings: mfd: syscon: add qcom,msm8960-sps-sic

 Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 5 ++++-
 Documentation/devicetree/bindings/mfd/syscon.yaml       | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)
---
base-commit: 2961f841b025fb234860bac26dfb7fa7cb0fb122
change-id: 20260218-msm8960-sps-rpm-bindings-48b6d1c45970

Best regards,
--
Antony Kurniawan Soemardi <linux@smankusors.com>


