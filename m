Return-Path: <linux-arm-msm+bounces-112422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cGMIONFNKWrjUQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:43:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5338B668E51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:43:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Xzg1Ii7O;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112422-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112422-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A88BE3019CA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA80B3DD84A;
	Wed, 10 Jun 2026 11:39:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D6F3DD50D
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:39:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091564; cv=none; b=jo/fPiRYLAgQRE9MdZkUk/HDgYFYQ2ntfQ6pp2e9r6tJaQYfCCAka4Lq7gIs6dbKyO2bBbpu4qQK50nB6Z0PkYlzq73kkkLkrg8ZSa4Ad4D8GCJciHZe6aZIOtz59B3at0wxKkHSicXoIqeWuTbbQy74VECb+zCsyQUXu8UJYxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091564; c=relaxed/simple;
	bh=kJlyu0Ku8D5i/hWc61LWnoUqEP/8/5haNfDxLdtNTf4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fg/Pso8GTxJm6I4J6G6952Eq+M67pV+CPSvJQ01M8w6ygcWiC0vDw3lIX/W9DlEmbyEdkqTGxy+Vu85Nt7XihQzIX6UA02kiynU4kzI4WO+Zgjt9lvXZEs/R4/OJZGiqKzGvwtkafbJs7XWpsJPv9RREJx7iCEa1FqDwW8ysl/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xzg1Ii7O; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so39781805e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 04:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781091562; x=1781696362; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dLodmWzrTN66XZxi0VhoRsFvF3s+BeRFANK73fDJpdo=;
        b=Xzg1Ii7OVeJT3vjDySZW+ak5IJ5AtIiF4LsUhdahySxIM/sz2cj3DbGOCmNLvT5pq8
         EeIkesKWnKX+ekoajvT7mh/3L3BuPdAya+lh4NbUnd6yaS4lVg1tDaHfPFUSNYohHjcD
         NlQZkTBtUFVsmXN8LAp4CJTJay4Z0CFhBwlh8gHGCawUFvT8uTKuL6XDzHNFHGq/I0gq
         0bgIo1d8G2kAUSh2FzCpdNc3a0rb5tXl8sYnGLrPL3LIGJl2MBcwgUxLhtMgZTA6aWRO
         HMMcVkTTluqlj1hFzBCrv66bleeucYqGjcGuXdo3axJtTEveaKWQ1pY2ZWXvw2HBiqbb
         hTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781091562; x=1781696362;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLodmWzrTN66XZxi0VhoRsFvF3s+BeRFANK73fDJpdo=;
        b=Mb+1wJTTHLUdjd/zWR+gweos5HTkdUaRXaTYlUttbfi5eGzuDG7TwPpd9ZK78gMqbk
         zR2D+AcNhokSJ6VjZZ2pKMybeX2jk1wKGuZLTNWoveCI7kOUiqxW/hVr4wHzSVtUph+H
         wrF0KiMhCu4P6s+udqr7XGzdtkwg/fY8mI7kLCUq5mr4tE8YnuxJxezRgrS9Q6W094ts
         gdYqefkdgpAGOnDSo5UUYIY36Xuj973L8FR2veJRIDb/PfyLobmyNZ06WVnOmTcEFojK
         HQ0mtNyVcx5LUBUvtrq4g12Mk2E/lRzuGnYoKj+oc6LY1RMDnvy+oSAhtHnv3xh1N1wz
         P+5A==
X-Gm-Message-State: AOJu0Yw4FpKMtU63OAhwOxhXwXHOubxeloE25nXUBtvSUtkUklAOVQ42
	hi9RTp++NkwQDhe+Vjh/xJkiL7aUSdMmcgN5CYvgRxRRx/qEVc/Ir87K
