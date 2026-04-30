Return-Path: <linux-arm-msm+bounces-105290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INlPKrEA82kvwgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 09:11:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD9249E6CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 09:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97086303CD06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 07:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B5E39B979;
	Thu, 30 Apr 2026 07:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="fYFej4iR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4883039A07B
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 07:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533053; cv=none; b=OcpEEy2Evp7NkLwJiU5621I9FutwctT8hpY6kfYD5mjBQ0+f48MBc3PMgRwz6Uho8pvbeK7Li8XHndPBQh8MlfCQydnjlryYWHi6O+STF/cHoC6P6Cqj8fSb0v50lD2N+j4VqxnluLZFhqtazsCGB8uugNFC+kFqeznGrLW3K8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533053; c=relaxed/simple;
	bh=QhQKB2mRUuTtgEbrNzVyQWry9Jhf3YZS5lk/FPu/bGE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JCLrRh5xOYwc3qG1rCLsYUVEViUfxlhv5686W0isaPR9vE4FD77UhU4DjkZSWVkE9H3GWIqCsT+RDw+3atO69EF0csgQSbdNOo1CHotld7LChM+dw1A42pV/WEciSzETq3b7HQ/Uu7fqj7HNGFYPuq84nEIgwek78LBTZLV82Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=fYFej4iR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so4701835e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 00:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777533049; x=1778137849; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aE4vBf5pFQqHJ7JzFp5lwW/U6bPFUoFVmhKlS9U+c7s=;
        b=fYFej4iRwj8Q47Zjp2yyzDeW1yrn9awRIqN4FPApvdIIzvxZsrSPYFNLMkv9plRVHK
         u36fchzOs3ivYM1i3fsk5d/OExiutj08lHhVfLSWA26UOiKGMANjvQEq6mRmCfuH/+PD
         2Zpv8/easd0St9SWAkQ6TcByk2Lx16vtaDAujpjpNcAWUa6wWqGE2xVeq0uOODjX0Oq5
         MDfKP/nwJHCPncaSMzAb1BejIsSa5RRHI9uM19Lt+BiK4eHRlxGNOqrko6emkJxu8lFg
         vDF2ELXSfSbo8IuFqb0I7ueY/327iLsgARwupuFylW/X3M7OREpIGlsPTvrC9YMnCmDt
         QxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777533049; x=1778137849;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aE4vBf5pFQqHJ7JzFp5lwW/U6bPFUoFVmhKlS9U+c7s=;
        b=UX0iI8hp1tceOo9P/biqzIQUj4LVy7hQtqcXfiAQxof35B2qPwYowzZgGU3/FjkwZl
         yETtK8WY9+MDfZozYgJ7rmg8UGxPwLN44rrJnSOlavPPm8bQG1AxPD9A9W95nn9ekUS+
         su9OQPnzx2Ft4JcfiCB4U37Tec1LBuOTdwqSOBz2R6B/nJPFD+9UcA4r0d0kc1J4385L
         nmQwxEXYj2Nb475/TQ5uSD3nk/VQo3+9o8gsQj8dZOt/0gVP4kgWS6F2s8pebJMyvpED
         QeFkBjugpIIzFgSfYFRFTWVKDvhIOBmnvkpIHYVfl6T2csBUXsYR+Nc/jsgOBp0LUoRX
         vQJg==
X-Forwarded-Encrypted: i=1; AFNElJ+7jeydyDEk0pCuT78859mwOtrOSGp7VUfenHooky72J8PjJJq8rnC6SB//qdFfJihxcQrVBzEtOv7T2i+p@vger.kernel.org
X-Gm-Message-State: AOJu0YzXdWIhGci2eBSUbKUigIzSFzbB/YtYU6ymiOevPlsVw72oNAaL
	CxetbakM/M/7GiOby0fr87ulOTZDg3FMo+1MWFEaTFaAbxKtEHNO8oeLMqVn9PYXFSU=
