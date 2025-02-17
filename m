Return-Path: <linux-arm-msm+bounces-48244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A62A38944
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 17:35:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E65AD3ABF9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 16:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31033225792;
	Mon, 17 Feb 2025 16:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oGaecDA4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2FC224AFF
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 16:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739810024; cv=none; b=FYDEs6ntx3eDe8/XNV8PD4gzq7Rm9c8VnljZrVYfJP8pA5pN5ZXgcAEQqFmpuESvr+P9NGtRCJCtvGpeoLeUCmlMnFaPf6rZOlAQBp1VIFxYwQuxqB68x2oUjShQqOm0KyAUueFj1fZo7fryXQVTZcRvAAlpwyT7QFcW5nZMq8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739810024; c=relaxed/simple;
	bh=Weli6Ud1pnhnVMQNhXbarzN29phyH4B6NUF7IDp6kk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bBa7VWL79qh94942OtChKaKtsAiftNKaGzs8bnp9B3vvhlpjcABLgsSuzXuBmNvAR/rGYHYwuOtq/8LI99uWCMZzNxQb/L899pkWJ7uw/Gj7q3bhbFKxn1z928fnIw7YZeKcTYwjJTOQgwvMPNtPh3YVmIeE4Cw4vWyMo0o1Kv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oGaecDA4; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30930b0b420so18190561fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 08:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739810020; x=1740414820; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lOzuf/LkISp9KTJoorQzqPXBIv79BHB/w9fYq6gMhqs=;
        b=oGaecDA42/x9VyO56dlpj0BEff7MpruB4MAv+uQeci+Xlc7XCaz26XRGYj46R15OfJ
         EEpF6LodR6uC2YJ7e6MbMaiWDPuvH+HKG7n2rDvxqD0ei+A5CGPF1f8dChaaKR/UeDuZ
         nyefNvJJvwN/EkmYMJmvtaYMjo5Qe7cUfz4X12jC6OQ5VoAUuStKT7eIC9i42RZq+XLZ
         0KwBAI+IuqzpNy31nW4dXNSJNazpFaiMY75NXw2sXP0/TqHP3U/FANT+S0yyalJVuyTE
         R+Dpb8yn31Pbp96awPHHFg8axLZMJmnYnIVnKiQJD29NnM5JhqaUMDF/6zAwnm8U7Is8
         kYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810020; x=1740414820;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lOzuf/LkISp9KTJoorQzqPXBIv79BHB/w9fYq6gMhqs=;
        b=MFQneRjkTzGH96s3Pfu9KAymALV9usAv1cjXzhDtuPTmOfwzAEP1i4g+EEquGnZ8zv
         9+D/LgQGIOWVjn13mpOdd0j+JnZTHpsjvuJEwNeN0Y5NJos+IkINDkvPfgVNiHkuqPa5
         4DSIHLFzUQGH9EiUuEVEWpDBgcfVTjdxpb52KyrqbLTtwl0uSQa5eqC+JhvU2kiYUG+K
         B4sylzbK4608S6TiRpZGEuOgyY/cuinR3IfrZ+qmk5dTPm6g8k2wtHvPu7Azbb0fZOay
         lC5k+E0gLJha1tyObrm1hna+UomooUbDlVTdALDuI/AiUnS+2nhbCBS8/jTS1dovW5xZ
         rPGA==
X-Forwarded-Encrypted: i=1; AJvYcCWvScZ2N5h3jyLBYpXuodSXvUdWcDxb9vylQt969hXoptcu088giOkle2bLpn863y+BQL5Mxn780iO87wXb@vger.kernel.org
X-Gm-Message-State: AOJu0YzRL/dQyZMu/JXeVdyzB34W+0mf+JzrdMJ1uMyEYZpqxF4s42ul
	U80DFmWM+BgLn0VCL7Zswlj4bVhSWk8ML1pOIi0NMdgttSo819e92X58l92vxJw=
X-Gm-Gg: ASbGncv1njPvcHh3bGgde/4dao7f/sCdiBayu9Tx3qLVMqaKvDakzzYiYA8UTc28260
	Rgx3UbatkyzGVZ+IAQCpD4hqrcHoUQGxN4bmH4WNKXcKdnJvDk+JatUq8hHaycdF/5bzyEGlyLs
	chCcjebsCkPxgUGm82L5bLGalgdFBCpvp33LAj38mjg7CSm31mPR5BArnwq/KWf2SKo4QC7AgZ/
	O0x7RqnALpIoofzLCuUzgqav2NzGVXZt7d+KEssXK6Ks6Fs4CBsdyf1lr0OEXgEylbUpzRtrh3z
	zPp1SNLmCLugmGOaGuL7LqpEs4AR7fmnPclbKFRqlFEVsLe90nhta2xc7Uc=
X-Google-Smtp-Source: AGHT+IGIDtOFP2+bSYh/mhrfrW4NqVSHnZ5dGinaXXwTY0e6knbNZgSm7OMksnK3maAilj31D2fOfg==
X-Received: by 2002:a2e:7210:0:b0:308:f4cc:952e with SMTP id 38308e7fff4ca-30927a72098mr23385241fa.11.1739810020144;
        Mon, 17 Feb 2025 08:33:40 -0800 (PST)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00--782.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::782])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a2cef18d1sm5695991fa.76.2025.02.17.08.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:33:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 17 Feb 2025 18:33:22 +0200
