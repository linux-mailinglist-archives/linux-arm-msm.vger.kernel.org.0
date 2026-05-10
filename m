Return-Path: <linux-arm-msm+bounces-106794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAq/M3wvAGqrEAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 09:10:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEB5502E64
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 09:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ED44B3002F6A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 07:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D51235E943;
	Sun, 10 May 2026 07:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="HM9L6+Fl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from seashell.cherry.relay.mailchannels.net (seashell.cherry.relay.mailchannels.net [23.83.223.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30512BE056;
	Sun, 10 May 2026 07:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.162
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778397044; cv=pass; b=jcCzPoREqnd0D2aUAx27la3jCgj6trwuWeJo+3fygZ6kgeeiHuRwEpe3l2S7e+gPlEdRNpa8vWrihldNQ62PdlvznFNlGRkmdHYyJ61m9Vz2n4kNXWPYYLvWbRIlkXqhYLgz5k4gBAX2EDr7s9oAYLVVLC50qk41QjWpDLEQNNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778397044; c=relaxed/simple;
	bh=4Ojc7tOLsSQIn0AgihGborvDDI5xTf+5QhgypN5c0CE=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=mHI0AEe04LAGf7pXmQj6QiSFrUsqze6VTP7wtGCFzap7M1ughqCZmrNK0+UGx1KCOwUgZfp4hK8GipWoBjX6q17XL5lgQPKj2QkI2FHMss5RMw+a/svZeILQsc7sQgAGavdOWNCslHzisbpWA5KdopkgnjO80Ox8tw9TgItBj7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=HM9L6+Fl; arc=pass smtp.client-ip=23.83.223.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 1A23A380F94;
	Sun, 10 May 2026 07:01:56 +0000 (UTC)
Received: from de-fra-smtpout6.hostinger.io (trex-green-0.trex.outbound.svc.cluster.local [100.100.197.175])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id CEE32381171;
	Sun, 10 May 2026 07:01:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1778396514;
	b=Tpjdbs8CJv4lWVNl0rzVN+lAFX7x0/mIdAaMjXeUP0Z9hAy1hmvig+6wQaRCjkKd9Wbia5
	4mjPHv6YMVZ0hX+z/JxaRQJmLQaflTgi8V37+fpGMSAZORoVZ2AR7HMSJ375NKbLSfOD4I
	WR2a9utYe9wUT3mTIpdVmrSG2PWCrPe6nzVKZJKewj3LpvwOtRvfprgBdMeHAXDrHzgm18
	PL1+lqjcz4ufRJj+diS7yT/wlLfJGjKTd309Wxb/gS/XXQ5we6rUejzi6RYRiTJVN/IT/Y
	tEQkTldytWTmuD5wI6LRCdkAJRZimOXVPqakBAQEweKiIndKujEmplgB0m+rJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1778396514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=z0hLuJynO/FZp19+hPVBQw1mDXudlkMwCQE+aPHxYUo=;
	b=z9IMYegfUmQCXYFbprN2hetMl1ckDq3Ktis4tiPw3RiIIw8UGMPPYKgBbot/8YJ9JKrEXM
	0RNs5/HLDfqN1ipGIvaPYu4nlEXjBasCcAuGeRe5LTadscQmDMEJMx4pB4vXlaHBhGG4wJ
	16D41anTKQWO85bLU+SZPIF1gx6f5uzPKb8TID/OIGkUGhj+2cd5Z7k33oNPDdwqYjkTVR
	L1WtN/rQ+iV9O3qiHrB0u9JvXYYbqmEib55nvl4YDSNLBAT949WcenGr6Pc1/JEbuTYP7o
	vQIBQ7myKbv2vS5gkIJkbyr+LFHTXaSfJqPq9XksFoJBeX08kyhurPswPUntug==
ARC-Authentication-Results: i=1;
	rspamd-79cfc4d687-vgqcq;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Troubled-Shrill: 7c3d78db4811a79b_1778396515987_2974677773
