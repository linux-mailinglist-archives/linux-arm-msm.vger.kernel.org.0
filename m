Return-Path: <linux-arm-msm+bounces-104563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EsmPDOd17mnAuAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 22:30:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7855446B10B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 22:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEF9330037D4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 20:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B7E38BF63;
	Sun, 26 Apr 2026 20:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="AryitUce"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from toucan.tulip.relay.mailchannels.net (toucan.tulip.relay.mailchannels.net [23.83.218.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9278521D590;
	Sun, 26 Apr 2026 20:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.254
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777235428; cv=pass; b=fHdtIR0Ueh3tRc+bTo8rjghOUqXTbJzaAv0fT6q5UsxRowjR8YTeFnGoeenX9oMeLgKd/BOTsNkTGFANe9sj3ETdEmG7RRhlXmyYmhO00uO2fdrnCvBFXixMnW64yva7KhS5wjBfx1AWfV8U56RUhzfVdsaAklfCWijrbWaG26o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777235428; c=relaxed/simple;
	bh=gTun7CVr+qLQaDkI56HCMehOrrUkXSupzrbhZTNDApw=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=EIdwn2rDF/NVhIiX1/jTFMKR7LDIAN1mxoucDw1gJbv2vwyvBPfoXZ9eht+2pjrlZ/ttv7GF517KwbEV09hw7qDX2OmFGz3ZDm79img8s3iTvJKe+JDP1b4q2s5XfM7Ot7Nv8CTCPcRxjtT8RDEgwNBDWLHFLyQNMGrsvgs9qfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=AryitUce; arc=pass smtp.client-ip=23.83.218.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id E1B61401E28;
	Sun, 26 Apr 2026 20:14:58 +0000 (UTC)
Received: from fr-int-smtpout13.hostinger.io (100-96-23-217.trex-nlb.outbound.svc.cluster.local [100.96.23.217])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id A2DC54018E8;
	Sun, 26 Apr 2026 20:14:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1777234498;
	b=I1HD3/SxzyUn2H6ogwSJ+ztbBgGlpik8w7HDmNx0svxY9Ez1oliQ005CKWoMPUXY1RisL1
	lj1lMsETxXbKndnAKj7+QTw+9mD9jIDp3jdaBQH+pWpIbdFmX2gS3DXtCvjAhs1IWbcRyT
	X2HnTAOmpEUMUxUcaw2a+f4j37tYFgeTmlaLD9MFbVSCFRedqcX5McGHNnb5bUQcs9F8qP
	pQFAdFIFMJseG5KyJxhffnJ29inHDEqnDFiIRKLeFsn6iE+4bBGvS26/gcBm2O80jlbumn
	jJN9rKjfNLRiHWpReOGTMBCIAbpTxsKvXbihWh4NlPH37FWhmZgLATuPW0eLzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1777234498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=Xi5eDSBPsSef4onabNWgrL3I0whjEzHOMmx7HSXyUpY=;
	b=wF1wx2Q/wKRZ43h5V4adgKJIrUKncqkWgKLCXhiW9ODkavMqHvi/4rdJjSN5u9wviVRlwy
	C5jL5lTrjaBr93J7azRxo2JTJywXdU8hc4wkRnqOgy3oyN/2z/VTC6GCHfd+qm7Tm+YQFJ
	k5qZlTN4XIrUCNazBNrdHfvWUDsRbdGyinREQ0Fl1IQI3tOtiHCzLSZeo9N8CoiJ5v7T6W
	MGSQKovHZmj7GHrkXMRG8zWrfLpWwPP5ZZCzQJp8I2K1a+TaWSsWVSWgJS21Cos35dlicG
	D0SsOtxXwXxgnpcaW3zN305+AuwijUCm3bHHCVir2FOuERZJLpgJJM1wRBzzMQ==
ARC-Authentication-Results: i=1;
	rspamd-b9d4fc544-shvgc;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Macabre-Society: 1f74cb0125baee99_1777234498837_2130805966
X-MC-Loop-Signature: 1777234498837:2693093974
X-MC-Ingress-Time: 1777234498836
Received: from fr-int-smtpout13.hostinger.io (fr-int-smtpout13.hostinger.io
 [148.222.54.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.23.217 (trex/7.1.5);
	Sun, 26 Apr 2026 20:14:58 +0000
Received: from [172.17.0.2] (unknown [125.163.204.171])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4g3dGL5MmjzyZq;
	Sun, 26 Apr 2026 20:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1777234493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xi5eDSBPsSef4onabNWgrL3I0whjEzHOMmx7HSXyUpY=;
	b=AryitUceFpxpsManZwH7KOIYKXloDM8Uzp5ZUbrjvFZfIOM2zTqAKxT2c2AtkXNs/Fi9C0
	sG6bG19XmvmdZbHNTrimDvO88JghuLmO3lMIUmA/2Bvf3v86EZ7mDMMGP1f12++zanedL/
	1C46uVBap0DLqdZLO2YuYosR28GfobrD9gPbtZ3zDRMjBx1fvS60AxmwNaOPYu1RroIZun
	3DXYGFjRcVWejldw4Bf+hxS1A0chYf5PeOr/91B9j+eLcRvP3V40M81TtTPPUM4vFvg0UZ
	Mfm9rV5zfeUcVOyhTIMXI4/PVx9nnAPK9y8tic9RHehsaEJQ6PgG8/bSOswVMQ==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v5 3/3] iio: adc: qcom-pm8xxx-xoadc: add support for
 reading channel labels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-pm8xxx-xoadc-label-v5-3-9e7b5a53ef99@smankusors.com>
References: <20260427-pm8xxx-xoadc-label-v5-0-9e7b5a53ef99@smankusors.com>
In-Reply-To: <20260427-pm8xxx-xoadc-label-v5-0-9e7b5a53ef99@smankusors.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777234478; l=3445;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=gTun7CVr+qLQaDkI56HCMehOrrUkXSupzrbhZTNDApw=;
 b=TACotUrjegBtlAE5yv8Fs5R1B155zyQicSmBMHsXmT+CMM25697dRSm3gdB2qPdQr33h71XcN
 2Ly6d+YGwkDDljaMH+l/Ga79/kejc7DagAZ8ou1jO4qR5nPcp7X2P3J
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun, 26 Apr 2026 20:14:50 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=ZbRPNdVA c=1 sm=1 tr=0 ts=69ee723d a=x8mjGQfUP7wLEdXozly9Ug==:117 a=x8mjGQfUP7wLEdXozly9Ug==:17 a=IkcTkHD0fZMA:10 a=EUspDBNiAAAA:8 a=wxLWbCv9AAAA:8 a=RWyRNVyMI2VXGFIsuXIA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfM2cY2zctsupZ18eyFRVLU11AmrKTtnj3iT/rjXO6RLBGErIONFeke61fFXMirqqZj6ptgIrdNl69z1wljZSCTSCgC3ni0iTh7jhS/p7acFkP5swcLRs EG2WCa7oPS1sZe1xZ/1gDblfld5Er+AHtsJ7oUcY7gxPGPmq3EHEB3iinTHQEorpwjXYOcT0opamNy5XHGgXLevtPOhi+PITBi+dPBmvy98sFNN7urQtAw9V eDNW00a3S44GkatguSBXjbl6hmZEQUgzykM3FUHbSkGby+0d3DDDZFiHgBkTB5o08Jkur9FN/7NhktVcqdRvhN/CFsnVVzebPySLlE+hr1Pujql9EpzJSpHD I+YnpwwVJB3gEK8VZbIywqP3ha4Zmj43BYP/qamHeJfKa3ceBuvdo46biLYuTSZSK3SFBCp+AD51PenQJ7/RazNVu+Dz6RJQbLO2mq4eFpX876mB8MRqpT0z 7neEx5XiIG7au/HYvOzC/yPww3JS0FkdOqXRp/HuqoBOrnFFOhqFyAI7zpPsE/VBsEcW2cCigKPEDEjrmWo6H2AfViF+JfUaa3Qkrv9UTdiG5OlKHohOMx55 DSmgNYjrRPYn6Jdirq3BDdGXdM3qvhOfvmUelQsPoLG3X1J8hDjF7VFDCiCekcDAwhoBNYsMpZjC3QwP0KZdadzKEQfPmdno3dGnM0H/dpEw313ou+zUDY0s THZq8zaP62Q=
X-AuthUser: linux@smankusors.com
X-Rspamd-Queue-Id: 7855446B10B
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
	TAGGED_FROM(0.00)[bounces-104563-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[smankusors.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smankusors.com:email,smankusors.com:dkim,smankusors.com:mid,qualcomm.com:email];
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
index 89858e81c859..d44eab7b36a8 100644
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
 
@@ -717,8 +717,21 @@ static int pm8xxx_fwnode_xlate(struct iio_dev *indio_dev,
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


