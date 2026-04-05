Return-Path: <linux-arm-msm+bounces-101870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XjvOBYCV0mk6ZAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 19:01:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB3139F178
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 19:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D90930068DB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 17:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE0730F532;
	Sun,  5 Apr 2026 17:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="AwNPWxN1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from siberian.tulip.relay.mailchannels.net (siberian.tulip.relay.mailchannels.net [23.83.218.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BE912D1F1;
	Sun,  5 Apr 2026 17:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.246
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775408507; cv=pass; b=mzJDI30rX+3LZNT3s9OaOZ2whN8zKHXC6Q5JsKsO9PbCxcrHm3XoXliQots0uUTp/ZXByZCikP/NV0C16WU94trEYqUH9lWqZ04Ua2ft90ts/bBOZpjnVF7UscrWf5G4tou4xGegvjEwUz93zy9PQO25i14lKX0y6N3yJMCyREU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775408507; c=relaxed/simple;
	bh=Ejvm1mF+34uxQNchjGqwX3gtS0hDoCRWgPN3CAGoRFE=;
	h=From:Subject:Message-Id:MIME-Version:Content-Type:To:Cc:Date; b=a7w1yATiKcCO+RDO1w061PHdhJuTUgFSK6Znqqrn+agG1JS5iEYUMRoUN/554ERqpXJo/rrls+LEupqUnYgWaaz0e34RjGBwXtyoQK48MtWZMi36c8+d+j/oZTKZYUoWMUVzG4QITAeThTs3C6PkWikVkTodm4RjGOIUkSFYz9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=AwNPWxN1; arc=pass smtp.client-ip=23.83.218.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 4FAB18C14AA;
	Sun, 05 Apr 2026 16:52:23 +0000 (UTC)
Received: from fr-int-smtpout21.hostinger.io (100-96-162-196.trex-nlb.outbound.svc.cluster.local [100.96.162.196])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 26AE28C1411;
	Sun, 05 Apr 2026 16:52:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1775407940;
	b=lsOqrX42vQSdlOe4+u/P7UAJl86eKKTIivhGFWIyz7XjLR5M5Ie+OnSbLa0jXzozKHiDjX
	+CJz2wK2qYDK3BbHot1Z7Wvl+F/WGbKggtdTz5EQufjLBTFACzHBi9dHXFVmP/xMRBo49v
	zKYSfFa/x4CMcn8bAK26+P3gSTrhBRvnewlhM126P+Si6xM0iEJ2809TpEIIOaEbO0QOEJ
	v+A2mX55yled+TXDrO/3veXGemQuLMdFmieykBucVEkOuV3AgKa6A0WgGKqVHySJ742ORk
	DvHVpuM6M/GQMqE4E9Rj6vJ2pxx/Yv6KdTlqYtJnElrckcX+NGiVLdW1CykZ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1775407940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=SGWkcrHLVZBbKHZdiamVXthl2/ys9O6HhTded3iU7kU=;
	b=J6DzBe1GglRp+skrs9VSRIqEnNyflZgBGIDYUia3hBDuMW+LN8f0szSedvw2EEBvY8skFs
	q5xLIveSrR+jlrY/jZMeL3uaSBJx9oY7dAjKBiujLl/AdBwBiuPe2Z1bf5hVivuJGBR82W
	DFYIdCohCZOp7SKHYxFHJu2rBjnFEWlYevO/Q7I//RUdSqKMYdaU3XVmiIY0Z+HcCGFFd2
	oh50wcnWqqkFUwDP7JKIYbFQZRJTWb0JmgHDc1KWHCgK4YsMnwsX3BfxeHDRyeyRVfupzw
	F2E29uU2VcANY/lw/TYnmBTvz5+ozpwMJUQXEUNjYtyXeIW5qBzKKVb3EER75g==
ARC-Authentication-Results: i=1;
	rspamd-bd48b9d95-7lsvd;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Thread-Thoughtful: 647ec49d56d22680_1775407942932_4024220470
