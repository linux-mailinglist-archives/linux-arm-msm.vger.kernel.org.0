Return-Path: <linux-arm-msm+bounces-106795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKjkGq8vAGqrEAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 09:11:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DD8502E88
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 09:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 151BC3001D74
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 07:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0CD35F189;
	Sun, 10 May 2026 07:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="lrqbnWJr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cornsilk.ash.relay.mailchannels.net (cornsilk.ash.relay.mailchannels.net [23.83.222.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3B3359A6F;
	Sun, 10 May 2026 07:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778397100; cv=pass; b=cGTHA93jpeepZcdR4wVQenX2Fch4Yq6CyXI18PJWpUi4jQYub1MZm7645rxU67cKdQldknxv1YAKgVnGvGi3emRnuSMQzF+9+ZmcoFzVoG1eLKJzTmVbP2dTP4M24GHmuUrAtTdSijBSuXSNiiPbQgBwbm9mHsQGSHSh+sauL1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778397100; c=relaxed/simple;
	bh=BfoQkq9zsGb3LpXeo+WBXpUgej8+fVaUH4fHdH1YCA8=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=fLm38CVn+y4JYQGtwhw3y8D0hKKjNKB983EZY9bQi1AY4+POlDMiPIjwPF9v3DCQKD3VlkdLXb7xAQm8YsJ0vt3SsKnPnFk+NF4FB2gtnjXlsuiioYspi+C/phVlBPOf+py9HwnxVSEwKpcnSQswM2bFNkpJWUVB8s+dD499idQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=lrqbnWJr; arc=pass smtp.client-ip=23.83.222.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id E26E37207BC;
	Sun, 10 May 2026 07:01:53 +0000 (UTC)
Received: from de-fra-smtpout6.hostinger.io (trex-green-8.trex.outbound.svc.cluster.local [100.104.1.130])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id F1DB572069D;
	Sun, 10 May 2026 07:01:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1778396511;
	b=tD+pWIDYxiJ9hP9u4KKHzOouW4G3dRbvsk/c3tE9N8BmMRpAQ6g7v9Z6SpaBkZpZrB/2KR
	v6X+77f24YNjP/lydb5jeLJi9pyliZtCzQa73GToeEHFlkjcNpWKB0DtLQzTHTZ0dsenyp
	asZz2p0LHTszKPf7q7yMAmTWyGV0OT0pYLwreZWW8I4ZsbqXhpUU8GNVwYWY+V69GE0B1l
	rMGw9/rGfgZf70R3d1othA4FCr6F18Cj/NXrz2sJXtMnAEUtk8dEMg1X9ocaHtpjaXOtGf
	BMIBf4od3B/fLpoxCQ9GeZ59olJonPyj8RDdF+7G4LLQYBz0wYQF9uysOfylyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1778396511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=OZDao5V9oBT2XcGEiVVYN8SW0LoX0+kwClLtsDs+Byg=;
	b=9NKbBtp6ge0jV1+xHtSoPDjuhtGKGYlainY1S3o2P6UXfSM3zaw6ikfJx1mYsyKqwG2/2D
	Bb0UWzV8uamun/vHq1bdy5hA0EHWwdFLmRJoVPqUdXgqkPjptWRAAB/rmnPbuOb9oOpFmu
	M7ZulBHcxv0MrdAOxV13sAAhSSwh8q3BKZsmY5Nz7VgUCqvftaYJzGS+ir1ZMi5yUwqSuz
	h0QTMMOUBWtP6Z3rA+mtCOsCHJ6FTCTkkepcKBKzwcCtGq9uXZ+d5OQ2TyYsz46oW0Vqe9
	S0iK03UMVcOZ02+RA05POWGRpj6CMOVB8F3QCgkhM9n+U04XlVjpIrfYQRvqew==
ARC-Authentication-Results: i=1;
	rspamd-79cfc4d687-w9599;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Cooperative-Squirrel: 2f7cded044141df9_1778396513640_3966104598
