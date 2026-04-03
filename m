Return-Path: <linux-arm-msm+bounces-101679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIySGwzfz2mn1QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 17:38:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBC8395DA7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 17:38:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2AA1E300E2A2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 15:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645CB3C7DF0;
	Fri,  3 Apr 2026 15:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="m+Gw345u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from seahorse.cherry.relay.mailchannels.net (seahorse.cherry.relay.mailchannels.net [23.83.223.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997EC23ABA8;
	Fri,  3 Apr 2026 15:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.161
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775230729; cv=pass; b=fw/HVPecdMKXiwjExCBTEWdLDagcsvgtofRkqv+YVbpzN+d4gmsFBBuO2Qocd0XB61SDXFOpei1vOcvKmutfy3lz+fjyOYKXfy5aaxqpfaXwJT61F3NDsRsotXO4/s/6aqUSNaeuk29OdswXLo1TJ74ZY56wpGhLWghNFFk6jKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775230729; c=relaxed/simple;
	bh=66aIWb+bdnJRjf0S3pgNBTYc9+jV2JGl1jqzb6xpZ5U=;
	h=From:Subject:Message-Id:MIME-Version:Content-Type:To:Cc:Date; b=rsk7VqkzRh9KkQTvFQQHlGaTvmrtjC8KkuTcQho4LnRj7UA6QuLsUpHhFxR8D0JoWbHllcRRwRRFZ2d2kxuogjgTIFx3CxeslgIrT3f/K6ElFPF1Cc4xKAv8gck7Z7aIjxpnE5rxI3hKXjkusz/R1V+4FhPiQYLM86v6FCr0Wws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=m+Gw345u; arc=pass smtp.client-ip=23.83.223.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 4F29B4C2DBC;
	Fri, 03 Apr 2026 09:23:34 +0000 (UTC)
Received: from de-fra-smtpout2.hostinger.io (100-96-162-196.trex-nlb.outbound.svc.cluster.local [100.96.162.196])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 487174C29F5;
	Fri, 03 Apr 2026 09:23:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1775208212;
	b=G8oisKrwJ1l/HnSMp+O/HMBN5ATBRopm1oaKhKjsxS8kGzarYG7g3C93+OnIcaFMtipbtF
	vjqX6UMqZn7LCvBTi1TW1OpkI7gmKQ1skLjHeJOC0yKazuj6AJbkLJD6pgvN0V1iVHdE9a
	UxWOmbkmJbsCbq2iS/ifVZ04wsWatpMBcVq8qIRKJI3CyqS3NYwUwpOc2O4TgeBmkmMCvx
	f1TTzp6jNR8Je52A/3yvUDOzVolYcNXzvHRITiLcF0MVnDy78I9vcwRjeLsm5fSp704fdt
	XBmp3GEX9uUUulfbO5HdcS7IZ2GFHgBEEe8pT9RAF+04J8aAg7qhKp6/CYw1SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1775208212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=yFVHNGHk5kTfuOncaVGOWPAMBNUlAY7jMU0/aoPowls=;
	b=Q7zo8P/mN9gMG3wtHY+5rUG5I8TpSOh/l4VdZcFc3DQyN5NSQ7SfSx/o4LHiYVAu6usOFH
	aW+jOrWenmzmX7n1bkaeP/H/8Bk/FoT1azx2HCUcWix2V3djoYMvbr67HUlrN9aWiugC3e
	CzkOh2PnP8l3YT0VVbKbWqKFJSTY5td2ZysbUxJ2UyVKxHBnYC9sZmusgc0RviqAAn2Afq
	1tFelmH6GE6xYQRcdzVITr+7ZcT6KXNbGm1RLYwrKf7Jrop53b9mm2Duw1JgTCUX40ByYR
	wy7lukk44dBI5QPp3V21FQqO/Kes/kx842Aw9zWtc4WganuirRg6v/xuzc80Kw==
ARC-Authentication-Results: i=1;
	rspamd-bd48b9d95-mj7k8;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Versed-Shelf: 3ab720a23a149024_1775208214152_1178420929