Subject: [PATCH v5 5/5] nvmem: qfprom: switch to 4-byte aligned reads
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-sar2130p-nvmem-v5-5-2f01049d1eea@linaro.org>
References: <20250217-sar2130p-nvmem-v5-0-2f01049d1eea@linaro.org>
In-Reply-To: <20250217-sar2130p-nvmem-v5-0-2f01049d1eea@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2302;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Weli6Ud1pnhnVMQNhXbarzN29phyH4B6NUF7IDp6kk8=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBns2TSEqPikNYmi8q8gYeJniJgTWX3+m9/QROU1
 jibeXVol7mJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZ7Nk0gAKCRAU23LtvoBl
 uMHoEAC7JTtcprKualFbLDEYz0ZLnmBdS9s1aY6ScpflApOneIGCdgFh8r5RHCue9Dlxhf1PlzR
 g/1e/On5LZDovcxK7Piaa6tlTN1yr7AjVZt6l/+qe3McCPNTAh54pu80TJlhbdtwgeF8KL3L1OE
 DQFs4r+69FYZbMAL9omS+myH94hnOSA4/FFnovSkulO3ODRFEeZNT+4Shsls9u/lMdCRB6TkdQ/
 t8AutkJr8o60JOW+54SHl94w6Fyr32T8N9ZVd82xm6LlihzASy/I8eagL9H8YP5fGVT0OR8cpSJ
 l1DtIFpMoGWezZZCdskf+kAsxInYtqNu1yGcrj0Bflao5KHlpwwgbqKyGBcMocrm2Wx6vyuDdti
 D+N86w1mBxTr2iN136CE+HVx5UlojfKc82FSK6BV+5eeCztMijOlUfKSFyam8slyH6sicCCyGkh
 TzC5T615kkdaiA+ldrPJ1hMmgsrIOPwtZ0b9YkfZfl/0446dCTiKNIZCpbvliAqzOptxW8ZQTae
 MEPvyIjHm/NmDfj9ip2eyWeCN06NCXFsV4flcBEN49+g4q6rc2W+oAljnLJZT75LSMxLTeXO4iL
 O7W41b5mDHoyzh8GHZgQ88xULRjOqU0jgw3nDBH5VVzyajqtue3O5MGh/Mi5JvUISGGP0X2CWk2
 XqPfkyLdoQVkMWg==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

All platforms since Snapdragon 8 Gen1 (SM8450) require using 4-byte
reads to access QFPROM data. While older platforms were more than happy
with 1-byte reads, change the qfprom driver to use 4-byte reads for all
the platforms. Specify stride and word size of 4 bytes. To retain
compatibility with the existing DT and to simplify porting data from
vendor kernels, use fixup_dt_cell_info in order to bump alignment
requirements.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/nvmem/qfprom.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
index 116a39e804c70b4a0374f8ea3ac6ba1dd612109d..a872c640b8c5a558da9ea00e3804c904f8987247 100644
--- a/drivers/nvmem/qfprom.c
+++ b/drivers/nvmem/qfprom.c
@@ -321,19 +321,32 @@ static int qfprom_reg_read(void *context,
 			unsigned int reg, void *_val, size_t bytes)
 {
 	struct qfprom_priv *priv = context;
-	u8 *val = _val;
-	int i = 0, words = bytes;
+	u32 *val = _val;
 	void __iomem *base = priv->qfpcorrected;
+	int words = DIV_ROUND_UP(bytes, sizeof(u32));
+	int i;
 
 	if (read_raw_data && priv->qfpraw)
 		base = priv->qfpraw;
 
-	while (words--)
-		*val++ = readb(base + reg + i++);
+	for (i = 0; i < words; i++)
+		*val++ = readl(base + reg + i * sizeof(u32));
 
 	return 0;
 }
 
+/* Align reads to word boundary */
+static void qfprom_fixup_dt_cell_info(struct nvmem_device *nvmem,
+				      struct nvmem_cell_info *cell)
+{
+	unsigned int byte_offset = cell->offset % sizeof(u32);
+
+	cell->bit_offset += byte_offset * BITS_PER_BYTE;
+	cell->offset -= byte_offset;
+	if (byte_offset && !cell->nbits)
+		cell->nbits = cell->bytes * BITS_PER_BYTE;
+}
+
 static void qfprom_runtime_disable(void *data)
 {
 	pm_runtime_disable(data);
@@ -358,10 +371,11 @@ static int qfprom_probe(struct platform_device *pdev)
 	struct nvmem_config econfig = {
 		.name = "qfprom",
 		.add_legacy_fixed_of_cells = true,
-		.stride = 1,
-		.word_size = 1,
+		.stride = 4,
+		.word_size = 4,
 		.id = NVMEM_DEVID_AUTO,
 		.reg_read = qfprom_reg_read,
+		.fixup_dt_cell_info = qfprom_fixup_dt_cell_info,
 	};
 	struct device *dev = &pdev->dev;
 	struct resource *res;

-- 
2.39.5


