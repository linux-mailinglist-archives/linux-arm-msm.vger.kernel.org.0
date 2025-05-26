Return-Path: <linux-arm-msm+bounces-59415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B13B1AC3D3A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 11:47:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E39E7A8542
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 09:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221651F2BAD;
	Mon, 26 May 2025 09:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vxPG5II0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A469B2AE77
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 09:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748252833; cv=none; b=LVs7wOirL532GDZfbhntq5LDtVcys8iZuUBDXBWcnHWOL+M7Lmr3fpqvr0Xrs3rMtL4z2qSjG+8jEk8mXzLEhcxTqgPc6oT2eErywrimsLutpVOHtX0Uh8GidNiJRklhNEnWoin49AjKXASRCizGFMF8cxtepkMRJWSVDElwX68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748252833; c=relaxed/simple;
	bh=q0igmy29T5cqsXeOzow8vBumEs2OCd1PVoRcoLTa0qs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HDDNLXvgrsyo6WEfn0uCkJG6dt59V9Z73k+hSdNzvXfvo9+Ft2RwBw0luW9vMUBM0iV5A3N9Z5bXDhYwzR7tix3Jq/GLQMN8wjMM9zKLHejeorhKqIqJrYcEFHxexYNnGOBV2xIXHbzZdC9ZxOCF+Sf7Af2mReuqqWH0oYIKF2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vxPG5II0; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f6f86580ecso449359a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 02:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748252830; x=1748857630; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=49mzIXIbUg9/sbxQ9V8WB0remcCyh30RG8vamNFa78s=;
        b=vxPG5II0K5GGWrm2QGBMMfVQNaZ74a69an3g4uBzdopsoFTDn0F+CGFQqtHk54C88e
         Bm+l+IoLJKTZXtgWUeFtQwaPbs5Xvzz7tRU7rPHjMHMwb3KCXHP0UxLXI2kcI1bHMROp
         ptOweidKs1EfgEY+klp11gYBK6I/aP6njd/fcBWJRh9wgsKwlItNtZJJXX06JGiex9BK
         mEuIzsoD227BpmdZb6SO1jfAKgJIt+jlZgW6c0b1bzbzaOYsPfe/44oGcT8BQI6oBU74
         ns/rQ2MR66vNJ7n2EkAenOIHgZrVMPFbwJrkxUcWH6KLhmxqOk/DVK6xzwZ+/jJEEQgF
         +4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748252830; x=1748857630;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49mzIXIbUg9/sbxQ9V8WB0remcCyh30RG8vamNFa78s=;
        b=MEyEYCGC/nabGzGOA4MasTVwNjKLN85AfAqZeNrrsyDqqOzKZ4tbo+n/MPIyJm3E+t
         7hMdcIT/VvMRHGrrcNV88Q3mHNKeNtwAZBAZQ+2b9j/vfnD4vszcAtGQwErig0NO0QkN
         dRlydwJhNMEXHPl/UHyRIaQCQt+2pzBqN+M2dezjgymJuj+9cqqZsckWb1Bav2w27Vy8
         Er8YZn4E8HmWitpKBigAfrLnInoSfzp3mqC0OKoKJ9C6tMM2GZDlcxlk4O7S+3VCBbJh
         R4pTN7LfDTSd5+VhZ1yFmmxLvcFsGEwLqtNqTbeFk8wbmOl5ROoJ/4a9EGBqSuBh5QZD
         7IXg==
X-Forwarded-Encrypted: i=1; AJvYcCU8kzH+Z20/x70Dgsb76QRKFAqLv50WeSsNcQdfqKftufQdmSH3VD9DVlw3yKEIvmC2GaiF6HZ9SMQ5mHlj@vger.kernel.org
X-Gm-Message-State: AOJu0YxooERaFvu1jkiL/64mam5GAAO1+tqX4sjKoJqUJu98U9NFxl9/
	9Ai1UEVWwh8FoRU4KKC6e9gAQK1SNAXm75X1xWmnk4ow0MHqQNULx+kcxh+A3ACacCk=
