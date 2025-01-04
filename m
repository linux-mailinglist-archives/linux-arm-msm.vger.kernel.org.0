Return-Path: <linux-arm-msm+bounces-43933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F25A012B5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jan 2025 07:20:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 144AF18845AA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jan 2025 06:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB8B16E863;
	Sat,  4 Jan 2025 06:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AJVjP2qc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A8215D5B6
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jan 2025 06:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735971569; cv=none; b=jAU1MS7ghE9c0KkRT39qx5eOk0HD2i2MjEOZg2ygoDJaZMRzYhJ2/1Gz72ZDuwt5FVlWkJyxHFl+J3Byn6TxLRTl4bL2XeSZ56v5k08+pKi412CIKlQEgB0qRSwKmkx+orRXLsjtrinx6LMoQsN2G08YXiExO6O8xnEdSG5hwps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735971569; c=relaxed/simple;
	bh=Weli6Ud1pnhnVMQNhXbarzN29phyH4B6NUF7IDp6kk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AFfIixzRh5rds7OcgzM1WSYgbo9zvZYsYre3WjSSxDU0sjHQ1huiQw8w6bmpGkKcrCBGJVfQf9iclJaH4BEl8PHev50WHOPn5S3Z1zJA5JFx+Oh/ytB/1HGc1a+QbIrcDkBiaJCIlM7gT9iXVLls73itMjqLk0f61Qwu626sJbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AJVjP2qc; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53e3a5fa6aaso15301554e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 22:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735971565; x=1736576365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lOzuf/LkISp9KTJoorQzqPXBIv79BHB/w9fYq6gMhqs=;
        b=AJVjP2qcw35zsLvKYw80NFqEfwLDwQmm4MKq/S+OMI2lT16kuNqMHMcCXlPMz9bZs3
         +jem+LoJJ/a9bJFBVY+S/Y/vWz1L7aoIxpKOrwe2/nkp9k4//UzHiPMEyGcWqURLjuYQ
         ZaZwYnUYk0vuCjzjXiQY5xCqP02LUPNWR80VwHuETIBVMekhYm3G7KmaosuFQ4qMkWmq
         q7t0SJwaw3Bg2mwul9pqBB12VpNk6t1P4uKviT8NSftBqz+ifvHhfr1IuOce541VkTIc
         6NxE5L3NnZI/Qo9agDEy9bDO529i+efN8q5qtxdu+mcdGb5lQqW50relfCIR4Bv9AU/e
         sCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735971565; x=1736576365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lOzuf/LkISp9KTJoorQzqPXBIv79BHB/w9fYq6gMhqs=;
        b=P+c2tMY1pqUk84n3pUp4c5XPUbMtkO/mOLRUSDUlAvBU3UnmQZSo3d7m729dh7LxUX
         k3vNnMAy7J5nTx/cq7xjpkt/rxlU3AKw0V09qPpmgmgYHLQTjftTgUpaRPQnOls2pr/S
         quM1IDhi00N9DoatHNIubPQlTw1pSj1PKQtv64B8CnbgH13V0utz1EBWH/GB0ZFgQI0M
         EaQ7ZMlqWUQnh/+s+HJ19V7E4RQtW2vh0dSprBNhfvnovJHz1/RIza6ulNrSbHdyztjz
         IzLRJyGrI2skcNPxuVzkJEXFBuWap8czBgwhH2YsnUZChP9gVlKsLhb2biKkqOjPbvs5
         Ul4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXOq+CzWww2D831pESpBuCCvV3xMYfzvKl8ugTEqOengKBOVi9jMIZcp3xBoVttuwTVqCWyumz9g/hmcDTC@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs8WalvKaPa2NKZUUwr77Zpq7kW5Rg3nNuf5R4Ar0odmPB66vD
	EYDo0JBizMgwsIOeidwh5v2gw4aI2aF6J4Ui39CtvgAaiX3RlE9xbNZnEOW59JA=
