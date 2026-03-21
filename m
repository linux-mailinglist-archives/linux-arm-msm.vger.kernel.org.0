Return-Path: <linux-arm-msm+bounces-99016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJvEL+e3vmkkYgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 16:23:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2DC2E607E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 16:23:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39A89300D451
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 15:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0EA839280E;
	Sat, 21 Mar 2026 15:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j/QpiaDt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FAF318BA8;
	Sat, 21 Mar 2026 15:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774106591; cv=none; b=sca8opn7U73SHxf4Rax/P5W7zTOfu+hhqlbf9fz7CuzFeHhhgk/zwbFf4xOmP1+4hEF7+30x5HVQdxzFGh8hoGL1NxazevpPKADU8jD85PLSYwd9RC+IKFnLIrYuzllJ6dNd/0rB8Vicgjrp6F2ttsuSEIFwZxzFKMk8J5FPzvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774106591; c=relaxed/simple;
	bh=81We+ZTdhjczoWNJRNXTTTn2mWFEUmdrREF45LZk9uU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b5uBP0M3yMMApWwdnE+f6fVjOORJ0D0VpfaV4C2oSyM/vJT6DcRhb2+YMU3yEVSSH1hVP6rVIR+7BgXIiVl+CPMgoJHnTFn/t2T4Tzh7q0VbO9DmnxvRIpULsEKNeD8w9H9/z6bd+fgERNGZyGQbGYFn/+4ZN9vqHRXzIGfe6JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j/QpiaDt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1BFE0C19421;
	Sat, 21 Mar 2026 15:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774106591;
	bh=81We+ZTdhjczoWNJRNXTTTn2mWFEUmdrREF45LZk9uU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=j/QpiaDtZoP2s1SNCBAR6cY9OnZ7aYSLWaSWo9I8P6wtWJU8mOuKMnLLZXZX23AqF
	 12mmP8qobAy+5zQ4X9pgvGWdWMnMxVfreOMTyGEjBgdGYDzx5KkD5UntM8oy1ZKBKM
	 9ew1a6r3TEmtfqJsUQyUhKAmgMCLVE/9Uq3uXwJDOdLxh/Xak/jvklAfj0l4KsgPiI
	 AEdVF0QT3UQ9zOCFy4jetVDwGols7LKo8VGzbA+Dr8gsOCnwv1slXSd/yIPAg59mok
	 LUpQjk3Cvr4OS794BGvlkI7+haMHdcFCcEhWaXMvi+5dC0v4fQZH/8sI1FpSpRkSIL
	 g7VP/ZfA0qNdQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C0271094484;
	Sat, 21 Mar 2026 15:23:11 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Subject: [PATCH v3 0/6] Enable new features for flipkart-rimob
Date: Sat, 21 Mar 2026 17:23:19 +0100
Message-Id: <20260321-rimob-new-features-v3-0-d4b8ee867de7@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NywrCMBCF4VcpWRuZXOzFle8hLtI4tQO2KUmNS
 um7mxYEwS7/A/PNxAJ6wsCO2cQ8Rgrk+hRqlzHbmv6GnK6pmQSZgwLFPXWu5j0+eYNmfHgMHFR
 RaV0rk0tg6XDw2NBrRc+X1C2F0fn3+iOKZf1y5RYXBQdujLRKwaGQFk6Dd6PrO0P3vXUdW8wof
 xyx7cjkWFE3ZSUKrSv8c+Z5/gD1TsPDAQEAAA==
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774110230; l=3654;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=81We+ZTdhjczoWNJRNXTTTn2mWFEUmdrREF45LZk9uU=;
 b=41y3BurYAQZELv0HUn9KUIUZyM+lmVMS+bdUxwz+7YtdH8iDxxurK1uUTg8mlbil8wv4OrzrW
 9J/VThIG09NChf4xF6kMOUrkOemvDDNEW9INOjVnDUYoiSVwh0y7X8G
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99016-lists,linux-arm-msm=lfdr.de,cristian_ci.protonmail.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[protonmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.sr.ht,protonmail.com,oss.qualcomm.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[cristian_ci@protonmail.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5C2DC2E607E
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
Changes in v3:
- (patch 1/6): removed avdd, avee and vci supplies from 'required' properties;
- (patch 2/6):
  - removed "select VIDEOMODE_HELPERS" from nt35532 Kconfig entry, since 
    its functions are not used (but this option is enabled and its code 
    compiled anyway) by nt35532 panel driver;
  - pick up tags (Dmitry).
- (patch 3/6): replaced a506_zap.mdt with a506_zap.mbn firmware name
  in gpu_zap_shader (Dmitry); 
- (patch 5/6): pick up tags (Konrad);
- (patch 6/6): pick up tags (Konrad);
- Link to v2: https://lore.kernel.org/r/20260318-rimob-new-features-v2-0-c1bf8917449e@protonmail.com

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

 .../bindings/display/panel/novatek,nt35532.yaml    |  77 ++
 MAINTAINERS                                        |   6 +
 .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 139 +++-
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt35532.c      | 779 +++++++++++++++++++++
 6 files changed, 1011 insertions(+), 1 deletion(-)
---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260303-rimob-new-features-037944b3a620

Best regards,
-- 
Cristian Cozzolino <cristian_ci@protonmail.com>



