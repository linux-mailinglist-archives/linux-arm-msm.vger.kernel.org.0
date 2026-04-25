Return-Path: <linux-arm-msm+bounces-104543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sP5bDsww7Wk2ggAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 23:23:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AB242467D37
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 23:23:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6574F3084F01
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 21:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749FB314A9E;
	Sat, 25 Apr 2026 21:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="TJDyKIEd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from shrimp.cherry.relay.mailchannels.net (shrimp.cherry.relay.mailchannels.net [23.83.223.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9338B13B293;
	Sat, 25 Apr 2026 21:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.164
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777151881; cv=pass; b=mjaq1jwsP9E7+Lf0kzfFXcqWg6cTM8rKL88AYWmvuLQjZpJ5Xq52klFBjldyqdlTGoVKellgVFSYQmdMW9q9sYzsi2HnKsuof49x2cJ4z1Zq112Vf7bqpSS7hfyDzXhVFkJDvWn0ASj6P8yWDGLE5ZtNVON2o9kDUku+HmDS3Oc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777151881; c=relaxed/simple;
	bh=DKe16X2BoJ7gddJudh4WbOGa/wJauotX/pbXVn0OcGU=;
	h=From:Subject:Message-Id:MIME-Version:Content-Type:To:Cc:Date; b=blUSmlBMNOUtAVZhWascIu0tqBW3bD/JRngAjJv4wlwuwpBGOZDykSiOKmU4qo8RKCLD507ZCD603f/kQ1SqHTQR5SqVEOF3tTiPqvAI5dI4f83Fq5aOApuNGWCNxp5j6R2jtOW5QYYNn21vjdwcvDUYSuI0kjqHS0gXHwNQHU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=TJDyKIEd; arc=pass smtp.client-ip=23.83.223.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 22E0F40105A;
	Sat, 25 Apr 2026 20:39:20 +0000 (UTC)
Received: from de-fra-smtpout8.hostinger.io (100-96-23-217.trex-nlb.outbound.svc.cluster.local [100.96.23.217])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 605AA401038;
	Sat, 25 Apr 2026 20:39:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1777149557;
	b=SSu4+OP3AMoXYuAbyAmAaVYspjSmJqe3eUGwUOmzIwD/WsPNrk/TeuE0UlE/ieWCJLoZH8
	FUkd+/wICqVUh2fM+x0TTq5B2wynnTZH04xM8ey5dsKfdY+cwtJFcDCrELAfBet5HvST4G
	htG/Zu6ZcMogApkRzG/fP7zatwoP4gDMrH2E+6aQCOFaUGyd6iCWun0KRMjzuIomffTh8e
	78NJhKI9n8lB0B0hp84FaUVRtw//aG9b6jK4SKRe63nXIp0srwzlaBsSu+TYkGQYeC4FcH
	uzQo4KElaF90Mv3J7PAIy7Re3AMdbrp1lAeqevyXAVNLkMN8Wlq6+6ivAbdl0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1777149557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=1oHrqCEHjVivdCMncTmT/WLemPHYOupx+GOeAuowoWI=;
	b=FfSky3OEKFP+s3v/2PcXl7JXPnzoQfCGDxnre4zNYHBVQqQkBZ+N080P+AYe+/gFUFeS7t
	L4wroOTzfzcUP2g9DlILjmhOPD9OUUyghzResQFobz8PrGlj31F47RMPx+izYpQy7k1uqH
	Wm43ZuAkeeBXEwOUgNeaJrkNxCXmLFXnqn7W+bTSN0fnZunNE5R54AEJSmVW2fJxUiH4iW
	crY5b6uPTGnHx4RscxnUX8Yw7QmSAimZT3yWTwd1/s3TUAy/eKKqV5EtG3Ya9udZUq53av
	zD3tPsBP2tsE20MpLA5/BuKIuRTgecDu/6insd3yxMA1uTRAilbv3m523whgLw==
ARC-Authentication-Results: i=1;
	rspamd-b9d4fc544-b49hp;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Glossy-Robust: 25f3d205244cb0c1_1777149559860_991257041