X-Gm-Gg: ASbGncs1XV/VK5LnnO9Te4VIZ+wjg//DPv5lPjNZW9jmIaSonYDuLacO3Jai4R70KJ/
	o8SDeT/3OxmSlkjo9BLFp8/98xuw8EMZnO8kKzVJymFF0yYiVgBnW8GfFZorX0qPcEyONhHM9O8
	o8Jb2aZnzZZPdvUn/v6jIPqb2J05fhMDlQ0lU5jW6WkaPGX7GHMvu5WkZRfnqeJeBnteD6XOq8a
	6BMEUN2pd56eG8hc+vEHgwkR5upnOdluG9dlWOE2MnuoLim/gWg9pPaGCa9rqbPWjVnru3CitJs
	9Kuj/tF/67QOEyNUOC8e9rRj
X-Google-Smtp-Source: AGHT+IHL2VelCgNOIT9/FMsBwJLg9t+d4xtQTqvnLPBHV2vCq6f/LkoocSVFDCMc5uLGfONiqmFJZA==
X-Received: by 2002:ac2:4c56:0:b0:542:1b97:3db8 with SMTP id 2adb3069b0e04-542294256edmr14830575e87.5.1735971565446;
        Fri, 03 Jan 2025 22:19:25 -0800 (PST)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00--782.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::782])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832c1bsm4261655e87.280.2025.01.03.22.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 22:19:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 04 Jan 2025 08:19:15 +0200
Subject: [PATCH v3 4/5] nvmem: qfprom: switch to 4-byte aligned reads
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250104-sar2130p-nvmem-v3-4-a94e0b7de2fa@linaro.org>
References: <20250104-sar2130p-nvmem-v3-0-a94e0b7de2fa@linaro.org>
In-Reply-To: <20250104-sar2130p-nvmem-v3-0-a94e0b7de2fa@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2302;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Weli6Ud1pnhnVMQNhXbarzN29phyH4B6NUF7IDp6kk8=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBneNLh+pWuyicpF7JwINd5cxvcSYzG01R6FRlle
 hKcTcxue62JAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZ3jS4QAKCRAU23LtvoBl
 uFQ1D/0eitlPWKeOQfigM1W6o1iU/oO/yWjCv7h42icKzawH7fw+evIC35b3Pfv+UhxQYvlPoI1
 ZYKMgZUFDXU0RArciTtvD5hhjevdOSY6MgQL113UCgDlxfGs/djsxIxj5m4sUKIs3fyZUGjmgVW
 TajAv26H8istC0y7hfpfwa4ogk2pq5xdv17p+uBWBMDUjAbRxub5N1zA2kYUHHIIqcWo2YdHo56
 gexH/TQ03jxOiKdnAyyTGDn+EscyiOe+sOeoHkXjJObaaeSybCWTKmaYs+WQCKBTjNq+0eGoepj
 Lcz9qH7Tv/ZXb+JB5sCJSi3jRqBhrR1Pepfsmdx7DmQjYa58sy4DGS0blg6qfQLeRBcPkt/dns/
 ZFwoV0z2Th+mgLHBlYwmTpix1YEn3v4Fpm1clqsDqQQImH5pZIuJsJ6LCD2ciVa7kEU2GtROobn
 rFGtVFG/M29Wq1bzNOga/5BPRnXFQmcF74KEaBwWRxfewSqeWj+t4P+w0TbVSDtFSTMqIUK/VkR
 N6u50Mu1gE5wZV/xUGTIqbqzwMjLfb0zdM5MnKiuS0OU0FPt5BvCHKr+ZT3W7JqsqnkhF3l1GKa
 AnQDGIlK3OmtDoyNDGgxj4DofIlpNseoNg9TFxP9HTVR4kwPI9seli/hgIHxqXpf8Wzje7ZJygu
 ZHRfUV574Tt4T9Q==
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


