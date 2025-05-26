Return-Path: <linux-arm-msm+bounces-59419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CED56AC3E0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 12:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50DEA189737C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 10:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A861F5838;
	Mon, 26 May 2025 10:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rU0L5bMV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FB51F4199
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 10:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748256606; cv=none; b=YQWbMjRurgnBlnNENIJCnfQw1d6wFL7EBw1B0mIrQdmnypnU+MqjEtH4HCykg36LgKJL9zV6IzGydiUpCG93pi9o8Khv7LfdGDPIyWrpx3HbA0siufusAxUBZB+viJRPd6WfzqptOIE8oS55XFrNXMTpkj3cRqM+c5qWHYjDRKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748256606; c=relaxed/simple;
	bh=WbpB9upkv3/HDk+JtSehQw0Ct5NABTO0UPSvKkYXBgE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AAo1RkH3VvJCcVVrVnHTcQD97M/64nV2cqW3fmlg/XinzPloYGETXMm1btYBDPUW7FITO0XpoB0k/5QBoYDHNEkH6nvcA7BchYSwU/X7Y/q/HcU99tXipjoCWkUPaK29oiac8FGTP851fh5qDu4TNt+l+4rkAUaEvhWHyoH8g8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rU0L5bMV; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d72b749dcso3633165e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 03:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748256602; x=1748861402; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r4lITYVXHPG+JFCrFUyQZsYC0j5Z3JlSEM4hag1CnWg=;
        b=rU0L5bMVA/9qcPQVPhAiyuvTxnIQOYPgLYOEV9oZz+9qyrlsl8d3dhewne4+esXoGR
         i5RGVGswwh2itHz0qgfTVuQrz6nr3I/itdBlrS3kmJpntZAmnNA3onl036GivDzqcEgF
         xFz+aMf2QQNZqN7Mo8IzLPaefaHtvbxx6up3ymRCfgOsHxYn98hK6kwHtFfDojPe9HJL
         yl7iODrfeaY4Ycqx5HTm5m89hg1QeLmrCE4mrufzdIVSrmb6FXLR5XHKJhO4YnkAzN7Q
         jNmeUbh8XNG/8RaV+aivdGB2qFDuoiq0st2VVIfEV6oKKFobxnBGgBAxteOWbfE4Jj8q
         bFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748256602; x=1748861402;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4lITYVXHPG+JFCrFUyQZsYC0j5Z3JlSEM4hag1CnWg=;
        b=ZZkXy0FzDF6HRE+z8cerzb7UmA/i3hSpwOKJ3eX2171it9H0TRzdEo55TiWXnssGrl
         Xh44duc0Qpo/aJVi+IigCnVPeSkxQ5NWiuNLE4KZ5meOe73HdU9LqSZp5HlWRDC4bNPt
         vH7VQvWeMW1Uahd83X93rlbgMqLkLQteZXyXMBX2lOv+zbBnAt0NFoYLC0B0U2ANh2GL
         DR/uE9OzB7mWB+RmXa1fsRg8hihrCXlip4PFhLONJektOFC+gvuxKqKfdPMFdUuZ+Q6M
         FHhDHzMUl1kCSweIdX1jxgbYIo0Jq47tCUP3ZdxcEIGof6z7y7MD2WLx/yCwitnDdFwI
         CA1A==
X-Forwarded-Encrypted: i=1; AJvYcCWi+VAucXGTzSKc9e2hjwojE6r1GXkACCBlu7GlOInB7iOIcgEWygt8l5DtKbIti4Abnis31GSuMM2nJKHf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy51s2TV901beraM00GtZf9/celrlYMeuXPYI+R7JmL2h+Y+Ukp
	9FyxEI0gmflzjjnAtihlG3k2e9HNHHbv9dm3eTRajl6Me04EamwyAtUfSmPyym5aNoY=
X-Gm-Gg: ASbGnct2nIG86i31mMlH6r/o30LamSgqkUVNw/MmMSFOqt8CgEI68VsqCX919juTbKe
	wQ09DCvGmoUAWIKqZG+jGowWQQ94MkPtPc6RvmaCyqz8XDmiDim0qsm/CqOOngrweObP+t6daoZ
	gWuYkPMm/HEkDuYdWJgfNmFheYz21bZecIHa9kWMvAkAgDzrcIKamuxk60BFD5DU1uOUAlyrbgZ
	OtOOKyOj+QSYBm33+Z6mjkgTPED/R3eYCun4qAxZ+moluQ8nkP7iVfFKsl1aPuNHz0+vqS/WrfE
	0Yb3CfZZUR3iDch3hpauxs/AFbDbSmmMG4NejZQVG7bYoSNCeOe9Dr/D9hVl4jbFc5LOi6g=
X-Google-Smtp-Source: AGHT+IFTCow9aqRgGawC6WRupjB7jYfRrQO5KpOeG1VtSzVc+AOaepEj65qG+3tyNe2uLXjkg3HTig==
X-Received: by 2002:a05:600c:314f:b0:43d:fa58:81d2 with SMTP id 5b1f17b1804b1-44c939c15b7mr24734825e9.9.1748256601649;
        Mon, 26 May 2025 03:50:01 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d4b68sm236337215e9.23.2025.05.26.03.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 03:50:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/6] ASoC: codecs: wcd93xx: Few simplifications of code and
 extend wcd939x
