Return-Path: <linux-arm-msm+bounces-104564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPM3ASR47mkGuQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 22:40:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9410446B163
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 22:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A774F3002339
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 20:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F07E38F65C;
	Sun, 26 Apr 2026 20:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="XefZJ1RC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from toucan.tulip.relay.mailchannels.net (toucan.tulip.relay.mailchannels.net [23.83.218.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BA32E0B71;
	Sun, 26 Apr 2026 20:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.254
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777236001; cv=pass; b=EJrdfrbMyKeBIFolejxqx8nuTLEREml72AfKGf1KoJHe9PtXVZ0cqDjFFXud9RmIpRvyAbHSdfdD5kohPe036QLA5h7g8+9vJZi3CVNVJ4JOURs/4jaOJrP10JuXtCJUGR3ys6ffrxQMUuJXZ32jCDvSy63sREvjQ+o0Kh9BnLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777236001; c=relaxed/simple;
	bh=Hq8FIKk8Rm7Lg1ZvOZujgul00s6dM0vkFCfly6eEdlE=;
	h=From:Subject:Message-Id:MIME-Version:Content-Type:To:Cc:Date; b=Qy9qy7sogbl+aIucEI84XOkhUQsD7+28grVH8Cs1WRrKSrbMTeyVBpzFUiYyKPvXAwJEIkmKsxv7xcYUA3Bjl4Ad2aFIaLQoiIo+FMIqFBXAgLD52FVHwuEQMqzR2uYCKQ1cWB5dgN0qAs4u5i6EE4ZwIsSvk5J1SVHSuiNPPxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=XefZJ1RC; arc=pass smtp.client-ip=23.83.218.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id A85478C0EF0;
	Sun, 26 Apr 2026 20:14:49 +0000 (UTC)
Received: from fr-int-smtpout13.hostinger.io (trex-green-2.trex.outbound.svc.cluster.local [100.96.37.78])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 561698C2253;
	Sun, 26 Apr 2026 20:14:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1777234487;
	b=m2UXgFVmU35PDrciO3cCLKsE1vpEg62nAIvoDcNYz1Sz4Aj1mhtb3vRd5wzXOs95CCp09y
	MhmiOcEOLeEkWlODi0/VRRKHSvtN7q4lN3VHOoj7QEOoblRsnNIO3n47Mv8FeijR2CYwS2
	iY/LfRwDxug9WfGhBsbt/JUdV22XR2UDLfr7vQZwkAcuVnRuDLmkWJDtpY5qfRSqnn1PDh
	F2mMOruV2Hvqt5u7B+WJ2JFqZ3/izmR1RGTPwo/3uyMBwko4MIMwHzFzfFksYfoAqHxXkx
	JK36tUzoT4p5Ln40lnENUP9T5ch8dwN7ia0Z/KQzpT5T5JuEVvXB/XUW//aJzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1777234487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=7ADeRlYWcAZmK97t+pZG4PvIU+GQcu6iUyBTeK+U7GU=;
	b=CRPshCvwobxAm3OjyZtXLjrcW9JSOX+lZqdSgjYzDNJBqlU9ukRfxmN5IPsHSCrEYrwS6M
	W3s/RHgzXgF7tzdTxoyzH+nkcOUkZRshxx3Og7TdI4o1/ofDmBQZRWphVhscpmrnxhgUhD
	jhFx5ObYJp2fUZUDaFByGnj02ou126aiT7cdipuNAcjCuzEcx6XzQ0QelZKhaTQ3RtiMGI
	lCdKWTwGebIziQBh9KYYXRlK3dSiSGjeEEDDqiT0c8DRM14hqVZ1luITjUlx4NFfrq2GlP
	DM62Nvn7/tlc2WYdhoyRjfexAdvM/DzBnNWgeIXwyahyOXS8oznPR1pDa6t3RQ==
ARC-Authentication-Results: i=1;
	rspamd-b9d4fc544-v429f;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Reaction-Vacuous: 053035dd1745bd2a_1777234489347_3851730683
