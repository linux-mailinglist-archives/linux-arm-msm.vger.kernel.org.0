Return-Path: <linux-arm-msm+bounces-101871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PPXIpqX0mlWZAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 19:10:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E727C39F1FB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 19:10:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE82F30071FE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 17:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A50031E823;
	Sun,  5 Apr 2026 17:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="VQEpestH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from slateblue.cherry.relay.mailchannels.net (slateblue.cherry.relay.mailchannels.net [23.83.223.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC67C311C32;
	Sun,  5 Apr 2026 17:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775409038; cv=pass; b=oYDoUsxVUECuGB4gGHB3AIPUT1+B1novZtqYFRpWz335SNuu8qdJaulbTh5rRnD7m6flseYvW2cyKE1bWxFs/Cn4I56IOJapir1dlJF1thwdtlbLCNEjFF62HjjakBmykD1dxeUOnwo/2QX/HhttR8d+AywNGk7tRb96MACl6xE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775409038; c=relaxed/simple;
	bh=UsHrqsocHQgKBjm10kjSLexvHw05zLqoaleZA9P7QHU=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=UOD8pqq9TS65cit+5hv051bISrG+T884xnm9PGE90Mcdvn0FIv5FPdm3bIiSZTTOSFWbFp/kAQKliAFT+Hwtx0hF6j13XwdMv9VtgOkdHObPFUwFnbh2z0ZJLQEQkqWoljZ6Iqak7eQT3ZfphDT5c0Vab8PbH2vDzktCQguypgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=VQEpestH; arc=pass smtp.client-ip=23.83.223.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 2169B7E160D;
	Sun, 05 Apr 2026 16:52:27 +0000 (UTC)
Received: from fr-int-smtpout21.hostinger.io (100-99-26-167.trex-nlb.outbound.svc.cluster.local [100.99.26.167])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 657087E1408;
	Sun, 05 Apr 2026 16:52:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1775407946;
	b=5ZBdhebtEQC/u0/+gHzCDpHnT8AEo520SO5qZUvM3jILsBbKKoOahibueW81mn60FIUlLj
	o1sRDWB2JebSfZsOWgpyqWuGbbCbF2HjLPx4S/JUUEB/X9DzXtaFkOHaQU8Yds4W09IjDU
	0OncQ6Xa2k2Mu35e6NdTe1bYJXyGsyQBZD/wwT5+QpTAkHuKyM5WKPhQx0Bmxpx+dnt1s6
	srfrC7ShBXM5cvlKDpv3c7Jt6f8k3iWEI4/5ys7y4oeemv5D67KRUaJpPUpGmrm+ShjNE5
	tuaRksIiNejKf3Rysh2wMV6W0GK2Ott9EiW1H0qdK2KSuyFJP8AjOZo3LTxSLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1775407946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=SUebmlvtJ8Ug5+O/6XoCEXWfYSXBXFyMNRWrXyrlcGQ=;
	b=DDEWYooYs1DQotj/M1rfe2jzFOOyNZDiW8nwVdiQ9SvIJECYUkDLfS3+AhFG3diygrkohk
	OV03S4QpkGXBsFWsuM6WU5dz1B6GkDBCiZ5mpbln4PGJDOpRwesBfGk/HPlOtiIw0dHSMf
	dvHXkSLdHR4NvCBT7EqUVV5wLIVarDNgMecEBW7c8hBgMDca6n52TJioAo8q2kC2OAIHAN
	lcsEf03/rkJSO7EGfbaU9+l6jyzqVYl8vcseNrpqvqlr+NjC13lQZuyg3FJYyfW1wj/GQE
	06Usm0gfGSyJnCmb7R1uYsz3LIiB9iXYMhdVo79cLK3VGdZlrtpHuIgMv6LbQQ==
ARC-Authentication-Results: i=1;
	rspamd-bd48b9d95-7lsvd;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Cooing-Eyes: 6c48cec26619fd98_1775407947015_4245712477
