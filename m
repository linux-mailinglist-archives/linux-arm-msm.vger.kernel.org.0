Return-Path: <linux-arm-msm+bounces-101629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDCQAmujz2mZyQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 13:24:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6D7393A54
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 13:24:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3EF13067584
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 11:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76253B47C0;
	Fri,  3 Apr 2026 11:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="RDOftD+5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from siberian.tulip.relay.mailchannels.net (siberian.tulip.relay.mailchannels.net [23.83.218.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4A63B27C5;
	Fri,  3 Apr 2026 11:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.246
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775215130; cv=pass; b=tzXnKTm+TtuiiOMdg8/8I2LH1LoD5YsGJu+eYSZU4VsUK7IZzZJJ09x7FBO+g/7wrUdzQCW1FT71vPMUriDBVMZ/M5NsvXWl2SVDZz+R1uxGsW5NBCd4R+YlQH1wWDXttMkrrELbnaddeCE+/0hPb7GWi+9iNt5YqWkVWGeiePA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775215130; c=relaxed/simple;
	bh=yev5PnA1FFUzvokiGbyOhvM8CdlJqNaaJfV1xZIyi98=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=kFhzdh+0AQ+V+O5Pnqneu7ksZJGdMKjaHchrGhXRwJ6wD5SwugRKATU/kkJWCEmlc/LFpn3iUtmaMOg4bfrdvs4YB/nAvfyTgF6Dx4GQGt63fJrt/daLWn5A45UQ+bq0gGcU++fiq2dOHcSMCdQmjo17OhMYZqjlXp4ctLLw8EM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=RDOftD+5; arc=pass smtp.client-ip=23.83.218.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 9BB6A4C28B2;
	Fri, 03 Apr 2026 09:23:30 +0000 (UTC)
Received: from de-fra-smtpout2.hostinger.io (trex-green-8.trex.outbound.svc.cluster.local [100.96.233.91])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id BC1C14C2D01;
	Fri, 03 Apr 2026 09:23:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1775208209;
	b=9M8kq5bYjxw5+iHO0DLRXTBuM6xjXnNg3l8TMpqRFXEU5R9TV9p4sN/HgysOI0dJ+egNeV
	heYNIWBhOn1zwtqUKNqmwqQ9t/aq3UzXN/AQlt+33gFmSKajND561C67YN7nYFoOqlR3cE
	CBKBGxBnXF4T37bfhWFzBj4eh/XfmKsZdJs5s7GsyqW9xEXK+AfP7oDpfXfN9F2ChgsxC/
	QscqD4mt1sMV9skpvNaVfi2tOSLFHV8Xd4JOu1cR5UYXKY7ZuXDKERhYGI8Em2hjOlrApy
	tDwUHH7xikJRWI/uE+ez3gOn3clR33Albo8C7dwAc1BafP4deLpLBacO0LjBaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1775208209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=zShDjP0ybVf5DzPOobav3i0j52AsN0wf4g0/BbZ9QXM=;
	b=slHbi1q8VuhKneTDYLgWkmvZzxt97M1Gq2VVegu+Nq3UAl1ZRFRtAh26A2v17veKbZf0f6
	xsMfwnf5dqk6hxMCBpAqONdSMoutcA9kE5Evqlxag2JYik727cvJn1QxXUBfpyR9rTjPBh
	SQtSzTdrlj1BPgchKPus6XzfUuvjcIG74bRd4wpY8L4h05NYpMbh37Ea9ymvvL4JsF7xmD
	fB4UUPU9hxuB4iesq9s+OiEIKEXqvCCK/a3rWv2MPlzBBlwtXluTcwyVj8EEM617rdFFsz
	+tYUStRZ3hsMK1AZpImr1msyXu3IE9hLq2fs26uoiQPjwfCmqCygu1zBBzqdQw==
ARC-Authentication-Results: i=1;
	rspamd-bd48b9d95-6g2k4;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Army-Spicy: 22a15b0a558c775f_1775208210500_1512015860
