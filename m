Return-Path: <linux-arm-msm+bounces-101869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDWYBGaT0mkEZAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 18:52:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1FA39F065
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 18:52:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0747E30071F4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 16:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D05C31328B;
	Sun,  5 Apr 2026 16:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="q4vyiR4B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from seahorse.cherry.relay.mailchannels.net (seahorse.cherry.relay.mailchannels.net [23.83.223.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97731F92E;
	Sun,  5 Apr 2026 16:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.161
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775407969; cv=pass; b=MKl4efTOlFRGJX33IwAbJwopkKo4XxLjZAlD4OOk2Z437nG0gHwHKhOyXsfUHDm0Yz/vklLiWs6NXRPchkw3B6vlduZQtdBI3TVhUBbvRKnnojn0M8To2g3XdQuOVsZPyJj2Pj8STFzVCjF/g8BzA+rhtuu8GfuMDq7z/geDHJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775407969; c=relaxed/simple;
	bh=EZvCXxmXvySQhsHp6IWve7TbCpesTjhOh1VUEuJb5Ck=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=iDuy9xBHCRzMzYpaXKa012r6kj9OqDWWgzaVn+YpEQ5nSqLdwRnHdB88kACGND0nS4VLUijT9GD8Wr5S53wEXvG92I6ocAVWFkK5OAfEv2hNfwRm1x8xiAfJ4dUiM+dn6S3NqtJrE4jfGSFeluOw4aL8LdWkgh0a65AClni1PpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=q4vyiR4B; arc=pass smtp.client-ip=23.83.223.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 943CA6233B;
	Sun, 05 Apr 2026 16:52:40 +0000 (UTC)
Received: from fr-int-smtpout21.hostinger.io (trex-green-6.trex.outbound.svc.cluster.local [100.96.162.172])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id B25E461EE6;
	Sun, 05 Apr 2026 16:52:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1775407955;
	b=uyCSFAs831DzWou3rdSgXZD67kZStmTarnH5NAv09qvXKCng8yBj5/hyJzFoYNmB1ExFr+
	6bQEtf2aJ/6hQOy3lNJm4MMQuyKCr8EgMZmxBk3p3QmqeosdHK38V/1mIHq5g3SE/yAFZq
	EYbWPYoFo6X5TmD3yYCPPiQ7FITJ3OBRwSZSOGw5mvqFUVHRTudYoIVWuQiDHm2Nwusi/3
	GnJ3GLqWWYqyuNCWahzcMUQlX2rzKkiDaZVNzGUmcmhz4zs7b/SyG9mNHPKP7NtWYgckSp
	PPkTFVSeOy63cVVFOR675eKdU0BRlRDwKbNow1vnKZI5czr9JwITGAeXfSNmcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1775407955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=0hEJfRZL2GIoJ9y9RUP+pRIEiyvVIB8dhWwj+cFjh/c=;
	b=CchZ8KjU9i9oRW1hECXejOF7WEYcKUyaGsFrw2Lo5RnFsngLQeI3oC2mMG7OXdV3gcLjU3
	pXRkjNg+IYzxp2ZFipJ3Keou39Ee04m3oI46HlMeuer8+yuRpzZOcJ1sXmjYM0z6809v4p
	tyXeL5xGPz9P9haMzDBNSM3HFH+p8kC8Ba0Ml8hklETEpLH0aOtuQgpvUXuwjY1xS2ENFT
	iFMawt0Z8bzkHZ8H40PWo2i5eTaaNGI+jBURZXLMA34sJL2lh9lz66K20YxZEP3y7+1Lox
	kuS08lVj4IwhiZX5R77IuUVmyhFL0GVSWrEVJcI22PWiejsNrosMFMs6+LSZGQ==
ARC-Authentication-Results: i=1;
	rspamd-bd48b9d95-kfrcw;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Inform-Soft: 50b9824505a2f1ff_1775407960501_602095209
