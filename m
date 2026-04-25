Return-Path: <linux-arm-msm+bounces-104545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFcfF0k57WnEgwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 23:59:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B554D467F2E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 23:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95F40302C145
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 21:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6569B378D86;
	Sat, 25 Apr 2026 21:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="hmidBSMY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from serval.cherry.relay.mailchannels.net (serval.cherry.relay.mailchannels.net [23.83.223.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2FB36C59E;
	Sat, 25 Apr 2026 21:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.163
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777154277; cv=pass; b=XuvX2uXAKAYT9qDClF8ycohnOQ7LrZ1htmBfme67lSkK2N07idgEgbOotrTlM1ttgiT0cKYXOQfoZhtA0WZJumBbEmMIGwX55Plc/BLGL1Sp14de8JsualzyvSrPtHqLrgx8ecWB5n5ioTq6PgJHzSk2xzRt/5NnloVu2xhq11o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777154277; c=relaxed/simple;
	bh=gVqVN7B1O6IkBPk/jTzDNKpQUQDktMQaRtGAP+CntAc=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=PLdqNo+KKhFf2Z9CuifofrDs8EIfzH9Qk6G97HvmamIz3gbyrp9l94kJ333IqhaKLqiOncaG+3cmVR94FaTKRNh6iRqmCyW1IMjWqmK1b6gV/yoRZEzLZozpEOR01b67RU9v9VN0RBiyxY/MteYpGLkDrQ6/knu+4JCzh9bw4r4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=hmidBSMY; arc=pass smtp.client-ip=23.83.223.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 5CE414C0F4F;
	Sat, 25 Apr 2026 20:39:35 +0000 (UTC)
Received: from de-fra-smtpout8.hostinger.io (trex-green-9.trex.outbound.svc.cluster.local [100.96.23.217])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 19CF34C0E41;
	Sat, 25 Apr 2026 20:39:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1777149572;
	b=EOYBsnUSiF3wh9gZKOdaFrNcVQjYx8FCjTl5TBAqZKVxCF62tbFkEIz7htFlksqXdbaHOh
	g36lTpPyKcvTuTEl/+/X0xLQRY40PD0UfMLM36V5XZD6hHymEVAHXrqZDA2XoYUp1Vz9RS
	1ocV94RWgSHYi99r3IBNUEJmRLwVavVa8/L054PLf4QGpqtMOeMm/dylBLMIZ69adfrywo
	d29yIQIkVnGo/dQ7HnH0RZwKV/ibTHQ8G+G4Lu6ITNWptk8ycn9U8PtoiiKLC1Hhrkozm0
	/He7hgIeT0mmSBccYoPH18EWux0tlybMZQ2iBJwnQt+WuNwKIDEd4ZcTnrcGsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1777149572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=B+BujSYgGUrdoEpu4G8/8yAUUC4EjhurGkaq5UsS9Ck=;
	b=s4T7AH/DI42nLOWYkWVxpd6ZF29Uq8I8BgU6DlajsSN6wjYGxpAfzE4hrBIS7kLR2uV6Bd
	k0jHfRNwYrSWT5II+apbkEpIja4G+lv04WBmy17ehmwTzLlhteh4tDmzH3YaWgl8C78TEh
	MKFE63jGcgsdvnqTkEbyliykzCt3uS0JuPd1dw/8RvZ0+f5kfohG+g0vuAwKXZ0rQpp71s
	WL4hIgtJFItEX5ATvzgC38Fl7qAC+hEdrs8wEN/ISUJE+0aQh1A3UYcGMpZL3rLf34KLNw
	uJ0sckg7nJ1EGaElSqAfloPmCev5OuZsuAicj/Qmn055xKdR32SU3e8lpG704g==
ARC-Authentication-Results: i=1;
	rspamd-b9d4fc544-g2m8c;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Share-Average: 1028ae072d826b0a_1777149575295_276685588
