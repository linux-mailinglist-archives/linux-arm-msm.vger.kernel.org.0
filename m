Return-Path: <linux-arm-msm+bounces-93024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBEOF8Sxk2kK7wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 01:09:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B462914839A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 01:09:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C18F730191B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 00:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C81F1A9FAF;
	Tue, 17 Feb 2026 00:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AouJF1+4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FD21A0728
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 00:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771286910; cv=none; b=izDNXBL7OQ5mRp6AGOtDF6gDhSW0BNvJLCA/6vAkYKTiJYUGpLzTESQanU7YCMG939eQd1oLTzIRjpO0EzimCUG5IlbMSTXlHHWajVCbCRmEYrwKxJtlPbBjGwQjB1U0LIN/vDb3kWE+SuxFwrk46gPTHGQ7Stl8vefalKCpgBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771286910; c=relaxed/simple;
	bh=n+GYlr8r4TkHcbrJxBhdzmZLatAY9jYtRU3UxyyG1rk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=teUWeS/JVEKWCm9361AlmqmETIzW7DMPbEAeCCmdomIp3fU3CRbOzv/rZyU8f4S17xKdkNCKCQ6j1n1P3YHLK0BzHy9v7FD1CUH49w8oV7AATQcWCM1z719OTUfLuUXTVaZun1YUX3gCkK8bB+cTZz+u4ihs5sX2Zh/xZYOmtfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AouJF1+4; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8cb420f7500so366771085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 16:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771286908; x=1771891708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uKM9kmgYZTGzjOUr4KBBo2QWlDyw/KtkyC0Xk4eYty4=;
        b=AouJF1+4q8RPYYd/vMQ3HLzjR+eChv9q3M/p5XvBEydlZ0YveWQoYSasvE2AFeVSLm
         eW037ARTzoAVVkcO/Fzikxd0mARpeWMt8x8dFbo/S3z3u/ZrNa7nErp+YL4PBm4hFWcv
         rbzNHUur1GN1fldbyk22wg6S2AwMo+RqaxUECXEgkfQGf+ZEl4meAk8rnorTYNzKC8/3
         LYwAzL4z7jKOe/uf18rvAs1bsAJIDmn82OsbE4hzlTJDyDOtkOMBlNacEoGefvIreIGV
         ZS9amts5Tw8WpIEeT8nLxJ7tks/UKD7zO8T8Tganr+0N4DB/Xe69ZROD6JS95PSNQBGR
         jHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771286908; x=1771891708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKM9kmgYZTGzjOUr4KBBo2QWlDyw/KtkyC0Xk4eYty4=;
        b=nySmwm9X8Y08n471HfR4II1OkW0WI/Q5Y+BZVHY7q6hppP5fyqkGoU8Tcirl9J3HHD
         jhGgkaD7c3p7Zi/BGkEAGyTML744I8WVbDM58r6UgPWGUUKuNbMh3gwam3OXqmcURmnD
         yRmxvktfrZYQWxnDLAbXdrYNbyxk5luJKph7kX6dTwx8+33wnd+1CJvSUesus7CaRf6q
         geXCDKNBdmsKQAhyy+RJac/lU2cRi4Mldozy6meVTkzmbstF/npDxSrlA3qqeuK/Ugnx
         s2M0Sq9zeBhbCI/tZDKrqeXi6l0+Q+o/nSa9eZKyXMjepJIXezsgEcCAKlMv5odzNEA+
         jD1A==
X-Forwarded-Encrypted: i=1; AJvYcCXXdtrxoV1CFeAzfhxwU0c61N/BhAjsgkhzTpq+dBGkLDcM+f789Wvjt03s3aJnw8Hj3n/xzUZ2WU2iG5MM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7tgt7cuuFW5QE3KLsWIdKJxdVmcMp4ty82kBF4hhGRMQQdObU
	rrv4WYWCCe3xW4rrG5OzMxQ5anmNYFjHgTWNdMCIckh1lS5PZ43ACazb
X-Gm-Gg: AZuq6aKVk1sL0UBizEW98WNf6eGe8Ex397zWhbOuslrHS7LEAFPGiqUpqw48yjzDMMT
	mFF1rquE1mNxMFvh86YWnsyqG2ZdMh/09WncRQqtqjL8CKJozrNiO+Y+k2XWEE3XX/Ck+iBxEjq
	ZjjjVZmQt0y/mSgPHS0S6Kzq3chvhShyfY+kxNj0c6yg7cejCvzsVWlPii8iS4TP+GUvoP02EPe
	fY1RLVi4oVra4OKjWmsHfWkffU5ndN3SEUB54BOnV7J6pci9UUGxkwDWGVdGd37M6QBXRoO6eRC
	mhipPdUE/RuTE42tv+UApHSUrtCCuWv9kGWbwEuTrvpURcqTCwmtPuanpdMMCCwMDhHNzUfSU+m
	E//qazUDSETn3CYVZZ+UZekysTWCp7G1A0r5DScF6wj/qO+A9Z10oJ1yCmhzZyhVsmAx1x4BygX
	TaIln+FGQureHilxQy9yEstBm+Ap3DPA==
X-Received: by 2002:a05:620a:31a7:b0:8ca:4014:6151 with SMTP id af79cd13be357-8cb4c00d09fmr1146147285a.54.1771286907713;
        Mon, 16 Feb 2026 16:08:27 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb4b38e4f6sm790782385a.13.2026.02.16.16.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 16:08:27 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: yifei@zhan.science,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 0/6] Support for the Pixel 3a XL with the Tianma panel
Date: Mon, 16 Feb 2026 19:08:48 -0500
Message-ID: <20260217000854.131242-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93024-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[zhan.science,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B462914839A
X-Rspamd-Action: no action

This expands Pixel 3a support to the Pixel 3a XL, starting with one of
the panel variants. The Pixel 3a XL has two variants with panels from
Samsung or from Tianma/Novatek.

This series depends on the IMX355 front camera devicetree patches.

Changes since v1 (https://lore.kernel.org/r/20260210023300.15785-1-mailingradian@gmail.com):
- use multi functions in disable callback (3/6)
- add and reformat comments about XL differences (5/6)
- mention the sdc panel (6/6)
- explain google,bonito compatible (1/6)
- remove TODO item in code (3/6)
- add review and testing tags (2/6, 3/6, 5/6)

Richard Acayan (6):
  dt-bindings: arm: qcom: document google,bonito-tianma board
  dt-bindings: panel-simple-dsi: add nt37700f compatible
  drm/panel: Add Novatek/Tianma NT37700F panel
  arm64: dts: qcom: sdm670-google-sargo: add touchscreen and display
    labels
  arm64: dts: qcom: sdm670-google: add common device tree include
  arm64: dts: qcom: add support for pixel 3a xl with the tianma panel

 .../devicetree/bindings/arm/qcom.yaml         |   6 +
 .../display/panel/panel-simple-dsi.yaml       |   2 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/sdm670-google-bonito-tianma.dts  |  38 +
 ...le-sargo.dts => sdm670-google-common.dtsi} |  24 +-
 .../boot/dts/qcom/sdm670-google-sargo.dts     | 710 +-----------------
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-novatek-nt37700f.c    | 282 +++++++
 9 files changed, 363 insertions(+), 710 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts
 copy arch/arm64/boot/dts/qcom/{sdm670-google-sargo.dts => sdm670-google-common.dtsi} (97%)
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt37700f.c

-- 
2.53.0


