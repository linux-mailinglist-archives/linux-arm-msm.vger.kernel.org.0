Return-Path: <linux-arm-msm+bounces-104547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFRfC4BB7Wk0hQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 00:34:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 266E14680F2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 00:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3C6A93004D1A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 22:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724C138B7DB;
	Sat, 25 Apr 2026 22:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="c4fMM8oG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from poodle.tulip.relay.mailchannels.net (poodle.tulip.relay.mailchannels.net [23.83.218.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8983815DC;
	Sat, 25 Apr 2026 22:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.249
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777156474; cv=pass; b=CNG+EEr00yO9RAnIVIuJ6pd4J6OxSF7vEWR91cTgUMc1z7RNRU5GHCWErdV/Wt0bAVGpH6GoJ4KLTa8rTajUvbqS710xf2Oy6W8ie8PmUQ/Vcc6p9fgQowHcwRUNNuv5Vk9ME8T0Yh2+J15fzRFg8jvVhulMh3DKAxKMdQfZ2jg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777156474; c=relaxed/simple;
	bh=2kQmxlb8BgKVi+ppWDkfkQFCm07KUJ6IFEQXjXKxS8I=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=grIQgYgdjgFWN5ZAtKwpprsyZcu0QFUHT0wXnGdxcli+aToJCKb/2nu4Ktu9MkaxcARS9tkbqWnvX6lnw8ttMZTblHYr7Dv4deExjvMgQeea9HnqjLNiCa6wXRCvheAyAJdiEMqGDiCa82hcuB92h7h1N8Ra7Gq+6zh4/a826wc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=c4fMM8oG; arc=pass smtp.client-ip=23.83.218.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 44106640B10;
	Sat, 25 Apr 2026 20:39:34 +0000 (UTC)
Received: from de-fra-smtpout8.hostinger.io (100-96-8-215.trex-nlb.outbound.svc.cluster.local [100.96.8.215])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id CAD04640633;
	Sat, 25 Apr 2026 20:39:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1777149571;
	b=maeEf4YCgBA0hcwBHPlyfdg+lUOvhEv87ukcntAkgbx0MnGdaqfwCRm9pUV3LMAFFVYLAd
	dTKAWyVxBG5ipYgRxNAMlorwB0sBI0+0Z7mia3kQxEudYVBZop/s/ngbmUW54N/yHb6P9A
	zm7N7e8dEUevPeGHnzgK5oHK5n5aTdhPgHY6aQA4vgHOLKYP3JXbpDd/gp0yrnCGsEn5g+
	s0z720Mo99nwiREvzPJH4CbKZ1vXPleSTM8fwSQq8FuIXYHL+3ubi2w2skLKGYtZROtSbe
	xyf5hoG0WkXlFfg35++HBioMHGusXclJlrkNHYccc7LMO2/tv0gc2llqpHELZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1777149571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=7x5MPLBpCjrlQSMNjnQmpxxE0D27q9DgnQslRKfozkw=;
	b=HUTrvcWmNZsmPJZyQFHWp259hnXNqUy3z+HmCzTNEU6Cs5QtN2/liNatOE27aLQT+oJPzI
	F4a0cbe1x6jrArMEO6iT/lOF4ZJxNo4AeTbV3+VaE+r884TIiAeCh0LtrSqOjnz1YyO18r
	spnOcmgy8z1VUr8ah+8Z9c9EHvkGWAaQawgzM25RlPSS26Cc2accb9jg2S9FfGU0g4oNwc
	tNxX7LHHzM/1oPPVm0SG/MeQ3W+vGZIwM0GxnGy5r5X9PwvTnHKetnAN9H8BJorzh+Epnh
	kX0v5Q9+8PA+ZiFx/zbGQO6Ujj5NM8X3TSbA96duiqGXVgTolfWWiOYJQrZYRA==
ARC-Authentication-Results: i=1;
	rspamd-b9d4fc544-8wftt;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Stupid-Cellar: 13b5704f117a4d6e_1777149574188_817764407