X-MC-Loop-Signature: 1777149575295:731139416
X-MC-Ingress-Time: 1777149575295
Received: from de-fra-smtpout8.hostinger.io ([TEMPUNAVAIL]. [148.222.55.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.23.217 (trex/7.1.5);
	Sat, 25 Apr 2026 20:39:35 +0000
Received: from [172.17.0.2] (unknown [36.79.100.152])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4g31s43Gtzz3wqY;
	Sat, 25 Apr 2026 20:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1777149563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B+BujSYgGUrdoEpu4G8/8yAUUC4EjhurGkaq5UsS9Ck=;
	b=hmidBSMY1/ytei5QseomdxUTQYulRmAmzgaeKa8sUzFcFbwrfHvPlam7fMkgWUyQDeR28z
	zb8eLYk4tZbkFTYNghJyhYxNUFysHzYO8GMMdzTaT9D7ftFVswGCG2lvw0NJJNiLrGS48V
	55yQYBW3GVNlC5ns/4HF29qdPD2OvsltsEKDAekiUQ/zBYm4JMQGcRnR3/VZ3VtpBr35x/
	Aq9p/fDXAOztAVwXL0rN+/ilb0eoBrEmxM8PkWsrqDeDFuST4ORkCodChIEJw5Wf7p6OAH
	jMq49KI2iu0LKU4/6JwuRPdcjj0LTLp5EXHm2HaCwWJT8pkp4DA0rrKNQP+QjQ==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v4 3/4] iio: adc: qcom-pm8xxx-xoadc: constify pointers in
 read operations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260426-pm8xxx-xoadc-label-v4-3-0ec782362615@smankusors.com>
References: <20260426-pm8xxx-xoadc-label-v4-0-0ec782362615@smankusors.com>
In-Reply-To: <20260426-pm8xxx-xoadc-label-v4-0-0ec782362615@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777149546; l=2605;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=gVqVN7B1O6IkBPk/jTzDNKpQUQDktMQaRtGAP+CntAc=;
 b=NVIj8qiHexXCTP4iX9RlNi9EQLE/IfKIdG9IDdozAvOz895ZPur65NK5t0uO0V7AXHpJaMtat
 viRgsfde1PXBvBVhG0+FQ35QwVRda30F2sTjH/Fb4sZbQKP5UGADocq
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sat, 25 Apr 2026 20:39:20 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=etGNzZpX c=1 sm=1 tr=0 ts=69ed267b a=ivwHvKELjomHP5eB21RdOw==:117 a=ivwHvKELjomHP5eB21RdOw==:17 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=28uWT8Qvm3ey_qsjFoQA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfIY7vQoellI/QEiNdiWSDghaeF2C5w6CMJY6xPUR5cInDA+Qhme3tByRREcMQ4TECpVvLCb5uwgJ0KCntvM/iq9bxv1zzahpqqljDU6M8ZurDzw2uLDa qUdgCdkIWy0eafYaXToeA5PEBQ7wdUOk1slBYfbjLYiVfGQDX3gTvxVBTlzrpfpqkcdU7VsJAP5hsYdj1jMLI6B+j2BmayI7ZDLI9ifLluPwBCZwiTONPdWT 4tMBaifYXeOF7pKaGRz+4pA19uwQN5zhJ5GiTzIbGa1sdAf8oAZoiNjtfBV1/XOdxMR4GqfZFT+qQecXb1AvWDDhC76WojxpQmoYSbpAxssvdnUymEGtueuL /bhFosSVp2wc+DdlUDDuMQgHuvJg/Kiu12PhwvlkqHwbOMX56GqfA1QuniVvvY2ItM1YK2jnxGDmFQxkJS+MQGJ7RxbaJsN6SZXmGnYnsMWsNQpspUaGrEAc zvf2YSAhsM7UqLQ15kVKEgtEbthJe4NgbXwmra9/AI/usiwhX+cpYwSM72FD5DzKyDtB8KIu5ULM9+0EEWtjegCg/5Jo3yNUbxahBjPviSY0rPDC6iEWcGJk 9aWn/AGIWz8PfsjD7OZLMT3LUow+Lq+cb0ST8XDilQPGNGJk091vqRdxxOvbs1kce0k=
X-AuthUser: linux@smankusors.com
X-Rspamd-Queue-Id: B554D467F2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104545-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[smankusors.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

These functions do not modify the indio_dev & adc structure, so they
should be marked const to allow the compiler to catch any accidental
modifications and to document the read only nature of these functions.

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 drivers/iio/adc/qcom-pm8xxx-xoadc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/adc/qcom-pm8xxx-xoadc.c b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
index 89858e81c859..2ee080b27d93 100644
--- a/drivers/iio/adc/qcom-pm8xxx-xoadc.c
+++ b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
@@ -414,8 +414,8 @@ struct pm8xxx_xoadc {
 
 static irqreturn_t pm8xxx_eoc_irq(int irq, void *d)
 {
-	struct iio_dev *indio_dev = d;
-	struct pm8xxx_xoadc *adc = iio_priv(indio_dev);
+	const struct iio_dev *indio_dev = d;
+	const struct pm8xxx_xoadc *adc = iio_priv(indio_dev);
 
 	complete(&adc->complete);
 
@@ -423,7 +423,7 @@ static irqreturn_t pm8xxx_eoc_irq(int irq, void *d)
 }
 
 static struct pm8xxx_chan_info *
-pm8xxx_get_channel(struct pm8xxx_xoadc *adc, u8 chan)
+pm8xxx_get_channel(const struct pm8xxx_xoadc *adc, u8 chan)
 {
 	int i;
 
@@ -435,7 +435,7 @@ pm8xxx_get_channel(struct pm8xxx_xoadc *adc, u8 chan)
 	return NULL;
 }
 
-static int pm8xxx_read_channel_rsv(struct pm8xxx_xoadc *adc,
+static int pm8xxx_read_channel_rsv(const struct pm8xxx_xoadc *adc,
 				   const struct pm8xxx_chan_info *ch,
 				   u8 rsv, u16 *adc_code,
 				   bool force_ratiometric)
@@ -564,7 +564,7 @@ static int pm8xxx_read_channel_rsv(struct pm8xxx_xoadc *adc,
 	return ret;
 }
 
-static int pm8xxx_read_channel(struct pm8xxx_xoadc *adc,
+static int pm8xxx_read_channel(const struct pm8xxx_xoadc *adc,
 			       const struct pm8xxx_chan_info *ch,
 			       u16 *adc_code)
 {
@@ -647,7 +647,7 @@ static int pm8xxx_read_raw(struct iio_dev *indio_dev,
 			   struct iio_chan_spec const *chan,
 			   int *val, int *val2, long mask)
 {
-	struct pm8xxx_xoadc *adc = iio_priv(indio_dev);
+	const struct pm8xxx_xoadc *adc = iio_priv(indio_dev);
 	const struct pm8xxx_chan_info *ch;
 	u16 adc_code;
 	int ret;
@@ -948,8 +948,8 @@ static int pm8xxx_xoadc_probe(struct platform_device *pdev)
 
 static void pm8xxx_xoadc_remove(struct platform_device *pdev)
 {
-	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
-	struct pm8xxx_xoadc *adc = iio_priv(indio_dev);
+	const struct iio_dev *indio_dev = platform_get_drvdata(pdev);
+	const struct pm8xxx_xoadc *adc = iio_priv(indio_dev);
 
 	iio_device_unregister(indio_dev);
 

-- 
2.34.1


