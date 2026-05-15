Return-Path: <linux-arm-msm+bounces-107710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CESjAUmyBmqKnAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 07:42:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDC5549A36
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 07:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 13C493030D2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 05:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF76C364948;
	Fri, 15 May 2026 05:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/uTGYHL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649BA363C51
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 05:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778823743; cv=none; b=EeElyJL13WQObZIshdZpA2ABbN2kJL6Z/09FVXpTnQcgxVpsNvMr8bTlluhmy92mdmf1KS31qm1o36AV6Et2Fs+XV/yhO0s2aTDLGSTcVHYlDcdtXGQ9FF51Js8OJXJ/t4HoO9GZX8SAwnYPwfjWMXOSvzIlZ9zmLTaujMvZYN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778823743; c=relaxed/simple;
	bh=4ujO8YPn+C6kly/QIxgqk2+iFaoJUzR0JdPeVgifXGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nvqinM4H8mizcQ8KgnQHPZx2Bf3SyYzQgcZ/ykhUUS4OViL2BUIikPxsusSCryH9/W7FLTHxXrZaIq9xuWBn1AGN9dPNbBG22zc86iUg6ldSzOUSZnvjRK0RN29QR1HYnM9wd1Iwm7FBbBBEiryp71vrrG1rLLg4IB4nSwCPoPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/uTGYHL; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-824c9da9928so4357360b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 22:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778823742; x=1779428542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BD6jb0vjKtzgJh8F8xKpey20kEfF+Odim4ezk9P1XI=;
        b=F/uTGYHLT8VYmGW7uUL+D8T/AA74P6prWB53VB35e1Kcxs9A1li02lUUJfl59m2XPG
         UY9OLwSN6S+/GyHL7u9w6UurHJG2uXT6EofbCa31igySqpYGx2ecTIpBe5XaqdKQrW0c
         zMB0Q5Vt/vCsG/kUXnNwsxqCm2edDNVb6h7iwTs6LrrYPs0mGDZOywnYqXOq//V1Xq8N
         Z3CgISE7MVDvS/pAtRj4lRWSEYv5Mbaxe+nEhv/DucluH8eIFkne84tkuLaoGmLlu12m
         Y6Wr6qgXaZu8EKxu1EzW/9XGVTu+kYxXKeeW/icfozYKB0+QwoxhDMuq+FGy/7nj9Oxd
         8Z4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778823742; x=1779428542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5BD6jb0vjKtzgJh8F8xKpey20kEfF+Odim4ezk9P1XI=;
        b=kQxIhu7TLd4mp9nNIort/jbNY/nxZIFD6nFFXnaiK2FszdmQbjSg4v7MTu+ABUwL/f
         lstoEw+5sJAvVAtON8CyiVjDZZVoUNBsJJsTDfNx41cxANA8/rkgll0do/AE7Z39iJcG
         UHoZlyqNFiwWSJxk90U4EaCLYHZUeNQHKA7Xc8dMlBSXNdbS5hV2n2L7OMkkAOhvoXTJ
         l8zhrvVLZiIaYVKALzfDLpOJraOHA3DjN6I6lOXLlPmV947DfvQE+gCc17mVmK3pmJ3n
         s7C3k/40DBqty8wU+Cbf3dfl8TPYGAUcfHVhNcN06nQuNSnmEs95f4I+pt7oOt0IG28w
         EvvA==
X-Forwarded-Encrypted: i=1; AFNElJ8Mf540DvUGi/MV7Z8q7DA8+Dh9EsWb/BhJSx3x/+OOANHRQxrT/K/y/o3Bf0JMvkE62TrPfbxRfRTPGY06@vger.kernel.org
X-Gm-Message-State: AOJu0YyO3xIkxgMoC8w09NU+jvEMWpzhq4gEz9kh1cf64wULcvlQVtib
	oJWJKyECwBc/h5YUoEGSQNPagfZbqcABbrOp7CCqie7+iSDSAudJO5z/
X-Gm-Gg: Acq92OFM3sWdbIUDKJMzzcsQnoxQQ4EzgdNwwYzMEeyRIroYrFDNqOgJ8o5l0Qd843X
	giXWoNWre6sTb+3jPkpMDSju9qC7JUwPY8Kx4E6S1jxoT0wKkQarTl1kNPnMU2hXyj6g9eT9PSK
	Fso0Ipb8X+IjXYjA55P9CF1zPD25LEbR1WVRpELzQlnEKIqOJ+OqUZTT9js96xn1mT1PhyCx93A
	XE2xGnSGgme7D79M0R6flBp+W05aJA3FgR/d4GmqG9Atq/ATjVTFd+PQvZ+5/TBaKOR1ljXJ+2Q
	YTKaWfh8eRCDE/yk/vGq+TH4JKJS3kYy+0hkI3R4y+ttw7gLZK6ixpJT9um7Hyjwj7FobVcFfDM
	SW4fnih0pcpAqqrmgSdPvk62mL/5Ld4rPwdEF7pYneH57x4/V+CUdszXT8v7e2iffCLgJl5RXAU
	zuzzUUuLE5W+BYAJL2METhHa6flcSWaW2yhikqoavwENDjzSJIOlGK3SoBwOilJTzIYeCT/GCRZ
	ctcZrdQL33WHW3Vm7q8jgzaNVE=