X-MC-Loop-Signature: 1777149574188:1714138304
X-MC-Ingress-Time: 1777149574188
Received: from de-fra-smtpout8.hostinger.io (de-fra-smtpout8.hostinger.io
 [148.222.55.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.8.215 (trex/7.1.5);
	Sat, 25 Apr 2026 20:39:34 +0000
Received: from [172.17.0.2] (unknown [36.79.100.152])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4g31s7650Wz3wkN;
	Sat, 25 Apr 2026 20:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1777149566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7x5MPLBpCjrlQSMNjnQmpxxE0D27q9DgnQslRKfozkw=;
	b=c4fMM8oGxWrTTBDedVw5avMdRr+SHaXWcwSi4554KbRHsw3wrX54XwihGEQcY3+zfxpskS
	ykJ+neVMs/y/9eB6w/TKtd/Bp/XDw4348xOwZOUdrRNU/0hOvgDw3HCziTdm3duO64Rfg4
	jgWlK8N3KRSFo4iAsy9UeRqN2l5db0BadSU6Lp/PcDK8weg+mG6+Kz3BsGDtUdDi5mhy44
	OQrcc6XMefzCScqFdN4KmBycGmKeWkZKLHYdnCfziYM7oFGVK0ZhB7qbQqnxxvpZ3l9giY
	EIhtycGKMKazrTULnn9O7Qjwk5oyXwxiGrf/P8kVUxsB+rp9UMVyNj/jWRWs6w==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v4 4/4] iio: adc: qcom-pm8xxx-xoadc: add support for
 reading channel labels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260426-pm8xxx-xoadc-label-v4-4-0ec782362615@smankusors.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777149546; l=3457;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=2kQmxlb8BgKVi+ppWDkfkQFCm07KUJ6IFEQXjXKxS8I=;
 b=L049fNn3rRDqH4UdlBNt6adMYVng4/vuXu2/RDChfjZ/Cp+UkRTOMVxh7i0b2Qdq2nZ/eG2TR
 oXHGjMJJCYtDPZKyKG4H9wYKwhMPMmBC651/6Ejbtkn7vLXQzyKn0is
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sat, 25 Apr 2026 20:39:23 +0000 (UTC)
X-CM-Envelope: MS4xfEgSBdcRKUsXT+S9ykGYEVVzsr9COH2gtEBzrZew2HJHqfVBDW/1b3js0GrZTXCw2Ph05GJCbnSYWi//iI3MoMKbEBvG4kAYGI6tXKbqf4GLZMuNYO3W rgXRQkvU2sfJNtid5M/5St3TuTC4FQT24Hv3bdt15+UMkrneW/ucqKlL4gTjzGfhMNXAVcAeJ+jwO6putCXkCl57p1B8cWFJRLWbd6R25jKMxR4S5G6soxDN 15XtjG/4f8bnJdllI9oIhisMkGuQzW6EwjyGw1HTcIB3IguJigZtIoQqFfdgfiqGIHcpv+RYbR6hN3aMV2dPdVv7xFGxcW/8bG5wQVwEEGcT5Oh/jem93OFZ xnjFiHsHsCm4G8a8xrF1Mu++aNvzDJdBTuP0lf8NBCduYTKGmXSLuuAoxJWDDRSo7oj+mCZ2axFyzHGArkRMVvTj73GB3rLfan2KYFZulEcVgeVBPQ7F94VE Lx7COUuy4zDVMVTd+h0caKIGEyIln3WdM8eIldJVz9hrwUZnTBGVLiqCOYYIyc8E0g2lk6U8kSjuQqzBpCeyLcVReG91tOl33A26ryRaOR/nIbFkXtaSbT4s /Jnia068RlxcunugepPnM37EdEhWMjiB9bhfmxlA7AXpW2XWMiOVJ7AYNJRYwqLjdg9Ulb92oU3URiUquG4jelU/JNq8uuzZgyeMRHc+HMeiPw==
X-CM-Analysis: v=2.4 cv=ALriHGRn c=1 sm=1 tr=0 ts=69ed267e a=ivwHvKELjomHP5eB21RdOw==:117 a=ivwHvKELjomHP5eB21RdOw==:17 a=IkcTkHD0fZMA:10 a=EUspDBNiAAAA:8 a=wxLWbCv9AAAA:8 a=RWyRNVyMI2VXGFIsuXIA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com
X-Rspamd-Queue-Id: 266E14680F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104547-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[smankusors.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smankusors.com:email,smankusors.com:dkim,smankusors.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Implement the .read_label callback to allow userspace to identify ADC
channels via the "label" property in the device tree. The name field in
pm8xxx_chan_info is renamed to label to better reflect its purpose. If
no label is provided in the device tree, it defaults to the hardware
datasheet name.

The change has been tested on Sony Xperia SP (PM8921).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 drivers/iio/adc/qcom-pm8xxx-xoadc.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/qcom-pm8xxx-xoadc.c b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
index 2ee080b27d93..fbb58b340241 100644
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
@@ -446,7 +446,7 @@ static int pm8xxx_read_channel_rsv(const struct pm8xxx_xoadc *adc,
 	u8 lsb, msb;
 
 	dev_dbg(adc->dev, "read channel \"%s\", amux %d, prescale/mux: %d, rsv %d\n",
-		ch->name, ch->hwchan->amux_channel, ch->hwchan->pre_scale_mux, rsv);
+		ch->label, ch->hwchan->amux_channel, ch->hwchan->pre_scale_mux, rsv);
 
 	mutex_lock(&adc->lock);
 
@@ -717,8 +717,21 @@ static int pm8xxx_fwnode_xlate(struct iio_dev *indio_dev,
 	return -EINVAL;
 }
 
+static int pm8xxx_read_label(struct iio_dev *indio_dev,
+			     struct iio_chan_spec const *chan, char *label)
+{
+	const struct pm8xxx_xoadc *adc = iio_priv(indio_dev);
+	const struct pm8xxx_chan_info *ch;
+
+	ch = pm8xxx_get_channel(adc, chan->address);
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
 
@@ -762,7 +775,8 @@ static int pm8xxx_xoadc_parse_channel(struct device *dev,
 			pre_scale_mux, amux_channel);
 		return -EINVAL;
 	}
-	ch->name = name;
+	ch->label = hwchan->datasheet_name;
+	fwnode_property_read_string(fwnode, "label", &ch->label);
 	ch->hwchan = hwchan;
 	/* Everyone seems to use absolute calibration except in special cases */
 	ch->calibration = VADC_CALIB_ABSOLUTE;
@@ -804,7 +818,7 @@ static int pm8xxx_xoadc_parse_channel(struct device *dev,
 
 	dev_dbg(dev,
 		"channel [PRESCALE/MUX: %02x AMUX: %02x] \"%s\" ref voltage: %d, decimation %d prescale %d/%d, scale function %d\n",
-		hwchan->pre_scale_mux, hwchan->amux_channel, ch->name,
+		hwchan->pre_scale_mux, hwchan->amux_channel, ch->label,
 		ch->amux_ip_rsv, ch->decimation, hwchan->prescale.numerator,
 		hwchan->prescale.denominator, hwchan->scale_fn_type);
 

-- 
2.34.1


