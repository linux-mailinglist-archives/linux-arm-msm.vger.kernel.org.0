Return-Path: <linux-arm-msm+bounces-102994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Q2fRB/I23Wk3awkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 20:33:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F623F218A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 20:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 470573019D47
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 18:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0DD37FF46;
	Mon, 13 Apr 2026 18:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="bk0ozGkX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cornsilk.maple.relay.mailchannels.net (cornsilk.maple.relay.mailchannels.net [23.83.214.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4773264FD;
	Mon, 13 Apr 2026 18:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.214.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776105197; cv=pass; b=nvncXJrSaOE3zpU/SOSC5zVcH822TM9B+WyLLCYFVx5x18qZBtUAKQl25+Yy5KcRUirVGZNJm+Ratl2xU5UPLttARLQu118vwkl8b74qDssotFFkDmTBOOWI0wrjQYPhFH6Eu3bLzQHzM9mambUHpGablgtNYoP2lxy7gyy5uEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776105197; c=relaxed/simple;
	bh=Ww2L7byaEud2wlOlPPC0VHBxefu7ArzActQ1xzQ+Xxo=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=TdLindtf8urLECRnp05BKqIdVa6SRxOUwOhydc/T6LFWcdVlyfayPLA1AwoO8BF4vN55MkEPVJ6n3XT7GMIm8OUIRZvgaxQ3soBGt02eQ6gSQBDGxg60t5T2E7ygB+t37Vpv9t774wXdr2aP2ftzfkHv81hdcOmnjXJBdUKT1V4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=bk0ozGkX; arc=pass smtp.client-ip=23.83.214.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 7CFF21832C0;
	Mon, 13 Apr 2026 18:33:09 +0000 (UTC)
Received: from fr-int-smtpout18.hostinger.io (100-100-158-21.trex-nlb.outbound.svc.cluster.local [100.100.158.21])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 3A7F1182E7B;
	Mon, 13 Apr 2026 18:33:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1776105188;
	b=3jPXJFURflBqKFGtKsX4mYhrmWivweLisoB8Q0Zca5jPbkyCS31oFuAknbn/on5AdoEWfI
	Xa3YRQ/fNaMdInT9w0YjMMwLvPKbXTQHruxeLXBoKy0e+vvcI78ENWn7bs1NW0qJu9ytfM
	bpy7CS7FFZjtoTRnGVhXSL8hqIL5JbbH+ciTCQhtiTwQnkmeyVYqhgY+vWOn3g1iNU2EoZ
	/FeSc/HnWDfMspFdyR0frgzJ4//Rh0GLxY2vQQ8g40LsBodCZmo/ws55NMMStlknpNxDp4
	9RtnDVIednbfaJO10qniZ0TkWwgGOodmaPsxT5JgBL/t2cuD03BK4NuMtDoSKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1776105188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=hLOrt7GWzqN7L6gtEIDGfyO7wn1+PE+yeSL7v55/rCQ=;
	b=9POWisY9OA9yDGgz6ifFCErpFW7NmxTzVStfZVf4ZJrb2dYuo6h/c0+uTZnWk010XCB3Rl
	NfZ4BZPzLA6B4OWdy1i4K6CzjRbBg4vuTXgstIJXrz9cow4iQDlBVHcvY96g4RIGZcVqhJ
	CACMBaUFZnrSHBz0Ytz+mbYnQrwxFp2F7nKnWjo22UICmCilC8J/eCqzst55fSkkvXkGUa
	EfpDSY7riBlUFUQTw7OYaTPRLAZeviRwtdQMlVJ7vWCnn56tCImD6voY/ClmGHmgNT8mYj
	FicPxaWkqlbYdj1aMDFM5g+UWZvj6ZivN0NJ3D4eyKZsNjO7jh7ankFTsvFLcg==
ARC-Authentication-Results: i=1;
	rspamd-7d86dcc447-cfr64;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Lettuce-Reaction: 0705a1b81426f961_1776105189319_2879898090
