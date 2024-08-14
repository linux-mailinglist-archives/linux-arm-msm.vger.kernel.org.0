Return-Path: <linux-arm-msm+bounces-28544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 672B1952326
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 22:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E375F28484E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 20:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5511C37B2;
	Wed, 14 Aug 2024 20:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VkolYUzq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970E31BE877
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 20:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723666684; cv=none; b=IQykREJC8krLIv0ZX/NUVbkdPbn0OA8Zzy2ZxuxpI3R97K+yhsDPvNJe/tZC+r26nrJPkdO92/IhHVFJdA7ONyMzbGGNDih1o4kK22FNqEzELImBLynxIawv819S9WxYGzdqdED7nAADu7aU3nHMwI28zwSWOfcItjmaTOfv08A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723666684; c=relaxed/simple;
	bh=IDFzF0yce2bZ/E4Xh35DH7oRTWEv0YVs3G0L/MpV6jA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nXjOZ/HyNxm4nLWHAqocW+DzlyeaN6VymYU8/tJFgTRHKvyBtihqg+7xtSe1rquVgP+qyA5ht2yzkgl28qCBso2GB5IR5RMkvXRIWUUPWvdWpsQKdNu4nM0NxROrbQ9i8DPVHu8uXRng+5FtQbWkwNZG0W6cpb/Y9NFb9WxYces=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VkolYUzq; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5320d8155b4so329697e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 13:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723666681; x=1724271481; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N7Q/2ZdZUcy3TqByrudq/6lAn7wj4MC3IHks2nP1UG0=;
        b=VkolYUzq9Q1uDtHp0bYlz/XsRTqz8I2HXDdGwBKRNS/GAnHjnHVG2vfvYZwrQS2jdh
         zs5MFyuA6a83gNYhNBKavgORvkScW6uxahpf3dB6UuIfi913uhL3ylaBJMXbNYLm7SEC
         +9qG1hR2eRR46zQBCmyaSD5tNLcn3O5Wsk8WOXXwL6j+7QtqAf0M5J7Q8SQ2zzS3VDiv
         kY1q7SlnhHz786efBHd8lzgWY0t/Z5YTx4lsbxN9LZOl9euuYvqp/cYYEOCftOu8Yw7P
         oQyXCNxlz9UxpfcPEs3vYwTcbDGMDU6K2FVe0oqRNgh4oqBAiV58+kEBJqzgoS+oicLW
         eCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723666681; x=1724271481;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N7Q/2ZdZUcy3TqByrudq/6lAn7wj4MC3IHks2nP1UG0=;
        b=cdvVmltnC+28JO1p8i8QgiQsqxMpdQ5GQvN3S6+5f9euC7ejWRMlxxWFZp6FFwO/0/
         ZEAHD2PQxbv7oTrq86Niix+YHJtGaxusnGHELAhvMmnXkLUa12v/S73lmfJwctMVlnWk
         gCkNCh7bSxQiaUcjzsXq3TcGNDzTtJlHtULTCQlDn3vwcottan2zSygGighLvv7Gd6mx
         thMdDo4NO48seog4iXq1JTtsKIgDn6do3pVj80qdQFbQ0l9Y12l9UCUzntIlB69CkbNZ
         vFmO+JDaxluvd6D3MmuF/uowiWVSGMepQfaPP95ogUORCUXFM+jjB+CpmGErXONjFDVB
         CGWA==
X-Forwarded-Encrypted: i=1; AJvYcCVHX9AV14sID83KOoNh7dEwGrcCPxUQn0I3Mx0YQfX9HObNMANeNjoPTCdYSFOx5WAtGOXm+U+TsJWtaJsL1wtGxspkvu482IOdZl0CPQ==
X-Gm-Message-State: AOJu0Ywgyi4R2T7GlMztivb3i4Pp9121as8a8wMwwuhE6SUkHa3voSR7
	F4S8uj6gojDi5/f/jo/1lc6B770AI/YxoMulpb92xERujvqrN3s0ZNmWzkQV+VLDNKyMF+zXtZT
	q