X-Gm-Gg: ASbGnctkOjvTTkoeo3zbrpsRRN7LrnXpLacivK5nF55EC0fFsrPUsalm3028B52paTn
	UwSTC6WaBWgeY8FONxKUZABXNlak/B+GbRLFa6OhJ2+fVrCmuMM5oLV8Z302/oLjjl9k8+8e2vq
	syUQw2Ff1way5frfBbWFmIPr5eat04QI4750DcoWFil3akVx6reV/MT7tdOjNplEzpLccUMz3Pj
	3EHUApdfpzd+z4fx2jnnGP790TvJsL+666NFVmJX8hBd1hncAe1CVlfHS5yUdd2EUJZPjsnGOde
	k0zNMW6478mLZ2kriLyI7/C2vQj8UdRlIN5wvzVmAxbJ7FVA8Fkzdhy2/VQAmI7/IXPQLwU=
X-Google-Smtp-Source: AGHT+IHXvV/1VYbXCn71QNdgxNScSE32Hrh2MnJXJ0Q2abRbSBYC/mH0p19MS/lXgPI3Zwd/7uYDqg==
X-Received: by 2002:a50:a416:0:b0:602:ef0a:c4f0 with SMTP id 4fb4d7f45d1cf-602ef0ad306mr1923311a12.7.1748252829840;
        Mon, 26 May 2025 02:47:09 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6049d482cc7sm1486427a12.19.2025.05.26.02.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:47:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/3] ASoC: codecs: wcd93xx: Few regulator supplies fixes
Date: Mon, 26 May 2025 11:47:00 +0200
Message-Id: <20250526-b4-b4-asoc-wcd9395-vdd-px-fixes-v1-0-0b8a2993b7d3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJQ4NGgC/x2M0QpAQBAAf0X7bOscJ+dX5IG9xb6g20LJvztqX
 qapuUE5Ciu02Q2RD1HZ1iRFngEtwzozSkgO1lhnnK1xrD4G3QhPCr70Do8QcL9wkosVDXFdlb6
 ZPBGkyx75D2nS9c/zAithIx5xAAAA
X-Change-ID: 20250526-b4-b4-asoc-wcd9395-vdd-px-fixes-0ce64398f9cc
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Vinod Koul <vkoul@kernel.org>, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=667;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=q0igmy29T5cqsXeOzow8vBumEs2OCd1PVoRcoLTa0qs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNDiWrNVfO9hk5kUsim01ULGU0+Z/jNzmp0FC2
 QBYKH6q/mWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDQ4lgAKCRDBN2bmhouD
 1znZD/0ZlpFsHTGO14T4wqmoq9LHrVSO2sGQ4x3HeV4pJZuJSp0I/qhDc3tBusrqHotPvIbS29Z
 6ldbrdC7TdbIHXJs6INFHRjKKWW8OTY5iDylzOfkfz9xnIstjHMvNFiQdtwxG94/VWdXHdFLbqF
 6wYc3dzgiLBgWyAE5FVesakB3T9O7DapkKsD9vD9/T/fGH4DfNqlO0R5t+uLSiMTVeU+FKvvxis
 +Clu1Ooywbr6+EthobwkuOWRt+TBIZIvrmGFGTD8uaxhs4zNkiZk2DjB99esg8ZTOoCvSyhP0ka
 GbQEeCQyDKziDdSKQozoTITdPT4QYb65ktyTKH7sSh+9BJbK4nI8WQ3j+rUYt9UcRicfX65Xor5
 n4xSs0EBumpOG46YwEmCABcrFWT6hTFvgsenIgUK6HUm42QL0skq6sCVtOtCH9W271AQQOVBScK
 fvMqRIQ5c1GjOfYOEHzUEpKzYZiUm8n4BDKDqbBucVzKQNjBgwLRxj2rskQVmBoVjvLF59CjsTw
 xUaCPQiKetfsl3OEPaxVzuyfFE+KD4Jf816cSRrL/ghA4GWMcwXGeMDZhuQTfO8FMDRalNa5YxK
 W21dSP9aHJS9A0NORQcBt+EEkymrdbx/gPZuqW3sy4LEHJGmOHtqNI71dSpIX3lHkYaJHDoZYb4
 VrD7GZYoYSjmm8Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Fix cleanup paths in wcd9335 and wcd937x codec drivers.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      ASoC: codecs: wcd9335: Fix missing free of regulator supplies
      ASoC: codecs: wcd937x: Drop unused buck_supply
      ASoC: codecs: wcd9375: Fix double free of regulator supplies

 sound/soc/codecs/wcd9335.c | 25 +++++++------------------
 sound/soc/codecs/wcd937x.c |  7 +------
 2 files changed, 8 insertions(+), 24 deletions(-)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250526-b4-b4-asoc-wcd9395-vdd-px-fixes-0ce64398f9cc

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