X-MC-Loop-Signature: 1775208210500:3409479156
X-MC-Ingress-Time: 1775208210500
Received: from de-fra-smtpout2.hostinger.io (de-fra-smtpout2.hostinger.io
 [148.222.55.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.233.91 (trex/7.1.5);
	Fri, 03 Apr 2026 09:23:30 +0000
Received: from [172.17.0.2] (unknown [180.253.47.239])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fnCvG0k4Kz3wqB;
	Fri,  3 Apr 2026 09:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1775208205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zShDjP0ybVf5DzPOobav3i0j52AsN0wf4g0/BbZ9QXM=;
	b=RDOftD+5zV6rDvzlq2JWvh7ZrzkyQZsxX549gPEOGDtxhLMF6tj9cYR/hms5UWDQon/Zg4
	XRQr+FfnqGIlxnR2KvLEqzwRGBOiQnOY0rRFWkxyzTOSt7zX9F8GiqrS5WoHhgzArhCfsr
	bIv6s051NUIq1/LSO5Ys5n1k4/tEUMoasHMJlwq8nyeYU2rlkZZkMx3aI6SceFnpltznDI
	IZ/tM5nAVCgAnZSSGz637mZNah6E6Lg4PRDd3HNXTghXdcucbcJQsuKUAf1zmUicMpiHIF
	4AqNY0owZ389Qjhf3pykE8VghvXGtNlkoalnIuBu6jJbbYA4aS5z+WM+uzcXaw==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v2 3/3] iio: adc: qcom-pm8xxx-xoadc: add support for
 reading channel labels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-pm8xxx-xoadc-label-v2-3-29b50bf821e6@smankusors.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775208191; l=3440;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=yev5PnA1FFUzvokiGbyOhvM8CdlJqNaaJfV1xZIyi98=;
 b=+N+mYjw6pb7NLriWXLjXwElkRt5sTM2fMYARXMPGjKzv+J9KYG75hiXPfxt1klP2QLcR2xXCR
 s+L4wWhj6a8DB1OgJ4DTZO1dVxLTzhIWYOGR3YX2zfedld3iT96CaOa
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Fri,  3 Apr 2026 09:23:21 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=etGNzZpX c=1 sm=1 tr=0 ts=69cf870d a=EXl8KfDnlL3m3zOSb15mOw==:117 a=EXl8KfDnlL3m3zOSb15mOw==:17 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=RWyRNVyMI2VXGFIsuXIA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfPWXTfSxQ9YG/SfN78UhwKrMgiJgEe1NJu8QuFlN2vZ+3m+VYJH6Tl1LbBlgrzvFvwwlw1u9yVnUx1DghrQggeIV3TDCPJO/pvvcQw6v2YGjnt2boDbN XAhnLAzlavZP7/p+eBiEzAuqbd5eH6gq8o+njfmA9Stm5DA5/2WZU114j5cB/DFGf7vayxbl+NU4dnt/lYJwFVycog51taoBVAxCM5XqvZBPNknqYg4Lxj/W K72v1AUjpDSjLFJkndkgmkGSBMsgHSUrwEGUopqbSXqvkQLjb6hzceAgx/Z1YpQFTQxI0umPLn8wQd7JdBD0FDkCBD3QVaE+BNpbR36GMEQc4lTKOsPlF5/5 IfJMlTfxOjz6qiG1aY/3MtRRuqPxRLsTTBsLZ5kOHO13XoKXn6kUXF9YE/xgdJnQXo+GDyQT3DKf79jVMZbDELl9Up5HSB4iooucvejB5KEhNOOUiPgvva5b j1VlZsEtGGYGBTvMpkgFkJ6AmDw3XHN604zYaVB2LK3PYEySYGTYjodvxMncHPMvViOtN1fhH0d2hByH7RHmfL+gCEtk1sWjALlOoVe6X+lPux6ajaXPXNMn x0nVr9zTev46T7IgDKI7Nso47ym6KOmkPSyTBdEFUawMk+wk/3N4/9Ue+iKeBEUaqaM=
X-AuthUser: linux@smankusors.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101629-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[smankusors.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smankusors.com:dkim,smankusors.com:email,smankusors.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5A6D7393A54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Implement the .read_label callback to allow userspace to identify ADC
channels via the "label" property in the device tree. The name field in
pm8xxx_chan_info is renamed to label to better reflect its purpose. If
no label is provided in the device tree, it defaults to the hardware
datasheet name.

The change has been tested on Sony Xperia SP (PM8921).

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 drivers/iio/adc/qcom-pm8xxx-xoadc.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/qcom-pm8xxx-xoadc.c b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
index d63af84bf44776c9c7106a43473b1678496247cb..f473c5e0c5a217bb4a3773177b6e02f0603d7de6 100644
--- a/drivers/iio/adc/qcom-pm8xxx-xoadc.c
+++ b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
@@ -369,7 +369,7 @@ static const struct xoadc_channel pm8921_xoadc_channels[] = {
 
 /**
  * struct pm8xxx_chan_info - ADC channel information
- * @name: name of this channel
+ * @label: label of this channel from device tree (defaults to datasheet name if not specified)
  * @hwchan: pointer to hardware channel information (muxing & scaling settings)
  * @calibration: whether to use absolute or ratiometric calibration
  * @decimation: 0,1,2,3
@@ -377,7 +377,7 @@ static const struct xoadc_channel pm8921_xoadc_channels[] = {
  * calibration: 0, 1, 2, 4, 5.
  */
 struct pm8xxx_chan_info {
-	const char *name;
+	const char *label;
 	const struct xoadc_channel *hwchan;
 	enum vadc_calibration calibration;
 	u8 decimation:2;
@@ -446,7 +446,7 @@ static int pm8xxx_read_channel_rsv(struct pm8xxx_xoadc *adc,
 	u8 lsb, msb;
 
 	dev_dbg(adc->dev, "read channel \"%s\", amux %d, prescale/mux: %d, rsv %d\n",
-		ch->name, ch->hwchan->amux_channel, ch->hwchan->pre_scale_mux, rsv);
+		ch->label, ch->hwchan->amux_channel, ch->hwchan->pre_scale_mux, rsv);
 
 	mutex_lock(&adc->lock);
 
@@ -719,8 +719,20 @@ static int pm8xxx_fwnode_xlate(struct iio_dev *indio_dev,
 	return -EINVAL;
 }
 
+static int pm8xxx_read_label(struct iio_dev *indio_dev,
+			     struct iio_chan_spec const *chan, char *label)
+{
+	struct pm8xxx_xoadc *adc = iio_priv(indio_dev);
+	struct pm8xxx_chan_info *ch = pm8xxx_get_channel(adc, chan->address);
+
+	if (!ch)
+		return -EINVAL;
+	return sysfs_emit(label, "%s\n", ch->label);
+}
+
 static const struct iio_info pm8xxx_xoadc_info = {
 	.fwnode_xlate = pm8xxx_fwnode_xlate,
+	.read_label = pm8xxx_read_label,
 	.read_raw = pm8xxx_read_raw,
 };
 
@@ -764,7 +776,9 @@ static int pm8xxx_xoadc_parse_channel(struct device *dev,
 			pre_scale_mux, amux_channel);
 		return -EINVAL;
 	}
-	ch->name = name;
+	ret = fwnode_property_read_string(fwnode, "label", &ch->label);
+	if (ret)
+		ch->label = hwchan->datasheet_name;
 	ch->hwchan = hwchan;
 	/* Everyone seems to use absolute calibration except in special cases */
 	ch->calibration = VADC_CALIB_ABSOLUTE;
@@ -806,7 +820,7 @@ static int pm8xxx_xoadc_parse_channel(struct device *dev,
 
 	dev_dbg(dev,
 		"channel [PRESCALE/MUX: %02x AMUX: %02x] \"%s\" ref voltage: %d, decimation %d prescale %d/%d, scale function %d\n",
-		hwchan->pre_scale_mux, hwchan->amux_channel, ch->name,
+		hwchan->pre_scale_mux, hwchan->amux_channel, ch->label,
 		ch->amux_ip_rsv, ch->decimation, hwchan->prescale.numerator,
 		hwchan->prescale.denominator, hwchan->scale_fn_type);
 

-- 
2.34.1


