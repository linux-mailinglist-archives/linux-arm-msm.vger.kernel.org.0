Return-Path: <linux-arm-msm+bounces-37362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDCF9C2747
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 23:05:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0493D281F6D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 22:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 955281D0E04;
	Fri,  8 Nov 2024 22:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QX9pofzi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3E31C1F18
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Nov 2024 22:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731103508; cv=none; b=DL2X5n+6ECHFKjMR5tQ6dp/qtabbRV+jnMgKKorpubIg3PC5L4dyb0fnmt+4AuPmK6YkvORybVJ799upnH4HzSUYpLrJZ2bh819WBusFvdkpJVFR7HVHrjZbEA3D7wU4RpaXCdUs1KjN8qQu9PcGJ6cS+ZzJkExIGPl+V2BAbWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731103508; c=relaxed/simple;
	bh=folrRXsAeb+ENu8kV9TfjzBD9Uhz32kMFNIm9kKd7kI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H/DJUnWgYgsiKM4Sy0TKaIEyEzQy1Xj//2iE70J5j1mg6GcrVTL6v08gln1ZxsNa5NNPdc+eMr6A1iEB5bhPywOCaYmIgsSeh7Z3WAjbt7G6mDcxDvOY0luJUhzbk3cm/i6wltPC/iQeSNQgtdk8QUJ35RL9NhbC9UDOE/ybNJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QX9pofzi; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-431481433bdso22554025e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Nov 2024 14:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731103504; x=1731708304; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aBpGH28+GUUnK2OzUs1bj1BJKf1BkndClHI8Nl42LUI=;
        b=QX9pofziyhXdukVnMrLVN9AJuyTEYit8HnTw2Xpdf/5WU+wm+c4R8HbQFiSk0ajUZx
         azYq13s1CLEywcEycuvDgqhHU7yc/bArSUORlTtkTHodeiWv9sH+Zo7DWFDIYYXMEZzu
         lGaOn9h0vG+ILAMXVNxrxAYyDt80erx4vqcXElSxUJI9cSmfQg5gPvzIkOPt6CVhLO5B
         0XUQ4O6cXkELlJ4FVknJFX8Jqc8AIuhxVbQafvc+A+xrRNHwbtAdzBcylfIkUrHUXoyo
         Oom01I3E3kf7qw3n6lMshAoL5YSFOJ/wSBMhes3/7hxUoLP+SkOTfQ3jXxqf0lE2CJDE
         xRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731103504; x=1731708304;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aBpGH28+GUUnK2OzUs1bj1BJKf1BkndClHI8Nl42LUI=;
        b=wQL9lhpyvqfd1p/jy6tuzP2HzND8eur04tb0HrZOADqjbdV1ElbTnmyy/jZrs6KtA8
         mXcVaMOf9XfoE9lPl0DZU3UNnHrxLFV1+SQyNMUwm2pP3IwzXm/4qmxVVTKt3k03WcnK
         jwkoqiswvvSL637/iEsGm49x2Jr0o4JtSxNYEo3LAZfIJYeSCJ872dAkfmnApC8SkpN+
         722PFPKI9l7o9lmkdxg9N73AV2rkxNRxwvSoX1t+cMGPw0dl8bJ+fnOR71ZyyEYx3mlK
         Iv/YDPtbyMh0nMsAusXQJ7o7SOZEKRtoHVz5vfWliyObtDYewD3588lJaD9LslAJvi5+
         HIJw==
X-Forwarded-Encrypted: i=1; AJvYcCVDaAw8Iap4kOY/wU+/ZBP7Z30SEsLf/xEPBcS1FhNnJwuz9CehFN+tA/yDNbph48GE0U1Zkb7WUFNVji3S@vger.kernel.org
X-Gm-Message-State: AOJu0YxSdB4iSAkqXRqmTT1o/ZijFKDiS4GYZKOS4rhiiYwEbmajM4NK
	zp0zIGEuigtfBr4cB3Wcd4vJoCKKXZuefNGfFavrOEXZlqEpUh3ZiljM/uAVWHxyLGOi3nsAWsl
	ZUB0=
