Return-Path: <linux-arm-msm+bounces-98261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPvaH0+juWlILgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 19:54:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E14192B13F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 19:54:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D25B6304DF3A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 18:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623043F65FB;
	Tue, 17 Mar 2026 18:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TD3Obkpy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C7B3F7863
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 18:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773773441; cv=none; b=LOPrXZhPLtuo351/Jorgbi72GcDz/5WKHUkKQZ7k6s9oe3vLQRqMS5kwfLK3+u7KeoFoJ7I7VteoaiR5YfDlwrMp/wpqW4UJKsHShEHZew+Xjd54gwSJIOfdDD5MjoNjSxb3PSkENtcjEcOy+0Tyocm02OrgZpo6u4zyTDgHdsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773773441; c=relaxed/simple;
	bh=d+erWziCMFo+IZCTJWIretx4qqOIlSPd/ntbpB1RdVI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Om5+mMot4Qhx28yn32swx/YM85f3E6tOAkdUu7N3VV/EiCKU33yuQtn6BZeT52kcJQCLazK9lrOaeEVclQsl6cujAV48Lo51o6mSyMSUOLtjqbx3fR/9I1K3T+EXC3aIs7ubaJm2RfNZEDpZ72+T6nBF5Ucn7o5olBzhhEJufnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TD3Obkpy; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso54981635e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 11:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773773438; x=1774378238; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uA0qxfka/Y3eM0ZhGmlhGPF6D8joeTIH700meAq2tEw=;
        b=TD3ObkpyNKqPDo7TwIkWM8Shl4aVru3mWs3E24TxtJ4V9bDbIEAMV9OLNhDpkJ40F+
         Ow12z2Izt0XEJeXSgmJPipmdRCduQekxehYGL2s+BYhqojEBCpf3PHOcXWcF07LmY0yU
         SU+yUfMjOLFC1+rPj46ZpwSrWgXIepctMoOlqgyNlAaYTbcx/q9NyWr3zEiaXFPOUC8P
         0ep3VHCO2+dr32uMFba16dY66Ffew64G6rBTUD/fHGe/FSLltAhIjdZRY0PVn2HAlFOk
         upnXrByVD25SmbrE70VbJn8TWcQ1SoCx0mVayYLu6QihKN7P/vx3ivaXks3Byu0fOFnZ
         4ddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773773438; x=1774378238;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uA0qxfka/Y3eM0ZhGmlhGPF6D8joeTIH700meAq2tEw=;
        b=q7XQ00ZEt6sBwpPmTgzGWA7yfGSNnk64Rrg1YoD2jwXSzuBC7FUsTKM5iIYuUxvhMC
         XU5j6zS4xD9zIf73Jz2NIoyAcM4frjRaasD62LW5eOXuwzJ1762LI15VgiFU/ZtIs9Hy
         P0O6EQEffgKFECqAQHzNrFwDlP5er1IkOpHJCqhhPj7KOtxCzrWQEJXImdZzaAXdP7VS
         xwbQLal0vP2So1vT03gFymUuskyK8QAB0UfuEsF/O7ThK90s9rMYoVbGFCSHaXzfyzUS
         D2XyDLTLBbD4q/OnqjBM0O0UqVXlUF09akZNoj8kRhXVLuDvBFwQqyK2ZmykN7XEvlAy
         uDUg==
X-Forwarded-Encrypted: i=1; AJvYcCXV9UHEMhrSZzzVpK5CxChlRuQYNkfmPeyWD39y6yeD9I/CT4ag8ebr9q5qRusfnLln7P06z/uTcbK1dTK0@vger.kernel.org
X-Gm-Message-State: AOJu0YwR7N0aoRhnsjCC8UBFDv7ScuvgWISk/ElvEs0tPxiXNlk/3SQN
	5hxYvquXN2fJTkYbXSK7JQasD5eWnRsO4kT3xg9bz+0jFWboFnfRoxfG
X-Gm-Gg: ATEYQzyObN043J2IWutyV27EJpxol9wMbieZmElt9iRWIy6ygYj7TWl48OFQA9Pvqak
	orZoANFfjP4l1GeYAwCbmLpnf4bBcbsGz+58cT8kh/KRYCh4SMU5H5iJlcYCTHYFYnUyKvbVnPk
	DYGuRE780QeD+VkzDqz1n7TYUWDIxuQml/3HSXScezI02TV1XvM4svUEvdgYAqzhhaiYfTvFtBb
	KxmSLOTsEJ6azaExBtQaBlDi723B3MCMXRTmkMGallzm6cJmgmsF6NX4ke9yjUyVe4KF3wI/p7t
	twKSgK+POXBnVPB/DTR09LqzIXH3K6DenOEwnXj6aOVypgRu57AzytT0AuJ48Xj2R0NByCYUS3O
	JUADQLxIK0gIr6F6eSotKgiTCoEmm4lYnaRAGhdrf2Z8j5YEMQDtHTHFHC+Iy85IRJyLA9KSPgx
	H5Y8y+CsEKUPgt9vqYxzmYeVyGoHa/WfzpvsdBzOIEPKX9g5a7e6qKXmqSRCi9F04mft13O4oIU
	Q==
X-Received: by 2002:a05:600c:4ed1:b0:485:4526:ee05 with SMTP id 5b1f17b1804b1-486f4441081mr10695865e9.19.1773773437854;
        Tue, 17 Mar 2026 11:50:37 -0700 (PDT)
Received: from [10.100.102.17] (89-139-129-65.bb.netvision.net.il. [89.139.129.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea8fb0dsm152863595e9.3.2026.03.17.11.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:50:37 -0700 (PDT)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Subject: [PATCH v5 0/3] Add support for the Samsung S6E8FC0 DSI and M1906F9
 display panel
Date: Tue, 17 Mar 2026 20:50:28 +0200
Message-Id: <20260317-panel-patches-v5-0-ef99f7b280da@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Py2rDMBBFf8VoXYUZSZbsEEr+o3ShxzgWtePUc
 k1LyL9XthcNXhTBwAyco3vvLNEYKbFjcWcjzTHF4ZqX8qVgvrXXC/EY8s4ECA0CK36zV+rynHx
 Lietah8YQhAqBZeY2UhO/V9/b+7aP9PmVtdN2ZD2lZFftsTitVrk8VSlzQFkZ4Mhn251v1n/QN
 B38MHSvi9rZRNwPfR+nYxFUDdoSKls2KLUnpw06h8pTcPnS2FJDsJotIdqYpmH8WTvOuKbY6gi
 5qzMjB25MqQXUypimPl96G7scol9Ns/iXFplGp21QBkOpYE/LP1qi2NMy05pC5QF0AEd7Wj3Ta
 k+r5W/yzgkPXvrqmX48Hr+xJHKY6QEAAA==
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773773435; l=3212;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=d+erWziCMFo+IZCTJWIretx4qqOIlSPd/ntbpB1RdVI=;
 b=9WaL/1QuDAAOGVmJEXVKP0MuOnFe85n4TW5v4tp6IwboMIhZx7BbadBbgqADRzp3D3xtIoRmD
 dE6dp9a+i9yCAMdAD5N/hklvKbSBJI5WXt/oKr50gslxAHG6htMptfY
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
	TAGGED_FROM(0.00)[bounces-98261-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,disroot.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.sr.ht,vger.kernel.org,lists.freedesktop.org,gmail.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:email,sashiko.dev:url,samsung.com:url,postmarketos.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E14192B13F6
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


