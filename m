Return-Path: <linux-arm-msm+bounces-115830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id as6tL2gDRmpsHwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 08:21:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B496F3C19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 08:21:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="CFrYv/wF";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115830-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115830-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F01F3002289
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 06:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C19384CDA;
	Thu,  2 Jul 2026 06:15:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B947382292
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 06:15:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782972957; cv=none; b=ok+6AMf+q2D+SSfyz0hdLPxWwpVQA+8uKNQ+JSlXqwT02y4LuVji/y8JzNfeBv4/4yms8jOMmffR7VN9hEwH29kGWwWs/ZpTjcAZr4HyZMkLviShUtH4fWL9rWOGNFGCg3u+yziT1Io55rhStYSGLLSn6FX7sO105rd+ypoikLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782972957; c=relaxed/simple;
	bh=eUMZ87NV33PuB9LUaUM/naiOBmn+tD9ZFBu2hpBLxYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nF4vHdDrU0FowAhu6ebtEaVhpEXMkeOlCzbAI8PQMyNaegtK7c8rg77EWvZZTubKQgsu9Ik43SrqomPgUXVqhs/dhqRxQCKXLpV2JHSMx17BbtaPJDddTRfm1aNNjslC4TMdcEG3peE0cPKUFSUTEGUwRYwAK+fDzKLO+aZG8m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFrYv/wF; arc=none smtp.client-ip=209.85.214.176
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ca64989e64so12808645ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 23:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782972956; x=1783577756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pqx48+kqpZ0s/hT5sa4Ozdd9lXIMEabBEF53/1LSHnc=;
        b=CFrYv/wFHlthB3DGI5x9q6lN2XR23hDbhj2eDqngbUofdyxuWv8pPi/F/S8tDDbXIa
         tTcefJ/1GF+uJLPAFAiANRC7vy8pYXR77kB0Qb7sH1Wn3S9GedxVokRqrzoK2og3nYs9
         66PfPK4l5vnYM4Q4f1beCwAMkRle09xIm3d+nMzYLX+Sa8cf7v8M18lYAz2u5HeBBBG9
         1iAWAxv+arXkRkhEdDkm2CLhnOScUOwRLE2aIRWcv6dOlRS893NzH/jewXnglBAxnDko
         +c3sk5VjILiARgGVw7Ky5RCA3uzlgRMS2i1tkpGTHwv2XOB9mfzeM1Gttwh8KYMmIwLL
         rS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782972956; x=1783577756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqx48+kqpZ0s/hT5sa4Ozdd9lXIMEabBEF53/1LSHnc=;
        b=Nxs44mMQQi1W/1C1EJEjU+9pkIsnRjEWEHJ/xlGCg4/nfzLOThXO5zU1b3D8DaT+SX
         +gM6dS9W52NZ0r7QhAM2QnftUqmUIa7bVFM244TcrIk7BGoRe3IQFK8so+BSE0lkejma
         YdOH+s11hZ11tl1E0Jvzrr9jTKQZvhx2/+AqM9FMpgaNMUSPStA+lhBaICD7aDTY9CIZ
         HJRXt21oes3yEE6llTPa7FutLS/V0MgjAerwya58sfPnrcp7SNcif3C2rmnzH7gjAhMe
         I2uIrYfKz9IKT/+O/NzCJqMgykeruNgQ+mJR6epBCP40i9kq+flNY/84qYIqZHDpZVt2
         uEWA==
X-Gm-Message-State: AOJu0Yz1JtTW4GkFyO7UgD4mtqX8IFxfghaNqhiCeWHgQJ+xSPyJdfEw
	H1F5nltZWJNPg2lUhylzBHdInDqjyOXjPC+Ni3p7wktVxRPDF/qBH1sEDQaMwgudQ54=
X-Gm-Gg: AfdE7cnOb+CY+/jv81gYlfj7eTDryqga9P3JeDmnLM8hxVsyUNyWSMAqeJfdM+0XkJX
	ktqGQyzfFQ1TJ2dh5i4JcxXFNTu1205yLM9wnVlGVzbBh1rhL+bKCnijd5fqUdNid65Y03NxTXX
	HPSeY5MuZy5Mx0Hdtoz8aNR10aDpOGZc9Lz8ezq579FQzcAgAy+Rk44PRnfh6nYeIz8rTZvwiu3
	ajBNqRbdIRrANWZyj08l1hi/Vni/yofjDOEynZ9/c+k1TO1FVDn7G6YYOlKhIrRDSnoM9BzlGAD
	DKbbeVDgve4qin2dk2ZINQYmazvPR5LN6GibIp2B1lY6E1KFZyb1z7ZGaNb2y1XkRYjg8CRcJF6
	lpD78NlzxS8OC6gIfFU9+NkW70bO7d3m1RETJRw/aseCCjxRgnAv7FkEcExwobKbGMpflEKnYvl
	ZsSg==
