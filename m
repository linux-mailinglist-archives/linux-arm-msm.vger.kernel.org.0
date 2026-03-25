Return-Path: <linux-arm-msm+bounces-99948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJDTFyZQxGljyAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 22:14:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B871632C45E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 22:14:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 778E230F8AAC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 21:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A21833ADB0;
	Wed, 25 Mar 2026 21:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="GK7BIgb8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from seahorse.cherry.relay.mailchannels.net (seahorse.cherry.relay.mailchannels.net [23.83.223.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D943264CF;
	Wed, 25 Mar 2026 21:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.161
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774472579; cv=pass; b=l5q+lulnkphMAvT0Zy3TAD7nXDHLLkkugNH07EEdtVmGFpPsZU6gpdvXX18hwNCT2CYnFusUehN+He/Us+vSfDbBcEUaveeP8C5/i9EWKRUtcsiU225n70N5jjr2wWxU1CVt2IXZ2UPy9dOv521PPDROQaH1iHqAHlRZtPW86XE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774472579; c=relaxed/simple;
	bh=IshA5m/dwOUDVFiyKGYs6W38icnXdCOERQiNLhdi9jg=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=Px5TE1xh6b9PdMMF2jI9WLwdfirgGyUOPXDIKZ1sEHC6B9yshJJvFqg7CBAMGAlJLw7zzlTC6fMC+GZRGQ0ng+RwVFoG0TkDdXjaXX4PWkmXTc+L++u7AGBaJdjP8dkfko7nyg2lUwSEJnQ2nnLGqk4XWcXpLwOHZv4cpHB1u7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=GK7BIgb8; arc=pass smtp.client-ip=23.83.223.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 19F628C1AE0;
	Wed, 25 Mar 2026 21:02:51 +0000 (UTC)
Received: from fr-int-smtpout25.hostinger.io (trex-green-1.trex.outbound.svc.cluster.local [100.96.16.108])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 5628A8C1541;
	Wed, 25 Mar 2026 21:02:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1774472570;
	b=92G1+wCJkYd0KECLHLMPU3EXTNco/cAGoDMItV5rQJAjyTPmx05JH2tiymH6znlx9Cts+7
	8hhUdrRLf/lksC9gQ3Kxr/n2ZOcdJmwPHx/eSpuATXBmfeLHJYYNOInhH98oIqrKlmyR+w
	iUT6rsE+CkcelkKkevG9HyrpYmK1Ub2yQJGjZkZrB7tKU31V3lHIClR6E3TkOXpWbsWGIX
	zG9CgCvWxME7Wg4WD93X8yqyZYXSIcCyHLVYRaNksKaOBL1uimziwXvfvyKasxHTB12R9L
	/6PRbe3SOPTih13IJY/FDoowkLbYNN+50Tbu/3hpOA5Nlyz39Wg4/k4Y0WK2tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1774472570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=5qgKCgLubYSIl0jZpJxKpr+uKJEWQn3hd0W7Ctm78UE=;
	b=fmNXzYVSm5vqTzMxCoQraSofE4VzVdxHW3zc5iuOOO8tKxt6OT50/KvKQWkK1XqmNMqpLj
	rMlY5ydC/Q0j4KrrhaGJydWYhwnywsRrIMm+AQY6p6Dbfig2ugYNtf66DqZMkGVBaVIEY4
	+IObL735xt/DgwZVsdlGLXF9h7eFjmSTgBCLgwkdfsVLwkRfrbJAeE/n1gR0HOZtgtGXlY
	4WA0Wyx+F8WpffNNrYr9TkZLU4D+KdfxXWV1km2/yfD30778QBmRG1oxSW1dXJr6lUmxMq
	JCRLbx+CioxzS4kXztac6o9cawjIdRYXU6OzMTZMNCEvYDhGww2wMFnFmZu27g==
ARC-Authentication-Results: i=1;
	rspamd-db964497c-jpd75;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Keen-Spot: 2db93f953f6454a9_1774472570476_3622148402