X-Google-Smtp-Source: AGHT+IGw33yXAKsR4OVH86UVc5UWoiKsARXvGM36K4NBRLK4gICNvRgCk9C8QaaVzXL+PAGrNakB1g==
X-Received: by 2002:a05:600c:1911:b0:431:5043:87c3 with SMTP id 5b1f17b1804b1-432b751b5f8mr37116345e9.22.1731103503593;
        Fri, 08 Nov 2024 14:05:03 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b054ad23sm81676125e9.13.2024.11.08.14.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 14:05:03 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH 0/3] arm64: dts: qcom: x1e80100: Fix missing address/size
 cells warnings
Date: Sat, 09 Nov 2024 00:04:41 +0200
Message-Id: <20241109-x1e80100-fix-address-size-cells-missing-warnings-v1-0-c1e173369657@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPmKLmcC/x2NQQrCQAxFr1KyNjApLkqvIi5mJpk2UEdJQIuld
 ze4erzF+/8AF1NxmIcDTN7q+uwhdBmgrrkvgsrhMKbxSpQm3EmmRClh0x0zs4k7un4Fq2yb40P
 dtS/4ydaDjlRbyUSlcWGI2ZdJpP/L2/08f0WHpCeCAAAA
X-Change-ID: 20241108-x1e80100-fix-address-size-cells-missing-warnings-1cfba11bfdbd
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, stable+noautosel@kernel.org
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=folrRXsAeb+ENu8kV9TfjzBD9Uhz32kMFNIm9kKd7kI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnLosDzxzt58sDF2iUUDPuv5NrS3YfdV843HMmI
 ZDOV4LmJsWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZy6LAwAKCRAbX0TJAJUV
 VvexD/9SOG6qEJsMazxPLxIb6ETSAczrqBgmB7V9MBZyQj3Z2MNBxBmdHhEmF2+ptYCs7sosU2B
 hCh0frSuIK/epVgYZmjY/zjts91TwRzPRGrWAmcUfwaNSRQOAf5bJWIYYCLe3WBOMyDrdaJxYI5
 VTPTFOaWq3MjrP7YNskGUzSGGrhGhajIzM6yiV7PgQvZSUufZg9x7Ntmu+NobitcTxE5gz/GfJu
 efLgSxXkQ0iGW4Xqf1NwgahFUSyFFvg9JFlYeMkdPK1HxwldUZPjolWKDYlYvJ4he2DyzvOSexJ
 CSTEN8xG4FhaRvwrdZg5mB5LHZpexaZKqFDTaFHnsKl5cbXRdMb2lq3oL4FysXtaZoe4EApLUDc
 JYsY2VO2tph0iGySJKuwtadV6aYrER0zZphiqjp9o8JiMIiIVsLSCWQ2SgjC6660dHSDVoN/bct
 r61a1ALOGxfPPD7LIAiHhLRRKNUcfMpBOFwb9+wq2/2kHVLKA2uQnxUStVgxYLPBrpqFXU7YVb3
 uxogIuWvnAO1kwoCXap9GKV8yRJHWq6Jl3TqTCmQMPx1zv1zTNmteCPYL7QGOKMLFQT1M/29UBa
 aXFyePseei6Smc1T1T31I+cTrURzr5DdcoFwxzJJoo+bXDxVC80SaC7B/qwU3lRz06qQ3Gq37G1
 FQYPtD/T7NxwCuQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The commit 4b28a0dec185 ("of: WARN on deprecated #address-cells/#size-cells
handling") now forces all parent nodes to describe the #adress-cells
and #size-cells, otherwise it will throw a warning.

Note that this patch is currently only in -next.

Fix all warnings on the X Elite by adding these two properties to all
parent nodes that don't have them.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Abel Vesa (3):
      arm64: dts: qcom: x1e80100: Add missing #address-cells/#size-cells to firmware node
      arm64: dts: qcom: x1e80100: Add missing #address-cells/#size-cells to ADSP GPR nodes
      arm64: dts: qcom: x1e80100-pmics: Add missing #address-cells/#size-cells to pmk8550_pon

 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi |  3 +++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi       | 10 ++++++++++
 2 files changed, 13 insertions(+)
---
base-commit: 929beafbe7acce3267c06115e13e03ff6e50548a
change-id: 20241108-x1e80100-fix-address-size-cells-missing-warnings-1cfba11bfdbd

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


