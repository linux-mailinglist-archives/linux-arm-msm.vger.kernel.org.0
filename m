Return-Path: <linux-arm-msm+bounces-55641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BD5A9C8AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 14:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 304A81BC0811
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 12:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90BAE24A04A;
	Fri, 25 Apr 2025 12:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="jIPlfXVD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8193A23644D
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 12:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745583192; cv=none; b=GOKdT79+GsZ3XA/tjT0OedN+XI6/EhIQYYm+xb40hnUnWE27JjyZORVkbAiyeMaROIDUaRq/Fv8noNMq+9/DTy2F+N7C9gaJZzjRpqIQRcjo8ES8uTlADuz9lQJfB1FqssMsdQM5HAGNOH9BITkS7KcslxVjgQ7eNAxJ59Jnzis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745583192; c=relaxed/simple;
	bh=rRwu95YslMvsu+Rcci0u60kslf3hBNp6JZwo6cIo4nA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s4Dl8T+jXN9dBqXVZ6tpGsURwn0ZanAQgg6P9T1pj9UkHbwgReLwxEhfiGpd809HsXaKpo6Pcweet/9iKKI7lJLwSoVi7vlatWq6L5TpE4gaJSk0VDpSYlCV9wqek+pbV1VBLJxpBfBQbsKVOBA7zfGPcU9LMYhRIc+YuynTVYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=jIPlfXVD; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c266c1389so1536694f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 05:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745583188; x=1746187988; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=apngPycupGnScx91Binexdmj4p7UqvtJ5aGetoMuRI4=;
        b=jIPlfXVD98j8Z3PTCcP/WbO/TdBp4An477h9fCT3eyRM3RA1X5ZHCIJv8IEObpOY+h
         Oun8kEAdCElZAb0/asUD9iu7EXgqt1rzCEbxz2Z/9O7cCVutJHwsrnSK1HNTOOLS8euQ
         Gb4BFu1jYOfeOBnriUVNmTEpptgv8SxntS/nhbWN9WEatx/1YAbxnHlK2lXr7Nxzlfh2
         WVC1HBONt7++P/EGp6NlfsQ1LrOTPgmtzd+jWTrzwAPc53kyQgqRIfw0/tHAlSlazHew
         fTZO7VaekqNJPmbTNgcCsngCduUNCyeoS8Yf9ZpEnB7AdcDR7L+LUmPdwaMROSdD5In/
         3XIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745583188; x=1746187988;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apngPycupGnScx91Binexdmj4p7UqvtJ5aGetoMuRI4=;
        b=NFcd65xOTRl6+pp1FmAPPulMx3qwCAPclIVGxc/DD5tTpKAJstNt4YlOUASwMZxa9i
         uDG28RBswUQeqsVwgfLx9GZrQwmF8JQxTcjA9joDgvOIB3r0h9Q2w3AhzJ6jK4agdnO5
         CeGipCFhk73G3LXjaOQOzWlc6Smvrv/0vvd8XamZnbf9T2HtiVHfaOUDvrhAbbxdmFmE
         IISiqrpXUAbeKD3OR/P0N1uika86d4CDpq6t9PhSonYOd5pweOCq8ImJ+NkuRULAfvZV
         He+4LncHRMIZOIIHkLDSv1tC7xs+gGqmVQiaCw1UNohpK1bjkZ+10KHQu0cndAVnOP84
         YNuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCZjd+ddQxfVFXT3w065421PLsJDOoQtCAW3/gnqYdAKkYAlk9oDVSj4mFUDAU1pWl2rdn8nQTeMHJWsY1@vger.kernel.org
X-Gm-Message-State: AOJu0YwecxEm6zuYiq/M44hYe5qQqBnLjUfN98NwjWEjMmr4OGXFJUFI
	O+VL7qhH1T5kjk1I8GicR0NQZ3mMyJocJF0WJYuHz04S5i+qsX+7Xdlx6UcC3g8=
X-Gm-Gg: ASbGncvXvA3ccc5Az4EDtmCOxaPjl9b8X9k2LJ2uxKdnVauk0mAbEgCQeMFVBj9zV9g
	0tAqgjHH/a6T/rg9lXuO0xQzDGQ/kMuS9tMm5cVS4RvlyAKM+ROt5Q6gUVkcP04yZxUs90iZYpU
	Sz7rnVNI2a26pbIBtOtWGMKWu24um7xAi0MzRzd4XG4DgrmkjDbaapPlSpVuIDf5MwwHfy567Zk
	PcOoaKYL30pTcCBW7ku3WVsgwMOvt5rOsHW8g1ZPhs5zri+RbJDyDCpkNwB0zXccECZJdj+jJm8
	LBYdoUmxzEi3rResFCd30IYqlar0F4PnS69naKvStPzdMosay4PQuNorzq4zav9mggk5FGA5R92
	4Y7qaT+Z46Xre97FIct+Gj0QrmzWTZKZ0wsEjOlGLVfWIT1IQX6iiIOhj
