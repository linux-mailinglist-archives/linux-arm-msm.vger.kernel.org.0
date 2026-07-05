Return-Path: <linux-arm-msm+bounces-116540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +CQCKgkzSmpI/QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 12:33:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F049C709C0B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 12:33:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Mggj5VuF;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116540-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116540-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2ED473012D02
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 10:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1A5372680;
	Sun,  5 Jul 2026 10:33:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12157239E60
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 10:33:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783247612; cv=none; b=gDmgQBuHO0rzDlQjCb8hmAI66lwlG35g+I2aG6Sb6Gg+OoswifNSU9PryAm+p3TAvA7dyHd5ppu/cL1VlZUTfdWJD6S16OF6KdFLDHrgBRZfjGKX3e5L0fTg7qGSz9wGiyJMN7TH73VkgFG8CXDKtLZ0mdGHMGit2E+TMuu6oKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783247612; c=relaxed/simple;
	bh=bu1fS0oX7dHNs+wurhgW//kmjpqn8TGeWtYQtwdTXd8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l5mEPeJ6yCm57Pck5v2pF13M71DnILfPwdlprjdzTgsW9OH5UxO2vdKuJHNb0USSRyeKIJsdOyinZy/v1i7LA37+Y9OClDBe5tYsn/D604jrHfCAie5LhQPbVNgdEWo6BqZ2efyN5J5GI+hSFwLVjjfg3t2Zm+vWptdi8hBDir0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mggj5VuF; arc=none smtp.client-ip=209.85.128.170
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-81086f7abaaso23643917b3.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 03:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783247609; x=1783852409; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RFlSarO5yq3CKZw8naaHIK2dGzGG8Hq12CE1DthI3y0=;
        b=Mggj5VuFYhwKGIBDA2o6cIoHVsrHCKu0pTpJWGwrKfYJqazzxiSyOkx1IRduNIsYO2
         Nyu+nNjvU2COfPzYTHW7Epk1eOxO9yEKtYFIIEnAdv3401w47PHTFMaGm0EnL9dK7sFr
         o5PL71DGONA5o85lJkzxFGGnLQeCW/nN2RV9e/4CRoJsc+yBYG6GOx1dn1KXJwpQ4Bn6
         3Hx9XSPIo3D9qGbEJW0ms/zo0pLqYKNU5wo7JxTuGhbJiIW2RDYQIYusdZi7i3Z7+lXy
         Y/AzVgmipxOOG1SRgvCtikXbx3KFgmZSWggHQm6/5eq0eOIfZ0D1WiPqb0ydm+GQURkL
         aW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783247609; x=1783852409;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFlSarO5yq3CKZw8naaHIK2dGzGG8Hq12CE1DthI3y0=;
        b=Y+sOkdTI9fl0W3l8+Nwv1+OA6axHL5+KlZnRgb2QrbTBBmWviyIkM6fWVpcAHKVzLU
         29ys+0VrF2Q9uUDQBszCDjbFjS4+zwJfX6n/4tS/N0y1H7JZrwpclxjgrSImAr/Xrrws
         cPahJ3oaOJTpmq3m+Id4tmZmNtRS2AS/uMHslJYSTZTROVLu5pYSeDTMHpfIExu0DIbw
         WTC9kR8E5GfaOHL3fq/tlp5/tJSEiYhJkZF3n9pEyy9a0Aw8HebSg2D3qjpLXV7Ak7Hv
         SqHhaSS12rVyU8VMy88nh/7Vn7C1+9tStsRZg3/6lxU2DqST1vD16bQl5JknV7ZOtcgI
         AfTw==
X-Gm-Message-State: AOJu0YyF99ROBqrbZQKsMfurgGmjLLLR4vUuYxWQ8iyoJz+Mz+jyaWgZ
	IByzL28EvCqShesKeTI2Kd5WNTy0OGxMRzBwxFrs8PsGAilxKFovEjfy
X-Gm-Gg: AfdE7clV3mvL9sKIm40cU7WBi1d7ThT4ID+rq8cTlYibEe1PnidnsfK0g8mmiza7Evp
	hMNjNbyr0W8JF9c0jJrjIUJVfkgHKIhGNsfBx9D7WeEjTqbpR9A293A59J2YjbJ/Bv69LGIiWzh
	3fHPQ8IpDC3lDdGQE8PM7QiyIQQfCAiEiZo0KGomAoXZdt5wym04ELNAovKH2rO9Whniwd0KseA
	M/QxxdHdRquFMptYZFuvYLPdzEYguH+MZray2zPooHZLphKq7zD54NcbjsI6SmYcvlpacqvf2Dj
	BQi+xnIHai/OvEuSLZ+HtMOF2SVq4ZycYH9j9POvRp8Palo0c+PhdBgFZO3Vn8gpNyzRVfZ0e4o
	lOW72o6wMbJVqed09rUikMJf40El3HwMWYkdpP+HvSIz6UPNIa4Rx6b1X8ohzmjIAjsNHhXOr3R
	v7Tx1holFaWrRVSG5KIA==
