Return-Path: <linux-arm-msm+bounces-106798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEabAGVIAGqnFwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 10:57:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7255033D0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 10:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA1283011873
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 08:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6AFD36A01D;
	Sun, 10 May 2026 08:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="ZOJAvb4W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cornsilk.ash.relay.mailchannels.net (cornsilk.ash.relay.mailchannels.net [23.83.222.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506CA35C180;
	Sun, 10 May 2026 08:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778403400; cv=pass; b=pPyXL6h8tewdgW5PCXnpzBtnbAx8osnIzPs+/ZdWMaYU5zdQkl5Mgc/mo/bmfF8/lzJ8jmbBBGbLH+GqrBC1qsMudl4dqJUWfJ7awciyEUAwPb/00MzAd570DqVwXeHbLNWH2lzcZC1RjnfI2T3dzvd4ZN0GfkexU1MnP6pm3Fw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778403400; c=relaxed/simple;
	bh=LJw0feRo6h/fdCYR3DzW037kC4NR/95nnheYGUKw0Rg=;
	h=From:Subject:Message-Id:MIME-Version:Content-Type:To:Cc:Date; b=iW47Jf3CBInhoe9Y3QnqhqhIDdNNsdBWedofC3rBi3lMQLbPLXmgUpApMAVRj68RR0NDg3GLE9ucr4UqTzAN5zzDRFLSS2iSZ75CHZYByLmJCkHimlbvY4RFx4Uh4iC8rColn2rK9/eB4dlArHtKJLAFK4A7iu32NOPp35Km+hI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=ZOJAvb4W; arc=pass smtp.client-ip=23.83.222.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 51A4672040F;
	Sun, 10 May 2026 07:01:41 +0000 (UTC)
Received: from de-fra-smtpout6.hostinger.io (trex-green-4.trex.outbound.svc.cluster.local [100.103.253.195])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 55317720D62;
	Sun, 10 May 2026 07:01:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1778396498;
	b=YfNuZq3hN1w3FboaSTURlnctlAiMGuUsPRDkDVbRd5OoCA57sDsI7cLTq6Wt9lO66MkrHU
	BR6BfQadASpCdeo2N7228AaNf/1uosdvnTz4H0Ay/n6mQWebv+cxFmQDvHNBTvkLaqsYt5
	+c5FeJx/dM9jJSIpBDmAbncwnWAZbUU2fYLkrHJy0QSB1MF+gXVuWzG1WriikDtkdB5zXz
	//PnPa+lbAnaGPf/2F6zlVcEGHE5RjmzlYDVvcYYIUMG/+dm79cTVO74l9Mhg+noPrR4bW
	P8ThJinCOcZYrl1kAQD9taQ3yPPXyGzoSljsooZhBMVwatn/LEmzR+qKb3GfzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1778396498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=OWN7kFmTB9cIrKIoHElkniUz55DlU2ENwGRAv/EJhRY=;
	b=4g5Oirmy2o2NkcrFXps/AyfGi5bkBFztXub6/3ydHo6G+hycQpQiVwg4zEDMkhDch2xxnH
	1mNlRNqAIEzyklgNwn12hoCtSjD0xuKVIWgZ2O98lWVFNz1bY4s1TUD8/H2Wk/fQi5TouZ
	VC/7cX0CkuomXgD6UITUJNi7W24NDc+ipDNxn5VPINZaYYvwsDjP9DIjihhmWfqXQEZ8yQ
	7eOM7zNqrrXfFtAjaTUxZ0KAkHDfsLZEgQ+Y53VmVxNZJC/Tp3z794YVsR3Ciq3TtOoDb8
	mKc84qzXnYV5VjFUz7LyNhgVyD6jIp2QHmPCLN+VYvtGHtPXQ9+qvLsU6grtOQ==
ARC-Authentication-Results: i=1;
	rspamd-79cfc4d687-w9599;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Relation-Snatch: 4c2f37de1e316e3e_1778396501059_1300172283