X-MC-Loop-Signature: 1775407947015:3293812975
X-MC-Ingress-Time: 1775407947014
Received: from fr-int-smtpout21.hostinger.io (fr-int-smtpout21.hostinger.io
 [148.222.54.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.99.26.167 (trex/7.1.5);
	Sun, 05 Apr 2026 16:52:27 +0000
Received: from [172.17.0.2] (unknown [180.247.251.74])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fpdmL4vc6z1xnc;
	Sun,  5 Apr 2026 16:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1775407941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SUebmlvtJ8Ug5+O/6XoCEXWfYSXBXFyMNRWrXyrlcGQ=;
	b=VQEpestHR+yqs7rBF+MrdJZV6phsT7XfeEVukYh40ByTYXMBJKEvVzeHwk03na3FTAw33q
	lY2m3Hs5AF41eGzT/tj9pFqhoagpZ0S3h7gk50wTsLImueOP/rUHwVuPUwnyaCLx9Bdw3j
	TlyW525+uOE4ZJKDPJicCi8cNyOTBU4HBfHPgkFGBL5O9YYENJKn0xFqA1jDf9GBRsPsuS
	ynAggBGPrBeKCRaXhlS0Q+SydbOaM5fVIVNY8cuMURJS3m/3189NVLn6bHoBzuVEtKuGAj
	0xJt+87e+MqLT//IN9aQTeh4IjOX8MUFiy5wC2kLXSFLVqQQTzeRlE+aNEkBNw==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v3 2/3] iio: adc: qcom-pm8xxx-xoadc: remove redundant error
 logs when reading values
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-pm8xxx-xoadc-label-v3-2-9fe179c283ec@smankusors.com>
References: <20260405-pm8xxx-xoadc-label-v3-0-9fe179c283ec@smankusors.com>
In-Reply-To: <20260405-pm8xxx-xoadc-label-v3-0-9fe179c283ec@smankusors.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775407927; l=1640;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=UsHrqsocHQgKBjm10kjSLexvHw05zLqoaleZA9P7QHU=;
 b=J9pIWIsHm36Nbup5PMcC2DOPah3UpG6NE/7u71ixw0MO42JvSr0zRC9YUX8/0we1FeQoaW6Et
 6X8ZIm2rXX3DZFt/pgQfxYB0Pdeq5lIsXALFoFw/hUXmeeuQ1U7f8KD
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun,  5 Apr 2026 16:52:18 +0000 (UTC)
X-CM-Envelope: MS4xfAs9K8iC9IpoadCyKRGKKurHKS4ScyzBpmZ0R2Wr7EBf2+fEBV41ydl8SzkNBO2mJbdl8bvJXRNv1ZOcC/ubt1W0uMbxrvIDjwJjPDSvA930KNmYK9Eq OJh9ZCt6yPLb/C8giwMXc2DAHOQwhJWOmrrXm3BL4WIahJPNTptReJGEB/xNb4B8lycCQEI6Ez6WdI+oFDmbt+ELhbmHaxg+ivmg+dSi/fBiSaAeBUwVU9ii QTx8MBb8EqcVXeWshGbAx+c3rP5a1xatApHkfgMz4VlzG1BYH5qzB8eMjYj616YtFj75U+PB51taBT9dirqTriei0NDjpTQzY7cMYeql2CvVISFPDlIqVnI5 98p7Av516e3dyC+K5fqdMRtkVM16x9EaFw5ZXIlHbIugq08lnp3fulhHi074yuQLZ/ZeE+lRHHVHIlUvvMe91PDbvEPVCmBLuvxtsAeqw5764zMEbuCrxI1b 62PNtbGhZzXPSVqr+MMRYnnyrnXJ/+VIv7VkuA1XZX4hszgpF/EmH528bdlNZ7Vws//nqjM0CX0lqI9fEIsYUdRRebaafEWLIAaJKWAHwXuGrmkuOxj6BbCn WTCaFWhDLkEV2b6KEyemQ3MKijEYGGlnZFLU+mjuVj7MjG1dODijIrUkbZEmGs+oXHk=
X-CM-Analysis: v=2.4 cv=GMJaEfNK c=1 sm=1 tr=0 ts=69d29345 a=iMBLmzX4nuXcozcv68JNPw==:117 a=iMBLmzX4nuXcozcv68JNPw==:17 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=vtd7Zj2fv4srx1KTN1sA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101871-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[smankusors.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E727C39F1FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Drop dev_err() logging for -EINVAL and -ETIMEDOUT cases and rely on
return values to report errors, reducing unnecessary log noise.

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 drivers/iio/adc/qcom-pm8xxx-xoadc.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/adc/qcom-pm8xxx-xoadc.c b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
index 31f88cf7f7f18297132d152648b312c0fb60608e..537b03181cbfb4cfcbcb242bcc2c7be18c4c384b 100644
--- a/drivers/iio/adc/qcom-pm8xxx-xoadc.c
+++ b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
@@ -538,7 +538,6 @@ static int pm8xxx_read_channel_rsv(struct pm8xxx_xoadc *adc,
 	ret = wait_for_completion_timeout(&adc->complete,
 					  VADC_CONV_TIME_MAX_US);
 	if (!ret) {
-		dev_err(adc->dev, "conversion timed out\n");
 		ret = -ETIMEDOUT;
 		goto unlock;
 	}
@@ -657,11 +656,8 @@ static int pm8xxx_read_raw(struct iio_dev *indio_dev,
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
@@ -677,11 +673,8 @@ static int pm8xxx_read_raw(struct iio_dev *indio_dev,
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


