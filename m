Return-Path: <linux-arm-msm+bounces-93468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cE7bFRUnmGlQBwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 10:19:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DA516617D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 10:19:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 463DA3015898
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 09:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5872031D366;
	Fri, 20 Feb 2026 09:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="aar4kcbi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6CD31AA95
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 09:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771579154; cv=none; b=t+Jq8zBuGKXFBw3FyHvQM8UWbs322MsNXrEricQ3N+OigZwqw8POX71tTlRfNKDSGPyaQQFWWpLLB9fwL6/t9USH8H5EcgFT5263GNVTXnGLIIu28c0fLetFuF5i8oC8OBFyzpHeI49jRcjh8wgGql5sYukmO2Qk6yaK8y9u2GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771579154; c=relaxed/simple;
	bh=yoEDD4gAmiWFwPEm4AeHmKBZfnULQrqulEoYZuZ0WU8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nYa7N8IllqufSreb/BCWBlxmDAwros7qjOhjBFVT4KrN2YJ0Fj4rKTiZ/TMFmfZWTIsoaUYCRiX66jExSzXN6CZsbuLRruMEK5YS92OeFtCL/Qarrep+L7L0iU0zg7DvWtP/qpDkOJd5DPnEGoufVZicSedj9u35zzY4QDNqM64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=aar4kcbi; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b8fbb24a9a9so407495066b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 01:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1771579151; x=1772183951; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B0XmHxVEq/bC4S3qNZMApkfuiBP/5qHFpqPImKfYHcc=;
        b=aar4kcbiDnJg9DoePDB0W4eZkAlLXj6W3+A1WQrFlW/R0MbpkBQeBm2bog7c8H/VwP
         3H1w1Qi40CIxAoSawfdtOcLD8v6t+5nIstdvb4cPyZaNx9ktpVl5+dCSqIVVriLOMU2+
         JO+SsDXmp8o4OnhAZJNht4Kr41pgfXcC9iggotCF4knAc7lELhxpqJXAzEnVnKyPmQGT
         7S4rz9MJfU6hLyhJwXKnrj9VFzEn8N1rtbgXPpcUy90XVcfiTpKkOMAaWBXgtKZSmUKi
         HkbchKW9kp/jamrqw+8OPrwYpgNqcCyBnE3a3vfZU8BSFA3mCB+1a7em9t52EFbz5ry7
         IjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771579151; x=1772183951;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0XmHxVEq/bC4S3qNZMApkfuiBP/5qHFpqPImKfYHcc=;
        b=ofMA/c3LFw1SObJGdhd96IIrsNmvFjbB6hXKsapuRoQGbrPxTwYufLBX/H3BC9OL2g
         yJ+bdhmL4/tZvNJ9IFvOBwUaDjvIw5anDMnX2aCFJ76Q/ITioKEhqpkl2jzb4JfSLo9E
         3qjr6CnpQvJfYWmTMBQkK/L9STItv4HQJ5chfQnqjTL10C6yN+kPwRlopcIy+fQmOU2S
         Mu+OPCKjGujrGMc8UZFHWTQeYbvsiDPES6zzUPBQANnTdvew05dJxkbKcqv8vijSamZg
         NG6S5BUOylOR/l0YxEFEGyWzqRgxT9psH4gCtP9x1aOMw6KinmBUHBSaTMn5U6MVnseL
         LXIw==
X-Forwarded-Encrypted: i=1; AJvYcCWcUr3RpqnWapjk2VcNTNstYhht2XQkTqveNHcp7HJvvTSixZVMsLyAMOvS4Ti+XQdYJBAxUumnlF6TcPm1@vger.kernel.org
X-Gm-Message-State: AOJu0YwGmj6QO6MzTmXFaJKU5s50lTVifP9Mw5DWBF2DHWeJ0p+6kZzX
	raVo55I1FbnGtRp87/oiwK0cEXXrVqMT2nYqG1ujxUlrHrvBqr1i5ZEOwA77FxeBdyA=
X-Gm-Gg: AZuq6aLLx/Erhy1XkAkfoyhbwMAAnlsPuwvFiQG59N5qKwEwSVN22WjzrAZbTr+tlBM
	61LCcuRjvlQgqOM6lggH+6uOlh7QNzIaN6CMJ9H/s1YaNnf6Kr7mQlEfige7LQr5/LVapf9oU/N
	lCnVApYTZ3VSQNI3h3mlK+6TgzrCxNwYfVNSXazYuDvC5rMrFBBcDRZQSork2gv29pzSUfe22K3
	i7lI+HYLu8PBeW3w7wS6UldtE0l2UYwAqR6GN6eXp/gk6yHYgSHiMXkd83Y9ame1db9G8wvb+Rt
	8k9ADqq0fKz3VSyDa8fLos8lfVTZ3r+Y9DnqmlMKonLogHmgexQFr3Do1js0iGtKUkHT/tJKm4i
	GIkv0d2I3mGKJoZZ28kFwGrxXFMc8JdDsOlij9FBcx0/hIF1325N0X2LgYaeUNcVsi9gc4NS+a8
	xGBU60/ThxksT6f9QekxE3y7hFLAIGik+CvSsG3nEOQTtAT7dDtR/g63I3ENgLmWO/G+s4YNpf8
	74/mQ==