X-MC-Loop-Signature: 1775208214152:1316233226
X-MC-Ingress-Time: 1775208214152
Received: from de-fra-smtpout2.hostinger.io ([TEMPUNAVAIL]. [148.222.55.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.162.196 (trex/7.1.5);
	Fri, 03 Apr 2026 09:23:34 +0000
Received: from [172.17.0.2] (unknown [180.253.47.239])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fnCv33qqCz3wpf;
	Fri,  3 Apr 2026 09:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1775208194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yFVHNGHk5kTfuOncaVGOWPAMBNUlAY7jMU0/aoPowls=;
	b=m+Gw345uZJJGZP+TwbUzrRuxDg/N+kpdPk+sJKKAXUERSeZH5AyB8hrdTCXkwz60sJ8jEK
	YvBfDpcWfpT3sxUZN/qP5UuD6kR2mBE6fA9wjJQsfMEk1s0Gr/Lk6fw11m/QVF8Fb40KXG
	/edx+qeq+jF9KJQBLk4gmQbXRRYlIzodduLpgPAUqZRFgl9DeDJSZ8ljPFulpPo5rinXBf
	WoUWO9Z0IGTdYAcTwKPN47d62lBhrJBDRjepegOLWxdFrfkB/GH/UJh0h1189N+5fMck/1
	vmW3H8fvTqDK13JQb8QQ7U4LbdCmvspYRGiAMI0vTyVWmsEAJaFnIUCHh+rwPg==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v2 0/3] iio: adc: qcom-pm8xxx-xoadc: add support for
 reading channel labels from DT
Message-Id: <20260403-pm8xxx-xoadc-label-v2-0-29b50bf821e6@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOKGz2kC/22NQQ6CMBBFr0Jm7ZhSEZCV9zAsBtpKI7Sko6SGc
 HcriTuX7yX//RVYB6sZmmyFoBfL1rsE8pBBP5C7a7QqMUghS3GSOc5THWPE6En1OFKnRywqMsp
 URpR0gTScgzY27tFbm3iw/PThvX8s+df+cuW/3JKjQCGrWpwVqUJ1V57IPV7sAx97P0G7bdsHa
 dmi0LkAAAA=
X-Change-ID: 20260321-pm8xxx-xoadc-label-47afdf7f06a9
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775208191; l=2103;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=66aIWb+bdnJRjf0S3pgNBTYc9+jV2JGl1jqzb6xpZ5U=;
 b=+q8xl12f3pu58HFsrYqQFbmPTXsTJ6WF3KoLPgeNJb74fvU2s+KwajhqEL2/aVRhhkKK8/iTp
 qE9sX9TWWKWABnwbvHXBm41n5cSACwG8UfUXdmbQsySL0Yv3RW2JquU
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Fri,  3 Apr 2026 09:23:11 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Ceda56rl c=1 sm=1 tr=0 ts=69cf8702 a=EXl8KfDnlL3m3zOSb15mOw==:117 a=EXl8KfDnlL3m3zOSb15mOw==:17 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=wxLWbCv9AAAA:8 a=_3edPfKAy5zYfz3TofwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfB/sn2ihC4TU8lKKknX4CdxobJuoXCeC8RzVt7/nNBLhoThXmVvJD3xIJjbnGtQkuB9IXJ6IasHaVabtqZvkeoJg8ERzRBMaOFSpvU1/2PZWaO3E5PNr 2jKhE2TeX8Uf/KrHnokwJNQfYvDAfmyS8FhWQv8jyZJPV6kYZsmMNmOVtBb76o/4sbOMc5VyUDNnFqhC0MK3o67Y05xrDg3maZrfkqsmxADXE1UpJFMRv2NP eml5kLk3nMvKSZi8O5tCXkZPcDo0FDE2O4ayc4bf9cpdz21dX791EXUx9tR+vXNQqnDVXaFUggZlrP0dm1ZJc2CIuGC9BGOvZYddUUfeG7wrDlUSF2jw/eKT rWrgJbkHwLU8zdRg2e1zkcoVES9umCsr56S31iVT1G4f7EZTdV6kwQJYGNHnP9nGFiOXdC/V4FBpEalKhHQ9LeaPO4ItBrDnB+opQaUWm8NeylS2GHMHHAZ1 iSSIJL9PvaVBIvMi9bJN03qWrMqs6JLRj1C9pViJLTzSic7EszOhhBirPOJW4EwbpMIsfagggqZtR4zEQURCBknYyHyNe4tWf4hy3Fb/0aEaNipyip8JBNij gqWSX7jH+ghtBBEHnR+U00MHXM220x5AAarrSM5ewoV0hEKc3sb7n0LBdbf6R8ZhySxS8ST3vXfBCJZ64hZAGrVNtFNpHtM5h/J7QW6eH0QQLA==
X-AuthUser: linux@smankusors.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101679-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[smankusors.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smankusors.com:dkim,smankusors.com:email,smankusors.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EEBC8395DA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds support for reading channel labels from the device tree
in the Qualcomm PM8xxx XOADC driver, along with the corresponding DT
updates for the PM8921 PMIC. Redundant error logging in pm8xxx_read_raw
is also removed, as returning -EINVAL is sufficient when the channel is
not found.

Tested on Sony Xperia SP (PM8921):
> cat /sys/bus/iio/devices/iio\:device0/in_voltage7_label
usb_vbus
> cat /sys/bus/iio/devices/iio\:device0/in_temp12_label
ref_muxoff
> sensors
iio_hwmon-isa-0000
Adapter: ISA adapter
vbat:        267.86 V
dcin:          4.82 kV
...
chg_temp:    +1071.4°C

Note: the sensor readings above are incorrect due to pending calibration
fixes are not included in this series. This patch only addresses label
visibility. The values are expected to be wrong until the calibration
fixes lands separately.

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
Changes in v2:
- Remove redundant error logging in pm8xxx_read_raw, since -EINVAL is
  sufficient to report failures.
- Reword the uncommon Tested-by commit tag to freeform text
- Link to v1: https://lore.kernel.org/r/20260326-pm8xxx-xoadc-label-v1-0-027805dad4db@smankusors.com

Changes since original patch:
- The label is now read from the platform description (device tree)
  instead of the internal datasheet name.
- Link to original patch:
  https://lore.kernel.org/all/20251028-pm8xxx-xoadc-fix-v1-1-b000e1036e41@smankusors.com/

---
Antony Kurniawan Soemardi (3):
      ARM: dts: qcom: pm8921: add labels for ADC channels
      iio: adc: qcom-pm8xxx-xoadc: remove redundant error logging in pm8xxx_read_raw
      iio: adc: qcom-pm8xxx-xoadc: add support for reading channel labels

 arch/arm/boot/dts/qcom/pm8921.dtsi  | 12 ++++++++++++
 drivers/iio/adc/qcom-pm8xxx-xoadc.c | 34 +++++++++++++++++++++-------------
 2 files changed, 33 insertions(+), 13 deletions(-)
---
base-commit: 5619b098e2fbf3a23bf13d91897056a1fe238c6d
change-id: 20260321-pm8xxx-xoadc-label-47afdf7f06a9

Best regards,
--
Antony Kurniawan Soemardi <linux@smankusors.com>


