Return-Path: <linux-arm-msm+bounces-74144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 348D0B88BB5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 12:01:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08BD73B0628
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 10:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D942F83B6;
	Fri, 19 Sep 2025 09:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="yfjJbs8z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF022F5465
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 09:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758275963; cv=none; b=INGsPWIp6ey2kPLJZvESQTIMB0txHOsTx6INUiJL+C1B+fbfkoAyw/WU952ZYhtL/5DsBThJ3k3HxWSuu1qw3RR3qWGKucmSwPWed8Kj1kQBkRqzQcsz42YNXxAslDRQvHeOK4lLgASVbdbYGrMrNDb8zUStK0A6PMNLNF/2YJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758275963; c=relaxed/simple;
	bh=mMraxz1KfXDhOa4Lp6riixVKju0PQI0TmWYwlUzbwRI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MeHFvGjPj7DBNfYEtt1B46lDC51e/+xhRnqWFAeG1gSje7o3wnQEKdafA4KidC8OW4J1wFPf8v5Qgn1a+kaxJhnh2eHhcHh+Mn3wFOFXwDT/Hd09tRZ+Wpa4DizV9bVY8bFGP9sFE9SGY2uZwTfkmJGdBHS/eFb15g2XvuxrQOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=yfjJbs8z; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-62fd0d29e2bso287423a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 02:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1758275958; x=1758880758; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xJg7U22MK1JiQA5LO5CM9bHHIrHca1NYKtGFQsxP4r4=;
        b=yfjJbs8zJsQGgpDtUh+/DhjEBnUciTKP4fenL/W/StDYTtrH1s01OgdQ3nIlhvowS8
         T4RWct+vVfttatWB3xNrqwyebq4K2v44o4Ta3a/Kd42FKQhI7d66eMjw0N0AtxsWRLMh
         a2Xp32jmSJMVkMlVZ+ErCkdLErJWasksYy3gM7UiBUV9f0UPAChKDJrB0NQwTUGgfTS5
         YZVYKNvgZWx+GssTNrCc1JrQgGD6A+t8j4g+yNJoRgusmhOsvsYMzE9wEYL7dxB5R/Y9
         Z4KOW8N4NW+Tt4tgpMRWu8+vvF/hYjwa/4IPmQ3eEGxAe65aCv0iOmzQVY15B3On1TdW
         ZC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758275958; x=1758880758;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJg7U22MK1JiQA5LO5CM9bHHIrHca1NYKtGFQsxP4r4=;
        b=xB6Lf2/n4lelJSBqubF4iiG7HB/ePP8kYmQ0EdSkn+2GKpdbDzJej5fzlVK9rqdusI
         J50eMOrGLPWugtGJzb9Jir8WDlVZw3Rii32Tl8utRVyKatsAvJu5yFTgHEjaLdlWGyJl
         X9Pnl8tbVrY//pkjKz5zwxXeggDvSlLlpdOHXkQKPAqy9eaVGnGguWQTDbbjpBS9gnAT
         +ByPTB7R6/LdceSIG/xkByELhQR964FBL78ROkgF2nwrFjOSKOBZ9TzeHnWe3Z4isHi1
         0sauOSpRBhqexdJK3+kFxf5VmkkFi3t+jqZyQiFpcIx/nou+8XKW3fSWwBlXMdWVX2g6
         mlNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzlm+u11X/Tb7KiNG5tkaYaq4FsSdkQABRWr1QdeMAqlM3kWaYnTAO0fZK6+NBTiBhR9vTzgbpqkduLdyV@vger.kernel.org
X-Gm-Message-State: AOJu0YxFy9hQui1lgFcWyPFhfOeo35+up7q460ob4ayYctx0e2FAXuJt
	W+SHeL4SmcyE9uJZNbwhJ0jAJwPOuVVvW7J/4i7cv7KCLQF3f9Lxnst8JbflrZ72+UU=
X-Gm-Gg: ASbGnctz7WPs9zpt0CNHVo3ifQbpo3I13I+EJ3x/9QATw7j2IKpRc0hQ5QcN1aj4fNz
	nXwMCCtUzIXCnL1VMOUsQGki3jmbrEMXh0G2MrZ5ruCkD1Y4yclD0xM83LyH8AgOC4PAPg0nW1A
	bRocnmj8AX6yeMHlKnMjAyybrIG4N20Vs7xSGf4eVMshyQe2S5FRNrxLD6NL3RQ29YpHoftPgrn
	7dCS6fJ8nSPQCGtBI/rsW2OSqC9oT75I/AaTvuTle8j+dDqBR9jaYsenWpAv+fTKWK2y0ysX4M+
	bzm2owxZpW5j8JNWV8VoI8vdskCDfKgCE8JKNH2dfS7T/6mNgnDnTYmxKcjPja6BLh05/iQaP5a
	6QLhDQhHq5QLXWMoKd5ySaVRJgUF0+wg9rsas7JC/nqfJZy8BeitXRfd0eNRF5fSM6G+ApA==
X-Google-Smtp-Source: AGHT+IGVYm9E/cx1SKKQgvlhctnWTkhe6Z+JABeK/WVkRlVG4Nq2CQ/rYTfusBlwv0oZAUdV2jr6XA==
X-Received: by 2002:a05:6402:23c2:b0:627:f3b4:c01a with SMTP id 4fb4d7f45d1cf-62fc0a5a09fmr2234196a12.17.1758275958517;
        Fri, 19 Sep 2025 02:59:18 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa6f03008sm2972107a12.7.2025.09.19.02.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:59:18 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Add MDSS_CORE reset for SM6350 MDSS
Date: Fri, 19 Sep 2025 11:57:22 +0200
Message-Id: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAIpzWgC/x3MPQqAMAxA4atIZgNt/aNeRRyqjZrBKo2IULy7x
 fEb3ksgFJkE+iJBpJuFj5ChywLmzYWVkH02GGUaZbVF2duqUbh7EYwkdKHv3FRr43WnHOTujLT
 w8z+H8X0/9sPIj2MAAAA=
X-Change-ID: 20250919-sm6350-mdss-reset-d7ab412d170a
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758275958; l=860;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=mMraxz1KfXDhOa4Lp6riixVKju0PQI0TmWYwlUzbwRI=;
 b=nEOvSMIjb1EJx8t/h3B9Qt+6O9RQANHQ/rfdz2FT+zMFtNxpXQ4F4ptH5JHP5tdcBoV5FrGri
 a3q1vhC481vCmbBR9Tm/W2lJACJtJCfDyKcCaIy9h921kC4lQ2W+72x
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

With v6.17-rc kernel, the display stack needs reference to the
MDSS_CORE, otherwise display init becomes quite broken.

Add the resets into the dispcc driver and add a reference to the dts.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      dt-bindings: clock: dispcc-sm6350: Add MDSS_CORE & MDSS_RSCC resets
      clk: qcom: dispcc-sm6350: Add MDSS_CORE & MDSS_RSCC resets
      arm64: dts: qcom: sm6350: Add MDSS_CORE reset to mdss

 arch/arm64/boot/dts/qcom/sm6350.dtsi           | 2 ++
 drivers/clk/qcom/dispcc-sm6350.c               | 7 +++++++
 include/dt-bindings/clock/qcom,dispcc-sm6350.h | 4 ++++
 3 files changed, 13 insertions(+)
---
base-commit: f83ec76bf285bea5727f478a68b894f5543ca76e
change-id: 20250919-sm6350-mdss-reset-d7ab412d170a

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