X-Received: by 2002:a17:907:3e84:b0:b88:23f5:3cfa with SMTP id a640c23a62f3a-b905444e673mr286684066b.31.1771579150928;
        Fri, 20 Feb 2026 01:19:10 -0800 (PST)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc769111fsm667098666b.57.2026.02.20.01.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 01:19:10 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/5] Battery temperature ADC plumbing on Qualcomm
 platforms
Date: Fri, 20 Feb 2026 10:19:04 +0100
Message-Id: <20260220-bat-temp-adc-v2-0-fe34ed4ea851@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OzQ6CMBAGX4Xs2TVtTQlw8j0Mh/4s0gMttpVgC
 O9uhavH2WTm2w0SRUcJumqDSItLLvgC4lKBGZV/EjpbGAQTkjPOUKuMmaYZlTXYyFurB6YbqQ0
 UZY40uPXIPfqTI73epZrPI2iVCE2YJpe7ytOasZRrJngLP2F0KYf4Od5Z+GH8X144MrSSk2laa
 ZWp74NycR6Dp2vJQ7/v+xczmJfD3QAAAA==
X-Change-ID: 20251010-bat-temp-adc-8539bf0b85bc
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Jens Reidel <adrian@mainlining.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771579150; l=2272;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=yoEDD4gAmiWFwPEm4AeHmKBZfnULQrqulEoYZuZ0WU8=;
 b=jsDYWvi96TwbF7f2f6x6W5eoPqMCy5LlHsEXA5S763cxOoXOBgPsLvRpMbqrin2aAqG1CXKmd
 ioG/5VIg8u5CZZskC+yThS7iAbk9ZQjJ9oVEkzysJZOenCMGD+Hko2F
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93468-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:mid,fairphone.com:dkim,fairphone.com:email]
X-Rspamd-Queue-Id: A6DA516617D
X-Rspamd-Action: no action

This implements a solution to get battery temperature readings working
on (for example) smartphones with Qualcomm SoCs.

The solution chosen in downstream Qualcomm kernels is exposing
ADC_BAT_THERM_PU* in the ADC driver as temperature channels with the
lookup table ("struct vadc_map_pt") for the specific NTC found in a
device's battery patched to adjust the lookup table. Patching a kernel
per-device is obviously nothing we can put upstream.

The high level solution proposed here:
* ADC driver provides temperature channel in (milli)volt as IIO channel
* generic-adc-thermal driver converts voltage to temperature based on
  provided lookup table from DT (driver has one IIO channel input, one
  IIO channel output)
* The fuel gauge driver can use that temperature IIO channel to expose
  battery temperature via the power supply device

See RFC for other variants or alternatives considered.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Rebase on linux-next (a different patch to add IIO to
  generic-adc-thermal has already landed upstream)
- Un-mark as RFC
- Link to v1: https://lore.kernel.org/r/20251010-bat-temp-adc-v1-0-d51ec895dac6@fairphone.com

---
Luca Weiss (5):
      iio: adc: qcom-spmi-adc5: Add battery thermal channels
      dt-bindings: thermal: generic-adc: Document #io-channel-cells
      thermal/drivers/generic-adc: Allow probe without TZ registration
      arm64: dts: qcom: pm7250b: Define battery temperature ADC channels
      arm64: dts: qcom: sm7225-fairphone-fp4: Add battery temperature node

 .../bindings/thermal/generic-adc-thermal.yaml      |  4 ++
 arch/arm64/boot/dts/qcom/pm7250b.dtsi              | 24 +++++++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  | 83 ++++++++++++++++++++++
 drivers/iio/adc/qcom-spmi-adc5.c                   |  6 ++
 drivers/iio/adc/qcom-vadc-common.c                 | 16 +++++
 drivers/thermal/thermal-generic-adc.c              | 20 +++---
 include/linux/iio/adc/qcom-vadc-common.h           |  3 +
 7 files changed, 147 insertions(+), 9 deletions(-)
---
base-commit: 8dd3bcb7855ad929d732f48e8a2307fdab6a5667
change-id: 20251010-bat-temp-adc-8539bf0b85bc

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


