Return-Path: <linux-arm-msm+bounces-102996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBYaGWw53Wk3awkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 20:43:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF2B3F233C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 20:43:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42E93301226B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 18:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FA438F94F;
	Mon, 13 Apr 2026 18:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="lXP+lbms"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from chocolate.ash.relay.mailchannels.net (chocolate.ash.relay.mailchannels.net [23.83.222.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A308C388E71;
	Mon, 13 Apr 2026 18:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776105806; cv=pass; b=Rgcy/5PXh5CVKe6kp8+7emVNSrzHW9YOCdq3pdHoNFcXEoF84mdI8Y3O3OyvEfFhzQ18TJQiMfAuJ8EK4Xs/5FqCRKjE+l0QVSZgMyUXJs3PKPzZfh020QcTrKvIe+0joCqJIEYzcreudyAZ2jH93BRmfMTtqr+Lo3WetCzpVQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776105806; c=relaxed/simple;
	bh=dVIwlPo4vsCXSWJ48G4/vf232p/hKTWUCfhv9QzlvPY=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=PpW1LYwJlFqdfPZJDZD/U6740F8LXkyD08I/40IIYUjhU50wQ4Vpqp5VQdNukvpq7Zq+cH2yPVFJ9JdMGU0QpMK4KWn1vie9T6EpMfEKwDJs+UMpqqNKXl1/a1552oNv79UcwDdo/4y62Nx5d/9OOgRi90gLQ9XFYJH9U8+Fhk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=lXP+lbms; arc=pass smtp.client-ip=23.83.222.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 9A3C41249C3;
	Mon, 13 Apr 2026 18:33:14 +0000 (UTC)
Received: from fr-int-smtpout18.hostinger.io (100-123-14-30.trex-nlb.outbound.svc.cluster.local [100.123.14.30])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id CF0DF1232A7;
	Mon, 13 Apr 2026 18:33:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1776105192;
	b=tD50Xse2WkJvfgCPt5P5F9V2N8WwOqBa4Jnfv2oqhQ3CFR686GPdpY9yoQ5IGbHkfpydGe
	wijsI4a4b07zeWXPiN8wcrRERgjs13e+/SVV4R6EbPP0alEhWdNUIhqI1Y8aHj/Q//MamX
	m8pjCAOtJVPQZnX5r9TdHq6gzuyDFwUF3h+eLWvTomGmPOZuxCjLKhGdjWTWWjbT7vcL4W
	C6O6AIxGaR4pk2cqxuU8Ud4BumzvPmEfjLZIHIbXi0bW0IqYm7S2nqiHECkUfX+7mmVhNZ
	fI+7i+3npHCY1cHuiwuzpZYP+mBYxCYyNPUfqp5HV84yy+u7RJdYUV6+W/VQBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1776105192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=4Zg5iAXA4WPycq2NW8UBsFoeCBoUtmXoLiY0h+yFQwA=;
	b=n3SnLRzlCPPgbF2x9T0qaTu6tdWt97QmbqdRMnDEqzafZUiPFraDwMUKgBy8aCJ9jw4w2N
	dz75GCnXh9MwYPsmiYdxrPs+Sxfg00tvDaOrmV5PXe81hGPV+7ehtYr+0EfEKGJIHm38YQ
	gi9PrGvlfGRk0v/DKSuIlLrMGowP9nU4eyKnkkwClEpiOEhAlByuzFeodTYfXHcrcK3+OC
	zTmX5iv+v9K/wEuSBX2Ch+PMCyhRS/Z3OgDBHw7ycDS87rjwQy85hTKVYF6ZlNrrdtqacm
	8UltfDaiKXZL7InazBgGF7yBuyh3MEHB62F2M0nW1Rv99tCXilBVqVbA6NCb2w==
ARC-Authentication-Results: i=1;
	rspamd-7d86dcc447-6rhr4;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Tangy-Bored: 6edf7d1b03545cb1_1776105194395_632526818
X-MC-Loop-Signature: 1776105194395:4045704726
X-MC-Ingress-Time: 1776105194395
Received: from fr-int-smtpout18.hostinger.io (fr-int-smtpout18.hostinger.io
 [148.222.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.123.14.30 (trex/7.1.5);
	Mon, 13 Apr 2026 18:33:14 +0000
Received: from [172.17.0.2] (unknown [180.247.251.74])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fvbcw6zqNz1xtG;
	Mon, 13 Apr 2026 18:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1776105188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Zg5iAXA4WPycq2NW8UBsFoeCBoUtmXoLiY0h+yFQwA=;
	b=lXP+lbmsNI3P6G2e4vvJ3oEAIkeh6svnRYohluzoj+Q6say4TvXdeSwy8eWx+KhDNI7vUm
	gWX4NEBumoBs22aC2ryZTlLFm70RbuoH1I41ONfiydixb0P7nKOsXrmLJVU5kLVv/bjDLb
	lawibR+vaJ6Q/kB8I/X0DazhYnTQw34G1SP3nj/j+yIcdPQy6C6au4ORciIO5HShV0Cb0B
	XBnPX+KhruzPj9g+Sx+HZfoVnj79rJ9bOMJsfRwOHYseusnOwOIRJJMSL+T/6QdY5+9pPk
	WfowClmUz2ALBWJYTCwn/OqKN4oUHyfNmX88Cs7gRKj2j0JeP3TBaNtu1YYwbA==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH 04/10] clk: qcom: clk-rpm: add msm8960 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-msm8960-wifi-v1-4-01c081e54610@smankusors.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776105169; l=1121;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=dVIwlPo4vsCXSWJ48G4/vf232p/hKTWUCfhv9QzlvPY=;
 b=ddXLhxLp8d1Q6vHOa8M8DQ23SAdX30gfL7ULXWl8/YAnqvNAz+6ejOTV+HPJ0vCWQBmR/PP5v
 CpPSxxdNNfDCykaucRWg81I3CrUqczl6OvuRPN0iJcYlrROCMosr5n2
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Mon, 13 Apr 2026 18:33:04 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=ZbRPNdVA c=1 sm=1 tr=0 ts=69dd36e4 a=iMBLmzX4nuXcozcv68JNPw==:117 a=iMBLmzX4nuXcozcv68JNPw==:17 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=wxLWbCv9AAAA:8 a=71QVCaQ_XApMQrzpv04A:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfPeHX4nW/IyboQ78A80L/blGLkt4LYhubNtOA+MspZVVlZU83Olzku4esXkYJhwAkiYuroLMYUuZJEAgA7LuhwQkXwCPEFMhx8rz2OcVcfbwQ7hnIUXv rW4ghf4UhZvZGsi7wC3BFrk8GY5XUOZ1MQk9geVDAbo+0+dlPOMQJpXtH63jZ+s6p3UNoYiOEgqDv2IrsdAUUreNMh+ezMfEpO1dsuJcd26Yu85LM5LLE8Qo YddYo9QJWsv6m+HcdAKTr/Y7YhjHtKAxAmeYmzvmv+ELeKnSEBuCFkmH7ynA/zHs/w09SoP+vgi5bbtGSc9/2E+hTbPyuMFv3qsufBkASw5KTGs2ek38nHWG wklYDiZb87o7kUFRhTXRO20rhjB53bAxn3Ln1vp/k7JbG5Q+BkgBnHdG9lSRJA1qmYWOu3wTOyXnJwc7l+GXa0q1GNS+nt4y5uTLVEoWLo1DIZvxXaNOkXCj G9zClZBEoYiyis97RhSMTrrz4cliVS10w9HbMFDMW9H41WTdoAcNUebxRgHerec20CQ/75F+s/JtEav1WNsKEBScwVyKhwFKp3hse6BpDMUtTL8zTna9qZX6 rl/b4A0qF3a80N8x/A9VHiRO49w7r2YbTDRf8CDzd+Lq4T7gkyXt61+iFnQitcrOpEyfgXS7g4LK4utSzVHvIgti
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
	TAGGED_FROM(0.00)[bounces-102996-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smankusors.com:dkim,smankusors.com:email,smankusors.com:mid];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EBF2B3F233C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the "qcom,rpmcc-msm8960" compatible string to the
RPM clock driver.

msm8960 uses the same RPM clock descriptions as apq8064, so reuse
rpm_clk_apq8064 for this compatible.

Tested-by: Rudraksha Gupta <guptarud@gmail.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 drivers/clk/qcom/clk-rpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
index be0145631197bea65438f3bed10344f18d6de802..601f602741131f4bdc24d1d3846b12a38f5d594a 100644
--- a/drivers/clk/qcom/clk-rpm.c
+++ b/drivers/clk/qcom/clk-rpm.c
@@ -502,6 +502,7 @@ static const struct rpm_clk_desc rpm_clk_ipq806x = {
 static const struct of_device_id rpm_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8660", .data = &rpm_clk_msm8660 },
 	{ .compatible = "qcom,rpmcc-apq8060", .data = &rpm_clk_msm8660 },
+	{ .compatible = "qcom,rpmcc-msm8960", .data = &rpm_clk_apq8064 },
 	{ .compatible = "qcom,rpmcc-apq8064", .data = &rpm_clk_apq8064 },
 	{ .compatible = "qcom,rpmcc-ipq806x", .data = &rpm_clk_ipq806x },
 	{ }

-- 
2.34.1