X-Google-Smtp-Source: AGHT+IE/j/y5f2qUnWfiTn+71OLcR7yWJzkuNM+7IYuIQEjbCYlH8eVu+L8QTLQvX4pvf8+uIELZ8w==
X-Received: by 2002:a05:6512:3b1f:b0:530:da96:a98e with SMTP id 2adb3069b0e04-532eda5e9f6mr2541274e87.2.1723666680405;
        Wed, 14 Aug 2024 13:18:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4ebd3631sm13623519f8f.110.2024.08.14.13.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 13:17:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/7] thermal: scope/cleanup.h improvements
Date: Wed, 14 Aug 2024 22:17:46 +0200
Message-Id: <20240814-b4-cleanup-h-of-node-put-thermal-v1-0-7a1381e1627e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOoQvWYC/x3NQQrCMBBG4auUWftDGoZavIq4iOnEDNQkJK0Ip
 Xc3uPw27x3UpKo0ug0HVflo05w6xstAPrr0EujSTdZYNvPIeDL8Ki7tBRE5IOVFUPYNW5T6diu
 snWZm4/0UrtQzpUrQ739xf5znD0V2dWFyAAAA
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1334;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=IDFzF0yce2bZ/E4Xh35DH7oRTWEv0YVs3G0L/MpV6jA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvRDs+0tDl0eWdKGqSlDSeNHKL5J1ioJkNMvdL
 4BE0dkl3ZCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr0Q7AAKCRDBN2bmhouD
 15e0EACOess85sYLZS4oIYYo1UnfzJfsjJkgf0ia3wZ4HcYxp7WHM9tHOOmWrL0O8FuAETuA47B
 74XgLMmQBBvhVjNmGHxvi5DJNfMYtz9eU6/K7F31FqOuL5IAML5nD10kf+O4Dypsjqtu/2qfk0Q
 v6mqBERHK10IVN0exuyqG1EDVwlGyoOB8FOs/EVGGQElkwVdud1CMamRsm2vS28X3zTOojrk5X1
 H06nLFfDGzxI6Tid0DmexP5juFpE4VR88cx7eU5kO8vdFo/E3LTM3GU5boJgfSJ088HBuLzgJRT
 1rQxY9iQwucEiBtj5L1PfhTHtM7s4oKNR+iCRqIjr7xFvGUA9H/jM1KysI33QRJU0OjSbF59fDL
 TG3W0mReod6nHjBl36vWMB/tGlKQtIjsokaNQXAqbsmochlvgsTLZcgTAkFwVK6SVliWjYw/GC3
 XVlcE5W1J8vHR9BARQrRUcvw5HFjaSzwF4NX+6jBBV9ShOsP/q/pZJj/zfEG5NrYvlfg3fY9yuT
 E5kdEvTRgAeKN6kP6xyqGr494cLk+uwWefTWgdWdYhIVxXDFyVTVHewAMvaPy9rvqB4UnaQJ1bK
 fOWPn/A94uP8aKj3lY3yVEE7qVED/5nIElAvG0E0S+5pEA95cZ5snHAUM27aV4/unulUgoLcHWf
 0AcrMoAQp1431Ig==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Few code simplifications with scope/cleanup.h.

One of thermal_of.c patches depends on my earlier fixes:
https://lore.kernel.org/all/20240814195823.437597-1-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

---
Krzysztof Kozlowski (7):
      thermal: of: Use scoped device node handling to simplify of_find_trip_id()
      thermal: of: Use scoped device node handling to simplify thermal_of_trips_init()
      thermal: of: Use scoped device node handling to simplify of_thermal_zone_find()
      thermal: of: Simplify thermal_of_for_each_cooling_maps() with scoped for each OF child loop
      thermal: qcom-spmi-adc-tm5: Simplify with scoped for each OF child loop
      thermal: tegra: Simplify with scoped for each OF child loop
      thermal: sun8i: Use scoped device node handling to simplify error paths

 drivers/thermal/qcom/qcom-spmi-adc-tm5.c |  7 ++--
 drivers/thermal/sun8i_thermal.c          | 11 +++---
 drivers/thermal/tegra/soctherm.c         |  5 ++-
 drivers/thermal/thermal_of.c             | 60 ++++++++++----------------------
 4 files changed, 28 insertions(+), 55 deletions(-)
---
base-commit: aef749dad7ff4c301e91b21fadf30776c1495fa8
change-id: 20240814-b4-cleanup-h-of-node-put-thermal-2268440cc6f7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