X-Google-Smtp-Source: AGHT+IFMnL5Y8LnDzduEntxEZZxc1p4leSZZCUul64oK8/Sk8x9QSKK3+zlLR+4iOPsIDWxwNHw62Q==
X-Received: by 2002:a5d:64a4:0:b0:39a:ca0b:e7c7 with SMTP id ffacd0b85a97d-3a074f151d7mr1473277f8f.36.1745583187809;
        Fri, 25 Apr 2025 05:13:07 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46501sm2147310f8f.73.2025.04.25.05.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:13:07 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/4] Add *_wait_val values for GDSCs in all SM6350 clock
 drivers
Date: Fri, 25 Apr 2025 14:12:54 +0200
Message-Id: <20250425-sm6350-gdsc-val-v1-0-1f252d9c5e4e@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEZ8C2gC/x3MSwqAMAwA0atI1gZqNCpeRVwUjRrwRwNFEO9uc
 fkWMw+YBBWDLnsgSFTT80go8gzG1R+LoE7JQI7YVcRoe12yw2WyEaPf0Luipoap5WqGVF1BZr3
 /Yz+87wfp1I/pYQAAAA==
X-Change-ID: 20250425-sm6350-gdsc-val-a0162752854f
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

As described in the commit messages, keep the GDSC configs aligned with
the downstream kernel.

For reference, this was checked using the following code:

To: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht
Cc: phone-devel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index fa5fe4c2a2ee..049fcbefba50 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -402,7 +402,7 @@ static bool gdsc_get_hwmode(struct generic_pm_domain *domain, struct device *dev
 
 static int gdsc_init(struct gdsc *sc)
 {
-	u32 mask, val;
+	u32 mask, val, tmp;
 	int on, ret;
 
 	/*
@@ -420,6 +420,14 @@ static int gdsc_init(struct gdsc *sc)
 	if (!sc->clk_dis_wait_val)
 		sc->clk_dis_wait_val = CLK_DIS_WAIT_VAL;
 
+	regmap_read(sc->regmap, sc->gdscr, &tmp);
+	if (sc->en_rest_wait_val != ((tmp >> EN_REST_WAIT_SHIFT) & 0xf))
+		printk(KERN_ERR "gdsc_init: %s en_rest_wait_val mismatch: (new) 0x%x vs 0x%x (reset)\n", sc->pd.name, sc->en_rest_wait_val, (tmp >> EN_REST_WAIT_SHIFT) & 0xf);
+	if (sc->en_few_wait_val != ((tmp >> EN_FEW_WAIT_SHIFT) & 0xf))
+		printk(KERN_ERR "gdsc_init: %s en_few_wait_val mismatch: (new) 0x%x vs 0x%x (reset)\n", sc->pd.name, sc->en_few_wait_val, (tmp >> EN_FEW_WAIT_SHIFT) & 0xf);
+	if (sc->clk_dis_wait_val != ((tmp >> CLK_DIS_WAIT_SHIFT) & 0xf))
+		printk(KERN_ERR "gdsc_init: %s clk_dis_wait_val mismatch: (new) 0x%x vs 0x%x (reset)\n", sc->pd.name, sc->clk_dis_wait_val, (tmp >> CLK_DIS_WAIT_SHIFT) & 0xf);
+
 	val = sc->en_rest_wait_val << EN_REST_WAIT_SHIFT |
 		sc->en_few_wait_val << EN_FEW_WAIT_SHIFT |
 		sc->clk_dis_wait_val << CLK_DIS_WAIT_SHIFT;

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (4):
      clk: qcom: camcc-sm6350: Add *_wait_val values for GDSCs
      clk: qcom: dispcc-sm6350: Add *_wait_val values for GDSCs
      clk: qcom: gcc-sm6350: Add *_wait_val values for GDSCs
      clk: qcom: gpucc-sm6350: Add *_wait_val values for GDSCs

 drivers/clk/qcom/camcc-sm6350.c  | 18 ++++++++++++++++++
 drivers/clk/qcom/dispcc-sm6350.c |  3 +++
 drivers/clk/qcom/gcc-sm6350.c    |  6 ++++++
 drivers/clk/qcom/gpucc-sm6350.c  |  6 ++++++
 4 files changed, 33 insertions(+)
---
base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
change-id: 20250425-sm6350-gdsc-val-a0162752854f

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


