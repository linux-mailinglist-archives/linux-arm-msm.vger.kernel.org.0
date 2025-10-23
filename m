Return-Path: <linux-arm-msm+bounces-78431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCAABFEF76
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 04:59:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1984F349752
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 02:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0837021D5BC;
	Thu, 23 Oct 2025 02:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ca4E9TNH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8AC2045AD
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 02:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761188361; cv=none; b=DAGKerSo5QbtwYQ89CNM+AsVpzMe4HkG21IXEITINjhX3g1QV/NvQqakgnRPBrouhriIelf45QZ/7WqeC6q19yPrHRiRhrBWkryfL8Ml6pympPYVLEOLxCKlqC4AUhoAH0pQhThtjbgleljNZd/m2yAnA2aEt3PWDtqFXEil8Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761188361; c=relaxed/simple;
	bh=3G1bXwWtl6VnvZe0v7hopCxr+A2lOEL7pVN02yKzvPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jAn9UNdXxyfH9Xymc9b3JpdLpUZLyXTls6JcBKwEJDk12gHAh8cL45pjKg86TJrVjcjJ6Q082BT0xou9M8zhhDDkQboikZmH7YbqGltt8iC7ujriF7vBeYQRg9Kz1fIQxOfTidJErAjCRcE59DE6yw06mFIFYmdPi2+0pn4PnkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ca4E9TNH; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-592f07e03f8so44367e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 19:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761188358; x=1761793158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pIiPd67vlVFd6R0UXLdM53svlFH/FgicZ0d5lASq/7c=;
        b=ca4E9TNHpuGn/LOcyGqMyBnvti+wnN61GhtPSmGedqdfKpuXv9vf3wLUSGhwEz7Ze5
         J24SZDjeLrN0QAYiihAIJmjEt0M7wP1+nicxc6GqzlGCE+M3Zt1PAEQA5NBAdxlB17eN
         VIK7bbXieTpZYGLol/9srhEMEI3qRGVnlfs7aF9YBrWyw9BanggmjvxJ1ipebYyaUnqW
         Q+A/nKRIapNAbJcuxoIqiS/xXYqlUXSOQpl9IRfLvwGQjF6nucQ/tj5PwfESkQ9U2PDu
         y7qOjFH/nPXinwl3eFOzNJLXurJ2BNcvm9M9mXtlrIyO5ty8AyOijF3XaJWCDZiabupA
         pw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761188358; x=1761793158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pIiPd67vlVFd6R0UXLdM53svlFH/FgicZ0d5lASq/7c=;
        b=Gx8KdO56DHZFPpLBjlSD9BaP8HhaKcwA2x0VlpJitrfrCxRoD1EtNgRAV4MlREnEwX
         Z7VXHoGgY1xOBhBAreZ6rOwAcWshymln4P9EovUixAKodPS/OuVEqpSnwd61t8G2hojz
         CR9cErtF6enV9QPdk4YBTSAleUh7rYt7X/V+PQfAV30PWR5mqx51mlqCE8c9VOI8MDrH
         utKU7q2H2W2jb3vg2TN7EM4HC2NVpZMip3r/ZEeqRd7Gx5WpZ3e+jKZP08yuJEjv2/Ep
         EJskqWUSaQ6t/MN9KWf+W9S9wLzKuQr7mUzVb22Dpmjdi3/IeKR4Yym5tzcgS6F0WxSQ
         lfZg==
X-Forwarded-Encrypted: i=1; AJvYcCV5DuKYTX8U/SMb9aGHlfOxFfxCt+ySMwDkCqRy1RkD/YjzjGZYnOlcCQ/JEhizYBi+L31YZt4W5M5xcNhz@vger.kernel.org
X-Gm-Message-State: AOJu0YyWVozfsr38pMtA7HD6k0XNfOmydp7DzeQl0EJN8I1aZ0v54NjQ
	9fTkZfwa4E9eYamtagf57GEBbXCWNkBHwIMyx8PW6yByIYEi6b20l9DTVTcSz8pnBjM=
X-Gm-Gg: ASbGncssF0BYi2MnrrM/viuJYXdnbxu1btaZGr+MeZkHa0yZsGNNVgs85RyQdnA8PB4
	7kTM0TWtmz3BfVJAbQB6xEPSVPivVp8xhtOfes2dQsUWxreIkIVvTSVy/pMKNfZPSm49f3k8NQq
	pT4ehT6F5rH//X0236s/lGgyI87WnbhB6qfdMH+D6zp9Ta7ynWsST/Wlii+PJVy0r4JzaPGic4U
	ulMhj2kqZE9MRvpXB4kwi9LTeauCD6GIXPHEC0Dz55XYJOy3GX4XRq82u+umM502hMqjWneD4OA
	KBEosNolnvbSMMMmwxWGgTiHDw9hc7rc9s6/6yYBwgB0U4gAzX2BiMWcOjY0y+8OZbAC+wbhNEC
	mgBHNd9itdr274nFf/T7H+G8YmkVq90Tv97YKuBvJckSHPP5MJH+2YO5dvdyU02s6U/1ENBbFlW
	Ev20E8s2XoEouDwxa2r2FnhAzji7qCNlJhe7yxDTexW+9nnsqQ2tyvWg==
X-Google-Smtp-Source: AGHT+IGuHLoyl1PlImxHNd2Pf93RrfU/kmxL+XV4m9FVarpximyvQwOnqYbnR9lHI1XhC1sdu7AjFg==
X-Received: by 2002:a05:6512:239a:b0:57a:8bb8:2a21 with SMTP id 2adb3069b0e04-591ea2fcdb7mr1553523e87.6.1761188358287;
        Wed, 22 Oct 2025 19:59:18 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-592f4d16a15sm334471e87.58.2025.10.22.19.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 19:59:17 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: qcom: sm8650: Enable S5KJN1 image sensor
Date: Thu, 23 Oct 2025 05:59:10 +0300
Message-ID: <20251023025913.2421822-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable Samsung S5KJN1 image sensor on SM8650-QRD and SM8650-HDK/RCC boards.

The changeset is based and tested on v6.18-rc2 and it has two dependencies:
1) added Qualcomm SM8650 CAMSS support:
- https://lore.kernel.org/linux-media/20251017031131.2232687-1-vladimir.zapolskiy@linaro.org

2) a new Samsung S5KJN1 camera sensor driver:
- https://lore.kernel.org/linux-media/20251023025356.2421327-1-vladimir.zapolskiy@linaro.org

The SM8650 MCLK change has been reviewed in v2 of SM8650 CAMSS changeset.

Thus the displayed updates to SM8650-QRD and SM8650-HDK board files can
be used for testing these two media driver changes given above.

Vladimir Zapolskiy (3):
  arm64: dts: qcom: sm8650: Add description of MCLK pins
  arm64: dts: qcom: sm8650-qrd: Enable CAMSS and Samsung S5KJN1 camera sensor
  arm64: dts: qcom: sm8650-hdk: Add support for the Rear Camera Card overlay

 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../dts/qcom/sm8650-hdk-rear-camera-card.dtso |  90 +++++++++++
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts       |  45 ++++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi          | 144 ++++++++++++++++++
 4 files changed, 283 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8650-hdk-rear-camera-card.dtso

-- 
2.49.0


