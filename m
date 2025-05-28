Return-Path: <linux-arm-msm+bounces-59739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC0FAC71E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 22:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F28EA21427
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 20:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E17F2206A7;
	Wed, 28 May 2025 20:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ybb0kwwi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E4B220F55
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 20:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748462413; cv=none; b=NGTsFH5IaGEEVgAnDck17AeXptNbFPo6s+xBV7+UGofn0H+xbyVAlXVZB8A7GEWe8vfI6Sy8AEYyXtqFdfqzvr8Ozsi7BM7iDiw+hEYK/KmZh8zZdi2CtBnBr7TlFCU6DkDXYA9MJS5/upHnfP/O5e/d3ZVAvzw/sGsFIWIn1uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748462413; c=relaxed/simple;
	bh=Z9SxgzJQKUDvvpklxiiL0R/g7Mpc1YmBxkKUBnHBTw4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fUpr9+Ym7JwjwxYj1EvXUisGEXCQLDP/SsAY1a2/flA8+OQWlO/EeOiC892lvN6Isl/12wXFLZSJUjyhBGB6bDN0QUzlP421IRqJqINTfkSzaGFPLJXhIAXFhcgbvf2W8Zg1BHs4t5LR669eQSwcE+dPKLMP0Jf/O2UBEKIc+h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ybb0kwwi; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a4ee391e6fso13825f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 13:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462409; x=1749067209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VojE7/1d0sx/36NX9p5/dlSS3t9d1f2yOUDGBM4pW9o=;
        b=ybb0kwwi2Y+9glsj0rXv8xppUVtwxGEVyzj/M3Tfc6pWs2AV6fUiGKGhkdqw9HzBN0
         LFcORCMUAnKwTtTrQXKTObgY+O4WYR3gt7Odz7EFAy+d1XAdfkcGp23mYNBUJTRRGV/N
         TyHPHoZQ9MDPwgL2Rn/jxtDP8reVEsFfNPMA1/2D8fy2848n25qRJ4ME/f64+gMvOMLu
         E/wj+GgdOA5lmMRzWpSeqQBo9vDez55I6RdBy7igSIff7Q+YS5vSzoh0mXQHpRpHQkUJ
         SmHlq1fXqYroiaibJ48zUkf3J7s1UISwaRtF/sAhPytkPdc3M1+OPtUJoD0cgYD9KR3a
         21MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462409; x=1749067209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VojE7/1d0sx/36NX9p5/dlSS3t9d1f2yOUDGBM4pW9o=;
        b=i65TP83WaveP7hmzazCUAT5H75yKxjSYT9CjppNnzHrkh9dNpbSbqznEgnRLp+DhSi
         6RyAv3HVyfvqQ/KwN6n0IFGltWDn+IpW63FklmSzwpWSb43WvLseRJxWsmgGWDI+S8Ja
         are/4AgF6/WbRGdQMv3/JTG+AE1TuUa4hfWccC9sG/v2UxUGei37/41Xv8bVlXVojjmI
         VJwUdH/PqmJzFAt6QceAqI5HBtGsiJeLjeTz1WMCdpRmi2iT/AXcFGwdV05PF67tciGu
         u4PH7XqP+/xWFp+l2XauOJ2U5sLaoF8pDgfVzNX1D0Fxb7qh4/AbGuveRwJZjs3MfSs1
         jaLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWThWLfnBLgqSl/AE36eN0j63xWIVGIZB7RU1FHdwV9c2lJ0XekCCcfKiI/6UneOarruN7A1lcSMq81HXs8@vger.kernel.org
X-Gm-Message-State: AOJu0YxV0YBveiesbQVds8jR0kcyRau1qDX57N5qyvpWdPOr/4HB6mhW
	Vbc2ZD4H/Hau4MPJNpc0vH4M+sqKBkvPHMMN3NqInVXV5Qkhkp4FSkjFszw56oE5c+XBBoVjnkF
	aw7yU
X-Gm-Gg: ASbGncvS85ySK4ZzJUjAH6QYaOAyYNSK3u2CSmlsxn7tat4sgSCwDQHZ4PAgyQB8H8+
	32jkLCEfjZhxtH9DWCAo7bp3nA+/zA58g+wIaha9GFklpuTvj9tPXIqrgaIUb1rZlcAU/mpnpyY
	YgetHHNuYLA4IFI9ITbHCNdO+tkmLTse2D+ovWuIKXB4njXou7RLheJhUYUEK39I6kIHRGpfO+M
	mdmdQR4jXc4xSxf5I+XSxIPAoCx6Dc5XMxZPMNt0NS3GI/Xu22g3dCqlvRjZRezBy2hI6Z6Iz9V
	iR/MgXwR9hIuni2nbCh1i5CMTL6nJ/HrpO19bN2Glg26rPcWpphqL+6YEAJk+4Ym6mQVEuw=