X-MC-Loop-Signature: 1775407942932:2020132877
X-MC-Ingress-Time: 1775407942932
Received: from fr-int-smtpout21.hostinger.io ([TEMPUNAVAIL]. [148.222.54.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.162.196 (trex/7.1.5);
	Sun, 05 Apr 2026 16:52:22 +0000
Received: from [172.17.0.2] (unknown [180.247.251.74])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fpdm80xm5z1xmt;
	Sun,  5 Apr 2026 16:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1775407931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SGWkcrHLVZBbKHZdiamVXthl2/ys9O6HhTded3iU7kU=;
	b=AwNPWxN1q/KK17OPx8k+QsQ5VOKOioxN3B6MOZtlDfjLj5XHiIf0R/mJQ7NPD0K6QEF1G+
	IsfQ2EXLtoQRtg1+LJ8/KIA5aIHWNVhWrbB6T6ckhJ4weBViWdpND25BbHGGjs8AbVzLS6
	TK0587GfspmwkRNJiG2vtcYNN6bRYUkwbkWy58CT8OLFZ48aS68ax5CD1LBksMkJzrvERo
	Kig9VFLIJbrOgi7q2kZR87qKnbclj+Q1FqfizxrgYGSUCLI2dL5fwPmkdB+ybOWPz27GOx
	cdm90WnYsPLTGwlFhfal9OzhyRCRuPDP32BL2fC7Wyy68t/rW4GcdzL8Nwyd9Q==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v3 0/3] iio: adc: qcom-pm8xxx-xoadc: add support for
 reading channel labels from DT
Message-Id: <20260405-pm8xxx-xoadc-label-v3-0-9fe179c283ec@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACeT0mkC/23NQQ6CMBCF4auYrq0ZBijgynsYFy1tpREoabWpI
 dzdQmJcyPJ/yXwzE6+cUZ6cDzNxKhhv7JgiPx5I2/HxrqiRqQkCMsgxo9NQxxhptFy2tOdC9bS
 ouJa60sB4Q9Lh5JQ2cUOvt9Sd8U/r3tuPkK3rl2N7XMgoUMCqhlJyWUhx8QMfHy9vnT+1diCrG
 fDnFJDvOpgcbEQJQteYKfbnLMvyAROyhq4BAQAA
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775407927; l=2427;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=Ejvm1mF+34uxQNchjGqwX3gtS0hDoCRWgPN3CAGoRFE=;
 b=AM5FjeUtNuBk7wTiHcsisTO6mn4c93LxD2rfperT1s5O3k0IrR6wsG+cwz2PIb6XGDxc2+4il
 phgoEb5wOBwDQuLrTUAAP6EwCsIuNHq2CL+2xTAcsOVB89YgE63a6Ei
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun,  5 Apr 2026 16:52:07 +0000 (UTC)
X-CM-Envelope: MS4xfLpUBOISr39bgW0PB4sUOyf3l8Le8d9RFCOofAwBW9szaZphhGHo2Q3qgdSmVoB7BkgvDJiRZLLXtOeLeHMDaezGn0iCM78wtozLdHkHrxERaLT1HlTA fDb1P6jnUO7/IcZZ7cewf7fiQGbO8jLScjsCy9Z5ngHLqPO/MMaWPS1zwX6hUQxLTGbE2rdL9qKk47AO6vQgfBaov9CIvuXXNPyH+Ql8UrMzx/z1hCNahGOw z88kBgNND0MQ+brYVDLBear4xyIwZmYrcRxnYjXjvLdhcojSd42y+rgb3tKzQdZjNogF3Zpg1qf4PMmIPfKgcoe4QvaKlvtd4NWQ8QTFgDV92Nj7kpLlBOl4 Z5ZYiKFKpws45BTt+lvYN/DP0X+g8Ks2vGpqiupbW+zpeJFnwqyE/M/PVL8Zn+vLlWuTqLhKSUKfZc/7lOTPiBrbHosPBtNhbKBf7MOiqBhMLSa1RTwdzbMC rUFU/jYABiiRlY64m78TPpdyG/zFdByYIuQsd94v/mYpen7gQhqmqJLMDMieYgj38Eww5KNWJCaOP3DSPPme8zWL9351uq0Q/eS5mM4Tnix6xkaRcQaHBgPf Uy3R063Q3W29kUrtJNf0/9ndzMv/K3osEVyWd8bg7eGoRAqzdA8cVoPP4a6EkgPxz7Rk+7lWTKBxUaisxUyJ2rtiz/+IGTqylsCXYcsM2jjebRhVsR08qg64 K4qA/Nr38/O6CxFkkxXInI9vZsmtx4nvmvrfPb8E8Tu5B0nepyPSYA==
X-CM-Analysis: v=2.4 cv=ZbRPNdVA c=1 sm=1 tr=0 ts=69d2933b a=iMBLmzX4nuXcozcv68JNPw==:117 a=iMBLmzX4nuXcozcv68JNPw==:17 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=wxLWbCv9AAAA:8 a=_3edPfKAy5zYfz3TofwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101870-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[smankusors.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9AB3139F178
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds support for reading channel labels from the device tree
in the Qualcomm PM8xxx XOADC driver, along with the corresponding DT
updates for the PM8921 PMIC. Also removes the redundant error logs when
reading values, as returning -EINVAL and -ETIMEDOUT are sufficient to
report failures.

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
Changes in v3:
- Simplify label assignment logic by removing the unnecessary
  conditional branch.
- Remove redundant error logging in pm8xxx_read_channel_rsv, since
  -ETIMEDOUT is sufficient to report failures.
- Link to v2: https://lore.kernel.org/r/20260403-pm8xxx-xoadc-label-v2-0-29b50bf821e6@smankusors.com

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
      iio: adc: qcom-pm8xxx-xoadc: remove redundant error logs when reading values
      iio: adc: qcom-pm8xxx-xoadc: add support for reading channel labels

 arch/arm/boot/dts/qcom/pm8921.dtsi  | 12 ++++++++++++
 drivers/iio/adc/qcom-pm8xxx-xoadc.c | 34 ++++++++++++++++++++--------------
 2 files changed, 32 insertions(+), 14 deletions(-)
---
base-commit: 5619b098e2fbf3a23bf13d91897056a1fe238c6d
change-id: 20260321-pm8xxx-xoadc-label-47afdf7f06a9

Best regards,
--
Antony Kurniawan Soemardi <linux@smankusors.com>