X-MC-Loop-Signature: 1778396513640:3164689174
X-MC-Ingress-Time: 1778396513639
Received: from de-fra-smtpout6.hostinger.io (de-fra-smtpout6.hostinger.io
 [148.222.55.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.104.1.130 (trex/7.1.5);
	Sun, 10 May 2026 07:01:53 +0000
Received: from [172.17.0.2] (unknown [125.163.203.7])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4gCv0j49Bkz3x6D;
	Sun, 10 May 2026 07:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1778396505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OZDao5V9oBT2XcGEiVVYN8SW0LoX0+kwClLtsDs+Byg=;
	b=lrqbnWJrB+r6GT1UsQry7Sprk9hM3646ALYGxjDfJP1JHEtdA3SRv8VnpKedG3HpAFPRe/
	DsQGcAc/7l7/5hmXSd2wx2RjycC+RiFj0sUJisKgbD1LoyM67cspqPvyoZAjwWcd8A2Tz9
	Ku+vFqd6QkqUkUmB0+FmUiLcEwdZVmy7T66xC1Sk27Ew4HAFMC81czFZ+v5FV0yEIhBMu+
	l327CLmFnCU01/t4V1OD86/s/wKjL1k8MwdGjQLv79aZ+N02ant0Q4dVNgRtL+YpNoDdee
	MjUosYmJzoTAMAadiws5uc1jJ8x4cno5gvrxMWfGoexD1pxUphY/oH7BaWsuUw==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v6 3/4] iio: adc: qcom-pm8xxx-xoadc: remove redundant error
 logs when reading values
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-pm8xxx-xoadc-label-v6-3-49700fd03005@smankusors.com>
References: <20260510-pm8xxx-xoadc-label-v6-0-49700fd03005@smankusors.com>
In-Reply-To: <20260510-pm8xxx-xoadc-label-v6-0-49700fd03005@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778396489; l=1850;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=BfoQkq9zsGb3LpXeo+WBXpUgej8+fVaUH4fHdH1YCA8=;
 b=YRJ0v4vd6N8Xmw6fwND23P5TYMi9ioRWxQzlXoEIJ7UYFd4bd0YKOfuID+Ki5usE2uD8ym3S4
 /lWvb7w5nesCfYLfcxMHkdxWhcpCl75Xb8nCgdT95GTTkj/RUjLneIT
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun, 10 May 2026 07:01:41 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Ceda56rl c=1 sm=1 tr=0 ts=6a002d59 a=aYg++IQuMqL9NhcFIsEovw==:117 a=aYg++IQuMqL9NhcFIsEovw==:17 a=IkcTkHD0fZMA:10 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=wxLWbCv9AAAA:8 a=KgMSzCYp6QPDUwhpC-EA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfD21kICSRfvwI0jGfBpeorBVDLqcJK6I7s5oyZj0WtZeMelXA70Mxf9vT1Vy0PtUHt28doEGf/1ULjsNnqXuJRkWWWNKmhU8X7sjYsrfPAaHwcHXuoSf vcpVUjtgWPGix2eINmddZWDvN+V9ONcgzMMKc8Xusn3oXVSh/1npgLazh45O0E571BCdBTc91ZZYHtXsZx5alm0ITgxVRqzpFhJMhgyT/3Aw6HKc8q5hYNxR OJB2SGj+LzQOKzSMY6BZzowXoFBXXCeYVfT3vzyFozyVZkMv5Z9A4A1zAy5hyJ11a/QVpU7RgyViAhe8uI7DX0b3RO6hRW1w+8DTkNggGL5AyzAGcIO+nKZg EXAJj0HWcvLjELZMNOkQY6SgmjxIRE0W8sWaeakmX7dr14KZbEGXRrOy/I4hq13S8TX3zqcJ85iya6qkY+hzYNqo3GPG1l/A7bix/+etUPLeF57uCeHdfo1r KYB7ua/YM8Z995mjsOSJVdYGQqhmdMRyARZ2klY9+xpbQREBieo6jWdEg0JTGqen9ptRyvRrHXCz3CHT8clqOipiGbCYWdj5SCB2YDN1zglxTktKbsB67nPn SPBtscEpAj2OdlaFO9c616mFp3or6LOmUEFG1LFImGHhWVnA2S231Uy7bPSI2+/v/8tLhWR+aC+w0t9LxdGbeRb2EnfoikVVxwB/uVlDb/a6Hb+VU/qLUM13 cWcT6XggRrXInTzcslA2RSpwi3sdqTRg3t0cEgJgTEHUConocHeFFRmh1yuBnQRerqIRtF1dzJc=
X-AuthUser: linux@smankusors.com
X-Rspamd-Queue-Id: 03DD8502E88
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106795-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[smankusors.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,smankusors.com:email,smankusors.com:mid,smankusors.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Drop dev_err() logging for -EINVAL and -ETIMEDOUT cases and rely on
return values to report errors, reducing unnecessary log noise.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 drivers/iio/adc/qcom-pm8xxx-xoadc.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/iio/adc/qcom-pm8xxx-xoadc.c b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
index 31f88cf7f7f1..282a67b46a5e 100644
--- a/drivers/iio/adc/qcom-pm8xxx-xoadc.c
+++ b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
@@ -535,10 +535,7 @@ static int pm8xxx_read_channel_rsv(struct pm8xxx_xoadc *adc,
 		goto unlock;
 
 	/* Next the interrupt occurs */
-	ret = wait_for_completion_timeout(&adc->complete,
-					  VADC_CONV_TIME_MAX_US);
-	if (!ret) {
-		dev_err(adc->dev, "conversion timed out\n");
+	if (!wait_for_completion_timeout(&adc->complete, VADC_CONV_TIME_MAX_US)) {
 		ret = -ETIMEDOUT;
 		goto unlock;
 	}
@@ -657,11 +654,8 @@ static int pm8xxx_read_raw(struct iio_dev *indio_dev,
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
@@ -677,11 +671,8 @@ static int pm8xxx_read_raw(struct iio_dev *indio_dev,
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


