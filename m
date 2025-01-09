Return-Path: <linux-arm-msm+bounces-44509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EF6A06D20
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 05:36:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 694881672E7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 04:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11AFD2144DA;
	Thu,  9 Jan 2025 04:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cDnBa5KN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0220B2144B6
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 04:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736397364; cv=none; b=dAFXBnp+NZQsCU6j9TjGLtmNiFuZW4KVrtuNgInjBlcQkWpzcx4Ezeub8S1ipwDhNkO3m9FiF/HDbJ4IzE3rzJ92oquIEjse0PIrcxOpSld4pQDrG1GwocBiRhlF6kn010Arf0dc8lPszkEqkyrd3fVW8E8ikTTo+tMIC15FoZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736397364; c=relaxed/simple;
	bh=Weli6Ud1pnhnVMQNhXbarzN29phyH4B6NUF7IDp6kk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kHZjLWm8ld39lDKP9GZG8WieqlNdFgXw/YBbRew/KbO5rCXT7D6KASocixL5ZdkMWf5wpPDFTDAY7q27UTDagXO18sqXBbOWYast/2lebDbY0U6IzNFHhZtFfb2GIQx3rjVZ9ewi7PzHMxwygG7iwV8WRInhuaeCuxAvGnhKAEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cDnBa5KN; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso509574e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 20:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736397360; x=1737002160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lOzuf/LkISp9KTJoorQzqPXBIv79BHB/w9fYq6gMhqs=;
        b=cDnBa5KN9Z0q3M7Vf2CiIOCBxwkmQg/Z9fMDEhiQBW4ZJ0/4H8i0Txh5OID1ibvoqM
         VlVyljmnVf/0v+VSK0IrgD6Jy0PBq84Vo/5mvMdRA0O7HUY2mxr6cIcKVJEVxXZCjT7o
         mx+3qQW6QPL3cadZ3RJfPgp7OHLbBIy+J+zTu2F2dmmJq/INtCbt5yU4H7gkuvpRXQHj
         /AsQLuVlPxFKmWusu7sFP5uyyjBwQPJhuY4SdRJEARtxpGdZhmCHlqQIl9Wa5dlafrRa
         IWebD6rZKAJDyHrEDziImCh3HoJZrss+4A9JFY5sKFgixNBv3HgFMZmZ+fdKPR5IlsNx
         f/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736397360; x=1737002160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lOzuf/LkISp9KTJoorQzqPXBIv79BHB/w9fYq6gMhqs=;
        b=h+M68MX+eKKXoqz2dbSCqStHeGe8wKKZMsC4jWR4vGwvvF9yhB1MRikfWZjHy25ZL3
         o04fKQQthYzgk7GBqYtaDak7NJlwN/vs8DVqIBycT+eMjW+2lB+9mV4vYx0th8t7yGoC
         ayoQRnucW8GaFAlEQ6v8f995zYzsdO7cdSjNfAv8aJlHZGCVmprxCXjsbTsW6vd0Xe0K
         zWGLqrhSH/D14b3lLmAr54qHssemNI7moBIGfe73blk9wgTX1v1yAe4kc5o11PWq2xbf
         aaAQ8BE5adgdtqvup/x8fZx1jW+A+Q6fn9DBGWJaEU1gvuTtFEP1kabO4Ml2eKQcQ/PG
         0vuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZOgSb7twLceTHxUxVMajz2cHHSgQrYDddbI5bwIJiv/9eH7/kWmUizVzE+VvzschkGmCVSselsCN0u7F3@vger.kernel.org
X-Gm-Message-State: AOJu0YwVp8aVNrhYpyrEI8WojhUGKbCXAgJzb+hC80D99B9CPy0IjJip
	D8PmcxmQswn5aHWWCMX5GpcGy0YJhbJNtBSHlfVlB3CnOjxKzvpT37eyE6YiHqM=
X-Gm-Gg: ASbGnctlYuJhCfpilrPf4AsJvgLnU3swZQiBvmJ9CKaEEetJ4NcDqdZLB7AU5KTjNsA
	XSBjU/IYeZG7fBqu4XoXiITMrDuZf12MRYMUnP3kE6+qnPnk+xf7/NCEuhDuDpxLXJzNfuqpsD2
	d8S5LnOMD3cIcPU971ybEKEiUW7vHixpYU0poQ8i5qVoot7p39uNlqMNruUOTxRwR2BaUe0M6p/
	Wjc/KBlYJLBaJ6NWokI4AZQdo8WvWLlr+b/3qCnmos00XurCCXWmLO8fogrzA4GJmQQJt8ojhKC
	xHGxAh8ycPkN5+z7MEkmQKJM
X-Google-Smtp-Source: AGHT+IHs3R+5B1+LBttE+o7iirut3LHPZTq8vF+yRZe/KNbZaBYwfnKQ9/7DTDyxEbPDhjk7vysLQQ==
X-Received: by 2002:a05:6512:690:b0:53d:e5c0:b9bc with SMTP id 2adb3069b0e04-542845c05f5mr1136490e87.50.1736397360155;
        Wed, 08 Jan 2025 20:36:00 -0800 (PST)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00--782.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::782])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec06e1sm73866e87.191.2025.01.08.20.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 20:35:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 09 Jan 2025 06:35:48 +0200
Subject: [PATCH v4 4/5] nvmem: qfprom: switch to 4-byte aligned reads
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-sar2130p-nvmem-v4-4-633739fe5f11@linaro.org>
References: <20250109-sar2130p-nvmem-v4-0-633739fe5f11@linaro.org>
In-Reply-To: <20250109-sar2130p-nvmem-v4-0-633739fe5f11@linaro.org>
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
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnf1IkACTJK3+cbEVvQiLITbU/iuCdV9QIf923Z
 +4gR8kMz82JAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZ39SJAAKCRAU23LtvoBl
 uCbOD/9y3o9U+3IKjSZHvf0PVEnBIh5ablg36IJ6zcIvPqMEWb9e/IrHB9i/hxb+Ndi5oOxY96A
 a+o0PchHna8jfEfQOdlO4sX1ZFDR4rXEN9vlq3js96XRsbeyE6Qj0uD+4Z6wkmDmi0Ux19uAGkd
 zaHC8mfrito3xE9Rke3bivnJz620TW0eTAWBHOiICk7NjV4KpVXYK6b1vpLoiAAT60JDdihI69A
 ZaYdPtj61kHUVrhD0+Z1WNixvu4pfropDa7qA1gSpdn+GChXJONzjKrq2SZCPkhRmhcm6SRJ1vc
 mQTQMILV9ZQzc3Apqn82tZKXwQ/0amgx2fOxQngAPQW1YsloCmN8Zq/PY19mtrDH7uwMIE8h9PC
 nzhkXRumB61iQVYiKbZ1MzHPv1xGX8oB8zzT2XuLBNDnF2anv6GG9Km2ucqC7tCaYXSu2lQBejB
 hJkVsmm3JNVwiGkNQ4GnU3FdWly0eLEItkFC9IGM61wTITSCa7QV5dDpaYaJpl7lzYz61oABBct
 5RTQkxajL9rDkpdZ0vFEycIpfQbWVGs3KDZ3J/sprYSJlZAljWVrgqpkvHstnAZpVqzN+PQMtTp
 SX3834e1v1is/rP1Lndu+/hQR8MOEUnyBMlCRXbrhqBSMZdCR3DNZpsHFl/X8ElvGlOrTLMKA7u
 xF5aUi3mvdjawDw==
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