X-MC-Loop-Signature: 1776105189319:1944335822
X-MC-Ingress-Time: 1776105189318
Received: from fr-int-smtpout18.hostinger.io (fr-int-smtpout18.hostinger.io
 [148.222.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.100.158.21 (trex/7.1.5);
	Mon, 13 Apr 2026 18:33:09 +0000
Received: from [172.17.0.2] (unknown [180.247.251.74])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fvbcs2PS3z1xn8;
	Mon, 13 Apr 2026 18:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1776105184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hLOrt7GWzqN7L6gtEIDGfyO7wn1+PE+yeSL7v55/rCQ=;
	b=bk0ozGkXwEQDH/v6ajiPvL9YjzGSd+hmrXfEc8IZTSuOkazqwTjyqUbbms7Ib2BIa9jXsN
	hay2cvhYXjdUFJ6m3UMSGxNoTqpdg+4YPSGbt//4fCPHEWOZ0Kfq3CCk+GnViE2/eUsnrd
	iQN03C1fI+ykcUu5DVShSAWwpeUD3eKj/oceGYyt55gZj6F+1rJ6w79hlY2QLV+vwLmFTk
	OcCgbUCfTAJODLB/R9ZP/xlYF/9Equ8QN5YEAXHxhrO35uHs1ROaRijdu3DWz/WIAIXJai
	r6xh17CLPzB1NMNDQ2Z9gfNaLb0Aq6rJPnM8qtqSYz80fG0niE6fEs94P1fFYA==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH 03/10] mfd: qcom_rpm: add msm8960 QDSS clock resource
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-msm8960-wifi-v1-3-01c081e54610@smankusors.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776105169; l=1108;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=Ww2L7byaEud2wlOlPPC0VHBxefu7ArzActQ1xzQ+Xxo=;
 b=terV01MvfE3WaeCxA8rgKHdjGXWw63O128ORbbPDnYtqnkl7m5TDz+Um0GIPxvxiGZzfoT/pf
 CDFYqsOjIlHA10sZZ+KlZYFoJnIIJlRJyEULBFqU4nr+abO92yUJ35p
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Mon, 13 Apr 2026 18:33:01 +0000 (UTC)
X-CM-Envelope: MS4xfB6z5m8LOp14IsAp9URsmS1NYsTtuNvLWmNZGf3ur/tL7jwNeNqej2ASdaI6Qg4zEQlcbPu20Hm2N5VJLe2AUzv2VN7RqFOfMNnjIbZpL8YX3vvaZ27W zZril+txNVFwnZzBqPPqusElnTSbyZ5iCblA61FwzdFDYWgm/NFUg5saQCnUilkbGWhDVUWmZ4i//yfhA4Ldx7SDNo/6cek6uiiJBCgVHH1DIu4SSr89Grux OGpZypvx+EesN4hDysMP4LbB2u1COj53X38B0brvHUuNHne1VqDDPmk8EDWH7wC853PmhDy5eYQ42MOk5nV1PubK8rzHiRaRDGag5xq0B5xfxFIx6MTC7xg+ wZydBYab+y1kFa6HrI1V1RFjz9LSodgBTcfNwRrhZBCbTEOjnIgdeIt38p/lt9N1VVlVApTRBOACWuzln91k4NHV/OgzTRPgXG0fBNpALqZ0SgGsU2YcCIRh H4uh7FOrzy6LVCMIobE+bqckbWHdkxyoSU3Ekjg1vzRLvMeFxBtQKF9GusXa8qjPAwnoFX1+i1HVP1PFSW7N0UkmvyOW95KMfDjjpk7+lvI2vaYLmN6jGwiD 49He1UDLRGYxDXYjvhmGBFotLWAtjSUT6O186VJq2YuqU0cx3CfpvdaKCRLZUL1rdX6KJUg8ETYAFBLONpTloMLM
X-CM-Analysis: v=2.4 cv=GMJaEfNK c=1 sm=1 tr=0 ts=69dd36e0 a=iMBLmzX4nuXcozcv68JNPw==:117 a=iMBLmzX4nuXcozcv68JNPw==:17 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=wxLWbCv9AAAA:8 a=nJejV-BIIyzZXY0xHVoA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,smankusors.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102994-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[smankusors.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D6F623F218A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

msm8960 uses the same clock descriptor as apq8064 but lacked the
corresponding QDSS resource definition in its resource table. Add
resource ID 209 to msm8960_rpm_resource_table to match apq8064's
implementation.

Without this entry, RPM clock initialization fails on msm8960,
preventing Bluetooth/Wi-Fi/USB from being enabled.

Tested-by: Rudraksha Gupta <guptarud@gmail.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 drivers/mfd/qcom_rpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/qcom_rpm.c b/drivers/mfd/qcom_rpm.c
index 27446f43e3f3af01820668d9e34c6ee3aa6c4e0b..0defb3279af1d3eab9ca2f3763c4fe50131b2e2e 100644
--- a/drivers/mfd/qcom_rpm.c
+++ b/drivers/mfd/qcom_rpm.c
@@ -324,6 +324,7 @@ static const struct qcom_rpm_resource msm8960_rpm_resource_table[] = {
 	[QCOM_RPM_USB_OTG_SWITCH] =		{ 205, 119, 82, 1 },
 	[QCOM_RPM_HDMI_SWITCH] =		{ 206, 120, 83, 1 },
 	[QCOM_RPM_DDR_DMM] =			{ 207, 121, 84, 2 },
+	[QCOM_RPM_QDSS_CLK] =			{ 209, ~0, 7, 1 },
 };
 
 static const struct qcom_rpm_data msm8960_template = {

-- 
2.34.1


