Return-Path: <linux-arm-msm+bounces-12046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0604B85D8BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 14:05:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B34D1F23DAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 13:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E766A69D15;
	Wed, 21 Feb 2024 13:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gwvEwLFJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2994F885
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 13:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708520682; cv=none; b=SdveUAdgBfkn43lwuhb9GUmMeNGwERNi/5TPSViAI+UhOSSQgJsEkrWTK51PA143/fCOaw1M/DG8wd/m8k78zFoq65Fc/D4elwMsDKB8QwRWuRFAQG5Q6NxqYVzb8+vHeeXO9MO7akw/0Nix77pLI92ZetY+VcTGeDa/Aw7/3hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708520682; c=relaxed/simple;
	bh=9KoXOsoD3oFZG1btxerktQuS6eWjGbeSUSu4T0DJIN0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UgbA2SeuIiKt6Cxhdh8xjNpBsAH60S0PBYRj1+LG8Ltoh1VeYPpDwP3TEra9Wbcztg93IDETLrE5TX4oy9tHjfpPzEBAufFvgE+uPTtVbtFHw3pZt9HXmmzBGX2UAQzg0jcymqB3znJyPXcVZIQKbmbeSyDZHUTDrulFutXp3as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gwvEwLFJ; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-55c2cf644f3so9048947a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 05:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708520679; x=1709125479; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Su7u5LVuWTODqDqwc76MxpUbjqV0wYO33Q2DKXaVprI=;
        b=gwvEwLFJmUQr02cZef9lWmwIt0TPKCLCxosyRlUeyRbCz1G6KeayuXo3wnmEYYGtc8
         3MOE8VkKavfE9f+ZO+FUGgJgsFoMsJh2Kf6iON66mU5Fhgs3Cf8AeoMsavwpn5389UT9
         VeZAK/ty8Tvzy6AXKppKJS5uQ52Lv7Wv+Frxox90T/2p3+ta60E36LYVuWlqcu9f+Hi5
         fskFY7JtRDHNCfSdirgiYz2pOAiGfu0CF1Yf/8/z5cz6dMtT+JOSH1Xn7ZXW6DqwbRzJ
         Ru6BvNZcKYwBL4VglalYECinF26GuZOcJlJDg+Ev+jrcwYAX/ses+zy361y2KOhCMAiU
         FeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708520679; x=1709125479;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Su7u5LVuWTODqDqwc76MxpUbjqV0wYO33Q2DKXaVprI=;
        b=Q33B/PtO8R83guoEOzpiJ1HKm2hPfIeEh9kCR42xrOZIauSJqC+nzWEDzr6HmJ9Xxi
         hkO/olcUQPsPRGIHfN8uetOsV4A0x2NIAI2K+FuCX6E82J3hfj8Omalih0mGgsccp5ZD
         J6d6BzgPYG7Fo5d6VpuKu4AsoE+/+r0lhxLo4sEXOfDT7enSOKPTfsfdP8Bj4tvaV1At
         lBX2Aolu/YiDZUazOTmXmRiLJkogAFP2j8Lno7GJAgx6eVoTo8sEgCe/wawMIGficqum
         sxBAt8IIdqwsa1u4FJ5ve2OEZXSYQK0JdVkEY0TEKY8/6QmOl9HGx//oCw/y4zhrEHU4
         KzMQ==
X-Gm-Message-State: AOJu0YxDEI870jihjt6GDCqVrnSt+u4wrkRcdPolsvwm1LllXvVpfwBa
	S3T3AHqQ2+h/E+lJhKn79P4LAtAsWhWkMSHyVsc1MPA/B0rPIOhL6HGtZ729qeo=
X-Google-Smtp-Source: AGHT+IGmKbo9lU2m/jrWYJ7PcWbo1TlLD3D5477TsjL7EmHoAggInAZZez0dXgjKWSq/rM16CjJLCg==
X-Received: by 2002:aa7:d4d0:0:b0:564:66b2:2075 with SMTP id t16-20020aa7d4d0000000b0056466b22075mr6746229edr.10.1708520679346;
        Wed, 21 Feb 2024 05:04:39 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id a20-20020a50ff14000000b0056459eafc0asm1356178edu.17.2024.02.21.05.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 05:04:38 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v2 0/2] arm64: dts: qcom: Fix SPMI channels size for SM8550
 and SM8650
Date: Wed, 21 Feb 2024 15:04:24 +0200
Message-Id: <20240221-dts-qcom-sm8550-fix-spmi-chnls-size-v2-0-72b5efd9dc4f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANj01WUC/5WNTQ6CMBBGr0K6dkw7/EhceQ/DopYBJoEWO4Soh
 LtbuYHL9+XLe5sSikyirtmmIq0sHHwCPGXKDdb3BNwmVqix0Iga2kXg6cIEMtVlqaHjF8g8Mbj
 BjwLCH4JHTVWOeUfOaZVMc6R0Oyr3JvHAsoT4PqKr+a3/+VcDBrAgRKMvtrLuNrK3MZxD7FWz7
 /sXHmlckNcAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=757; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=9KoXOsoD3oFZG1btxerktQuS6eWjGbeSUSu4T0DJIN0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl1fTekLLY3gwYLed73X+kjnLL0XN08XVXOkOuv
 dGL7/RivqGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdX03gAKCRAbX0TJAJUV
 VonWEACKeNwRc6/wRAzkMHGwxWu6JA/jUTkeMwhgsN1BoJiJ/b3lkfbTDZFJs5ZLML8mHfvA8dq
 dd7DaiizNXUoigpbOdMMvT7s7XrK4Pk7RRCUy+bzVKq1+P5SkK1nyppWP3ubscGurv5v51zCGtT
 7rB/pEriNB6LmUUWDr+b03n84aolaqCazxxzyCM1RSEphE0J2g8bAPF0SBT6ujoBKy3XTwHfRmX
 z+mxm+gKr9QokQiVStxfbfL8Uyq8T4qjUhoxokPpjGn/Tk/eiQ4Ct7CVAYVBEMJKmmLUTfnu0Ij
 UvVid4mUIGLSYcHXiOJ47iiQUU4qWVQi1fXwxsNB0VSUQogtVkHKH4t6IU6FmGSDrvC+bYoJ1ym
 dksXd21o79G1y/9Ok0maNzyElo9K4/pZwSLV19UnCcV9ymac+cpKLoeKudYUov5c85svPsg/ZCW
 MkTFQiabQ6M+kviALnEDFhO1oVruKDZi2HNxpP92NTH41nLCbGL0/I3RVkk7j+00GbbfVh1L8Ef
 iGdDAN+6hDpsw8u6XwVFN2FVcawIME7zL9/Gfi4cBDwJ2NiXJ8F8WTX5xVndWker62teysqZzRg
 tqZ7eV6dqygrNXXhqDEntnzLpOG0hVWK3l4chgQZi2GdnOBCOsKTDmJyS44ebk104IvFhFz9eKt
 /iVPFcUwUECO03A==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- Split into 2 separate patches
- Added Fixes tag to each patch
- Added Neil's R-b tag to both patches
- Link to v1: https://lore.kernel.org/r/20240220-dts-qcom-sm8550-fix-spmi-chnls-size-v1-1-24e22107a6ac@linaro.org

---
Abel Vesa (2):
      arm64: dts: qcom: sm8550: Fix SPMI channels size
      arm64: dts: qcom: sm8650: Fix SPMI channels size

 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 2d5c7b7eb345249cb34d42cbc2b97b4c57ea944e
change-id: 20240220-dts-qcom-sm8550-fix-spmi-chnls-size-b8e6323fecc0

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