Date: Mon, 26 May 2025 12:49:49 +0200
Message-Id: <20250526-b4-asoc-wcd9395-vdd-px-v1-0-64d3cb60313b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE1HNGgC/3XMyw6CMBCF4Vchs3aSXihSXsWwgOmg3QC2WEkI7
 24DC924/E9yvg0iB88RmmKDwMlHP4055KUAenTjndG73KCEMsKoCvsSuzgRvslZbQ0m53BekUl
 eta5174SCfJ4DD3494Ft7duDnK/vLOX75pvjF//gHhoK4KrWtB0vUJAntvn8AYg3uasIAAAA=
X-Change-ID: 20250526-b4-asoc-wcd9395-vdd-px-ec173383bd02
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1586;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=WbpB9upkv3/HDk+JtSehQw0Ct5NABTO0UPSvKkYXBgE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNEdR7qFvr6UL1ZKTX3h/FDIAzezQEzI4GYoa2
 L4h6FAFDLuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDRHUQAKCRDBN2bmhouD
 1w1ZD/9MVoUXjC9vO2SEnpFp8EXEhxpV1ONhPJ6ST2hcJMe1hbdgGCKoOaN64U9Yr9d0bAEVvxR
 FbiX2DxbctoAxw4NhIA5XumxqO2mQoE0RZPqNWVyZ1P+EJw73qjQOIK3AaSMcWom6Vprh+Om7Jl
 ccO3YbuMTwJacvJMz6UV4AEuC9zWp/pc52b0Kpb6TLR9xQwrsSwISF/9zJdzrL6Hz+mdtmKHGbN
 PreHzQAPbqJAXIcPvdr9YpsxGU3W3u0shKAnJiIAtYNHMDVjisj/8YsgRidBZ2FHbWQD0Zq0Sdz
 nSVxOWgUpgoeyAwCElaSZb7wsqDm5w7H5TctZXUTu5zAKb7IO0ZB1Y0rC+8vC+BWH/JqPAJdyiT
 MSjODoEyLNpEZW8CokmtSr5vMLriSCZUZ5E6L/L2LLtdm73VLEnw/CDEtuEOWv10E/9UN3StNB9
 UGtimW4YwJ3u/qqeuNjFclZbZBmYYosOv9GGxsBezyDHZ6cl1HZ/tvIPMAyl5SAfX8h+eWk4sCm
 Qg08A85sGt0lBCpPy+HuiKhnzMM4Oe35hn3XleMS5etsx+FRLUyaqHg4z6yclFLSc9WRdxxAPH3
 3hGOoTL9nmLUVxXFq4TDwMS4DV6/vnwHP+8mTbnPv4ZMYYxEGUEyh8oD4G7ZQz9KWHFTYsk5Uag
 vUoAi/jyY1lo1fw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Make the WCD93xx codec drivers simpler using
devm_regulator_bulk_get_enable() and obtain missing VDD_PX supply on
wcd939x.

Context depends on fixes:
https://lore.kernel.org/r/20250526-b4-b4-asoc-wcd9395-vdd-px-fixes-v1-0-0b8a2993b7d3@linaro.org

---
Krzysztof Kozlowski (6):
      ASoC: codecs: wcd937x: Simplify with devm_regulator_bulk_get_enable()
      ASoC: codecs: wcd938x: Simplify with devm_regulator_bulk_get_enable()
      ASoC: codecs: wcd939x: Simplify with devm_regulator_bulk_get_enable()
      ASoC: codecs: wcd939x: Simplify return from devm_gpiod_get() error
      ASoC: dt-bindings: qcom,wcd939x: Document missing VDD_PX supply
      ASoC: codecs: wcd939x: Add VDD_PX supply

 .../devicetree/bindings/sound/qcom,wcd939x.yaml    |  3 ++
 sound/soc/codecs/wcd937x.c                         | 31 +++++----------
 sound/soc/codecs/wcd937x.h                         |  1 -
 sound/soc/codecs/wcd938x.c                         | 35 +++++------------
 sound/soc/codecs/wcd939x.c                         | 45 +++++++---------------
 5 files changed, 34 insertions(+), 81 deletions(-)
---
base-commit: 3717d2adda1ad07b4ecf3bef144ee489cc1563a1
change-id: 20250526-b4-asoc-wcd9395-vdd-px-ec173383bd02
prerequisite-change-id: 20250526-b4-b4-asoc-wcd9395-vdd-px-fixes-0ce64398f9cc:v1
prerequisite-patch-id: 104000f7254b9cc81be49af9ca584544718e52f1
prerequisite-patch-id: 230fcd1b712c5a3199e7c9d8250e98e5d55c0a40
prerequisite-patch-id: ecdbe74955eb7b710f72af1e3cf32ccac52890d5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


