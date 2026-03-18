Return-Path: <linux-arm-msm+bounces-98535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1bVEOmPXumkycgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 17:48:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1D42BF95B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 17:48:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58DCF339580C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 16:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5590F3F8819;
	Wed, 18 Mar 2026 16:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DxmWjC/B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F3C3ED12C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 16:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849923; cv=none; b=gS4HTHTeZpWlcs1wJW1+j6FVIX5/b1nmI0NC5pBrXVhdwAQEcX7efiBr66Jbe4fXxID6kRfbvTNUk9eGJr8tCXAyT4W3pKm3tZPHoqUiPzfGwVyoWAJWMQmOQYxSDvCNKyCuPu0EhdHV1gluK0dqSI144a3Iz0892PoONH9Vg9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849923; c=relaxed/simple;
	bh=jXMA/dCk6GfYrs/V5on0Asyipeqpdixm75EBXPhISag=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lX+5JLH24N6mtfTQ2fwF6twMMXNi0qiYYB92r/JUpREh1x2vXPmBVLIsxfdSztQ0iPOAIuESx1ryQ8K07XdH04LuplTtdY+uvcyG/bOPyhqnuNbrNVTMLWkawDj9iHwbUdmQpZm0q7XfqBT/UWEq+WD59nhlk0ASCYutmpwgrIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DxmWjC/B; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4856cd3f1ffso8605e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773849914; x=1774454714; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=48rofo6CJOo6vDXyvqVZcV6FKGqYI4Brbiz5qO2aiTw=;
        b=DxmWjC/Bzd91/aMGNyGqaZfuHMcOZRqWF0b1GJF/rN+k70JpBEMecwTbdRE+PSIjK9
         k3wBeOxYVn+XrVFOxDRwaM2sq67+gz8a/d/ZydErZX3tU6l8VH1bwLprFmo80XFa0JhF
         pqAMeoxMmx/yGt25vyHWAlQyEboY4R25Z+0WVXtf48XuwspyyrAGuo1WzSafLwXA+EjP
         x9ZonkVxGOSfj72prMnxeHxIvlfv8yx5QGrU4wjnNdNB+/5LcyVDQk+EAU5GBHghOFLw
         m3sjZ9dAV5+8bffqcIe3a8Giw2kclF7s/TpeclinGOn314ZsPAmTvuUKiIwLFv5bfWi8
         T/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773849914; x=1774454714;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48rofo6CJOo6vDXyvqVZcV6FKGqYI4Brbiz5qO2aiTw=;
        b=cBYDyY70S7Ls4e0DTTooHWX/zdI1hS6WoDNzXPZDj20YWHVKMFqOWzN9MEtQJ/nsKO
         ln2THuXrPqZaW6O2TM7nlTw7pCXrLN0arNChsZInAnaUcEHWaYEPvKoiDO6xY8inUqt7
         2r8P2rJFjDKMlcFcZcT/uL7dyx92pf2DzFMu4Z5yRWiMQnXFUQBAKZmpwmSDTJEx8hOf
         IIqqd2/DSx0dvXLJvkIvKLyYmmcj+OJuX62DHbaaVVjtGw1mrTc/bjfSQA/weMTM6cfv
         jzied+TG9fiiO0U+Ji95IAkhfkPjIXg4lC1raQtwFl6BDHoI96CF/WA4P7hLRpBSty4P
         xU2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMZxNq1Gdlx+CuEOI6U3X5dsoqA5QhxSYfZHkffRN9Fhqjo8sjFetAS08V/Xsp5WGUHpu1u9oB+kCujUCB@vger.kernel.org
X-Gm-Message-State: AOJu0YzvtxuilKIbugbdq+KTNSHjTW2RPnhDhyf6GU9I/kIfCk2Rhc09
	0QcXgBQeVtYw1RWkgxOqF0EOT/kCXuWGRu/cwUiDc7HJZ1/PJnFhpD5Q
X-Gm-Gg: ATEYQzxlK9r5ffG4DLM+dBOsoBIjOp/N3fy3zFS/ECKOmV4+IhZQMLwrVy1CddBMh5x
	3HLPdmeFg0GunP732s5fcyGMxSIQ+3qCyhvUuCgvr+0gedRBdifti84wc2f9oPe8Bz74XORrWRV
	tQ0Tu43g5VSpGYgJV5o78vHWiibGad4zUQLmMFx6XLEC802M0sxY3/LiBAO5kQ3SAOJ4K+po/Gi
	7ufZgMXOeWDIxijuoespPyFP8hKIp6ic0nURtaj1UqjWQJwrxId8G0kTs12JKSxWNXJk4+yECcz
	ZyTeORV/EwY6QP/iRm5M5l1KgLYU4NXZ+RR73hwe1kn/LGQZ5VVSax4qsbotzvMvirnhaBtr1/7
	XA2SIDE82cBWehLpdjV9kyq89LFRsX4m81CnpYt8WhDvE1/1DcflwEC3kStFT6MCkCzb4/OJscZ
	nRw/8N6XYFlNev45H5lRhFc8EtTvB5goPn3oEvg+p2LPCBbmNSU4qG2qN1P+5Q4gE=
X-Received: by 2002:a05:600c:3e08:b0:485:5812:bb9e with SMTP id 5b1f17b1804b1-486f42018dcmr69488495e9.0.1773849913198;
        Wed, 18 Mar 2026 09:05:13 -0700 (PDT)