X-MC-Loop-Signature: 1778396501059:801621561
X-MC-Ingress-Time: 1778396501058
Received: from de-fra-smtpout6.hostinger.io (de-fra-smtpout6.hostinger.io
 [148.222.55.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.103.253.195 (trex/7.1.5);
	Sun, 10 May 2026 07:01:41 +0000
Received: from [172.17.0.2] (unknown [125.163.203.7])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4gCv0T54H8z3x6D;
	Sun, 10 May 2026 07:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1778396493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OWN7kFmTB9cIrKIoHElkniUz55DlU2ENwGRAv/EJhRY=;
	b=ZOJAvb4W4fzIZDxm5JUlLlleHb2iV+jZNVIqSNVUIM4ZQd6BrDLDN0GbGzGEXRooOKazHR
	IumViELtJP9Wh6s8p4BVQLiJo0TZGDmiQHeTp/QNAgFks5Yy+W5DdOcwMuQBo1+ykxaOfK
	1MME3oOAkllTse+a090EZrkdZ4vwfqOnhzuKaTpAbW8Q6O68DZ5fRz++Dqsq/9T2sztSds
	ABYyPdZEANv8OTP3EEdSOc++xLWnQNam9v9Zuuwt4iNGaIrrc57VkIfNExQOVqOXd5oy50
	a4noAJ4xkOh8RYKXMYPWSqve4PCOmq1a5ehi1kN8nxEeoNgy6JvDZW4eYE/CVQ==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v6 0/4] iio: adc: qcom-pm8xxx-xoadc: add support for
 reading channel labels from DT
Message-Id: <20260510-pm8xxx-xoadc-label-v6-0-49700fd03005@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAK8sAGoC/3XP20rEMBAG4FdZcm0kmZwar3wP8SKHiRvctkujJ
 bL03U0XxILx8h+Yb+a/kYJLxkKeTjey4JpLnqcW9MOJhLOb3pDm2DIBBpoJ4PQ6DrVWWmcXA70
 4jxcqjUsxmcS0s6QtXhdMud7Rl9eWz7l8zMvX/cbK9+kPp3vcyimjDMzAVHRRRv9cRje9f5Z5K
 Y9hHslurvDrSCa6DjQHrFfMpwE46q4jjo7qOqI5NiE3NsAgMHQdeXD+6SX3XhjMAEKD5qrrqKN
 juo7a/0HjlVMCk7V/nG3bvgGyrHxm2QEAAA==
X-Change-ID: 20260321-pm8xxx-xoadc-label-47afdf7f06a9
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
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778396489; l=3350;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=LJw0feRo6h/fdCYR3DzW037kC4NR/95nnheYGUKw0Rg=;
 b=D04ryW12sihGdIxiVNEXxqnMfMaKw2a0KTGSS4LA607fmOjyq9XOf9V2pzFF29ExfOxR3uNu8
 i0xtUZY2GvqDfOBs9YhcJuWj/Cf68jgdCDsQhOfXua88yCr19W53G7+
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun, 10 May 2026 07:01:29 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=ALriHGRn c=1 sm=1 tr=0 ts=6a002d4d a=aYg++IQuMqL9NhcFIsEovw==:117 a=aYg++IQuMqL9NhcFIsEovw==:17 a=IkcTkHD0fZMA:10 a=bC-a23v3AAAA:8 a=wxLWbCv9AAAA:8 a=VwQbUJbxAAAA:8 a=SVKZwNC4Madxtg2eTdAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=-FEs8UIgK8oA:10 a=FO4_E8m0qiDe52t0p3_H:22 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfAXyGkWY0Ckl4XhVpyJaWYDKxf4MS7eHSjsrcMlF/8XOaD1osyTGAbtfE8tzv1g6b3/cinYr5nTtUwLWh5PTENs7Yt63BjccZ4gys66KO2ah0866ne0o S0nCFc/WXUhM9DnDChcpAji86VkKhii/ax6kJzzjpyf4+xyOLXz3BKZkrr24eDHJdrnBXU9UxG1U64bi87XhlPSN9PtA3hI7pXsLCgGNh09WR3GK5dHiTz3d miT58BhHQWPY8nOloD0/o52erLL/pFT9yC3M8aUSeuO0QyUPaHVfFs4bdsKkVyQTYcoTJE15xgMuLbdEQOmTz6m0dBrH3LXb5iHYV/lJv+qzYnrrGfs2MWuz 3EaycroWJS35tdAQxd+3yoxlWubvvq0KVGEYvicP8u08I8Vy9Qqt0yKCjBG50YMX2mGPfEi56FV9Bi7bvsM+tt0HqYlwLVxrFfxpq0iRnWPTF/OkLoz9Mbdb +C8euf2Q7vgG9xG1t4ohRQ1DJhWaOK0RjtkNJ2gzu2kDiWX6tHkbIZjwEGpKVeC3qHTEIW/ra5s6xh93lXp+DXI/bGZk28BhtSJjPhx/TsfOmX2KFeqziG7z WWEcZZNHjz/kbatjzFKJzsIXNhO+QqVSQl696Ow8609KO87fleYRSs9xr4C+crFad6HFXqBoynEAs6xycYYMTHrnSjb1q5+SYxmtSwabbPfVRyhS7189oFgA SQGtxqLxgXwzJKdX9+5XWo5olKg/SAa0scFoPMnblPtEDWKnFWTfAAIjEB97XORdMti68v2VZut0WNXnph2/chNyPp/4bcg54HBk+04Obzs4L0iuTEXUAg==
X-AuthUser: linux@smankusors.com
X-Rspamd-Queue-Id: 5B7255033D0
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106798-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[smankusors.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url];
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
X-Rspamd-Action: no action

This series adds support for reading channel labels from the device tree
in the Qualcomm PM8xxx XOADC driver, along with the corresponding DT
updates for the PM8921 PMIC. Also removes the redundant error logs when
reading values, as returning -EINVAL and -ETIMEDOUT are sufficient to
report failures.

This series also includes minor refactoring, such as removing redundant
error loggings.

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

---
Changes in v6:
- Onelining wait_for_completion_timeout on removing redundant error logs
- Fixed dtbs_check failure by adding the missing label property to the
  DT bindings
- Link to v5: https://patch.msgid.link/20260427-pm8xxx-xoadc-label-v5-0-9e7b5a53ef99@smankusors.com

Changes in v5:
- Drop constify pointers patch as it causes build failures
- Link to v4: https://patch.msgid.link/20260426-pm8xxx-xoadc-label-v4-0-0ec782362615@smankusors.com

Changes in v4:
- Constify pointers in read operations
- Reworked wait_for_completion_timeout() handling
- Updated variable declaration style in pm8xxx_read_label()
- Link to v3: https://lore.kernel.org/r/20260405-pm8xxx-xoadc-label-v3-0-9fe179c283ec@smankusors.com

Changes in v3:
- Simplify label assignment logic by removing the unnecessary
  conditional branch
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
Antony Kurniawan Soemardi (4):
      dt-bindings: iio: adc: qcom,pm8018-adc: add label property for ADC channels
      ARM: dts: qcom: pm8921: add labels for ADC channels
      iio: adc: qcom-pm8xxx-xoadc: remove redundant error logs when reading values
      iio: adc: qcom-pm8xxx-xoadc: add support for reading channel labels

 .../bindings/iio/adc/qcom,pm8018-adc.yaml          | 15 +++++++++
 arch/arm/boot/dts/qcom/pm8921.dtsi                 | 12 +++++++
 drivers/iio/adc/qcom-pm8xxx-xoadc.c                | 39 ++++++++++++----------
 3 files changed, 49 insertions(+), 17 deletions(-)
---
base-commit: 7527e0bfead35a65431b3e865333e5277f97e706
change-id: 20260321-pm8xxx-xoadc-label-47afdf7f06a9

Best regards,
--  
Antony Kurniawan Soemardi <linux@smankusors.com>


