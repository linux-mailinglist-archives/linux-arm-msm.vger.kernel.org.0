Return-Path: <linux-arm-msm+bounces-93697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKIXHKhjnGkoFgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:26:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DC4177FAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0883305E9A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F7828727D;
	Mon, 23 Feb 2026 14:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QaYz5/JN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E304C285C8E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771856653; cv=none; b=NIbNTfeGdMoJhdwMsBYCQ5G+1yLREwNmMqf0jBq+2qgbt1psJaMUvdUzZVX2I/Ma9CqG6LgW9tOXTpnXJGINLcqP3LKKf5aNqE94xvKTVYR3T8oEooB0T/nbaWlD9Ro6R8QH5Z1BecwveFjvvT7fB3ajX9jTreDHVCi61j5Oxnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771856653; c=relaxed/simple;
	bh=9y6D6xz5iEV1RlXfd71tFKG5C2AsAHLINlsH8NwvLQ0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aqQiyQLbdCkIOtQhCWMg38cGgyAo8tiEiNXynOZwhCMDhWYVdf62SCD0U0rxe2Gvkq3hD8h4j4a4Pnj2bNBR3P1I9rrJ3c1Mqk45Y5qfiqOcHyXJscLChXwHCgukEJqAbU0TG2K5qsJ7T36JL2nDpr9RWUgk/MWb51xTPwiauSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QaYz5/JN; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4327790c4e9so3314396f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771856650; x=1772461450; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I+2zu6waZ9ZINHmOeqTNg+8QIhX87rWd1dofyBo/XGE=;
        b=QaYz5/JN5TIK9QNx94b1ATm0imrQhQ/D3Y1qXMaqSSOY9rLLDiHrWLwAARRhWP65Wd
         n1EPbM2GAttDYW3jCT8oqQx//edKUqhtIik3WtEToWQLyHaM9Zus+vTqMlAjz4YtxjyU
         v5BY8V85/kLyB014VyZqnLFN5c1/iljaYZnCFYRPknqCDZF7hAeyRT0kqRxxOm2pfTGQ
         3PslWgCMF7nvjq0dCPduknf8NgFXIxIR+R8t25WDonAHZs15JIk7TBhZB7auL1Dag/Fe
         eEDCVP3KPKGZFWLBq43Fzhg5+mNmmUheDwJRqdkaa6Ob/Sej2530zxWbPB8aycWxt57P
         Ja7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771856650; x=1772461450;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+2zu6waZ9ZINHmOeqTNg+8QIhX87rWd1dofyBo/XGE=;
        b=ILg68tgUh7m0VcQm+D6ZJpyPxNe2Gi5I6rNAXSnZeF5nKbiIqKHaJvPnYEWyTUR+Hn
         aErnbZVc0SL8fZXIZ0KKP/bNgFobLTVVczBDhxGM8XnOfILxLCA6RiiOPkh4nlvEinMc
         tR9iOjvNQlOZJhy3mKHH7I/kRWaPqHmEpuIWT9L6PSHFJLI5GAlDl1MeMiHHFtGvTHa7
         68moOMEajiA9ulTT7miVo0eKE7z0jTgnQwkwvnX3Jdb41QmayrAOuMda/oJjtK8JtvSl
         1JLKRSz1PQJi6JI6QypknqIX4q+zdajB3/7hfXbPVNzhAgm1X63gpdWzNuUuAW/hkMkM
         2I7w==
X-Forwarded-Encrypted: i=1; AJvYcCWDoWC8Rw1Gl5dnilHwgEV11wJ3ojhed2Kdzf6AGbCWpRfx+W1Z+5+mc3303vmstm95h+8gr+/1WalXPCm7@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa480nVVnmSTE/XaM3xajqnUxbojH9uhP3TRSxeZ/kNQjZX4GJ
	0h9YM2B7/fyXYqBvLhaeC83I/FXZRteLbNSSkJ886mUmvmmGX03C9plp