X-MC-Loop-Signature: 1775407960501:692205676
X-MC-Ingress-Time: 1775407960501
Received: from fr-int-smtpout21.hostinger.io ([TEMPUNAVAIL]. [148.222.54.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.162.172 (trex/7.1.5);
	Sun, 05 Apr 2026 16:52:40 +0000
Received: from [172.17.0.2] (unknown [180.247.251.74])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fpdmQ0t96z1xnH;
	Sun,  5 Apr 2026 16:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1775407945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0hEJfRZL2GIoJ9y9RUP+pRIEiyvVIB8dhWwj+cFjh/c=;
	b=q4vyiR4BsEa5c/T8veVnc0lK8Er+8RLTn5Kvmlqcvuyrc22OWnsO/n2h8QKuPQOPhicUa6
	xDKfXHss+ZX3tXHfT/smT20Iu59UHrB0oO5UcTHrSRXqIoHqeXgf4Y7FjVvSKD5yeSkG3T
	4U1YGWGPrX5HZn3MHzZA97q+I9FHW8t/gGVcGyW6ghiRRa/7M/V4mqymZCGrWcVjKhlbf2
	bgc6cuYtY16wLEVSTiZuSo77gBQwJTnbOr+1Wi21vgleFvU6AT6cdM+awx43WNU5bs2OCK
	5KQhQdtWUjVkw9Vlxzfzl3GgvJCG90wJGixReE2hAiZ5nCQpdehZOmA24A1iNA==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v3 3/3] iio: adc: qcom-pm8xxx-xoadc: add support for
 reading channel labels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-pm8xxx-xoadc-label-v3-3-9fe179c283ec@smankusors.com>
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
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775407927; l=3487;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=EZvCXxmXvySQhsHp6IWve7TbCpesTjhOh1VUEuJb5Ck=;
 b=aBPJMkSjbSOgeM6iloBF8lAxAAsGUf3xgrX3LHRw6FqrPRqzgEc8o2z25GX91IenLx9F0Mkqm
 zOlGkzZn1NhAcOrRC3D2nBI+Z48P1JTIKk4kEs2/kaJBX0p4dwm5QJg
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun,  5 Apr 2026 16:52:21 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=UN2PHzfy c=1 sm=1 tr=0 ts=69d2934a a=iMBLmzX4nuXcozcv68JNPw==:117 a=iMBLmzX4nuXcozcv68JNPw==:17 a=IkcTkHD0fZMA:10 a=EUspDBNiAAAA:8 a=wxLWbCv9AAAA:8 a=RWyRNVyMI2VXGFIsuXIA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfI0nPhALSosJI+v+oJPO0SjtJmuCDvm+JLLK2keCfvqLo1cGIgAYYsVbTFd20We0Nbf9mclb1cR0e3S7BUJqlwkszZ4mYq9WOM8w8jnXH+0kf1kzCnft eKu6DUC0CY8HUv/thvbfOP/sZmbYyo8F5Q7oF96TGmC2J9+UyD6yJRbozSrale95vdNANhMJjIwdw0LFwt1sjrZ6pLYkbQEkFk9CvsDoPKMMDVoAteAHfMnE qAS053efXPMYyoSMI4yvxJZckCljAm7PyV0Bgdrt0bZLkgKwJrpRhQS+aDGhoyNUKE9N4MsJaiR5U1/kzIY9ug/MXi1JmndLVnKEV9emvDtobRbB+JYUm/qs M3zRUMTimxuqC+HuMfbgkTvciF+pj5HEtBXYuWD3fK+QQY73OcQnAL6JAfNCwdwJAIFYoc76IrbS/Q+vziwme744ZxZ1XZ/qAfqOb3qeqL8vlkosFJXGP5Sb 1vf9408FcRF6vY63tnNPbxiWYjpCq2q/Zz3UC7scvbk5sRPtPEHGFEbdHyk4LjkbJuzuOohthYFnp3/lQlnqZr32trTK9Q0lGpVfrJg8RwH12n5R2L4DTeVW 9zlJV8m1riVALUuQbMFKpp4FIzT4LvyMlHjPs1Vv3pXSs6nuPMlS8qrI+oCza6qMoYtlQ8LyAcz39TAkrwM6PWU4AMsLyyrmeetP4U2M2PcW8pbIdIyU0zf7 C61dG5TDf7I=
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
	TAGGED_FROM(0.00)[bounces-101869-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
X-Rspamd-Queue-Id: 5F1FA39F065
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Implement the .read_label callback to allow userspace to identify ADC
channels via the "label" property in the device tree. The name field in
pm8xxx_chan_info is renamed to label to better reflect its purpose. If
no label is provided in the device tree, it defaults to the hardware
datasheet name.

The change has been tested on Sony Xperia SP (PM8921).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 drivers/iio/adc/qcom-pm8xxx-xoadc.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/qcom-pm8xxx-xoadc.c b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
index 537b03181cbfb4cfcbcb242bcc2c7be18c4c384b..4ff9fee0dbbd9df80b97eb91744133c3db8b3bde 100644
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
 
@@ -718,8 +718,20 @@ static int pm8xxx_fwnode_xlate(struct iio_dev *indio_dev,
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
 
@@ -763,7 +775,8 @@ static int pm8xxx_xoadc_parse_channel(struct device *dev,
 			pre_scale_mux, amux_channel);
 		return -EINVAL;
 	}
-	ch->name = name;
+	ch->label = hwchan->datasheet_name;
+	fwnode_property_read_string(fwnode, "label", &ch->label);
 	ch->hwchan = hwchan;
 	/* Everyone seems to use absolute calibration except in special cases */
 	ch->calibration = VADC_CALIB_ABSOLUTE;
@@ -805,7 +818,7 @@ static int pm8xxx_xoadc_parse_channel(struct device *dev,
 
 	dev_dbg(dev,
 		"channel [PRESCALE/MUX: %02x AMUX: %02x] \"%s\" ref voltage: %d, decimation %d prescale %d/%d, scale function %d\n",
-		hwchan->pre_scale_mux, hwchan->amux_channel, ch->name,
+		hwchan->pre_scale_mux, hwchan->amux_channel, ch->label,
 		ch->amux_ip_rsv, ch->decimation, hwchan->prescale.numerator,
 		hwchan->prescale.denominator, hwchan->scale_fn_type);
 

-- 
2.34.1


