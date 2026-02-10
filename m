Return-Path: <linux-arm-msm+bounces-92387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHhyKsGYimkvMQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:32:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 518F81164DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9F614300D0C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 02:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3372A26CE17;
	Tue, 10 Feb 2026 02:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgjEW4Gj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE68B1F09AD
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 02:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770690750; cv=none; b=QXdnpGJ4DP47cMsb+D3wtaAh46uhdOkarykGDF/SDfthozh8CnghBcuzUf4bAAgpkOhbtVwMSiSdOFVCjIaLMBjjH1Vc34LyBZN8vEvv/U8/MBVxKiMebiltbJ/YpGPLI9I+BOhuM88jMg3GdAnYV/c6RBbkvvhC++NZ3ejbB64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770690750; c=relaxed/simple;
	bh=KosbEyV+Wrr2gfcx8A6LfkCsOENIpJorLlTBgvta8Ig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tetKlnHiY/b6SCsLSxnFrU4mZPSA1UYLvR0VPr8xUt1KgHgkbx5xCBnKuw1oEPK1hyw8LS7I5gtO+Wini/zQrcKEFoBC0M6q0f+ggeNPbqwrUftJDcK4XWpoPgu5uEZ9k2WYYvvivAYTM9r+U/ikdhk/HszMZ7conoZnNrbWLFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MgjEW4Gj; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8c713a6a6f8so595844185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 18:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770690747; x=1771295547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K6e25tnjW36XL3uDImZMRFVix39SxJYTW+Nd+409rRA=;
        b=MgjEW4GjYWfk4jp4bd5Kg3/LijF6B+ub8305di5o4uoSU/GdDgxm9xBfdg74fXlNn7
         5aCBvINoT7SP+RkjQ0SttwmaKcTzOaFOk2753qDx9SEhyMwc67JG+TEtXX0t1HfEsJh+
         cLGI7hNK/Kk6M1zxQwPyDsnEhuYruPMxBmyn3VXP6Rzv2LQqrxSU6+8Le4Mb/5287/kn
         11xltoHWIxTvEej72fPaYzcqY7yl6/k2erit6Zni3WVqt29mD83lcCiTurpf494R1bZA
         9jRjVNnlFylnubZXsdFAsEK0saGlc01SUH3e2PubbGTKEgt2WVgRhfePRliaXReuptE5
         dJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770690747; x=1771295547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6e25tnjW36XL3uDImZMRFVix39SxJYTW+Nd+409rRA=;
        b=cyNJ3SaH6BiJrWq3fKM6j7m0BoZMj3at194XEhQsF75tfDA0PsNDGXhl/RlD7H6iCk
         Kem1bpHrkqgUuVY/vIMoQGHvLGbCeouyEeghVdqw8lvy+Jfp5rC6erQGR+uzkIImzzdj
         rW0kO1fX2P6C9uBjqIDLH+nnsjvD3nP+VvF0G9TnetipgOWsdHv1ppWYQLialA8XOJc2
         n6Jag7Gi+ZV3QHOWWKYOqEOaaqCjSXzdjiIqQB8ynZHguhL39riJfrEvaDg3PUb7YVJ+
         VIYcn0+FA9WSjVBPVs6YHT7yu4yD2s864LPNq/I3CT/ydps9IMAXkYRqOXlAAEQIgd1p
         u6ew==
X-Forwarded-Encrypted: i=1; AJvYcCXFleulacEq0qO5Q3dnKuCupWWZ7hPNcTLQ3xJtwt6u6M5HZj7nrlKpq2Lk/uvrmfJJFcINn2KiQCDbTWq/@vger.kernel.org
X-Gm-Message-State: AOJu0YyG3/mqxLoIWOjRzk6RPa49tsiCvMuk3J4u5rVi/c2FHVVbf5Uo
	X+GGCjyWmqw8r6BF2qpqzSW3CZVP181HbANEpUaboIF5hnObX2TR2z8q
X-Gm-Gg: AZuq6aIg2GpOLM4eRvo3hzeFFWSsoRvHJsw4aEvsYvTuTCfssfF6gx+nkJcEQTJgvgi
	C4rGVw1cselY0vv+C9wzappeGxnc0bezFWjr58rncmweNvonYSHk7iWE3hcIwiYrG9Ljbp5kcxk
	KvWZVJ2bepJystSnZk9x6k7DuznEOXGkOSNJbq6giFzHaxE1BY3OI4afyG6OX6nQht0tXUOBFus
	PJFV46SkJzu4gacaui9eiRckXA4QCJTTsfW8ypsYqUttCs4dxFykfUC+t47I7Tx++5oWGqGXYWh
	3nj9OPWrp3wxDE1xVYPxejysT9+QgW7WrMXi21/l4+hn+t0Lt0rdFgwKB5N7O4rlkl13B5meGeH
	hzE7omql7IlpLbwIHSus2940ZwklkGhU/PuNXWmeT2Y8DXjBTbOvoOr/45bi6ld5ZsbtYsHNMJi
	BfyGPVn2L5IUQm3iHZu7kD7zGeKlM3a+m0n6MJY6BotDCy2EwHsl9+ChX6SOpicn3WezeuW7vtm
	6fWRH5OZ8T1Qbw=
X-Received: by 2002:a05:620a:28cd:b0:8c6:dacf:5dbd with SMTP id af79cd13be357-8cb1ed7e290mr122784185a.18.1770690746818;
        Mon, 09 Feb 2026 18:32:26 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf7aedaf7sm906298085a.15.2026.02.09.18.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:32:25 -0800 (PST)
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
Subject: [PATCH 0/6] Support for the Pixel 3a XL with the Tianma panel
Date: Mon,  9 Feb 2026 21:32:54 -0500
Message-ID: <20260210023300.15785-1-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92387-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 518F81164DF
X-Rspamd-Action: no action

This expands Pixel 3a support to the Pixel 3a XL, starting with one of
the panel variants. The Pixel 3a XL has two variants with panels from
Samsung or from Tianma/Novatek.

This series depends on the IMX355 front camera devicetree patches.

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
 ...le-sargo.dts => sdm670-google-common.dtsi} |  23 +-
 .../boot/dts/qcom/sdm670-google-sargo.dts     | 710 +-----------------
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-novatek-nt37700f.c    | 294 ++++++++
 9 files changed, 374 insertions(+), 710 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts
 copy arch/arm64/boot/dts/qcom/{sdm670-google-sargo.dts => sdm670-google-common.dtsi} (97%)
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt37700f.c

-- 
2.53.0