X-Gm-Gg: ATEYQzzUDeC46jP0w19zV4bdFiVcLiqKju/cRgTVrhXigYfkvVhc5XE8hwxXnSfYca/
	iG9q7GT2M9yhp9FoMUek/wR2XN1sDcw2y3i7+YsyUvcw9vEWwcktHv6SVUNbvJ7yksxmqpNY+wp
	M/5xu6srCflij1ZFh6ClX6lkdPtVCF5N9MnIiJm1m+DIGSqy12Z4KZEjtUqJGwdSBd9yOZYK5ur
	HJ7UyBYT2WSgucFE21GSH8CyIUjgccUpUelvhoNLRbbGqh/k7VvVe+2KaD1fz8gNREd6ae3uPkv
	Hpbuvfj+hFyMrBRVl8SzV6kkYzrlehcQtERDDhII90Oe0qHeTNJeQekyvrLbLdXGAqL6SkqQZTK
	fdnmVh7NbfrJDM8S9vNg8uO80VJ9stZIHSd2FRmUfmZhujpOWaX4+fr7wz2tFjqr043YabbcLGU
	P9cs8M7wauXGDxpxCjqyCwdDiAxQojhzdNse1ysRCRQ0AmCNaRZhxOqx/VDJzai8o=
X-Received: by 2002:a05:6000:4021:b0:436:30b0:75a0 with SMTP id ffacd0b85a97d-4396f194254mr14347361f8f.37.1771856650195;
        Mon, 23 Feb 2026 06:24:10 -0800 (PST)
Received: from [10.100.102.82] (46-116-183-56.bb.netvision.net.il. [46.116.183.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bfa1bdsm18713233f8f.3.2026.02.23.06.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 06:24:09 -0800 (PST)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Subject: [PATCH 0/3] Add support for the Samsung S6E8FCO display panel
Date: Mon, 23 Feb 2026 16:24:01 +0200
Message-Id: <20260223-panel-patches-v1-0-7756209477f9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y3MywrCMBCF4VcpWRuZpO3YFhHfQ1xMkqkGe7OJR
 ZC+u/GyGfgPzPcSgWfPQTTZS8y8+ODHIYXaZMJeabiw9C610KARtKrkRAN36UZ75SCxRtfuGFy
 lQKSfaebWP7/e6fzrme+PxMbfKHoOgb5sk+3/Kuo8R4CtyqGupJYLdceJ7I1j3Npx7A4f2lBga
 ce+97HJXFEDEquCylblaNngThmjCsvOpKWlEsERivO6vgHnV3Bu5AAAAA==
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
 linux-arm-msm@vger.kernel.org, Yedaya Katsman <yedaya.ka@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771856648; l=1749;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=9y6D6xz5iEV1RlXfd71tFKG5C2AsAHLINlsH8NwvLQ0=;
 b=bRK40Pbiz6nb8aMZHw2Gw0SSib4spnpKUOIEypjCEEzz9zafYDQ4AM/cItCrg+kY/HpmLeuXD
 JlbZADyy9m0Bb32QxKGHHw0udZ0m9oXx9n7c/BeGyZy1aXE8cyptzNK
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
	TAGGED_FROM(0.00)[bounces-93697-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.sr.ht,lists.freedesktop.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,packett.cool:email]
X-Rspamd-Queue-Id: C7DC4177FAC
X-Rspamd-Action: no action

This adds a driver to support the Samsung S6E8FCO display panel found in Xiaomi
Mi A3 (xiaomi-laurel). The driver is generated using
linux-mdss-dsi-panel-driver-generator[0].

The mdss reset dependency makes the screen work more reliably.

[0]: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
Original tree with patches: https://gitlab.postmarketos.org/SzczurekYT/linux/-/tree/laurel

Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
Yedaya Katsman (3):
      dt-bindings: display: panel: Add Samsung S6E8FCO
      drivers: gpu: drm: panel: Add Samsung S6E8FCO
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