X-MC-Loop-Signature: 1777234489347:2188194299
X-MC-Ingress-Time: 1777234489346
Received: from fr-int-smtpout13.hostinger.io (fr-int-smtpout13.hostinger.io
 [148.222.54.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.37.78 (trex/7.1.5);
	Sun, 26 Apr 2026 20:14:49 +0000
Received: from [172.17.0.2] (unknown [125.163.204.171])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4g3dG64vyrzyTh;
	Sun, 26 Apr 2026 20:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1777234482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7ADeRlYWcAZmK97t+pZG4PvIU+GQcu6iUyBTeK+U7GU=;
	b=XefZJ1RC7YKx9HEGd9+GShNHCHGhGStXCP2OoPucu604Z5R9aJBWW1ZV34hhBSum53zaJQ
	yqrA2cvQXgMpJlVUccu275BtHSQo8KKCBWNx05T0KAF7j/J0jyK9qXIN7Kuzt1qmiZOnKS
	91MeTkLXUQKBDuHnmeAt2PR7IZjid7sFWBl5Hin2OPeyuT+xnDLYsd3YGa7X/qr3clfqLJ
	5crlqRcEiQkSFpYbfPOkHljxuTUAOSMWIa4kZ1V7hNQaHFaI2hwJGz1AO5ef++kVaPb3D3
	PJg2AvdPgttf+t2tSkMY7QEKx3hxxFZXma1fbTjqKXNUbEfInlAvlfuDhbo1yA==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v5 0/3] iio: adc: qcom-pm8xxx-xoadc: add support for
 reading channel labels from DT
Message-Id: <20260427-pm8xxx-xoadc-label-v5-0-9e7b5a53ef99@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABly7mkC/3XP3WoDIRAF4FcJXtei499ur/oeJReujo00uwZtF
 kvYd68bKA3UXp6B+Q7nRgrmiIW8HG4k4xpLTEsL6ulA3Mku70ijb5kAA80EcHqZh1orrcl6R89
 2wjOVxgYfTGDajqQ9XjKGWO/o27HlUyyfKX/dO1a+X3843eNWThllYAamvPXST69ltsvHtaRcn
 l2ayW6u8OtIJroONAfGSbEpDMBRdx3x6KiuI5ozBuRmdDAIdF1HPjj/7JL7LnRmAKFBc/XH2bb
 tG2dSKwGRAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777234478; l=2908;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=Hq8FIKk8Rm7Lg1ZvOZujgul00s6dM0vkFCfly6eEdlE=;
 b=ncA8HYsgKe+QlI8LBtPcyOAu+KAwdXbaYRRhWeAM3H9wJYPaXK81CbuFvFFrcvFiqinCp8zPV
 Ho+xVbeNwnqDkUGISCfQqmA53SyqaVed1rHBRfbtd4Srx6vMnSJvk2D
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun, 26 Apr 2026 20:14:38 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=ZbRPNdVA c=1 sm=1 tr=0 ts=69ee7232 a=x8mjGQfUP7wLEdXozly9Ug==:117 a=x8mjGQfUP7wLEdXozly9Ug==:17 a=IkcTkHD0fZMA:10 a=bC-a23v3AAAA:8 a=wxLWbCv9AAAA:8 a=VwQbUJbxAAAA:8 a=_3edPfKAy5zYfz3TofwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=-FEs8UIgK8oA:10 a=FO4_E8m0qiDe52t0p3_H:22 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfIVPbyPi8qQFw9/wucAt8KbXRkIFLSLRj7Pp3zdWq19DgnyYoJgPzHzeNnn67xOApg0KMAND7hNb3gqpbLg397UyBmvy4BfHGu20mZyRCJjifQonxMwP 9hi4MzCUWA+bB95/Hf/Dsmd8WGiVwCDDmn8f7scapfc4iC4x64nu8iXM924RyYqOeKCxntiOHfBlJqp7AYQXXRSOYkfOpe6pH6dWOulsm3D9tisllE5IPpuC DRoyH6bZK9rZ4IbyklAmTEbo73T/y1sOPdaDW33RTkPiqdxgGPefTBvVXIHKtjIb2y9K3Unzv4xq7ToaSJkb/YOrovfEaWegJeStmGo4r8epSBdEGga8PgFR sXMnqAKkhloDWPQxCBkD9MZfF/1+jZ+fmg0uRbOJNsYRndcOONdZjFAHv0ptQDJn/fPBlEaxIAP8lu7nsfyKjFj3rPHVbBGAykLsV709BjbFa3vH59nKkFnr FPr+DJuqDGbvRYrdjoULlghTCCvVE/s1Ml32JzajL5kthher9z32gY6utG9aDJ6b6uwTeqgLO8j+IVevyvhsJ3sMobw0mvohPzdrS3KlrQ3o2XZuFTt+Wxf5 o24FiMl+0jKSgMFS5xO3LKfWIGfoh3XZ3WAdhOSQgj3Sw1KgVUaxUlySwQJVkMWgsWjWLWpcs7bpNO/ZynFIXVfwS8BZ4Qv3hcD9jAu3lf4KGVLp9tURQs7r e+qk5g5xzhGWGYxWNXfHS6MpLdy+DRU2XJfn9YtgscE5v+AvxUVs7Q==
X-AuthUser: linux@smankusors.com
X-Rspamd-Queue-Id: 9410446B163
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104564-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[smankusors.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smankusors.com:email,smankusors.com:dkim,smankusors.com:mid,msgid.link:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
Antony Kurniawan Soemardi (3):
      ARM: dts: qcom: pm8921: add labels for ADC channels
      iio: adc: qcom-pm8xxx-xoadc: remove redundant error logs when reading values
      iio: adc: qcom-pm8xxx-xoadc: add support for reading channel labels

 arch/arm/boot/dts/qcom/pm8921.dtsi  | 12 +++++++++++
 drivers/iio/adc/qcom-pm8xxx-xoadc.c | 40 +++++++++++++++++++++----------------
 2 files changed, 35 insertions(+), 17 deletions(-)
---
base-commit: 27d128c1cff64c3b8012cc56dd5a1391bb4f1821
change-id: 20260321-pm8xxx-xoadc-label-47afdf7f06a9

Best regards,
--  
Antony Kurniawan Soemardi <linux@smankusors.com>