X-Gm-Gg: AeBDiet40em9z7RWjol56kok/iCToDIeiyunIRRJeXNuVOgAF0T4Yt/TPqdHCDhCEkQ
	c4q1eMXQIUUWzy9aY64YZptdwIVW4WX9a8MDIflfyESzvc3SkxwBZIM5wCPoPnEQlz5G7mVhJhV
	D5SbJ/f5zi3yL6hUy+xKDqvuaHBAbmDNnPbLQAyO/oWOKpvSNY/cpZKdCLxUlHDloaEl9aaWpJn
	b8Qb5eCH/8jHkyMR7wbJamBKDZN1VXx/w4YmdKOSwYgxcZIdDhSwpcoeH3Z5Y9nEOcCBvTDKjX2
	bXTYMQ30LgJ4tq2zeJxCZiVhqxeMYlq4w+HOw7OueAotcZ6tPAnYJhgCh3v1wUgWDE8ByF1L7uc
	noM0fiE2NrLeR91ThygcCZnYNcICVlyEmq9x+Ko4GRUx0m/uOW3QLwnoN1IgJCd319XxoaXsvvE
	x4ZxOl7U0GZkhqFjG1E0+iaqyJvHmAUmFNpUsNFf+rpEGKTmzlt6+lwjC2ZFldUNH4olQLWaqYw
	rR91l6n5lBzbheibXE=
X-Received: by 2002:a05:600c:8483:b0:487:2671:fb8f with SMTP id 5b1f17b1804b1-48a83d73324mr27890335e9.8.1777533049245;
        Thu, 30 Apr 2026 00:10:49 -0700 (PDT)
Received: from [192.168.178.36] (046124200255.public.t-mobile.at. [46.124.200.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6b89sm46080825e9.1.2026.04.30.00.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:10:48 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/5] Add LPASS LPI pin controller support for SM6350
Date: Thu, 30 Apr 2026 09:10:40 +0200
Message-Id: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOQQ6DIBBFr2JYdxpAJbar3qNxgTrWSQQsUGNjv
 HtR182s3kz+f7OygJ4wsHu2Mo8zBXI2gbxkrB20fSFQl5hJLhUXsoJgVF5yGCeCOBoDTdfqosO
 mVIVgKTV57Gk5Gp914oFCdP57CGaxb/93zQI45Kqs8l7qfR69Jj8NzuK1dYbV2ynw+P6kT+NpY
 Y0OCOluKN4zi0uEw1DIW0psP3Wo3APjAAAA
X-Change-ID: 20260128-sm6350-lpi-tlmm-bdca4deb5641
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777533047; l=1992;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=QhQKB2mRUuTtgEbrNzVyQWry9Jhf3YZS5lk/FPu/bGE=;
 b=I2DiK9SeNbN+KP+wFWjjnhIUJ5RMd8BNN8v7oSbkqI6PJiH33CQS4/zUIe1YOvTRqGpykL5lV
 mnap3+ig0YYDu9R0Qnbs2gaD0qG+DRGisKOaB0mpJe9VF64CG+0olfz
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 0CD9249E6CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105290-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,fairphone.com:dkim,fairphone.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.software:url]

Introduce support for the LPASS LPI pin controller for the Qualcomm
SM6350 SoC, by adding the dt-bindings, driver, dts bits and enabling it
in the arm64 defconfig.

The custom slew offset for gpio14 is described as
"qcom,lpi-slew-base-tbl" in the downstream dts[0]. I've tried to find
some reasonable solution to have this handled correctly in the patches
here, but suggestions are welcome how to improve the situation. There's
of course several ways to implement a solution for this.

[0] https://gerrit-public.fairphone.software/plugins/gitiles/kernel/msm-extra/devicetree/+/refs/heads/kernel/13/fp4/qcom/lagoon-lpi.dtsi#25

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Fix dt bindings example
- Drop note about too little register space (Konrad)
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com

---
Luca Weiss (5):
      dt-bindings: pinctrl: qcom: Add SM6350 LPI pinctrl
      pinctrl: qcom: lpass-lpi: Add ability to use SPARE_1 for slew control
      pinctrl: qcom: Add SM6350 LPASS LPI TLMM
      arm64: dts: qcom: sm6350: add LPASS LPI pin controller
      arm64: defconfig: Enable LPASS LPI pin controller for SM6350

 .../pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yaml     | 124 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |  66 +++++++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/pinctrl/qcom/Kconfig                       |   9 ++
 drivers/pinctrl/qcom/Makefile                      |   1 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c           |   2 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h           |  20 +++
 drivers/pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c    | 149 +++++++++++++++++++++
 8 files changed, 372 insertions(+)
---
base-commit: 3d33d10c2d4f964c9223fd9a27eb7f0ac733c216
change-id: 20260128-sm6350-lpi-tlmm-bdca4deb5641

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>