Received: from [10.100.102.17] (89-139-129-65.bb.netvision.net.il. [89.139.129.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8baec5csm2282225e9.15.2026.03.18.09.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 09:05:12 -0700 (PDT)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Subject: [PATCH v6 0/3] Add support for the Samsung S6E8FC0 DSI and M1906F9
 display panel
Date: Wed, 18 Mar 2026 18:04:47 +0200
Message-Id: <20260318-panel-patches-v6-0-7a30c2f85e0b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33QS2rDMBAG4KsYrasweliSQyi5R+lCj1Eiasep5
 ZqWkLtXdhYNWhSBYAa+XzO6kYxTwkz2zY1MuKScxksp1EtD/NleTkhTKDXhwBVwZujVXrAv9+z
 PmKnqVIgaIRgGpJjrhDF9b3lv7496ws+vEjs/mmTAnO0Wu28OW6pYjzRS75gwGiiji+2PV+s/c
 J53fhz71zXa2YzUj8OQ5n0TZAfKIpO2jUwoj05p5hyTHoMrnWhbBcEqsg5xTnkep59tx4VtUzz
 W4aJaZ2EUqNat4tBJrWN3PA029WWIYUta+L+aF82cskFqFloJtRZ/WjBea1G0wmA8gArgsNbyW
 ctay/Vt9M5xD154U+v2Wetat0Vj7LqoHTfl4571/X7/BSAeNrknAgAA
X-Change-ID: 20260218-panel-patches-696df7e0d810
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Yedaya Katsman <yedaya.ka@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 David Heidelberg <david@ixit.cz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773849909; l=3391;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=jXMA/dCk6GfYrs/V5on0Asyipeqpdixm75EBXPhISag=;
 b=TOPaPwp4HkIzKfP0Z/7KdEVCQZt1ENxA6P4rIZ70bOfbJ1izYjskptI21MjXpuNlci9qsaLxn
 S4uXQcjZfbwARVhc7DLz6EYtxZ9hQnorQQFmDiHOutRZ+NJ5k3xDRWt
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98535-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,disroot.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.sr.ht,vger.kernel.org,lists.freedesktop.org,gmail.com,oss.qualcomm.com,ixit.cz];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.969];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,packett.cool:email,sashiko.dev:url]
X-Rspamd-Queue-Id: 7E1D42BF95B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This adds a driver to support the Samsung S6E8FC0 DSI controller with the
M1906F9 display panel found in Xiaomi Mi A3 (xiaomi-laurel). The driver is
generated using linux-mdss-dsi-panel-driver-generator[0].

The mdss reset dependency makes the screen work more reliably.

[0]: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
Original tree with patches: https://gitlab.postmarketos.org/SzczurekYT/linux/-/tree/laurel

Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
Changes in v6:
- Rename some identifiers to be more panel generic like David asked
- Link to v5: https://lore.kernel.org/r/20260317-panel-patches-v5-0-ef99f7b280da@gmail.com

Changes in v5:
- Fix typo in panel name, s6e8fco -> s6e8fc0 (zero -> O). Was like this in
  downstream, but in samsung website it ends with a 0 [1]. Found in [2]
- Link to v4: https://lore.kernel.org/r/20260314-panel-patches-v4-0-1ecbb2c0c3c8@gmail.com

[1] https://semiconductor.samsung.com/display-ic/mobile-ddi/part-number/s6e8fc0/
[2] https://sashiko.dev/#/patchset/20260314-panel-patches-v4-0-1ecbb2c0c3c8%40gmail.com

Changes in v4:
- Use exisiting binding instead of creating a new one
- Mention dsi phy power source in commit message
- Mention only DSI controller, not panel where it makes sense
- Remove VIDEOMODE_HELPERS selection
- Collect trailers
- Link to v3: https://lore.kernel.org/r/20260312-panel-patches-v3-0-6ed8c006d0be@gmail.com

Changes in v3:
- Make driver, bindings, compatible specific to M1906F9 panel
- Adjust brightness scale and default
- de-mystify some dsi writes
- move pinctrl for mdss into panel node
- Rename regulator nodes and names according to schematic
- Treat vreg_l9a as input to vddi regulator
- Add myself to copyright header, remove years
- Link to v2: https://lore.kernel.org/r/20260223-panel-patches-v2-0-1b6ad471d540@gmail.com

Changes in v2:
- Changed commit title like Dmitry asked
- Fixed copyright header years
- Link to v1: https://lore.kernel.org/r/20260223-panel-patches-v1-0-7756209477f9@gmail.com

---
Yedaya Katsman (3):
      dt-bindings: display: panel: Add Samsung S6E8FC0-M1906F9
      drm: panel: Add Samsung S6E8FC0 DSI controller for M1906F9 panel
      arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable MDSS and add panel

 .../panel/samsung,s6e8aa5x01-ams561ra01.yaml       |   5 +-
 MAINTAINERS                                        |   5 +
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  |  94 +++++++
 drivers/gpu/drm/panel/Kconfig                      |  13 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 .../gpu/drm/panel/panel-samsung-s6e8fc0-m1906f9.c  | 301 +++++++++++++++++++++
 6 files changed, 418 insertions(+), 1 deletion(-)
---
base-commit: d4906ae14a5f136ceb671bb14cedbf13fa560da6
change-id: 20260218-panel-patches-696df7e0d810
prerequisite-message-id: <20260303034847.13870-1-val@packett.cool>
prerequisite-patch-id: 3fba84f11111406e0d530013fd45ad0eb389786b
prerequisite-patch-id: 81440b7f28f9101d3dc5d4bad6dc86e39b81a026
prerequisite-patch-id: 53469d8c9810169d058f1bfd27ac8399038aae74
prerequisite-patch-id: 80809bee71eb6434f6699d5e5f8c7f9d4bcd1ca7
prerequisite-patch-id: 0269e01c9c54a37bb92983635cd516342189aee5
prerequisite-patch-id: e2bbf7c452d4da6d71b1a5194e0d7ce46584e113

Best regards,
-- 
Yedaya Katsman <yedaya.ka@gmail.com>