X-Google-Smtp-Source: AGHT+IEpJWK04H1Jk2KDz14W33GOaHF4ef97VNekR7RxVVrRDyfOsdZQ8TpRKKVPiZWvjeGWp4YagA==
X-Received: by 2002:a05:6000:1445:b0:3a4:e482:ec77 with SMTP id ffacd0b85a97d-3a4e482f096mr1978591f8f.9.1748462409096;
        Wed, 28 May 2025 13:00:09 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44fcbd61553sm53347665e9.0.2025.05.28.13.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:00:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 21:59:55 +0200
Subject: [PATCH 1/8] ASoC: codecs: Constify regmap configuration static
 variables
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-asoc-const-unused-v1-1-19a5d07b9d5c@linaro.org>
References: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
In-Reply-To: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11915;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Z9SxgzJQKUDvvpklxiiL0R/g7Mpc1YmBxkKUBnHBTw4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoN2s9T7C7p3EFXVEu7vbd0VKKvStX3mTYGqviF
 zfaFYYh6cCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDdrPQAKCRDBN2bmhouD
 1+m4D/4zCtHkWmOUd+xtdQvuOdYkXQyr9ErCPsRRonOTbYo8OT2BekoBNsyX6yQIFayV8RjrDc7
 HMKEsPwff11fxyCPRo9nEG0MhFBedpLBypjJJR6s94LG7gm99lrtZrlrQJHVGTmSf1/bt+SYtiD
 2JmoX4ND99VQ2iJ9GVrApj+/M/Oyiy8Jxb2ET9Cwm8iyBwgIJQKdBN3p22SAS3PQRPGuDYANl6y
 E5PlQCxrlOpTfRPR8ieo3c4KMldAg/phYnnPuoDCsT2glQn68J+Yf8sOmvee257U9539xqeMmRF
 Y1zvg5YA/6Azhmvvrq8QwID+pDluLiANMzTZMXDbjkQUsEG3BzM4mHG7pWpJ8r44YYtYri4mgyb
 jom9+J+c8yPkURdEGIgLUVZj4ciXyMTFn4kBMmKHOPkj3YNiEYI6MtqEsqhL+1aQ5o+9lSNu6qc
 Yz2LngzoBGXK6jNCULmmAzqk7R4m8PU5Lvtx0PvOuKU+vBXOg+gPVnEDnYEVWDjiPro3vzx4x6/
 60eN2wec46edNviz46FVueQz+PR1QEH7UYyvQjmy4LWF3n/aCRcLExbPLRiYwBL8nkCpUWZIGoL
 TPRDjKLc+PDgn6Q8y2/AS0YmNAKxM+wq885w6ocDeiLYMxWy/FeqElt+ytae235hnhOhMf/+jEe
 KQ1WZqNJPTrGZCw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Static arrays/structs for regmap configuration like 'struct
reg_default', 'struct reg_sequence' and others are not modified so can
be changed to const for more safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/cs35l36.c        | 2 +-
 sound/soc/codecs/da7218.c         | 2 +-
 sound/soc/codecs/da7219.c         | 4 ++--
 sound/soc/codecs/es8375.c         | 2 +-
 sound/soc/codecs/max98363.c       | 2 +-
 sound/soc/codecs/max98373-i2c.c   | 2 +-
 sound/soc/codecs/max98373-sdw.c   | 2 +-
 sound/soc/codecs/max98388.c       | 2 +-
 sound/soc/codecs/max98390.c       | 2 +-
 sound/soc/codecs/max98396.c       | 4 ++--
 sound/soc/codecs/max98504.c       | 2 +-
 sound/soc/codecs/max98520.c       | 2 +-
 sound/soc/codecs/max98927.c       | 2 +-
 sound/soc/codecs/rt722-sdca-sdw.c | 2 +-
 sound/soc/codecs/wcd938x.c        | 2 +-
 sound/soc/codecs/wsa881x.c        | 4 ++--
 sound/soc/codecs/wsa883x.c        | 2 +-
 sound/soc/codecs/wsa884x.c        | 2 +-
 18 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
index b49c6905e8727d7c07fd10e668507ca07bf2cff5..b60697ff7a506dccf3dba1b01faa985761bbbc42 100644
--- a/sound/soc/codecs/cs35l36.c
+++ b/sound/soc/codecs/cs35l36.c
@@ -129,7 +129,7 @@ static const struct cs35l36_pll_config cs35l36_pll_sysclk[] = {
 	{27000000,	0x3F, 0x0A},
 };
 