X-MC-Loop-Signature: 1777149559860:334977441
X-MC-Ingress-Time: 1777149559860
Received: from de-fra-smtpout8.hostinger.io (de-fra-smtpout8.hostinger.io
 [148.222.55.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.23.217 (trex/7.1.5);
	Sat, 25 Apr 2026 20:39:19 +0000
Received: from [172.17.0.2] (unknown [36.79.100.152])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4g31rp6Y9Zz3wqY;
	Sat, 25 Apr 2026 20:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1777149552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1oHrqCEHjVivdCMncTmT/WLemPHYOupx+GOeAuowoWI=;
	b=TJDyKIEdM89zy4cDtYxSnGIugmExm9awUAe20KmKLytboO5gPcKaxcQ15CT50AccuChwWY
	tykHEFa8SHZfuk72nQ5U6h3abgZBBZbIZa13ZSOC5qNqdMKpfAQE9jLKASCiAe2SjxVHer
	RREJx4Fz3tkR6bDmz+75fsrxw5TmBG/S3sEWEeak39QG0HccALYIRdLav8gRmHkW2j2nnk
	A5p6z03XDFmGdcgA4g5NEKBJ44AhGv9Ta6FPzj2S5dFk9OrdWKWnX0n9vowB+MTRjoAreO
	AoeAqMeIXIyL7NJlE0gNiLVI5lA2pCwhIrhxlZJz+A56PIz+L1U1Gz6cvhWt5g==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v4 0/4] iio: adc: qcom-pm8xxx-xoadc: add support for
 reading channel labels from DT
Message-Id: <20260426-pm8xxx-xoadc-label-v4-0-0ec782362615@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAC0m7WkC/23NTQ7CIBCG4asY1mJg6K8r72FcUBgs0ZYGtME0v
 bu0idHELt8vmWcmEtBbDOS4m4jH0Qbr+hTZfkdUK/srUqtTE2BQMAGcDl0VY6TRSa3oXTZ4p1k
 pjTalYYWsSTocPBobV/R8Sd3a8HD+tf4Y+bJ+uGKLGzlllEFZsVxLnenmFDrZ357B+XBQriOLO
 cLXyZjYdCA5UDc5a0wFHItNR/w6+aYjklMb5GWtoBKo/px5nt/Ecsq+SQEAAA==
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
 phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777149546; l=2835;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=DKe16X2BoJ7gddJudh4WbOGa/wJauotX/pbXVn0OcGU=;
 b=zl9lmySrfhhNxFjda5Ihxl8sTdVUGwI26zQQUZH9e1OBQMs+7Hq2GoavKLX1RgRmLTfkNq7wy
 D+UAGNinmDUAYh/303xU2/tWpT9aCgw+F621uNi2KEL2iWJ9r3L8WdU
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sat, 25 Apr 2026 20:39:06 +0000 (UTC)
X-CM-Envelope: MS4xfJcrYrOLBgtKMAHE/sjPeeF83v7SiWQlcC3DD6Kf5+CE7uBi0BoQwRwTy+rfygJi9L9rJOoIp/ym9cUFldu2tVUhUNOageujdsPp5ETt0CDWbE4mkxj0 WweHeZv4PgoNAYxUf7SNY1MCCSsQINJrKr2yctwpHPVmCh3jyD0Q0uGAWgz9/FNY0XbbqpH/1NNiNV/+GmgE0KK9HtlW9rR/6E9RLMrvId93FBWx2WsFN4R0 o/C+YiGrYFUuQKPcuUXjaucnOxzfDxA9RruL8OkZakU1B3x43rtgEnvPqVZzo9iDLzdQZxU8lgE4NOLBT38/WfaH7kIrOBwGTF2Xxv2x5zh2gDSZl/IZj9gA Jzsp5r2wclm5ZLW5rQXgQuO4wgYjw6f6LfoXITuVHMlH+Ij9WZs5mUcogbP2W7C/3pX5YNGcA6ea3IzF0He89mMpQw/TOzC0rlGX4Qc3D299k03Whbm0zY/o Z6+yJcOV4zIyNasjHapXxJKjok8yp8JkK/sLwVpE3qkLhmB2QgY6O66l5/GHbPh5DW71ttfdnJxEWFS0t/7ppdaZAzumkaGlxGF1CopvFyMelkoRcXdmwrax swmwcuePjC4nKxWZ8Yh+coAla7vdITeNUUX6MFaxhp5V+Hb+JdSBt8ban2v9nP3IxaBU2iq3lM6cVfHBgcqghIlHwgaxPIUdYH6hmBw8UZIU+GZaixA0aX+J dg9S4AO08K9ASGeR6F0vQPdl4gQuCSEhYSx3fqRXK9UAZ5CjJnrRjw==
X-CM-Analysis: v=2.4 cv=etGNzZpX c=1 sm=1 tr=0 ts=69ed2670 a=ivwHvKELjomHP5eB21RdOw==:117 a=ivwHvKELjomHP5eB21RdOw==:17 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=wxLWbCv9AAAA:8 a=_3edPfKAy5zYfz3TofwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com
X-Rspamd-Queue-Id: AB242467D37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104543-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[smankusors.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,smankusors.com:email,smankusors.com:dkim,smankusors.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

This series adds support for reading channel labels from the device tree
in the Qualcomm PM8xxx XOADC driver, along with the corresponding DT
updates for the PM8921 PMIC. Also removes the redundant error logs when
reading values, as returning -EINVAL and -ETIMEDOUT are sufficient to
report failures.

This series also includes minor refactors such as remove redundant
error logging and constifying pointers where applicable.

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
      ARM: dts: qcom: pm8921: add labels for ADC channels
      iio: adc: qcom-pm8xxx-xoadc: remove redundant error logs when reading values
      iio: adc: qcom-pm8xxx-xoadc: constify pointers in read operations
      iio: adc: qcom-pm8xxx-xoadc: add support for reading channel labels

 arch/arm/boot/dts/qcom/pm8921.dtsi  | 12 ++++++++
 drivers/iio/adc/qcom-pm8xxx-xoadc.c | 56 ++++++++++++++++++++-----------------
 2 files changed, 43 insertions(+), 25 deletions(-)
---
base-commit: 27d128c1cff64c3b8012cc56dd5a1391bb4f1821
change-id: 20260321-pm8xxx-xoadc-label-47afdf7f06a9

Best regards,
--  
Antony Kurniawan Soemardi <linux@smankusors.com>