X-Received: by 2002:a17:902:d4cd:b0:2c9:bd64:8c81 with SMTP id d9443c01a7336-2ca7e6d9f27mr47085905ad.18.1782972955650;
        Wed, 01 Jul 2026 23:15:55 -0700 (PDT)
Received: from ada ([223.119.20.224])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9aa052d5sm8316025ad.78.2026.07.01.23.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 23:15:55 -0700 (PDT)
From: Kaipeng Zeng <kaipeng94@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	konradybcio@kernel.org,
	andersson@kernel.org,
	Kaipeng Zeng <kaipeng94@gmail.com>
Subject: [PATCH 0/2] Add device tree for Acer Swift Go Pro AI (SFA14-11)
Date: Thu,  2 Jul 2026 14:31:54 +0800
Message-ID: <20260702063156.35169-1-kaipeng94@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115830-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:konradybcio@kernel.org,m:andersson@kernel.org,m:kaipeng94@gmail.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kaipeng94@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kaipeng94@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 15B496F3C19

Introduce device tree for the Acer Swift Go Pro AI (SFA14-11).
It is a laptop based on the Qualcomm Snapdragon X Elite (X1E78100) SoC.

The work started with x1-crd.dtsi as initial template.
HDMI refers to ThinkPad T14s.
Bluetooth refers to x1-crd.dtsi from the ubuntu-concept kernel [1].
PWM brightness control refers to Ratizux's GitHub repository [2].

Tested on linux-next / Ubuntu 26.04 LTS
       
Tested and working devices:

 - NVMe
 - Keyboard & Touchpad
 - USB Type-A, Type-C
 - Battery & charging status
 - Internal display & Backlight brightness control
 - HDMI & Type-C display
 - Bluetooth & Wi-Fi
 - Webcam (usb_2)
 - GPU

The following are some known issues:

Battery:
Battery status works only when the following kernel configs are enabled:
CONFIG_BATTERY_QCOM_BATTMGR=y
CONFIG_QCOM_CPUCP_MBOX=y
Or the battery percentage and charging status disappear randomly.

Audio:
Neither the internal speakers nor headphone jack are detected by GNOME,
and both fail to output sound.
The sound card seems functional since audio playback via Bluetooth works
correctly.
Also, when manually enabling speakers via alsamixer and then running
speaker-test, speakers can only emit some electrical noise.

Fingerprint:
The fingerprint reader can be probed. Running lsusb shows:
Bus 002 Device 003: ID 3274:9003 Generic Realtek USB2.0 Finger Print Bridge.
However, currently, the libfprint in Ubuntu 26.04 desktop does not support
this device, so I cannot verify if the device actually works.

Corrupted Display after suspend:
Internal monitor, Type-C and HDMI displays would break when the laptop
resumes from suspend or after logging out, displaying corrupted graphics.

The following are some reference details:

Bluetooth (uart14):
I referred to x1-crd.dtsi from the ubuntu-concept kernel [1].

HDMI (hdmi-bridge, hdmi-connector):
I referred to x1e78100-lenovo-thinkpad-t14s.dtsi.

Backlight brightness control (pm8550_pwm, pm8550_gpios):
The configuration of pm8550_gpios refers to Ratizux's GitHub repository [2].
Although I could not find any hardware information to confirm this, the
backlight brightness control works, but it is inverted.
Since the pm8550_pwm does not support "PWM_POLARITY_INVERTED", I used a
descending order array for the brightness-level.
With this workaround, the backlight brightness control works as expected.

This is my first time trying to upstream something,
not sure if I am doing everything correctly.
Any reviews, comments or suggestions would be greatly appreciated!
Thanks a lot!

[1] https://git.launchpad.net/~ubuntu-concept/ubuntu/+source/linux/+git/resolute/log/?h=qcom-x1e-7.0
[2] https://github.com/Ratizux/linux-device-acer-sfa14-11.git

Kaipeng Zeng (2):
  dt-bindings: arm: qcom: Add Acer Swift Go Pro AI (SFA14-11)
  arm64: dts: qcom: Add support for Acer Swift Go Pro AI (SFA14-11)

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../boot/dts/qcom/x1e78100-acer-sfa14-11.dts  | 1711 +++++++++++++++++
 3 files changed, 1713 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts


base-commit: 3ce97bd3c4f18608335e709c24d6a40e7036cab8
-- 
2.53.0


