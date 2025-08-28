Return-Path: <linux-arm-msm+bounces-71150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99198B3A521
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 18:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 853B83B5668
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 16:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E16C239E9E;
	Thu, 28 Aug 2025 16:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0aYQIyRt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F8A201269
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 16:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756396823; cv=none; b=M5Z/gfD+UAwTsUQvSblq83iEh8cPwVnDFy3OI+42dnJeJup+c9XYIruB8K84rRW5cDql5/8tJDW+q88aHa+oGiiIjAGwulEFLqhJefFwwMG3uUmZip5V3vVlcZjnPRfopvAo8EmM466v/fwtN/UViIippbl+vEPPGL8TZirNMCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756396823; c=relaxed/simple;
	bh=FCHL/kjtWeV0+j9xlgMQg6HU/vJCfHILk378t4N4z30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ct/jX+vve4aJqLTNfbmlQPrFz/W9hcCP6YATo/Ur1I5FU4+rGFpRg+djo4bLXZIbF2lViAqGxYr6YzJJ+ag4PYL0D/8S4EqbHxOUM66NzR8TpSONCOmF8B3Uq0ZIWctI+GfZd5JK/cBn96uzLQU1GalZktC5Kdz5enx4eerPNoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0aYQIyRt; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3cbb0df3981so536061f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 09:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756396820; x=1757001620; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jWxB7D3jJyBkITTYt/u8P0qX4HLXnEbcjEWeuCzP8c8=;
        b=0aYQIyRtnm/jNBmzZXViV7QZOtRQjvom2hK4NujkaTV+2rqBdHDf8dhlPZZQSKVIYe
         6wjBvhxi+VL1MC7uFMrcuoy+l9I7tqeaLnMM7jhYbEPFS6shv9KueT1Mx8xrTpAk2FpQ
         nkYhezbQzigqtJY7Xx5SX2lmz4J3BRcjshH3u9ENP3p51/iS2+UVQmNjnUXVvp8XXoEw
         Vf5VbWwqD78qoBs8G0OYMD0jmWtL45rvgs4FoD5UOQ3yRTDhcT5DSzBshDTgwNtAJnDh
         ya0gR2wlAja/kzCVmA2146XrHWw2S6PSBRP5RGNjBJMbGNnIR91c04FQcm2su+9gPgGy
         cSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756396820; x=1757001620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jWxB7D3jJyBkITTYt/u8P0qX4HLXnEbcjEWeuCzP8c8=;
        b=vbbfaWNOU73PJBebOXEXknC2Pr2pPCGwb95VZIF8qDjchrBv7IV/mPNuhO5Zl6kHWV
         eO+QBuRS1l5BopE8IPjb/ANXcxRIi6Q9SAuW5h/awDzZ6VjCqFuOVJA7HF5bWBmwY8kL
         WW7cu/e6/qdPTCrNWe5mB2q8jxKQ7HrOihysN1WN+vbvv6q2d6aC+0FQU6x/LaXu9fIf
         bZUlYHTSNCmzAb4tjTt8zrUm2uq5Tz+a25rPQvVa2G/OIgLHKLnkcJDPf3Xzy+15cCQc
         tNUjMlWTLVMg1MWth5i8iJHI3RmFibZeO04alpUAk+V6m7hqKF5W22v9alvi453uvCXv
         Xupw==
X-Forwarded-Encrypted: i=1; AJvYcCVZ6z3+LR5dyXLDNutDfuK/ueygvpGpkLJ2ORA3GQTip25TV4TNvA3uJ6OKIblUkm6h5xVlOrWHcZIbe4Nv@vger.kernel.org
X-Gm-Message-State: AOJu0YzsoFr0nHfLV14I2buQTIAOqI9XwKr+e8vOzDy8jnMGb6uI7qvK
	auELKsWaQbQKW3UxhRmZ7WbMWThrKG0Dyz2H97XqWCJtltsE2VcACac3YdbKLmvFtg0=
X-Gm-Gg: ASbGncuvX8gMF1Mh//eQTpL0K+EukHasrB0EZ9X/18PJDIoXWH2tbOTtnruo4FRgXqz
	zTiV5XYs9C5kfiq8q6bF5J17lzT/AIA7QE7nFM5HAduAYK2PYSwVM0gGK9KzBSHdItJfx7qKajj
	Usm34zR02pU051opl4DuOxbBgeMLrjoRXoJLdpehiuaBs5i73NycpWHRyiLB1TDxEvqlKh6xu8O
	QJI68IdXEmFdNgQyrJp6VslspZUtO4ndv919oJGkbiXzRqJBPzfLOHOpXOHFJxbgxzM8QEI6gnQ
	SOOhKOcuaBZKX2fF9f7K0f1EPMsTQN/ctifMr5jQIkl3qD+zUFkx9FNfgo+7LmUvWNoHVncGqDs
	PysOSVPHNVUnqt2elY1yUUI4+JilT
