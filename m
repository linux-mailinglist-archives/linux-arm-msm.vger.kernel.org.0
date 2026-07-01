Return-Path: <linux-arm-msm+bounces-115796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nKSdMCx+RWptBAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 22:53:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 653636F1A19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 22:53:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=tdqDcBvw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115796-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115796-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D3B27303190F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 20:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ADF83A4F5F;
	Wed,  1 Jul 2026 20:52:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E323815E8;
	Wed,  1 Jul 2026 20:52:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782939176; cv=none; b=JdJcQ0oBj2mxRcRBNBm3hB21NGWIXfhV8uw4a/VVMFKqAx7MEHV1vXb81y4FDoHQEzn8UqlG/iYYwjdfGmqWuL1AGe1JvN5NOWzuSTT90lahmVpCI/RbZ6dy+XvHIj7+TUaacZuTvW2SZ9SsfTWWe+Rx/dP12Gs6LAeQ6+qtQSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782939176; c=relaxed/simple;
	bh=zoGOulQF1M2h8Q01GsubA1RgVWr6kNLn78527WuVvX4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PfkzaKcDXXuJhSzQ1ZxuiavkwXXXbBkjj4oLxFbgRMnFrSxbtuHdeZJqUM2CJBspOx780eMtYfSMhBi17kKZE5GXMT0yuutwDgBJSCiG4bGREvQ5Qp3T1buQArgBn3pQEev+7/NaRgQHTt8IY/WIsAjIuCSomtJUJs+27dYAgY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tdqDcBvw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B0D3C2BCB8;
	Wed,  1 Jul 2026 20:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782939176;
	bh=zoGOulQF1M2h8Q01GsubA1RgVWr6kNLn78527WuVvX4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=tdqDcBvwsG4ho9YcfZLXBYpBfB09VA28Y829Dr14qBjmsHYYDTAEGxURLSbCq5CAf
	 nVn4cyUex0WyNoQ8w8HqfM2mtRvDX1qXebfuPmrxFTo2J1k6HmtHESBYy7DUPVTHMD
	 hKNTM6rWNSDM3G5R8okIiFmKbWTbWcQkUkJmKr1+1pjBoOVIRyS4jCiZvPyaF6aSvt
	 HKOYPOYUBHsaySiKMig4qRhBV0EAMkwihP5DEQjuse+sbLfGvgwtLBppcLJ2RqPPaN
	 pd0sH/dLV0tnGInNcg3txJUN8ByGJeMx7BvCHbMJd7I4aK9kpeQMJydeNk/N+ynq6j
	 UN7A70dWROjnw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E117CC43458;
	Wed,  1 Jul 2026 20:52:55 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Subject: [PATCH v6 0/4] Enable new features for flipkart-rimob
Date: Wed, 01 Jul 2026 23:55:53 +0200
Message-Id: <20260701-rimob-new-features-v6-0-be7d5d1e007f@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23OzWrDMAzA8VcpPs9Dlr/invYeYwfHkVfDEhc7y
 zZK3n1uYRCYj3+BftKNVSqJKjufbqzQlmrKSwvzdGLh4pd34mlqzRDQgATJS5rzyBf64pH8+lm
 ocpDWKTVKbxBYW7wWiun7gb6+tb6kuuby87ixifv0jxt63CY4cO8xSAnaYoCXa8lrXmafPp5Dn
 tnd3PDgiL6DzQlijIMTVilHXUceHBRdRzZnUuNANBg7ke066ujYrqOaA4amGF1QGlzX0QdH9v/
 RzdExRIUeXRD4z9n3/RczdNSv2QEAAA==
X-Change-ID: 20260303-rimob-new-features-037944b3a620
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782942968; l=4333;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=zoGOulQF1M2h8Q01GsubA1RgVWr6kNLn78527WuVvX4=;
 b=U//qRAjidfOu+8iCd75GDvniNljYnibrSMFyl6RvvelelrWzvAq7r9W9O0irwJ3ebV06ez4zS
 4icm3O99nKUAq6Ob9ApVdPOYTvUyjT2xGdMmLPk2hA2GUisl8cfXTwN
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
Reply-To: cristian_ci@protonmail.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:cristian_ci@protonmail.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115796-lists,linux-arm-msm=lfdr.de,cristian_ci.protonmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FREEMAIL_REPLYTO(0.00)[protonmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.sr.ht,protonmail.com,oss.qualcomm.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[cristian_ci@protonmail.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 653636F1A19

This series enables a set of miscellaneous features for Billion Capture+ 
(a handset using the MSM8953 SoC released in 2017):
- Panel and GPU
- Touchscreen
- WiFi + Bluetooth
- Hall sensor 

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
Changes in v6:
- Drop applied patches;
- Pick up tag;
- Link to v5: https://lore.kernel.org/r/20260331-rimob-new-features-v5-0-5fcf42a29c12@protonmail.com

Changes in v5:
- Based on dts-coding-style.html ("Nodes without unit addresses shall be
  ordered alpha-numerically by the node name. For a few node types, they 
  can be ordered by the main property, e.g. pin configuration states
  ordered by value of “pins” property."), sort pinctrl states by GPIO 
  index (Konrad);
- Pick up tags;
- Link to v4: https://lore.kernel.org/r/20260327-rimob-new-features-v4-0-06edff9c4509@protonmail.com

Changes in v4:
- (patch 1/6): added a new compatible (since it's not possible to
  identify panel vendor/id), matching user of this device and leaving
  novatek,nt35532 as fallback (Dmitry);
- (patch 2/6):
  - according to bindings changes, make panel driver handling multiple
    panels paired with NT35532 and use specific compatible/data;
  - due to changes applied to panel code, remove tag received previously
    by Dmitry.
- (patch 3/6): 
  - use a specific panel compatible, according to bindings changes;
  - remove 'output-high' property from panel pinctrl, since panel is not
    reset.
- Link to v3: https://lore.kernel.org/r/20260321-rimob-new-features-v3-0-d4b8ee867de7@protonmail.com

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
Cristian Cozzolino (4):
      arm64: dts: qcom: msm8953-flipkart-rimob: Enable display and GPU
      arm64: dts: qcom: msm8953-flipkart-rimob: Enable WiFi/Bluetooth
      arm64: dts: qcom: msm8953-flipkart-rimob: Enable touchscreen
      arm64: dts: qcom: msm8953-flipkart-rimob: Enable Hall sensor

 .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 138 ++++++++++++++++++++-
 1 file changed, 137 insertions(+), 1 deletion(-)
---
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260303-rimob-new-features-037944b3a620

Best regards,
-- 
Cristian Cozzolino <cristian_ci@protonmail.com>



