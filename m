Return-Path: <linux-arm-msm+bounces-98562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AL87HhoZu2k+fAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 22:28:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1802C2FA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 22:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 43D05301DB83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 21:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A4137DE9D;
	Wed, 18 Mar 2026 21:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UJEVYQLv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0377337B035;
	Wed, 18 Mar 2026 21:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773869335; cv=none; b=F26XaKHFJ2G1IMW95D4UrqYXlP8rWC7reBTyXuzVb2Fkjt5TbbCiaaaSEb2LctUYTfJ74VnVddESz7ZgloAn64iukNff5EWxR3rRX8kzWxTDZO2RKp75E+xdCWZ99bU5KV7/l+YaQXDvvAtpV8Q2xMc22iZVEkwSWpjM8c7zIBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773869335; c=relaxed/simple;
	bh=2xLuSv2TiyFBIIeQDHg/5ze8Cep6E7OZsCQj+tAfpBs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FT4pJXVpg3tr7qJf8z3QQqKuh9gcXPQ9HeI4MuCly0GD5fzYVHEwqy2i8h0apKDLS5wYiIr2XCSFGO/uIacPppUcuz8Vc+lS6cS6a31DO9PgGfIrUeK8+6Q4+haEWSjy2xgRqePR2smVj+Vk2NBCBcFIqh56Us23stVfL6oIO2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UJEVYQLv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86DC7C19421;
	Wed, 18 Mar 2026 21:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773869334;
	bh=2xLuSv2TiyFBIIeQDHg/5ze8Cep6E7OZsCQj+tAfpBs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=UJEVYQLv+9VpuCSnQwH9azbSso+frALiu+j1ZrfQ7SGCC5Q29yEjysjsdzj2K9i/S
	 WZcrX05Ky4Q/oN5u7D0uMzO5gQ4Db8ncAZnaR/+l9vPbRM+o8UHuJZYDyrfLicpISX
	 xWi+sY+zlNH0iWg35rBmfXh7RFL1KmyuVdx1g51B6JSjQJnLpwR/pQXPYFxlS/Dz4r
	 Vt0/dymOX0aWWAuFjdSA6jZMyxgE4rXWM6Ih/Ctd2jeUYiY2EyInQH1morHPUzk0G6
	 LVLVRsI05AijPv4iBQMhtJCienQsqd/rzOBMaxLHvRGlpVP+fBhQSz1SKottEFtDJn
	 fX9G8LzRXHvZg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 732C71077607;
	Wed, 18 Mar 2026 21:28:54 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Subject: [PATCH v2 0/6] Enable new features for flipkart-rimob
Date: Wed, 18 Mar 2026 23:28:08 +0100
Message-Id: <20260318-rimob-new-features-v2-0-c1bf8917449e@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0Jm7ZihRVBW3sOwKHWQSaQlLaKGc
 HcriTuX7yX//QUiB+EIdbZA4FmieJdA7TKwvXE3RrkmBkWqJE0agwy+RcdP7NhMj8ARSVenomi
 1KRVBGo6BO3lt0UuTuJc4+fDePub8a3+547/cnCOhMcpqTYdKWTqPwU/eDUbue+sHaNZ1/QBlW
 AaquQAAAA==
X-Change-ID: 20260303-rimob-new-features-037944b3a620
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773872973; l=3035;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=2xLuSv2TiyFBIIeQDHg/5ze8Cep6E7OZsCQj+tAfpBs=;
 b=Sp6Ahl3vlrPi9YE8nTq0WsnIe5bYmDBTpnLvFvHfmih19ZlRdTAXgqzdfRmyTxfu+MIDjIFsq
 6tjReHIZmvVCX5I4s5eupocnG5D2IwgX5oanCwJElfnDBpR3CtoOHLY
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
Reply-To: cristian_ci@protonmail.com
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98562-lists,linux-arm-msm=lfdr.de,cristian_ci.protonmail.com];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[protonmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[cristian_ci@protonmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.967];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.sr.ht,protonmail.com,oss.qualcomm.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1C1802C2FA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series enables a set of miscellaneous features for Billion Capture+ 
(a handset using the MSM8953 SoC released in 2017):
- Panel and GPU
- Touchscreen
- WiFi + Bluetooth
- Hall sensor 

Patches 1 and 2 provide a driver for Novatek NT35532 and its corresponding
devicetree bindings, required for enabling panel in DTS. The remaining 
patches are all DTS changes, aimed to enable the features listed above.

To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht
Cc: phone-devel@vger.kernel.org 

Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
Changes in v2:
- (patch 1/6): define power supplies in the bindings as per datasheet  
  and update example;
- (patch 2/6): add blank lines where required between mipi dsi write
  sequences in nt35532_on() function and make use of names for mipi dcs
  commands, instead of hex numbers, to improve readibility (Dmitry); 
- (patch 3/6): move pinctrl lines ibto panel node and get rid of
  sleep/reset state, since panel just uses one pinctrl state for
  default/sleep (Dmitry). Also, update power supplies according to
  bindings; 
- (patch 4/6): pick up tags (Konrad,Dmitry);
- (patch 6/6): squash hall sensor node into gpio-keys (Dmitry);
- Link to v1: https://lore.kernel.org/r/20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com

---
Cristian Cozzolino (6):
      dt-bindings: display: panel: Add Novatek NT35532 LCD DSI
      drm/panel: Add driver for Novatek NT35532
      arm64: dts: qcom: msm8953-flipkart-rimob: Enable display and GPU
      arm64: dts: qcom: msm8953-flipkart-rimob: Enable WiFi/Bluetooth
      arm64: dts: qcom: msm8953-flipkart-rimob: Enable touchscreen
      arm64: dts: qcom: msm8953-flipkart-rimob: Enable Hall sensor

 .../bindings/display/panel/novatek,nt35532.yaml    |  80 +++
 MAINTAINERS                                        |   6 +
 .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 139 +++-
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt35532.c      | 779 +++++++++++++++++++++
 6 files changed, 1015 insertions(+), 1 deletion(-)
---
base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
change-id: 20260303-rimob-new-features-037944b3a620

Best regards,
-- 
Cristian Cozzolino <cristian_ci@protonmail.com>