X-MC-Loop-Signature: 1774472570475:2899605895
X-MC-Ingress-Time: 1774472570475
Received: from fr-int-smtpout25.hostinger.io (fr-int-smtpout25.hostinger.io
 [148.222.54.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.16.108 (trex/7.1.5);
	Wed, 25 Mar 2026 21:02:50 +0000
Received: from [172.17.0.2] (unknown [180.253.44.220])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fgzrK4L7pz1xm8;
	Wed, 25 Mar 2026 21:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1774472564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5qgKCgLubYSIl0jZpJxKpr+uKJEWQn3hd0W7Ctm78UE=;
	b=GK7BIgb8p+9QecSqiQWgRoLHd3/o63a4sNLapUU4EDp8j2r5DvvUWTwMILxjK7JHk+ZjD1
	3gvnFlwtertO0Scx4vukc8M/BE6JFOvnVSzvloMH9t6xX6og5Qsce0kxJkpYFq9f+BrHH0
	m6CEvNYcUqlhqyjT0sRNnrCFnZnlfKifYd0zT1waee4khlN+MmVDHAb9AvVqM/I0pFTMnw
	3AyvaZ3JidGGdst/RDGw0DC3ncJIYHXlCIcf2oqfwa/Afnz+m0da7wIFyN1DzdtbdKNBUN
	xmj4CgbQgZb1hXWr9dG62zc5W3b9/2KFzOHX8H/RMaWRyjxNNaiOc3+ebRYzxw==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH 2/2] iio: adc: qcom-pm8xxx-xoadc: add support for reading
 channel labels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-pm8xxx-xoadc-label-v1-2-027805dad4db@smankusors.com>
References: <20260326-pm8xxx-xoadc-label-v1-0-027805dad4db@smankusors.com>
In-Reply-To: <20260326-pm8xxx-xoadc-label-v1-0-027805dad4db@smankusors.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774472553; l=3490;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=IshA5m/dwOUDVFiyKGYs6W38icnXdCOERQiNLhdi9jg=;
 b=O1aKcnRNHT1EMxADbUhF43T4cVksDjGU/rgaTRfPVcjd5DoAY/9Gl7YUu5akuEjECjmjLzrQx
 18Hvl6XQOrdCJWibl3aL/9rX0f8Q5DswBIL7/K4UL2WAkmVreGdYNPN
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Wed, 25 Mar 2026 21:02:41 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=ZbRPNdVA c=1 sm=1 tr=0 ts=69c44d74 a=9XgiG0qChrIWxZZBWkq1Wg==:117 a=9XgiG0qChrIWxZZBWkq1Wg==:17 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=RWyRNVyMI2VXGFIsuXIA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfBpu3bqCbsmxYLh78dMcG4AV1MA54gfC0hSbDWZtivQrp4wq9ivNDacoMYBVdlFkTf+wRQy2AjtKuyQOhabmGz74eKEmWy0h/0gHtUDnjJCqyoJUxZyX bTC0aGG6V+yPLtt7l3u9l2py7ajAn5zD7jdj+PusFWSP6N5p90vbQcwgi5nSWCZNFf+ABZbLAUXSM0IWdUP26yQu3zGFE4DeASyqTZK6UE81wOs26v7199sD dwh+W82tryWgYT3FMw+PNqvT+BazBPVtvs1ffwz5KZ7IOjzg51ZhWogH7OA2bsStbqigY4F2hG+cJDMnQHvJAhCaKkZcTrc3mohiZlBj0sS4KXvZ5/L5do9D jB5fjtPgQ/BhG591C7/lVrFWAc/3l5qjMpX5+CXQmRhPnvNS9yEt8AZNy8/+aMrRjbA5GN5SzXpLULN06ZvJLPrtQGDZ3CwZr7bMsXGqADLMDGQXW4oTgKUP 56lGO/MW6Z/AmVxQAxl8wvZFGPdv10Zl5BBm1DvGWAO7h+lnBz4CRzT3Q/Wo6tDPqSd0VbMKp4YS5EEOaKwUSs47DTPYMVE1Gt8P8LGZPVAtqy1i2C95SgUp IWNYVcg4syd+C14Ue2/qm9fl5LWVfyrp5eiWMz7u0w1aWRH5e/1J5QQw78EpKsnzWLU=
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
	TAGGED_FROM(0.00)[bounces-99948-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: B871632C45E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Implement the .read_label callback to allow userspace to identify ADC
channels via the "label" property in the device tree. The name field in
pm8xxx_chan_info is renamed to label to better reflect its purpose. If
no label is provided in the device tree, it defaults to the hardware
datasheet name.

Tested-on: Sony Xperia SP (PM8921)
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 drivers/iio/adc/qcom-pm8xxx-xoadc.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/qcom-pm8xxx-xoadc.c b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
index 31f88cf7f7f18297132d152648b312c0fb60608e..206a379ea74113264d4e5e75a81f838204174700 100644
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
 
@@ -725,8 +725,22 @@ static int pm8xxx_fwnode_xlate(struct iio_dev *indio_dev,
 	return -EINVAL;
 }
 
+static int pm8xxx_read_label(struct iio_dev *indio_dev,
+			     struct iio_chan_spec const *chan, char *label)
+{
+	struct pm8xxx_xoadc *adc = iio_priv(indio_dev);
+	struct pm8xxx_chan_info *ch = pm8xxx_get_channel(adc, chan->address);
+
+	if (!ch) {
+		dev_err(adc->dev, "no such channel %lu\n", chan->address);
+		return -EINVAL;
+	}
+	return sysfs_emit(label, "%s\n", ch->label);
+}
+
 static const struct iio_info pm8xxx_xoadc_info = {
 	.fwnode_xlate = pm8xxx_fwnode_xlate,
+	.read_label = pm8xxx_read_label,
 	.read_raw = pm8xxx_read_raw,
 };
 
@@ -770,7 +784,9 @@ static int pm8xxx_xoadc_parse_channel(struct device *dev,
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
@@ -812,7 +828,7 @@ static int pm8xxx_xoadc_parse_channel(struct device *dev,
 
 	dev_dbg(dev,
 		"channel [PRESCALE/MUX: %02x AMUX: %02x] \"%s\" ref voltage: %d, decimation %d prescale %d/%d, scale function %d\n",
-		hwchan->pre_scale_mux, hwchan->amux_channel, ch->name,
+		hwchan->pre_scale_mux, hwchan->amux_channel, ch->label,
 		ch->amux_ip_rsv, ch->decimation, hwchan->prescale.numerator,
 		hwchan->prescale.denominator, hwchan->scale_fn_type);
 

-- 
2.34.1


