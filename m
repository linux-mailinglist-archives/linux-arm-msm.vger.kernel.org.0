Return-Path: <linux-arm-msm+bounces-104544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDRaBqQ47WnEgwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 23:56:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C57467EC3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 23:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92888300B129
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 21:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B36F43624CE;
	Sat, 25 Apr 2026 21:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="B415J5bb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from buffalo.tulip.relay.mailchannels.net (buffalo.tulip.relay.mailchannels.net [23.83.218.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDE4314A9E;
	Sat, 25 Apr 2026 21:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777154207; cv=pass; b=bexgckRUjQogcC7DjC7Ka7UMxzAu+wQZp0SPch0dynpC7pjpT0h+SXrjsszCWU8/ZprKoCj2P8gHKreeMjz633fuhL+BHTQiJDYoXxBNnev6WMnyF+7gcBboz7zN0BXrvnBgTx/Cu9LFFZ5TbPBxN7LU3v7vpik9CDY/3PPWWAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777154207; c=relaxed/simple;
	bh=mltS0lNffyFe8OV7KjnOk1JbOoIpjoYboNePj7eHJBc=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=WyoH5WKOhDU/K60j3AOyBKQzsLc8Qcf9ln0AqUviix5fpFQkEugnDkmAOC7ERzg/JSDZvmWHqRa0aHcTwPWo0scAiEdJADER1bbMZ3i/yjhf6r7edmlKYagHKe305+ZaNE1Io3szlV9CPm+rex286J+3yvpUyXQybVmGxMHFA5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=B415J5bb; arc=pass smtp.client-ip=23.83.218.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 85D7E7E1C92;
	Sat, 25 Apr 2026 20:39:27 +0000 (UTC)
Received: from de-fra-smtpout8.hostinger.io (trex-green-1.trex.outbound.svc.cluster.local [100.96.24.226])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id BD0757E1103;
	Sat, 25 Apr 2026 20:39:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1777149564;
	b=itr2IfZODRBN0biS9HBGzSlnjYSXVT3qWD1sE1lcttVbhPcoGqeGy3NpBTSWVGG5ka2li9
	+i9UWEIkxy5//lVn+9ltQwCBX0diH7vWSsRfhPafrLP328I4KNzX5H9RCmLaSF1Gq8IpdM
	+JmA6OiRfVVUkT6WV/yZbkJ2eZhj1j3/q9w7qTFguDc9vfqyBcD5m/GaHP4rpoxjfxrZBZ
	DqTguzg4PWUF27KqANNpXb/7IwUc0J53qQuZuQT2IeQMLQS5ap97AHLqSVpTXk1T2YZyOx
	qw6jcO2MlLOtTygAQZrKxLkHhqKR8kj26tsTlHDqsuKVfb3063aV2KzFb/7HpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1777149564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=7AYZI01aPJnMQhaQvHFyZtCblGlVMaOsDhrTfhnMqfo=;
	b=pvglmrenGFFaQsEMXZk0xMfjWL3eza+Oow3Y96IlXusNq4g47Uerohn0tIuDLgFvG/VKFo
	A9H4PJpgdKBWLK7P25ySW9IVnbETKRh7rdBXtkJAQCCOGUP/OJ6hzmH3LH/SJwvtlAmvgu
	/jTBfrd0bvuk7omNHlnSkugTVN/oeVK1Uq8Vg44NXMH6LlEWiAFFbbIGBZi/0MZnyVXTKD
	5Z065vBk8QpxRwg80npOBz8gRbTUzS8MJGG2Jwa072rxtS70+Hd3qvFfjdtf0aMfdh710g
	EEbjV9clyMgSJDtCzCv+bE7Q0I9u8IDPmZMjYBSQyCagOzW7yT3x/vpUyBMjGA==
ARC-Authentication-Results: i=1;
	rspamd-b9d4fc544-b49hp;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Grain-Cellar: 7a2b60911f4acb9f_1777149567175_3376126067