X-MC-Loop-Signature: 1778396515987:470492379
X-MC-Ingress-Time: 1778396515986
Received: from de-fra-smtpout6.hostinger.io (de-fra-smtpout6.hostinger.io
 [148.222.55.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.100.197.175 (trex/7.1.5);
	Sun, 10 May 2026 07:01:55 +0000
Received: from [172.17.0.2] (unknown [125.163.203.7])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4gCv0n46blz3ytw;
	Sun, 10 May 2026 07:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1778396508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z0hLuJynO/FZp19+hPVBQw1mDXudlkMwCQE+aPHxYUo=;
	b=HM9L6+FlICnzR+WDVkX0/D/qm0pCzrH6amExSMNngxivzjUxcjSbUTUBFoXEByrtdsJjrk
	wxV2COgzVuooA95LpaapzP0SC8VUJ2rzeYKACvjEY4zCjfsdmpPVRgl8PCpNB4+R9+wN1E
	TuSQdqEPxg/gL3YKxNubhAhYfMkBt6LpN1ndgyKUqeGP+PRMhDmKZUQFSaAGTKtTxbHFwj
	BrPfxjL7VYa5NTwt0/UmemxV4xq59YixbDJxQZBykomHyqB/jgUaX6G1VsFLRHG7LmhdDN
	voyzcP1tEkitwJmeW+nLo4PV67YwWBp6hAgvfu299TLENoCuNzHZDB+jC3liwA==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v6 4/4] iio: adc: qcom-pm8xxx-xoadc: add support for
 reading channel labels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-pm8xxx-xoadc-label-v6-4-49700fd03005@smankusors.com>
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
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778396489; l=3445;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=4Ojc7tOLsSQIn0AgihGborvDDI5xTf+5QhgypN5c0CE=;
 b=2o2IWi3/iG/6idRCxs+NBo4n/C/Ikv3HO1Ae+L0XY7qrjtwXhYJKcvvjRGzp6B3EkrWtn4Gr5
 sNCyMCb2KmiC/7QfHD3jk4sEcItiihZq30Ez4uZgEEV8A8XUe6avhHL
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun, 10 May 2026 07:01:45 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Ceda56rl c=1 sm=1 tr=0 ts=6a002d5c a=aYg++IQuMqL9NhcFIsEovw==:117 a=aYg++IQuMqL9NhcFIsEovw==:17 a=IkcTkHD0fZMA:10 a=EUspDBNiAAAA:8 a=wxLWbCv9AAAA:8 a=RWyRNVyMI2VXGFIsuXIA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfAaQ0LUmBDRj5bz/5tTsqUd9Nl/Nvo348Bcy1fud0poYYCCRwQmWx7+7yc85fiZm0QPPF4uA5kl8gl6BY7lG9ENoHQHVPsAefIMV/BzO55LMKXcTx3H1 1fdfWpRPxCYsjAnIj5S3MSYbfcWsnXa9vXt4BuBG+u9FlH/tYDfGFggb3HjTZtlAROOeTBonk+NDd7lLbfgCq1pbeECu3BQsE0JRHx3Wq8p7L062VRxdDQEi utPonP4sOMk6582kltS2e2rD3o78hery8EtmIUcEg0MqHN3kms2KV8mJAVs+DPFgt936QlfEa3Z8X2wEt+7dNNz+AfOTNtGePDXo4xlSAhxv8GhDwfNFdfh9 SYFBk1KWcq+qvogTgTpogRYHeqcYojXiXcVM4HuB5ceB2NjdY8o77XVDncfm6jvXUlWwycgp0GqiD/xOMWaCQI3YurPbFKLMg/n3z+GJMgbRxKO6H5ve9ET2 F0iIr42Tp7qVwdN17judWeRo2wynu30FphlFN6yOG+4VXLvlVJPKnhD3M7MXrs4QgWQPtXzAEPJKMXsvB6v8pmZ59iSMXx0q/cOp8WKZyKnBcUD2Q6pyIaQM OFyrOQy08xr975N5ZS08ER5G6bdwZnLt+aLhK3xV7RIpTB/gTHVGOERTrFUelfc9/Vz9GfFKc46OKNzfV64BHeaSrRoBB/ozl3wmiu9EPaR7dG8cj1WKazM7 PnvPXKrdaIkp2lVUw/a76dX7grqBErR4
X-AuthUser: linux@smankusors.com
X-Rspamd-Queue-Id: DBEB5502E64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106794-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[smankusors.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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
index 282a67b46a5e..4a1a0cfb4699 100644
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
 
@@ -716,8 +716,21 @@ static int pm8xxx_fwnode_xlate(struct iio_dev *indio_dev,
 	return -EINVAL;
 }
 
+static int pm8xxx_read_label(struct iio_dev *indio_dev,
+			     struct iio_chan_spec const *chan, char *label)
+{
+	struct pm8xxx_xoadc *adc = iio_priv(indio_dev);
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
 
@@ -761,7 +774,8 @@ static int pm8xxx_xoadc_parse_channel(struct device *dev,
 			pre_scale_mux, amux_channel);
 		return -EINVAL;
 	}
-	ch->name = name;
+	ch->label = hwchan->datasheet_name;
+	fwnode_property_read_string(fwnode, "label", &ch->label);
 	ch->hwchan = hwchan;
 	/* Everyone seems to use absolute calibration except in special cases */
 	ch->calibration = VADC_CALIB_ABSOLUTE;
@@ -803,7 +817,7 @@ static int pm8xxx_xoadc_parse_channel(struct device *dev,
 
 	dev_dbg(dev,
 		"channel [PRESCALE/MUX: %02x AMUX: %02x] \"%s\" ref voltage: %d, decimation %d prescale %d/%d, scale function %d\n",
-		hwchan->pre_scale_mux, hwchan->amux_channel, ch->name,
+		hwchan->pre_scale_mux, hwchan->amux_channel, ch->label,
 		ch->amux_ip_rsv, ch->decimation, hwchan->prescale.numerator,
 		hwchan->prescale.denominator, hwchan->scale_fn_type);
 

-- 
2.34.1