X-Received: by 2002:a05:690c:d1c:b0:80c:cad:c4f7 with SMTP id 00721157ae682-81738efff00mr68964467b3.47.1783247609000;
        Sun, 05 Jul 2026 03:33:29 -0700 (PDT)
Received: from crusty-box.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144ba2665dsm44421007b3.41.2026.07.05.03.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 03:33:27 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: sm7125-samsung: add initial
 device tree for SM7125 Samsung platform
Date: Sun, 05 Jul 2026 13:30:26 +0300
Message-Id: <20260705-sm7125-samsung-v2-0-d3b17005ecb3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12Nyw6CMBBFf4XM2pq2UIqs/A/DAsoAYyyYDhAN4
 d/lsXN5knPPXYAxEDLk0QIBZ2Ia+g30JQLXlX2LguqNQUudylRbwd4qbQSXnqe+FVWamTqrbq5
 OJGyjd8CGPkfwUZzMU/VEN+6V3eiIxyF8j8dZ7d4ZtzL+j89KSBGjaazRMsmcure+pNfVDR6Kd
 V1/OkDjiL4AAAA=
X-Change-ID: 20260627-sm7125-samsung-b685d8b9cd40
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Vitalii Skorkin <nikroksm@mail.ru>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116540-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:newbyte@postmarketos.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:david@ixit.cz,m:xerikasxx@gmail.com,m:bartosz.golaszewski@oss.qualcomm.com,m:nikroksm@mail.ru,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,postmarketos.org,lists.sr.ht,ixit.cz,gmail.com,oss.qualcomm.com,mail.ru];
	RCPT_COUNT_TWELVE(0.00)[20];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F049C709C0B

Samsung Galaxy A52/A72 are smartphones released in 2021 on SM7125
(atoll) platform. This patch series introduces support for SM7125
Samsung devices with the following components enabled:
- Framebuffer
- GPIO keys
- Hall sensor
- Vibrator
- Regulators
- Reset input
- Real-time clock
- SD card
- UFS
- USB
Along with that, SM7125 was affected by a hang when launching SHM
bridge. A similar issue was reported on a similar chipset:
https://lore.kernel.org/all/20250721-sc7180-shm-hang-v1-1-99ad9ffeb5b4@trvn.ru/
Add SM7125 to the qcom_tzmem_blacklist to avoid hangs when booting.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Changes in v2:
- Renamed regulator nodes to satisfy dtbs_check.
- Renamed pin configurations for SD card to satisfy dtbs_check.
- Moved rmtfs_mem to the common dtsi, shifted addresses 0x1000 to the
  left and added "qcom,use-guard-pages".
- Converted decimal 0 to hex 0x0 where applicable.
- Pinctrl names are now listed after pinctrl themselves.
- Renamed vol-up to button-vol-up to satisfy dtbs_check.
- Framebuffer uses cont_splash_mem instead of retyping reg.
- Removed pinctrl-names from vibrator.
- Added a blank line at the top to the comment for &pm6150_pon
- Added a comment explaining what the reserved gpio ranges are.
- Added a blank line before "status = "okay"" where applicable.
- Link to v1: https://patch.msgid.link/20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
To: Kees Cook <kees@kernel.org>
To: Tony Luck <tony.luck@intel.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Erikas Bitovtas (2):
      dt-bindings: arm: qcom: Document Samsung Galaxy A52/A72
      arm64: dts: qcom: sm7125-samsung: add initial device tree

Vitalii Skorkin (1):
      firmware: qcom: tzmem: disable SHM bridge for SM7125 platform

 Documentation/devicetree/bindings/arm/qcom.yaml    |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts   |  20 +
 arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts   |  20 +
 .../arm64/boot/dts/qcom/sm7125-samsung-common.dtsi | 536 +++++++++++++++++++++
 drivers/firmware/qcom/qcom_tzmem.c                 |   1 +
 6 files changed, 581 insertions(+)
---
base-commit: 2b763db0c2763d6bf73d7d3e69665222d1f377cf
change-id: 20260627-sm7125-samsung-b685d8b9cd40

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>


