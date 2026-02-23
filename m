Return-Path: <linux-arm-msm+bounces-93809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANARKBS4nGkqKAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 21:27:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1555B17CE07
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 21:26:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3153D3072A02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 20:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 764F1377578;
	Mon, 23 Feb 2026 20:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhZ7J4OY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98E937755A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 20:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771878407; cv=none; b=AKf5BQzIelfhL+C541Z6LM3xd4p7nS1SyfLRG5n8DYatAiRUSsXlbIuZyp1xcUTRIrpF4iG1Qvv/FF2HyeACwjgjg922U9AxzEKDiunHjzIfXjrxZJw/r29P/b0hx4LZ2um6FlG66ohmyBnrNEFPQB5bRaW7kU2kPhQt4tNXiws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771878407; c=relaxed/simple;
	bh=8bHk8MdMB1v+e83W/P1wN/oW8o7vVn+ttLbKDWFw8pU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=vDqOURG3V0JdjWQQR/OEVai8eL5+15niYblFZh3IzOZkaS+QZFP3cvszHF8+m5CEKuaynB+nAKPS4bMGCyumDnFDl8mrfGbXnj2uhuU6WCI6idRa+Q9ZVdC68nRP3QY0JMHRxPgKRVeypSy/xADYLFIQmAdzBdRdEuUS9Hw6xf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fhZ7J4OY; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4359108fd24so2951379f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771878403; x=1772483203; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ivLFEX0VjM8aamrUCn9NRe0LlRXjsOp8n2ePF/1BUV0=;
        b=fhZ7J4OY3FKV4R6rCgFDyHZl3bJpfdfY2Zc78ev1RF9Hz1NGq+syjNNGpmWvi/kmMM
         XGKY4RC99Mwce2Me9RDlwb5D+dYvp/kiv0/1km6wa2XplvoNjAPIDfE203ktfOe+fEA2
         8TWp52hJj3Stnb5Jd6QEhP03zAa4sZGM89Ddghu/ECFNcgC4pByqf7qwV7XzioYex4Qq
         76YSHuV/aMmC9xZi9P6nm5g5h3hKRvZtQh9hioLClicqquTA01nQ7T7x3h88a7yJO/wp
         xPH3UyNDvrg5pJb+TNq1cC7+HeUtC9xDIftDocaGuaAtEDxog8tqkqeoq+UKlei3dw2m
         S3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771878403; x=1772483203;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivLFEX0VjM8aamrUCn9NRe0LlRXjsOp8n2ePF/1BUV0=;
        b=GeVdOqaH+fIUjQmH+TTg97vRM0Swbgzxp36LwFOO1JNtWU33x3YFXFim0vreP02uPD
         eSRtnnXC+SlukOdnaxt8wDyIO0CgWfSvMjGz51YUXG5g6cQp0H4oVAvdDh+dzPX9Ed+m
         qkQpeAQYiGv9WIwjo/tqyXfPHAziPj1KAlia8DYQLcigiT/bkk8lavJf5HKPven0X65a
         6pe9FiijaDcuj4GZOQletaC07TUex4kq05oDUjUuZwInOsLFhRRPh3WrsEb+FrYpXNQd
         3JSAYFPH5FExymm97D9Ouu5vIECdbKmmyW9Zy/RYg4GdLZV6yov9cltNnLwzz1tEx+G1
         b7hw==
X-Forwarded-Encrypted: i=1; AJvYcCV3ZTRk+J65L1UTvLE9XU5Qq/iG0KcgFYcw1i2vR+PEYKZ+c1xmio6P747bVnPISbGRuj0K4I2FHv/frftE@vger.kernel.org
X-Gm-Message-State: AOJu0YwluBkGp9Z1T1o77LnSkVzt5e9UgXkG/lgqO/Mj5iIQQR2IDhcI
	NNg3UlTvDxI7FwUtdaT/laXmKux+wXTgVEp+LwvfddX0b6kK1aF7Np6l
X-Gm-Gg: ATEYQzyJ3xuykOYIGsTtuBhAqldvq9sjJcxsl5rVT+AvH6sifhi6N26KCsuz6XP2uEk
	2RtAN7qeVKp6f0gr+t9DfTTKM4Fg6I06FAiLfzHig+VWPWDN56iVHBuLucWPIAU6M99mwrowyps
	SbPCvCGsMK+3yCGU5qptF4tybVisGRGKsWpJX31o4ZhY2ajE7lmZAwQXC7yBvupIV329d9TsTsr
	Vri+u+KK+gQoadhGfzbZLzPc7gMTH6tkRugVnbgqP/tP5aMJHjYyh0YvGs3LIni/ERDCAgytQLH
	a+zbVq4WpaMDdg66ynMx2WorVVCQvwBMdxASoTC1CJ8fw/u+WU69mHk9XWl3+my1Ja/TP0RdfZA
	LApslRR9XKFM8Y/++yXpWICny5wBbzvANTrZpYG8Xv2bkjvRGYKYFuSrPGlKYOw6/1dJwNdcL/s
	QZq2elqNCOcGctW9gk5h+mw9HKEwG3xzIY1iUzw6uw9b/wpiYb/i6AVAWaZ9ebISw=
