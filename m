Return-Path: <linux-arm-msm+bounces-101619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCJNF1aKz2mmxAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 11:37:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1FA392DB8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 11:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A922530C851B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 09:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE31A377559;
	Fri,  3 Apr 2026 09:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="UhOUmV3h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from iguana.tulip.relay.mailchannels.net (iguana.tulip.relay.mailchannels.net [23.83.218.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBA8199FAB;
	Fri,  3 Apr 2026 09:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.253
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775208660; cv=pass; b=S+7oEO7Ln0hmXYzjvxv9bSNq33fbH3qfW1+eZnN1ZwXG5KvHW/aJN6JTZFqwJXZSGx4NtnnyFWU13DciezsFUEBPzkddk+GeEx+AsK1y5DtdpK8u4SyByy9HLF/6j8cxYyU6qgrFrjJc/YpXx7V7/2KYJqnRzhW8gf7gNKm9cDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775208660; c=relaxed/simple;
	bh=MCKp5BgyrOI2gWNQS7Xq1slMRXMiXrIKzo2KXcjeeKQ=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=EGEircUQLcu5y0vanU498MGVnWcsy79CS1Sp2AJgjLNAv4h2Dgs4lheP+Hj4gMQTw1EzrTsmEZFF4nOflHEqQSK/oAh5ZJFYC38fyIjiS0SJRxg0NmQkWgxyIebe6r2QSLClb3aC4veWpUndmCcbTB38W+4c+J9OVwKrFgMIl14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=UhOUmV3h; arc=pass smtp.client-ip=23.83.218.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 82AE7402876;
	Fri, 03 Apr 2026 09:23:29 +0000 (UTC)
Received: from de-fra-smtpout2.hostinger.io (trex-green-5.trex.outbound.svc.cluster.local [100.96.137.18])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 965E04026D6;
	Fri, 03 Apr 2026 09:23:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1775208207;
	b=SHbt0dEkklB0un4Q5XrL/WHkD7p0l32eidXZisnzsOVZJoWnaChtCAKTk2ZI9EDNvWw9J3
	vOUaUa/pVOTbNyGs+h6cuPX21/TLSMvTZNYsjyA0Yq2yF7OBY/TrK3POwuGQXlfuzFvBNz
	HWRksN+brVDymQM+WRxzwhdLELhwgiqSoD0mSmK1S6jbomGlCtydya1OanZHpT10Ksb/QP
	jAK+oI3SDpkL3EBQErRTkYZHkTN7chO4xnLMw9bL23O0ms052XNPzWWrC1se3nFnzw+4Fr
	qVYxJFGIZ2ooDxw3KDsGogoaOWYenAoFkKc1GZApdMX2iDELknBC3NodlPiaUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1775208207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=V/KSlXPRP0Wx65x3aW3BUrT0hLZy34Lt7a795lyhn0E=;
	b=IEbF3gvrDUVBkEjt3emtRLG5iNKCIGlR0V+EpbttrVkDtIkJB+lWgO/4gV/9t0P3Yp0dL1
	UgevQG3ofk+Cdikvv0vo2AXfuXwTzYoN7frggWI2d6FBBY1dm/bfXlKK97w/9hSDsEmemf
	exES7KFsbTlrPi6B9n3deQTaD0zRWyrc7G17ARaH4niCaxuOGkEspg5NUJUNB1HxpDEK1V
	6OKQ1fGGGzNOUYg6cwdT2/Q7Mfti6H6XgO5ETJavBHBZJIPTwIyJfuL4ilW93vKoI7WUSP
	iBdhI1GJPpbsRHwyqDo191AvAjYV3Y+1d6oahEWttvXpISQ2xMTTbUIp7wKV/A==
ARC-Authentication-Results: i=1;
	rspamd-bd48b9d95-mj7k8;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Attack-Glossy: 0d5678063590201d_1775208209373_2547522738