-static struct reg_default cs35l36_reg[] = {
+static const struct reg_default cs35l36_reg[] = {
 	{CS35L36_TESTKEY_CTRL,			0x00000000},
 	{CS35L36_USERKEY_CTL,			0x00000000},
 	{CS35L36_OTP_CTRL1,			0x00002460},
diff --git a/sound/soc/codecs/da7218.c b/sound/soc/codecs/da7218.c
index 5f2f67e3bd29240acfa0d53a0892c8e92f711c1f..a7539e1a18939683558accd207b57324a1ce6aeb 100644
--- a/sound/soc/codecs/da7218.c
+++ b/sound/soc/codecs/da7218.c
@@ -3033,7 +3033,7 @@ static const struct snd_soc_component_driver soc_component_dev_da7218 = {
  * Regmap configs
  */
 
-static struct reg_default da7218_reg_defaults[] = {
+static const struct reg_default da7218_reg_defaults[] = {
 	{ DA7218_SYSTEM_ACTIVE, 0x00 },
 	{ DA7218_CIF_CTRL, 0x00 },
 	{ DA7218_SPARE1, 0x00 },
diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index 3958e88a244563c81b373cab38bc221fc8ba795e..221577574525a5fd60180a4441331d7db88f50e2 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -2312,7 +2312,7 @@ static void da7219_handle_pdata(struct snd_soc_component *component)
  * Regmap configs
  */
 
-static struct reg_default da7219_reg_defaults[] = {
+static const struct reg_default da7219_reg_defaults[] = {
 	{ DA7219_MIC_1_SELECT, 0x00 },
 	{ DA7219_CIF_TIMEOUT_CTRL, 0x01 },
 	{ DA7219_SR_24_48, 0x00 },
@@ -2443,7 +2443,7 @@ static const struct regmap_config da7219_regmap_config = {
 	.cache_type = REGCACHE_RBTREE,
 };
 
-static struct reg_sequence da7219_rev_aa_patch[] = {
+static const struct reg_sequence da7219_rev_aa_patch[] = {
 	{ DA7219_REFERENCES, 0x08 },
 };
 
diff --git a/sound/soc/codecs/es8375.c b/sound/soc/codecs/es8375.c
index decc86c92427c0c61a1531fb0fed1d9b853449d5..d12b3dc9e1f7fc03b8737e6b001b44c0d51c1b93 100644
--- a/sound/soc/codecs/es8375.c
+++ b/sound/soc/codecs/es8375.c
@@ -619,7 +619,7 @@ static bool es8375_writeable_register(struct device *dev, unsigned int reg)
 	}
 }
 
-static struct regmap_config es8375_regmap_config = {
+static const struct regmap_config es8375_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = ES8375_REG_MAX,
diff --git a/sound/soc/codecs/max98363.c b/sound/soc/codecs/max98363.c
index 950105e5bffdc2c7606e10e7af6f3cf97ece5b4c..fd6830a7579d4860c8bc4fdd26d05698834ddcc2 100644
--- a/sound/soc/codecs/max98363.c
+++ b/sound/soc/codecs/max98363.c
@@ -14,7 +14,7 @@
 
 #include "max98363.h"
 
-static struct reg_default max98363_reg[] = {
+static const struct reg_default max98363_reg[] = {
 	{MAX98363_R2021_ERR_MON_CTRL, 0x0},
 	{MAX98363_R2022_SPK_MON_THRESH, 0x0},
 	{MAX98363_R2023_SPK_MON_DURATION, 0x0},
diff --git a/sound/soc/codecs/max98373-i2c.c b/sound/soc/codecs/max98373-i2c.c
index 56c4ba1f37826f279df4007b0de36fa932257b8f..f58b8c8625a7061fc9564c9f84dd95d77df33b72 100644
--- a/sound/soc/codecs/max98373-i2c.c
+++ b/sound/soc/codecs/max98373-i2c.c
@@ -23,7 +23,7 @@ static const u32 max98373_i2c_cache_reg[] = {
 	MAX98373_R20B6_BDE_CUR_STATE_READBACK,
 };
 
-static struct reg_default max98373_reg[] = {
+static const struct reg_default max98373_reg[] = {
 	{MAX98373_R2000_SW_RESET, 0x00},
 	{MAX98373_R2001_INT_RAW1, 0x00},
 	{MAX98373_R2002_INT_RAW2, 0x00},
diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
index 6088278e6503dc7ea743ccc439cd6365c7475017..43b52bda6ad5297d856123aa515e0019f4866097 100644
--- a/sound/soc/codecs/max98373-sdw.c
+++ b/sound/soc/codecs/max98373-sdw.c
@@ -26,7 +26,7 @@ static const u32 max98373_sdw_cache_reg[] = {
 	MAX98373_R20B6_BDE_CUR_STATE_READBACK,
 };
 
-static struct reg_default max98373_reg[] = {
+static const struct reg_default max98373_reg[] = {
 	{MAX98373_R0040_SCP_INIT_STAT_1, 0x00},
 	{MAX98373_R0041_SCP_INIT_MASK_1, 0x00},
 	{MAX98373_R0042_SCP_INIT_STAT_2, 0x00},
diff --git a/sound/soc/codecs/max98388.c b/sound/soc/codecs/max98388.c
index 99986090b4a63a9759763881f3004d0e509e53cd..076f15a9867e13527324354cd6364ade3bca4846 100644
--- a/sound/soc/codecs/max98388.c
+++ b/sound/soc/codecs/max98388.c
@@ -18,7 +18,7 @@
 #include <sound/tlv.h>
 #include "max98388.h"
 
-static struct reg_default max98388_reg[] = {
+static const struct reg_default max98388_reg[] = {
 	{MAX98388_R2000_SW_RESET, 0x00},
 	{MAX98388_R2001_INT_RAW1, 0x00},
 	{MAX98388_R2002_INT_RAW2, 0x00},
diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index 76296176f9486f72a9d6077a0c69a475e277ed88..a8a282ff9fc5abfbf6c6bdc7fc209ed15bda0cfd 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -23,7 +23,7 @@
 
 #include "max98390.h"
 
-static struct reg_default max98390_reg_defaults[] = {
+static const struct reg_default max98390_reg_defaults[] = {
 	{MAX98390_INT_EN1, 0xf0},
 	{MAX98390_INT_EN2, 0x00},
 	{MAX98390_INT_EN3, 0x00},
diff --git a/sound/soc/codecs/max98396.c b/sound/soc/codecs/max98396.c
index c1888cd83dbc6fe2d418012dc1a9b1c58c3ded86..4b4e1fc98a6da5bf3a713133ce974b2f09161ed4 100644
--- a/sound/soc/codecs/max98396.c
+++ b/sound/soc/codecs/max98396.c
@@ -16,7 +16,7 @@ static const char * const max98396_core_supplies[MAX98396_NUM_CORE_SUPPLIES] = {
 	"dvddio",
 };
 
-static struct reg_default max98396_reg[] = {
+static const struct reg_default max98396_reg[] = {
 	{MAX98396_R2000_SW_RESET, 0x00},
 	{MAX98396_R2001_INT_RAW1, 0x00},
 	{MAX98396_R2002_INT_RAW2, 0x00},
@@ -174,7 +174,7 @@ static struct reg_default max98396_reg[] = {
 	{MAX98396_R21FF_REVISION_ID, 0x00},
 };
 
-static struct reg_default max98397_reg[] = {
+static const struct reg_default max98397_reg[] = {
 	{MAX98396_R2000_SW_RESET, 0x00},
 	{MAX98396_R2001_INT_RAW1, 0x00},
 	{MAX98396_R2002_INT_RAW2, 0x00},
diff --git a/sound/soc/codecs/max98504.c b/sound/soc/codecs/max98504.c
index 6b6a7ece4cecc3d114da276faf859c8176955300..c94142768c818228aae8b90c636cfd6b496e9859 100644
--- a/sound/soc/codecs/max98504.c
+++ b/sound/soc/codecs/max98504.c
@@ -35,7 +35,7 @@ struct max98504_priv {
 	unsigned int brownout_release_rate;
 };
 
-static struct reg_default max98504_reg_defaults[] = {
+static const struct reg_default max98504_reg_defaults[] = {
 	{ 0x01,	0},
 	{ 0x02,	0},
 	{ 0x03,	0},
diff --git a/sound/soc/codecs/max98520.c b/sound/soc/codecs/max98520.c
index adf5a898c6df5b10661861f6329ca54db6445f1a..2bf8976c1828210d2e6106f08e571df650640606 100644
--- a/sound/soc/codecs/max98520.c
+++ b/sound/soc/codecs/max98520.c
@@ -16,7 +16,7 @@
 #include <sound/tlv.h>
 #include "max98520.h"
 
-static struct reg_default max98520_reg[] = {
+static const struct reg_default max98520_reg[] = {
 	{MAX98520_R2000_SW_RESET, 0x00},
 	{MAX98520_R2001_STATUS_1, 0x00},
 	{MAX98520_R2002_STATUS_2, 0x00},
diff --git a/sound/soc/codecs/max98927.c b/sound/soc/codecs/max98927.c
index 55cc18451a2d26e0ad72031d5017d68c215240ef..0e9b8970997cf6485a775a3187b1470f93b5c057 100644
--- a/sound/soc/codecs/max98927.c
+++ b/sound/soc/codecs/max98927.c
@@ -19,7 +19,7 @@
 #include <sound/tlv.h>
 #include "max98927.h"
 
-static struct reg_default max98927_reg[] = {
+static const struct reg_default max98927_reg[] = {
 	{MAX98927_R0001_INT_RAW1,  0x00},
 	{MAX98927_R0002_INT_RAW2,  0x00},
 	{MAX98927_R0003_INT_RAW3,  0x00},
diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index 609ca0d6c83a1f28c73a0981f2a8f857816e5eb2..70700bdb80a14374321d1d8d8744356484ac01ac 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -147,7 +147,7 @@ static int rt722_sdca_mbq_size(struct device *dev, unsigned int reg)
 	}
 }
 
-static struct regmap_sdw_mbq_cfg rt722_mbq_config = {
+static const struct regmap_sdw_mbq_cfg rt722_mbq_config = {
 	.mbq_size = rt722_sdca_mbq_size,
 };
 
diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index d9b61eab029af3d4782620ee017fc84fbd26ce0b..342d1f7d5dee3ac2d703e5b5602aef9ca2987158 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -275,7 +275,7 @@ static const struct regmap_irq wcd938x_irqs[WCD938X_NUM_IRQS] = {
 	REGMAP_IRQ_REG(WCD938X_IRQ_HPHR_SURGE_DET_INT, 2, 0x08),
 };
 
-static struct regmap_irq_chip wcd938x_regmap_irq_chip = {
+static const struct regmap_irq_chip wcd938x_regmap_irq_chip = {
 	.name = "wcd938x",
 	.irqs = wcd938x_irqs,
 	.num_irqs = ARRAY_SIZE(wcd938x_irqs),
diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index 6627d2da372206eff879f8f3bd5fae9ddc0757d7..d479521a6d504ee45797be8ea99206a4b1787f73 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -202,7 +202,7 @@
 	SOC_SINGLE_EXT_TLV(xname, reg, shift, max, invert, \
 			   snd_soc_get_volsw, wsa881x_put_pa_gain, tlv_array)
 
-static struct reg_default wsa881x_defaults[] = {
+static const struct reg_default wsa881x_defaults[] = {
 	{ WSA881X_CHIP_ID0, 0x00 },
 	{ WSA881X_CHIP_ID1, 0x00 },
 	{ WSA881X_CHIP_ID2, 0x00 },
@@ -346,7 +346,7 @@ static const struct reg_sequence wsa881x_vi_txfe_en_2_0[] = {
 };
 
 /* Default register reset values for WSA881x rev 2.0 */
-static struct reg_sequence wsa881x_rev_2_0[] = {
+static const struct reg_sequence wsa881x_rev_2_0[] = {
 	{ WSA881X_RESET_CTL, 0x00, 0x00 },
 	{ WSA881X_TADC_VALUE_CTL, 0x01, 0x00 },
 	{ WSA881X_INTR_MASK, 0x1B, 0x00 },
diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index f04d99c66f332e18fe4c201f78360416c1607466..13c9d4a6f01537e448a5595f489c1716eb2053f2 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -572,7 +572,7 @@ static const struct sdw_port_config wsa883x_pconfig[WSA883X_MAX_SWR_PORTS] = {
 	},
 };
 
-static struct reg_default wsa883x_defaults[] = {
+static const struct reg_default wsa883x_defaults[] = {
 	{ WSA883X_REF_CTRL, 0xD5 },
 	{ WSA883X_TEST_CTL_0, 0x06 },
 	{ WSA883X_BIAS_0, 0xD2 },
diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index fd6ebc25fe894a5981df4e39d10d0f27d21c3a25..07d8a2645404ec49d4b12297d79bbddbe2950a4c 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -899,7 +899,7 @@ static const struct sdw_port_config wsa884x_pconfig[WSA884X_MAX_SWR_PORTS] = {
 	},
 };
 
-static struct reg_default wsa884x_defaults[] = {
+static const struct reg_default wsa884x_defaults[] = {
 	{ WSA884X_BG_CTRL,			0xa5 },
 	{ WSA884X_ADC_CTRL,			0x00 },
 	{ WSA884X_BOP1_PROG,			0x22 },

-- 
2.45.2