X-Received: by 2002:a05:6000:2086:b0:437:70d3:44e7 with SMTP id ffacd0b85a97d-4396f182eafmr17920136f8f.30.1771878403065;
        Mon, 23 Feb 2026 12:26:43 -0800 (PST)
Received: from [10.100.102.82] (46-116-183-56.bb.netvision.net.il. [46.116.183.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d54c5csm21369551f8f.38.2026.02.23.12.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 12:26:42 -0800 (PST)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Subject: [PATCH v2 0/3] Add support for the Samsung S6E8FCO display panel
Date: Mon, 23 Feb 2026 22:26:19 +0200
Message-Id: <20260223-panel-patches-v2-0-1b6ad471d540@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12PzW6EMAyEXwXl3KycAA6gqtr3qPZgErNE5a8kR
 a1WvHuz0FMvlmak+TzzEIFXz0E02UOsvPng5ykJ/ZIJ29N0Z+ld0kKDRtCqkgtNPKQbbc9BYo2
 uMwyuUiBSZlm5898H7/126pU/vxI2nqYYOQQ6sE32+kdFnecIcFE51JXUcqPhupD94Bgvdp6Ht
 ye6pcDSzuPoY5O5ogYkVgWVncrRcotGta0qLLs2OR2VCI5QPEv0PsR5/Tk2bupocT7W+b85m5I
 gjSlRQ10Y09XX+0h+SCVGcdv3/RciVKtnLwEAAA==
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
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Yedaya Katsman <yedaya.ka@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771878400; l=1924;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=8bHk8MdMB1v+e83W/P1wN/oW8o7vVn+ttLbKDWFw8pU=;
 b=xu1BE8v9ZdaiTG0UCfPa6sXz623s0YGNGQ34B1No2peoawNJl5w7hg0DspjP4jP+H2PaLAFbu
 sp9Bur8nv/XD7MwEhKZwK1yzHGgIkmAthxzmVAfKxu31ifQO94USORv
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93809-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.sr.ht,lists.freedesktop.org,vger.kernel.org,gmail.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[20];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,postmarketos.org:url,packett.cool:email]
X-Rspamd-Queue-Id: 1555B17CE07
X-Rspamd-Action: no action

This adds a driver to support the Samsung S6E8FCO display panel found in Xiaomi
Mi A3 (xiaomi-laurel). The driver is generated using
linux-mdss-dsi-panel-driver-generator[0].

The mdss reset dependency makes the screen work more reliably.

[0]: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
Original tree with patches: https://gitlab.postmarketos.org/SzczurekYT/linux/-/tree/laurel

Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
Changes in v2:
- Changed commit title like Dmitry asked
- Fixed copyright header years
- Link to v1: https://lore.kernel.org/r/20260223-panel-patches-v1-0-7756209477f9@gmail.com

---
Yedaya Katsman (3):
      dt-bindings: display: panel: Add Samsung S6E8FCO
      drm: panel: Add Samsung S6E8FCO
      arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable MDSS and add panel

 .../bindings/display/panel/samsung,s6e8fco.yaml    |  64 +++++
 MAINTAINERS                                        |   6 +
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  |  94 +++++++
 drivers/gpu/drm/panel/Kconfig                      |  12 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6e8fco.c      | 293 +++++++++++++++++++++
 6 files changed, 470 insertions(+)
---
base-commit: d4906ae14a5f136ceb671bb14cedbf13fa560da6
change-id: 20260218-panel-patches-696df7e0d810
prerequisite-message-id: <20260216233600.13098-2-val@packett.cool>
prerequisite-patch-id: 3fba84f11111406e0d530013fd45ad0eb389786b
prerequisite-patch-id: 81440b7f28f9101d3dc5d4bad6dc86e39b81a026
prerequisite-patch-id: 53469d8c9810169d058f1bfd27ac8399038aae74
prerequisite-patch-id: 80809bee71eb6434f6699d5e5f8c7f9d4bcd1ca7
prerequisite-patch-id: 0269e01c9c54a37bb92983635cd516342189aee5
prerequisite-patch-id: e2bbf7c452d4da6d71b1a5194e0d7ce46584e113

Best regards,
-- 
Yedaya Katsman <yedaya.ka@gmail.com>