X-MC-Loop-Signature: 1777149567175:712100887
X-MC-Ingress-Time: 1777149567175
Received: from de-fra-smtpout8.hostinger.io (de-fra-smtpout8.hostinger.io
 [148.222.55.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.24.226 (trex/7.1.5);
	Sat, 25 Apr 2026 20:39:27 +0000
Received: from [172.17.0.2] (unknown [36.79.100.152])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4g31s05xXPz3wm4;
	Sat, 25 Apr 2026 20:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1777149559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7AYZI01aPJnMQhaQvHFyZtCblGlVMaOsDhrTfhnMqfo=;
	b=B415J5bbaNhYhGlpAuNffUsI57yt21vdzVGGbwz00PPbggDowdhaGQ57UUyamVLHCcP83I
	WsGeiVuo9/XOqW0QZDGzxqE2nZT8v9RqWvOnB2ieqeD8Y3+/0M2rMz2mJYMF2xbdu0Vy6s
	WOnGJ6iiJNcbrdTzNmqwhO3NNbH6mnDjj1qJs3dlXQsfTg0qlBgIqv4CheVmjqoKab1won
	1+U9kd4d5Ra3Qt/LFIIb27N0zp6E+4X7kFtLKiH46wTrLnSwzztj5yMTGUG4kXUl+x8HXl
	jSqu0OCbU/IvnLWy5r+uX5G6dlHEqE6giO4REgSQm2lqRHFvBKLrqTCJKAl98g==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v4 2/4] iio: adc: qcom-pm8xxx-xoadc: remove redundant error
 logs when reading values
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260426-pm8xxx-xoadc-label-v4-2-0ec782362615@smankusors.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777149546; l=1799;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=mltS0lNffyFe8OV7KjnOk1JbOoIpjoYboNePj7eHJBc=;
 b=/oTV1Zee/hIN9RAddSIQfqzhBYjuZkuYNdo+eEv4waB8hXn6szN9XMqx5wz6hrV06drdo9zr9
 2l9xM1FLzsuCTPZLLf53HJKPONDFb/KvSXDSZ+k+snXKBvtNaSsowO3
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sat, 25 Apr 2026 20:39:16 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=ALriHGRn c=1 sm=1 tr=0 ts=69ed2677 a=ivwHvKELjomHP5eB21RdOw==:117 a=ivwHvKELjomHP5eB21RdOw==:17 a=IkcTkHD0fZMA:10 a=EUspDBNiAAAA:8 a=wxLWbCv9AAAA:8 a=KgMSzCYp6QPDUwhpC-EA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfOYBuCpzuA1pNNRnIndxzNeIg6PGqArK8Xp3M+gvetj0jwcnBkiNVEWY9FR3O/0AKqKL9O6vMmd6rW89wTSJg39UKZxNwyYi9BXmYO1aXIlh57uqu67M N7iylDUv7ZQhVM1yLo06bIiNSVM6ZkIKdxKhyzanBf7cupqn+3j9KZRUnRlfGSh2wBN6x0q07h2M7AQbRTTmcFjaH+7Mkwm2tGSXx2Mtlyp4Q4j0rjxJ6Hxb Ya7dwFXBX5BcF/FLIzxFWojDMdH1ZbPrKFYTjsZxTsfbYccYZnTL3oNKGKP1rv+B65i/6rTmwJGzVdjc+2WtHpHXE/kv4WM7CrdDNaYAXlSNNCfSY9YlpN4g ZGjd5d7y6PJ/6BWp2Ofktmtn4ImQAVE+lAjS/XORQKN1QtFjFuySWjghMGMYdYD7FgIar2etG0Baq4Ggr4CRxdn8oAdN/M0sn/j6wRrpElnPlPNsSwbLjYxD 2jG9i/9QOi/dRgTHUd3Mw4U0/oryBI3QBtndLSRObAicCkwAE8xDWV4Vb0YPJe6kMZaTO4sscwcm0frVWLPVSW2FYSZj3D0IXl5KSxBZDYkZKdzsiMpqX543 Zgf2GkDa/XPXklb6EatFiWRRpUc9cd4GhBEbqtKK5pN4lgn53OZ9MWeTIVdHhnZLucRc0wKnm1B/k4alxh82TFywMMKTKALu4OpsJEv7Fez3Lg==
X-AuthUser: linux@smankusors.com
X-Rspamd-Queue-Id: 68C57467EC3
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
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104544-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[smankusors.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smankusors.com:email,smankusors.com:dkim,smankusors.com:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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

Drop dev_err() logging for -EINVAL and -ETIMEDOUT cases and rely on
return values to report errors, reducing unnecessary log noise.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 drivers/iio/adc/qcom-pm8xxx-xoadc.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/iio/adc/qcom-pm8xxx-xoadc.c b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
index 31f88cf7f7f1..89858e81c859 100644
--- a/drivers/iio/adc/qcom-pm8xxx-xoadc.c
+++ b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
@@ -535,10 +535,8 @@ static int pm8xxx_read_channel_rsv(struct pm8xxx_xoadc *adc,
 		goto unlock;
 
 	/* Next the interrupt occurs */
-	ret = wait_for_completion_timeout(&adc->complete,
-					  VADC_CONV_TIME_MAX_US);
-	if (!ret) {
-		dev_err(adc->dev, "conversion timed out\n");
+	if (!wait_for_completion_timeout(&adc->complete,
+					 VADC_CONV_TIME_MAX_US)) {
 		ret = -ETIMEDOUT;
 		goto unlock;
 	}
@@ -657,11 +655,8 @@ static int pm8xxx_read_raw(struct iio_dev *indio_dev,
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
@@ -677,11 +672,8 @@ static int pm8xxx_read_raw(struct iio_dev *indio_dev,
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