X-Received: by 2002:a05:6a00:1954:b0:835:366f:5da2 with SMTP id d2e1a72fcca58-83f33d80937mr2828691b3a.37.1778823741521;
        Thu, 14 May 2026 22:42:21 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.wework.com ([203.117.161.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f2b9bec8fsm3106116b3a.33.2026.05.14.22.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 22:42:20 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	davem@davemloft.net,
	neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jikos@kernel.org,
	bentiss@kernel.org,
	luzmaximilian@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 0/7] Add support for the Microsoft Surface Pro 12in 1st Edition (Snapdragon),
Date: Fri, 15 May 2026 15:41:45 +1000
Message-ID: <cover.1778822464.git.harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <177869930359.1496076.12020223802779537187.b4-ty@kernel.org>
References: <177869930359.1496076.12020223802779537187.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9EDC5549A36
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-107710-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[chromium.org,gmail.com,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gondor.apana.org.au,davemloft.net,linaro.org,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[harrisonvanderbyl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Changes in v2:
Ice device tree: 
 - Updated to use 0x0 formatting

Panel: 
 - Add edid to commit message

Device tree:
 - Fixed formatting and ordering nits
 - Removed extra dmic audio declarations
 - Added suspected devices on i2c busses
 - Fixed incorrect usb regulator
 - Describe panel pin regulator
 - Added defaults for volume button GPIOs

QSEECOM patch (4/8 in v1):
  - Applied by Bjorn Andersson
  
Hid patch (5/8 in v1):
  - Acked by Jiri Kosina, but not applied yet.

Link to v1:
https://lore.kernel.org/all/cover.1778498477.git.harrison.vanderbyl@gmail.com/


Currently supported:
  - UFS (with inline crypto)
  - Touchscreen, pen, cover keyboard and touchpad (via SAM)
  - USB 3.2 x2 with DP Alt Mode
  - Audio, WiFi, Bluetooth
  - CDSP, ADSP, GPU
  - Display (BOE NE120DRM-N28 panel)

Not yet supported:
  - Accelerometer
  - Front, back, and IR cameras
  - IRIS video decoder

Note on the compatible string: unlike other Microsoft Surface devices
upstream (denali, arcata, romulus13, blackrock), this device does not
appear to carry an internal codename in firmware. The DSDT, SMBIOS, and
EFI variables only refer to it as "Surface Pro 12in 1st Ed with
Snapdragon" (SKU 2110). I have used `microsoft,surface-pro-12in` as the
compatible. Suggestions welcome.

Although the device is marketed as just a smaller version of the denali,
it has enough differences that it warranted a different compatible and
device tree.

Tested on Surface Pro 12in 1st Ed with Snapdragon (SKU 2110).

Harrison Vanderbyl (7):
  dt-bindings: arm: qcom: Add Microsoft Surface Pro 12in
  dt-bindings: crypto: Add x1e80100 inline crypto
  platform/surface: SAM: Add support for Surface Pro 12in
  hid: Pen battery quirk for Surface Pro 12in
  drm/panel-edp: Add panel for Surface Pro 12in
  arm64: dts: qcom: hamoa: Add inline crypto for UFS
  arm64: dts: qcom: Add Microsoft Surface Pro 12in

 .../devicetree/bindings/arm/qcom.yaml         |    4 +
 .../crypto/qcom,inline-crypto-engine.yaml     |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi           |   10 +
 .../dts/qcom/x1p42100-microsoft-sp12in.dts    | 1201 +++++++++++++++++
 drivers/gpu/drm/panel/panel-edp.c             |    1 +
 drivers/hid/hid-ids.h                         |    1 +
 drivers/hid/hid-input.c                       |    2 +
 .../surface/surface_aggregator_registry.c     |   15 +
 9 files changed, 1237 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts


base-commit: 5d6919055dec134de3c40167a490f33c74c12581
prerequisite-patch-id: a34133ba03bd1d31c0ed08612c31131b62015654
-- 
2.53.0