X-Gm-Gg: Acq92OH709tHXq/tnBQ+mnC9a0z5K5MFLMpHR8AkUGZrWin3eJgLIKiYPagJMgQyAoM
	LA77f9fQc03gXlaQ+VnoevymaMYVAlkq7BUO7w/5xyfEBka5G5MUL5F/W5GHPDfeRz57Hj95oMW
	yIiyNVDW4ySoVkEEUZG9ag5re+TjH6RPp5vw3GudKX1st0VctvAvJ8zyRRUfwq6Tj5If1RH6FJ5
	WjqqrUoXRDJjQm5l4AOTck9lHVgWUdQ7z3I+bWqlyHuGk+Vi9dZ7WkDZeAFLoDCQyT8CIAwNDsO
	wWap/m+LXmrOQ/rPjq7qoCN3WuEewk3owghdJr2vHrJedk2eRHRFC/IC58O6SJG1aSDXHNtLV7D
	sfoN5yzfWCpcJ1WK8PqL3ATpSEtD3xsCEPtW7sbEWAtHI7k9Jn6fnkaEhc4Uv2qxorfdBTPnVWn
	SviWJQSeMuaHrtjfNao7JV8X1AGrP6+9SdMNzsptU=
X-Received: by 2002:a05:600c:3107:b0:490:9588:bdb6 with SMTP id 5b1f17b1804b1-490c264cc2emr408619475e9.33.1781091561822;
        Wed, 10 Jun 2026 04:39:21 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:7c0c:c5aa:32d2:49d:5951])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm68042009f8f.19.2026.06.10.04.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:39:21 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH v4 0/2] ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle:
 add initial device tree
Date: Wed, 10 Jun 2026 14:38:56 +0300
Message-Id: <20260610-yukon-eagle-v4-0-763d5698bd2c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13NTQ6CMBCG4auQrq3pP8WV9zAuCkyhKmAoEAnh7
 lKMEVx+yTzvTMhD68CjUzShFgbnXVMvQxwilJWmLgC7fNmIEaaIZAqP/b2pMZjiAVhJbZnV1FC
 Ro0U8W7DutdYu18/2fXqDrAuJcFE63zXtuL4baLj7luNdeaCY4ERTmuRKmJim56Iy7nHMmgqF8
 sB+VhG+t2yxVqtUCCI1t/Lf8q0Ve8vDX+CpjHNOlNFbO8/zG9fqjxIwAQAA
X-Change-ID: 20260526-yukon-eagle-658f2f81a14d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112422-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:xerikasxx@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5338B668E51

Sony Xperia M2 is a smartphone released in 2014 based on the Qualcomm
Snapdragon 400 (MSM8926) platform.

Add initial device tree for Sony Xperia M2 with support for:
- Framebuffer
- GPIO buttons (Volume Down and Camera)
- Regulators
- Internal storage
- SD card
- Accelerometer
- Ambient Light/Proximity sensor
- NFC
- pm8226_resin (Volume Up)
- Vibrator
- USB/Charger

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Changes in v4:
- Defined pinctrl for GPIO buttons.
- Aligned quotation marks in mount-matrix for the accelerator.
- Dropped magnetometer from the patch. It probes, but fails to read its
  revision if reset GPIO is not defined, and this model does not have a
  reset GPIO. Nevertheless, even if one is defined, the probe fails with
  a timeout. Needs further investigation.
- Link to v3: https://patch.msgid.link/20260604-yukon-eagle-v3-0-9e3b57d306a8@gmail.com

Changes in v3:
- Changed incorrect "chassis" to "chassis-type" in the device tree.
- Mentioned added vibrator in the commit message.
- Link to v2: https://patch.msgid.link/20260603-yukon-eagle-v2-0-f86b440583f5@gmail.com

Changes in v2:
- Dropped `regulator-always-on` for l3, l6 and l8.
- Mentioned added GPIO buttons and reset input in the commit message.
- Link to v1: https://patch.msgid.link/20260527-yukon-eagle-v1-0-98119d64a71b@gmail.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Erikas Bitovtas (2):
      dt-bindings: arm: qcom: Add Sony Xperia M2
      ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle: add initial device tree

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 .../dts/qcom/msm8926-sony-xperia-yukon-eagle.dts   | 407 +++++++++++++++++++++
 3 files changed, 409 insertions(+)
---
base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
change-id: 20260526-yukon-eagle-658f2f81a14d

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>