X-MC-Loop-Signature: 1775208209373:2709443968
X-MC-Ingress-Time: 1775208209373
Received: from de-fra-smtpout2.hostinger.io (de-fra-smtpout2.hostinger.io
 [148.222.55.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.137.18 (trex/7.1.5);
	Fri, 03 Apr 2026 09:23:29 +0000
Received: from [172.17.0.2] (unknown [180.253.47.239])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fnCvB4hlcz3wq2;
	Fri,  3 Apr 2026 09:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1775208201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V/KSlXPRP0Wx65x3aW3BUrT0hLZy34Lt7a795lyhn0E=;
	b=UhOUmV3hm9bvVKyaGIs8tvETzWaGWJadyOTbwDPALAuRNRJsGM5cegWvi1JgnEMl4Wjf8s
	JdpNUbmcQmP93tOhp+Kt1l8gicsY2d2VruvjEa7EuXxGGMWq6VNCkdIzWuiCHSqDeCqiC7
	41LMhsS8bqi/llFpgDFKVfiMGyMj5hA3SwQANFEkjK/PE7shLQrl5Qt+ZWJs7et7wzih8X
	kByprBHDffCLWMhXgEZVrPherFk99pbJbB5d5V+5wr4xWClq2IeoBXohTdCQHvGp4IF34a
	ecV6RxxBImEIr3AP3zcgq7MGB5HmFH1uKZCVQmk58RbdSnIabvs/EzVykL1eJw==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v2 2/3] iio: adc: qcom-pm8xxx-xoadc: remove redundant error
 logging in pm8xxx_read_raw
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-pm8xxx-xoadc-label-v2-2-29b50bf821e6@smankusors.com>
References: <20260403-pm8xxx-xoadc-label-v2-0-29b50bf821e6@smankusors.com>
In-Reply-To: <20260403-pm8xxx-xoadc-label-v2-0-29b50bf821e6@smankusors.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775208191; l=1341;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=MCKp5BgyrOI2gWNQS7Xq1slMRXMiXrIKzo2KXcjeeKQ=;
 b=sf5Un80sWruxJjCxs+FOJ5PcoFwz0XFvBKPL7PktiqIQV7+moAX02JAkzR19zFCiG/xRW53yc
 m3BOl1Z17E8BvEMQUoL67yLaO1xYYsRIBR1uD5a0nn+lT4ZaDnc8MYp
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Fri,  3 Apr 2026 09:23:18 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=ALriHGRn c=1 sm=1 tr=0 ts=69cf8709 a=EXl8KfDnlL3m3zOSb15mOw==:117 a=EXl8KfDnlL3m3zOSb15mOw==:17 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=KG3lkfW8n762lDnNdHkA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfD3opop/HP4BSN5rN8kz2ZdU0byhCSOx05DonNVURBJLU6d2AWy63sJln6p/obUZ8ZpjkDidR22O2emHk+ycMynC+cKRlpQT89zCaxgJ3SjnXE2Q4/5f NVUnTaaG7+pghYzE7QeIpdT7TfkIhajXK57rRkCnryg4955BWSy70EE5dFUBnmEZlTfiDla7Zaq7ONvFNB2q3LF3VTSq2rFMmgldlIakKfol5e3mU2VtSque hvN409snGnnU+PcnEk3WO8Ok8jzvCMsqMBh4M8kOH48Ot24DOV7LPv3ol/zCBpXvpMKWRStkjP7vR6l4Ptr3Q+fpdQvOMqXd6hg+aOxDUJmPQmJrNH0sZff5 hO+mORpa1W67iC6I0r8UaCBtHJOPjrd09Mm5VNZrq9KqxSnVnTTNfYQFXs21DwkebwLfRWArwjZn8iiHVXB1imqWXNfP7liNe5CzVLD5zPxbAu15U7f+NDgD I1miO70AjUrIPP1AouKYsyRduDgNR4LqIlqcp8+3Cicy01eYt8Vg85O6Hpat++V6BI7PENBL8lIgIQfgcOKWWawqSIk227ygm099cs6BbCnW1dvmWywRyUtz So+dCw2EOtekXHboF2GvUenS5cGOk/wj07m5KpcpN+BLb4qxu1adqS35/zzNjc7Ikys=
X-AuthUser: linux@smankusors.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101619-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[smankusors.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smankusors.com:dkim,smankusors.com:email,smankusors.com:mid];
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
X-Rspamd-Queue-Id: 9D1FA392DB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove dev_err() for missing channels and rely on -EINVAL to report
failures, reducing unnecessary log noise.

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 drivers/iio/adc/qcom-pm8xxx-xoadc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/adc/qcom-pm8xxx-xoadc.c b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
index 31f88cf7f7f18297132d152648b312c0fb60608e..d63af84bf44776c9c7106a43473b1678496247cb 100644
--- a/drivers/iio/adc/qcom-pm8xxx-xoadc.c
+++ b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
@@ -657,11 +657,8 @@ static int pm8xxx_read_raw(struct iio_dev *indio_dev,
 	switch (mask) {
 	case IIO_CHAN_INFO_PROCESSED:
 		ch = pm8xxx_get_channel(adc, chan->address);
-		if (!ch) {
-			dev_err(adc->dev, "no such channel %lu\n",
-				chan->address);
+		if (!ch)
 			return -EINVAL;
-		}
 		ret = pm8xxx_read_channel(adc, ch, &adc_code);
 		if (ret)
 			return ret;
@@ -677,11 +674,8 @@ static int pm8xxx_read_raw(struct iio_dev *indio_dev,
 		return IIO_VAL_INT;
 	case IIO_CHAN_INFO_RAW:
 		ch = pm8xxx_get_channel(adc, chan->address);
-		if (!ch) {
-			dev_err(adc->dev, "no such channel %lu\n",
-				chan->address);
+		if (!ch)
 			return -EINVAL;
-		}
 		ret = pm8xxx_read_channel(adc, ch, &adc_code);
 		if (ret)
 			return ret;

-- 
2.34.1