X-Google-Smtp-Source: AGHT+IGxgL+toNcQZblo3toDDSWKpb6dbnh0R937eyOGP2RNV3U+4rRZ/V56bRaM+9Yqm9EW7dA7Gw==
X-Received: by 2002:a05:6000:178d:b0:3b8:d360:336f with SMTP id ffacd0b85a97d-3cc22e34cb4mr6129720f8f.28.1756396819645;
        Thu, 28 Aug 2025 09:00:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm80211675e9.5.2025.08.28.09.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:00:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 18:00:09 +0200
Subject: [PATCH v6 01/15] devres: provide devm_kmemdup_const()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-pinctrl-gpio-pinfuncs-v6-1-c9abb6bdb689@linaro.org>
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
In-Reply-To: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2111;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=yGM1a+aC0va5PQYzRl7VigwSABEcy8VUGQM8wt+k8EA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosH0M6t7kDqohITUHpArt8wxM4j/l0nGheDDz/
 lBgFuEny5+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLB9DAAKCRARpy6gFHHX
 crcbD/96BbYP4iAKgagx1b/SaoRaFXAC/EdEogLQkCvckdWVvEIEZ8Tcr1z720z6HyB9Ba31VkK
 eV5egMTpHafq/h0riC+6rAxWG3Yb1N/W+bFOh4kMVYLEP4i6IAEsBd9d9XUucbCaHWNolzNAw82
 KKUmo7USlAk0HC27fCTmsZZnqVRo1e8oWsvdTBS1A1+6PVPpCUSvm8ucDBKt8GmuW/iEtFk+zVu
 b+E6wZwWpt/ugBke2tciQKiYcaYz+BmGjgcg/giMss8x6aCa9LvzL/lM+jf0Hyci1OQ/2DEGscb
 XmSsXN1ycObeXq3vKKy+Ea9IqGk80HW/jaOM38tf8YRVVWwPk34YZuNAqtJb46r7OOTSfPm14/6
 2cW7KPby1U2qNtkIA6h33Dpoe+sVrnKNdSv3GL5K+/UYB9FJRAjQ5KwjtDLN4mgzhSMN0Tlg/mR
 7gu+PUHHkiTRA32ftkWqtc99guGN5R3eXkDZesJ6GxqMxW9BzbtLDo/EYtmtBSUyF2GwKSoNY4N
 ncnsxtMEjMPpqpcblxpETio3cmc/R16fhYa6nyINj58teXPUV+yzA3zyK4zNHhFsQJD5m+I1Yv8
 kObDI+zPGcSSuBJ8TtNtSrQsJjKKYZ68meo80Zv7c2jEmrvZbjqJqin3Iuc+Bew/4ZuXumx0Oak
 S/KoHAtfm3cEDcQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Provide a function similar to devm_strdup_const() but for copying blocks
of memory that are likely to be placed in .rodata.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/base/devres.c         | 21 +++++++++++++++++++++
 include/linux/device/devres.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index ff55e1bcfa30057849a352c577bd32f1aa196532..c948c88d395607ff511ffa6eb0a75b7847ab9239 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -1117,6 +1117,27 @@ void *devm_kmemdup(struct device *dev, const void *src, size_t len, gfp_t gfp)
 }
 EXPORT_SYMBOL_GPL(devm_kmemdup);
 
+/**
+ * devm_kmemdup_const - conditionally duplicate and manage a region of memory
+ *
+ * @dev: Device this memory belongs to
+ * @src: memory region to duplicate
+ * @len: memory region length,
+ * @gfp: GFP mask to use
+ *
+ * Return: source address if it is in .rodata or the return value of kmemdup()
+ * to which the function falls back otherwise.
+ */
+const void *
+devm_kmemdup_const(struct device *dev, const void *src, size_t len, gfp_t gfp)
+{
+	if (is_kernel_rodata((unsigned long)src))
+		return src;
+
+	return devm_kmemdup(dev, src, len, gfp);
+}
+EXPORT_SYMBOL_GPL(devm_kmemdup_const);
+
 struct pages_devres {
 	unsigned long addr;
 	unsigned int order;
diff --git a/include/linux/device/devres.h b/include/linux/device/devres.h
index ae696d10faff4468a41f37b5d5fd679d4ff11997..8c5f57e0d613492fd0b2ec97dd384181608192fc 100644
--- a/include/linux/device/devres.h
+++ b/include/linux/device/devres.h
@@ -80,6 +80,8 @@ void devm_kfree(struct device *dev, const void *p);
 
 void * __realloc_size(3)
 devm_kmemdup(struct device *dev, const void *src, size_t len, gfp_t gfp);
+const void *
+devm_kmemdup_const(struct device *dev, const void *src, size_t len, gfp_t gfp);
 static inline void *devm_kmemdup_array(struct device *dev, const void *src,
 				       size_t n, size_t size, gfp_t flags)
 {

-- 
2.48.1


