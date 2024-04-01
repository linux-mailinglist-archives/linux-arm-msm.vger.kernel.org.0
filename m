Return-Path: <linux-arm-msm+bounces-15915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A921589375C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Apr 2024 04:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9ABCB1F21711
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Apr 2024 02:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A7864D;
	Mon,  1 Apr 2024 02:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AocytEkf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFE54C94
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Apr 2024 02:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711939396; cv=none; b=rjwLK1TFKz5OjcyWzQIPFfjamHqawXyQDJOa31nOQQ1wERxnvgJaRSMqW/8EBSlTixra11u6fdBakdr8Yu0V2C8YB8hz80AZCWFEXZVQAisN0bgAEpIIvMsKYXKK3ZRESGUEd/fGFM08R+BkqsImUeXLQQ2aE8XiXBrb7oyEIJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711939396; c=relaxed/simple;
	bh=bb3yuUiX3AqVjthabgoHpdagfUyLmxzs5/YS5zjolCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WNBm7+V6w/jQFFyjW1S11OwgjG08CYXKX0Ym3oKAAvI6CzdblI+jBlrS9QE+eY20X6fbFb+KX3aYG1WaZd2QdJybQYuHhYNLVOuMer2IQI227a6CKSUO5BFfpgJAEa6JbY8i0G19fQzVZda3JqsYfhSNzupql+0MiUmWlyu+zGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AocytEkf; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-515d515e28dso1204433e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 Mar 2024 19:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711939377; x=1712544177; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N7TAxfMQCGE9bQxeXWfD3OmKDyREUTBr0vDdo4pZYAk=;
        b=AocytEkfrM8f8qFmeysvsTHfd2Cu3rLVZR+/gkmheGcyODWsqJF+Km7++DgPNPoPPr
         ve5x28cf8UPZgaNbRyi0g8cgW2sgFn5q5wSAFv7BGlFivBMlBRjpXWg3oq+8Q0dfSP5G
         IJY0BO8QSRt/Ei8BMvwZjUHijLTvxo/nNapfoVpsnpRvgvHK4s1p0ef0ZB6Jos2uRnjC
         LPWZIjJZOCJuqPZK4LhoJUsI7SmKjGcRoNejdzfia8hGJQzdebhet/qtmS60g/8AqEr5
         GTNULpQBy95jmCl5KPXUgkF6MKbuc3OFamiKAEPWWKR128AvzrFCiZLu9D3LY3vnTVLf
         dyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711939377; x=1712544177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N7TAxfMQCGE9bQxeXWfD3OmKDyREUTBr0vDdo4pZYAk=;
        b=KatYUqg9rv0Xj+S/1m3kaG+kCKKLi9C/u331HI29UqQRS5XcNG2qtDJnx3Nbp0epOz
         v4cSq0opBaPR2jjEhj8h5+D7md4LFjb5yfplcKsJCiuaiSf5mhjZdCfeYXH+/HiMGiMN
         KN53XDsnhPWpbX4DRxDcU9Bo+Y6S0m3N7E/tD/sSfB+1IcHPOy5Eq0lMWZ9bA9fPg0kF
         V6rqdHyK/MxiZzLKvmeTG+GuJsJgRdkkxS32K/6+Ou7hUmd8i7ERiTqLFKSyr5tuR+hu
         Utflq7XpcVexukPzZ0eQomAtwrpy+w85mW8aIoge5ptanhNZFRK+oqnF10WzHxeSRx0C
         OHzA==
X-Forwarded-Encrypted: i=1; AJvYcCWqUKF+34/dZCI3uSpj8jcJfQuLJ0DGt7GF2fcmeqdAQHvGSeZNVCFxPm8OZeBRJvPrKxRJIZTQzyPnBfOlJGtaYMFhUNo1MPTcHj0Xlg==
X-Gm-Message-State: AOJu0Yx3x6g7J6nSTGAGVp8yTDVm0AnrrCAXfcRwOmW0PMM2Ks+5r0fl
	OmpkSjnQf7v39BS8js6nKBwF5pilC9ls9pDJ6vwthco1Jli9xLuxDylfrLB+TsCfq3pyPFD/lQY
	p
X-Google-Smtp-Source: AGHT+IEmBfvbDJgeOg9vltngPdtAC6iZwxrWSeJAnBN7ek1oOPFQcd1wiSDwUkk2Lfpg2MV/LUxsEA==
X-Received: by 2002:a19:8c19:0:b0:515:996e:d20 with SMTP id o25-20020a198c19000000b00515996e0d20mr4739186lfd.32.1711939376488;
        Sun, 31 Mar 2024 19:42:56 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w28-20020ac254bc000000b0051593cfb556sm1310603lfk.239.2024.03.31.19.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 19:42:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 01 Apr 2024 05:42:39 +0300
Subject: [PATCH v5 09/18] drm/msm: import A6xx XML display registers
 database
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240401-fd-xml-shipped-v5-9-4bdb277a85a1@linaro.org>
References: <20240401-fd-xml-shipped-v5-0-4bdb277a85a1@linaro.org>
In-Reply-To: <20240401-fd-xml-shipped-v5-0-4bdb277a85a1@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=266702;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bb3yuUiX3AqVjthabgoHpdagfUyLmxzs5/YS5zjolCE=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxqXvNqhM0H5lx/zW5yNvXPRp1Horrbz7ofxb6UvFii0d
 9+RvVPYyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJeC1g/6cjrfZgh8mLTbmv
 6r4WzviXmxiQF7Br3u95DSo2spcevtl0nTG+LcHJKdmk3+xbje6xBpmXEad4zuyePnFNbcHFxTI
 /GbwN6wKb3Q+H92aIPNaRFV2tHB1+f6pw7/65D4zWcKuUO73Y7Ln1Td3ib8uEXlgekez5t9rrnN
 AXtyt1ceazWmbJf3dlcnqn8jTdlLnYtf5+6eq4kPgHKqeLLde/W6Ol9A+ooeSm2Cmne2qZNdppl
 rIs9p096YtOCOeJyb7bPzHSVNNA8OSRzJxDEaZ6+96Enq5M4jNYILn+VLW7WYCCmvzie3tvmW2L
 Mfk/MWqjx4SLgp5X9GdvElsa9edT1Yftry41/pl0VOYpAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Import Adreno registers database for A6xx from the Mesa, commit
639488f924d9 ("freedreno/registers: limit the rules schema").

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml     | 4970 +++++++++++++++++++++
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |  228 +
 2 files changed, 5198 insertions(+)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
new file mode 100644
index 000000000000..78524aaab9d4
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -0,0 +1,4970 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<database xmlns="http://nouveau.freedesktop.org/"
+xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
+xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
+<import file="freedreno_copyright.xml"/>
+<import file="adreno/adreno_common.xml"/>
+<import file="adreno/adreno_pm4.xml"/>
+
+<!--
+Each register that is actually being used by driver should have "usage" defined,
+currently there are following usages:
+- "cmd" - the register is used outside of renderpass and blits,
+		roughly corresponds to registers used in ib1 for Freedreno
+- "rp_blit" - the register is used inside renderpass or blits
+		(ib2 for Freedreno)
+
+It is expected that register with "cmd" usage may be written into only at
+the start of the command buffer (ib1), while "rp_blit" usage indicates that register
+is either overwritten by renderpass/blit (ib2) or not used if not overwritten
+by a particular renderpass/blit.
+-->
+
+<!-- these might be same as a5xx -->
+<enum name="a6xx_tile_mode">
+	<value name="TILE6_LINEAR" value="0"/>
+	<value name="TILE6_2" value="2"/>
+	<value name="TILE6_3" value="3"/>
+</enum>
+
+<enum name="a6xx_format">
+	<value value="0x02" name="FMT6_A8_UNORM"/>
+	<value value="0x03" name="FMT6_8_UNORM"/>
+	<value value="0x04" name="FMT6_8_SNORM"/>
+	<value value="0x05" name="FMT6_8_UINT"/>
+	<value value="0x06" name="FMT6_8_SINT"/>
+
+	<value value="0x08" name="FMT6_4_4_4_4_UNORM"/>
+	<value value="0x0a" name="FMT6_5_5_5_1_UNORM"/>
+	<value value="0x0c" name="FMT6_1_5_5_5_UNORM"/> <!-- read only -->
+	<value value="0x0e" name="FMT6_5_6_5_UNORM"/>
+
+	<value value="0x0f" name="FMT6_8_8_UNORM"/>
+	<value value="0x10" name="FMT6_8_8_SNORM"/>
+	<value value="0x11" name="FMT6_8_8_UINT"/>
+	<value value="0x12" name="FMT6_8_8_SINT"/>
+	<value value="0x13" name="FMT6_L8_A8_UNORM"/>
+
+	<value value="0x15" name="FMT6_16_UNORM"/>
+	<value value="0x16" name="FMT6_16_SNORM"/>
+	<value value="0x17" name="FMT6_16_FLOAT"/>
+	<value value="0x18" name="FMT6_16_UINT"/>
+	<value value="0x19" name="FMT6_16_SINT"/>
+
+	<value value="0x21" name="FMT6_8_8_8_UNORM"/>
+	<value value="0x22" name="FMT6_8_8_8_SNORM"/>
+	<value value="0x23" name="FMT6_8_8_8_UINT"/>
+	<value value="0x24" name="FMT6_8_8_8_SINT"/>
+
+	<value value="0x30" name="FMT6_8_8_8_8_UNORM"/>
+	<value value="0x31" name="FMT6_8_8_8_X8_UNORM"/> <!-- samples 1 for alpha -->
+	<value value="0x32" name="FMT6_8_8_8_8_SNORM"/>
+	<value value="0x33" name="FMT6_8_8_8_8_UINT"/>
+	<value value="0x34" name="FMT6_8_8_8_8_SINT"/>
+
+	<value value="0x35" name="FMT6_9_9_9_E5_FLOAT"/>
+
+	<value value="0x36" name="FMT6_10_10_10_2_UNORM"/>
+	<value value="0x37" name="FMT6_10_10_10_2_UNORM_DEST"/>
+	<value value="0x39" name="FMT6_10_10_10_2_SNORM"/>
+	<value value="0x3a" name="FMT6_10_10_10_2_UINT"/>
+	<value value="0x3b" name="FMT6_10_10_10_2_SINT"/>
+
+	<value value="0x42" name="FMT6_11_11_10_FLOAT"/>
+
+	<value value="0x43" name="FMT6_16_16_UNORM"/>
+	<value value="0x44" name="FMT6_16_16_SNORM"/>
+	<value value="0x45" name="FMT6_16_16_FLOAT"/>
+	<value value="0x46" name="FMT6_16_16_UINT"/>
+	<value value="0x47" name="FMT6_16_16_SINT"/>
+
+	<value value="0x48" name="FMT6_32_UNORM"/>
+	<value value="0x49" name="FMT6_32_SNORM"/>
+	<value value="0x4a" name="FMT6_32_FLOAT"/>
+	<value value="0x4b" name="FMT6_32_UINT"/>
+	<value value="0x4c" name="FMT6_32_SINT"/>
+	<value value="0x4d" name="FMT6_32_FIXED"/>
+
+	<value value="0x58" name="FMT6_16_16_16_UNORM"/>
+	<value value="0x59" name="FMT6_16_16_16_SNORM"/>
+	<value value="0x5a" name="FMT6_16_16_16_FLOAT"/>
+	<value value="0x5b" name="FMT6_16_16_16_UINT"/>
+	<value value="0x5c" name="FMT6_16_16_16_SINT"/>
+
+	<value value="0x60" name="FMT6_16_16_16_16_UNORM"/>
+	<value value="0x61" name="FMT6_16_16_16_16_SNORM"/>
+	<value value="0x62" name="FMT6_16_16_16_16_FLOAT"/>
+	<value value="0x63" name="FMT6_16_16_16_16_UINT"/>
+	<value value="0x64" name="FMT6_16_16_16_16_SINT"/>
+
+	<value value="0x65" name="FMT6_32_32_UNORM"/>
+	<value value="0x66" name="FMT6_32_32_SNORM"/>
+	<value value="0x67" name="FMT6_32_32_FLOAT"/>
+	<value value="0x68" name="FMT6_32_32_UINT"/>
+	<value value="0x69" name="FMT6_32_32_SINT"/>
+	<value value="0x6a" name="FMT6_32_32_FIXED"/>
+
+	<value value="0x70" name="FMT6_32_32_32_UNORM"/>
+	<value value="0x71" name="FMT6_32_32_32_SNORM"/>
+	<value value="0x72" name="FMT6_32_32_32_UINT"/>
+	<value value="0x73" name="FMT6_32_32_32_SINT"/>
+	<value value="0x74" name="FMT6_32_32_32_FLOAT"/>
+	<value value="0x75" name="FMT6_32_32_32_FIXED"/>
+
+	<value value="0x80" name="FMT6_32_32_32_32_UNORM"/>
+	<value value="0x81" name="FMT6_32_32_32_32_SNORM"/>
+	<value value="0x82" name="FMT6_32_32_32_32_FLOAT"/>
+	<value value="0x83" name="FMT6_32_32_32_32_UINT"/>
+	<value value="0x84" name="FMT6_32_32_32_32_SINT"/>
+	<value value="0x85" name="FMT6_32_32_32_32_FIXED"/>
+
+	<value value="0x8c" name="FMT6_G8R8B8R8_422_UNORM"/> <!-- UYVY -->
+	<value value="0x8d" name="FMT6_R8G8R8B8_422_UNORM"/> <!-- YUYV -->
+	<value value="0x8e" name="FMT6_R8_G8B8_2PLANE_420_UNORM"/> <!-- NV12 -->
+	<value value="0x8f" name="FMT6_NV21"/>
+	<value value="0x90" name="FMT6_R8_G8_B8_3PLANE_420_UNORM"/> <!-- YV12 -->
+
+	<value value="0x91" name="FMT6_Z24_UNORM_S8_UINT_AS_R8G8B8A8"/>
+
+	<!-- Note: tiling/UBWC for these may be different from equivalent formats
+	For example FMT6_NV12_Y is not compatible with FMT6_8_UNORM
+	-->
+	<value value="0x94" name="FMT6_NV12_Y"/>
+	<value value="0x95" name="FMT6_NV12_UV"/>
+	<value value="0x96" name="FMT6_NV12_VU"/>
+	<value value="0x97" name="FMT6_NV12_4R"/>
+	<value value="0x98" name="FMT6_NV12_4R_Y"/>
+	<value value="0x99" name="FMT6_NV12_4R_UV"/>
+	<value value="0x9a" name="FMT6_P010"/>
+	<value value="0x9b" name="FMT6_P010_Y"/>
+	<value value="0x9c" name="FMT6_P010_UV"/>
+	<value value="0x9d" name="FMT6_TP10"/>
+	<value value="0x9e" name="FMT6_TP10_Y"/>
+	<value value="0x9f" name="FMT6_TP10_UV"/>
+
+	<value value="0xa0" name="FMT6_Z24_UNORM_S8_UINT"/>
+
+	<value value="0xab" name="FMT6_ETC2_RG11_UNORM"/>
+	<value value="0xac" name="FMT6_ETC2_RG11_SNORM"/>
+	<value value="0xad" name="FMT6_ETC2_R11_UNORM"/>
+	<value value="0xae" name="FMT6_ETC2_R11_SNORM"/>
+	<value value="0xaf" name="FMT6_ETC1"/>
+	<value value="0xb0" name="FMT6_ETC2_RGB8"/>
+	<value value="0xb1" name="FMT6_ETC2_RGBA8"/>
+	<value value="0xb2" name="FMT6_ETC2_RGB8A1"/>
+	<value value="0xb3" name="FMT6_DXT1"/>
+	<value value="0xb4" name="FMT6_DXT3"/>
+	<value value="0xb5" name="FMT6_DXT5"/>
+	<value value="0xb7" name="FMT6_RGTC1_UNORM"/>
+	<value value="0xb8" name="FMT6_RGTC1_SNORM"/>
+	<value value="0xbb" name="FMT6_RGTC2_UNORM"/>
+	<value value="0xbc" name="FMT6_RGTC2_SNORM"/>
+	<value value="0xbe" name="FMT6_BPTC_UFLOAT"/>
+	<value value="0xbf" name="FMT6_BPTC_FLOAT"/>
+	<value value="0xc0" name="FMT6_BPTC"/>
+	<value value="0xc1" name="FMT6_ASTC_4x4"/>
+	<value value="0xc2" name="FMT6_ASTC_5x4"/>
+	<value value="0xc3" name="FMT6_ASTC_5x5"/>
+	<value value="0xc4" name="FMT6_ASTC_6x5"/>
+	<value value="0xc5" name="FMT6_ASTC_6x6"/>
+	<value value="0xc6" name="FMT6_ASTC_8x5"/>
+	<value value="0xc7" name="FMT6_ASTC_8x6"/>
+	<value value="0xc8" name="FMT6_ASTC_8x8"/>
+	<value value="0xc9" name="FMT6_ASTC_10x5"/>
+	<value value="0xca" name="FMT6_ASTC_10x6"/>
+	<value value="0xcb" name="FMT6_ASTC_10x8"/>
+	<value value="0xcc" name="FMT6_ASTC_10x10"/>
+	<value value="0xcd" name="FMT6_ASTC_12x10"/>
+	<value value="0xce" name="FMT6_ASTC_12x12"/>
+
+	<!-- for sampling stencil (integer, 2nd channel), not available on a630 -->
+	<value value="0xea" name="FMT6_Z24_UINT_S8_UINT"/>
+
+	<!-- Not a hw enum, used internally in driver -->
+	<value value="0xff" name="FMT6_NONE"/>
+
+</enum>
+
+<!-- probably same as a5xx -->
+<enum name="a6xx_polygon_mode">
+	<value name="POLYMODE6_POINTS" value="1"/>
+	<value name="POLYMODE6_LINES" value="2"/>
+	<value name="POLYMODE6_TRIANGLES" value="3"/>
+</enum>
+
+<enum name="a6xx_depth_format">
+	<value name="DEPTH6_NONE" value="0"/>
+	<value name="DEPTH6_16" value="1"/>
+	<value name="DEPTH6_24_8" value="2"/>
+	<value name="DEPTH6_32" value="4"/>
+</enum>
+
+<bitset name="a6x_cp_protect" inline="yes">
+	<bitfield name="BASE_ADDR" low="0" high="17"/>
+	<bitfield name="MASK_LEN" low="18" high="30"/>
+	<bitfield name="READ" pos="31" type="boolean"/>
+</bitset>
+
+<enum name="a6xx_shader_id">
+	<value value="0x9" name="A6XX_TP0_TMO_DATA"/>
+	<value value="0xa" name="A6XX_TP0_SMO_DATA"/>
+	<value value="0xb" name="A6XX_TP0_MIPMAP_BASE_DATA"/>
+	<value value="0x19" name="A6XX_TP1_TMO_DATA"/>
+	<value value="0x1a" name="A6XX_TP1_SMO_DATA"/>
+	<value value="0x1b" name="A6XX_TP1_MIPMAP_BASE_DATA"/>
+	<value value="0x29" name="A6XX_SP_INST_DATA"/>
+	<value value="0x2a" name="A6XX_SP_LB_0_DATA"/>
+	<value value="0x2b" name="A6XX_SP_LB_1_DATA"/>
+	<value value="0x2c" name="A6XX_SP_LB_2_DATA"/>
+	<value value="0x2d" name="A6XX_SP_LB_3_DATA"/>
+	<value value="0x2e" name="A6XX_SP_LB_4_DATA"/>
+	<value value="0x2f" name="A6XX_SP_LB_5_DATA"/>
+	<value value="0x30" name="A6XX_SP_CB_BINDLESS_DATA"/>
+	<value value="0x31" name="A6XX_SP_CB_LEGACY_DATA"/>
+	<value value="0x32" name="A6XX_SP_UAV_DATA"/>
+	<value value="0x33" name="A6XX_SP_INST_TAG"/>
+	<value value="0x34" name="A6XX_SP_CB_BINDLESS_TAG"/>
+	<value value="0x35" name="A6XX_SP_TMO_UMO_TAG"/>
+	<value value="0x36" name="A6XX_SP_SMO_TAG"/>
+	<value value="0x37" name="A6XX_SP_STATE_DATA"/>
+	<value value="0x49" name="A6XX_HLSQ_CHUNK_CVS_RAM"/>
+	<value value="0x4a" name="A6XX_HLSQ_CHUNK_CPS_RAM"/>
+	<value value="0x4b" name="A6XX_HLSQ_CHUNK_CVS_RAM_TAG"/>
+	<value value="0x4c" name="A6XX_HLSQ_CHUNK_CPS_RAM_TAG"/>
+	<value value="0x4d" name="A6XX_HLSQ_ICB_CVS_CB_BASE_TAG"/>
+	<value value="0x4e" name="A6XX_HLSQ_ICB_CPS_CB_BASE_TAG"/>
+	<value value="0x50" name="A6XX_HLSQ_CVS_MISC_RAM"/>
+	<value value="0x51" name="A6XX_HLSQ_CPS_MISC_RAM"/>
+	<value value="0x52" name="A6XX_HLSQ_INST_RAM"/>
+	<value value="0x53" name="A6XX_HLSQ_GFX_CVS_CONST_RAM"/>
+	<value value="0x54" name="A6XX_HLSQ_GFX_CPS_CONST_RAM"/>
+	<value value="0x55" name="A6XX_HLSQ_CVS_MISC_RAM_TAG"/>
+	<value value="0x56" name="A6XX_HLSQ_CPS_MISC_RAM_TAG"/>
+	<value value="0x57" name="A6XX_HLSQ_INST_RAM_TAG"/>
+	<value value="0x58" name="A6XX_HLSQ_GFX_CVS_CONST_RAM_TAG"/>
+	<value value="0x59" name="A6XX_HLSQ_GFX_CPS_CONST_RAM_TAG"/>
+	<value value="0x5a" name="A6XX_HLSQ_PWR_REST_RAM"/>
+	<value value="0x5b" name="A6XX_HLSQ_PWR_REST_TAG"/>
+	<value value="0x60" name="A6XX_HLSQ_DATAPATH_META"/>
+	<value value="0x61" name="A6XX_HLSQ_FRONTEND_META"/>
+	<value value="0x62" name="A6XX_HLSQ_INDIRECT_META"/>
+	<value value="0x63" name="A6XX_HLSQ_BACKEND_META"/>
+	<value value="0x70" name="A6XX_SP_LB_6_DATA"/>
+	<value value="0x71" name="A6XX_SP_LB_7_DATA"/>
+	<value value="0x73" name="A6XX_HLSQ_INST_RAM_1"/>
+</enum>
+
+<enum name="a7xx_statetype_id">
+	<value value="0" name="A7XX_TP0_NCTX_REG"/>
+	<value value="1" name="A7XX_TP0_CTX0_3D_CVS_REG"/>
+	<value value="2" name="A7XX_TP0_CTX0_3D_CPS_REG"/>
+	<value value="3" name="A7XX_TP0_CTX1_3D_CVS_REG"/>
+	<value value="4" name="A7XX_TP0_CTX1_3D_CPS_REG"/>
+	<value value="5" name="A7XX_TP0_CTX2_3D_CPS_REG"/>
+	<value value="6" name="A7XX_TP0_CTX3_3D_CPS_REG"/>
+	<value value="9" name="A7XX_TP0_TMO_DATA"/>
+	<value value="10" name="A7XX_TP0_SMO_DATA"/>
+	<value value="11" name="A7XX_TP0_MIPMAP_BASE_DATA"/>
+	<value value="32" name="A7XX_SP_NCTX_REG"/>
+	<value value="33" name="A7XX_SP_CTX0_3D_CVS_REG"/>
+	<value value="34" name="A7XX_SP_CTX0_3D_CPS_REG"/>
+	<value value="35" name="A7XX_SP_CTX1_3D_CVS_REG"/>
+	<value value="36" name="A7XX_SP_CTX1_3D_CPS_REG"/>
+	<value value="37" name="A7XX_SP_CTX2_3D_CPS_REG"/>
+	<value value="38" name="A7XX_SP_CTX3_3D_CPS_REG"/>
+	<value value="39" name="A7XX_SP_INST_DATA"/>
+	<value value="40" name="A7XX_SP_INST_DATA_1"/>
+	<value value="41" name="A7XX_SP_LB_0_DATA"/>
+	<value value="42" name="A7XX_SP_LB_1_DATA"/>
+	<value value="43" name="A7XX_SP_LB_2_DATA"/>
+	<value value="44" name="A7XX_SP_LB_3_DATA"/>
+	<value value="45" name="A7XX_SP_LB_4_DATA"/>
+	<value value="46" name="A7XX_SP_LB_5_DATA"/>
+	<value value="47" name="A7XX_SP_LB_6_DATA"/>
+	<value value="48" name="A7XX_SP_LB_7_DATA"/>
+	<value value="49" name="A7XX_SP_CB_RAM"/>
+	<value value="50" name="A7XX_SP_LB_13_DATA"/>
+	<value value="51" name="A7XX_SP_LB_14_DATA"/>
+	<value value="52" name="A7XX_SP_INST_TAG"/>
+	<value value="53" name="A7XX_SP_INST_DATA_2"/>
+	<value value="54" name="A7XX_SP_TMO_TAG"/>
+	<value value="55" name="A7XX_SP_SMO_TAG"/>
+	<value value="56" name="A7XX_SP_STATE_DATA"/>
+	<value value="57" name="A7XX_SP_HWAVE_RAM"/>
+	<value value="58" name="A7XX_SP_L0_INST_BUF"/>
+	<value value="59" name="A7XX_SP_LB_8_DATA"/>
+	<value value="60" name="A7XX_SP_LB_9_DATA"/>
+	<value value="61" name="A7XX_SP_LB_10_DATA"/>
+	<value value="62" name="A7XX_SP_LB_11_DATA"/>
+	<value value="63" name="A7XX_SP_LB_12_DATA"/>
+	<value value="64" name="A7XX_HLSQ_DATAPATH_DSTR_META"/>
+	<value value="67" name="A7XX_HLSQ_L2STC_TAG_RAM"/>
+	<value value="68" name="A7XX_HLSQ_L2STC_INFO_CMD"/>
+	<value value="69" name="A7XX_HLSQ_CVS_BE_CTXT_BUF_RAM_TAG"/>
+	<value value="70" name="A7XX_HLSQ_CPS_BE_CTXT_BUF_RAM_TAG"/>
+	<value value="71" name="A7XX_HLSQ_GFX_CVS_BE_CTXT_BUF_RAM"/>
+	<value value="72" name="A7XX_HLSQ_GFX_CPS_BE_CTXT_BUF_RAM"/>
+	<value value="73" name="A7XX_HLSQ_CHUNK_CVS_RAM"/>
+	<value value="74" name="A7XX_HLSQ_CHUNK_CPS_RAM"/>
+	<value value="75" name="A7XX_HLSQ_CHUNK_CVS_RAM_TAG"/>
+	<value value="76" name="A7XX_HLSQ_CHUNK_CPS_RAM_TAG"/>
+	<value value="77" name="A7XX_HLSQ_ICB_CVS_CB_BASE_TAG"/>
+	<value value="78" name="A7XX_HLSQ_ICB_CPS_CB_BASE_TAG"/>
+	<value value="79" name="A7XX_HLSQ_CVS_MISC_RAM"/>
+	<value value="80" name="A7XX_HLSQ_CPS_MISC_RAM"/>
+	<value value="81" name="A7XX_HLSQ_CPS_MISC_RAM_1"/>
+	<value value="82" name="A7XX_HLSQ_INST_RAM"/>
+	<value value="83" name="A7XX_HLSQ_GFX_CVS_CONST_RAM"/>
+	<value value="84" name="A7XX_HLSQ_GFX_CPS_CONST_RAM"/>
+	<value value="85" name="A7XX_HLSQ_CVS_MISC_RAM_TAG"/>
+	<value value="86" name="A7XX_HLSQ_CPS_MISC_RAM_TAG"/>
+	<value value="87" name="A7XX_HLSQ_INST_RAM_TAG"/>
+	<value value="88" name="A7XX_HLSQ_GFX_CVS_CONST_RAM_TAG"/>
+	<value value="89" name="A7XX_HLSQ_GFX_CPS_CONST_RAM_TAG"/>
+	<value value="90" name="A7XX_HLSQ_GFX_LOCAL_MISC_RAM"/>
+	<value value="91" name="A7XX_HLSQ_GFX_LOCAL_MISC_RAM_TAG"/>
+	<value value="92" name="A7XX_HLSQ_INST_RAM_1"/>
+	<value value="93" name="A7XX_HLSQ_STPROC_META"/>
+	<value value="94" name="A7XX_HLSQ_BV_BE_META"/>
+	<value value="95" name="A7XX_HLSQ_INST_RAM_2"/>
+	<value value="96" name="A7XX_HLSQ_DATAPATH_META"/>
+	<value value="97" name="A7XX_HLSQ_FRONTEND_META"/>
+	<value value="98" name="A7XX_HLSQ_INDIRECT_META"/>
+	<value value="99" name="A7XX_HLSQ_BACKEND_META"/>
+</enum>
+
+<enum name="a6xx_debugbus_id">
+	<value value="0x1" name="A6XX_DBGBUS_CP"/>
+	<value value="0x2" name="A6XX_DBGBUS_RBBM"/>
+	<value value="0x3" name="A6XX_DBGBUS_VBIF"/>
+	<value value="0x4" name="A6XX_DBGBUS_HLSQ"/>
+	<value value="0x5" name="A6XX_DBGBUS_UCHE"/>
+	<value value="0x6" name="A6XX_DBGBUS_DPM"/>
+	<value value="0x7" name="A6XX_DBGBUS_TESS"/>
+	<value value="0x8" name="A6XX_DBGBUS_PC"/>
+	<value value="0x9" name="A6XX_DBGBUS_VFDP"/>
+	<value value="0xa" name="A6XX_DBGBUS_VPC"/>
+	<value value="0xb" name="A6XX_DBGBUS_TSE"/>
+	<value value="0xc" name="A6XX_DBGBUS_RAS"/>
+	<value value="0xd" name="A6XX_DBGBUS_VSC"/>
+	<value value="0xe" name="A6XX_DBGBUS_COM"/>
+	<value value="0x10" name="A6XX_DBGBUS_LRZ"/>
+	<value value="0x11" name="A6XX_DBGBUS_A2D"/>
+	<value value="0x12" name="A6XX_DBGBUS_CCUFCHE"/>
+	<value value="0x13" name="A6XX_DBGBUS_GMU_CX"/>
+	<value value="0x14" name="A6XX_DBGBUS_RBP"/>
+	<value value="0x15" name="A6XX_DBGBUS_DCS"/>
+	<value value="0x16" name="A6XX_DBGBUS_DBGC"/>
+	<value value="0x17" name="A6XX_DBGBUS_CX"/>
+	<value value="0x18" name="A6XX_DBGBUS_GMU_GX"/>
+	<value value="0x19" name="A6XX_DBGBUS_TPFCHE"/>
+	<value value="0x1a" name="A6XX_DBGBUS_GBIF_GX"/>
+	<value value="0x1d" name="A6XX_DBGBUS_GPC"/>
+	<value value="0x1e" name="A6XX_DBGBUS_LARC"/>
+	<value value="0x1f" name="A6XX_DBGBUS_HLSQ_SPTP"/>
+	<value value="0x20" name="A6XX_DBGBUS_RB_0"/>
+	<value value="0x21" name="A6XX_DBGBUS_RB_1"/>
+	<value value="0x22" name="A6XX_DBGBUS_RB_2"/>
+	<value value="0x24" name="A6XX_DBGBUS_UCHE_WRAPPER"/>
+	<value value="0x28" name="A6XX_DBGBUS_CCU_0"/>
+	<value value="0x29" name="A6XX_DBGBUS_CCU_1"/>
+	<value value="0x2a" name="A6XX_DBGBUS_CCU_2"/>
+	<value value="0x38" name="A6XX_DBGBUS_VFD_0"/>
+	<value value="0x39" name="A6XX_DBGBUS_VFD_1"/>
+	<value value="0x3a" name="A6XX_DBGBUS_VFD_2"/>
+	<value value="0x3b" name="A6XX_DBGBUS_VFD_3"/>
+	<value value="0x3c" name="A6XX_DBGBUS_VFD_4"/>
+	<value value="0x3d" name="A6XX_DBGBUS_VFD_5"/>
+	<value value="0x40" name="A6XX_DBGBUS_SP_0"/>
+	<value value="0x41" name="A6XX_DBGBUS_SP_1"/>
+	<value value="0x42" name="A6XX_DBGBUS_SP_2"/>
+	<value value="0x48" name="A6XX_DBGBUS_TPL1_0"/>
+	<value value="0x49" name="A6XX_DBGBUS_TPL1_1"/>
+	<value value="0x4a" name="A6XX_DBGBUS_TPL1_2"/>
+	<value value="0x4b" name="A6XX_DBGBUS_TPL1_3"/>
+	<value value="0x4c" name="A6XX_DBGBUS_TPL1_4"/>
+	<value value="0x4d" name="A6XX_DBGBUS_TPL1_5"/>
+	<value value="0x58" name="A6XX_DBGBUS_SPTP_0"/>
+	<value value="0x59" name="A6XX_DBGBUS_SPTP_1"/>
+	<value value="0x5a" name="A6XX_DBGBUS_SPTP_2"/>
+	<value value="0x5b" name="A6XX_DBGBUS_SPTP_3"/>
+	<value value="0x5c" name="A6XX_DBGBUS_SPTP_4"/>
+	<value value="0x5d" name="A6XX_DBGBUS_SPTP_5"/>
+</enum>
+
+<enum name="a7xx_state_location">
+	<value value="0" name="A7XX_HLSQ_STATE"/>
+	<value value="1" name="A7XX_HLSQ_DP"/>
+	<value value="2" name="A7XX_SP_TOP"/>
+	<value value="3" name="A7XX_USPTP"/>
+</enum>
+
+<enum name="a7xx_pipe">
+	<value value="0" name="A7XX_PIPE_NONE"/>
+	<value value="1" name="A7XX_PIPE_BR"/>
+	<value value="2" name="A7XX_PIPE_BV"/>
+	<value value="3" name="A7XX_PIPE_LPAC"/>
+</enum>
+
+<enum name="a7xx_cluster">
+	<value value="0" name="A7XX_CLUSTER_NONE"/>
+	<value value="1" name="A7XX_CLUSTER_FE"/>
+	<value value="2" name="A7XX_CLUSTER_SP_VS"/>
+	<value value="3" name="A7XX_CLUSTER_PC_VS"/>
+	<value value="4" name="A7XX_CLUSTER_GRAS"/>
+	<value value="5" name="A7XX_CLUSTER_SP_PS"/>
+	<value value="6" name="A7XX_CLUSTER_VPC_PS"/>
+	<value value="7" name="A7XX_CLUSTER_PS"/>
+</enum>
+
+<enum name="a7xx_debugbus_id">
+	<value value="1" name="A7XX_DBGBUS_CP_0_0"/>
+	<value value="2" name="A7XX_DBGBUS_CP_0_1"/>
+	<value value="3" name="A7XX_DBGBUS_RBBM"/>
+	<value value="5" name="A7XX_DBGBUS_GBIF_GX"/>
+	<value value="6" name="A7XX_DBGBUS_GBIF_CX"/>
+	<value value="7" name="A7XX_DBGBUS_HLSQ"/>
+	<value value="9" name="A7XX_DBGBUS_UCHE_0"/>
+	<value value="10" name="A7XX_DBGBUS_UCHE_1"/>
+	<value value="13" name="A7XX_DBGBUS_TESS_BR"/>
+	<value value="14" name="A7XX_DBGBUS_TESS_BV"/>
+	<value value="17" name="A7XX_DBGBUS_PC_BR"/>
+	<value value="18" name="A7XX_DBGBUS_PC_BV"/>
+	<value value="21" name="A7XX_DBGBUS_VFDP_BR"/>
+	<value value="22" name="A7XX_DBGBUS_VFDP_BV"/>
+	<value value="25" name="A7XX_DBGBUS_VPC_BR"/>
+	<value value="26" name="A7XX_DBGBUS_VPC_BV"/>
+	<value value="29" name="A7XX_DBGBUS_TSE_BR"/>
+	<value value="30" name="A7XX_DBGBUS_TSE_BV"/>
+	<value value="33" name="A7XX_DBGBUS_RAS_BR"/>
+	<value value="34" name="A7XX_DBGBUS_RAS_BV"/>
+	<value value="37" name="A7XX_DBGBUS_VSC"/>
+	<value value="39" name="A7XX_DBGBUS_COM_0"/>
+	<value value="43" name="A7XX_DBGBUS_LRZ_BR"/>
+	<value value="44" name="A7XX_DBGBUS_LRZ_BV"/>
+	<value value="47" name="A7XX_DBGBUS_UFC_0"/>
+	<value value="48" name="A7XX_DBGBUS_UFC_1"/>
+	<value value="55" name="A7XX_DBGBUS_GMU_GX"/>
+	<value value="59" name="A7XX_DBGBUS_DBGC"/>
+	<value value="60" name="A7XX_DBGBUS_CX"/>
+	<value value="61" name="A7XX_DBGBUS_GMU_CX"/>
+	<value value="62" name="A7XX_DBGBUS_GPC_BR"/>
+	<value value="63" name="A7XX_DBGBUS_GPC_BV"/>
+	<value value="66" name="A7XX_DBGBUS_LARC"/>
+	<value value="68" name="A7XX_DBGBUS_HLSQ_SPTP"/>
+	<value value="70" name="A7XX_DBGBUS_RB_0"/>
+	<value value="71" name="A7XX_DBGBUS_RB_1"/>
+	<value value="72" name="A7XX_DBGBUS_RB_2"/>
+	<value value="73" name="A7XX_DBGBUS_RB_3"/>
+	<value value="74" name="A7XX_DBGBUS_RB_4"/>
+	<value value="75" name="A7XX_DBGBUS_RB_5"/>
+	<value value="102" name="A7XX_DBGBUS_UCHE_WRAPPER"/>
+	<value value="106" name="A7XX_DBGBUS_CCU_0"/>
+	<value value="107" name="A7XX_DBGBUS_CCU_1"/>
+	<value value="108" name="A7XX_DBGBUS_CCU_2"/>
+	<value value="109" name="A7XX_DBGBUS_CCU_3"/>
+	<value value="110" name="A7XX_DBGBUS_CCU_4"/>
+	<value value="111" name="A7XX_DBGBUS_CCU_5"/>
+	<value value="138" name="A7XX_DBGBUS_VFD_BR_0"/>
+	<value value="139" name="A7XX_DBGBUS_VFD_BR_1"/>
+	<value value="140" name="A7XX_DBGBUS_VFD_BR_2"/>
+	<value value="141" name="A7XX_DBGBUS_VFD_BR_3"/>
+	<value value="142" name="A7XX_DBGBUS_VFD_BR_4"/>
+	<value value="143" name="A7XX_DBGBUS_VFD_BR_5"/>
+	<value value="144" name="A7XX_DBGBUS_VFD_BR_6"/>
+	<value value="145" name="A7XX_DBGBUS_VFD_BR_7"/>
+	<value value="202" name="A7XX_DBGBUS_VFD_BV_0"/>
+	<value value="203" name="A7XX_DBGBUS_VFD_BV_1"/>
+	<value value="204" name="A7XX_DBGBUS_VFD_BV_2"/>
+	<value value="205" name="A7XX_DBGBUS_VFD_BV_3"/>
+	<value value="234" name="A7XX_DBGBUS_USP_0"/>
+	<value value="235" name="A7XX_DBGBUS_USP_1"/>
+	<value value="236" name="A7XX_DBGBUS_USP_2"/>
+	<value value="237" name="A7XX_DBGBUS_USP_3"/>
+	<value value="238" name="A7XX_DBGBUS_USP_4"/>
+	<value value="239" name="A7XX_DBGBUS_USP_5"/>
+	<value value="266" name="A7XX_DBGBUS_TP_0"/>
+	<value value="267" name="A7XX_DBGBUS_TP_1"/>
+	<value value="268" name="A7XX_DBGBUS_TP_2"/>
+	<value value="269" name="A7XX_DBGBUS_TP_3"/>
+	<value value="270" name="A7XX_DBGBUS_TP_4"/>
+	<value value="271" name="A7XX_DBGBUS_TP_5"/>
+	<value value="272" name="A7XX_DBGBUS_TP_6"/>
+	<value value="273" name="A7XX_DBGBUS_TP_7"/>
+	<value value="274" name="A7XX_DBGBUS_TP_8"/>
+	<value value="275" name="A7XX_DBGBUS_TP_9"/>
+	<value value="276" name="A7XX_DBGBUS_TP_10"/>
+	<value value="277" name="A7XX_DBGBUS_TP_11"/>
+	<value value="330" name="A7XX_DBGBUS_USPTP_0"/>
+	<value value="331" name="A7XX_DBGBUS_USPTP_1"/>
+	<value value="332" name="A7XX_DBGBUS_USPTP_2"/>
+	<value value="333" name="A7XX_DBGBUS_USPTP_3"/>
+	<value value="334" name="A7XX_DBGBUS_USPTP_4"/>
+	<value value="335" name="A7XX_DBGBUS_USPTP_5"/>
+	<value value="336" name="A7XX_DBGBUS_USPTP_6"/>
+	<value value="337" name="A7XX_DBGBUS_USPTP_7"/>
+	<value value="338" name="A7XX_DBGBUS_USPTP_8"/>
+	<value value="339" name="A7XX_DBGBUS_USPTP_9"/>
+	<value value="340" name="A7XX_DBGBUS_USPTP_10"/>
+	<value value="341" name="A7XX_DBGBUS_USPTP_11"/>
+	<value value="396" name="A7XX_DBGBUS_CCHE_0"/>
+	<value value="397" name="A7XX_DBGBUS_CCHE_1"/>
+	<value value="398" name="A7XX_DBGBUS_CCHE_2"/>
+	<value value="408" name="A7XX_DBGBUS_VPC_DSTR_0"/>
+	<value value="409" name="A7XX_DBGBUS_VPC_DSTR_1"/>
+	<value value="410" name="A7XX_DBGBUS_VPC_DSTR_2"/>
+	<value value="411" name="A7XX_DBGBUS_HLSQ_DP_STR_0"/>
+	<value value="412" name="A7XX_DBGBUS_HLSQ_DP_STR_1"/>
+	<value value="413" name="A7XX_DBGBUS_HLSQ_DP_STR_2"/>
+	<value value="414" name="A7XX_DBGBUS_HLSQ_DP_STR_3"/>
+	<value value="415" name="A7XX_DBGBUS_HLSQ_DP_STR_4"/>
+	<value value="416" name="A7XX_DBGBUS_HLSQ_DP_STR_5"/>
+	<value value="443" name="A7XX_DBGBUS_UFC_DSTR_0"/>
+	<value value="444" name="A7XX_DBGBUS_UFC_DSTR_1"/>
+	<value value="445" name="A7XX_DBGBUS_UFC_DSTR_2"/>
+	<value value="446" name="A7XX_DBGBUS_CGC_SUBCORE"/>
+	<value value="447" name="A7XX_DBGBUS_CGC_CORE"/>
+</enum>
+
+<enum name="a6xx_cp_perfcounter_select">
+	<value value="0" name="PERF_CP_ALWAYS_COUNT"/>
+	<value value="1" name="PERF_CP_BUSY_GFX_CORE_IDLE"/>
+	<value value="2" name="PERF_CP_BUSY_CYCLES"/>
+	<value value="3" name="PERF_CP_NUM_PREEMPTIONS"/>
+	<value value="4" name="PERF_CP_PREEMPTION_REACTION_DELAY"/>
+	<value value="5" name="PERF_CP_PREEMPTION_SWITCH_OUT_TIME"/>
+	<value value="6" name="PERF_CP_PREEMPTION_SWITCH_IN_TIME"/>
+	<value value="7" name="PERF_CP_DEAD_DRAWS_IN_BIN_RENDER"/>
+	<value value="8" name="PERF_CP_PREDICATED_DRAWS_KILLED"/>
+	<value value="9" name="PERF_CP_MODE_SWITCH"/>
+	<value value="10" name="PERF_CP_ZPASS_DONE"/>
+	<value value="11" name="PERF_CP_CONTEXT_DONE"/>
+	<value value="12" name="PERF_CP_CACHE_FLUSH"/>
+	<value value="13" name="PERF_CP_LONG_PREEMPTIONS"/>
+	<value value="14" name="PERF_CP_SQE_I_CACHE_STARVE"/>
+	<value value="15" name="PERF_CP_SQE_IDLE"/>
+	<value value="16" name="PERF_CP_SQE_PM4_STARVE_RB_IB"/>
+	<value value="17" name="PERF_CP_SQE_PM4_STARVE_SDS"/>
+	<value value="18" name="PERF_CP_SQE_MRB_STARVE"/>
+	<value value="19" name="PERF_CP_SQE_RRB_STARVE"/>
+	<value value="20" name="PERF_CP_SQE_VSD_STARVE"/>
+	<value value="21" name="PERF_CP_VSD_DECODE_STARVE"/>
+	<value value="22" name="PERF_CP_SQE_PIPE_OUT_STALL"/>
+	<value value="23" name="PERF_CP_SQE_SYNC_STALL"/>
+	<value value="24" name="PERF_CP_SQE_PM4_WFI_STALL"/>
+	<value value="25" name="PERF_CP_SQE_SYS_WFI_STALL"/>
+	<value value="26" name="PERF_CP_SQE_T4_EXEC"/>
+	<value value="27" name="PERF_CP_SQE_LOAD_STATE_EXEC"/>
+	<value value="28" name="PERF_CP_SQE_SAVE_SDS_STATE"/>
+	<value value="29" name="PERF_CP_SQE_DRAW_EXEC"/>
+	<value value="30" name="PERF_CP_SQE_CTXT_REG_BUNCH_EXEC"/>
+	<value value="31" name="PERF_CP_SQE_EXEC_PROFILED"/>
+	<value value="32" name="PERF_CP_MEMORY_POOL_EMPTY"/>
+	<value value="33" name="PERF_CP_MEMORY_POOL_SYNC_STALL"/>
+	<value value="34" name="PERF_CP_MEMORY_POOL_ABOVE_THRESH"/>
+	<value value="35" name="PERF_CP_AHB_WR_STALL_PRE_DRAWS"/>
+	<value value="36" name="PERF_CP_AHB_STALL_SQE_GMU"/>
+	<value value="37" name="PERF_CP_AHB_STALL_SQE_WR_OTHER"/>
+	<value value="38" name="PERF_CP_AHB_STALL_SQE_RD_OTHER"/>
+	<value value="39" name="PERF_CP_CLUSTER0_EMPTY"/>
+	<value value="40" name="PERF_CP_CLUSTER1_EMPTY"/>
+	<value value="41" name="PERF_CP_CLUSTER2_EMPTY"/>
+	<value value="42" name="PERF_CP_CLUSTER3_EMPTY"/>
+	<value value="43" name="PERF_CP_CLUSTER4_EMPTY"/>
+	<value value="44" name="PERF_CP_CLUSTER5_EMPTY"/>
+	<value value="45" name="PERF_CP_PM4_DATA"/>
+	<value value="46" name="PERF_CP_PM4_HEADERS"/>
+	<value value="47" name="PERF_CP_VBIF_READ_BEATS"/>
+	<value value="48" name="PERF_CP_VBIF_WRITE_BEATS"/>
+	<value value="49" name="PERF_CP_SQE_INSTR_COUNTER"/>
+</enum>
+
+<enum name="a6xx_rbbm_perfcounter_select">
+	<value value="0" name="PERF_RBBM_ALWAYS_COUNT"/>
+	<value value="1" name="PERF_RBBM_ALWAYS_ON"/>
+	<value value="2" name="PERF_RBBM_TSE_BUSY"/>
+	<value value="3" name="PERF_RBBM_RAS_BUSY"/>
+	<value value="4" name="PERF_RBBM_PC_DCALL_BUSY"/>
+	<value value="5" name="PERF_RBBM_PC_VSD_BUSY"/>
+	<value value="6" name="PERF_RBBM_STATUS_MASKED"/>
+	<value value="7" name="PERF_RBBM_COM_BUSY"/>
+	<value value="8" name="PERF_RBBM_DCOM_BUSY"/>
+	<value value="9" name="PERF_RBBM_VBIF_BUSY"/>
+	<value value="10" name="PERF_RBBM_VSC_BUSY"/>
+	<value value="11" name="PERF_RBBM_TESS_BUSY"/>
+	<value value="12" name="PERF_RBBM_UCHE_BUSY"/>
+	<value value="13" name="PERF_RBBM_HLSQ_BUSY"/>
+</enum>
+
+<enum name="a6xx_pc_perfcounter_select">
+	<value value="0" name="PERF_PC_BUSY_CYCLES"/>
+	<value value="1" name="PERF_PC_WORKING_CYCLES"/>
+	<value value="2" name="PERF_PC_STALL_CYCLES_VFD"/>
+	<value value="3" name="PERF_PC_STALL_CYCLES_TSE"/>
+	<value value="4" name="PERF_PC_STALL_CYCLES_VPC"/>
+	<value value="5" name="PERF_PC_STALL_CYCLES_UCHE"/>
+	<value value="6" name="PERF_PC_STALL_CYCLES_TESS"/>
+	<value value="7" name="PERF_PC_STALL_CYCLES_TSE_ONLY"/>
+	<value value="8" name="PERF_PC_STALL_CYCLES_VPC_ONLY"/>
+	<value value="9" name="PERF_PC_PASS1_TF_STALL_CYCLES"/>
+	<value value="10" name="PERF_PC_STARVE_CYCLES_FOR_INDEX"/>
+	<value value="11" name="PERF_PC_STARVE_CYCLES_FOR_TESS_FACTOR"/>
+	<value value="12" name="PERF_PC_STARVE_CYCLES_FOR_VIZ_STREAM"/>
+	<value value="13" name="PERF_PC_STARVE_CYCLES_FOR_POSITION"/>
+	<value value="14" name="PERF_PC_STARVE_CYCLES_DI"/>
+	<value value="15" name="PERF_PC_VIS_STREAMS_LOADED"/>
+	<value value="16" name="PERF_PC_INSTANCES"/>
+	<value value="17" name="PERF_PC_VPC_PRIMITIVES"/>
+	<value value="18" name="PERF_PC_DEAD_PRIM"/>
+	<value value="19" name="PERF_PC_LIVE_PRIM"/>
+	<value value="20" name="PERF_PC_VERTEX_HITS"/>
+	<value value="21" name="PERF_PC_IA_VERTICES"/>
+	<value value="22" name="PERF_PC_IA_PRIMITIVES"/>
+	<value value="23" name="PERF_PC_GS_PRIMITIVES"/>
+	<value value="24" name="PERF_PC_HS_INVOCATIONS"/>
+	<value value="25" name="PERF_PC_DS_INVOCATIONS"/>
+	<value value="26" name="PERF_PC_VS_INVOCATIONS"/>
+	<value value="27" name="PERF_PC_GS_INVOCATIONS"/>
+	<value value="28" name="PERF_PC_DS_PRIMITIVES"/>
+	<value value="29" name="PERF_PC_VPC_POS_DATA_TRANSACTION"/>
+	<value value="30" name="PERF_PC_3D_DRAWCALLS"/>
+	<value value="31" name="PERF_PC_2D_DRAWCALLS"/>
+	<value value="32" name="PERF_PC_NON_DRAWCALL_GLOBAL_EVENTS"/>
+	<value value="33" name="PERF_TESS_BUSY_CYCLES"/>
+	<value value="34" name="PERF_TESS_WORKING_CYCLES"/>
+	<value value="35" name="PERF_TESS_STALL_CYCLES_PC"/>
+	<value value="36" name="PERF_TESS_STARVE_CYCLES_PC"/>
+	<value value="37" name="PERF_PC_TSE_TRANSACTION"/>
+	<value value="38" name="PERF_PC_TSE_VERTEX"/>
+	<value value="39" name="PERF_PC_TESS_PC_UV_TRANS"/>
+	<value value="40" name="PERF_PC_TESS_PC_UV_PATCHES"/>
+	<value value="41" name="PERF_PC_TESS_FACTOR_TRANS"/>
+</enum>
+
+<enum name="a6xx_vfd_perfcounter_select">
+	<value value="0" name="PERF_VFD_BUSY_CYCLES"/>
+	<value value="1" name="PERF_VFD_STALL_CYCLES_UCHE"/>
+	<value value="2" name="PERF_VFD_STALL_CYCLES_VPC_ALLOC"/>
+	<value value="3" name="PERF_VFD_STALL_CYCLES_SP_INFO"/>
+	<value value="4" name="PERF_VFD_STALL_CYCLES_SP_ATTR"/>
+	<value value="5" name="PERF_VFD_STARVE_CYCLES_UCHE"/>
+	<value value="6" name="PERF_VFD_RBUFFER_FULL"/>
+	<value value="7" name="PERF_VFD_ATTR_INFO_FIFO_FULL"/>
+	<value value="8" name="PERF_VFD_DECODED_ATTRIBUTE_BYTES"/>
+	<value value="9" name="PERF_VFD_NUM_ATTRIBUTES"/>
+	<value value="10" name="PERF_VFD_UPPER_SHADER_FIBERS"/>
+	<value value="11" name="PERF_VFD_LOWER_SHADER_FIBERS"/>
+	<value value="12" name="PERF_VFD_MODE_0_FIBERS"/>
+	<value value="13" name="PERF_VFD_MODE_1_FIBERS"/>
+	<value value="14" name="PERF_VFD_MODE_2_FIBERS"/>
+	<value value="15" name="PERF_VFD_MODE_3_FIBERS"/>
+	<value value="16" name="PERF_VFD_MODE_4_FIBERS"/>
+	<value value="17" name="PERF_VFD_TOTAL_VERTICES"/>
+	<value value="18" name="PERF_VFDP_STALL_CYCLES_VFD"/>
+	<value value="19" name="PERF_VFDP_STALL_CYCLES_VFD_INDEX"/>
+	<value value="20" name="PERF_VFDP_STALL_CYCLES_VFD_PROG"/>
+	<value value="21" name="PERF_VFDP_STARVE_CYCLES_PC"/>
+	<value value="22" name="PERF_VFDP_VS_STAGE_WAVES"/>
+</enum>
+
+<enum name="a6xx_hlsq_perfcounter_select">
+	<value value="0" name="PERF_HLSQ_BUSY_CYCLES"/>
+	<value value="1" name="PERF_HLSQ_STALL_CYCLES_UCHE"/>
+	<value value="2" name="PERF_HLSQ_STALL_CYCLES_SP_STATE"/>
+	<value value="3" name="PERF_HLSQ_STALL_CYCLES_SP_FS_STAGE"/>
+	<value value="4" name="PERF_HLSQ_UCHE_LATENCY_CYCLES"/>
+	<value value="5" name="PERF_HLSQ_UCHE_LATENCY_COUNT"/>
+	<value value="6" name="PERF_HLSQ_FS_STAGE_1X_WAVES"/>
+	<value value="7" name="PERF_HLSQ_FS_STAGE_2X_WAVES"/>
+	<value value="8" name="PERF_HLSQ_QUADS"/>
+	<value value="9" name="PERF_HLSQ_CS_INVOCATIONS"/>
+	<value value="10" name="PERF_HLSQ_COMPUTE_DRAWCALLS"/>
+	<value value="11" name="PERF_HLSQ_FS_DATA_WAIT_PROGRAMMING"/>
+	<value value="12" name="PERF_HLSQ_DUAL_FS_PROG_ACTIVE"/>
+	<value value="13" name="PERF_HLSQ_DUAL_VS_PROG_ACTIVE"/>
+	<value value="14" name="PERF_HLSQ_FS_BATCH_COUNT_ZERO"/>
+	<value value="15" name="PERF_HLSQ_VS_BATCH_COUNT_ZERO"/>
+	<value value="16" name="PERF_HLSQ_WAVE_PENDING_NO_QUAD"/>
+	<value value="17" name="PERF_HLSQ_WAVE_PENDING_NO_PRIM_BASE"/>
+	<value value="18" name="PERF_HLSQ_STALL_CYCLES_VPC"/>
+	<value value="19" name="PERF_HLSQ_PIXELS"/>
+	<value value="20" name="PERF_HLSQ_DRAW_MODE_SWITCH_VSFS_SYNC"/>
+</enum>
+
+<enum name="a6xx_vpc_perfcounter_select">
+	<value value="0" name="PERF_VPC_BUSY_CYCLES"/>
+	<value value="1" name="PERF_VPC_WORKING_CYCLES"/>
+	<value value="2" name="PERF_VPC_STALL_CYCLES_UCHE"/>
+	<value value="3" name="PERF_VPC_STALL_CYCLES_VFD_WACK"/>
+	<value value="4" name="PERF_VPC_STALL_CYCLES_HLSQ_PRIM_ALLOC"/>
+	<value value="5" name="PERF_VPC_STALL_CYCLES_PC"/>
+	<value value="6" name="PERF_VPC_STALL_CYCLES_SP_LM"/>
+	<value value="7" name="PERF_VPC_STARVE_CYCLES_SP"/>
+	<value value="8" name="PERF_VPC_STARVE_CYCLES_LRZ"/>
+	<value value="9" name="PERF_VPC_PC_PRIMITIVES"/>
+	<value value="10" name="PERF_VPC_SP_COMPONENTS"/>
+	<value value="11" name="PERF_VPC_STALL_CYCLES_VPCRAM_POS"/>
+	<value value="12" name="PERF_VPC_LRZ_ASSIGN_PRIMITIVES"/>
+	<value value="13" name="PERF_VPC_RB_VISIBLE_PRIMITIVES"/>
+	<value value="14" name="PERF_VPC_LM_TRANSACTION"/>
+	<value value="15" name="PERF_VPC_STREAMOUT_TRANSACTION"/>
+	<value value="16" name="PERF_VPC_VS_BUSY_CYCLES"/>
+	<value value="17" name="PERF_VPC_PS_BUSY_CYCLES"/>
+	<value value="18" name="PERF_VPC_VS_WORKING_CYCLES"/>
+	<value value="19" name="PERF_VPC_PS_WORKING_CYCLES"/>
+	<value value="20" name="PERF_VPC_STARVE_CYCLES_RB"/>
+	<value value="21" name="PERF_VPC_NUM_VPCRAM_READ_POS"/>
+	<value value="22" name="PERF_VPC_WIT_FULL_CYCLES"/>
+	<value value="23" name="PERF_VPC_VPCRAM_FULL_CYCLES"/>
+	<value value="24" name="PERF_VPC_LM_FULL_WAIT_FOR_INTP_END"/>
+	<value value="25" name="PERF_VPC_NUM_VPCRAM_WRITE"/>
+	<value value="26" name="PERF_VPC_NUM_VPCRAM_READ_SO"/>
+	<value value="27" name="PERF_VPC_NUM_ATTR_REQ_LM"/>
+</enum>
+
+<enum name="a6xx_tse_perfcounter_select">
+	<value value="0" name="PERF_TSE_BUSY_CYCLES"/>
+	<value value="1" name="PERF_TSE_CLIPPING_CYCLES"/>
+	<value value="2" name="PERF_TSE_STALL_CYCLES_RAS"/>
+	<value value="3" name="PERF_TSE_STALL_CYCLES_LRZ_BARYPLANE"/>
+	<value value="4" name="PERF_TSE_STALL_CYCLES_LRZ_ZPLANE"/>
+	<value value="5" name="PERF_TSE_STARVE_CYCLES_PC"/>
+	<value value="6" name="PERF_TSE_INPUT_PRIM"/>
+	<value value="7" name="PERF_TSE_INPUT_NULL_PRIM"/>
+	<value value="8" name="PERF_TSE_TRIVAL_REJ_PRIM"/>
+	<value value="9" name="PERF_TSE_CLIPPED_PRIM"/>
+	<value value="10" name="PERF_TSE_ZERO_AREA_PRIM"/>
+	<value value="11" name="PERF_TSE_FACENESS_CULLED_PRIM"/>
+	<value value="12" name="PERF_TSE_ZERO_PIXEL_PRIM"/>
+	<value value="13" name="PERF_TSE_OUTPUT_NULL_PRIM"/>
+	<value value="14" name="PERF_TSE_OUTPUT_VISIBLE_PRIM"/>
+	<value value="15" name="PERF_TSE_CINVOCATION"/>
+	<value value="16" name="PERF_TSE_CPRIMITIVES"/>
+	<value value="17" name="PERF_TSE_2D_INPUT_PRIM"/>
+	<value value="18" name="PERF_TSE_2D_ALIVE_CYCLES"/>
+	<value value="19" name="PERF_TSE_CLIP_PLANES"/>
+</enum>
+
+<enum name="a6xx_ras_perfcounter_select">
+	<value value="0" name="PERF_RAS_BUSY_CYCLES"/>
+	<value value="1" name="PERF_RAS_SUPERTILE_ACTIVE_CYCLES"/>
+	<value value="2" name="PERF_RAS_STALL_CYCLES_LRZ"/>
+	<value value="3" name="PERF_RAS_STARVE_CYCLES_TSE"/>
+	<value value="4" name="PERF_RAS_SUPER_TILES"/>
+	<value value="5" name="PERF_RAS_8X4_TILES"/>
+	<value value="6" name="PERF_RAS_MASKGEN_ACTIVE"/>
+	<value value="7" name="PERF_RAS_FULLY_COVERED_SUPER_TILES"/>
+	<value value="8" name="PERF_RAS_FULLY_COVERED_8X4_TILES"/>
+	<value value="9" name="PERF_RAS_PRIM_KILLED_INVISILBE"/>
+	<value value="10" name="PERF_RAS_SUPERTILE_GEN_ACTIVE_CYCLES"/>
+	<value value="11" name="PERF_RAS_LRZ_INTF_WORKING_CYCLES"/>
+	<value value="12" name="PERF_RAS_BLOCKS"/>
+</enum>
+
+<enum name="a6xx_uche_perfcounter_select">
+	<value value="0" name="PERF_UCHE_BUSY_CYCLES"/>
+	<value value="1" name="PERF_UCHE_STALL_CYCLES_ARBITER"/>
+	<value value="2" name="PERF_UCHE_VBIF_LATENCY_CYCLES"/>
+	<value value="3" name="PERF_UCHE_VBIF_LATENCY_SAMPLES"/>
+	<value value="4" name="PERF_UCHE_VBIF_READ_BEATS_TP"/>
+	<value value="5" name="PERF_UCHE_VBIF_READ_BEATS_VFD"/>
+	<value value="6" name="PERF_UCHE_VBIF_READ_BEATS_HLSQ"/>
+	<value value="7" name="PERF_UCHE_VBIF_READ_BEATS_LRZ"/>
+	<value value="8" name="PERF_UCHE_VBIF_READ_BEATS_SP"/>
+	<value value="9" name="PERF_UCHE_READ_REQUESTS_TP"/>
+	<value value="10" name="PERF_UCHE_READ_REQUESTS_VFD"/>
+	<value value="11" name="PERF_UCHE_READ_REQUESTS_HLSQ"/>
+	<value value="12" name="PERF_UCHE_READ_REQUESTS_LRZ"/>
+	<value value="13" name="PERF_UCHE_READ_REQUESTS_SP"/>
+	<value value="14" name="PERF_UCHE_WRITE_REQUESTS_LRZ"/>
+	<value value="15" name="PERF_UCHE_WRITE_REQUESTS_SP"/>
+	<value value="16" name="PERF_UCHE_WRITE_REQUESTS_VPC"/>
+	<value value="17" name="PERF_UCHE_WRITE_REQUESTS_VSC"/>
+	<value value="18" name="PERF_UCHE_EVICTS"/>
+	<value value="19" name="PERF_UCHE_BANK_REQ0"/>
+	<value value="20" name="PERF_UCHE_BANK_REQ1"/>
+	<value value="21" name="PERF_UCHE_BANK_REQ2"/>
+	<value value="22" name="PERF_UCHE_BANK_REQ3"/>
+	<value value="23" name="PERF_UCHE_BANK_REQ4"/>
+	<value value="24" name="PERF_UCHE_BANK_REQ5"/>
+	<value value="25" name="PERF_UCHE_BANK_REQ6"/>
+	<value value="26" name="PERF_UCHE_BANK_REQ7"/>
+	<value value="27" name="PERF_UCHE_VBIF_READ_BEATS_CH0"/>
+	<value value="28" name="PERF_UCHE_VBIF_READ_BEATS_CH1"/>
+	<value value="29" name="PERF_UCHE_GMEM_READ_BEATS"/>
+	<value value="30" name="PERF_UCHE_TPH_REF_FULL"/>
+	<value value="31" name="PERF_UCHE_TPH_VICTIM_FULL"/>
+	<value value="32" name="PERF_UCHE_TPH_EXT_FULL"/>
+	<value value="33" name="PERF_UCHE_VBIF_STALL_WRITE_DATA"/>
+	<value value="34" name="PERF_UCHE_DCMP_LATENCY_SAMPLES"/>
+	<value value="35" name="PERF_UCHE_DCMP_LATENCY_CYCLES"/>
+	<value value="36" name="PERF_UCHE_VBIF_READ_BEATS_PC"/>
+	<value value="37" name="PERF_UCHE_READ_REQUESTS_PC"/>
+	<value value="38" name="PERF_UCHE_RAM_READ_REQ"/>
+	<value value="39" name="PERF_UCHE_RAM_WRITE_REQ"/>
+</enum>
+
+<enum name="a6xx_tp_perfcounter_select">
+	<value value="0" name="PERF_TP_BUSY_CYCLES"/>
+	<value value="1" name="PERF_TP_STALL_CYCLES_UCHE"/>
+	<value value="2" name="PERF_TP_LATENCY_CYCLES"/>
+	<value value="3" name="PERF_TP_LATENCY_TRANS"/>
+	<value value="4" name="PERF_TP_FLAG_CACHE_REQUEST_SAMPLES"/>
+	<value value="5" name="PERF_TP_FLAG_CACHE_REQUEST_LATENCY"/>
+	<value value="6" name="PERF_TP_L1_CACHELINE_REQUESTS"/>
+	<value value="7" name="PERF_TP_L1_CACHELINE_MISSES"/>
+	<value value="8" name="PERF_TP_SP_TP_TRANS"/>
+	<value value="9" name="PERF_TP_TP_SP_TRANS"/>
+	<value value="10" name="PERF_TP_OUTPUT_PIXELS"/>
+	<value value="11" name="PERF_TP_FILTER_WORKLOAD_16BIT"/>
+	<value value="12" name="PERF_TP_FILTER_WORKLOAD_32BIT"/>
+	<value value="13" name="PERF_TP_QUADS_RECEIVED"/>
+	<value value="14" name="PERF_TP_QUADS_OFFSET"/>
+	<value value="15" name="PERF_TP_QUADS_SHADOW"/>
+	<value value="16" name="PERF_TP_QUADS_ARRAY"/>
+	<value value="17" name="PERF_TP_QUADS_GRADIENT"/>
+	<value value="18" name="PERF_TP_QUADS_1D"/>
+	<value value="19" name="PERF_TP_QUADS_2D"/>
+	<value value="20" name="PERF_TP_QUADS_BUFFER"/>
+	<value value="21" name="PERF_TP_QUADS_3D"/>
+	<value value="22" name="PERF_TP_QUADS_CUBE"/>
+	<value value="23" name="PERF_TP_DIVERGENT_QUADS_RECEIVED"/>
+	<value value="24" name="PERF_TP_PRT_NON_RESIDENT_EVENTS"/>
+	<value value="25" name="PERF_TP_OUTPUT_PIXELS_POINT"/>
+	<value value="26" name="PERF_TP_OUTPUT_PIXELS_BILINEAR"/>
+	<value value="27" name="PERF_TP_OUTPUT_PIXELS_MIP"/>
+	<value value="28" name="PERF_TP_OUTPUT_PIXELS_ANISO"/>
+	<value value="29" name="PERF_TP_OUTPUT_PIXELS_ZERO_LOD"/>
+	<value value="30" name="PERF_TP_FLAG_CACHE_REQUESTS"/>
+	<value value="31" name="PERF_TP_FLAG_CACHE_MISSES"/>
+	<value value="32" name="PERF_TP_L1_5_L2_REQUESTS"/>
+	<value value="33" name="PERF_TP_2D_OUTPUT_PIXELS"/>
+	<value value="34" name="PERF_TP_2D_OUTPUT_PIXELS_POINT"/>
+	<value value="35" name="PERF_TP_2D_OUTPUT_PIXELS_BILINEAR"/>
+	<value value="36" name="PERF_TP_2D_FILTER_WORKLOAD_16BIT"/>
+	<value value="37" name="PERF_TP_2D_FILTER_WORKLOAD_32BIT"/>
+	<value value="38" name="PERF_TP_TPA2TPC_TRANS"/>
+	<value value="39" name="PERF_TP_L1_MISSES_ASTC_1TILE"/>
+	<value value="40" name="PERF_TP_L1_MISSES_ASTC_2TILE"/>
+	<value value="41" name="PERF_TP_L1_MISSES_ASTC_4TILE"/>
+	<value value="42" name="PERF_TP_L1_5_L2_COMPRESS_REQS"/>
+	<value value="43" name="PERF_TP_L1_5_L2_COMPRESS_MISS"/>
+	<value value="44" name="PERF_TP_L1_BANK_CONFLICT"/>
+	<value value="45" name="PERF_TP_L1_5_MISS_LATENCY_CYCLES"/>
+	<value value="46" name="PERF_TP_L1_5_MISS_LATENCY_TRANS"/>
+	<value value="47" name="PERF_TP_QUADS_CONSTANT_MULTIPLIED"/>
+	<value value="48" name="PERF_TP_FRONTEND_WORKING_CYCLES"/>
+	<value value="49" name="PERF_TP_L1_TAG_WORKING_CYCLES"/>
+	<value value="50" name="PERF_TP_L1_DATA_WRITE_WORKING_CYCLES"/>
+	<value value="51" name="PERF_TP_PRE_L1_DECOM_WORKING_CYCLES"/>
+	<value value="52" name="PERF_TP_BACKEND_WORKING_CYCLES"/>
+	<value value="53" name="PERF_TP_FLAG_CACHE_WORKING_CYCLES"/>
+	<value value="54" name="PERF_TP_L1_5_CACHE_WORKING_CYCLES"/>
+	<value value="55" name="PERF_TP_STARVE_CYCLES_SP"/>
+	<value value="56" name="PERF_TP_STARVE_CYCLES_UCHE"/>
+</enum>
+
+<enum name="a6xx_sp_perfcounter_select">
+	<value value="0" name="PERF_SP_BUSY_CYCLES"/>
+	<value value="1" name="PERF_SP_ALU_WORKING_CYCLES"/>
+	<value value="2" name="PERF_SP_EFU_WORKING_CYCLES"/>
+	<value value="3" name="PERF_SP_STALL_CYCLES_VPC"/>
+	<value value="4" name="PERF_SP_STALL_CYCLES_TP"/>
+	<value value="5" name="PERF_SP_STALL_CYCLES_UCHE"/>
+	<value value="6" name="PERF_SP_STALL_CYCLES_RB"/>
+	<value value="7" name="PERF_SP_NON_EXECUTION_CYCLES"/>
+	<value value="8" name="PERF_SP_WAVE_CONTEXTS"/>
+	<value value="9" name="PERF_SP_WAVE_CONTEXT_CYCLES"/>
+	<value value="10" name="PERF_SP_FS_STAGE_WAVE_CYCLES"/>
+	<value value="11" name="PERF_SP_FS_STAGE_WAVE_SAMPLES"/>
+	<value value="12" name="PERF_SP_VS_STAGE_WAVE_CYCLES"/>
+	<value value="13" name="PERF_SP_VS_STAGE_WAVE_SAMPLES"/>
+	<value value="14" name="PERF_SP_FS_STAGE_DURATION_CYCLES"/>
+	<value value="15" name="PERF_SP_VS_STAGE_DURATION_CYCLES"/>
+	<value value="16" name="PERF_SP_WAVE_CTRL_CYCLES"/>
+	<value value="17" name="PERF_SP_WAVE_LOAD_CYCLES"/>
+	<value value="18" name="PERF_SP_WAVE_EMIT_CYCLES"/>
+	<value value="19" name="PERF_SP_WAVE_NOP_CYCLES"/>
+	<value value="20" name="PERF_SP_WAVE_WAIT_CYCLES"/>
+	<value value="21" name="PERF_SP_WAVE_FETCH_CYCLES"/>
+	<value value="22" name="PERF_SP_WAVE_IDLE_CYCLES"/>
+	<value value="23" name="PERF_SP_WAVE_END_CYCLES"/>
+	<value value="24" name="PERF_SP_WAVE_LONG_SYNC_CYCLES"/>
+	<value value="25" name="PERF_SP_WAVE_SHORT_SYNC_CYCLES"/>
+	<value value="26" name="PERF_SP_WAVE_JOIN_CYCLES"/>
+	<value value="27" name="PERF_SP_LM_LOAD_INSTRUCTIONS"/>
+	<value value="28" name="PERF_SP_LM_STORE_INSTRUCTIONS"/>
+	<value value="29" name="PERF_SP_LM_ATOMICS"/>
+	<value value="30" name="PERF_SP_GM_LOAD_INSTRUCTIONS"/>
+	<value value="31" name="PERF_SP_GM_STORE_INSTRUCTIONS"/>
+	<value value="32" name="PERF_SP_GM_ATOMICS"/>
+	<value value="33" name="PERF_SP_VS_STAGE_TEX_INSTRUCTIONS"/>
+	<value value="34" name="PERF_SP_VS_STAGE_EFU_INSTRUCTIONS"/>
+	<value value="35" name="PERF_SP_VS_STAGE_FULL_ALU_INSTRUCTIONS"/>
+	<value value="36" name="PERF_SP_VS_STAGE_HALF_ALU_INSTRUCTIONS"/>
+	<value value="37" name="PERF_SP_FS_STAGE_TEX_INSTRUCTIONS"/>
+	<value value="38" name="PERF_SP_FS_STAGE_CFLOW_INSTRUCTIONS"/>
+	<value value="39" name="PERF_SP_FS_STAGE_EFU_INSTRUCTIONS"/>
+	<value value="40" name="PERF_SP_FS_STAGE_FULL_ALU_INSTRUCTIONS"/>
+	<value value="41" name="PERF_SP_FS_STAGE_HALF_ALU_INSTRUCTIONS"/>
+	<value value="42" name="PERF_SP_FS_STAGE_BARY_INSTRUCTIONS"/>
+	<value value="43" name="PERF_SP_VS_INSTRUCTIONS"/>
+	<value value="44" name="PERF_SP_FS_INSTRUCTIONS"/>
+	<value value="45" name="PERF_SP_ADDR_LOCK_COUNT"/>
+	<value value="46" name="PERF_SP_UCHE_READ_TRANS"/>
+	<value value="47" name="PERF_SP_UCHE_WRITE_TRANS"/>
+	<value value="48" name="PERF_SP_EXPORT_VPC_TRANS"/>
+	<value value="49" name="PERF_SP_EXPORT_RB_TRANS"/>
+	<value value="50" name="PERF_SP_PIXELS_KILLED"/>
+	<value value="51" name="PERF_SP_ICL1_REQUESTS"/>
+	<value value="52" name="PERF_SP_ICL1_MISSES"/>
+	<value value="53" name="PERF_SP_HS_INSTRUCTIONS"/>
+	<value value="54" name="PERF_SP_DS_INSTRUCTIONS"/>
+	<value value="55" name="PERF_SP_GS_INSTRUCTIONS"/>
+	<value value="56" name="PERF_SP_CS_INSTRUCTIONS"/>
+	<value value="57" name="PERF_SP_GPR_READ"/>
+	<value value="58" name="PERF_SP_GPR_WRITE"/>
+	<value value="59" name="PERF_SP_FS_STAGE_HALF_EFU_INSTRUCTIONS"/>
+	<value value="60" name="PERF_SP_VS_STAGE_HALF_EFU_INSTRUCTIONS"/>
+	<value value="61" name="PERF_SP_LM_BANK_CONFLICTS"/>
+	<value value="62" name="PERF_SP_TEX_CONTROL_WORKING_CYCLES"/>
+	<value value="63" name="PERF_SP_LOAD_CONTROL_WORKING_CYCLES"/>
+	<value value="64" name="PERF_SP_FLOW_CONTROL_WORKING_CYCLES"/>
+	<value value="65" name="PERF_SP_LM_WORKING_CYCLES"/>
+	<value value="66" name="PERF_SP_DISPATCHER_WORKING_CYCLES"/>
+	<value value="67" name="PERF_SP_SEQUENCER_WORKING_CYCLES"/>
+	<value value="68" name="PERF_SP_LOW_EFFICIENCY_STARVED_BY_TP"/>
+	<value value="69" name="PERF_SP_STARVE_CYCLES_HLSQ"/>
+	<value value="70" name="PERF_SP_NON_EXECUTION_LS_CYCLES"/>
+	<value value="71" name="PERF_SP_WORKING_EU"/>
+	<value value="72" name="PERF_SP_ANY_EU_WORKING"/>
+	<value value="73" name="PERF_SP_WORKING_EU_FS_STAGE"/>
+	<value value="74" name="PERF_SP_ANY_EU_WORKING_FS_STAGE"/>
+	<value value="75" name="PERF_SP_WORKING_EU_VS_STAGE"/>
+	<value value="76" name="PERF_SP_ANY_EU_WORKING_VS_STAGE"/>
+	<value value="77" name="PERF_SP_WORKING_EU_CS_STAGE"/>
+	<value value="78" name="PERF_SP_ANY_EU_WORKING_CS_STAGE"/>
+	<value value="79" name="PERF_SP_GPR_READ_PREFETCH"/>
+	<value value="80" name="PERF_SP_GPR_READ_CONFLICT"/>
+	<value value="81" name="PERF_SP_GPR_WRITE_CONFLICT"/>
+	<value value="82" name="PERF_SP_GM_LOAD_LATENCY_CYCLES"/>
+	<value value="83" name="PERF_SP_GM_LOAD_LATENCY_SAMPLES"/>
+	<value value="84" name="PERF_SP_EXECUTABLE_WAVES"/>
+</enum>
+
+<enum name="a6xx_rb_perfcounter_select">
+	<value value="0" name="PERF_RB_BUSY_CYCLES"/>
+	<value value="1" name="PERF_RB_STALL_CYCLES_HLSQ"/>
+	<value value="2" name="PERF_RB_STALL_CYCLES_FIFO0_FULL"/>
+	<value value="3" name="PERF_RB_STALL_CYCLES_FIFO1_FULL"/>
+	<value value="4" name="PERF_RB_STALL_CYCLES_FIFO2_FULL"/>
+	<value value="5" name="PERF_RB_STARVE_CYCLES_SP"/>
+	<value value="6" name="PERF_RB_STARVE_CYCLES_LRZ_TILE"/>
+	<value value="7" name="PERF_RB_STARVE_CYCLES_CCU"/>
+	<value value="8" name="PERF_RB_STARVE_CYCLES_Z_PLANE"/>
+	<value value="9" name="PERF_RB_STARVE_CYCLES_BARY_PLANE"/>
+	<value value="10" name="PERF_RB_Z_WORKLOAD"/>
+	<value value="11" name="PERF_RB_HLSQ_ACTIVE"/>
+	<value value="12" name="PERF_RB_Z_READ"/>
+	<value value="13" name="PERF_RB_Z_WRITE"/>
+	<value value="14" name="PERF_RB_C_READ"/>
+	<value value="15" name="PERF_RB_C_WRITE"/>
+	<value value="16" name="PERF_RB_TOTAL_PASS"/>
+	<value value="17" name="PERF_RB_Z_PASS"/>
+	<value value="18" name="PERF_RB_Z_FAIL"/>
+	<value value="19" name="PERF_RB_S_FAIL"/>
+	<value value="20" name="PERF_RB_BLENDED_FXP_COMPONENTS"/>
+	<value value="21" name="PERF_RB_BLENDED_FP16_COMPONENTS"/>
+	<value value="22" name="PERF_RB_PS_INVOCATIONS"/>
+	<value value="23" name="PERF_RB_2D_ALIVE_CYCLES"/>
+	<value value="24" name="PERF_RB_2D_STALL_CYCLES_A2D"/>
+	<value value="25" name="PERF_RB_2D_STARVE_CYCLES_SRC"/>
+	<value value="26" name="PERF_RB_2D_STARVE_CYCLES_SP"/>
+	<value value="27" name="PERF_RB_2D_STARVE_CYCLES_DST"/>
+	<value value="28" name="PERF_RB_2D_VALID_PIXELS"/>
+	<value value="29" name="PERF_RB_3D_PIXELS"/>
+	<value value="30" name="PERF_RB_BLENDER_WORKING_CYCLES"/>
+	<value value="31" name="PERF_RB_ZPROC_WORKING_CYCLES"/>
+	<value value="32" name="PERF_RB_CPROC_WORKING_CYCLES"/>
+	<value value="33" name="PERF_RB_SAMPLER_WORKING_CYCLES"/>
+	<value value="34" name="PERF_RB_STALL_CYCLES_CCU_COLOR_READ"/>
+	<value value="35" name="PERF_RB_STALL_CYCLES_CCU_COLOR_WRITE"/>
+	<value value="36" name="PERF_RB_STALL_CYCLES_CCU_DEPTH_READ"/>
+	<value value="37" name="PERF_RB_STALL_CYCLES_CCU_DEPTH_WRITE"/>
+	<value value="38" name="PERF_RB_STALL_CYCLES_VPC"/>
+	<value value="39" name="PERF_RB_2D_INPUT_TRANS"/>
+	<value value="40" name="PERF_RB_2D_OUTPUT_RB_DST_TRANS"/>
+	<value value="41" name="PERF_RB_2D_OUTPUT_RB_SRC_TRANS"/>
+	<value value="42" name="PERF_RB_BLENDED_FP32_COMPONENTS"/>
+	<value value="43" name="PERF_RB_COLOR_PIX_TILES"/>
+	<value value="44" name="PERF_RB_STALL_CYCLES_CCU"/>
+	<value value="45" name="PERF_RB_EARLY_Z_ARB3_GRANT"/>
+	<value value="46" name="PERF_RB_LATE_Z_ARB3_GRANT"/>
+	<value value="47" name="PERF_RB_EARLY_Z_SKIP_GRANT"/>
+</enum>
+
+<enum name="a6xx_vsc_perfcounter_select">
+	<value value="0" name="PERF_VSC_BUSY_CYCLES"/>
+	<value value="1" name="PERF_VSC_WORKING_CYCLES"/>
+	<value value="2" name="PERF_VSC_STALL_CYCLES_UCHE"/>
+	<value value="3" name="PERF_VSC_EOT_NUM"/>
+	<value value="4" name="PERF_VSC_INPUT_TILES"/>
+</enum>
+
+<enum name="a6xx_ccu_perfcounter_select">
+	<value value="0" name="PERF_CCU_BUSY_CYCLES"/>
+	<value value="1" name="PERF_CCU_STALL_CYCLES_RB_DEPTH_RETURN"/>
+	<value value="2" name="PERF_CCU_STALL_CYCLES_RB_COLOR_RETURN"/>
+	<value value="3" name="PERF_CCU_STARVE_CYCLES_FLAG_RETURN"/>
+	<value value="4" name="PERF_CCU_DEPTH_BLOCKS"/>
+	<value value="5" name="PERF_CCU_COLOR_BLOCKS"/>
+	<value value="6" name="PERF_CCU_DEPTH_BLOCK_HIT"/>
+	<value value="7" name="PERF_CCU_COLOR_BLOCK_HIT"/>
+	<value value="8" name="PERF_CCU_PARTIAL_BLOCK_READ"/>
+	<value value="9" name="PERF_CCU_GMEM_READ"/>
+	<value value="10" name="PERF_CCU_GMEM_WRITE"/>
+	<value value="11" name="PERF_CCU_DEPTH_READ_FLAG0_COUNT"/>
+	<value value="12" name="PERF_CCU_DEPTH_READ_FLAG1_COUNT"/>
+	<value value="13" name="PERF_CCU_DEPTH_READ_FLAG2_COUNT"/>
+	<value value="14" name="PERF_CCU_DEPTH_READ_FLAG3_COUNT"/>
+	<value value="15" name="PERF_CCU_DEPTH_READ_FLAG4_COUNT"/>
+	<value value="16" name="PERF_CCU_DEPTH_READ_FLAG5_COUNT"/>
+	<value value="17" name="PERF_CCU_DEPTH_READ_FLAG6_COUNT"/>
+	<value value="18" name="PERF_CCU_DEPTH_READ_FLAG8_COUNT"/>
+	<value value="19" name="PERF_CCU_COLOR_READ_FLAG0_COUNT"/>
+	<value value="20" name="PERF_CCU_COLOR_READ_FLAG1_COUNT"/>
+	<value value="21" name="PERF_CCU_COLOR_READ_FLAG2_COUNT"/>
+	<value value="22" name="PERF_CCU_COLOR_READ_FLAG3_COUNT"/>
+	<value value="23" name="PERF_CCU_COLOR_READ_FLAG4_COUNT"/>
+	<value value="24" name="PERF_CCU_COLOR_READ_FLAG5_COUNT"/>
+	<value value="25" name="PERF_CCU_COLOR_READ_FLAG6_COUNT"/>
+	<value value="26" name="PERF_CCU_COLOR_READ_FLAG8_COUNT"/>
+	<value value="27" name="PERF_CCU_2D_RD_REQ"/>
+	<value value="28" name="PERF_CCU_2D_WR_REQ"/>
+</enum>
+
+<enum name="a6xx_lrz_perfcounter_select">
+	<value value="0" name="PERF_LRZ_BUSY_CYCLES"/>
+	<value value="1" name="PERF_LRZ_STARVE_CYCLES_RAS"/>
+	<value value="2" name="PERF_LRZ_STALL_CYCLES_RB"/>
+	<value value="3" name="PERF_LRZ_STALL_CYCLES_VSC"/>
+	<value value="4" name="PERF_LRZ_STALL_CYCLES_VPC"/>
+	<value value="5" name="PERF_LRZ_STALL_CYCLES_FLAG_PREFETCH"/>
+	<value value="6" name="PERF_LRZ_STALL_CYCLES_UCHE"/>
+	<value value="7" name="PERF_LRZ_LRZ_READ"/>
+	<value value="8" name="PERF_LRZ_LRZ_WRITE"/>
+	<value value="9" name="PERF_LRZ_READ_LATENCY"/>
+	<value value="10" name="PERF_LRZ_MERGE_CACHE_UPDATING"/>
+	<value value="11" name="PERF_LRZ_PRIM_KILLED_BY_MASKGEN"/>
+	<value value="12" name="PERF_LRZ_PRIM_KILLED_BY_LRZ"/>
+	<value value="13" name="PERF_LRZ_VISIBLE_PRIM_AFTER_LRZ"/>
+	<value value="14" name="PERF_LRZ_FULL_8X8_TILES"/>
+	<value value="15" name="PERF_LRZ_PARTIAL_8X8_TILES"/>
+	<value value="16" name="PERF_LRZ_TILE_KILLED"/>
+	<value value="17" name="PERF_LRZ_TOTAL_PIXEL"/>
+	<value value="18" name="PERF_LRZ_VISIBLE_PIXEL_AFTER_LRZ"/>
+	<value value="19" name="PERF_LRZ_FULLY_COVERED_TILES"/>
+	<value value="20" name="PERF_LRZ_PARTIAL_COVERED_TILES"/>
+	<value value="21" name="PERF_LRZ_FEEDBACK_ACCEPT"/>
+	<value value="22" name="PERF_LRZ_FEEDBACK_DISCARD"/>
+	<value value="23" name="PERF_LRZ_FEEDBACK_STALL"/>
+	<value value="24" name="PERF_LRZ_STALL_CYCLES_RB_ZPLANE"/>
+	<value value="25" name="PERF_LRZ_STALL_CYCLES_RB_BPLANE"/>
+	<value value="26" name="PERF_LRZ_STALL_CYCLES_VC"/>
+	<value value="27" name="PERF_LRZ_RAS_MASK_TRANS"/>
+</enum>
+
+<enum name="a6xx_cmp_perfcounter_select">
+	<value value="0" name="PERF_CMPDECMP_STALL_CYCLES_ARB"/>
+	<value value="1" name="PERF_CMPDECMP_VBIF_LATENCY_CYCLES"/>
+	<value value="2" name="PERF_CMPDECMP_VBIF_LATENCY_SAMPLES"/>
+	<value value="3" name="PERF_CMPDECMP_VBIF_READ_DATA_CCU"/>
+	<value value="4" name="PERF_CMPDECMP_VBIF_WRITE_DATA_CCU"/>
+	<value value="5" name="PERF_CMPDECMP_VBIF_READ_REQUEST"/>
+	<value value="6" name="PERF_CMPDECMP_VBIF_WRITE_REQUEST"/>
+	<value value="7" name="PERF_CMPDECMP_VBIF_READ_DATA"/>
+	<value value="8" name="PERF_CMPDECMP_VBIF_WRITE_DATA"/>
+	<value value="9" name="PERF_CMPDECMP_FLAG_FETCH_CYCLES"/>
+	<value value="10" name="PERF_CMPDECMP_FLAG_FETCH_SAMPLES"/>
+	<value value="11" name="PERF_CMPDECMP_DEPTH_WRITE_FLAG1_COUNT"/>
+	<value value="12" name="PERF_CMPDECMP_DEPTH_WRITE_FLAG2_COUNT"/>
+	<value value="13" name="PERF_CMPDECMP_DEPTH_WRITE_FLAG3_COUNT"/>
+	<value value="14" name="PERF_CMPDECMP_DEPTH_WRITE_FLAG4_COUNT"/>
+	<value value="15" name="PERF_CMPDECMP_DEPTH_WRITE_FLAG5_COUNT"/>
+	<value value="16" name="PERF_CMPDECMP_DEPTH_WRITE_FLAG6_COUNT"/>
+	<value value="17" name="PERF_CMPDECMP_DEPTH_WRITE_FLAG8_COUNT"/>
+	<value value="18" name="PERF_CMPDECMP_COLOR_WRITE_FLAG1_COUNT"/>
+	<value value="19" name="PERF_CMPDECMP_COLOR_WRITE_FLAG2_COUNT"/>
+	<value value="20" name="PERF_CMPDECMP_COLOR_WRITE_FLAG3_COUNT"/>
+	<value value="21" name="PERF_CMPDECMP_COLOR_WRITE_FLAG4_COUNT"/>
+	<value value="22" name="PERF_CMPDECMP_COLOR_WRITE_FLAG5_COUNT"/>
+	<value value="23" name="PERF_CMPDECMP_COLOR_WRITE_FLAG6_COUNT"/>
+	<value value="24" name="PERF_CMPDECMP_COLOR_WRITE_FLAG8_COUNT"/>
+	<value value="25" name="PERF_CMPDECMP_2D_STALL_CYCLES_VBIF_REQ"/>
+	<value value="26" name="PERF_CMPDECMP_2D_STALL_CYCLES_VBIF_WR"/>
+	<value value="27" name="PERF_CMPDECMP_2D_STALL_CYCLES_VBIF_RETURN"/>
+	<value value="28" name="PERF_CMPDECMP_2D_RD_DATA"/>
+	<value value="29" name="PERF_CMPDECMP_2D_WR_DATA"/>
+	<value value="30" name="PERF_CMPDECMP_VBIF_READ_DATA_UCHE_CH0"/>
+	<value value="31" name="PERF_CMPDECMP_VBIF_READ_DATA_UCHE_CH1"/>
+	<value value="32" name="PERF_CMPDECMP_2D_OUTPUT_TRANS"/>
+	<value value="33" name="PERF_CMPDECMP_VBIF_WRITE_DATA_UCHE"/>
+	<value value="34" name="PERF_CMPDECMP_DEPTH_WRITE_FLAG0_COUNT"/>
+	<value value="35" name="PERF_CMPDECMP_COLOR_WRITE_FLAG0_COUNT"/>
+	<value value="36" name="PERF_CMPDECMP_COLOR_WRITE_FLAGALPHA_COUNT"/>
+	<value value="37" name="PERF_CMPDECMP_2D_BUSY_CYCLES"/>
+	<value value="38" name="PERF_CMPDECMP_2D_REORDER_STARVE_CYCLES"/>
+	<value value="39" name="PERF_CMPDECMP_2D_PIXELS"/>
+</enum>
+
+<!--
+Used in a6xx_2d_blit_cntl.. the value mostly seems to correlate to the
+component type/size, so I think it relates to internal format used for
+blending?  The one exception is that 16b unorm and 32b float use the
+same value... maybe 16b unorm is uncommon enough that it was just easier
+to upconvert to 32b float internally?
+
+ 8b unorm:  10 (sometimes 0, is the high bit part of something else?)
+16b unorm:   4
+
+32b int:     7
+16b int:     6
+ 8b int:     5
+
+32b float:   4
+16b float:   3
+ -->
+<enum name="a6xx_2d_ifmt">
+	<value value="0x10" name="R2D_UNORM8"/>
+	<value value="0x7"  name="R2D_INT32"/>
+	<value value="0x6"  name="R2D_INT16"/>
+	<value value="0x5"  name="R2D_INT8"/>
+	<value value="0x4"  name="R2D_FLOAT32"/>
+	<value value="0x3"  name="R2D_FLOAT16"/>
+	<value value="0x1"  name="R2D_UNORM8_SRGB"/>
+	<value value="0x0"  name="R2D_RAW"/>
+</enum>
+
+<enum name="a6xx_ztest_mode">
+	<doc>Allow early z-test and early-lrz (if applicable)</doc>
+	<value value="0x0" name="A6XX_EARLY_Z"/>
+	<doc>Disable early z-test and early-lrz test (if applicable)</doc>
+	<value value="0x1" name="A6XX_LATE_Z"/>
+	<doc>
+		A special mode that allows early-lrz test but disables
+		early-z test.  Which might sound a bit funny, since
+		lrz-test happens before z-test.  But as long as a couple
+		conditions are maintained this allows using lrz-test in
+		cases where fragment shader has kill/discard:
+
+		1) Disable lrz-write in cases where it is uncertain during
+		   binning pass that a fragment will pass.  Ie.  if frag
+		   shader has-kill, writes-z, or alpha/stencil test is
+		   enabled.  (For correctness, lrz-write must be disabled
+		   when blend is enabled.)  This is analogous to how a
+		   z-prepass works.
+
+		2) Disable lrz-write and test if a depth-test direction
+		   reversal is detected.  Due to condition (1), the contents
+		   of the lrz buffer are a conservative estimation of the
+		   depth buffer during the draw pass.  Meaning that geometry
+		   that we know for certain will not be visible will not pass
+		   lrz-test.  But geometry which may be (or contributes to
+		   blend) will pass the lrz-test.
+
+		This allows us to keep early-lrz-test in cases where the frag
+		shader does not write-z (ie. we know the z-value before FS)
+		and does not have side-effects (image/ssbo writes, etc), but
+		does have kill/discard.  Which turns out to be a common
+		enough case that it is useful to keep early-lrz test against
+		the conservative lrz buffer to discard fragments that we
+		know will definitely not be visible.
+	</doc>
+	<value value="0x2" name="A6XX_EARLY_LRZ_LATE_Z"/>
+	<doc>Not a real hw value, used internally by mesa</doc>
+	<value value="0x3" name="A6XX_INVALID_ZTEST"/>
+</enum>
+
+<enum name="a6xx_tess_spacing">
+	<value value="0x0" name="TESS_EQUAL"/>
+	<value value="0x2" name="TESS_FRACTIONAL_ODD"/>
+	<value value="0x3" name="TESS_FRACTIONAL_EVEN"/>
+</enum>
+<enum name="a6xx_tess_output">
+	<value value="0x0" name="TESS_POINTS"/>
+	<value value="0x1" name="TESS_LINES"/>
+	<value value="0x2" name="TESS_CW_TRIS"/>
+	<value value="0x3" name="TESS_CCW_TRIS"/>
+</enum>
+
+<domain name="A6XX" width="32" prefix="variant" varset="chip">
+	<bitset name="A6XX_RBBM_INT_0_MASK" inline="no" varset="chip">
+		<bitfield name="RBBM_GPU_IDLE" pos="0" type="boolean"/>
+		<bitfield name="CP_AHB_ERROR" pos="1" type="boolean"/>
+		<bitfield name="CP_IPC_INTR_0" pos="4" type="boolean" variants="A7XX-"/>
+		<bitfield name="CP_IPC_INTR_1" pos="5" type="boolean" variants="A7XX-"/>
+		<bitfield name="RBBM_ATB_ASYNCFIFO_OVERFLOW" pos="6" type="boolean"/>
+		<bitfield name="RBBM_GPC_ERROR" pos="7" type="boolean"/>
+		<bitfield name="CP_SW" pos="8" type="boolean"/>
+		<bitfield name="CP_HW_ERROR" pos="9" type="boolean"/>
+		<bitfield name="CP_CCU_FLUSH_DEPTH_TS" pos="10" type="boolean"/>
+		<bitfield name="CP_CCU_FLUSH_COLOR_TS" pos="11" type="boolean"/>
+		<bitfield name="CP_CCU_RESOLVE_TS" pos="12" type="boolean"/>
+		<bitfield name="CP_IB2" pos="13" type="boolean"/>
+		<bitfield name="CP_IB1" pos="14" type="boolean"/>
+		<bitfield name="CP_RB" pos="15" type="boolean" variants="A6XX"/>
+		<!-- Same as above but different name??: -->
+		<bitfield name="PM4CPINTERRUPT" pos="15" type="boolean" variants="A7XX-"/>
+		<bitfield name="PM4CPINTERRUPTLPAC" pos="16" type="boolean" variants="A7XX-"/>
+		<bitfield name="CP_RB_DONE_TS" pos="17" type="boolean"/>
+		<bitfield name="CP_WT_DONE_TS" pos="18" type="boolean"/>
+		<bitfield name="CP_CACHE_FLUSH_TS" pos="20" type="boolean"/>
+		<bitfield name="CP_CACHE_FLUSH_TS_LPAC" pos="21" type="boolean" variants="A7XX-"/>
+		<bitfield name="RBBM_ATB_BUS_OVERFLOW" pos="22" type="boolean"/>
+		<bitfield name="RBBM_HANG_DETECT" pos="23" type="boolean"/>
+		<bitfield name="UCHE_OOB_ACCESS" pos="24" type="boolean"/>
+		<bitfield name="UCHE_TRAP_INTR" pos="25" type="boolean"/>
+		<bitfield name="DEBBUS_INTR_0" pos="26" type="boolean"/>
+		<bitfield name="DEBBUS_INTR_1" pos="27" type="boolean"/>
+		<bitfield name="TSBWRITEERROR" pos="28" type="boolean" variants="A7XX-"/>
+		<bitfield name="ISDB_CPU_IRQ" pos="30" type="boolean"/>
+		<bitfield name="ISDB_UNDER_DEBUG" pos="31" type="boolean"/>
+	</bitset>
+
+	<!--
+		Note the _LPAC bits probably *actually* first appeared in a660, but the
+		_BV bits are new in a7xx
+	 -->
+	<bitset name="A6XX_CP_INT" varset="chip">
+		<bitfield name="CP_OPCODE_ERROR" pos="0" type="boolean"/>
+		<bitfield name="CP_UCODE_ERROR" pos="1" type="boolean"/>
+		<bitfield name="CP_HW_FAULT_ERROR" pos="2" type="boolean"/>
+		<bitfield name="CP_REGISTER_PROTECTION_ERROR" pos="4" type="boolean"/>
+		<bitfield name="CP_AHB_ERROR" pos="5" type="boolean"/>
+		<bitfield name="CP_VSD_PARITY_ERROR" pos="6" type="boolean"/>
+		<bitfield name="CP_ILLEGAL_INSTR_ERROR" pos="7" type="boolean"/>
+		<bitfield name="CP_OPCODE_ERROR_LPAC" pos="8" type="boolean" variants="A7XX-"/>
+		<bitfield name="CP_UCODE_ERROR_LPAC" pos="9" type="boolean" variants="A7XX-"/>
+		<bitfield name="CP_HW_FAULT_ERROR_LPAC" pos="10" type="boolean" variants="A7XX-"/>
+		<bitfield name="CP_REGISTER_PROTECTION_ERROR_LPAC" pos="11" type="boolean" variants="A7XX-"/>
+		<bitfield name="CP_ILLEGAL_INSTR_ERROR_LPAC" pos="12" type="boolean" variants="A7XX-"/>
+		<bitfield name="CP_OPCODE_ERROR_BV" pos="13" type="boolean" variants="A7XX-"/>
+		<bitfield name="CP_UCODE_ERROR_BV" pos="14" type="boolean" variants="A7XX-"/>
+		<bitfield name="CP_HW_FAULT_ERROR_BV" pos="15" type="boolean" variants="A7XX-"/>
+		<bitfield name="CP_REGISTER_PROTECTION_ERROR_BV" pos="16" type="boolean" variants="A7XX-"/>
+		<bitfield name="CP_ILLEGAL_INSTR_ERROR_BV" pos="17" type="boolean" variants="A7XX-"/>
+	</bitset>
+
+	<reg64 offset="0x0800" name="CP_RB_BASE"/>
+	<reg32 offset="0x0802" name="CP_RB_CNTL"/>
+	<reg64 offset="0x0804" name="CP_RB_RPTR_ADDR"/>
+	<reg32 offset="0x0806" name="CP_RB_RPTR"/>
+	<reg32 offset="0x0807" name="CP_RB_WPTR"/>
+	<reg32 offset="0x0808" name="CP_SQE_CNTL"/>
+	<reg32 offset="0x0812" name="CP_CP2GMU_STATUS">
+		<bitfield name="IFPC" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0821" name="CP_HW_FAULT"/>
+	<reg32 offset="0x0823" name="CP_INTERRUPT_STATUS" type="A6XX_CP_INT"/>
+	<reg32 offset="0x0824" name="CP_PROTECT_STATUS"/>
+	<reg32 offset="0x0825" name="CP_STATUS_1"/>
+	<reg64 offset="0x0830" name="CP_SQE_INSTR_BASE"/>
+	<reg32 offset="0x0840" name="CP_MISC_CNTL"/>
+	<reg32 offset="0x0844" name="CP_APRIV_CNTL">
+		<!-- Crashdumper writes -->
+		<bitfield pos="6" name="CDWRITE" type="boolean"/>
+		<!-- Crashdumper reads -->
+		<bitfield pos="5" name="CDREAD" type="boolean"/>
+
+		<!-- 4 is unknown -->
+
+		<!-- RPTR shadow writes -->
+		<bitfield pos="3" name="RBRPWB" type="boolean"/>
+		<!-- Memory accesses from PM4 packets in the ringbuffer -->
+		<bitfield pos="2" name="RBPRIVLEVEL" type="boolean"/>
+		<!-- Ringbuffer reads -->
+		<bitfield pos="1" name="RBFETCH" type="boolean"/>
+		<!-- Instruction cache fetches -->
+		<bitfield pos="0" name="ICACHE" type="boolean"/>
+	</reg32>
+	<!-- Preemptions taking longer than this threshold increment PERF_CP_LONG_PREEMPTIONS: -->
+	<reg32 offset="0x08C0" name="CP_PREEMPT_THRESHOLD"/>
+	<!-- all the threshold values seem to be in units of quad-dwords: -->
+	<reg32 offset="0x08C1" name="CP_ROQ_THRESHOLDS_1">
+		<doc>
+			b0..7 identifies where MRB data starts (and RB data ends)
+			b8.15 identifies where VSD data starts (and MRB data ends)
+			b16..23 identifies where IB1 data starts (and RB data ends)
+			b24..31 identifies where IB2 data starts (and IB1 data ends)
+		</doc>
+		<bitfield name="MRB_START" low="0" high="7" shr="2"/>
+		<bitfield name="VSD_START" low="8" high="15" shr="2"/>
+		<bitfield name="IB1_START" low="16" high="23" shr="2"/>
+		<bitfield name="IB2_START" low="24" high="31" shr="2"/>
+	</reg32>
+	<reg32 offset="0x08C2" name="CP_ROQ_THRESHOLDS_2">
+		<doc>
+			low bits identify where CP_SET_DRAW_STATE stateobj
+			processing starts (and IB2 data ends). I'm guessing
+			b8 is part of this since (from downstream kgsl):
+
+				/* ROQ sizes are twice as big on a640/a680 than on a630 */
+				if (adreno_is_a640(adreno_dev) || adreno_is_a680(adreno_dev)) {
+					kgsl_regwrite(device, A6XX_CP_ROQ_THRESHOLDS_2, 0x02000140);
+					kgsl_regwrite(device, A6XX_CP_ROQ_THRESHOLDS_1, 0x8040362C);
+				} ...
+		</doc>
+		<bitfield name="SDS_START" low="0" high="8" shr="2"/>
+		<!-- total ROQ size: -->
+		<bitfield name="ROQ_SIZE" low="16" high="31" shr="2"/>
+	</reg32>
+	<reg32 offset="0x08C3" name="CP_MEM_POOL_SIZE"/>
+	<reg32 offset="0x0841" name="CP_CHICKEN_DBG"/>
+	<reg32 offset="0x0842" name="CP_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
+	<reg32 offset="0x0843" name="CP_DBG_ECO_CNTL"/>
+	<reg32 offset="0x084F" name="CP_PROTECT_CNTL">
+		<bitfield pos="3" name="LAST_SPAN_INF_RANGE" type="boolean"/>
+		<bitfield pos="1" name="ACCESS_FAULT_ON_VIOL_EN" type="boolean"/>
+		<bitfield pos="0" name="ACCESS_PROT_EN" type="boolean"/>
+	</reg32>
+
+	<array offset="0x0883" name="CP_SCRATCH" stride="1" length="8">
+		<reg32 offset="0x0" name="REG" type="uint"/>
+	</array>
+	<array offset="0x0850" name="CP_PROTECT" stride="1" length="32">
+		<reg32 offset="0x0" name="REG" type="a6x_cp_protect"/>
+	</array>
+
+	<reg32 offset="0x08A0" name="CP_CONTEXT_SWITCH_CNTL"/>
+	<reg64 offset="0x08A1" name="CP_CONTEXT_SWITCH_SMMU_INFO"/>
+	<reg64 offset="0x08A3" name="CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_ADDR"/>
+	<reg64 offset="0x08A5" name="CP_CONTEXT_SWITCH_PRIV_SECURE_RESTORE_ADDR"/>
+	<reg64 offset="0x08A7" name="CP_CONTEXT_SWITCH_NON_PRIV_RESTORE_ADDR"/>
+	<reg32 offset="0x08ab" name="CP_CONTEXT_SWITCH_LEVEL_STATUS" variants="A7XX-"/>
+	<array offset="0x08D0" name="CP_PERFCTR_CP_SEL" stride="1" length="14"/>
+	<array offset="0x08e0" name="CP_BV_PERFCTR_CP_SEL" stride="1" length="7" variants="A7XX-"/>
+	<reg64 offset="0x0900" name="CP_CRASH_SCRIPT_BASE"/>
+	<reg32 offset="0x0902" name="CP_CRASH_DUMP_CNTL"/>
+	<reg32 offset="0x0903" name="CP_CRASH_DUMP_STATUS"/>
+	<reg32 offset="0x0908" name="CP_SQE_STAT_ADDR"/>
+	<reg32 offset="0x0909" name="CP_SQE_STAT_DATA"/>
+	<reg32 offset="0x090A" name="CP_DRAW_STATE_ADDR"/>
+	<reg32 offset="0x090B" name="CP_DRAW_STATE_DATA"/>
+	<reg32 offset="0x090C" name="CP_ROQ_DBG_ADDR"/>
+	<reg32 offset="0x090D" name="CP_ROQ_DBG_DATA"/>
+	<reg32 offset="0x090E" name="CP_MEM_POOL_DBG_ADDR"/>
+	<reg32 offset="0x090F" name="CP_MEM_POOL_DBG_DATA"/>
+	<reg32 offset="0x0910" name="CP_SQE_UCODE_DBG_ADDR"/>
+	<reg32 offset="0x0911" name="CP_SQE_UCODE_DBG_DATA"/>
+	<reg64 offset="0x0928" name="CP_IB1_BASE"/>
+	<reg32 offset="0x092A" name="CP_IB1_REM_SIZE"/>
+	<reg64 offset="0x092B" name="CP_IB2_BASE"/>
+	<reg32 offset="0x092D" name="CP_IB2_REM_SIZE"/>
+	<!-- SDS == CP_SET_DRAW_STATE: -->
+	<reg64 offset="0x092e" name="CP_SDS_BASE"/>
+	<reg32 offset="0x0930" name="CP_SDS_REM_SIZE"/>
+	<!-- MRB == MEM_READ_ADDR/$addr in SQE firmware -->
+	<reg64 offset="0x0931" name="CP_MRB_BASE"/>
+	<reg32 offset="0x0933" name="CP_MRB_REM_SIZE"/>
+	<!--
+	VSD == Visibility Stream Decode
+	This is used by CP to read the draw stream and skip empty draws
+	-->
+	<reg64 offset="0x0934" name="CP_VSD_BASE"/>
+
+	<bitset name="a6xx_roq_stat" inline="yes">
+		<bitfield name="RPTR" low="0" high="9"/>
+		<bitfield name="WPTR" low="16" high="25"/>
+	</bitset>
+	<reg32 offset="0x0939" name="CP_ROQ_RB_STAT" type="a6xx_roq_stat"/>
+	<reg32 offset="0x093a" name="CP_ROQ_IB1_STAT" type="a6xx_roq_stat"/>
+	<reg32 offset="0x093b" name="CP_ROQ_IB2_STAT" type="a6xx_roq_stat"/>
+	<reg32 offset="0x093c" name="CP_ROQ_SDS_STAT" type="a6xx_roq_stat"/>
+	<reg32 offset="0x093d" name="CP_ROQ_MRB_STAT" type="a6xx_roq_stat"/>
+	<reg32 offset="0x093e" name="CP_ROQ_VSD_STAT" type="a6xx_roq_stat"/>
+
+	<reg32 offset="0x0943" name="CP_IB1_DWORDS"/>
+	<reg32 offset="0x0944" name="CP_IB2_DWORDS"/>
+	<reg32 offset="0x0945" name="CP_SDS_DWORDS"/>
+	<reg32 offset="0x0946" name="CP_MRB_DWORDS"/>
+	<reg32 offset="0x0947" name="CP_VSD_DWORDS"/>
+
+	<reg32 offset="0x0948" name="CP_ROQ_AVAIL_RB">
+		<doc>number of remaining dwords incl current dword being consumed?</doc>
+		<bitfield name="REM" low="16" high="31"/>
+	</reg32>
+	<reg32 offset="0x0949" name="CP_ROQ_AVAIL_IB1">
+		<doc>number of remaining dwords incl current dword being consumed?</doc>
+		<bitfield name="REM" low="16" high="31"/>
+	</reg32>
+	<reg32 offset="0x094a" name="CP_ROQ_AVAIL_IB2">
+		<doc>number of remaining dwords incl current dword being consumed?</doc>
+		<bitfield name="REM" low="16" high="31"/>
+	</reg32>
+	<reg32 offset="0x094b" name="CP_ROQ_AVAIL_SDS">
+		<doc>number of remaining dwords incl current dword being consumed?</doc>
+		<bitfield name="REM" low="16" high="31"/>
+	</reg32>
+	<reg32 offset="0x094c" name="CP_ROQ_AVAIL_MRB">
+		<doc>number of dwords that have already been read but haven't been consumed by $addr</doc>
+		<bitfield name="REM" low="16" high="31"/>
+	</reg32>
+	<reg32 offset="0x094d" name="CP_ROQ_AVAIL_VSD">
+		<doc>number of remaining dwords incl current dword being consumed?</doc>
+		<bitfield name="REM" low="16" high="31"/>
+	</reg32>
+
+	<bitset name="a7xx_aperture_cntl" inline="yes">
+		<bitfield name="PIPE" low="12" high="13" type="a7xx_pipe"/>
+		<bitfield name="CLUSTER" low="8" high="10" type="a7xx_cluster"/>
+		<bitfield name="CONTEXT" low="4" high="5"/>
+	</bitset>
+	<reg64 offset="0x0980" name="CP_ALWAYS_ON_COUNTER"/>
+	<reg32 offset="0x098D" name="CP_AHB_CNTL"/>
+	<reg32 offset="0x0A00" name="CP_APERTURE_CNTL_HOST" variants="A6XX"/>
+	<reg32 offset="0x0A00" name="CP_APERTURE_CNTL_HOST" type="a7xx_aperture_cntl" variants="A7XX-"/>
+	<reg32 offset="0x0A03" name="CP_APERTURE_CNTL_CD" variants="A6XX"/>
+	<reg32 offset="0x0A03" name="CP_APERTURE_CNTL_CD" type="a7xx_aperture_cntl" variants="A7XX-"/>
+
+	<reg32 offset="0x0a61" name="CP_BV_PROTECT_STATUS" variants="A7XX-"/>
+	<reg32 offset="0x0a64" name="CP_BV_HW_FAULT" variants="A7XX-"/>
+	<reg32 offset="0x0a81" name="CP_BV_DRAW_STATE_ADDR" variants="A7XX-"/>
+	<reg32 offset="0x0a82" name="CP_BV_DRAW_STATE_DATA" variants="A7XX-"/>
+	<reg32 offset="0x0a83" name="CP_BV_ROQ_DBG_ADDR" variants="A7XX-"/>
+	<reg32 offset="0x0a84" name="CP_BV_ROQ_DBG_DATA" variants="A7XX-"/>
+	<reg32 offset="0x0a85" name="CP_BV_SQE_UCODE_DBG_ADDR" variants="A7XX-"/>
+	<reg32 offset="0x0a86" name="CP_BV_SQE_UCODE_DBG_DATA" variants="A7XX-"/>
+	<reg32 offset="0x0a87" name="CP_BV_SQE_STAT_ADDR" variants="A7XX-"/>
+	<reg32 offset="0x0a88" name="CP_BV_SQE_STAT_DATA" variants="A7XX-"/>
+	<reg32 offset="0x0a96" name="CP_BV_MEM_POOL_DBG_ADDR" variants="A7XX-"/>
+	<reg32 offset="0x0a97" name="CP_BV_MEM_POOL_DBG_DATA" variants="A7XX-"/>
+	<reg64 offset="0x0a98" name="CP_BV_RB_RPTR_ADDR" variants="A7XX-"/>
+
+	<reg32 offset="0x0a9a" name="CP_RESOURCE_TBL_DBG_ADDR" variants="A7XX-"/>
+	<reg32 offset="0x0a9b" name="CP_RESOURCE_TBL_DBG_DATA" variants="A7XX-"/>
+	<reg32 offset="0x0ad0" name="CP_BV_APRIV_CNTL" variants="A7XX-"/>
+	<reg32 offset="0x0ada" name="CP_BV_CHICKEN_DBG" variants="A7XX-"/>
+
+	<reg32 offset="0x0b0a" name="CP_LPAC_DRAW_STATE_ADDR" variants="A7XX-"/>
+	<reg32 offset="0x0b0b" name="CP_LPAC_DRAW_STATE_DATA" variants="A7XX-"/>
+	<reg32 offset="0x0b0c" name="CP_LPAC_ROQ_DBG_ADDR" variants="A7XX-"/>
+	<reg32 offset="0x0b27" name="CP_SQE_AC_UCODE_DBG_ADDR" variants="A7XX-"/>
+	<reg32 offset="0x0b28" name="CP_SQE_AC_UCODE_DBG_DATA" variants="A7XX-"/>
+	<reg32 offset="0x0b29" name="CP_SQE_AC_STAT_ADDR" variants="A7XX-"/>
+	<reg32 offset="0x0b2a" name="CP_SQE_AC_STAT_DATA" variants="A7XX-"/>
+
+	<reg32 offset="0x0b31" name="CP_LPAC_APRIV_CNTL" variants="A7XX-"/>
+	<reg32 offset="0x0B34" name="CP_LPAC_PROG_FIFO_SIZE"/>
+	<reg32 offset="0x0b35" name="CP_LPAC_ROQ_DBG_DATA" variants="A7XX-"/>
+	<reg32 offset="0x0b36" name="CP_LPAC_FIFO_DBG_DATA" variants="A7XX-"/>
+	<reg32 offset="0x0b40" name="CP_LPAC_FIFO_DBG_ADDR" variants="A7XX-"/>
+	<reg32 offset="0x0b81" name="CP_LPAC_SQE_CNTL"/>
+	<reg64 offset="0x0b82" name="CP_LPAC_SQE_INSTR_BASE"/>
+	<reg32 offset="0x0C01" name="VSC_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
+	<reg32 offset="0x0018" name="RBBM_GPR0_CNTL"/>
+	<reg32 offset="0x0201" name="RBBM_INT_0_STATUS" type="A6XX_RBBM_INT_0_MASK"/>
+	<reg32 offset="0x0210" name="RBBM_STATUS">
+		<bitfield pos="23" name="GPU_BUSY_IGN_AHB" type="boolean"/>
+		<bitfield pos="22" name="GPU_BUSY_IGN_AHB_CP" type="boolean"/>
+		<bitfield pos="21" name="HLSQ_BUSY" type="boolean"/>
+		<bitfield pos="20" name="VSC_BUSY" type="boolean"/>
+		<bitfield pos="19" name="TPL1_BUSY" type="boolean"/>
+		<bitfield pos="18" name="SP_BUSY" type="boolean"/>
+		<bitfield pos="17" name="UCHE_BUSY" type="boolean"/>
+		<bitfield pos="16" name="VPC_BUSY" type="boolean"/>
+		<bitfield pos="15" name="VFD_BUSY" type="boolean"/>
+		<bitfield pos="14" name="TESS_BUSY" type="boolean"/>
+		<bitfield pos="13" name="PC_VSD_BUSY" type="boolean"/>
+		<bitfield pos="12" name="PC_DCALL_BUSY" type="boolean"/>
+		<bitfield pos="11" name="COM_DCOM_BUSY" type="boolean"/>
+		<bitfield pos="10" name="LRZ_BUSY" type="boolean"/>
+		<bitfield pos="9"  name="A2D_BUSY" type="boolean"/>
+		<bitfield pos="8"  name="CCU_BUSY" type="boolean"/>
+		<bitfield pos="7"  name="RB_BUSY" type="boolean"/>
+		<bitfield pos="6"  name="RAS_BUSY" type="boolean"/>
+		<bitfield pos="5"  name="TSE_BUSY" type="boolean"/>
+		<bitfield pos="4"  name="VBIF_BUSY" type="boolean"/>
+		<bitfield pos="3"  name="GFX_DBGC_BUSY" type="boolean"/>
+		<bitfield pos="2"  name="CP_BUSY" type="boolean"/>
+		<bitfield pos="1"  name="CP_AHB_BUSY_CP_MASTER" type="boolean"/>
+		<bitfield pos="0"  name="CP_AHB_BUSY_CX_MASTER" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0211" name="RBBM_STATUS1"/>
+	<reg32 offset="0x0212" name="RBBM_STATUS2"/>
+	<reg32 offset="0x0213" name="RBBM_STATUS3">
+		<bitfield pos="24" name="SMMU_STALLED_ON_FAULT" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0215" name="RBBM_VBIF_GX_RESET_STATUS"/>
+
+	<reg32 offset="0x0260" name="RBBM_CLOCK_MODE_CP" variants="A7XX-"/>
+	<reg32 offset="0x0284" name="RBBM_CLOCK_MODE_BV_LRZ" variants="A7XX-"/>
+	<reg32 offset="0x0285" name="RBBM_CLOCK_MODE_BV_GRAS" variants="A7XX-"/>
+	<reg32 offset="0x0286" name="RBBM_CLOCK_MODE2_GRAS" variants="A7XX-"/>
+	<reg32 offset="0x0287" name="RBBM_CLOCK_MODE_BV_VFD" variants="A7XX-"/>
+	<reg32 offset="0x0288" name="RBBM_CLOCK_MODE_BV_GPC" variants="A7XX-"/>
+
+	<array offset="0x0400" name="RBBM_PERFCTR_CP" stride="2" length="14" variants="A6XX"/>
+	<array offset="0x041c" name="RBBM_PERFCTR_RBBM" stride="2" length="4" variants="A6XX"/>
+	<array offset="0x0424" name="RBBM_PERFCTR_PC" stride="2" length="8" variants="A6XX"/>
+	<array offset="0x0434" name="RBBM_PERFCTR_VFD" stride="2" length="8" variants="A6XX"/>
+	<array offset="0x0444" name="RBBM_PERFCTR_HLSQ" stride="2" length="6" variants="A6XX"/>
+	<array offset="0x0450" name="RBBM_PERFCTR_VPC" stride="2" length="6" variants="A6XX"/>
+	<array offset="0x045c" name="RBBM_PERFCTR_CCU" stride="2" length="5" variants="A6XX"/>
+	<array offset="0x0466" name="RBBM_PERFCTR_TSE" stride="2" length="4" variants="A6XX"/>
+	<array offset="0x046e" name="RBBM_PERFCTR_RAS" stride="2" length="4" variants="A6XX"/>
+	<array offset="0x0476" name="RBBM_PERFCTR_UCHE" stride="2" length="12" variants="A6XX"/>
+	<array offset="0x048e" name="RBBM_PERFCTR_TP" stride="2" length="12" variants="A6XX"/>
+	<array offset="0x04a6" name="RBBM_PERFCTR_SP" stride="2" length="24" variants="A6XX"/>
+	<array offset="0x04d6" name="RBBM_PERFCTR_RB" stride="2" length="8" variants="A6XX"/>
+	<array offset="0x04e6" name="RBBM_PERFCTR_VSC" stride="2" length="2" variants="A6XX"/>
+	<array offset="0x04ea" name="RBBM_PERFCTR_LRZ" stride="2" length="4" variants="A6XX"/>
+	<array offset="0x04f2" name="RBBM_PERFCTR_CMP" stride="2" length="4" variants="A6XX"/>
+
+	<array offset="0x0300" name="RBBM_PERFCTR_CP" stride="2" length="14" variants="A7XX-"/>
+	<array offset="0x031c" name="RBBM_PERFCTR_RBBM" stride="2" length="4" variants="A7XX-"/>
+	<array offset="0x0324" name="RBBM_PERFCTR_PC" stride="2" length="8" variants="A7XX-"/>
+	<array offset="0x0334" name="RBBM_PERFCTR_VFD" stride="2" length="8" variants="A7XX-"/>
+	<array offset="0x0344" name="RBBM_PERFCTR_HLSQ" stride="2" length="6" variants="A7XX-"/>
+	<array offset="0x0350" name="RBBM_PERFCTR_VPC" stride="2" length="6" variants="A7XX-"/>
+	<array offset="0x035c" name="RBBM_PERFCTR_CCU" stride="2" length="5" variants="A7XX-"/>
+	<array offset="0x0366" name="RBBM_PERFCTR_TSE" stride="2" length="4" variants="A7XX-"/>
+	<array offset="0x036e" name="RBBM_PERFCTR_RAS" stride="2" length="4" variants="A7XX-"/>
+	<array offset="0x0376" name="RBBM_PERFCTR_UCHE" stride="2" length="12" variants="A7XX-"/>
+	<array offset="0x038e" name="RBBM_PERFCTR_TP" stride="2" length="12" variants="A7XX-"/>
+	<array offset="0x03a6" name="RBBM_PERFCTR_SP" stride="2" length="24" variants="A7XX-"/>
+	<array offset="0x03d6" name="RBBM_PERFCTR_RB" stride="2" length="8" variants="A7XX-"/>
+	<array offset="0x03e6" name="RBBM_PERFCTR_VSC" stride="2" length="2" variants="A7XX-"/>
+	<array offset="0x03ea" name="RBBM_PERFCTR_LRZ" stride="2" length="4" variants="A7XX-"/>
+	<array offset="0x03f2" name="RBBM_PERFCTR_CMP" stride="2" length="4" variants="A7XX-"/>
+	<array offset="0x03fa" name="RBBM_PERFCTR_UFC" stride="2" length="4" variants="A7XX-"/>
+	<array offset="0x0410" name="RBBM_PERFCTR2_HLSQ" stride="2" length="6" variants="A7XX-"/>
+	<array offset="0x041c" name="RBBM_PERFCTR2_CP" stride="2" length="7" variants="A7XX-"/>
+	<array offset="0x042a" name="RBBM_PERFCTR2_SP" stride="2" length="12" variants="A7XX-"/>
+	<array offset="0x0442" name="RBBM_PERFCTR2_TP" stride="2" length="6" variants="A7XX-"/>
+	<array offset="0x044e" name="RBBM_PERFCTR2_UFC" stride="2" length="2" variants="A7XX-"/>
+	<array offset="0x0460" name="RBBM_PERFCTR_BV_PC" stride="2" length="8" variants="A7XX-"/>
+	<array offset="0x0470" name="RBBM_PERFCTR_BV_VFD" stride="2" length="8" variants="A7XX-"/>
+	<array offset="0x0480" name="RBBM_PERFCTR_BV_VPC" stride="2" length="6" variants="A7XX-"/>
+	<array offset="0x048c" name="RBBM_PERFCTR_BV_TSE" stride="2" length="4" variants="A7XX-"/>
+	<array offset="0x0494" name="RBBM_PERFCTR_BV_RAS" stride="2" length="4" variants="A7XX-"/>
+	<array offset="0x049c" name="RBBM_PERFCTR_BV_LRZ" stride="2" length="4" variants="A7XX-"/>
+
+	<reg32 offset="0x0500" name="RBBM_PERFCTR_CNTL"/>
+	<reg32 offset="0x0501" name="RBBM_PERFCTR_LOAD_CMD0"/>
+	<reg32 offset="0x0502" name="RBBM_PERFCTR_LOAD_CMD1"/>
+	<reg32 offset="0x0503" name="RBBM_PERFCTR_LOAD_CMD2"/>
+	<reg32 offset="0x0504" name="RBBM_PERFCTR_LOAD_CMD3"/>
+	<reg32 offset="0x0505" name="RBBM_PERFCTR_LOAD_VALUE_LO"/>
+	<reg32 offset="0x0506" name="RBBM_PERFCTR_LOAD_VALUE_HI"/>
+	<array offset="0x0507" name="RBBM_PERFCTR_RBBM_SEL" stride="1" length="4"/>
+	<reg32 offset="0x050B" name="RBBM_PERFCTR_GPU_BUSY_MASKED"/>
+	<reg32 offset="0x050e" name="RBBM_PERFCTR_SRAM_INIT_CMD"/>
+	<reg32 offset="0x050f" name="RBBM_PERFCTR_SRAM_INIT_STATUS"/>
+	<reg32 offset="0x0533" name="RBBM_ISDB_CNT"/>
+	<reg32 offset="0x0534" name="RBBM_NC_MODE_CNTL" variants="A7XX-"/>
+	<reg32 offset="0x0535" name="RBBM_SNAPSHOT_STATUS" variants="A7XX-"/>
+
+	<!---
+	    This block of registers aren't tied to perf counters. They
+	    count various geometry stats, for example number of
+	    vertices in, number of primnitives assembled etc.
+	-->
+
+	<reg32 offset="0x0540" name="RBBM_PRIMCTR_0_LO"/>  <!-- vs vertices in -->
+	<reg32 offset="0x0541" name="RBBM_PRIMCTR_0_HI"/>
+	<reg32 offset="0x0542" name="RBBM_PRIMCTR_1_LO"/>  <!-- vs primitives out -->
+	<reg32 offset="0x0543" name="RBBM_PRIMCTR_1_HI"/>
+	<reg32 offset="0x0544" name="RBBM_PRIMCTR_2_LO"/>  <!-- hs vertices in -->
+	<reg32 offset="0x0545" name="RBBM_PRIMCTR_2_HI"/>
+	<reg32 offset="0x0546" name="RBBM_PRIMCTR_3_LO"/>  <!-- hs patches out -->
+	<reg32 offset="0x0547" name="RBBM_PRIMCTR_3_HI"/>
+	<reg32 offset="0x0548" name="RBBM_PRIMCTR_4_LO"/>  <!-- dss vertices in -->
+	<reg32 offset="0x0549" name="RBBM_PRIMCTR_4_HI"/>
+	<reg32 offset="0x054a" name="RBBM_PRIMCTR_5_LO"/>  <!-- ds primitives out -->
+	<reg32 offset="0x054b" name="RBBM_PRIMCTR_5_HI"/>
+	<reg32 offset="0x054c" name="RBBM_PRIMCTR_6_LO"/>  <!-- gs primitives in -->
+	<reg32 offset="0x054d" name="RBBM_PRIMCTR_6_HI"/>
+	<reg32 offset="0x054e" name="RBBM_PRIMCTR_7_LO"/>  <!-- gs primitives out -->
+	<reg32 offset="0x054f" name="RBBM_PRIMCTR_7_HI"/>
+	<reg32 offset="0x0550" name="RBBM_PRIMCTR_8_LO"/>  <!-- gs primitives out -->
+	<reg32 offset="0x0551" name="RBBM_PRIMCTR_8_HI"/>
+	<reg32 offset="0x0552" name="RBBM_PRIMCTR_9_LO"/>  <!-- raster primitives in -->
+	<reg32 offset="0x0553" name="RBBM_PRIMCTR_9_HI"/>
+	<reg32 offset="0x0554" name="RBBM_PRIMCTR_10_LO"/>
+	<reg32 offset="0x0555" name="RBBM_PRIMCTR_10_HI"/>
+
+	<reg32 offset="0xF400" name="RBBM_SECVID_TRUST_CNTL"/>
+	<reg64 offset="0xF800" name="RBBM_SECVID_TSB_TRUSTED_BASE"/>
+	<reg32 offset="0xF802" name="RBBM_SECVID_TSB_TRUSTED_SIZE"/>
+	<reg32 offset="0xF803" name="RBBM_SECVID_TSB_CNTL"/>
+	<reg32 offset="0xF810" name="RBBM_SECVID_TSB_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
+	<reg64 offset="0xfc00" name="RBBM_SECVID_TSB_STATUS" variants="A7XX-"/>
+	<reg32 offset="0x00010" name="RBBM_VBIF_CLIENT_QOS_CNTL"/>
+	<reg32 offset="0x00011" name="RBBM_GBIF_CLIENT_QOS_CNTL"/>
+	<reg32 offset="0x00016" name="RBBM_GBIF_HALT"/>
+	<reg32 offset="0x00017" name="RBBM_GBIF_HALT_ACK"/>
+	<reg32 offset="0x0001c" name="RBBM_WAIT_FOR_GPU_IDLE_CMD">
+		<bitfield pos="0" name="WAIT_GPU_IDLE" type="boolean"/>
+	</reg32>
+
+	<reg32 offset="0x00016" name="RBBM_GBIF_HALT" variants="A7XX-"/>
+	<reg32 offset="0x00017" name="RBBM_GBIF_HALT_ACK" variants="A7XX-"/>
+	<reg32 offset="0x0001f" name="RBBM_INTERFACE_HANG_INT_CNTL"/>
+	<reg32 offset="0x00037" name="RBBM_INT_CLEAR_CMD" type="A6XX_RBBM_INT_0_MASK"/>
+	<reg32 offset="0x00038" name="RBBM_INT_0_MASK" type="A6XX_RBBM_INT_0_MASK"/>
+	<reg32 offset="0x0003a" name="RBBM_INT_2_MASK" variants="A7XX-"/>
+	<reg32 offset="0x00042" name="RBBM_SP_HYST_CNT"/>
+	<reg32 offset="0x00043" name="RBBM_SW_RESET_CMD"/>
+	<reg32 offset="0x00044" name="RBBM_RAC_THRESHOLD_CNT"/>
+	<reg32 offset="0x00045" name="RBBM_BLOCK_SW_RESET_CMD"/>
+	<reg32 offset="0x00046" name="RBBM_BLOCK_SW_RESET_CMD2"/>
+	<reg32 offset="0x000ad" name="RBBM_CLOCK_CNTL_GLOBAL" variants="A7XX-"/>
+	<reg32 offset="0x000ae" name="RBBM_CLOCK_CNTL"/>
+	<reg32 offset="0x000b0" name="RBBM_CLOCK_CNTL_SP0"/>
+	<reg32 offset="0x000b1" name="RBBM_CLOCK_CNTL_SP1"/>
+	<reg32 offset="0x000b2" name="RBBM_CLOCK_CNTL_SP2"/>
+	<reg32 offset="0x000b3" name="RBBM_CLOCK_CNTL_SP3"/>
+	<reg32 offset="0x000b4" name="RBBM_CLOCK_CNTL2_SP0"/>
+	<reg32 offset="0x000b5" name="RBBM_CLOCK_CNTL2_SP1"/>
+	<reg32 offset="0x000b6" name="RBBM_CLOCK_CNTL2_SP2"/>
+	<reg32 offset="0x000b7" name="RBBM_CLOCK_CNTL2_SP3"/>
+	<reg32 offset="0x000b8" name="RBBM_CLOCK_DELAY_SP0"/>
+	<reg32 offset="0x000b9" name="RBBM_CLOCK_DELAY_SP1"/>
+	<reg32 offset="0x000ba" name="RBBM_CLOCK_DELAY_SP2"/>
+	<reg32 offset="0x000bb" name="RBBM_CLOCK_DELAY_SP3"/>
+	<reg32 offset="0x000bc" name="RBBM_CLOCK_HYST_SP0"/>
+	<reg32 offset="0x000bd" name="RBBM_CLOCK_HYST_SP1"/>
+	<reg32 offset="0x000be" name="RBBM_CLOCK_HYST_SP2"/>
+	<reg32 offset="0x000bf" name="RBBM_CLOCK_HYST_SP3"/>
+	<reg32 offset="0x000c0" name="RBBM_CLOCK_CNTL_TP0"/>
+	<reg32 offset="0x000c1" name="RBBM_CLOCK_CNTL_TP1"/>
+	<reg32 offset="0x000c2" name="RBBM_CLOCK_CNTL_TP2"/>
+	<reg32 offset="0x000c3" name="RBBM_CLOCK_CNTL_TP3"/>
+	<reg32 offset="0x000c4" name="RBBM_CLOCK_CNTL2_TP0"/>
+	<reg32 offset="0x000c5" name="RBBM_CLOCK_CNTL2_TP1"/>
+	<reg32 offset="0x000c6" name="RBBM_CLOCK_CNTL2_TP2"/>
+	<reg32 offset="0x000c7" name="RBBM_CLOCK_CNTL2_TP3"/>
+	<reg32 offset="0x000c8" name="RBBM_CLOCK_CNTL3_TP0"/>
+	<reg32 offset="0x000c9" name="RBBM_CLOCK_CNTL3_TP1"/>
+	<reg32 offset="0x000ca" name="RBBM_CLOCK_CNTL3_TP2"/>
+	<reg32 offset="0x000cb" name="RBBM_CLOCK_CNTL3_TP3"/>
+	<reg32 offset="0x000cc" name="RBBM_CLOCK_CNTL4_TP0"/>
+	<reg32 offset="0x000cd" name="RBBM_CLOCK_CNTL4_TP1"/>
+	<reg32 offset="0x000ce" name="RBBM_CLOCK_CNTL4_TP2"/>
+	<reg32 offset="0x000cf" name="RBBM_CLOCK_CNTL4_TP3"/>
+	<reg32 offset="0x000d0" name="RBBM_CLOCK_DELAY_TP0"/>
+	<reg32 offset="0x000d1" name="RBBM_CLOCK_DELAY_TP1"/>
+	<reg32 offset="0x000d2" name="RBBM_CLOCK_DELAY_TP2"/>
+	<reg32 offset="0x000d3" name="RBBM_CLOCK_DELAY_TP3"/>
+	<reg32 offset="0x000d4" name="RBBM_CLOCK_DELAY2_TP0"/>
+	<reg32 offset="0x000d5" name="RBBM_CLOCK_DELAY2_TP1"/>
+	<reg32 offset="0x000d6" name="RBBM_CLOCK_DELAY2_TP2"/>
+	<reg32 offset="0x000d7" name="RBBM_CLOCK_DELAY2_TP3"/>
+	<reg32 offset="0x000d8" name="RBBM_CLOCK_DELAY3_TP0"/>
+	<reg32 offset="0x000d9" name="RBBM_CLOCK_DELAY3_TP1"/>
+	<reg32 offset="0x000da" name="RBBM_CLOCK_DELAY3_TP2"/>
+	<reg32 offset="0x000db" name="RBBM_CLOCK_DELAY3_TP3"/>
+	<reg32 offset="0x000dc" name="RBBM_CLOCK_DELAY4_TP0"/>
+	<reg32 offset="0x000dd" name="RBBM_CLOCK_DELAY4_TP1"/>
+	<reg32 offset="0x000de" name="RBBM_CLOCK_DELAY4_TP2"/>
+	<reg32 offset="0x000df" name="RBBM_CLOCK_DELAY4_TP3"/>
+	<reg32 offset="0x000e0" name="RBBM_CLOCK_HYST_TP0"/>
+	<reg32 offset="0x000e1" name="RBBM_CLOCK_HYST_TP1"/>
+	<reg32 offset="0x000e2" name="RBBM_CLOCK_HYST_TP2"/>
+	<reg32 offset="0x000e3" name="RBBM_CLOCK_HYST_TP3"/>
+	<reg32 offset="0x000e4" name="RBBM_CLOCK_HYST2_TP0"/>
+	<reg32 offset="0x000e5" name="RBBM_CLOCK_HYST2_TP1"/>
+	<reg32 offset="0x000e6" name="RBBM_CLOCK_HYST2_TP2"/>
+	<reg32 offset="0x000e7" name="RBBM_CLOCK_HYST2_TP3"/>
+	<reg32 offset="0x000e8" name="RBBM_CLOCK_HYST3_TP0"/>
+	<reg32 offset="0x000e9" name="RBBM_CLOCK_HYST3_TP1"/>
+	<reg32 offset="0x000ea" name="RBBM_CLOCK_HYST3_TP2"/>
+	<reg32 offset="0x000eb" name="RBBM_CLOCK_HYST3_TP3"/>
+	<reg32 offset="0x000ec" name="RBBM_CLOCK_HYST4_TP0"/>
+	<reg32 offset="0x000ed" name="RBBM_CLOCK_HYST4_TP1"/>
+	<reg32 offset="0x000ee" name="RBBM_CLOCK_HYST4_TP2"/>
+	<reg32 offset="0x000ef" name="RBBM_CLOCK_HYST4_TP3"/>
+	<reg32 offset="0x000f0" name="RBBM_CLOCK_CNTL_RB0"/>
+	<reg32 offset="0x000f1" name="RBBM_CLOCK_CNTL_RB1"/>
+	<reg32 offset="0x000f2" name="RBBM_CLOCK_CNTL_RB2"/>
+	<reg32 offset="0x000f3" name="RBBM_CLOCK_CNTL_RB3"/>
+	<reg32 offset="0x000f4" name="RBBM_CLOCK_CNTL2_RB0"/>
+	<reg32 offset="0x000f5" name="RBBM_CLOCK_CNTL2_RB1"/>
+	<reg32 offset="0x000f6" name="RBBM_CLOCK_CNTL2_RB2"/>
+	<reg32 offset="0x000f7" name="RBBM_CLOCK_CNTL2_RB3"/>
+	<reg32 offset="0x000f8" name="RBBM_CLOCK_CNTL_CCU0"/>
+	<reg32 offset="0x000f9" name="RBBM_CLOCK_CNTL_CCU1"/>
+	<reg32 offset="0x000fa" name="RBBM_CLOCK_CNTL_CCU2"/>
+	<reg32 offset="0x000fb" name="RBBM_CLOCK_CNTL_CCU3"/>
+	<reg32 offset="0x00100" name="RBBM_CLOCK_HYST_RB_CCU0"/>
+	<reg32 offset="0x00101" name="RBBM_CLOCK_HYST_RB_CCU1"/>
+	<reg32 offset="0x00102" name="RBBM_CLOCK_HYST_RB_CCU2"/>
+	<reg32 offset="0x00103" name="RBBM_CLOCK_HYST_RB_CCU3"/>
+	<reg32 offset="0x00104" name="RBBM_CLOCK_CNTL_RAC"/>
+	<reg32 offset="0x00105" name="RBBM_CLOCK_CNTL2_RAC"/>
+	<reg32 offset="0x00106" name="RBBM_CLOCK_DELAY_RAC"/>
+	<reg32 offset="0x00107" name="RBBM_CLOCK_HYST_RAC"/>
+	<reg32 offset="0x00108" name="RBBM_CLOCK_CNTL_TSE_RAS_RBBM"/>
+	<reg32 offset="0x00109" name="RBBM_CLOCK_DELAY_TSE_RAS_RBBM"/>
+	<reg32 offset="0x0010a" name="RBBM_CLOCK_HYST_TSE_RAS_RBBM"/>
+	<reg32 offset="0x0010b" name="RBBM_CLOCK_CNTL_UCHE"/>
+	<reg32 offset="0x0010c" name="RBBM_CLOCK_CNTL2_UCHE"/>
+	<reg32 offset="0x0010d" name="RBBM_CLOCK_CNTL3_UCHE"/>
+	<reg32 offset="0x0010e" name="RBBM_CLOCK_CNTL4_UCHE"/>
+	<reg32 offset="0x0010f" name="RBBM_CLOCK_DELAY_UCHE"/>
+	<reg32 offset="0x00110" name="RBBM_CLOCK_HYST_UCHE"/>
+	<reg32 offset="0x00111" name="RBBM_CLOCK_MODE_VFD"/>
+	<reg32 offset="0x00112" name="RBBM_CLOCK_DELAY_VFD"/>
+	<reg32 offset="0x00113" name="RBBM_CLOCK_HYST_VFD"/>
+	<reg32 offset="0x00114" name="RBBM_CLOCK_MODE_GPC"/>
+	<reg32 offset="0x00115" name="RBBM_CLOCK_DELAY_GPC"/>
+	<reg32 offset="0x00116" name="RBBM_CLOCK_HYST_GPC"/>
+	<reg32 offset="0x00117" name="RBBM_CLOCK_DELAY_HLSQ_2"/>
+	<reg32 offset="0x00118" name="RBBM_CLOCK_CNTL_GMU_GX"/>
+	<reg32 offset="0x00119" name="RBBM_CLOCK_DELAY_GMU_GX"/>
+	<reg32 offset="0x0011a" name="RBBM_CLOCK_HYST_GMU_GX"/>
+	<reg32 offset="0x0011b" name="RBBM_CLOCK_MODE_HLSQ"/>
+	<reg32 offset="0x0011c" name="RBBM_CLOCK_DELAY_HLSQ"/>
+	<reg32 offset="0x0011d" name="RBBM_CLOCK_HYST_HLSQ"/>
+	<reg32 offset="0x0011e" name="RBBM_CGC_GLOBAL_LOAD_CMD" variants="A7XX-"/>
+	<reg32 offset="0x0011f" name="RBBM_CGC_P2S_TRIG_CMD" variants="A7XX-"/>
+	<reg32 offset="0x00120" name="RBBM_CLOCK_CNTL_TEX_FCHE"/>
+	<reg32 offset="0x00121" name="RBBM_CLOCK_DELAY_TEX_FCHE"/>
+	<reg32 offset="0x00122" name="RBBM_CLOCK_HYST_TEX_FCHE"/>
+	<reg32 offset="0x00122" name="RBBM_CGC_P2S_STATUS" variants="A7XX-">
+		<bitfield name="TXDONE" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x00123" name="RBBM_CLOCK_CNTL_FCHE"/>
+	<reg32 offset="0x00124" name="RBBM_CLOCK_DELAY_FCHE"/>
+	<reg32 offset="0x00125" name="RBBM_CLOCK_HYST_FCHE"/>
+	<reg32 offset="0x00126" name="RBBM_CLOCK_CNTL_MHUB"/>
+	<reg32 offset="0x00127" name="RBBM_CLOCK_DELAY_MHUB"/>
+	<reg32 offset="0x00128" name="RBBM_CLOCK_HYST_MHUB"/>
+	<reg32 offset="0x00129" name="RBBM_CLOCK_DELAY_GLC"/>
+	<reg32 offset="0x0012a" name="RBBM_CLOCK_HYST_GLC"/>
+	<reg32 offset="0x0012b" name="RBBM_CLOCK_CNTL_GLC"/>
+	<reg32 offset="0x0012f" name="RBBM_CLOCK_HYST2_VFD" variants="A7XX-"/>
+	<reg32 offset="0x005ff" name="RBBM_LPAC_GBIF_CLIENT_QOS_CNTL"/>
+
+	<reg32 offset="0x0600" name="DBGC_CFG_DBGBUS_SEL_A"/>
+	<reg32 offset="0x0601" name="DBGC_CFG_DBGBUS_SEL_B"/>
+	<reg32 offset="0x0602" name="DBGC_CFG_DBGBUS_SEL_C"/>
+	<reg32 offset="0x0603" name="DBGC_CFG_DBGBUS_SEL_D">
+		<bitfield high="7" low="0" name="PING_INDEX"/>
+		<bitfield high="15" low="8" name="PING_BLK_SEL"/>
+	</reg32>
+	<reg32 offset="0x0604" name="DBGC_CFG_DBGBUS_CNTLT">
+		<bitfield high="5" low="0" name="TRACEEN"/>
+		<bitfield high="14" low="12" name="GRANU"/>
+		<bitfield high="31" low="28" name="SEGT"/>
+	</reg32>
+	<reg32 offset="0x0605" name="DBGC_CFG_DBGBUS_CNTLM">
+		<bitfield high="27" low="24" name="ENABLE"/>
+	</reg32>
+	<reg32 offset="0x0608" name="DBGC_CFG_DBGBUS_IVTL_0"/>
+	<reg32 offset="0x0609" name="DBGC_CFG_DBGBUS_IVTL_1"/>
+	<reg32 offset="0x060a" name="DBGC_CFG_DBGBUS_IVTL_2"/>
+	<reg32 offset="0x060b" name="DBGC_CFG_DBGBUS_IVTL_3"/>
+	<reg32 offset="0x060c" name="DBGC_CFG_DBGBUS_MASKL_0"/>
+	<reg32 offset="0x060d" name="DBGC_CFG_DBGBUS_MASKL_1"/>
+	<reg32 offset="0x060e" name="DBGC_CFG_DBGBUS_MASKL_2"/>
+	<reg32 offset="0x060f" name="DBGC_CFG_DBGBUS_MASKL_3"/>
+	<reg32 offset="0x0610" name="DBGC_CFG_DBGBUS_BYTEL_0">
+		<bitfield high="3" low="0" name="BYTEL0"/>
+		<bitfield high="7" low="4" name="BYTEL1"/>
+		<bitfield high="11" low="8" name="BYTEL2"/>
+		<bitfield high="15" low="12" name="BYTEL3"/>
+		<bitfield high="19" low="16" name="BYTEL4"/>
+		<bitfield high="23" low="20" name="BYTEL5"/>
+		<bitfield high="27" low="24" name="BYTEL6"/>
+		<bitfield high="31" low="28" name="BYTEL7"/>
+	</reg32>
+	<reg32 offset="0x0611" name="DBGC_CFG_DBGBUS_BYTEL_1">
+		<bitfield high="3" low="0" name="BYTEL8"/>
+		<bitfield high="7" low="4" name="BYTEL9"/>
+		<bitfield high="11" low="8" name="BYTEL10"/>
+		<bitfield high="15" low="12" name="BYTEL11"/>
+		<bitfield high="19" low="16" name="BYTEL12"/>
+		<bitfield high="23" low="20" name="BYTEL13"/>
+		<bitfield high="27" low="24" name="BYTEL14"/>
+		<bitfield high="31" low="28" name="BYTEL15"/>
+	</reg32>
+	<reg32 offset="0x062f" name="DBGC_CFG_DBGBUS_TRACE_BUF1"/>
+	<reg32 offset="0x0630" name="DBGC_CFG_DBGBUS_TRACE_BUF2"/>
+	<array offset="0x0CD8" name="VSC_PERFCTR_VSC_SEL" stride="1" length="2"/>
+	<reg32 offset="0x0CD8" name="VSC_UNKNOWN_0CD8" variants="A7XX">
+		<doc>
+			Set to true when binning, isn't changed afterwards
+		</doc>
+		<bitfield name="BINNING" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0xC800" name="HLSQ_DBG_AHB_READ_APERTURE"/>
+	<reg32 offset="0xD000" name="HLSQ_DBG_READ_SEL"/>
+	<reg32 offset="0x0E00" name="UCHE_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
+	<reg32 offset="0x0E01" name="UCHE_MODE_CNTL"/>
+	<reg64 offset="0x0E05" name="UCHE_WRITE_RANGE_MAX"/>
+	<reg64 offset="0x0E07" name="UCHE_WRITE_THRU_BASE"/>
+	<reg64 offset="0x0E09" name="UCHE_TRAP_BASE"/>
+	<reg64 offset="0x0E0B" name="UCHE_GMEM_RANGE_MIN"/>
+	<reg64 offset="0x0E0D" name="UCHE_GMEM_RANGE_MAX"/>
+	<reg32 offset="0x0E17" name="UCHE_CACHE_WAYS" usage="cmd"/>
+	<reg32 offset="0x0E18" name="UCHE_FILTER_CNTL"/>
+	<reg32 offset="0x0E19" name="UCHE_CLIENT_PF" usage="cmd">
+		<bitfield high="7" low="0" name="PERFSEL"/>
+	</reg32>
+	<array offset="0x0E1C" name="UCHE_PERFCTR_UCHE_SEL" stride="1" length="12"/>
+	<reg32 offset="0x0e3a" name="UCHE_GBIF_GX_CONFIG"/>
+	<reg32 offset="0x0e3c" name="UCHE_CMDQ_CONFIG"/>
+
+	<reg32 offset="0x3000" name="VBIF_VERSION"/>
+	<reg32 offset="0x3001" name="VBIF_CLKON">
+		<bitfield pos="1" name="FORCE_ON_TESTBUS" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x302A" name="VBIF_GATE_OFF_WRREQ_EN"/>
+	<reg32 offset="0x3080" name="VBIF_XIN_HALT_CTRL0"/>
+	<reg32 offset="0x3081" name="VBIF_XIN_HALT_CTRL1"/>
+	<reg32 offset="0x3084" name="VBIF_TEST_BUS_OUT_CTRL"/>
+	<reg32 offset="0x3085" name="VBIF_TEST_BUS1_CTRL0"/>
+	<reg32 offset="0x3086" name="VBIF_TEST_BUS1_CTRL1">
+		<bitfield low="0" high="3" name="DATA_SEL"/>
+	</reg32>
+	<reg32 offset="0x3087" name="VBIF_TEST_BUS2_CTRL0"/>
+	<reg32 offset="0x3088" name="VBIF_TEST_BUS2_CTRL1">
+		<bitfield low="0" high="8" name="DATA_SEL"/>
+	</reg32>
+	<reg32 offset="0x308c" name="VBIF_TEST_BUS_OUT"/>
+	<reg32 offset="0x30d0" name="VBIF_PERF_CNT_SEL0"/>
+	<reg32 offset="0x30d1" name="VBIF_PERF_CNT_SEL1"/>
+	<reg32 offset="0x30d2" name="VBIF_PERF_CNT_SEL2"/>
+	<reg32 offset="0x30d3" name="VBIF_PERF_CNT_SEL3"/>
+	<reg32 offset="0x30d8" name="VBIF_PERF_CNT_LOW0"/>
+	<reg32 offset="0x30d9" name="VBIF_PERF_CNT_LOW1"/>
+	<reg32 offset="0x30da" name="VBIF_PERF_CNT_LOW2"/>
+	<reg32 offset="0x30db" name="VBIF_PERF_CNT_LOW3"/>
+	<reg32 offset="0x30e0" name="VBIF_PERF_CNT_HIGH0"/>
+	<reg32 offset="0x30e1" name="VBIF_PERF_CNT_HIGH1"/>
+	<reg32 offset="0x30e2" name="VBIF_PERF_CNT_HIGH2"/>
+	<reg32 offset="0x30e3" name="VBIF_PERF_CNT_HIGH3"/>
+	<reg32 offset="0x3100" name="VBIF_PERF_PWR_CNT_EN0"/>
+	<reg32 offset="0x3101" name="VBIF_PERF_PWR_CNT_EN1"/>
+	<reg32 offset="0x3102" name="VBIF_PERF_PWR_CNT_EN2"/>
+	<reg32 offset="0x3110" name="VBIF_PERF_PWR_CNT_LOW0"/>
+	<reg32 offset="0x3111" name="VBIF_PERF_PWR_CNT_LOW1"/>
+	<reg32 offset="0x3112" name="VBIF_PERF_PWR_CNT_LOW2"/>
+	<reg32 offset="0x3118" name="VBIF_PERF_PWR_CNT_HIGH0"/>
+	<reg32 offset="0x3119" name="VBIF_PERF_PWR_CNT_HIGH1"/>
+	<reg32 offset="0x311a" name="VBIF_PERF_PWR_CNT_HIGH2"/>
+
+	<reg32 offset="0x3c01" name="GBIF_SCACHE_CNTL0"/>
+	<reg32 offset="0x3c02" name="GBIF_SCACHE_CNTL1"/>
+	<reg32 offset="0x3c03" name="GBIF_QSB_SIDE0"/>
+	<reg32 offset="0x3c04" name="GBIF_QSB_SIDE1"/>
+	<reg32 offset="0x3c05" name="GBIF_QSB_SIDE2"/>
+	<reg32 offset="0x3c06" name="GBIF_QSB_SIDE3"/>
+	<reg32 offset="0x3c45" name="GBIF_HALT"/>
+	<reg32 offset="0x3c46" name="GBIF_HALT_ACK"/>
+	<reg32 offset="0x3cc0" name="GBIF_PERF_PWR_CNT_EN"/>
+	<reg32 offset="0x3cc1" name="GBIF_PERF_PWR_CNT_CLR"/>
+	<reg32 offset="0x3cc2" name="GBIF_PERF_CNT_SEL"/>
+	<reg32 offset="0x3cc3" name="GBIF_PERF_PWR_CNT_SEL"/>
+	<reg32 offset="0x3cc4" name="GBIF_PERF_CNT_LOW0"/>
+	<reg32 offset="0x3cc5" name="GBIF_PERF_CNT_LOW1"/>
+	<reg32 offset="0x3cc6" name="GBIF_PERF_CNT_LOW2"/>
+	<reg32 offset="0x3cc7" name="GBIF_PERF_CNT_LOW3"/>
+	<reg32 offset="0x3cc8" name="GBIF_PERF_CNT_HIGH0"/>
+	<reg32 offset="0x3cc9" name="GBIF_PERF_CNT_HIGH1"/>
+	<reg32 offset="0x3cca" name="GBIF_PERF_CNT_HIGH2"/>
+	<reg32 offset="0x3ccb" name="GBIF_PERF_CNT_HIGH3"/>
+	<reg32 offset="0x3ccc" name="GBIF_PWR_CNT_LOW0"/>
+	<reg32 offset="0x3ccd" name="GBIF_PWR_CNT_LOW1"/>
+	<reg32 offset="0x3cce" name="GBIF_PWR_CNT_LOW2"/>
+	<reg32 offset="0x3ccf" name="GBIF_PWR_CNT_HIGH0"/>
+	<reg32 offset="0x3cd0" name="GBIF_PWR_CNT_HIGH1"/>
+	<reg32 offset="0x3cd1" name="GBIF_PWR_CNT_HIGH2"/>
+
+	<reg32 offset="0x0c00" name="VSC_DBG_ECO_CNTL"/>
+	<reg32 offset="0x0c02" name="VSC_BIN_SIZE" usage="rp_blit">
+		<bitfield name="WIDTH" low="0" high="7" shr="5" type="uint"/>
+		<bitfield name="HEIGHT" low="8" high="16" shr="4" type="uint"/>
+	</reg32>
+	<reg64 offset="0x0c03" name="VSC_DRAW_STRM_SIZE_ADDRESS" type="waddress" usage="cmd"/>
+	<reg32 offset="0x0c06" name="VSC_BIN_COUNT" usage="rp_blit">
+		<bitfield name="NX" low="1" high="10" type="uint"/>
+		<bitfield name="NY" low="11" high="20" type="uint"/>
+	</reg32>
+	<array offset="0x0c10" name="VSC_PIPE_CONFIG" stride="1" length="32" usage="rp_blit">
+		<reg32 offset="0x0" name="REG">
+			<doc>
+				Configures the mapping between VSC_PIPE buffer and
+				bin, X/Y specify the bin index in the horiz/vert
+				direction (0,0 is upper left, 0,1 is leftmost bin
+				on second row, and so on).  W/H specify the number
+				of bins assigned to this VSC_PIPE in the horiz/vert
+				dimension.
+			</doc>
+			<bitfield name="X" low="0" high="9" type="uint"/>
+			<bitfield name="Y" low="10" high="19" type="uint"/>
+			<bitfield name="W" low="20" high="25" type="uint"/>
+			<bitfield name="H" low="26" high="31" type="uint"/>
+		</reg32>
+	</array>
+	<!--
+	HW binning primitive & draw streams, which enable draws and primitives
+	within a draw to be skipped in the main tile pass.  See:
+	https://github.com/freedreno/freedreno/wiki/Visibility-Stream-Format
+
+	Compared to a5xx and earlier, we just program the address of the first
+	stream and hw adds (pipe_num * VSC_*_STRM_PITCH)
+
+	LIMIT is set to PITCH - 64, to make room for a bit of overflow
+	 -->
+	<reg64 offset="0x0c30" name="VSC_PRIM_STRM_ADDRESS" type="waddress" usage="cmd"/>
+	<reg32 offset="0x0c32" name="VSC_PRIM_STRM_PITCH" usage="cmd"/>
+	<reg32 offset="0x0c33" name="VSC_PRIM_STRM_LIMIT" usage="cmd"/>
+	<reg64 offset="0x0c34" name="VSC_DRAW_STRM_ADDRESS" type="waddress" usage="cmd"/>
+	<reg32 offset="0x0c36" name="VSC_DRAW_STRM_PITCH" usage="cmd"/>
+	<reg32 offset="0x0c37" name="VSC_DRAW_STRM_LIMIT" usage="cmd"/>
+
+	<array offset="0x0c38" name="VSC_STATE" stride="1" length="32" usage="rp_blit">
+		<doc>
+			Seems to be a bitmap of which tiles mapped to the VSC
+			pipe contain geometry.
+
+			I suppose we can connect a maximum of 32 tiles to a
+			single VSC pipe.
+		</doc>
+		<reg32 offset="0x0" name="REG"/>
+	</array>
+
+	<array offset="0x0c58" name="VSC_PRIM_STRM_SIZE" stride="1" length="32" variants="A6XX" usage="rp_blit">
+		<doc>
+			Has the size of data written to corresponding VSC_PRIM_STRM
+			buffer.
+		</doc>
+		<reg32 offset="0x0" name="REG"/>
+	</array>
+
+	<array offset="0x0c78" name="VSC_DRAW_STRM_SIZE" stride="1" length="32" variants="A6XX" usage="rp_blit">
+		<doc>
+			Has the size of data written to corresponding VSC pipe, ie.
+			same thing that is written out to VSC_DRAW_STRM_SIZE_ADDRESS_LO/HI
+		</doc>
+		<reg32 offset="0x0" name="REG"/>
+	</array>
+
+	<reg32 offset="0x0d08" name="VSC_UNKNOWN_0D08" variants="A7XX-" usage="rp_blit"/>
+
+	<reg32 offset="0x0E10" name="UCHE_UNKNOWN_0E10" variants="A7XX-" usage="cmd"/>
+	<reg32 offset="0x0E11" name="UCHE_UNKNOWN_0E11" variants="A7XX-" usage="cmd"/>
+	<!-- always 0x03200000 ? -->
+	<reg32 offset="0x0e12" name="UCHE_UNKNOWN_0E12"  usage="cmd"/>
+
+	<!-- adreno_reg_xy has 15 bits per coordinate, but a6xx registers only have 14 -->
+	<bitset name="a6xx_reg_xy" inline="yes">
+		<bitfield name="X" low="0" high="13" type="uint"/>
+		<bitfield name="Y" low="16" high="29" type="uint"/>
+	</bitset>
+
+	<reg32 offset="0x8000" name="GRAS_CL_CNTL" usage="rp_blit">
+		<bitfield name="CLIP_DISABLE" pos="0" type="boolean"/>
+		<bitfield name="ZNEAR_CLIP_DISABLE" pos="1" type="boolean"/>
+		<bitfield name="ZFAR_CLIP_DISABLE" pos="2" type="boolean"/>
+		<bitfield name="Z_CLAMP_ENABLE" pos="5" type="boolean"/>
+		<!-- controls near z clip behavior (set for vulkan) -->
+		<bitfield name="ZERO_GB_SCALE_Z" pos="6" type="boolean"/>
+		<!-- guess based on a3xx and meaning of bits 8 and 9
+		     if the guess is right then this is related to point sprite clipping -->
+		<bitfield name="VP_CLIP_CODE_IGNORE" pos="7" type="boolean"/>
+		<bitfield name="VP_XFORM_DISABLE" pos="8" type="boolean"/>
+		<bitfield name="PERSP_DIVISION_DISABLE" pos="9" type="boolean"/>
+	</reg32>
+
+	<bitset name="a6xx_gras_xs_cl_cntl" inline="yes">
+		<bitfield name="CLIP_MASK" low="0" high="7"/>
+		<bitfield name="CULL_MASK" low="8" high="15"/>
+	</bitset>
+	<reg32 offset="0x8001" name="GRAS_VS_CL_CNTL" type="a6xx_gras_xs_cl_cntl" usage="rp_blit"/>
+	<reg32 offset="0x8002" name="GRAS_DS_CL_CNTL" type="a6xx_gras_xs_cl_cntl" usage="rp_blit"/>
+	<reg32 offset="0x8003" name="GRAS_GS_CL_CNTL" type="a6xx_gras_xs_cl_cntl" usage="rp_blit"/>
+	<reg32 offset="0x8004" name="GRAS_MAX_LAYER_INDEX" low="0" high="10" type="uint" usage="rp_blit"/>
+
+	<reg32 offset="0x8005" name="GRAS_CNTL" usage="rp_blit">
+		<!-- see also RB_RENDER_CONTROL0 -->
+		<bitfield name="IJ_PERSP_PIXEL" pos="0" type="boolean"/>
+		<bitfield name="IJ_PERSP_CENTROID" pos="1" type="boolean"/>
+		<bitfield name="IJ_PERSP_SAMPLE" pos="2" type="boolean"/>
+		<bitfield name="IJ_LINEAR_PIXEL" pos="3" type="boolean"/>
+		<bitfield name="IJ_LINEAR_CENTROID" pos="4" type="boolean"/>
+		<bitfield name="IJ_LINEAR_SAMPLE" pos="5" type="boolean"/>
+		<bitfield name="COORD_MASK" low="6" high="9" type="hex"/>
+		<bitfield name="UNK10" pos="10" type="boolean" variants="A7XX-"/>
+		<bitfield name="UNK11" pos="11" type="boolean" variants="A7XX-"/>
+	</reg32>
+	<reg32 offset="0x8006" name="GRAS_CL_GUARDBAND_CLIP_ADJ" usage="rp_blit">
+		<bitfield name="HORZ" low="0" high="8" type="uint"/>
+		<bitfield name="VERT" low="10" high="18" type="uint"/>
+	</reg32>
+
+	<!-- Something connected to depth-stencil attachment size -->
+	<reg32 offset="0x8007" name="GRAS_UNKNOWN_8007" variants="A7XX-" usage="rp_blit"/>
+
+	<reg32 offset="0x8008" name="GRAS_UNKNOWN_8008" variants="A7XX-" usage="cmd"/>
+
+	<reg32 offset="0x8009" name="GRAS_UNKNOWN_8009" variants="A7XX-" usage="cmd"/>
+	<reg32 offset="0x800a" name="GRAS_UNKNOWN_800A" variants="A7XX-" usage="cmd"/>
+	<reg32 offset="0x800b" name="GRAS_UNKNOWN_800B" variants="A7XX-" usage="cmd"/>
+	<reg32 offset="0x800c" name="GRAS_UNKNOWN_800C" variants="A7XX-" usage="cmd"/>
+
+	<!-- <reg32 offset="0x80f0" name="GRAS_UNKNOWN_80F0" type="a6xx_reg_xy"/> -->
+
+	<!-- 0x8006-0x800f invalid -->
+	<array offset="0x8010" name="GRAS_CL_VPORT" stride="6" length="16" usage="rp_blit">
+		<reg32 offset="0" name="XOFFSET" type="float"/>
+		<reg32 offset="1" name="XSCALE" type="float"/>
+		<reg32 offset="2" name="YOFFSET" type="float"/>
+		<reg32 offset="3" name="YSCALE" type="float"/>
+		<reg32 offset="4" name="ZOFFSET" type="float"/>
+		<reg32 offset="5" name="ZSCALE" type="float"/>
+	</array>
+	<array offset="0x8070" name="GRAS_CL_Z_CLAMP" stride="2" length="16" usage="rp_blit">
+		<reg32 offset="0" name="MIN" type="float"/>
+		<reg32 offset="1" name="MAX" type="float"/>
+	</array>
+
+	<reg32 offset="0x8090" name="GRAS_SU_CNTL" usage="rp_blit">
+		<bitfield name="CULL_FRONT" pos="0" type="boolean"/>
+		<bitfield name="CULL_BACK" pos="1" type="boolean"/>
+		<bitfield name="FRONT_CW" pos="2" type="boolean"/>
+		<bitfield name="LINEHALFWIDTH" low="3" high="10" radix="2" type="fixed"/>
+		<bitfield name="POLY_OFFSET" pos="11" type="boolean"/>
+		<bitfield name="UNK12" pos="12"/>
+		<bitfield name="LINE_MODE" pos="13" type="a5xx_line_mode"/>
+		<bitfield name="UNK15" low="15" high="16"/>
+		<!--
+                        On gen1 only MULTIVIEW_ENABLE exists. On gen3 we have
+                        the ability to add the view index to either the RT array
+                        index or the viewport index, and it seems that
+                        MULTIVIEW_ENABLE doesn't do anything, instead we need to
+                        set at least one of RENDERTARGETINDEXINCR or
+                        VIEWPORTINDEXINCR to enable multiview. The blob still
+                        sets MULTIVIEW_ENABLE regardless.
+                        TODO: what about gen2 (a640)?
+		-->
+		<bitfield name="MULTIVIEW_ENABLE" pos="17" type="boolean"/>
+		<bitfield name="RENDERTARGETINDEXINCR" pos="18" type="boolean"/>
+		<bitfield name="VIEWPORTINDEXINCR" pos="19" type="boolean"/>
+		<bitfield name="UNK20" low="20" high="22"/>
+	</reg32>
+	<reg32 offset="0x8091" name="GRAS_SU_POINT_MINMAX" usage="rp_blit">
+		<bitfield name="MIN" low="0" high="15" type="ufixed" radix="4"/>
+		<bitfield name="MAX" low="16" high="31" type="ufixed" radix="4"/>
+	</reg32>
+	<reg32 offset="0x8092" name="GRAS_SU_POINT_SIZE" low="0" high="15" type="fixed" radix="4" usage="rp_blit"/>
+	<!-- 0x8093 invalid -->
+	<reg32 offset="0x8094" name="GRAS_SU_DEPTH_PLANE_CNTL" usage="rp_blit">
+		<bitfield name="Z_MODE" low="0" high="1" type="a6xx_ztest_mode"/>
+	</reg32>
+	<reg32 offset="0x8095" name="GRAS_SU_POLY_OFFSET_SCALE" type="float" usage="rp_blit"/>
+	<reg32 offset="0x8096" name="GRAS_SU_POLY_OFFSET_OFFSET" type="float" usage="rp_blit"/>
+	<reg32 offset="0x8097" name="GRAS_SU_POLY_OFFSET_OFFSET_CLAMP" type="float" usage="rp_blit"/>
+	<!-- duplicates RB_DEPTH_BUFFER_INFO: -->
+	<reg32 offset="0x8098" name="GRAS_SU_DEPTH_BUFFER_INFO" usage="rp_blit">
+		<bitfield name="DEPTH_FORMAT" low="0" high="2" type="a6xx_depth_format"/>
+		<bitfield name="UNK3" pos="3"/>
+	</reg32>
+
+	<reg32 offset="0x8099" name="GRAS_SU_CONSERVATIVE_RAS_CNTL" usage="cmd">
+		<bitfield name="CONSERVATIVERASEN" pos="0" type="boolean"/>
+		<bitfield name="SHIFTAMOUNT" low="1" high="2"/>
+		<bitfield name="INNERCONSERVATIVERASEN" pos="3" type="boolean"/>
+		<bitfield name="UNK4" low="4" high="5"/>
+	</reg32>
+	<reg32 offset="0x809a" name="GRAS_SU_PATH_RENDERING_CNTL">
+		<bitfield name="UNK0" pos="0" type="boolean"/>
+		<bitfield name="LINELENGTHEN" pos="1" type="boolean"/>
+	</reg32>
+
+	<bitset name="a6xx_gras_layer_cntl" inline="yes">
+		<bitfield name="WRITES_LAYER" pos="0" type="boolean"/>
+		<bitfield name="WRITES_VIEW" pos="1" type="boolean"/>
+	</bitset>
+	<reg32 offset="0x809b" name="GRAS_VS_LAYER_CNTL" type="a6xx_gras_layer_cntl" usage="rp_blit"/>
+	<reg32 offset="0x809c" name="GRAS_GS_LAYER_CNTL" type="a6xx_gras_layer_cntl" usage="rp_blit"/>
+	<reg32 offset="0x809d" name="GRAS_DS_LAYER_CNTL" type="a6xx_gras_layer_cntl" usage="rp_blit"/>
+	<!-- 0x809e/0x809f invalid -->
+
+	<enum name="a6xx_sequenced_thread_dist">
+		<value value="0x0" name="DIST_SCREEN_COORD"/>
+		<value value="0x1" name="DIST_ALL_TO_RB0"/>
+	</enum>
+
+	<enum name="a6xx_single_prim_mode">
+		<value value="0x0" name="NO_FLUSH"/>
+		<doc>
+			In addition to FLUSH_PER_OVERLAP, guarantee that UCHE
+			and CCU don't get out of sync when fetching the previous
+			value for the current pixel. With NO_FLUSH, there's the
+			possibility that the flags for the current pixel are
+			flushed before the data or vice-versa, leading to
+			texture fetches via UCHE getting out of sync values.
+			This mode should eliminate that. It's used in bypass
+			mode for coherent blending
+			(GL_KHR_blend_equation_advanced_coherent) as well as
+			non-coherent blending.
+		</doc>
+		<value value="0x1" name="FLUSH_PER_OVERLAP_AND_OVERWRITE"/>
+		<doc>
+			Invalidate UCHE and wait for any pending work to finish
+			if there was possibly an overlapping primitive prior to
+			the current one. This is similar to a combination of
+			GRAS_SC_CONTROL::INJECT_L2_INVALIDATE_EVENT and
+			WAIT_RB_IDLE_ALL_TRI on a3xx. It's used in GMEM mode for
+			coherent blending
+			(GL_KHR_blend_equation_advanced_coherent).
+		</doc>
+		<value value="0x3" name="FLUSH_PER_OVERLAP"/>
+	</enum>
+
+	<!-- this probably has the same meaning as a3xx GRAS_SC_CONTROL::RASTER_MODE -->
+	<enum name="a6xx_raster_mode">
+		<value value="0x0" name="TYPE_TILED"/>
+		<value value="0x1" name="TYPE_WRITER"/>
+	</enum>
+
+	<!-- I'm guessing this is the same as a3xx -->
+	<enum name="a6xx_raster_direction">
+		<value value="0x0" name="LR_TB"/>
+		<value value="0x1" name="RL_TB"/>
+		<value value="0x2" name="LR_BT"/>
+		<value value="0x3" name="RB_BT"/>
+	</enum>
+
+	<reg32 offset="0x80a0" name="GRAS_SC_CNTL" usage="rp_blit">
+		<bitfield name="CCUSINGLECACHELINESIZE" low="0" high="2"/>
+		<bitfield name="SINGLE_PRIM_MODE" low="3" high="4" type="a6xx_single_prim_mode"/>
+		<bitfield name="RASTER_MODE" pos="5" type="a6xx_raster_mode"/>
+		<bitfield name="RASTER_DIRECTION" low="6" high="7" type="a6xx_raster_direction"/>
+		<bitfield name="SEQUENCED_THREAD_DISTRIBUTION" pos="8" type="a6xx_sequenced_thread_dist"/>
+		<!-- CCUSINGLECACHELINESIZE is ignored unless bit 9 is set -->
+		<bitfield name="UNK9" pos="9" type="boolean"/>
+		<bitfield name="ROTATION" low="10" high="11" type="uint"/>
+		<bitfield name="EARLYVIZOUTEN" pos="12" type="boolean"/>
+	</reg32>
+
+	<enum name="a6xx_render_mode">
+		<value value="0x0" name="RENDERING_PASS"/>
+		<value value="0x1" name="BINNING_PASS"/>
+	</enum>
+
+	<enum name="a6xx_buffers_location">
+		<value value="0" name="BUFFERS_IN_GMEM"/>
+		<value value="3" name="BUFFERS_IN_SYSMEM"/>
+	</enum>
+
+	<reg32 offset="0x80a1" name="GRAS_BIN_CONTROL" usage="rp_blit">
+		<bitfield name="BINW" low="0" high="5" shr="5" type="uint"/>
+		<bitfield name="BINH" low="8" high="14" shr="4" type="uint"/>
+		<bitfield name="RENDER_MODE" low="18" high="20" type="a6xx_render_mode"/>
+		<bitfield name="FORCE_LRZ_WRITE_DIS" pos="21" type="boolean"/>
+		<bitfield name="BUFFERS_LOCATION" low="22" high="23" type="a6xx_buffers_location" variants="A6XX"/>
+		<bitfield name="LRZ_FEEDBACK_ZMODE_MASK" low="24" high="26"/>
+		<bitfield name="UNK27" pos="27"/>
+	</reg32>
+
+	<reg32 offset="0x80a2" name="GRAS_RAS_MSAA_CNTL" usage="rp_blit">
+		<bitfield name="SAMPLES" low="0" high="1" type="a3xx_msaa_samples"/>
+		<bitfield name="UNK2" pos="2"/>
+		<bitfield name="UNK3" pos="3"/>
+	</reg32>
+	<reg32 offset="0x80a3" name="GRAS_DEST_MSAA_CNTL" usage="rp_blit">
+		<bitfield name="SAMPLES" low="0" high="1" type="a3xx_msaa_samples"/>
+		<bitfield name="MSAA_DISABLE" pos="2" type="boolean"/>
+	</reg32>
+
+	<bitset name="a6xx_sample_config" inline="yes">
+		<bitfield name="UNK0" pos="0"/>
+		<bitfield name="LOCATION_ENABLE" pos="1" type="boolean"/>
+	</bitset>
+
+	<bitset name="a6xx_sample_locations" inline="yes">
+		<bitfield name="SAMPLE_0_X" low="0" high="3" radix="4" type="fixed"/>
+		<bitfield name="SAMPLE_0_Y" low="4" high="7" radix="4" type="fixed"/>
+		<bitfield name="SAMPLE_1_X" low="8" high="11" radix="4" type="fixed"/>
+		<bitfield name="SAMPLE_1_Y" low="12" high="15" radix="4" type="fixed"/>
+		<bitfield name="SAMPLE_2_X" low="16" high="19" radix="4" type="fixed"/>
+		<bitfield name="SAMPLE_2_Y" low="20" high="23" radix="4" type="fixed"/>
+		<bitfield name="SAMPLE_3_X" low="24" high="27" radix="4" type="fixed"/>
+		<bitfield name="SAMPLE_3_Y" low="28" high="31" radix="4" type="fixed"/>
+	</bitset>
+
+	<reg32 offset="0x80a4" name="GRAS_SAMPLE_CONFIG" type="a6xx_sample_config" usage="rp_blit"/>
+	<reg32 offset="0x80a5" name="GRAS_SAMPLE_LOCATION_0" type="a6xx_sample_locations" usage="rp_blit"/>
+	<reg32 offset="0x80a6" name="GRAS_SAMPLE_LOCATION_1" type="a6xx_sample_locations" usage="rp_blit"/>
+
+	<reg32 offset="0x80a7" name="GRAS_UNKNOWN_80A7" variants="A7XX-" usage="cmd"/>
+
+	<!-- 0x80a7-0x80ae invalid -->
+	<reg32 offset="0x80af" name="GRAS_UNKNOWN_80AF" pos="0" usage="cmd"/>
+
+	<bitset name="a6xx_scissor_xy" inline="yes">
+		<bitfield name="X" low="0" high="15" type="uint"/>
+		<bitfield name="Y" low="16" high="31" type="uint"/>
+	</bitset>
+	<array offset="0x80b0" name="GRAS_SC_SCREEN_SCISSOR" stride="2" length="16" usage="rp_blit">
+		<reg32 offset="0" name="TL" type="a6xx_scissor_xy"/>
+		<reg32 offset="1" name="BR" type="a6xx_scissor_xy"/>
+	</array>
+	<array offset="0x80d0" name="GRAS_SC_VIEWPORT_SCISSOR" stride="2" length="16" usage="rp_blit">
+		<reg32 offset="0" name="TL" type="a6xx_scissor_xy"/>
+		<reg32 offset="1" name="BR" type="a6xx_scissor_xy"/>
+	</array>
+
+	<reg32 offset="0x80f0" name="GRAS_SC_WINDOW_SCISSOR_TL" type="a6xx_reg_xy" usage="rp_blit"/>
+	<reg32 offset="0x80f1" name="GRAS_SC_WINDOW_SCISSOR_BR" type="a6xx_reg_xy" usage="rp_blit"/>
+
+	<!-- 0x80f4 - 0x80fa are used for VK_KHR_fragment_shading_rate -->
+	<reg64 offset="0x80f4" name="GRAS_UNKNOWN_80F4" variants="A7XX-" usage="cmd"/>
+	<reg64 offset="0x80f5" name="GRAS_UNKNOWN_80F5" variants="A7XX-" usage="cmd"/>
+	<reg64 offset="0x80f6" name="GRAS_UNKNOWN_80F6" variants="A7XX-" usage="cmd"/>
+	<reg64 offset="0x80f8" name="GRAS_UNKNOWN_80F8" variants="A7XX-" usage="cmd"/>
+	<reg64 offset="0x80f9" name="GRAS_UNKNOWN_80F9" variants="A7XX-" usage="cmd"/>
+	<reg64 offset="0x80fa" name="GRAS_UNKNOWN_80FA" variants="A7XX-" usage="cmd"/>
+
+	<enum name="a6xx_lrz_dir_status">
+		<value value="0x1" name="LRZ_DIR_LE"/>
+		<value value="0x2" name="LRZ_DIR_GE"/>
+		<value value="0x3" name="LRZ_DIR_INVALID"/>
+	</enum>
+
+	<reg32 offset="0x8100" name="GRAS_LRZ_CNTL" usage="rp_blit">
+		<bitfield name="ENABLE" pos="0" type="boolean"/>
+		<doc>LRZ write also disabled for blend/etc.</doc>
+		<bitfield name="LRZ_WRITE" pos="1" type="boolean"/>
+		<doc>update MAX instead of MIN value, ie. GL_GREATER/GL_GEQUAL</doc>
+		<bitfield name="GREATER" pos="2" type="boolean"/>
+		<doc>
+			Clears the LRZ block being touched to:
+			- 0.0 if GREATER
+			- 1.0 if LESS
+		</doc>
+		<bitfield name="FC_ENABLE" pos="3" type="boolean"/>
+		<!-- set when depth-test + depth-write enabled -->
+		<bitfield name="Z_TEST_ENABLE" pos="4" type="boolean"/>
+		<bitfield name="Z_BOUNDS_ENABLE" pos="5" type="boolean"/>
+		<bitfield name="DIR" low="6" high="7" type="a6xx_lrz_dir_status"/>
+		<doc>
+			If DISABLE_ON_WRONG_DIR enabled - write new LRZ direction into
+			buffer, in case of mismatched direction writes 0 (disables LRZ).
+		</doc>
+		<bitfield name="DIR_WRITE" pos="8" type="boolean"/>
+		<doc>
+			Disable LRZ based on previous direction and the current one.
+			If DIR_WRITE is not enabled - there is no write to direction buffer.
+		</doc>
+		<bitfield name="DISABLE_ON_WRONG_DIR" pos="9" type="boolean"/>
+		<bitfield name="Z_FUNC" low="11" high="13" type="adreno_compare_func" variants="A7XX-"/>
+	</reg32>
+
+	<enum name="a6xx_fragcoord_sample_mode">
+		<value value="0" name="FRAGCOORD_CENTER"/>
+		<value value="3" name="FRAGCOORD_SAMPLE"/>
+	</enum>
+
+	<reg32 offset="0x8101" name="GRAS_LRZ_PS_INPUT_CNTL" low="0" high="2" usage="rp_blit">
+		<bitfield name="SAMPLEID" pos="0" type="boolean"/>
+		<bitfield name="FRAGCOORDSAMPLEMODE" low="1" high="2" type="a6xx_fragcoord_sample_mode"/>
+	</reg32>
+
+	<reg32 offset="0x8102" name="GRAS_LRZ_MRT_BUF_INFO_0" usage="rp_blit">
+		<bitfield name="COLOR_FORMAT" low="0" high="7" type="a6xx_format"/>
+	</reg32>
+	<reg64 offset="0x8103" name="GRAS_LRZ_BUFFER_BASE" align="256" type="waddress" usage="rp_blit"/>
+	<reg32 offset="0x8105" name="GRAS_LRZ_BUFFER_PITCH" usage="rp_blit">
+		<!-- TODO: fix the shr fields -->
+		<bitfield name="PITCH" low="0" high="7" shr="5" type="uint"/>
+		<bitfield name="ARRAY_PITCH" low="10" high="28" shr="4" type="uint"/>
+	</reg32>
+
+	<!--
+	The LRZ "fast clear" buffer is initialized to zero's by blob, and
+	read/written when GRAS_LRZ_CNTL.FC_ENABLE (b3) is set.  It appears
+	to store 1b/block.  It appears that '0' means block has original
+	depth clear value, and '1' means that the corresponding block in
+	LRZ has been modified.  Ignoring alignment/padding, the size is
+	given by the formula:
+
+		// calculate LRZ size from depth size:
+		if (nr_samples == 4) {
+			width *= 2;
+			height *= 2;
+		} else if (nr_samples == 2) {
+			height *= 2;
+		}
+
+		lrz_width = div_round_up(width, 8);
+		lrz_heigh = div_round_up(height, 8);
+
+		// calculate # of blocks:
+		nblocksx = div_round_up(lrz_width, 16);
+		nblocksy = div_round_up(lrz_height, 4);
+
+		// fast-clear buffer is 1bit/block:
+		fc_sz = div_round_up(nblocksx * nblocksy, 8);
+
+	In practice the blob seems to switch off FC_ENABLE once the size
+	increases beyond 1 page.  Not sure if that is an actual limit or
+	not.
+	 -->
+	<reg64 offset="0x8106" name="GRAS_LRZ_FAST_CLEAR_BUFFER_BASE" align="64" type="waddress" usage="rp_blit"/>
+	<!-- 0x8108 invalid -->
+	<reg32 offset="0x8109" name="GRAS_SAMPLE_CNTL" usage="rp_blit">
+		<bitfield name="PER_SAMP_MODE" pos="0" type="boolean"/>
+	</reg32>
+	<!--
+	LRZ buffer represents a single array layer + mip level, and there is
+	a single buffer per depth image. Thus to reuse LRZ between renderpasses
+	it is necessary to track the depth view used in the past renderpass, which
+	GRAS_LRZ_DEPTH_VIEW is for.
+	GRAS_LRZ_CNTL checks if current value of GRAS_LRZ_DEPTH_VIEW is equal to
+	the value stored in the LRZ buffer, if not - LRZ is disabled.
+	-->
+	<reg32 offset="0x810a" name="GRAS_LRZ_DEPTH_VIEW" usage="cmd">
+		<bitfield name="BASE_LAYER" low="0" high="10" type="uint"/>
+		<bitfield name="LAYER_COUNT" low="16" high="26" type="uint"/>
+		<bitfield name="BASE_MIP_LEVEL" low="28" high="31" type="uint"/>
+	</reg32>
+
+	<reg32 offset="0x810b" name="GRAS_UNKNOWN_810B" variants="A7XX-" usage="cmd"/>
+
+	<!-- 0x810c-0x810f invalid -->
+
+	<reg32 offset="0x8110" name="GRAS_UNKNOWN_8110" low="0" high="1" usage="cmd"/>
+
+	<!-- A bit tentative but it's a color and it is followed by LRZ_CLEAR -->
+	<reg32 offset="0x8111" name="GRAS_LRZ_CLEAR_DEPTH_F32" type="float" variants="A7XX-"/>
+
+	<reg32 offset="0x8113" name="GRAS_LRZ_DEPTH_BUFFER_INFO" variants="A7XX-" usage="rp_blit"/>
+
+	<!-- Always written together and always equal 09510840 00000a62 -->
+	<reg32 offset="0x8120" name="GRAS_UNKNOWN_8120" variants="A7XX-" usage="cmd"/>
+	<reg32 offset="0x8121" name="GRAS_UNKNOWN_8121" variants="A7XX-" usage="cmd"/>
+
+	<!-- 0x8112-0x83ff invalid -->
+
+	<enum name="a6xx_rotation">
+		<value value="0x0" name="ROTATE_0"/>
+		<value value="0x1" name="ROTATE_90"/>
+		<value value="0x2" name="ROTATE_180"/>
+		<value value="0x3" name="ROTATE_270"/>
+		<value value="0x4" name="ROTATE_HFLIP"/>
+		<value value="0x5" name="ROTATE_VFLIP"/>
+	</enum>
+
+	<bitset name="a6xx_2d_blit_cntl" inline="yes">
+		<bitfield name="ROTATE" low="0" high="2" type="a6xx_rotation"/>
+		<bitfield name="OVERWRITEEN" pos="3" type="boolean"/>
+		<bitfield name="UNK4" low="4" high="6"/>
+		<bitfield name="SOLID_COLOR" pos="7" type="boolean"/>
+		<bitfield name="COLOR_FORMAT" low="8" high="15" type="a6xx_format"/>
+		<bitfield name="SCISSOR" pos="16" type="boolean"/>
+		<bitfield name="UNK17" low="17" high="18"/>
+		<!-- required when blitting D24S8/D24X8 -->
+		<bitfield name="D24S8" pos="19" type="boolean"/>
+		<!-- some sort of channel mask, disabled channels are set to zero ? -->
+		<bitfield name="MASK" low="20" high="23"/>
+		<bitfield name="IFMT" low="24" high="28" type="a6xx_2d_ifmt"/>
+		<bitfield name="RASTER_MODE" pos="29" type="a6xx_raster_mode"/>
+		<bitfield name="UNK30" pos="30" type="boolean" variants="A7XX-"/>
+	</bitset>
+
+	<reg32 offset="0x8400" name="GRAS_2D_BLIT_CNTL" type="a6xx_2d_blit_cntl" usage="rp_blit"/>
+	<!-- note: the low 8 bits for src coords are valid, probably fixed point
+	     it would be a bit weird though, since we subtract 1 from BR coords
+	     apparently signed, gallium driver uses negative coords and it works?
+	 -->
+	<reg32 offset="0x8401" name="GRAS_2D_SRC_TL_X" low="8" high="24" type="int" usage="rp_blit"/>
+	<reg32 offset="0x8402" name="GRAS_2D_SRC_BR_X" low="8" high="24" type="int" usage="rp_blit"/>
+	<reg32 offset="0x8403" name="GRAS_2D_SRC_TL_Y" low="8" high="24" type="int" usage="rp_blit"/>
+	<reg32 offset="0x8404" name="GRAS_2D_SRC_BR_Y" low="8" high="24" type="int" usage="rp_blit"/>
+	<reg32 offset="0x8405" name="GRAS_2D_DST_TL" type="a6xx_reg_xy" usage="rp_blit"/>
+	<reg32 offset="0x8406" name="GRAS_2D_DST_BR" type="a6xx_reg_xy" usage="rp_blit"/>
+	<reg32 offset="0x8407" name="GRAS_2D_UNKNOWN_8407" low="0" high="31"/>
+	<reg32 offset="0x8408" name="GRAS_2D_UNKNOWN_8408" low="0" high="31"/>
+	<reg32 offset="0x8409" name="GRAS_2D_UNKNOWN_8409" low="0" high="31"/>
+	<reg32 offset="0x840a" name="GRAS_2D_RESOLVE_CNTL_1" type="a6xx_reg_xy" usage="rp_blit"/>
+	<reg32 offset="0x840b" name="GRAS_2D_RESOLVE_CNTL_2" type="a6xx_reg_xy" usage="rp_blit"/>
+	<!-- 0x840c-0x85ff invalid -->
+
+	<!-- always 0x880 ? (and 0 in a640/a650 traces?) -->
+	<reg32 offset="0x8600" name="GRAS_DBG_ECO_CNTL" usage="cmd">
+		<bitfield name="UNK7" pos="7" type="boolean"/>
+		<bitfield name="LRZCACHELOCKDIS" pos="11" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x8601" name="GRAS_ADDR_MODE_CNTL" pos="0" type="a5xx_address_mode"/>
+	<reg32 offset="0x8602" name="GRAS_NC_MODE_CNTL" variants="A7XX-"/>
+	<array offset="0x8610" name="GRAS_PERFCTR_TSE_SEL" stride="1" length="4"/>
+	<array offset="0x8614" name="GRAS_PERFCTR_RAS_SEL" stride="1" length="4"/>
+	<array offset="0x8618" name="GRAS_PERFCTR_LRZ_SEL" stride="1" length="4"/>
+
+	<!-- note 0x8620-0x87ff are not all invalid
+	(in particular, 0x8631/0x8632 have 0x3fff3fff mask and would be xy coords)
+	-->
+
+	<!-- same as GRAS_BIN_CONTROL, but without bit 27: -->
+	<reg32 offset="0x8800" name="RB_BIN_CONTROL" variants="A6XX" usage="rp_blit">
+		<bitfield name="BINW" low="0" high="5" shr="5" type="uint"/>
+		<bitfield name="BINH" low="8" high="14" shr="4" type="uint"/>
+		<bitfield name="RENDER_MODE" low="18" high="20" type="a6xx_render_mode"/>
+		<bitfield name="FORCE_LRZ_WRITE_DIS" pos="21" type="boolean"/>
+		<bitfield name="BUFFERS_LOCATION" low="22" high="23" type="a6xx_buffers_location"/>
+		<bitfield name="LRZ_FEEDBACK_ZMODE_MASK" low="24" high="26"/>
+	</reg32>
+
+	<reg32 offset="0x8800" name="RB_BIN_CONTROL" variants="A7XX-" usage="rp_blit">
+		<bitfield name="BINW" low="0" high="5" shr="5" type="uint"/>
+		<bitfield name="BINH" low="8" high="14" shr="4" type="uint"/>
+		<bitfield name="RENDER_MODE" low="18" high="20" type="a6xx_render_mode"/>
+		<bitfield name="FORCE_LRZ_WRITE_DIS" pos="21" type="boolean"/>
+		<bitfield name="LRZ_FEEDBACK_ZMODE_MASK" low="24" high="26"/>
+	</reg32>
+
+	<reg32 offset="0x8801" name="RB_RENDER_CNTL" variants="A6XX" usage="rp_blit">
+		<bitfield name="CCUSINGLECACHELINESIZE" low="3" high="5"/>
+		<bitfield name="EARLYVIZOUTEN" pos="6" type="boolean"/>
+		<!-- set during binning pass: -->
+		<bitfield name="BINNING" pos="7" type="boolean"/>
+		<bitfield name="UNK8" low="8" high="10"/>
+		<bitfield name="RASTER_MODE" pos="8" type="a6xx_raster_mode"/>
+		<bitfield name="RASTER_DIRECTION" low="9" high="10" type="a6xx_raster_direction"/>
+		<bitfield name="CONSERVATIVERASEN" pos="11" type="boolean"/>
+		<bitfield name="INNERCONSERVATIVERASEN" pos="12" type="boolean"/>
+		<!-- bit seems to be set whenever depth buffer enabled: -->
+		<bitfield name="FLAG_DEPTH" pos="14" type="boolean"/>
+		<!-- bitmask of MRTs using UBWC flag buffer: -->
+		<bitfield name="FLAG_MRTS" low="16" high="23"/>
+	</reg32>
+	<reg32 offset="0x8801" name="RB_RENDER_CNTL" variants="A7XX-" usage="rp_blit">
+		<bitfield name="EARLYVIZOUTEN" pos="6" type="boolean"/>
+		<!-- set during binning pass: -->
+		<bitfield name="BINNING" pos="7" type="boolean"/>
+		<bitfield name="RASTER_MODE" pos="8" type="a6xx_raster_mode"/>
+		<bitfield name="RASTER_DIRECTION" low="9" high="10" type="a6xx_raster_direction"/>
+		<bitfield name="CONSERVATIVERASEN" pos="11" type="boolean"/>
+		<bitfield name="INNERCONSERVATIVERASEN" pos="12" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x8116" name="GRAS_SU_RENDER_CNTL" variants="A7XX-" usage="rp_blit">
+		<bitfield name="BINNING" pos="7" type="boolean"/>
+	</reg32>
+
+	<reg32 offset="0x8802" name="RB_RAS_MSAA_CNTL" usage="rp_blit">
+		<bitfield name="SAMPLES" low="0" high="1" type="a3xx_msaa_samples"/>
+		<bitfield name="UNK2" pos="2"/>
+		<bitfield name="UNK3" pos="3"/>
+	</reg32>
+	<reg32 offset="0x8803" name="RB_DEST_MSAA_CNTL" usage="rp_blit">
+		<bitfield name="SAMPLES" low="0" high="1" type="a3xx_msaa_samples"/>
+		<bitfield name="MSAA_DISABLE" pos="2" type="boolean"/>
+	</reg32>
+
+	<reg32 offset="0x8804" name="RB_SAMPLE_CONFIG" type="a6xx_sample_config" usage="rp_blit"/>
+	<reg32 offset="0x8805" name="RB_SAMPLE_LOCATION_0" type="a6xx_sample_locations" usage="rp_blit"/>
+	<reg32 offset="0x8806" name="RB_SAMPLE_LOCATION_1" type="a6xx_sample_locations" usage="rp_blit"/>
+	<!-- 0x8807-0x8808 invalid -->
+	<!--
+	note: maybe not actually called RB_RENDER_CONTROLn (since RB_RENDER_CNTL
+	name comes from kernel and is probably right)
+	 -->
+	<reg32 offset="0x8809" name="RB_RENDER_CONTROL0" usage="rp_blit">
+		<!-- see also GRAS_CNTL -->
+		<bitfield name="IJ_PERSP_PIXEL" pos="0" type="boolean"/>
+		<bitfield name="IJ_PERSP_CENTROID" pos="1" type="boolean"/>
+		<bitfield name="IJ_PERSP_SAMPLE" pos="2" type="boolean"/>
+		<bitfield name="IJ_LINEAR_PIXEL" pos="3" type="boolean"/>
+		<bitfield name="IJ_LINEAR_CENTROID" pos="4" type="boolean"/>
+		<bitfield name="IJ_LINEAR_SAMPLE" pos="5" type="boolean"/>
+		<bitfield name="COORD_MASK" low="6" high="9" type="hex"/>
+		<bitfield name="UNK10" pos="10" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x880a" name="RB_RENDER_CONTROL1" usage="rp_blit">
+		<!-- enable bits for various FS sysvalue regs: -->
+		<bitfield name="SAMPLEMASK" pos="0" type="boolean"/>
+		<bitfield name="POSTDEPTHCOVERAGE" pos="1" type="boolean"/>
+		<bitfield name="FACENESS" pos="2" type="boolean"/>
+		<bitfield name="SAMPLEID" pos="3" type="boolean"/>
+		<bitfield name="FRAGCOORDSAMPLEMODE" low="4" high="5" type="a6xx_fragcoord_sample_mode"/>
+		<bitfield name="CENTERRHW" pos="6" type="boolean"/>
+		<bitfield name="LINELENGTHEN" pos="7" type="boolean"/>
+		<bitfield name="FOVEATION" pos="8" type="boolean"/>
+	</reg32>
+
+	<reg32 offset="0x880b" name="RB_FS_OUTPUT_CNTL0" usage="rp_blit">
+		<bitfield name="DUAL_COLOR_IN_ENABLE" pos="0" type="boolean"/>
+		<bitfield name="FRAG_WRITES_Z" pos="1" type="boolean"/>
+		<bitfield name="FRAG_WRITES_SAMPMASK" pos="2" type="boolean"/>
+		<bitfield name="FRAG_WRITES_STENCILREF" pos="3" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x880c" name="RB_FS_OUTPUT_CNTL1" usage="rp_blit">
+		<bitfield name="MRT" low="0" high="3" type="uint"/>
+	</reg32>
+	<reg32 offset="0x880d" name="RB_RENDER_COMPONENTS" usage="rp_blit">
+		<bitfield name="RT0" low="0" high="3"/>
+		<bitfield name="RT1" low="4" high="7"/>
+		<bitfield name="RT2" low="8" high="11"/>
+		<bitfield name="RT3" low="12" high="15"/>
+		<bitfield name="RT4" low="16" high="19"/>
+		<bitfield name="RT5" low="20" high="23"/>
+		<bitfield name="RT6" low="24" high="27"/>
+		<bitfield name="RT7" low="28" high="31"/>
+	</reg32>
+	<reg32 offset="0x880e" name="RB_DITHER_CNTL" usage="cmd">
+		<bitfield name="DITHER_MODE_MRT0" low="0"  high="1"  type="adreno_rb_dither_mode"/>
+		<bitfield name="DITHER_MODE_MRT1" low="2"  high="3"  type="adreno_rb_dither_mode"/>
+		<bitfield name="DITHER_MODE_MRT2" low="4"  high="5"  type="adreno_rb_dither_mode"/>
+		<bitfield name="DITHER_MODE_MRT3" low="6"  high="7"  type="adreno_rb_dither_mode"/>
+		<bitfield name="DITHER_MODE_MRT4" low="8"  high="9"  type="adreno_rb_dither_mode"/>
+		<bitfield name="DITHER_MODE_MRT5" low="10" high="11" type="adreno_rb_dither_mode"/>
+		<bitfield name="DITHER_MODE_MRT6" low="12" high="13" type="adreno_rb_dither_mode"/>
+		<bitfield name="DITHER_MODE_MRT7" low="14" high="15" type="adreno_rb_dither_mode"/>
+	</reg32>
+	<reg32 offset="0x880f" name="RB_SRGB_CNTL" usage="rp_blit">
+		<!-- Same as SP_SRGB_CNTL -->
+		<bitfield name="SRGB_MRT0" pos="0" type="boolean"/>
+		<bitfield name="SRGB_MRT1" pos="1" type="boolean"/>
+		<bitfield name="SRGB_MRT2" pos="2" type="boolean"/>
+		<bitfield name="SRGB_MRT3" pos="3" type="boolean"/>
+		<bitfield name="SRGB_MRT4" pos="4" type="boolean"/>
+		<bitfield name="SRGB_MRT5" pos="5" type="boolean"/>
+		<bitfield name="SRGB_MRT6" pos="6" type="boolean"/>
+		<bitfield name="SRGB_MRT7" pos="7" type="boolean"/>
+	</reg32>
+
+	<reg32 offset="0x8810" name="RB_SAMPLE_CNTL" usage="rp_blit">
+		<bitfield name="PER_SAMP_MODE" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x8811" name="RB_UNKNOWN_8811" low="4" high="6" usage="cmd"/>
+	<reg32 offset="0x8812" name="RB_UNKNOWN_8812" variants="A7XX-" usage="rp_blit"/>
+	<!-- 0x8813-0x8817 invalid -->
+	<!-- always 0x0 ? -->
+	<reg32 offset="0x8818" name="RB_UNKNOWN_8818" low="0" high="6" usage="cmd"/>
+	<!-- 0x8819-0x881e all 32 bits -->
+	<reg32 offset="0x8819" name="RB_UNKNOWN_8819" usage="cmd"/>
+	<reg32 offset="0x881a" name="RB_UNKNOWN_881A" usage="cmd"/>
+	<reg32 offset="0x881b" name="RB_UNKNOWN_881B" usage="cmd"/>
+	<reg32 offset="0x881c" name="RB_UNKNOWN_881C" usage="cmd"/>
+	<reg32 offset="0x881d" name="RB_UNKNOWN_881D" usage="cmd"/>
+	<reg32 offset="0x881e" name="RB_UNKNOWN_881E" usage="cmd"/>
+	<!-- 0x881f invalid -->
+	<array offset="0x8820" name="RB_MRT" stride="8" length="8" usage="rp_blit">
+		<reg32 offset="0x0" name="CONTROL">
+			<bitfield name="BLEND" pos="0" type="boolean"/>
+			<bitfield name="BLEND2" pos="1" type="boolean"/>
+			<bitfield name="ROP_ENABLE" pos="2" type="boolean"/>
+			<bitfield name="ROP_CODE" low="3" high="6" type="a3xx_rop_code"/>
+			<bitfield name="COMPONENT_ENABLE" low="7" high="10" type="hex"/>
+		</reg32>
+		<reg32 offset="0x1" name="BLEND_CONTROL">
+			<bitfield name="RGB_SRC_FACTOR" low="0" high="4" type="adreno_rb_blend_factor"/>
+			<bitfield name="RGB_BLEND_OPCODE" low="5" high="7" type="a3xx_rb_blend_opcode"/>
+			<bitfield name="RGB_DEST_FACTOR" low="8" high="12" type="adreno_rb_blend_factor"/>
+			<bitfield name="ALPHA_SRC_FACTOR" low="16" high="20" type="adreno_rb_blend_factor"/>
+			<bitfield name="ALPHA_BLEND_OPCODE" low="21" high="23" type="a3xx_rb_blend_opcode"/>
+			<bitfield name="ALPHA_DEST_FACTOR" low="24" high="28" type="adreno_rb_blend_factor"/>
+		</reg32>
+		<reg32 offset="0x2" name="BUF_INFO" variants="A6XX">
+			<bitfield name="COLOR_FORMAT" low="0" high="7" type="a6xx_format"/>
+			<bitfield name="COLOR_TILE_MODE" low="8" high="9" type="a6xx_tile_mode"/>
+			<bitfield name="UNK10" pos="10"/>
+			<bitfield name="COLOR_SWAP" low="13" high="14" type="a3xx_color_swap"/>
+		</reg32>
+		<reg32 offset="0x2" name="BUF_INFO" variants="A7XX-">
+			<bitfield name="COLOR_FORMAT" low="0" high="7" type="a6xx_format"/>
+			<bitfield name="COLOR_TILE_MODE" low="8" high="9" type="a6xx_tile_mode"/>
+			<bitfield name="UNK10" pos="10"/>
+			<bitfield name="LOSSLESSCOMPEN" pos="11" type="boolean"/>
+			<bitfield name="COLOR_SWAP" low="13" high="14" type="a3xx_color_swap"/>
+		</reg32>
+		<!--
+		at least in gmem, things seem to be aligned to pitch of 64..
+		maybe an artifact of tiled format used in gmem?
+		 -->
+		<reg32 offset="0x3" name="PITCH" shr="6" high="15" type="uint"/>
+		<reg32 offset="0x4" name="ARRAY_PITCH" shr="6" high="28" type="uint"/>
+		<!--
+		Compared to a5xx and before, we configure both a GMEM base and
+		external base.  Not sure if this is to facilitate GMEM save/
+		restore for context switch, or just to simplify state setup to
+		not have to care about GMEM vs BYPASS mode.
+		 -->
+		<!-- maybe something in low bits since alignment of 1 doesn't make sense? -->
+		<reg64 offset="0x5" name="BASE" type="waddress" align="1"/>
+
+		<reg32 offset="0x7" name="BASE_GMEM" low="12" high="31" shr="12"/>
+	</array>
+
+	<reg32 offset="0x8860" name="RB_BLEND_RED_F32" type="float" usage="rp_blit"/>
+	<reg32 offset="0x8861" name="RB_BLEND_GREEN_F32" type="float" usage="rp_blit"/>
+	<reg32 offset="0x8862" name="RB_BLEND_BLUE_F32" type="float" usage="rp_blit"/>
+	<reg32 offset="0x8863" name="RB_BLEND_ALPHA_F32" type="float" usage="rp_blit"/>
+	<reg32 offset="0x8864" name="RB_ALPHA_CONTROL" usage="cmd">
+		<bitfield name="ALPHA_REF" low="0" high="7" type="hex"/>
+		<bitfield name="ALPHA_TEST" pos="8" type="boolean"/>
+		<bitfield name="ALPHA_TEST_FUNC" low="9" high="11" type="adreno_compare_func"/>
+	</reg32>
+	<reg32 offset="0x8865" name="RB_BLEND_CNTL" usage="rp_blit">
+		<!-- per-mrt enable bit -->
+		<bitfield name="ENABLE_BLEND" low="0" high="7"/>
+		<bitfield name="INDEPENDENT_BLEND" pos="8" type="boolean"/>
+		<bitfield name="DUAL_COLOR_IN_ENABLE" pos="9" type="boolean"/>
+		<bitfield name="ALPHA_TO_COVERAGE" pos="10" type="boolean"/>
+		<bitfield name="ALPHA_TO_ONE" pos="11" type="boolean"/>
+		<bitfield name="SAMPLE_MASK" low="16" high="31"/>
+	</reg32>
+	<!-- 0x8866-0x886f invalid -->
+	<reg32 offset="0x8870" name="RB_DEPTH_PLANE_CNTL" usage="rp_blit">
+		<bitfield name="Z_MODE" low="0" high="1" type="a6xx_ztest_mode"/>
+	</reg32>
+
+	<reg32 offset="0x8871" name="RB_DEPTH_CNTL" usage="rp_blit">
+		<bitfield name="Z_TEST_ENABLE" pos="0" type="boolean"/>
+		<bitfield name="Z_WRITE_ENABLE" pos="1" type="boolean"/>
+		<bitfield name="ZFUNC" low="2" high="4" type="adreno_compare_func"/>
+		<bitfield name="Z_CLAMP_ENABLE" pos="5" type="boolean"/>
+		<doc>
+		Z_READ_ENABLE bit is set for zfunc other than GL_ALWAYS or GL_NEVER
+		also set when Z_BOUNDS_ENABLE is set
+		</doc>
+		<bitfield name="Z_READ_ENABLE" pos="6" type="boolean"/>
+		<bitfield name="Z_BOUNDS_ENABLE" pos="7" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x8114" name="GRAS_SU_DEPTH_CNTL" usage="rp_blit">
+		<bitfield name="Z_TEST_ENABLE" pos="0" type="boolean"/>
+	</reg32>
+	<!-- duplicates GRAS_SU_DEPTH_BUFFER_INFO: -->
+	<reg32 offset="0x8872" name="RB_DEPTH_BUFFER_INFO" variants="A6XX" usage="rp_blit">
+		<bitfield name="DEPTH_FORMAT" low="0" high="2" type="a6xx_depth_format"/>
+		<bitfield name="UNK3" low="3" high="4"/>
+	</reg32>
+	<!-- first 4 bits duplicates GRAS_SU_DEPTH_BUFFER_INFO -->
+	<reg32 offset="0x8872" name="RB_DEPTH_BUFFER_INFO" variants="A7XX-" usage="rp_blit">
+		<bitfield name="DEPTH_FORMAT" low="0" high="2" type="a6xx_depth_format"/>
+		<bitfield name="UNK3" low="3" high="4"/>
+		<bitfield name="TILEMODE" low="5" high="6" type="a6xx_tile_mode"/>
+		<bitfield name="LOSSLESSCOMPEN" pos="7" type="boolean"/>
+	</reg32>
+
+	<reg32 offset="0x8873" name="RB_DEPTH_BUFFER_PITCH" low="0" high="13" shr="6" type="uint" usage="rp_blit"/>
+	<reg32 offset="0x8874" name="RB_DEPTH_BUFFER_ARRAY_PITCH" low="0" high="27" shr="6" type="uint" usage="rp_blit"/>
+	<reg64 offset="0x8875" name="RB_DEPTH_BUFFER_BASE" type="waddress" align="64" usage="rp_blit"/>
+	<reg32 offset="0x8877" name="RB_DEPTH_BUFFER_BASE_GMEM" low="12" high="31" shr="12" usage="rp_blit"/>
+
+	<reg32 offset="0x8878" name="RB_Z_BOUNDS_MIN" type="float" usage="rp_blit"/>
+	<reg32 offset="0x8879" name="RB_Z_BOUNDS_MAX" type="float" usage="rp_blit"/>
+	<!-- 0x887a-0x887f invalid -->
+	<reg32 offset="0x8880" name="RB_STENCIL_CONTROL" usage="rp_blit">
+		<bitfield name="STENCIL_ENABLE" pos="0" type="boolean"/>
+		<bitfield name="STENCIL_ENABLE_BF" pos="1" type="boolean"/>
+		<!--
+			set for stencil operations that require read from stencil
+			buffer, but not for example for stencil clear (which does
+			not require read).. so guessing this is analogous to
+			READ_DEST_ENABLE for color buffer..
+		 -->
+		<bitfield name="STENCIL_READ" pos="2" type="boolean"/>
+		<bitfield name="FUNC" low="8" high="10" type="adreno_compare_func"/>
+		<bitfield name="FAIL" low="11" high="13" type="adreno_stencil_op"/>
+		<bitfield name="ZPASS" low="14" high="16" type="adreno_stencil_op"/>
+		<bitfield name="ZFAIL" low="17" high="19" type="adreno_stencil_op"/>
+		<bitfield name="FUNC_BF" low="20" high="22" type="adreno_compare_func"/>
+		<bitfield name="FAIL_BF" low="23" high="25" type="adreno_stencil_op"/>
+		<bitfield name="ZPASS_BF" low="26" high="28" type="adreno_stencil_op"/>
+		<bitfield name="ZFAIL_BF" low="29" high="31" type="adreno_stencil_op"/>
+	</reg32>
+	<reg32 offset="0x8115" name="GRAS_SU_STENCIL_CNTL" usage="rp_blit">
+		<bitfield name="STENCIL_ENABLE" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x8881" name="RB_STENCIL_INFO" variants="A6XX" usage="rp_blit">
+		<bitfield name="SEPARATE_STENCIL" pos="0" type="boolean"/>
+		<bitfield name="UNK1" pos="1" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x8881" name="RB_STENCIL_INFO" variants="A7XX-" usage="rp_blit">
+		<bitfield name="SEPARATE_STENCIL" pos="0" type="boolean"/>
+		<bitfield name="UNK1" pos="1" type="boolean"/>
+		<bitfield name="TILEMODE" low="2" high="3" type="a6xx_tile_mode"/>
+	</reg32>
+	<reg32 offset="0x8882" name="RB_STENCIL_BUFFER_PITCH" low="0" high="11" shr="6" type="uint" usage="rp_blit"/>
+	<reg32 offset="0x8883" name="RB_STENCIL_BUFFER_ARRAY_PITCH" low="0" high="23" shr="6" type="uint" usage="rp_blit"/>
+	<reg64 offset="0x8884" name="RB_STENCIL_BUFFER_BASE" type="waddress" align="64" usage="rp_blit"/>
+	<reg32 offset="0x8886" name="RB_STENCIL_BUFFER_BASE_GMEM" low="12" high="31" shr="12" usage="rp_blit"/>
+	<reg32 offset="0x8887" name="RB_STENCILREF" usage="rp_blit">
+		<bitfield name="REF" low="0" high="7"/>
+		<bitfield name="BFREF" low="8" high="15"/>
+	</reg32>
+	<reg32 offset="0x8888" name="RB_STENCILMASK" usage="rp_blit">
+		<bitfield name="MASK" low="0" high="7"/>
+		<bitfield name="BFMASK" low="8" high="15"/>
+	</reg32>
+	<reg32 offset="0x8889" name="RB_STENCILWRMASK" usage="rp_blit">
+		<bitfield name="WRMASK" low="0" high="7"/>
+		<bitfield name="BFWRMASK" low="8" high="15"/>
+	</reg32>
+	<!-- 0x888a-0x888f invalid -->
+	<reg32 offset="0x8890" name="RB_WINDOW_OFFSET" type="a6xx_reg_xy" usage="rp_blit"/>
+	<reg32 offset="0x8891" name="RB_SAMPLE_COUNT_CONTROL" usage="cmd">
+		<bitfield name="DISABLE" pos="0" type="boolean"/>
+		<bitfield name="COPY" pos="1" type="boolean"/>
+	</reg32>
+	<!-- 0x8892-0x8897 invalid -->
+	<reg32 offset="0x8898" name="RB_LRZ_CNTL" usage="rp_blit">
+		<bitfield name="ENABLE" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x8899" name="RB_UNKNOWN_8899" variants="A7XX-" usage="cmd"/>
+	<!-- 0x8899-0x88bf invalid -->
+	<!-- clamps depth value for depth test/write -->
+	<reg32 offset="0x88c0" name="RB_Z_CLAMP_MIN" type="float" usage="rp_blit"/>
+	<reg32 offset="0x88c1" name="RB_Z_CLAMP_MAX" type="float" usage="rp_blit"/>
+	<!-- 0x88c2-0x88cf invalid-->
+	<reg32 offset="0x88d0" name="RB_UNKNOWN_88D0" usage="rp_blit">
+		<bitfield name="UNK0" low="0" high="12"/>
+		<bitfield name="UNK16" low="16" high="26"/>
+	</reg32>
+	<reg32 offset="0x88d1" name="RB_BLIT_SCISSOR_TL" type="a6xx_reg_xy" usage="rp_blit"/>
+	<reg32 offset="0x88d2" name="RB_BLIT_SCISSOR_BR" type="a6xx_reg_xy" usage="rp_blit"/>
+	<!-- weird to duplicate other regs from same block?? -->
+	<reg32 offset="0x88d3" name="RB_BIN_CONTROL2" usage="rp_blit">
+		<bitfield name="BINW" low="0" high="5" shr="5" type="uint"/>
+		<bitfield name="BINH" low="8" high="14" shr="4" type="uint"/>
+	</reg32>
+	<reg32 offset="0x88d4" name="RB_WINDOW_OFFSET2" type="a6xx_reg_xy" usage="rp_blit"/>
+	<reg32 offset="0x88d5" name="RB_BLIT_GMEM_MSAA_CNTL" usage="rp_blit">
+		<bitfield name="SAMPLES" low="3" high="4" type="a3xx_msaa_samples"/>
+	</reg32>
+	<reg32 offset="0x88d6" name="RB_BLIT_BASE_GMEM" low="12" high="31" shr="12" usage="rp_blit"/>
+	<!-- s/DST_FORMAT/DST_INFO/ probably: -->
+	<reg32 offset="0x88d7" name="RB_BLIT_DST_INFO" usage="rp_blit">
+		<bitfield name="TILE_MODE" low="0" high="1" type="a6xx_tile_mode"/>
+		<bitfield name="FLAGS" pos="2" type="boolean"/>
+		<bitfield name="SAMPLES" low="3" high="4" type="a3xx_msaa_samples"/>
+		<bitfield name="COLOR_SWAP" low="5" high="6" type="a3xx_color_swap"/>
+		<bitfield name="COLOR_FORMAT" low="7" high="14" type="a6xx_format"/>
+		<bitfield name="UNK15" pos="15" type="boolean"/>
+	</reg32>
+	<reg64 offset="0x88d8" name="RB_BLIT_DST" type="waddress" align="64" usage="rp_blit"/>
+	<reg32 offset="0x88da" name="RB_BLIT_DST_PITCH" low="0" high="15" shr="6" type="uint" usage="rp_blit"/>
+	<!-- array-pitch is size of layer -->
+	<reg32 offset="0x88db" name="RB_BLIT_DST_ARRAY_PITCH" low="0" high="28" shr="6" type="uint" usage="rp_blit"/>
+	<reg64 offset="0x88dc" name="RB_BLIT_FLAG_DST" type="waddress" align="64" usage="rp_blit"/>
+	<reg32 offset="0x88de" name="RB_BLIT_FLAG_DST_PITCH" usage="rp_blit">
+		<bitfield name="PITCH" low="0" high="10" shr="6" type="uint"/>
+		<bitfield name="ARRAY_PITCH" low="11" high="27" shr="7" type="uint"/>
+	</reg32>
+
+	<reg32 offset="0x88df" name="RB_BLIT_CLEAR_COLOR_DW0" usage="rp_blit"/>
+	<reg32 offset="0x88e0" name="RB_BLIT_CLEAR_COLOR_DW1" usage="rp_blit"/>
+	<reg32 offset="0x88e1" name="RB_BLIT_CLEAR_COLOR_DW2" usage="rp_blit"/>
+	<reg32 offset="0x88e2" name="RB_BLIT_CLEAR_COLOR_DW3" usage="rp_blit"/>
+
+	<!-- seems somewhat similar to what we called RB_CLEAR_CNTL on a5xx: -->
+	<reg32 offset="0x88e3" name="RB_BLIT_INFO" usage="rp_blit">
+		<bitfield name="UNK0" pos="0" type="boolean"/> <!-- s8 stencil restore/clear?  But also color restore? -->
+		<bitfield name="GMEM" pos="1" type="boolean"/> <!-- set for restore and clear to gmem? -->
+		<bitfield name="SAMPLE_0" pos="2" type="boolean"/> <!-- takes sample 0 instead of averaging -->
+		<bitfield name="DEPTH" pos="3" type="boolean"/> <!-- z16/z32/z24s8/x24x8 clear or resolve? -->
+		<doc>
+			For clearing depth/stencil
+				1 - depth
+				2 - stencil
+				3 - depth+stencil
+			For clearing color buffer:
+				then probably a component mask, I always see 0xf
+		</doc>
+		<bitfield name="CLEAR_MASK" low="4" high="7"/>
+		<!-- set when this is the last resolve on a650+ -->
+		<bitfield name="LAST" low="8" high="9"/>
+		<!--
+			a618 GLES: color render target number being resolved for RM6_RESOLVE, 0x8 for depth, 0x9 for separate stencil.
+			a618 VK: 0x8 for depth RM6_RESOLVE, 0x9 for separate stencil, 0 otherwise.
+
+			We believe this is related to concurrent resolves
+		 -->
+		<bitfield name="BUFFER_ID" low="12" high="15"/>
+	</reg32>
+	<reg32 offset="0x88e4" name="RB_UNKNOWN_88E4" variants="A7XX-" usage="rp_blit">
+		<!-- Value conditioned based on predicate, changed before blits -->
+		<bitfield name="UNK0" pos="0" type="boolean"/>
+	</reg32>
+
+	<enum name="a6xx_ccu_cache_size">
+		<value value="0x0" name="CCU_CACHE_SIZE_FULL"/>
+		<value value="0x1" name="CCU_CACHE_SIZE_HALF"/>
+		<value value="0x2" name="CCU_CACHE_SIZE_QUARTER"/>
+		<value value="0x3" name="CCU_CACHE_SIZE_EIGHTH"/>
+	</enum>
+	<reg32 offset="0x88e5" name="RB_CCU_CNTL2" variants="A7XX-" usage="cmd">
+		<bitfield name="DEPTH_OFFSET_HI" pos="0" type="hex"/>
+		<bitfield name="COLOR_OFFSET_HI" pos="2" type="hex"/>
+		<bitfield name="DEPTH_CACHE_SIZE" low="10" high="11" type="a6xx_ccu_cache_size"/>
+		<!-- GMEM offset of CCU depth cache -->
+		<bitfield name="DEPTH_OFFSET" low="12" high="20" shr="12" type="hex"/>
+		<bitfield name="COLOR_CACHE_SIZE" low="21" high="22" type="a6xx_ccu_cache_size"/>
+		<!-- GMEM offset of CCU color cache
+			for GMEM rendering, we set it to GMEM size minus the minimum
+			CCU color cache size. CCU color cache will be needed in some
+			resolve cases, and in those cases we need to reserve the end
+			of GMEM for color cache.
+		-->
+		<bitfield name="COLOR_OFFSET" low="23" high="31" shr="12" type="hex"/>
+	</reg32>
+	<!-- 0x88e6-0x88ef invalid -->
+	<!-- always 0x0 ? -->
+	<reg32 offset="0x88f0" name="RB_UNKNOWN_88F0" low="0" high="11" usage="cmd"/>
+	<!-- could be for separate stencil? (or may not be a flag buffer at all) -->
+	<reg64 offset="0x88f1" name="RB_UNK_FLAG_BUFFER_BASE" type="waddress" align="64"/>
+	<reg32 offset="0x88f3" name="RB_UNK_FLAG_BUFFER_PITCH">
+		<bitfield name="PITCH" low="0" high="10" shr="6" type="uint"/>
+		<bitfield name="ARRAY_PITCH" low="11" high="23" shr="7" type="uint"/>
+	</reg32>
+	<reg32 offset="0x88f4" name="RB_UNKNOWN_88F4" low="0" high="2"/>
+	<!-- Connected to VK_EXT_fragment_density_map? -->
+	<reg32 offset="0x88f5" name="RB_UNKNOWN_88F5" variants="A7XX-"/>
+	<!-- 0x88f6-0x88ff invalid -->
+	<reg64 offset="0x8900" name="RB_DEPTH_FLAG_BUFFER_BASE" type="waddress" align="64" usage="rp_blit"/>
+	<reg32 offset="0x8902" name="RB_DEPTH_FLAG_BUFFER_PITCH" usage="rp_blit">
+		<bitfield name="PITCH" low="0" high="6" shr="6" type="uint"/>
+		<!-- TODO: actually part of array pitch -->
+		<bitfield name="UNK8" low="8" high="10"/>
+		<bitfield name="ARRAY_PITCH" low="11" high="27" shr="7" type="uint"/>
+	</reg32>
+	<array offset="0x8903" name="RB_MRT_FLAG_BUFFER" stride="3" length="8" usage="rp_blit">
+		<reg64 offset="0" name="ADDR" type="waddress" align="64"/>
+		<reg32 offset="2" name="PITCH">
+			<bitfield name="PITCH" low="0" high="10" shr="6" type="uint"/>
+			<bitfield name="ARRAY_PITCH" low="11" high="28" shr="7" type="uint"/>
+		</reg32>
+	</array>
+	<!-- 0x891b-0x8926 invalid -->
+	<reg64 offset="0x8927" name="RB_SAMPLE_COUNT_ADDR" type="waddress" align="16" usage="cmd" variants="A6XX"/>
+	<!-- 0x8929-0x89ff invalid -->
+
+	<!-- TODO: there are some registers in the 0x8a00-0x8bff range -->
+
+	<!--
+		These show up in a6xx gen3+ but so far haven't found an example of
+		blob writing non-zero:
+	 -->
+	<reg32 offset="0x8a00" name="RB_UNKNOWN_8A00" variants="A6XX" usage="rp_blit"/>
+	<reg32 offset="0x8a10" name="RB_UNKNOWN_8A10" variants="A6XX" usage="rp_blit"/>
+	<reg32 offset="0x8a20" name="RB_UNKNOWN_8A20" variants="A6XX" usage="rp_blit"/>
+	<reg32 offset="0x8a30" name="RB_UNKNOWN_8A30" variants="A6XX" usage="rp_blit"/>
+
+	<reg32 offset="0x8c00" name="RB_2D_BLIT_CNTL" type="a6xx_2d_blit_cntl" usage="rp_blit"/>
+	<reg32 offset="0x8c01" name="RB_2D_UNKNOWN_8C01" low="0" high="31" usage="rp_blit"/>
+
+	<bitset name="a6xx_2d_surf_info" inline="yes">
+		<bitfield name="COLOR_FORMAT" low="0" high="7" type="a6xx_format"/>
+		<bitfield name="TILE_MODE" low="8" high="9" type="a6xx_tile_mode"/>
+		<bitfield name="COLOR_SWAP" low="10" high="11" type="a3xx_color_swap"/>
+		<bitfield name="FLAGS" pos="12" type="boolean"/>
+		<bitfield name="SRGB" pos="13" type="boolean"/>
+		<!-- the rest is only for src -->
+		<bitfield name="SAMPLES" low="14" high="15" type="a3xx_msaa_samples"/>
+		<bitfield name="FILTER" pos="16" type="boolean"/>
+		<bitfield name="UNK17" pos="17" type="boolean"/>
+		<bitfield name="SAMPLES_AVERAGE" pos="18" type="boolean"/>
+		<bitfield name="UNK19" pos="19" type="boolean"/>
+		<bitfield name="UNK20" pos="20" type="boolean"/>
+		<bitfield name="UNK21" pos="21" type="boolean"/>
+		<bitfield name="UNK22" pos="22" type="boolean"/>
+		<bitfield name="UNK23" low="23" high="26"/>
+		<bitfield name="UNK28" pos="28" type="boolean"/>
+	</bitset>
+
+	<!-- 0x8c02-0x8c16 invalid -->
+	<!-- TODO: RB_2D_DST_INFO has 17 valid bits (doesn't match a6xx_2d_surf_info) -->
+	<reg32 offset="0x8c17" name="RB_2D_DST_INFO" type="a6xx_2d_surf_info" usage="rp_blit"/>
+	<reg64 offset="0x8c18" name="RB_2D_DST" type="waddress" align="64" usage="rp_blit"/>
+	<reg32 offset="0x8c1a" name="RB_2D_DST_PITCH" low="0" high="15" shr="6" type="uint" usage="rp_blit"/>
+	<!-- this is a guess but seems likely (for NV12/IYUV): -->
+	<reg64 offset="0x8c1b" name="RB_2D_DST_PLANE1" type="waddress" align="64" usage="rp_blit"/>
+	<reg32 offset="0x8c1d" name="RB_2D_DST_PLANE_PITCH" low="0" high="15" shr="6" type="uint" usage="rp_blit"/>
+	<reg64 offset="0x8c1e" name="RB_2D_DST_PLANE2" type="waddress" align="64" usage="rp_blit"/>
+
+	<reg64 offset="0x8c20" name="RB_2D_DST_FLAGS" type="waddress" align="64" usage="rp_blit"/>
+	<reg32 offset="0x8c22" name="RB_2D_DST_FLAGS_PITCH" low="0" high="7" shr="6" type="uint" usage="rp_blit"/>
+	<!-- this is a guess but seems likely (for NV12 with UBWC): -->
+	<reg64 offset="0x8c23" name="RB_2D_DST_FLAGS_PLANE" type="waddress" align="64" usage="rp_blit"/>
+	<reg32 offset="0x8c25" name="RB_2D_DST_FLAGS_PLANE_PITCH" low="0" high="7" shr="6" type="uint" usage="rp_blit"/>
+
+	<!-- TODO: 0x8c26-0x8c33 are all full 32-bit registers -->
+	<!-- unlike a5xx, these are per channel values rather than packed -->
+	<reg32 offset="0x8c2c" name="RB_2D_SRC_SOLID_C0" usage="rp_blit"/>
+	<reg32 offset="0x8c2d" name="RB_2D_SRC_SOLID_C1" usage="rp_blit"/>
+	<reg32 offset="0x8c2e" name="RB_2D_SRC_SOLID_C2" usage="rp_blit"/>
+	<reg32 offset="0x8c2f" name="RB_2D_SRC_SOLID_C3" usage="rp_blit"/>
+	<!-- 0x8c34-0x8dff invalid -->
+
+	<!-- always 0x1 ? either doesn't exist for a650 or write-only: -->
+	<reg32 offset="0x8e01" name="RB_UNKNOWN_8E01" usage="cmd"/>
+	<!-- 0x8e00-0x8e03 invalid -->
+	<reg32 offset="0x8e04" name="RB_DBG_ECO_CNTL" usage="cmd"/> <!-- TODO: valid mask 0xfffffeff -->
+	<reg32 offset="0x8e05" name="RB_ADDR_MODE_CNTL" pos="0" type="a5xx_address_mode"/>
+	<!-- 0x02080000 in GMEM, zero otherwise?  -->
+	<reg32 offset="0x8e06" name="RB_UNKNOWN_8E06" variants="A7XX-" usage="cmd"/>
+
+	<reg32 offset="0x8e07" name="RB_CCU_CNTL" usage="cmd" variants="A6XX">
+		<bitfield name="GMEM_FAST_CLEAR_DISABLE" pos="0" type="boolean"/>
+		<!-- concurrent resolves are apparently a 2-bit enum on a650+ -->
+		<bitfield name="CONCURRENT_RESOLVE" pos="2" type="boolean"/>
+		<bitfield name="DEPTH_OFFSET_HI" pos="7" type="hex"/>
+		<bitfield name="COLOR_OFFSET_HI" pos="9" type="hex"/>
+		<bitfield name="DEPTH_CACHE_SIZE" low="10" high="11" type="a6xx_ccu_cache_size"/>
+		<!-- GMEM offset of CCU depth cache -->
+		<bitfield name="DEPTH_OFFSET" low="12" high="20" shr="12" type="hex"/>
+		<bitfield name="COLOR_CACHE_SIZE" low="21" high="22" type="a6xx_ccu_cache_size"/>
+		<!-- GMEM offset of CCU color cache
+			for GMEM rendering, we set it to GMEM size minus the minimum
+			CCU color cache size. CCU color cache will be needed in some
+			resolve cases, and in those cases we need to reserve the end
+			of GMEM for color cache.
+		-->
+		<bitfield name="COLOR_OFFSET" low="23" high="31" shr="12" type="hex"/>
+		<!--TODO: valid mask 0xfffffc1f -->
+	</reg32>
+	<reg32 offset="0x8e07" name="RB_CCU_CNTL" usage="cmd" variants="A7XX-">
+		<bitfield name="GMEM_FAST_CLEAR_DISABLE" pos="0" type="boolean"/>
+		<bitfield name="CONCURRENT_RESOLVE" pos="2" type="boolean"/>
+		<!-- rest of the bits were moved to RB_CCU_CNTL2 -->
+	</reg32>
+	<reg32 offset="0x8e08" name="RB_NC_MODE_CNTL">
+		<bitfield name="MODE" pos="0" type="boolean"/>
+		<bitfield name="LOWER_BIT" low="1" high="2" type="uint"/>
+		<bitfield name="MIN_ACCESS_LENGTH" pos="3" type="boolean"/> <!-- true=64b false=32b -->
+		<bitfield name="AMSBC" pos="4" type="boolean"/>
+		<bitfield name="UPPER_BIT" pos="10" type="uint"/>
+		<bitfield name="RGB565_PREDICATOR" pos="11" type="boolean"/>
+		<bitfield name="UNK12" low="12" high="13"/>
+	</reg32>
+	<reg32 offset="0x8e09" name="RB_UNKNOWN_8E09" variants="A7XX-" usage="cmd"/>
+	<!-- 0x8e09-0x8e0f invalid -->
+	<array offset="0x8e10" name="RB_PERFCTR_RB_SEL" stride="1" length="8"/>
+	<array offset="0x8e18" name="RB_PERFCTR_CCU_SEL" stride="1" length="5"/>
+	<!-- 0x8e1d-0x8e1f invalid -->
+	<!-- 0x8e20-0x8e25 more perfcntr sel? -->
+	<!-- 0x8e26-0x8e27 invalid -->
+	<reg32 offset="0x8e28" name="RB_UNKNOWN_8E28" low="0" high="10"/>
+	<!-- 0x8e29-0x8e2b invalid -->
+	<array offset="0x8e2c" name="RB_PERFCTR_CMP_SEL" stride="1" length="4"/>
+	<array offset="0x8e30" name="RB_PERFCTR_UFC_SEL" stride="1" length="6" variants="A7XX-"/>
+	<reg32 offset="0x8e3b" name="RB_RB_SUB_BLOCK_SEL_CNTL_HOST"/>
+	<reg32 offset="0x8e3d" name="RB_RB_SUB_BLOCK_SEL_CNTL_CD"/>
+	<!-- 0x8e3e-0x8e4f invalid -->
+	<!-- GMEM save/restore for preemption: -->
+	<reg32 offset="0x8e50" name="RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE" pos="0" type="boolean"/>
+	<!-- address for GMEM save/restore? -->
+	<reg32 offset="0x8e51" name="RB_UNKNOWN_8E51" type="waddress" align="1"/>
+	<!-- 0x8e53-0x8e7f invalid -->
+	<reg32 offset="0x8e79" name="RB_UNKNOWN_8E79" variants="A7XX-" usage="cmd"/>
+	<!-- 0x8e80-0x8e83 are valid -->
+	<!-- 0x8e84-0x90ff invalid -->
+
+	<!-- 0x9000-0x90ff invalid -->
+
+	<reg32 offset="0x9100" name="VPC_GS_PARAM" variants="A6XX" usage="rp_blit">
+		<bitfield name="LINELENGTHLOC" low="0" high="7" type="uint"/>
+	</reg32>
+
+	<bitset name="a6xx_vpc_xs_clip_cntl" inline="yes">
+		<bitfield name="CLIP_MASK" low="0" high="7" type="uint"/>
+		<!-- there can be up to 8 total clip/cull distance outputs,
+		     but apparenly VPC can only deal with vec4, so when there are
+		     more than 4 outputs a second location needs to be programmed
+		-->
+		<bitfield name="CLIP_DIST_03_LOC" low="8" high="15" type="uint"/>
+		<bitfield name="CLIP_DIST_47_LOC" low="16" high="23" type="uint"/>
+	</bitset>
+	<reg32 offset="0x9101" name="VPC_VS_CLIP_CNTL" type="a6xx_vpc_xs_clip_cntl" usage="rp_blit"/>
+	<reg32 offset="0x9102" name="VPC_GS_CLIP_CNTL" type="a6xx_vpc_xs_clip_cntl" usage="rp_blit"/>
+	<reg32 offset="0x9103" name="VPC_DS_CLIP_CNTL" type="a6xx_vpc_xs_clip_cntl" usage="rp_blit"/>
+
+	<reg32 offset="0x9311" name="VPC_VS_CLIP_CNTL_V2" type="a6xx_vpc_xs_clip_cntl" usage="rp_blit"/>
+	<reg32 offset="0x9312" name="VPC_GS_CLIP_CNTL_V2" type="a6xx_vpc_xs_clip_cntl" usage="rp_blit"/>
+	<reg32 offset="0x9313" name="VPC_DS_CLIP_CNTL_V2" type="a6xx_vpc_xs_clip_cntl" usage="rp_blit"/>
+
+	<bitset name="a6xx_vpc_xs_layer_cntl" inline="yes">
+		<bitfield name="LAYERLOC" low="0" high="7" type="uint"/>
+		<bitfield name="VIEWLOC" low="8" high="15" type="uint"/>
+		<bitfield name="SHADINGRATELOC" low="16" high="23" type="uint" variants="A7XX-"/>
+	</bitset>
+
+	<reg32 offset="0x9104" name="VPC_VS_LAYER_CNTL" type="a6xx_vpc_xs_layer_cntl" usage="rp_blit"/>
+	<reg32 offset="0x9105" name="VPC_GS_LAYER_CNTL" type="a6xx_vpc_xs_layer_cntl" usage="rp_blit"/>
+	<reg32 offset="0x9106" name="VPC_DS_LAYER_CNTL" type="a6xx_vpc_xs_layer_cntl" usage="rp_blit"/>
+
+	<reg32 offset="0x9314" name="VPC_VS_LAYER_CNTL_V2" type="a6xx_vpc_xs_layer_cntl" usage="rp_blit"/>
+	<reg32 offset="0x9315" name="VPC_GS_LAYER_CNTL_V2" type="a6xx_vpc_xs_layer_cntl" usage="rp_blit"/>
+	<reg32 offset="0x9316" name="VPC_DS_LAYER_CNTL_V2" type="a6xx_vpc_xs_layer_cntl" usage="rp_blit"/>
+
+	<reg32 offset="0x9107" name="VPC_UNKNOWN_9107" variants="A6XX" usage="rp_blit">
+		<!-- this mirrors PC_RASTER_CNTL::DISCARD, although it seems it's unused -->
+		<bitfield name="RASTER_DISCARD" pos="0" type="boolean"/>
+		<bitfield name="UNK2" pos="2" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x9108" name="VPC_POLYGON_MODE" usage="rp_blit">
+		<bitfield name="MODE" low="0" high="1" type="a6xx_polygon_mode"/>
+	</reg32>
+
+	<bitset name="a6xx_primitive_cntl_0" inline="yes">
+		<bitfield name="PRIMITIVE_RESTART" pos="0" type="boolean"/>
+		<bitfield name="PROVOKING_VTX_LAST" pos="1" type="boolean"/>
+		<bitfield name="D3D_VERTEX_ORDERING" pos="2" type="boolean">
+			<doc>
+				Swaps TESS_CW_TRIS/TESS_CCW_TRIS, and also makes
+				triangle fans and triangle strips use the D3D
+				order instead of the OpenGL order.
+			</doc>
+		</bitfield>
+		<bitfield name="UNK3" pos="3" type="boolean"/>
+	</bitset>
+
+	<bitset name="a6xx_primitive_cntl_5" inline="yes">
+		<doc>
+		  geometry shader
+		</doc>
+		<!-- TODO: first 16 bits are valid so something is wrong or missing here -->
+		<bitfield name="GS_VERTICES_OUT" low="0" high="7" type="uint"/>
+		<bitfield name="GS_INVOCATIONS" low="10" high="14" type="uint"/>
+		<bitfield name="LINELENGTHEN" pos="15" type="boolean"/>
+		<bitfield name="GS_OUTPUT" low="16" high="17" type="a6xx_tess_output"/>
+		<bitfield name="UNK18" pos="18"/>
+	</bitset>
+
+	<bitset name="a6xx_multiview_cntl" inline="yes">
+		<bitfield name="ENABLE" pos="0" type="boolean"/>
+		<bitfield name="DISABLEMULTIPOS" pos="1" type="boolean">
+			<doc>
+				Multi-position output lets the last geometry
+				stage shader write multiple copies of
+				gl_Position. If disabled then the VS is run once
+				for each view, and ViewID is passed as a
+				register to the VS.
+			</doc>
+		</bitfield>
+		<bitfield name="VIEWS" low="2" high="6" type="uint"/>
+	</bitset>
+
+	<reg32 offset="0x9109" name="VPC_PRIMITIVE_CNTL_0" type="a6xx_primitive_cntl_0" variants="A7XX-" usage="rp_blit"/>
+	<reg32 offset="0x910a" name="VPC_PRIMITIVE_CNTL_5" type="a6xx_primitive_cntl_5" variants="A7XX-" usage="rp_blit"/>
+	<reg32 offset="0x910b" name="VPC_MULTIVIEW_MASK" type="hex" low="0" high="15" variants="A7XX-" usage="rp_blit"/>
+	<reg32 offset="0x910c" name="VPC_MULTIVIEW_CNTL" type="a6xx_multiview_cntl" variants="A7XX-" usage="rp_blit"/>
+
+	<enum name="a6xx_varying_interp_mode">
+		<value value="0" name="INTERP_SMOOTH"/>
+		<value value="1" name="INTERP_FLAT"/>
+		<value value="2" name="INTERP_ZERO"/>
+		<value value="3" name="INTERP_ONE"/>
+	</enum>
+
+	<enum name="a6xx_varying_ps_repl_mode">
+		<value value="0" name="PS_REPL_NONE"/>
+		<value value="1" name="PS_REPL_S"/>
+		<value value="2" name="PS_REPL_T"/>
+		<value value="3" name="PS_REPL_ONE_MINUS_T"/>
+	</enum>
+
+	<!-- 0x9109-0x91ff invalid -->
+	<array offset="0x9200" name="VPC_VARYING_INTERP" stride="1" length="8" usage="rp_blit">
+		<doc>Packed array of a6xx_varying_interp_mode</doc>
+		<reg32 offset="0x0" name="MODE"/>
+	</array>
+	<array offset="0x9208" name="VPC_VARYING_PS_REPL" stride="1" length="8" usage="rp_blit">
+		<doc>Packed array of a6xx_varying_ps_repl_mode</doc>
+		<reg32 offset="0x0" name="MODE"/>
+	</array>
+
+	<!-- always 0x0 -->
+	<reg32 offset="0x9210" name="VPC_UNKNOWN_9210" low="0" high="31" variants="A6XX" usage="cmd"/>
+	<reg32 offset="0x9211" name="VPC_UNKNOWN_9211" low="0" high="31" variants="A6XX" usage="cmd"/>
+
+	<array offset="0x9212" name="VPC_VAR" stride="1" length="4" usage="rp_blit">
+		<!-- one bit per varying component: -->
+		<reg32 offset="0" name="DISABLE"/>
+	</array>
+
+	<reg32 offset="0x9216" name="VPC_SO_CNTL" usage="rp_blit">
+		<!--
+			Choose which DWORD to write to. There is an array of
+			(4 * 64) DWORD's, dumped in the devcoredump at
+			HLSQ_INST_RAM dword 0x400. Each DWORD corresponds to a
+			(VPC location, stream) pair like so:
+
+			location 0, stream 0
+			location 2, stream 0
+			...
+			location 126, stream 0
+			location 0, stream 1
+			location 2, stream 1
+			...
+			location 126, stream 1
+			location 0, stream 2
+			...
+
+			When EmitStreamVertex(N) happens, the HW goes to DWORD
+			64 * N and then "executes" the next 64 DWORD's.
+
+			This field is auto-incremented when VPC_SO_PROG is
+			written to.
+		-->
+		<bitfield name="ADDR" low="0" high="7" type="hex"/>
+		<!-- clear all A_EN and B_EN bits for all DWORD's -->
+		<bitfield name="RESET" pos="16" type="boolean"/>
+	</reg32>
+	<!-- special register, write multiple times to load SO program (not readable) -->
+	<reg32 offset="0x9217" name="VPC_SO_PROG" usage="rp_blit">
+		<bitfield name="A_BUF" low="0" high="1" type="uint"/>
+		<bitfield name="A_OFF" low="2" high="10" shr="2" type="uint"/>
+		<bitfield name="A_EN" pos="11" type="boolean"/>
+		<bitfield name="B_BUF" low="12" high="13" type="uint"/>
+		<bitfield name="B_OFF" low="14" high="22" shr="2" type="uint"/>
+		<bitfield name="B_EN" pos="23" type="boolean"/>
+	</reg32>
+
+	<reg64 offset="0x9218" name="VPC_SO_STREAM_COUNTS" type="waddress" align="32" usage="cmd"/>
+
+	<array offset="0x921a" name="VPC_SO" stride="7" length="4" usage="cmd">
+		<reg64 offset="0" name="BUFFER_BASE" type="waddress" align="32"/>
+		<reg32 offset="2" name="BUFFER_SIZE" low="2" high="31" shr="2"/>
+		<reg32 offset="3" name="BUFFER_STRIDE" low="0" high="9" shr="2"/>
+		<reg32 offset="4" name="BUFFER_OFFSET" low="2" high="31" shr="2"/>
+		<reg64 offset="5" name="FLUSH_BASE" type="waddress" align="32"/>
+	</array>
+
+	<reg32 offset="0x9236" name="VPC_POINT_COORD_INVERT" usage="cmd">
+		<bitfield name="INVERT" pos="0" type="boolean"/>
+	</reg32>
+	<!-- 0x9237-0x92ff invalid -->
+	<!-- always 0x0 ? -->
+	<reg32 offset="0x9300" name="VPC_UNKNOWN_9300" low="0" high="2" usage="cmd"/>
+
+	<bitset name="a6xx_vpc_xs_pack" inline="yes">
+		<doc>
+			num of varyings plus four for gl_Position (plus one if gl_PointSize)
+			plus # of transform-feedback (streamout) varyings if using the
+			hw streamout (rather than stg instructions in shader)
+		</doc>
+		<bitfield name="STRIDE_IN_VPC" low="0" high="7" type="uint"/>
+		<bitfield name="POSITIONLOC" low="8" high="15" type="uint"/>
+		<bitfield name="PSIZELOC" low="16" high="23" type="uint"/>
+		<bitfield name="EXTRAPOS" low="24" high="27" type="uint">
+			<doc>
+				The number of extra copies of POSITION, i.e.
+				number of views minus one when multi-position
+				output is enabled, otherwise 0.
+			</doc>
+		</bitfield>
+	</bitset>
+	<reg32 offset="0x9301" name="VPC_VS_PACK" type="a6xx_vpc_xs_pack" usage="rp_blit"/>
+	<reg32 offset="0x9302" name="VPC_GS_PACK" type="a6xx_vpc_xs_pack" usage="rp_blit"/>
+	<reg32 offset="0x9303" name="VPC_DS_PACK" type="a6xx_vpc_xs_pack" usage="rp_blit"/>
+
+	<reg32 offset="0x9304" name="VPC_CNTL_0" usage="rp_blit">
+		<bitfield name="NUMNONPOSVAR" low="0" high="7" type="uint"/>
+		<!-- for fixed-function (i.e. no GS) gl_PrimitiveID in FS -->
+		<bitfield name="PRIMIDLOC" low="8" high="15" type="uint"/>
+		<bitfield name="VARYING" pos="16" type="boolean"/>
+		<bitfield name="VIEWIDLOC" low="24" high="31" type="uint">
+			<doc>
+				This VPC location will be overwritten with
+				ViewID when multiview is enabled. It's used when
+				fragment shaders read ViewID. It's only
+				strictly required for multi-position output,
+				where the same VS invocation is used for all the
+				views at once, but it can be used when multi-pos
+				output is disabled too, to avoid having to pass
+				ViewID through the VS.
+			</doc>
+		</bitfield>
+	</reg32>
+
+	<reg32 offset="0x9305" name="VPC_SO_STREAM_CNTL" usage="rp_blit">
+		<!--
+		It's offset by 1, and 0 means "disabled"
+		-->
+		<bitfield name="BUF0_STREAM" low="0" high="2" type="uint"/>
+		<bitfield name="BUF1_STREAM" low="3" high="5" type="uint"/>
+		<bitfield name="BUF2_STREAM" low="6" high="8" type="uint"/>
+		<bitfield name="BUF3_STREAM" low="9" high="11" type="uint"/>
+		<bitfield name="STREAM_ENABLE" low="15" high="18" type="hex"/>
+	</reg32>
+	<reg32 offset="0x9306" name="VPC_SO_DISABLE" usage="rp_blit">
+		<bitfield name="DISABLE" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x9307" name="VPC_POLYGON_MODE2" variants="A7XX-" usage="rp_blit">
+		<bitfield name="MODE" low="0" high="1" type="a6xx_polygon_mode"/>
+	</reg32>
+	<reg32 offset="0x9308" name="VPC_ATTR_BUF_SIZE_GMEM" variants="A7XX-" usage="rp_blit">
+		<bitfield name="SIZE_GMEM" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="0x9309" name="VPC_ATTR_BUF_BASE_GMEM" variants="A7XX-" usage="rp_blit">
+		<bitfield name="BASE_GMEM" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="0x9b09" name="PC_ATTR_BUF_SIZE_GMEM" variants="A7XX-" usage="rp_blit">
+		<bitfield name="SIZE_GMEM" low="0" high="31"/>
+	</reg32>
+
+	<!-- 0x9307-0x95ff invalid -->
+
+	<!-- TODO: 0x9600-0x97ff range -->
+	<reg32 offset="0x9600" name="VPC_DBG_ECO_CNTL" usage="cmd"/> <!-- always 0x0 ? TODO: 0x1fbf37ff valid mask -->
+	<reg32 offset="0x9601" name="VPC_ADDR_MODE_CNTL" pos="0" type="a5xx_address_mode" usage="cmd"/>
+	<reg32 offset="0x9602" name="VPC_UNKNOWN_9602" pos="0" usage="cmd"/> <!-- always 0x0 ? -->
+	<reg32 offset="0x9603" name="VPC_UNKNOWN_9603" low="0" high="26"/>
+	<array offset="0x9604" name="VPC_PERFCTR_VPC_SEL" stride="1" length="6" variants="A6XX"/>
+	<array offset="0x960b" name="VPC_PERFCTR_VPC_SEL" stride="1" length="12" variants="A7XX-"/>
+	<!-- 0x960a-0x9623 invalid -->
+	<!-- TODO: regs from 0x9624-0x963a -->
+	<!-- 0x963b-0x97ff invalid -->
+
+	<reg32 offset="0x9800" name="PC_TESS_NUM_VERTEX" low="0" high="5" type="uint" usage="rp_blit"/>
+
+	<!-- always 0x0 ? -->
+	<reg32 offset="0x9801" name="PC_HS_INPUT_SIZE" usage="rp_blit">
+		<bitfield name="SIZE" low="0" high="10" type="uint"/>
+		<bitfield name="UNK13" pos="13"/>
+	</reg32>
+
+	<reg32 offset="0x9802" name="PC_TESS_CNTL" usage="rp_blit">
+		<bitfield name="SPACING" low="0" high="1" type="a6xx_tess_spacing"/>
+		<bitfield name="OUTPUT" low="2" high="3" type="a6xx_tess_output"/>
+	</reg32>
+
+	<reg32 offset="0x9803" name="PC_RESTART_INDEX" low="0" high="31" type="uint" usage="rp_blit"/>
+	<reg32 offset="0x9804" name="PC_MODE_CNTL" low="0" high="7" usage="rp_blit"/>
+
+	<reg32 offset="0x9805" name="PC_POWER_CNTL" low="0" high="2" usage="rp_blit"/>
+
+	<reg32 offset="0x9806" name="PC_PS_CNTL" usage="rp_blit">
+		<bitfield name="PRIMITIVEIDEN" pos="0" type="boolean"/>
+	</reg32>
+
+	<!-- New in a6xx gen3+ -->
+	<reg32 offset="0x9808" name="PC_SO_STREAM_CNTL" usage="rp_blit">
+		<bitfield name="STREAM_ENABLE" low="15" high="18" type="hex"/>
+	</reg32>
+
+	<reg32 offset="0x980a" name="PC_DGEN_SU_CONSERVATIVE_RAS_CNTL">
+		<bitfield name="CONSERVATIVERASEN" pos="0" type="boolean"/>
+	</reg32>
+	<!-- 0x980b-0x983f invalid -->
+
+	<!-- 0x9840 - 0x9842 are not readable -->
+	<reg32 offset="0x9840" name="PC_DRAW_CMD">
+		<bitfield name="STATE_ID" low="0" high="7"/>
+	</reg32>
+
+	<reg32 offset="0x9841" name="PC_DISPATCH_CMD">
+		<bitfield name="STATE_ID" low="0" high="7"/>
+	</reg32>
+
+	<reg32 offset="0x9842" name="PC_EVENT_CMD">
+		<!-- I think only the low bit is actually used? -->
+		<bitfield name="STATE_ID" low="16" high="23"/>
+		<bitfield name="EVENT" low="0" high="6" type="vgt_event_type"/>
+	</reg32>
+
+	<!--
+		0x9880 written in a lot of places by SQE, same value gets written
+		to control reg 0x12a.  Set by CP_SET_MARKER, so lets name it after
+		that
+	 -->
+	<reg32 offset="0x9880" name="PC_MARKER"/>
+
+	<!-- 0x9843-0x997f invalid -->
+
+	<reg32 offset="0x9981" name="PC_POLYGON_MODE" variants="A6XX" usage="rp_blit">
+		<bitfield name="MODE" low="0" high="1" type="a6xx_polygon_mode"/>
+	</reg32>
+	<reg32 offset="0x9809" name="PC_POLYGON_MODE" variants="A7XX-" usage="rp_blit">
+		<bitfield name="MODE" low="0" high="1" type="a6xx_polygon_mode"/>
+	</reg32>
+
+	<reg32 offset="0x9980" name="PC_RASTER_CNTL" variants="A6XX" usage="rp_blit">
+		<!-- which stream to send to GRAS -->
+		<bitfield name="STREAM" low="0" high="1" type="uint"/>
+		<!-- discard primitives before rasterization -->
+		<bitfield name="DISCARD" pos="2" type="boolean"/>
+	</reg32>
+	<!-- VPC_RASTER_CNTL -->
+	<reg32 offset="0x9107" name="PC_RASTER_CNTL" variants="A7XX-" usage="rp_blit">
+		<!-- which stream to send to GRAS -->
+		<bitfield name="STREAM" low="0" high="1" type="uint"/>
+		<!-- discard primitives before rasterization -->
+		<bitfield name="DISCARD" pos="2" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x9317" name="PC_RASTER_CNTL_V2" variants="A7XX-" usage="rp_blit">
+		<!-- which stream to send to GRAS -->
+		<bitfield name="STREAM" low="0" high="1" type="uint"/>
+		<!-- discard primitives before rasterization -->
+		<bitfield name="DISCARD" pos="2" type="boolean"/>
+	</reg32>
+
+	<!-- 0x9982-0x9aff invalid -->
+
+	<reg32 offset="0x9b00" name="PC_PRIMITIVE_CNTL_0" type="a6xx_primitive_cntl_0" usage="rp_blit"/>
+
+	<bitset name="a6xx_xs_out_cntl" inline="yes">
+		<doc>
+			num of varyings plus four for gl_Position (plus one if gl_PointSize)
+			plus # of transform-feedback (streamout) varyings if using the
+			hw streamout (rather than stg instructions in shader)
+		</doc>
+		<bitfield name="STRIDE_IN_VPC" low="0" high="7" type="uint"/>
+		<bitfield name="PSIZE" pos="8" type="boolean"/>
+		<bitfield name="LAYER" pos="9" type="boolean"/>
+		<bitfield name="VIEW" pos="10" type="boolean"/>
+		<!-- note: PC_VS_OUT_CNTL doesn't have the PRIMITIVE_ID bit -->
+		<bitfield name="PRIMITIVE_ID" pos="11" type="boolean"/>
+		<bitfield name="CLIP_MASK" low="16" high="23" type="uint"/>
+		<bitfield name="SHADINGRATE" pos="24" type="boolean" variants="A7XX-"/>
+	</bitset>
+
+	<reg32 offset="0x9b01" name="PC_VS_OUT_CNTL" type="a6xx_xs_out_cntl" usage="rp_blit"/>
+	<reg32 offset="0x9b02" name="PC_GS_OUT_CNTL" type="a6xx_xs_out_cntl" usage="rp_blit"/>
+	<!-- since HS can't output anything, only PRIMITIVE_ID is valid -->
+	<reg32 offset="0x9b03" name="PC_HS_OUT_CNTL" type="a6xx_xs_out_cntl" usage="rp_blit"/>
+	<reg32 offset="0x9b04" name="PC_DS_OUT_CNTL" type="a6xx_xs_out_cntl" usage="rp_blit"/>
+
+	<reg32 offset="0x9b05" name="PC_PRIMITIVE_CNTL_5" type="a6xx_primitive_cntl_5" usage="rp_blit"/>
+
+	<reg32 offset="0x9b06" name="PC_PRIMITIVE_CNTL_6" variants="A6XX" usage="rp_blit">
+		<doc>
+		  size in vec4s of per-primitive storage for gs. TODO: not actually in VPC
+		</doc>
+		<bitfield name="STRIDE_IN_VPC" low="0" high="10" type="uint"/>
+	</reg32>
+
+	<reg32 offset="0x9b07" name="PC_MULTIVIEW_CNTL" type="a6xx_multiview_cntl" usage="rp_blit"/>
+	<!-- mask of enabled views, doesn't exist on A630 -->
+	<reg32 offset="0x9b08" name="PC_MULTIVIEW_MASK" type="hex" low="0" high="15" usage="rp_blit"/>
+	<!-- 0x9b09-0x9bff invalid -->
+	<reg32 offset="0x9c00" name="PC_2D_EVENT_CMD">
+		<!-- special register (but note first 8 bits can be written/read) -->
+		<bitfield name="EVENT" low="0" high="6" type="vgt_event_type"/>
+		<bitfield name="STATE_ID" low="8" high="15"/>
+	</reg32>
+	<!-- 0x9c01-0x9dff invalid -->
+	<!-- TODO: 0x9e00-0xa000 range incomplete -->
+	<reg32 offset="0x9e00" name="PC_DBG_ECO_CNTL"/>
+	<reg32 offset="0x9e01" name="PC_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
+	<reg64 offset="0x9e04" name="PC_DRAW_INDX_BASE"/>
+	<reg32 offset="0x9e06" name="PC_DRAW_FIRST_INDX" type="uint"/>
+	<reg32 offset="0x9e07" name="PC_DRAW_MAX_INDICES" type="uint"/>
+	<reg64 offset="0x9e08" name="PC_TESSFACTOR_ADDR" variants="A6XX" type="waddress" align="32" usage="cmd"/>
+	<reg64 offset="0x9810" name="PC_TESSFACTOR_ADDR" variants="A7XX-" type="waddress" align="32" usage="cmd"/>
+
+	<reg32 offset="0x9e0b" name="PC_DRAW_INITIATOR" type="vgt_draw_initiator_a4xx">
+		<doc>
+			Possibly not really "initiating" the draw but the layout is similar
+			to VGT_DRAW_INITIATOR on older gens
+		</doc>
+	</reg32>
+	<reg32 offset="0x9e0c" name="PC_DRAW_NUM_INSTANCES" type="uint"/>
+	<reg32 offset="0x9e0d" name="PC_DRAW_NUM_INDICES" type="uint"/>
+
+	<!-- These match the contents of CP_SET_BIN_DATA (not written directly) -->
+	<reg32 offset="0x9e11" name="PC_VSTREAM_CONTROL">
+		<bitfield name="UNK0" low="0" high="15"/>
+		<bitfield name="VSC_SIZE" low="16" high="21" type="uint"/>
+		<bitfield name="VSC_N" low="22" high="26" type="uint"/>
+	</reg32>
+	<reg64 offset="0x9e12" name="PC_BIN_PRIM_STRM" type="waddress" align="32"/>
+	<reg64 offset="0x9e14" name="PC_BIN_DRAW_STRM" type="waddress" align="32"/>
+
+	<reg32 offset="0x9e1c" name="PC_VISIBILITY_OVERRIDE">
+		<doc>Written by CP_SET_VISIBILITY_OVERRIDE handler</doc>
+		<bitfield name="OVERRIDE" pos="0" type="boolean"/>
+	</reg32>
+
+	<reg32 offset="0x9e24" name="PC_UNKNOWN_9E24" variants="A7XX-" usage="cmd"/>
+
+	<array offset="0x9e34" name="PC_PERFCTR_PC_SEL" stride="1" length="8" variants="A6XX"/>
+	<array offset="0x9e42" name="PC_PERFCTR_PC_SEL" stride="1" length="16" variants="A7XX-"/>
+
+	<!-- always 0x0 -->
+	<reg32 offset="0x9e72" name="PC_UNKNOWN_9E72" usage="cmd"/>
+
+	<reg32 offset="0xa000" name="VFD_CONTROL_0" usage="rp_blit">
+		<bitfield name="FETCH_CNT" low="0" high="5" type="uint"/>
+		<bitfield name="DECODE_CNT" low="8" high="13" type="uint"/>
+	</reg32>
+	<reg32 offset="0xa001" name="VFD_CONTROL_1" usage="rp_blit">
+		<bitfield name="REGID4VTX" low="0" high="7" type="a3xx_regid"/>
+		<bitfield name="REGID4INST" low="8" high="15" type="a3xx_regid"/>
+		<bitfield name="REGID4PRIMID" low="16" high="23" type="a3xx_regid"/>
+		<!-- only used for VS in non-multi-position-output case -->
+		<bitfield name="REGID4VIEWID" low="24" high="31" type="a3xx_regid"/>
+	</reg32>
+	<reg32 offset="0xa002" name="VFD_CONTROL_2" usage="rp_blit">
+		<bitfield name="REGID_HSRELPATCHID" low="0" high="7" type="a3xx_regid">
+			<doc>
+				This is the ID of the current patch within the
+				subdraw, used to calculate the offset of the
+				patch within the HS->DS buffers. When a draw is
+				split into multiple subdraws then this differs
+				from gl_PrimitiveID on the second, third, etc.
+				subdraws.
+			</doc>
+		</bitfield>
+		<bitfield name="REGID_INVOCATIONID" low="8" high="15" type="a3xx_regid"/>
+	</reg32>
+	<reg32 offset="0xa003" name="VFD_CONTROL_3" usage="rp_blit">
+		<bitfield name="REGID_DSPRIMID" low="0" high="7" type="a3xx_regid"/>
+		<bitfield name="REGID_DSRELPATCHID" low="8" high="15" type="a3xx_regid"/>
+		<bitfield name="REGID_TESSX" low="16" high="23" type="a3xx_regid"/>
+		<bitfield name="REGID_TESSY" low="24" high="31" type="a3xx_regid"/>
+	</reg32>
+	<reg32 offset="0xa004" name="VFD_CONTROL_4" usage="rp_blit">
+		<bitfield name="UNK0" low="0" high="7" type="a3xx_regid"/>
+	</reg32>
+	<reg32 offset="0xa005" name="VFD_CONTROL_5" usage="rp_blit">
+		<bitfield name="REGID_GSHEADER" low="0" high="7" type="a3xx_regid"/>
+		<bitfield name="UNK8" low="8" high="15" type="a3xx_regid"/>
+	</reg32>
+	<reg32 offset="0xa006" name="VFD_CONTROL_6" usage="rp_blit">
+		<!--
+			True if gl_PrimitiveID is read via the FS
+		-->
+		<bitfield name="PRIMID4PSEN" pos="0" type="boolean"/>
+	</reg32>
+
+	<reg32 offset="0xa007" name="VFD_MODE_CNTL" usage="cmd">
+		<bitfield name="RENDER_MODE" low="0" high="2" type="a6xx_render_mode"/>
+	</reg32>
+
+	<reg32 offset="0xa008" name="VFD_MULTIVIEW_CNTL" type="a6xx_multiview_cntl" usage="rp_blit"/>
+	<reg32 offset="0xa009" name="VFD_ADD_OFFSET" usage="cmd">
+		<!-- add VFD_INDEX_OFFSET to REGID4VTX -->
+		<bitfield name="VERTEX" pos="0" type="boolean"/>
+		<!-- add VFD_INSTANCE_START_OFFSET to REGID4INST -->
+		<bitfield name="INSTANCE" pos="1" type="boolean"/>
+	</reg32>
+
+	<reg32 offset="0xa00e" name="VFD_INDEX_OFFSET" usage="rp_blit"/>
+	<reg32 offset="0xa00f" name="VFD_INSTANCE_START_OFFSET" usage="rp_blit"/>
+	<array offset="0xa010" name="VFD_FETCH" stride="4" length="32" usage="rp_blit">
+		<reg64 offset="0x0" name="BASE" type="address" align="1"/>
+		<reg32 offset="0x2" name="SIZE" type="uint"/>
+		<reg32 offset="0x3" name="STRIDE" low="0" high="11" type="uint"/>
+	</array>
+	<array offset="0xa090" name="VFD_DECODE" stride="2" length="32" usage="rp_blit">
+		<reg32 offset="0x0" name="INSTR">
+			<!-- IDX and byte OFFSET into VFD_FETCH -->
+			<bitfield name="IDX" low="0" high="4" type="uint"/>
+			<bitfield name="OFFSET" low="5" high="16"/>
+			<bitfield name="INSTANCED" pos="17" type="boolean"/>
+			<bitfield name="FORMAT" low="20" high="27" type="a6xx_format"/>
+			<bitfield name="SWAP" low="28" high="29" type="a3xx_color_swap"/>
+			<bitfield name="UNK30" pos="30" type="boolean"/>
+			<bitfield name="FLOAT" pos="31" type="boolean"/>
+		</reg32>
+		<reg32 offset="0x1" name="STEP_RATE" type="uint"/>
+	</array>
+	<array offset="0xa0d0" name="VFD_DEST_CNTL" stride="1" length="32" usage="rp_blit">
+		<reg32 offset="0x0" name="INSTR">
+			<bitfield name="WRITEMASK" low="0" high="3" type="hex"/>
+			<bitfield name="REGID" low="4" high="11" type="a3xx_regid"/>
+		</reg32>
+	</array>
+
+	<reg32 offset="0xa0f8" name="VFD_POWER_CNTL" low="0" high="2" usage="rp_blit"/>
+
+	<reg32 offset="0xa600" name="VFD_UNKNOWN_A600" variants="A7XX-" usage="cmd"/>
+
+	<reg32 offset="0xa601" name="VFD_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
+	<array offset="0xa610" name="VFD_PERFCTR_VFD_SEL" stride="1" length="8" variants="A6XX"/>
+	<array offset="0xa610" name="VFD_PERFCTR_VFD_SEL" stride="1" length="16" variants="A7XX-"/>
+
+	<!--
+	Note: this seems to always be paired with another bit in another
+	block.
+	-->
+	<enum name="a6xx_threadsize">
+		<value value="0" name="THREAD64"/>
+		<value value="1" name="THREAD128"/>
+	</enum>
+
+	<bitset name="a6xx_sp_xs_ctrl_reg0" inline="yes">
+		<!-- if set to SINGLE, only use 1 concurrent wave on each SP -->
+		<bitfield name="THREADMODE" pos="0" type="a3xx_threadmode"/>
+		<!--
+		When b31 set we just see FULLREGFOOTPRINT set.  The pattern of
+		used registers is a bit odd too:
+			- used (half): 0-15 68-179 (cnt=128, max=179)
+			- used (full): 0-33 50-69 71 73 75 77 79 81 83 85 87 89-105 107 109 111 113 115 117 119 121 123 125 127>
+		whereas we usually see a (mostly) contiguous range of regs used.  But if
+		I merge the full and half ranges (ie. rN counts as hr(N*2) and hr(N*2+1)),
+		then:
+			- used (merged): 0-191 (cnt=192, max=191)
+		So I think if b31 is set, then the half precision registers overlap
+		the full precision registers.  (Which seems like a pretty sensible
+		feature, actually I'm not sure when you *wouldn't* want to use that,
+		since it gives register allocation more flexibility)
+		 -->
+		<bitfield name="HALFREGFOOTPRINT" low="1" high="6" type="uint"/>
+		<bitfield name="FULLREGFOOTPRINT" low="7" high="12" type="uint"/>
+		<!-- could it be a low bit of branchstack? -->
+		<bitfield name="UNK13" pos="13" type="boolean"/>
+		<!-- seems to be nesting level for flow control:.. -->
+		<bitfield name="BRANCHSTACK" low="14" high="19" type="uint"/>
+	</bitset>
+
+	<bitset name="a6xx_sp_xs_config" inline="yes">
+		<!--
+		Each of these are set if the given resource type is used
+		with the Vulkan/bindless binding model.
+		-->
+		<bitfield name="BINDLESS_TEX" pos="0" type="boolean"/>
+		<bitfield name="BINDLESS_SAMP" pos="1" type="boolean"/>
+		<bitfield name="BINDLESS_IBO" pos="2" type="boolean"/>
+		<bitfield name="BINDLESS_UBO" pos="3" type="boolean"/>
+
+		<bitfield name="ENABLED" pos="8" type="boolean"/>
+		<!--
+		number of textures and samplers.. these might be swapped, with GL I
+		always see the same value for both.
+		 -->
+		<bitfield name="NTEX" low="9" high="16" type="uint"/>
+		<bitfield name="NSAMP" low="17" high="21" type="uint"/>
+		<bitfield name="NIBO" low="22" high="28" type="uint"/>
+	</bitset>
+
+	<bitset name="a6xx_sp_xs_prim_cntl" inline="yes">
+		<!-- # of VS outputs including pos/psize -->
+		<bitfield name="OUT" low="0" high="5" type="uint"/>
+		<!-- FLAGS_REGID only for GS -->
+		<bitfield name="FLAGS_REGID" low="6" high="13" type="a3xx_regid"/>
+	</bitset>
+
+	<reg32 offset="0xa800" name="SP_VS_CTRL_REG0" type="a6xx_sp_xs_ctrl_reg0" usage="rp_blit">
+		<!--
+		This field actually controls all geometry stages. TCS, TES, and
+		GS must have the same mergedregs setting as VS.
+		-->
+		<bitfield name="MERGEDREGS" pos="20" type="boolean"/>
+		<!--
+		Creates a separate preamble-only thread?
+
+		Early preamble has the following limitations:
+		- Only shared, a1, and consts regs could be used
+		  (accessing other regs would result in GPU fault);
+		- No cat5/cat6, only stc/ldc variants are working;
+		- Values writen to shared regs are not accessible by the rest
+		  of the shader;
+		- Instructions before shps are also considered to be a part of
+		  early preamble;
+
+		Note, for all shaders from d3d11 games blob produced preambles
+		compatible with early preamble mode.
+		-->
+		<bitfield name="EARLYPREAMBLE" pos="21" type="boolean"/>
+	</reg32>
+	<!-- bitmask of true/false conditions for VS brac.N instructions,
+	     bit N corresponds to brac.N -->
+	<reg32 offset="0xa801" name="SP_VS_BRANCH_COND" type="hex"/>
+	<!-- # of VS outputs including pos/psize -->
+	<reg32 offset="0xa802" name="SP_VS_PRIMITIVE_CNTL" type="a6xx_sp_xs_prim_cntl" usage="rp_blit"/>
+	<array offset="0xa803" name="SP_VS_OUT" stride="1" length="16" usage="rp_blit">
+		<reg32 offset="0x0" name="REG">
+			<bitfield name="A_REGID" low="0" high="7" type="a3xx_regid"/>
+			<bitfield name="A_COMPMASK" low="8" high="11" type="hex"/>
+			<bitfield name="B_REGID" low="16" high="23" type="a3xx_regid"/>
+			<bitfield name="B_COMPMASK" low="24" high="27" type="hex"/>
+		</reg32>
+	</array>
+	<!--
+	Starting with a5xx, position/psize outputs from shader end up in the
+	SP_VS_OUT map, with highest OUTLOCn position.  (Generally they are
+	the last entries too, except when gl_PointCoord is used, blob inserts
+	an extra varying after, but with a lower OUTLOC position.  If present,
+	psize is last, preceded by position.
+	 -->
+	<array offset="0xa813" name="SP_VS_VPC_DST" stride="1" length="8" usage="rp_blit">
+		<reg32 offset="0x0" name="REG">
+			<bitfield name="OUTLOC0" low="0" high="7" type="uint"/>
+			<bitfield name="OUTLOC1" low="8" high="15" type="uint"/>
+			<bitfield name="OUTLOC2" low="16" high="23" type="uint"/>
+			<bitfield name="OUTLOC3" low="24" high="31" type="uint"/>
+		</reg32>
+	</array>
+
+	<bitset name="a6xx_sp_xs_pvt_mem_param" inline="yes">
+		<bitfield name="MEMSIZEPERITEM" low="0" high="7" shr="9">
+			<doc>The size of memory that ldp/stp can address.</doc>
+		</bitfield>
+		<bitfield name="HWSTACKSIZEPERTHREAD" low="24" high="31">
+                        <doc>
+				Seems to be the same as a3xx. The maximum stack
+				size in units of 4 calls, so a call depth of 7
+				would result in a value of 2.
+				TODO: What's the actual size per call, i.e. the
+				size of the PC? a3xx docs say it's 16 bits
+				there, but the length register now takes 28 bits
+				so it's probably been bumped to 32 bits.
+                        </doc>
+		</bitfield>
+	</bitset>
+
+	<bitset name="a6xx_sp_xs_pvt_mem_size" inline="yes">
+		<bitfield name="TOTALPVTMEMSIZE" low="0" high="17" shr="12"/>
+		<bitfield name="PERWAVEMEMLAYOUT" pos="31" type="boolean">
+			<doc>
+				There are four indices used to compute the
+				private memory location for an access:
+
+				- stp/ldp offset
+				- fiber id
+				- wavefront id (a swizzled version of what "getwid" returns)
+				- SP ID (the same as what "getspid" returns)
+
+				The stride for the SP ID is always set by
+				TOTALPVTMEMSIZE. In the per-wave layout, the
+				indices are used in this order:
+
+				- offset % 4 (offset within dword)
+				- fiber id
+				- offset / 4
+				- wavefront id
+				- SP ID
+
+				and the stride for the wavefront ID is
+				MEMSIZEPERITEM, multiplied by 128 (fibers per
+				wavefront). In the per-fiber layout, the indices
+				are used in this order:
+
+				- offset
+				- fiber id % 4
+				- wavefront id
+				- fiber id / 4
+				- SP ID
+
+				and the stride for the fiber id/wavefront id
+				combo is MEMSIZEPERITEM.
+
+				Note: Accesses of more than 1 dword do not work
+				with per-fiber layout. The blob will fall back
+				to per-wave instead.
+			</doc>
+		</bitfield>
+	</bitset>
+
+	<bitset name="a6xx_sp_xs_pvt_mem_hw_stack_offset" inline="yes">
+		<doc>
+			This seems to be be the equivalent of HWSTACKOFFSET in
+			a3xx. The ldp/stp offset formula above isn't affected by
+			HWSTACKSIZEPERTHREAD at all, so the HW return address
+			stack seems to be after all the normal per-SP private
+			memory.
+		</doc>
+		<bitfield name="OFFSET" low="0" high="18" shr="11"/>
+	</bitset>
+
+	<reg32 offset="0xa81b" name="SP_VS_OBJ_FIRST_EXEC_OFFSET" type="uint" usage="rp_blit"/>
+	<reg64 offset="0xa81c" name="SP_VS_OBJ_START" type="address" align="32" usage="rp_blit"/>
+	<reg32 offset="0xa81e" name="SP_VS_PVT_MEM_PARAM" type="a6xx_sp_xs_pvt_mem_param" usage="rp_blit"/>
+	<reg64 offset="0xa81f" name="SP_VS_PVT_MEM_ADDR" type="waddress" align="32" usage="rp_blit"/>
+	<reg32 offset="0xa821" name="SP_VS_PVT_MEM_SIZE" type="a6xx_sp_xs_pvt_mem_size" usage="rp_blit"/>
+	<reg32 offset="0xa822" name="SP_VS_TEX_COUNT" low="0" high="7" type="uint" usage="rp_blit"/>
+	<reg32 offset="0xa823" name="SP_VS_CONFIG" type="a6xx_sp_xs_config" usage="rp_blit"/>
+	<reg32 offset="0xa824" name="SP_VS_INSTRLEN" low="0" high="27" type="uint" usage="rp_blit"/>
+	<reg32 offset="0xa825" name="SP_VS_PVT_MEM_HW_STACK_OFFSET" type="a6xx_sp_xs_pvt_mem_hw_stack_offset" usage="rp_blit"/>
+	<reg32 offset="0xa82d" name="SP_VS_VGPR_CONFIG" variants="A7XX-" usage="cmd"/>
+
+	<reg32 offset="0xa830" name="SP_HS_CTRL_REG0" type="a6xx_sp_xs_ctrl_reg0" usage="rp_blit">
+		<!-- There is no mergedregs bit, that comes from the VS. -->
+		<bitfield name="EARLYPREAMBLE" pos="20" type="boolean"/>
+	</reg32>
+	<!--
+	Total size of local storage in dwords divided by the wave size.
+	The maximum value is 64. With the wave size being always 64 for HS,
+	the maximum size of local storage should be:
+	 64 (wavesize) * 64 (SP_HS_WAVE_INPUT_SIZE) * 4 = 16k
+	-->
+	<reg32 offset="0xa831" name="SP_HS_WAVE_INPUT_SIZE" low="0" high="7" type="uint" usage="rp_blit"/>
+	<reg32 offset="0xa832" name="SP_HS_BRANCH_COND" type="hex" usage="rp_blit"/>
+
+	<!-- TODO: exact same layout as 0xa81b-0xa825 -->
+	<reg32 offset="0xa833" name="SP_HS_OBJ_FIRST_EXEC_OFFSET" type="uint" usage="rp_blit"/>
+	<reg64 offset="0xa834" name="SP_HS_OBJ_START" type="address" align="32" usage="rp_blit"/>
+	<reg32 offset="0xa836" name="SP_HS_PVT_MEM_PARAM" type="a6xx_sp_xs_pvt_mem_param" usage="rp_blit"/>
+	<reg64 offset="0xa837" name="SP_HS_PVT_MEM_ADDR" type="waddress" align="32" usage="rp_blit"/>
+	<reg32 offset="0xa839" name="SP_HS_PVT_MEM_SIZE" type="a6xx_sp_xs_pvt_mem_size" usage="rp_blit"/>
+	<reg32 offset="0xa83a" name="SP_HS_TEX_COUNT" low="0" high="7" type="uint" usage="rp_blit"/>
+	<reg32 offset="0xa83b" name="SP_HS_CONFIG" type="a6xx_sp_xs_config" usage="rp_blit"/>
+	<reg32 offset="0xa83c" name="SP_HS_INSTRLEN" low="0" high="27" type="uint" usage="rp_blit"/>
+	<reg32 offset="0xa83d" name="SP_HS_PVT_MEM_HW_STACK_OFFSET" type="a6xx_sp_xs_pvt_mem_hw_stack_offset" usage="rp_blit"/>
+	<reg32 offset="0xa82f" name="SP_HS_VGPR_CONFIG" variants="A7XX-" usage="cmd"/>
+
+	<reg32 offset="0xa840" name="SP_DS_CTRL_REG0" type="a6xx_sp_xs_ctrl_reg0" usage="rp_blit">
+		<!-- There is no mergedregs bit, that comes from the VS. -->
+		<bitfield name="EARLYPREAMBLE" pos="20" type="boolean"/>
+	</reg32>
+	<reg32 offset="0xa841" name="SP_DS_BRANCH_COND" type="hex"/>
+
+	<!-- TODO: exact same layout as 0xa802-0xa81a -->
+	<reg32 offset="0xa842" name="SP_DS_PRIMITIVE_CNTL" type="a6xx_sp_xs_prim_cntl" usage="rp_blit"/>
+	<array offset="0xa843" name="SP_DS_OUT" stride="1" length="16" usage="rp_blit">
+		<reg32 offset="0x0" name="REG">
+			<bitfield name="A_REGID" low="0" high="7" type="a3xx_regid"/>
+			<bitfield name="A_COMPMASK" low="8" high="11" type="hex"/>
+			<bitfield name="B_REGID" low="16" high="23" type="a3xx_regid"/>
+			<bitfield name="B_COMPMASK" low="24" high="27" type="hex"/>
+		</reg32>
+	</array>
+	<array offset="0xa853" name="SP_DS_VPC_DST" stride="1" length="8" usage="rp_blit">
+		<reg32 offset="0x0" name="REG">
+			<bitfield name="OUTLOC0" low="0" high="7" type="uint"/>
+			<bitfield name="OUTLOC1" low="8" high="15" type="uint"/>
+			<bitfield name="OUTLOC2" low="16" high="23" type="uint"/>
+			<bitfield name="OUTLOC3" low="24" high="31" type="uint"/>
+		</reg32>
+	</array>
+
+	<!-- TODO: exact same layout as 0xa81b-0xa825 -->
+	<reg32 offset="0xa85b" name="SP_DS_OBJ_FIRST_EXEC_OFFSET" type="uint" usage="rp_blit"/>
+	<reg64 offset="0xa85c" name="SP_DS_OBJ_START" type="address" align="32" usage="rp_blit"/>
+	<reg32 offset="0xa85e" name="SP_DS_PVT_MEM_PARAM" type="a6xx_sp_xs_pvt_mem_param" usage="rp_blit"/>
+	<reg64 offset="0xa85f" name="SP_DS_PVT_MEM_ADDR" type="waddress" align="32" usage="rp_blit"/>
+	<reg32 offset="0xa861" name="SP_DS_PVT_MEM_SIZE" type="a6xx_sp_xs_pvt_mem_size" usage="rp_blit"/>
+	<reg32 offset="0xa862" name="SP_DS_TEX_COUNT" low="0" high="7" type="uint" usage="rp_blit"/>
+	<reg32 offset="0xa863" name="SP_DS_CONFIG" type="a6xx_sp_xs_config" usage="rp_blit"/>
+	<reg32 offset="0xa864" name="SP_DS_INSTRLEN" low="0" high="27" type="uint" usage="rp_blit"/>
+	<reg32 offset="0xa865" name="SP_DS_PVT_MEM_HW_STACK_OFFSET" type="a6xx_sp_xs_pvt_mem_hw_stack_offset" usage="rp_blit"/>
+	<reg32 offset="0xa868" name="SP_DS_VGPR_CONFIG" variants="A7XX-" usage="cmd"/>
+
+	<reg32 offset="0xa870" name="SP_GS_CTRL_REG0" type="a6xx_sp_xs_ctrl_reg0" usage="rp_blit">
+		<!-- There is no mergedregs bit, that comes from the VS. -->
+		<bitfield name="EARLYPREAMBLE" pos="20" type="boolean"/>
+	</reg32>
+	<reg32 offset="0xa871" name="SP_GS_PRIM_SIZE" low="0" high="7" type="uint" usage="rp_blit">
+		<doc>
+			Normally the size of the output of the last stage in
+			dwords. It should be programmed as follows:
+
+			size less than 63    - size
+			size of 63 (?) or 64 - 63
+			size greater than 64 - 64
+
+			What to program when the size is 61-63 is a guess, but
+			both the blob and ir3 align the size to 4 dword's so it
+			doesn't matter in practice.
+		</doc>
+	</reg32>
+	<reg32 offset="0xa872" name="SP_GS_BRANCH_COND" type="hex" usage="rp_blit"/>
+
+	<!-- TODO: exact same layout as 0xa802-0xa81a -->
+	<reg32 offset="0xa873" name="SP_GS_PRIMITIVE_CNTL" type="a6xx_sp_xs_prim_cntl" usage="rp_blit"/>
+	<array offset="0xa874" name="SP_GS_OUT" stride="1" length="16" usage="rp_blit">
+		<reg32 offset="0x0" name="REG">
+			<bitfield name="A_REGID" low="0" high="7" type="a3xx_regid"/>
+			<bitfield name="A_COMPMASK" low="8" high="11" type="hex"/>
+			<bitfield name="B_REGID" low="16" high="23" type="a3xx_regid"/>
+			<bitfield name="B_COMPMASK" low="24" high="27" type="hex"/>
+		</reg32>
+	</array>
+
+	<array offset="0xa884" name="SP_GS_VPC_DST" stride="1" length="8" usage="rp_blit">
+		<reg32 offset="0x0" name="REG">
+			<bitfield name="OUTLOC0" low="0" high="7" type="uint"/>
+			<bitfield name="OUTLOC1" low="8" high="15" type="uint"/>
+			<bitfield name="OUTLOC2" low="16" high="23" type="uint"/>
+			<bitfield name="OUTLOC3" low="24" high="31" type="uint"/>
+		</reg32>
+	</array>
+
+	<!-- TODO: exact same layout as 0xa81b-0xa825 -->
+	<reg32 offset="0xa88c" name="SP_GS_OBJ_FIRST_EXEC_OFFSET" type="uint" usage="rp_blit"/>
+	<reg64 offset="0xa88d" name="SP_GS_OBJ_START" type="address" align="32" usage="rp_blit"/>
+	<reg32 offset="0xa88f" name="SP_GS_PVT_MEM_PARAM" type="a6xx_sp_xs_pvt_mem_param" usage="rp_blit"/>
+	<reg64 offset="0xa890" name="SP_GS_PVT_MEM_ADDR" type="waddress" align="32" usage="rp_blit"/>
+	<reg32 offset="0xa892" name="SP_GS_PVT_MEM_SIZE" type="a6xx_sp_xs_pvt_mem_size" usage="rp_blit"/>
+	<reg32 offset="0xa893" name="SP_GS_TEX_COUNT" low="0" high="7" type="uint" usage="rp_blit"/>
+	<reg32 offset="0xa894" name="SP_GS_CONFIG" type="a6xx_sp_xs_config" usage="rp_blit"/>
+	<reg32 offset="0xa895" name="SP_GS_INSTRLEN" low="0" high="27" type="uint" usage="rp_blit"/>
+	<reg32 offset="0xa896" name="SP_GS_PVT_MEM_HW_STACK_OFFSET" type="a6xx_sp_xs_pvt_mem_hw_stack_offset" usage="rp_blit"/>
+	<reg32 offset="0xa899" name="SP_GS_VGPR_CONFIG" variants="A7XX-" usage="cmd"/>
+
+	<reg64 offset="0xa8a0" name="SP_VS_TEX_SAMP" type="address" align="16" usage="cmd"/>
+	<reg64 offset="0xa8a2" name="SP_HS_TEX_SAMP" type="address" align="16" usage="cmd"/>
+	<reg64 offset="0xa8a4" name="SP_DS_TEX_SAMP" type="address" align="16" usage="cmd"/>
+	<reg64 offset="0xa8a6" name="SP_GS_TEX_SAMP" type="address" align="16" usage="cmd"/>
+	<reg64 offset="0xa8a8" name="SP_VS_TEX_CONST" type="address" align="64" usage="cmd"/>
+	<reg64 offset="0xa8aa" name="SP_HS_TEX_CONST" type="address" align="64" usage="cmd"/>
+	<reg64 offset="0xa8ac" name="SP_DS_TEX_CONST" type="address" align="64" usage="cmd"/>
+	<reg64 offset="0xa8ae" name="SP_GS_TEX_CONST" type="address" align="64" usage="cmd"/>
+
+	<!-- TODO: 4 unknown bool registers 0xa8c0-0xa8c3 -->
+
+	<reg32 offset="0xa980" name="SP_FS_CTRL_REG0" type="a6xx_sp_xs_ctrl_reg0" usage="rp_blit">
+		<bitfield name="THREADSIZE" pos="20" type="a6xx_threadsize"/>
+		<bitfield name="UNK21" pos="21" type="boolean"/>
+		<bitfield name="VARYING" pos="22" type="boolean"/>
+		<bitfield name="LODPIXMASK" pos="23" type="boolean">
+			<doc>
+				Enable ALL helper invocations in a quad. Necessary for
+				fine derivatives and quad subgroup ops.
+			</doc>
+		</bitfield>
+		<!-- note: vk blob uses bit24 -->
+		<bitfield name="UNK24" pos="24" type="boolean"/>
+		<bitfield name="UNK25" pos="25" type="boolean"/>
+		<bitfield name="PIXLODENABLE" pos="26" type="boolean">
+			<doc>
+				Enable helper invocations. Enables 3 out of 4 fragments,
+				because the coarse derivatives only use half of the quad
+				and so one pixel's value is always unused.
+			</doc>
+		</bitfield>
+		<bitfield name="UNK27" pos="27" type="boolean"/>
+		<bitfield name="EARLYPREAMBLE" pos="28" type="boolean"/>
+		<bitfield name="MERGEDREGS" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="0xa981" name="SP_FS_BRANCH_COND" type="hex"/>
+	<reg32 offset="0xa982" name="SP_FS_OBJ_FIRST_EXEC_OFFSET" type="uint" usage="rp_blit"/>
+	<reg64 offset="0xa983" name="SP_FS_OBJ_START" type="address" align="32" usage="rp_blit"/>
+	<reg32 offset="0xa985" name="SP_FS_PVT_MEM_PARAM" type="a6xx_sp_xs_pvt_mem_param" usage="rp_blit"/>
+	<reg64 offset="0xa986" name="SP_FS_PVT_MEM_ADDR" type="waddress" align="32" usage="rp_blit"/>
+	<reg32 offset="0xa988" name="SP_FS_PVT_MEM_SIZE" type="a6xx_sp_xs_pvt_mem_size" usage="rp_blit"/>
+
+	<reg32 offset="0xa989" name="SP_BLEND_CNTL" usage="rp_blit">
+		<!-- per-mrt enable bit -->
+		<bitfield name="ENABLE_BLEND" low="0" high="7"/>
+		<bitfield name="UNK8" pos="8" type="boolean"/>
+		<bitfield name="DUAL_COLOR_IN_ENABLE" pos="9" type="boolean"/>
+		<bitfield name="ALPHA_TO_COVERAGE" pos="10" type="boolean"/>
+	</reg32>
+	<reg32 offset="0xa98a" name="SP_SRGB_CNTL" usage="rp_blit">
+		<!-- Same as RB_SRGB_CNTL -->
+		<bitfield name="SRGB_MRT0" pos="0" type="boolean"/>
+		<bitfield name="SRGB_MRT1" pos="1" type="boolean"/>
+		<bitfield name="SRGB_MRT2" pos="2" type="boolean"/>
+		<bitfield name="SRGB_MRT3" pos="3" type="boolean"/>
+		<bitfield name="SRGB_MRT4" pos="4" type="boolean"/>
+		<bitfield name="SRGB_MRT5" pos="5" type="boolean"/>
+		<bitfield name="SRGB_MRT6" pos="6" type="boolean"/>
+		<bitfield name="SRGB_MRT7" pos="7" type="boolean"/>
+	</reg32>
+	<reg32 offset="0xa98b" name="SP_FS_RENDER_COMPONENTS" usage="rp_blit">
+		<bitfield name="RT0" low="0" high="3"/>
+		<bitfield name="RT1" low="4" high="7"/>
+		<bitfield name="RT2" low="8" high="11"/>
+		<bitfield name="RT3" low="12" high="15"/>
+		<bitfield name="RT4" low="16" high="19"/>
+		<bitfield name="RT5" low="20" high="23"/>
+		<bitfield name="RT6" low="24" high="27"/>
+		<bitfield name="RT7" low="28" high="31"/>
+	</reg32>
+	<reg32 offset="0xa98c" name="SP_FS_OUTPUT_CNTL0" usage="rp_blit">
+		<bitfield name="DUAL_COLOR_IN_ENABLE" pos="0" type="boolean"/>
+		<bitfield name="DEPTH_REGID" low="8" high="15" type="a3xx_regid"/>
+		<bitfield name="SAMPMASK_REGID" low="16" high="23" type="a3xx_regid"/>
+		<bitfield name="STENCILREF_REGID" low="24" high="31" type="a3xx_regid"/>
+	</reg32>
+	<reg32 offset="0xa98d" name="SP_FS_OUTPUT_CNTL1" usage="rp_blit">
+		<bitfield name="MRT" low="0" high="3" type="uint"/>
+	</reg32>
+
+	<array offset="0xa98e" name="SP_FS_OUTPUT" stride="1" length="8" usage="rp_blit">
+		<doc>per MRT</doc>
+		<reg32 offset="0x0" name="REG">
+			<bitfield name="REGID" low="0" high="7" type="a3xx_regid"/>
+			<bitfield name="HALF_PRECISION" pos="8" type="boolean"/>
+		</reg32>
+	</array>
+
+	<array offset="0xa996" name="SP_FS_MRT" stride="1" length="8" usage="rp_blit">
+		<reg32 offset="0" name="REG">
+			<bitfield name="COLOR_FORMAT" low="0" high="7" type="a6xx_format"/>
+			<bitfield name="COLOR_SINT" pos="8" type="boolean"/>
+			<bitfield name="COLOR_UINT" pos="9" type="boolean"/>
+			<bitfield name="UNK10" pos="10" type="boolean"/>
+		</reg32>
+	</array>
+
+	<reg32 offset="0xa99e" name="SP_FS_PREFETCH_CNTL" usage="rp_blit">
+		<bitfield name="COUNT" low="0" high="2" type="uint"/>
+		<bitfield name="IJ_WRITE_DISABLE" pos="3" type="boolean"/>
+		<doc>
+			Similar to "(eq)" flag but disables helper invocations
+			after the texture prefetch.
+		</doc>
+		<bitfield name="ENDOFQUAD" pos="4" type="boolean" />
+		<doc>
+			Bypass writing to regs and overwrite output with color from
+			CONSTSLOTID const regs.
+		</doc>
+		<bitfield name="WRITE_COLOR_TO_OUTPUT" pos="5" type="boolean"/>
+		<bitfield name="CONSTSLOTID" low="6" high="14" type="uint"/>
+		<!-- Blob never uses it -->
+		<bitfield name="CONSTSLOTID4COORD" low="16" high="24" type="uint" variants="A7XX-"/>
+	</reg32>
+	<array offset="0xa99f" name="SP_FS_PREFETCH" stride="1" length="4" variants="A6XX" usage="rp_blit">
+		<reg32 offset="0" name="CMD" variants="A6XX">
+			<bitfield name="SRC" low="0" high="6" type="uint"/>
+			<bitfield name="SAMP_ID" low="7" high="10" type="uint"/>
+			<bitfield name="TEX_ID" low="11" high="15" type="uint"/>
+			<bitfield name="DST" low="16" high="21" type="a3xx_regid"/>
+			<bitfield name="WRMASK" low="22" high="25" type="hex"/>
+			<bitfield name="HALF" pos="26" type="boolean"/>
+			<doc>Results in color being zero</doc>
+			<bitfield name="UNK27" pos="27" type="boolean"/>
+			<bitfield name="BINDLESS" pos="28" type="boolean"/>
+			<bitfield name="CMD" low="29" high="31" type="a6xx_tex_prefetch_cmd"/>
+		</reg32>
+	</array>
+	<array offset="0xa99f" name="SP_FS_PREFETCH" stride="1" length="4" variants="A7XX-" usage="rp_blit">
+		<reg32 offset="0" name="CMD" variants="A7XX-">
+			<bitfield name="SRC" low="0" high="6" type="uint"/>
+			<bitfield name="SAMP_ID" low="7" high="9" type="uint"/>
+			<bitfield name="TEX_ID" low="10" high="12" type="uint"/>
+			<bitfield name="DST" low="13" high="18" type="a3xx_regid"/>
+			<bitfield name="WRMASK" low="19" high="22" type="hex"/>
+			<bitfield name="HALF" pos="23" type="boolean"/>
+			<bitfield name="BINDLESS" pos="25" type="boolean"/>
+			<bitfield name="CMD" low="26" high="29" type="a6xx_tex_prefetch_cmd"/>
+		</reg32>
+	</array>
+	<array offset="0xa9a3" name="SP_FS_BINDLESS_PREFETCH" stride="1" length="4" usage="rp_blit">
+		<reg32 offset="0" name="CMD">
+			<bitfield name="SAMP_ID" low="0" high="15" type="uint"/>
+			<bitfield name="TEX_ID" low="16" high="31" type="uint"/>
+		</reg32>
+	</array>
+	<reg32 offset="0xa9a7" name="SP_FS_TEX_COUNT" low="0" high="7" type="uint" usage="rp_blit"/>
+	<reg32 offset="0xa9a8" name="SP_UNKNOWN_A9A8" low="0" high="16" usage="cmd"/> <!-- always 0x0 ? -->
+	<reg32 offset="0xa9a9" name="SP_FS_PVT_MEM_HW_STACK_OFFSET" type="a6xx_sp_xs_pvt_mem_hw_stack_offset" usage="rp_blit"/>
+
+	<!-- TODO: unknown bool register at 0xa9aa, likely same as 0xa8c0-0xa8c3 but for FS -->
+
+
+
+
+	<reg32 offset="0xa9b0" name="SP_CS_CTRL_REG0" type="a6xx_sp_xs_ctrl_reg0" usage="cmd">
+		<bitfield name="THREADSIZE" pos="20" type="a6xx_threadsize"/>
+		<!-- seems to make SP use less concurrent threads when possible? -->
+		<bitfield name="UNK21" pos="21" type="boolean"/>
+		<!-- has a small impact on performance, not clear what it does -->
+		<bitfield name="UNK22" pos="22" type="boolean"/>
+		<bitfield name="EARLYPREAMBLE" pos="23" type="boolean"/>
+		<bitfield name="MERGEDREGS" pos="31" type="boolean"/>
+	</reg32>
+
+	<!-- set for compute shaders -->
+	<reg32 offset="0xa9b1" name="SP_CS_UNKNOWN_A9B1" usage="cmd">
+		<bitfield name="SHARED_SIZE" low="0" high="4" type="uint">
+			<doc>
+				If 0 - all 32k of shared storage is enabled, otherwise
+				(SHARED_SIZE + 1) * 1k is enabled.
+				The ldl/stl offset seems to be rewritten to 0 when it is beyond
+				this limit. This is different from ldlw/stlw, which wraps at
+				64k (and has 36k of storage on A640 - reads between 36k-64k
+				always return 0)
+			</doc>
+		</bitfield>
+		<bitfield name="UNK5" pos="5" type="boolean"/>
+		<!-- always 1 ? -->
+		<bitfield name="UNK6" pos="6" type="boolean"/>
+	</reg32>
+	<reg32 offset="0xa9b2" name="SP_CS_BRANCH_COND" type="hex" usage="cmd"/>
+	<reg32 offset="0xa9b3" name="SP_CS_OBJ_FIRST_EXEC_OFFSET" type="uint" usage="cmd"/>
+	<reg64 offset="0xa9b4" name="SP_CS_OBJ_START" type="address" align="32" usage="cmd"/>
+	<reg32 offset="0xa9b6" name="SP_CS_PVT_MEM_PARAM" type="a6xx_sp_xs_pvt_mem_param" usage="cmd"/>
+	<reg64 offset="0xa9b7" name="SP_CS_PVT_MEM_ADDR" align="32" usage="cmd"/>
+	<reg32 offset="0xa9b9" name="SP_CS_PVT_MEM_SIZE" type="a6xx_sp_xs_pvt_mem_size" usage="cmd"/>
+	<reg32 offset="0xa9ba" name="SP_CS_TEX_COUNT" low="0" high="7" type="uint" usage="cmd"/>
+	<reg32 offset="0xa9bb" name="SP_CS_CONFIG" type="a6xx_sp_xs_config" usage="cmd"/>
+	<reg32 offset="0xa9bc" name="SP_CS_INSTRLEN" low="0" high="27" type="uint" usage="cmd"/>
+	<reg32 offset="0xa9bd" name="SP_CS_PVT_MEM_HW_STACK_OFFSET" type="a6xx_sp_xs_pvt_mem_hw_stack_offset" usage="cmd"/>
+	<reg32 offset="0xa9be" name="SP_CS_UNKNOWN_A9BE" variants="A7XX-" usage="cmd"/>
+	<reg32 offset="0xa9c5" name="SP_CS_VGPR_CONFIG" variants="A7XX-" usage="cmd"/>
+
+	<!-- new in a6xx gen4, matches HLSQ_CS_CNTL_0 -->
+	<reg32 offset="0xa9c2" name="SP_CS_CNTL_0" usage="cmd">
+		<bitfield name="WGIDCONSTID" low="0" high="7" type="a3xx_regid"/>
+		<bitfield name="WGSIZECONSTID" low="8" high="15" type="a3xx_regid"/>
+		<bitfield name="WGOFFSETCONSTID" low="16" high="23" type="a3xx_regid"/>
+		<bitfield name="LOCALIDREGID" low="24" high="31" type="a3xx_regid"/>
+	</reg32>
+	<!-- new in a6xx gen4, matches HLSQ_CS_CNTL_1 -->
+	<reg32 offset="0xa9c3" name="SP_CS_CNTL_1" variants="A6XX" usage="cmd">
+		<!-- gl_LocalInvocationIndex -->
+		<bitfield name="LINEARLOCALIDREGID" low="0" high="7" type="a3xx_regid"/>
+		<!-- a650 has 6 "SP cores" (but 3 "SP"). this makes it use only
+		     one of those 6 "SP cores" -->
+		<bitfield name="SINGLE_SP_CORE" pos="8" type="boolean"/>
+		<!-- Must match SP_CS_CTRL -->
+		<bitfield name="THREADSIZE" pos="9" type="a6xx_threadsize"/>
+		<!-- 1 thread per wave (ignored if bit9 set) -->
+		<bitfield name="THREADSIZE_SCALAR" pos="10" type="boolean"/>
+	</reg32>
+
+	<reg32 offset="0xa9c3" name="SP_CS_CNTL_1" variants="A7XX-" usage="cmd">
+		<!-- gl_LocalInvocationIndex -->
+		<bitfield name="LINEARLOCALIDREGID" low="0" high="7" type="a3xx_regid"/>
+		<!-- Must match SP_CS_CTRL -->
+		<bitfield name="THREADSIZE" pos="8" type="a6xx_threadsize"/>
+		<!-- 1 thread per wave (would hang if THREAD128 is also set) -->
+		<bitfield name="THREADSIZE_SCALAR" pos="9" type="boolean"/>
+
+		<!-- Affects getone. If enabled, getone sometimes executed 1? less times
+		     than there are subgroups.
+		 -->
+		<bitfield name="UNK15" pos="15" type="boolean"/>
+	</reg32>
+
+	<!-- TODO: two 64kb aligned addresses at a9d0/a9d2 -->
+
+	<reg64 offset="0xa9e0" name="SP_FS_TEX_SAMP" type="address" align="16" usage="rp_blit"/>
+	<reg64 offset="0xa9e2" name="SP_CS_TEX_SAMP" type="address" align="16" usage="cmd"/>
+	<reg64 offset="0xa9e4" name="SP_FS_TEX_CONST" type="address" align="64" usage="rp_blit"/>
+	<reg64 offset="0xa9e6" name="SP_CS_TEX_CONST" type="address" align="64" usage="cmd"/>
+
+	<enum name="a6xx_bindless_descriptor_size">
+		<doc>
+			This can alternatively be interpreted as a pitch shift, ie, the
+			descriptor size is 2 &lt;&lt; N dwords
+		</doc>
+		<value value="1" name="BINDLESS_DESCRIPTOR_16B"/>
+		<value value="3" name="BINDLESS_DESCRIPTOR_64B"/>
+	</enum>
+
+	<array offset="0xa9e8" name="SP_CS_BINDLESS_BASE" stride="2" length="5" variants="A6XX" usage="cmd">
+		<reg64 offset="0" name="DESCRIPTOR" variants="A6XX">
+			<bitfield name="DESC_SIZE" low="0" high="1" type="a6xx_bindless_descriptor_size"/>
+			<bitfield name="ADDR" low="2" high="63" shr="2" type="address"/>
+		</reg64>
+	</array>
+	<array offset="0xa9e8" name="SP_CS_BINDLESS_BASE" stride="2" length="8" variants="A7XX-" usage="cmd">
+		<reg64 offset="0" name="DESCRIPTOR" variants="A7XX-">
+			<bitfield name="DESC_SIZE" low="0" high="1" type="a6xx_bindless_descriptor_size"/>
+			<bitfield name="ADDR" low="2" high="63" shr="2" type="address"/>
+		</reg64>
+	</array>
+
+	<!--
+	IBO state for compute shader:
+	 -->
+	<reg64 offset="0xa9f2" name="SP_CS_IBO" type="address" align="16"/>
+	<reg32 offset="0xaa00" name="SP_CS_IBO_COUNT" low="0" high="6" type="uint"/>
+
+	<!-- Correlated with avgs/uvgs usage in FS -->
+	<reg32 offset="0xaa01" name="SP_FS_VGPR_CONFIG" type="uint" variants="A7XX-" usage="cmd"/>
+
+	<reg32 offset="0xaa02" name="SP_PS_ALIASED_COMPONENTS_CONTROL" variants="A7XX-" usage="cmd">
+		<bitfield name="ENABLED" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0xaa03" name="SP_PS_ALIASED_COMPONENTS" variants="A7XX-" usage="cmd">
+		<doc>
+			Specify for which components the output color should be read
+			from alias, e.g. for:
+
+				alias.1.b32.0 r3.x, c8.x
+				alias.1.b32.0 r2.x, c4.x
+				alias.1.b32.0 r1.x, c4.x
+				alias.1.b32.0 r0.x, c0.x
+
+			the SP_PS_ALIASED_COMPONENTS would be 0x00001111
+		</doc>
+
+		<bitfield name="RT0" low="0" high="3"/>
+		<bitfield name="RT1" low="4" high="7"/>
+		<bitfield name="RT2" low="8" high="11"/>
+		<bitfield name="RT3" low="12" high="15"/>
+		<bitfield name="RT4" low="16" high="19"/>
+		<bitfield name="RT5" low="20" high="23"/>
+		<bitfield name="RT6" low="24" high="27"/>
+		<bitfield name="RT7" low="28" high="31"/>
+	</reg32>
+
+	<reg32 offset="0xaaf2" name="SP_UNKNOWN_AAF2" type="uint" usage="cmd"/>
+
+	<!--
+                This enum is probably similar in purpose to SNORMMODE on a3xx,
+                minus the snorm stuff, i.e. it controls what happens with an
+                out-of-bounds isam/isamm. GL and Vulkan robustness require us to
+                return 0 on out-of-bound textureFetch().
+	-->
+	<enum name="a6xx_isam_mode">
+		<value value="0x1" name="ISAMMODE_CL"/>
+		<value value="0x2" name="ISAMMODE_GL"/>
+	</enum>
+
+	<reg32 offset="0xab00" name="SP_MODE_CONTROL" usage="rp_blit">
+	  <!--
+	  When set, half register loads from the constant file will
+	  load a 32-bit value (so hc0.y loads the same value as c0.y)
+	  and implicitly convert it to 16b (f2f16, or u2u16, based on
+	  operand type).  When unset, half register loads from the
+	  constant file will load 16 bits from the packed constant
+	  file (so hc0.y loads the top 16 bits of the value of c0.x)
+	  -->
+		<bitfield name="CONSTANT_DEMOTION_ENABLE" pos="0" type="boolean"/>
+		<bitfield name="ISAMMODE" low="1" high="2" type="a6xx_isam_mode"/>
+		<bitfield name="SHARED_CONSTS_ENABLE" pos="3" type="boolean"/> <!-- see HLSQ_SHARED_CONSTS -->
+	</reg32>
+
+	<reg32 offset="0xab01" name="SP_UNKNOWN_AB01" variants="A7XX-" usage="cmd"/>
+	<reg32 offset="0xab02" name="SP_UNKNOWN_AB02" variants="A7XX-" usage="cmd"/>
+
+	<reg32 offset="0xab04" name="SP_FS_CONFIG" type="a6xx_sp_xs_config" usage="rp_blit"/>
+	<reg32 offset="0xab05" name="SP_FS_INSTRLEN" low="0" high="27" type="uint" usage="rp_blit"/>
+
+	<array offset="0xab10" name="SP_BINDLESS_BASE" stride="2" length="5" variants="A6XX" usage="rp_blit">
+		<reg64 offset="0" name="DESCRIPTOR" variants="A6XX">
+			<bitfield name="DESC_SIZE" low="0" high="1" type="a6xx_bindless_descriptor_size"/>
+			<bitfield name="ADDR" low="2" high="63" shr="2" type="address"/>
+		</reg64>
+	</array>
+	<array offset="0xab0a" name="SP_BINDLESS_BASE" stride="2" length="8" variants="A7XX-" usage="rp_blit">
+		<reg64 offset="0" name="DESCRIPTOR" variants="A7XX-">
+			<bitfield name="DESC_SIZE" low="0" high="1" type="a6xx_bindless_descriptor_size"/>
+			<bitfield name="ADDR" low="2" high="63" shr="2" type="address"/>
+		</reg64>
+	</array>
+
+	<!--
+	Combined IBO state for 3d pipe, used for Image and SSBO write/atomic
+	instructions VS/HS/DS/GS/FS.  See SP_CS_IBO_* for compute shaders.
+	 -->
+	<reg64 offset="0xab1a" name="SP_IBO" type="address" align="16" usage="cmd"/>
+	<reg32 offset="0xab20" name="SP_IBO_COUNT" low="0" high="6" type="uint" usage="cmd"/>
+
+	<reg32 offset="0xab22" name="SP_UNKNOWN_AB22" variants="A7XX-" usage="cmd"/>
+
+	<bitset name="a6xx_sp_2d_dst_format" inline="yes">
+		<bitfield name="NORM" pos="0" type="boolean"/>
+		<bitfield name="SINT" pos="1" type="boolean"/>
+		<bitfield name="UINT" pos="2" type="boolean"/>
+		<!-- looks like HW only cares about the base type of this format,
+		     which matches the ifmt? -->
+		<bitfield name="COLOR_FORMAT" low="3" high="10" type="a6xx_format"/>
+		<!-- set when ifmt is R2D_UNORM8_SRGB -->
+		<bitfield name="SRGB" pos="11" type="boolean"/>
+		<!-- some sort of channel mask, not sure what it is for -->
+		<bitfield name="MASK" low="12" high="15"/>
+	</bitset>
+
+	<reg32 offset="0xacc0" name="SP_2D_DST_FORMAT" type="a6xx_sp_2d_dst_format" variants="A6XX" usage="rp_blit"/>
+	<reg32 offset="0xa9bf" name="SP_2D_DST_FORMAT" type="a6xx_sp_2d_dst_format" variants="A7XX-" usage="rp_blit"/>
+
+	<reg32 offset="0xae00" name="SP_DBG_ECO_CNTL" usage="cmd"/>
+	<reg32 offset="0xae01" name="SP_ADDR_MODE_CNTL" pos="0" type="a5xx_address_mode"/>
+	<reg32 offset="0xae02" name="SP_NC_MODE_CNTL">
+		<!-- TODO: valid bits 0x3c3f, see kernel -->
+	</reg32>
+	<reg32 offset="0xae03" name="SP_CHICKEN_BITS" usage="cmd"/>
+	<reg32 offset="0xae04" name="SP_FLOAT_CNTL" usage="cmd">
+		<bitfield name="F16_NO_INF" pos="3" type="boolean"/>
+	</reg32>
+
+	<reg32 offset="0xae06" name="SP_UNKNOWN_AE06" variants="A7XX-" usage="cmd"/>
+	<reg32 offset="0xae08" name="SP_UNKNOWN_AE08" variants="A7XX-" usage="cmd"/>
+	<reg32 offset="0xae09" name="SP_UNKNOWN_AE09" variants="A7XX-" usage="cmd"/>
+	<reg32 offset="0xae0a" name="SP_UNKNOWN_AE0A" variants="A7XX-" usage="cmd"/>
+
+	<reg32 offset="0xae0f" name="SP_PERFCTR_ENABLE" usage="cmd">
+		<!-- some perfcntrs are affected by a per-stage enable bit
+		     (PERF_SP_ALU_WORKING_CYCLES for example)
+		     TODO: verify position of HS/DS/GS bits -->
+		<bitfield name="VS" pos="0" type="boolean"/>
+		<bitfield name="HS" pos="1" type="boolean"/>
+		<bitfield name="DS" pos="2" type="boolean"/>
+		<bitfield name="GS" pos="3" type="boolean"/>
+		<bitfield name="FS" pos="4" type="boolean"/>
+		<bitfield name="CS" pos="5" type="boolean"/>
+	</reg32>
+	<array offset="0xae10" name="SP_PERFCTR_SP_SEL" stride="1" length="24"/>
+	<array offset="0xae60" name="SP_PERFCTR_HLSQ_SEL" stride="1" length="6" variants="A7XX-"/>
+	<reg32 offset="0xae6a" name="SP_UNKNOWN_AE6A" variants="A7XX-" usage="cmd"/>
+	<reg32 offset="0xae6b" name="SP_UNKNOWN_AE6B" variants="A7XX-" usage="cmd"/>
+	<reg32 offset="0xae6c" name="SP_UNKNOWN_AE6C" variants="A7XX-" usage="cmd"/>
+	<reg32 offset="0xae6d" name="SP_READ_SEL" variants="A7XX-">
+		<bitfield name="LOCATION" low="18" high="19" type="a7xx_state_location"/>
+		<bitfield name="PIPE" low="16" high="17" type="a7xx_pipe"/>
+		<bitfield name="STATETYPE" low="8" high="15" type="a7xx_statetype_id"/>
+		<bitfield name="USPTP" low="4" high="7"/>
+		<bitfield name="SPTP" low="0" high="3"/>
+	</reg32>
+	<reg32 offset="0xae71" name="SP_DBG_CNTL" variants="A7XX-"/>
+	<reg32 offset="0xae73" name="SP_UNKNOWN_AE73" variants="A7XX-" usage="cmd"/>
+	<array offset="0xae80" name="SP_PERFCTR_SP_SEL" stride="1" length="36" variants="A7XX-"/>
+	<!-- TODO: there are 4 more percntr select registers (0xae28-0xae2b) -->
+	<!-- TODO: there are a few unknown registers in the 0xae30-0xae52 range -->
+	<reg32 offset="0xbe22" name="SP_CONTEXT_SWITCH_GFX_PREEMPTION_SAFE_MODE"/>
+
+	<!--
+	The downstream kernel calls the debug cluster of registers
+	"a6xx_sp_ps_tp_cluster" but this actually specifies the border
+	color base for compute shaders.
+	-->
+	<reg64 offset="0xb180" name="SP_PS_TP_BORDER_COLOR_BASE_ADDR" type="address" align="128" usage="cmd"/>
+	<reg32 offset="0xb182" name="SP_UNKNOWN_B182" low="0" high="2" usage="cmd"/>
+	<reg32 offset="0xb183" name="SP_UNKNOWN_B183" low="0" high="23" usage="cmd"/>
+
+	<reg32 offset="0xb190" name="SP_UNKNOWN_B190"/>
+	<reg32 offset="0xb191" name="SP_UNKNOWN_B191"/>
+
+	<!-- could be all the stuff below here is actually TPL1?? -->
+
+	<reg32 offset="0xb300" name="SP_TP_RAS_MSAA_CNTL" usage="rp_blit">
+		<bitfield name="SAMPLES" low="0" high="1" type="a3xx_msaa_samples"/>
+		<bitfield name="UNK2" low="2" high="3"/>
+	</reg32>
+	<reg32 offset="0xb301" name="SP_TP_DEST_MSAA_CNTL" usage="rp_blit">
+		<bitfield name="SAMPLES" low="0" high="1" type="a3xx_msaa_samples"/>
+		<bitfield name="MSAA_DISABLE" pos="2" type="boolean"/>
+	</reg32>
+
+	<!-- looks to work in the same way as a5xx: -->
+	<reg64 offset="0xb302" name="SP_TP_BORDER_COLOR_BASE_ADDR" type="address" align="128" usage="cmd"/>
+	<reg32 offset="0xb304" name="SP_TP_SAMPLE_CONFIG" type="a6xx_sample_config" usage="rp_blit"/>
+	<reg32 offset="0xb305" name="SP_TP_SAMPLE_LOCATION_0" type="a6xx_sample_locations" usage="rp_blit"/>
+	<reg32 offset="0xb306" name="SP_TP_SAMPLE_LOCATION_1" type="a6xx_sample_locations" usage="rp_blit"/>
+	<reg32 offset="0xb307" name="SP_TP_WINDOW_OFFSET" type="a6xx_reg_xy" usage="rp_blit"/>
+	<reg32 offset="0xb309" name="SP_TP_MODE_CNTL" usage="cmd">
+		<bitfield name="ISAMMODE" low="0" high="1" type="a6xx_isam_mode"/>
+		<bitfield name="UNK3" low="2" high="7"/>
+	</reg32>
+	<reg32 offset="0xb310" name="SP_UNKNOWN_B310" variants="A7XX-" usage="cmd"/>
+
+	<!--
+	Equiv to corresponding RB_2D_SRC_* regs on a5xx.. which were either
+	badly named or the functionality moved in a6xx.  But downstream kernel
+	calls this "a6xx_sp_ps_tp_2d_cluster"
+	 -->
+	<reg32 offset="0xb4c0" name="SP_PS_2D_SRC_INFO" type="a6xx_2d_surf_info" variants="A6XX" usage="rp_blit"/>
+	<reg32 offset="0xb4c1" name="SP_PS_2D_SRC_SIZE" variants="A6XX" usage="rp_blit">
+		<bitfield name="WIDTH" low="0" high="14" type="uint"/>
+		<bitfield name="HEIGHT" low="15" high="29" type="uint"/>
+	</reg32>
+	<reg64 offset="0xb4c2" name="SP_PS_2D_SRC" type="address" align="16" variants="A6XX" usage="rp_blit"/>
+	<reg32 offset="0xb4c4" name="SP_PS_2D_SRC_PITCH" variants="A6XX" usage="rp_blit">
+		<bitfield name="UNK0" low="0" high="8"/>
+		<bitfield name="PITCH" low="9" high="23" shr="6" type="uint"/>
+	</reg32>
+
+	<reg32 offset="0xb2c0" name="SP_PS_2D_SRC_INFO" type="a6xx_2d_surf_info" variants="A7XX-" usage="rp_blit"/>
+	<reg32 offset="0xb2c1" name="SP_PS_2D_SRC_SIZE" variants="A7XX">
+		<bitfield name="WIDTH" low="0" high="14" type="uint"/>
+		<bitfield name="HEIGHT" low="15" high="29" type="uint"/>
+	</reg32>
+	<reg64 offset="0xb2c2" name="SP_PS_2D_SRC" type="address" align="16" variants="A7XX-" usage="rp_blit"/>
+	<reg32 offset="0xb2c4" name="SP_PS_2D_SRC_PITCH" variants="A7XX">
+		<bitfield name="UNK0" low="0" high="8"/>
+		<bitfield name="PITCH" low="9" high="23" shr="6" type="uint"/>
+	</reg32>
+
+	<!-- planes for NV12, etc. (TODO: not tested) -->
+	<reg64 offset="0xb4c5" name="SP_PS_2D_SRC_PLANE1" type="address" align="16" variants="A6XX"/>
+	<reg32 offset="0xb4c7" name="SP_PS_2D_SRC_PLANE_PITCH" low="0" high="11" shr="6" type="uint" variants="A6XX"/>
+	<reg64 offset="0xb4c8" name="SP_PS_2D_SRC_PLANE2" type="address" align="16" variants="A6XX"/>
+
+	<reg64 offset="0xb2c5" name="SP_PS_2D_SRC_PLANE1" type="address" align="16" variants="A7XX-"/>
+	<reg32 offset="0xb2c7" name="SP_PS_2D_SRC_PLANE_PITCH" low="0" high="11" shr="6" type="uint" variants="A7XX-"/>
+	<reg64 offset="0xb2c8" name="SP_PS_2D_SRC_PLANE2" type="address" align="16" variants="A7XX-"/>
+
+	<reg64 offset="0xb4ca" name="SP_PS_2D_SRC_FLAGS" type="address" align="16" variants="A6XX" usage="rp_blit"/>
+	<reg32 offset="0xb4cc" name="SP_PS_2D_SRC_FLAGS_PITCH" low="0" high="7" shr="6" type="uint" variants="A6XX" usage="rp_blit"/>
+
+	<reg64 offset="0xb2ca" name="SP_PS_2D_SRC_FLAGS" type="address" align="16" variants="A7XX-" usage="rp_blit"/>
+	<reg32 offset="0xb2cc" name="SP_PS_2D_SRC_FLAGS_PITCH" low="0" high="7" shr="6" type="uint" variants="A7XX-" usage="rp_blit"/>
+
+	<reg32 offset="0xb4cd" name="SP_PS_UNKNOWN_B4CD" low="6" high="31" variants="A6XX"/>
+	<reg32 offset="0xb4ce" name="SP_PS_UNKNOWN_B4CE" low="0" high="31" variants="A6XX"/>
+	<reg32 offset="0xb4cf" name="SP_PS_UNKNOWN_B4CF" low="0" high="30" variants="A6XX"/>
+	<reg32 offset="0xb4d0" name="SP_PS_UNKNOWN_B4D0" low="0" high="29" variants="A6XX"/>
+	<reg32 offset="0xb4d1" name="SP_WINDOW_OFFSET" type="a6xx_reg_xy" variants="A6XX" usage="rp_blit"/>
+
+	<reg32 offset="0xb2cd" name="SP_PS_UNKNOWN_B4CD" low="6" high="31" variants="A7XX"/>
+	<reg32 offset="0xb2ce" name="SP_PS_UNKNOWN_B4CE" low="0" high="31" variants="A7XX"/>
+	<reg32 offset="0xb2cf" name="SP_PS_UNKNOWN_B4CF" low="0" high="30" variants="A7XX"/>
+	<reg32 offset="0xb2d0" name="SP_PS_UNKNOWN_B4D0" low="0" high="29" variants="A7XX"/>
+	<reg32 offset="0xb2d1" name="SP_PS_2D_WINDOW_OFFSET" type="a6xx_reg_xy" variants="A7XX"/>
+	<reg32 offset="0xb2d2" name="SP_PS_UNKNOWN_B2D2" variants="A7XX-" usage="rp_blit"/>
+	<reg32 offset="0xab21" name="SP_WINDOW_OFFSET" type="a6xx_reg_xy" variants="A7XX-" usage="rp_blit"/>
+
+	<!-- always 0x100000 or 0x1000000? -->
+	<reg32 offset="0xb600" name="TPL1_DBG_ECO_CNTL" low="0" high="25" usage="cmd"/>
+	<reg32 offset="0xb601" name="TPL1_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
+	<reg32 offset="0xb602" name="TPL1_UNKNOWN_B602" low="0" high="7" type="uint" usage="cmd"/>
+	<reg32 offset="0xb604" name="TPL1_NC_MODE_CNTL">
+		<bitfield name="MODE" pos="0" type="boolean"/>
+		<bitfield name="LOWER_BIT" low="1" high="2" type="uint"/>
+		<bitfield name="MIN_ACCESS_LENGTH" pos="3" type="boolean"/> <!-- true=64b false=32b -->
+		<bitfield name="UPPER_BIT" pos="4" type="uint"/>
+		<bitfield name="UNK6" low="6" high="7"/>
+	</reg32>
+	<reg32 offset="0xb605" name="TPL1_UNKNOWN_B605" low="0" high="7" type="uint" variants="A6XX" usage="cmd"/> <!-- always 0x0 or 0x44 ? -->
+
+	<reg32 offset="0xb608" name="TPL1_BICUBIC_WEIGHTS_TABLE_0" low="0" high="29" variants="A6XX"/>
+	<reg32 offset="0xb609" name="TPL1_BICUBIC_WEIGHTS_TABLE_1" low="0" high="29" variants="A6XX"/>
+	<reg32 offset="0xb60a" name="TPL1_BICUBIC_WEIGHTS_TABLE_2" low="0" high="29" variants="A6XX"/>
+	<reg32 offset="0xb60b" name="TPL1_BICUBIC_WEIGHTS_TABLE_3" low="0" high="29" variants="A6XX"/>
+	<reg32 offset="0xb60c" name="TPL1_BICUBIC_WEIGHTS_TABLE_4" low="0" high="29" variants="A6XX"/>
+
+	<reg32 offset="0xb608" name="TPL1_BICUBIC_WEIGHTS_TABLE_0" low="0" high="29" variants="A7XX" usage="cmd"/>
+	<reg32 offset="0xb609" name="TPL1_BICUBIC_WEIGHTS_TABLE_1" low="0" high="29" variants="A7XX" usage="cmd"/>
+	<reg32 offset="0xb60a" name="TPL1_BICUBIC_WEIGHTS_TABLE_2" low="0" high="29" variants="A7XX" usage="cmd"/>
+	<reg32 offset="0xb60b" name="TPL1_BICUBIC_WEIGHTS_TABLE_3" low="0" high="29" variants="A7XX" usage="cmd"/>
+	<reg32 offset="0xb60c" name="TPL1_BICUBIC_WEIGHTS_TABLE_4" low="0" high="29" variants="A7XX" usage="cmd"/>
+
+	<array offset="0xb610" name="TPL1_PERFCTR_TP_SEL" stride="1" length="12"/>
+
+	<!-- TODO: 4 more perfcntr sel at 0xb620 ? -->
+
+	<bitset name="a6xx_hlsq_xs_cntl" inline="yes">
+		<bitfield name="CONSTLEN" low="0" high="7" shr="2" type="uint"/>
+		<bitfield name="ENABLED" pos="8" type="boolean"/>
+		<bitfield name="READ_IMM_SHARED_CONSTS" pos="9" type="boolean" variants="A7XX-"/>
+	</bitset>
+
+	<reg32 offset="0xb800" name="HLSQ_VS_CNTL" type="a6xx_hlsq_xs_cntl" variants="A6XX" usage="rp_blit"/>
+	<reg32 offset="0xb801" name="HLSQ_HS_CNTL" type="a6xx_hlsq_xs_cntl" variants="A6XX" usage="rp_blit"/>
+	<reg32 offset="0xb802" name="HLSQ_DS_CNTL" type="a6xx_hlsq_xs_cntl" variants="A6XX" usage="rp_blit"/>
+	<reg32 offset="0xb803" name="HLSQ_GS_CNTL" type="a6xx_hlsq_xs_cntl" variants="A6XX" usage="rp_blit"/>
+
+	<reg32 offset="0xa827" name="HLSQ_VS_CNTL" type="a6xx_hlsq_xs_cntl" variants="A7XX-" usage="rp_blit"/>
+	<reg32 offset="0xa83f" name="HLSQ_HS_CNTL" type="a6xx_hlsq_xs_cntl" variants="A7XX-" usage="rp_blit"/>
+	<reg32 offset="0xa867" name="HLSQ_DS_CNTL" type="a6xx_hlsq_xs_cntl" variants="A7XX-" usage="rp_blit"/>
+	<reg32 offset="0xa898" name="HLSQ_GS_CNTL" type="a6xx_hlsq_xs_cntl" variants="A7XX-" usage="rp_blit"/>
+
+	<reg32 offset="0xa9aa" name="HLSQ_FS_UNKNOWN_A9AA" variants="A7XX-" usage="rp_blit">
+		<!-- Tentatively named, appears to disable consts being loaded via CP_LOAD_STATE6_FRAG -->
+		<bitfield name="CONSTS_LOAD_DISABLE" pos="0" type="boolean"/>
+	</reg32>
+
+	<!-- Always 0 -->
+	<reg32 offset="0xa9ac" name="HLSQ_UNKNOWN_A9AC" variants="A7XX-" usage="cmd"/>
+
+	<!-- Used in VK_KHR_fragment_shading_rate -->
+	<reg32 offset="0xa9ad" name="HLSQ_UNKNOWN_A9AD" variants="A7XX-" usage="cmd"/>
+
+	<reg32 offset="0xa9ae" name="HLSQ_UNKNOWN_A9AE" variants="A7XX-" usage="rp_blit">
+		<bitfield name="SYSVAL_REGS_COUNT" low="0" high="7" type="uint"/>
+		<!-- UNK8 is set on a730/a740 -->
+		<bitfield name="UNK8" pos="8" type="boolean"/>
+		<!-- UNK9 is set on a750 -->
+		<bitfield name="UNK9" pos="9" type="boolean"/>
+	</reg32>
+
+	<reg32 offset="0xb820" name="HLSQ_LOAD_STATE_GEOM_CMD"/>
+	<reg64 offset="0xb821" name="HLSQ_LOAD_STATE_GEOM_EXT_SRC_ADDR" align="16" type="address"/>
+	<reg32 offset="0xb823" name="HLSQ_LOAD_STATE_GEOM_DATA"/>
+
+
+	<bitset name="a6xx_hlsq_fs_cntl_0" inline="yes">
+		<!-- must match SP_FS_CTRL -->
+		<bitfield name="THREADSIZE" pos="0" type="a6xx_threadsize"/>
+		<bitfield name="VARYINGS" pos="1" type="boolean"/>
+		<bitfield name="UNK2" low="2" high="11"/>
+	</bitset>
+	<bitset name="a6xx_hlsq_control_3_reg" inline="yes">
+		<!-- register loaded with position (bary.f) -->
+		<bitfield name="IJ_PERSP_PIXEL" low="0" high="7" type="a3xx_regid"/>
+		<bitfield name="IJ_LINEAR_PIXEL" low="8" high="15" type="a3xx_regid"/>
+		<bitfield name="IJ_PERSP_CENTROID" low="16" high="23" type="a3xx_regid"/>
+		<bitfield name="IJ_LINEAR_CENTROID" low="24" high="31" type="a3xx_regid"/>
+	</bitset>
+	<bitset name="a6xx_hlsq_control_4_reg" inline="yes">
+		<bitfield name="IJ_PERSP_SAMPLE" low="0" high="7" type="a3xx_regid"/>
+		<bitfield name="IJ_LINEAR_SAMPLE" low="8" high="15" type="a3xx_regid"/>
+		<bitfield name="XYCOORDREGID" low="16" high="23" type="a3xx_regid"/>
+		<bitfield name="ZWCOORDREGID" low="24" high="31" type="a3xx_regid"/>
+	</bitset>
+	<bitset name="a6xx_hlsq_control_5_reg" inline="yes">
+		<bitfield name="LINELENGTHREGID" low="0" high="7" type="a3xx_regid"/>
+		<bitfield name="FOVEATIONQUALITYREGID" low="8" high="15" type="a3xx_regid"/>
+	</bitset>
+
+	<reg32 offset="0xb980" type="a6xx_hlsq_fs_cntl_0" name="HLSQ_FS_CNTL_0" variants="A6XX" usage="rp_blit"/>
+	<reg32 offset="0xb981" name="HLSQ_UNKNOWN_B981" pos="0" type="boolean" variants="A6XX"/> <!-- never used by blob -->
+	<reg32 offset="0xb982" name="HLSQ_CONTROL_1_REG" low="0" high="2" variants="A6XX" usage="rp_blit">
+		<!-- Sets the maximum number of primitives allowed in one FS wave minus one, similarly to the
+				 A3xx field, except that it's not necessary to set it to anything but the maximum, since
+				 the hardware will simply emit smaller waves when it runs out of space.	-->
+		<bitfield name="PRIMALLOCTHRESHOLD" low="0" high="2" type="uint"/>
+	</reg32>
+	<reg32 offset="0xb983" name="HLSQ_CONTROL_2_REG" variants="A6XX" usage="rp_blit">
+		<bitfield name="FACEREGID" low="0" high="7" type="a3xx_regid"/>
+		<!-- SAMPLEID is loaded into a half-precision register: -->
+		<bitfield name="SAMPLEID" low="8" high="15" type="a3xx_regid"/>
+		<bitfield name="SAMPLEMASK" low="16" high="23" type="a3xx_regid"/>
+		<bitfield name="CENTERRHW" low="24" high="31" type="a3xx_regid"/>
+	</reg32>
+	<reg32 offset="0xb984" type="a6xx_hlsq_control_3_reg" name="HLSQ_CONTROL_3_REG" variants="A6XX" usage="rp_blit"/>
+	<reg32 offset="0xb985" type="a6xx_hlsq_control_4_reg" name="HLSQ_CONTROL_4_REG" variants="A6XX" usage="rp_blit"/>
+	<reg32 offset="0xb986" type="a6xx_hlsq_control_5_reg" name="HLSQ_CONTROL_5_REG" variants="A6XX" usage="rp_blit"/>
+	<reg32 offset="0xb987" name="HLSQ_CS_CNTL" type="a6xx_hlsq_xs_cntl" variants="A6XX" usage="cmd"/>
+	<reg32 offset="0xa9c6" type="a6xx_hlsq_fs_cntl_0" name="HLSQ_FS_CNTL_0" variants="A7XX-" usage="rp_blit"/>
+	<reg32 offset="0xa9c7" name="HLSQ_CONTROL_1_REG" low="0" high="2" variants="A7XX-" usage="rp_blit">
+			<bitfield name="PRIMALLOCTHRESHOLD" low="0" high="2" type="uint"/>
+	</reg32>
+	<reg32 offset="0xa9c8" name="HLSQ_CONTROL_2_REG" variants="A7XX-" usage="rp_blit">
+		<bitfield name="FACEREGID" low="0" high="7" type="a3xx_regid"/>
+		<!-- SAMPLEID is loaded into a half-precision register: -->
+		<bitfield name="SAMPLEID" low="8" high="15" type="a3xx_regid"/>
+		<bitfield name="SAMPLEMASK" low="16" high="23" type="a3xx_regid"/>
+		<bitfield name="CENTERRHW" low="24" high="31" type="a3xx_regid"/>
+	</reg32>
+	<reg32 offset="0xa9c9" type="a6xx_hlsq_control_3_reg" name="HLSQ_CONTROL_3_REG" variants="A7XX-" usage="rp_blit"/>
+	<reg32 offset="0xa9ca" type="a6xx_hlsq_control_4_reg" name="HLSQ_CONTROL_4_REG" variants="A7XX-" usage="rp_blit"/>
+	<reg32 offset="0xa9cb" type="a6xx_hlsq_control_5_reg" name="HLSQ_CONTROL_5_REG" variants="A7XX-" usage="rp_blit"/>
+	<reg32 offset="0xa9cd" name="HLSQ_CS_CNTL" type="a6xx_hlsq_xs_cntl" variants="A7XX-" usage="cmd"/>
+
+	<!-- TODO: what does KERNELDIM do exactly (blob sets it differently from turnip) -->
+	<reg32 offset="0xb990" name="HLSQ_CS_NDRANGE_0" variants="A6XX" usage="rp_blit">
+		<bitfield name="KERNELDIM" low="0" high="1" type="uint"/>
+		<!-- localsize is value minus one: -->
+		<bitfield name="LOCALSIZEX" low="2" high="11" type="uint"/>
+		<bitfield name="LOCALSIZEY" low="12" high="21" type="uint"/>
+		<bitfield name="LOCALSIZEZ" low="22" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0xb991" name="HLSQ_CS_NDRANGE_1" variants="A6XX" usage="rp_blit">
+		<bitfield name="GLOBALSIZE_X" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0xb992" name="HLSQ_CS_NDRANGE_2" variants="A6XX" usage="rp_blit">
+		<bitfield name="GLOBALOFF_X" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0xb993" name="HLSQ_CS_NDRANGE_3" variants="A6XX" usage="rp_blit">
+		<bitfield name="GLOBALSIZE_Y" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0xb994" name="HLSQ_CS_NDRANGE_4" variants="A6XX" usage="rp_blit">
+		<bitfield name="GLOBALOFF_Y" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0xb995" name="HLSQ_CS_NDRANGE_5" variants="A6XX" usage="rp_blit">
+		<bitfield name="GLOBALSIZE_Z" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0xb996" name="HLSQ_CS_NDRANGE_6" variants="A6XX" usage="rp_blit">
+		<bitfield name="GLOBALOFF_Z" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0xb997" name="HLSQ_CS_CNTL_0" variants="A6XX" usage="rp_blit">
+		<!-- these are all vec3. first 3 need to be high regs
+		     WGSIZECONSTID is the local size (from HLSQ_CS_NDRANGE_0)
+		     WGOFFSETCONSTID is WGIDCONSTID*WGSIZECONSTID
+		-->
+		<bitfield name="WGIDCONSTID" low="0" high="7" type="a3xx_regid"/>
+		<bitfield name="WGSIZECONSTID" low="8" high="15" type="a3xx_regid"/>
+		<bitfield name="WGOFFSETCONSTID" low="16" high="23" type="a3xx_regid"/>
+		<bitfield name="LOCALIDREGID" low="24" high="31" type="a3xx_regid"/>
+	</reg32>
+	<reg32 offset="0xb998" name="HLSQ_CS_CNTL_1" variants="A6XX" usage="rp_blit">
+		<!-- gl_LocalInvocationIndex -->
+		<bitfield name="LINEARLOCALIDREGID" low="0" high="7" type="a3xx_regid"/>
+		<!-- a650 has 6 "SP cores" (but 3 "SP"). this makes it use only
+		     one of those 6 "SP cores" -->
+		<bitfield name="SINGLE_SP_CORE" pos="8" type="boolean"/>
+		<!-- Must match SP_CS_CTRL -->
+		<bitfield name="THREADSIZE" pos="9" type="a6xx_threadsize"/>
+		<!-- 1 thread per wave (ignored if bit9 set) -->
+		<bitfield name="THREADSIZE_SCALAR" pos="10" type="boolean"/>
+	</reg32>
+	<!--note: vulkan blob doesn't use these -->
+	<reg32 offset="0xb999" name="HLSQ_CS_KERNEL_GROUP_X" variants="A6XX" usage="rp_blit"/>
+	<reg32 offset="0xb99a" name="HLSQ_CS_KERNEL_GROUP_Y" variants="A6XX" usage="rp_blit"/>
+	<reg32 offset="0xb99b" name="HLSQ_CS_KERNEL_GROUP_Z" variants="A6XX" usage="rp_blit"/>
+
+	<!-- TODO: what does KERNELDIM do exactly (blob sets it differently from turnip) -->
+	<reg32 offset="0xa9d4" name="HLSQ_CS_NDRANGE_0" variants="A7XX-" usage="rp_blit">
+		<bitfield name="KERNELDIM" low="0" high="1" type="uint"/>
+		<!-- localsize is value minus one: -->
+		<bitfield name="LOCALSIZEX" low="2" high="11" type="uint"/>
+		<bitfield name="LOCALSIZEY" low="12" high="21" type="uint"/>
+		<bitfield name="LOCALSIZEZ" low="22" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0xa9d5" name="HLSQ_CS_NDRANGE_1" variants="A7XX-" usage="rp_blit">
+		<bitfield name="GLOBALSIZE_X" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0xa9d6" name="HLSQ_CS_NDRANGE_2" variants="A7XX-" usage="rp_blit">
+		<bitfield name="GLOBALOFF_X" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0xa9d7" name="HLSQ_CS_NDRANGE_3" variants="A7XX-" usage="rp_blit">
+		<bitfield name="GLOBALSIZE_Y" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0xa9d8" name="HLSQ_CS_NDRANGE_4" variants="A7XX-" usage="rp_blit">
+		<bitfield name="GLOBALOFF_Y" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0xa9d9" name="HLSQ_CS_NDRANGE_5" variants="A7XX-" usage="rp_blit">
+		<bitfield name="GLOBALSIZE_Z" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0xa9da" name="HLSQ_CS_NDRANGE_6" variants="A7XX-" usage="rp_blit">
+		<bitfield name="GLOBALOFF_Z" low="0" high="31" type="uint"/>
+	</reg32>
+	<!--note: vulkan blob doesn't use these -->
+	<reg32 offset="0xa9dc" name="HLSQ_CS_KERNEL_GROUP_X" variants="A7XX-" usage="rp_blit"/>
+	<reg32 offset="0xa9dd" name="HLSQ_CS_KERNEL_GROUP_Y" variants="A7XX-" usage="rp_blit"/>
+	<reg32 offset="0xa9de" name="HLSQ_CS_KERNEL_GROUP_Z" variants="A7XX-" usage="rp_blit"/>
+
+	<enum name="a7xx_cs_yalign">
+		<value name="CS_YALIGN_1" value="8"/>
+		<value name="CS_YALIGN_2" value="4"/>
+		<value name="CS_YALIGN_4" value="2"/>
+		<value name="CS_YALIGN_8" value="1"/>
+	</enum>
+
+	<reg32 offset="0xa9db" name="HLSQ_CS_CNTL_1" variants="A7XX-" usage="rp_blit">
+		<!-- gl_LocalInvocationIndex -->
+		<bitfield name="LINEARLOCALIDREGID" low="0" high="7" type="a3xx_regid"/>
+		<!-- Must match SP_CS_CTRL -->
+		<bitfield name="THREADSIZE" pos="9" type="a6xx_threadsize"/>
+		<bitfield name="UNK11" pos="11" type="boolean"/>
+		<bitfield name="UNK22" pos="22" type="boolean"/>
+		<bitfield name="UNK26" pos="26" type="boolean"/>
+		<bitfield name="YALIGN" low="27" high="30" type="a7xx_cs_yalign"/>
+	</reg32>
+
+	<reg32 offset="0xa9df" name="HLSQ_CS_LOCAL_SIZE" variants="A7XX-" usage="cmd">
+		<!-- localsize is value minus one: -->
+		<bitfield name="LOCALSIZEX" low="2" high="11" type="uint"/>
+		<bitfield name="LOCALSIZEY" low="12" high="21" type="uint"/>
+		<bitfield name="LOCALSIZEZ" low="22" high="31" type="uint"/>
+	</reg32>
+
+	<reg32 offset="0xb9a0" name="HLSQ_LOAD_STATE_FRAG_CMD"/>
+	<reg64 offset="0xb9a1" name="HLSQ_LOAD_STATE_FRAG_EXT_SRC_ADDR" align="16" type="address"/>
+	<reg32 offset="0xb9a3" name="HLSQ_LOAD_STATE_FRAG_DATA"/>
+
+	<!-- mirror of SP_CS_BINDLESS_BASE -->
+	<array offset="0xb9c0" name="HLSQ_CS_BINDLESS_BASE" stride="2" length="5" variants="A6XX" usage="rp_blit">
+		<reg64 offset="0" name="DESCRIPTOR">
+			<bitfield name="DESC_SIZE" low="0" high="1" type="a6xx_bindless_descriptor_size"/>
+			<bitfield name="ADDR" low="2" high="63" shr="2" type="address"/>
+		</reg64>
+	</array>
+
+	<!-- new in a6xx gen4, mirror of SP_CS_UNKNOWN_A9B1? -->
+	<reg32 offset="0xb9d0" name="HLSQ_CS_UNKNOWN_B9D0" variants="A6XX" usage="cmd">
+		<bitfield name="SHARED_SIZE" low="0" high="4" type="uint"/>
+		<bitfield name="UNK5" pos="5" type="boolean"/>
+		<!-- always 1 ? -->
+		<bitfield name="UNK6" pos="6" type="boolean"/>
+	</reg32>
+
+	<reg32 offset="0xbb00" name="HLSQ_DRAW_CMD">
+		<bitfield name="STATE_ID" low="0" high="7"/>
+	</reg32>
+
+	<reg32 offset="0xbb01" name="HLSQ_DISPATCH_CMD">
+		<bitfield name="STATE_ID" low="0" high="7"/>
+	</reg32>
+
+	<reg32 offset="0xbb02" name="HLSQ_EVENT_CMD">
+		<!-- I think only the low bit is actually used? -->
+		<bitfield name="STATE_ID" low="16" high="23"/>
+		<bitfield name="EVENT" low="0" high="6" type="vgt_event_type"/>
+	</reg32>
+
+	<reg32 offset="0xbb08" name="HLSQ_INVALIDATE_CMD" variants="A6XX" usage="cmd">
+		<doc>
+			This register clears pending loads queued up by
+			CP_LOAD_STATE6. Each bit resets a particular kind(s) of
+			CP_LOAD_STATE6.
+		</doc>
+
+		<!-- per-stage state: shader, non-bindless UBO, textures, and samplers -->
+		<bitfield name="VS_STATE" pos="0" type="boolean"/>
+		<bitfield name="HS_STATE" pos="1" type="boolean"/>
+		<bitfield name="DS_STATE" pos="2" type="boolean"/>
+		<bitfield name="GS_STATE" pos="3" type="boolean"/>
+		<bitfield name="FS_STATE" pos="4" type="boolean"/>
+		<bitfield name="CS_STATE" pos="5" type="boolean"/>
+
+		<bitfield name="CS_IBO" pos="6" type="boolean"/>
+		<bitfield name="GFX_IBO" pos="7" type="boolean"/>
+
+		<!-- Note: these only do something when HLSQ_SHARED_CONSTS is set to 1 -->
+		<bitfield name="CS_SHARED_CONST" pos="19" type="boolean"/>
+		<bitfield name="GFX_SHARED_CONST" pos="8" type="boolean"/>
+
+		<!-- SS6_BINDLESS: one bit per bindless base -->
+		<bitfield name="CS_BINDLESS" low="9" high="13" type="hex"/>
+		<bitfield name="GFX_BINDLESS" low="14" high="18" type="hex"/>
+	</reg32>
+
+	<reg32 offset="0xab1f" name="HLSQ_INVALIDATE_CMD" variants="A7XX-" usage="cmd">
+		<doc>
+			This register clears pending loads queued up by
+			CP_LOAD_STATE6. Each bit resets a particular kind(s) of
+			CP_LOAD_STATE6.
+		</doc>
+
+		<!-- per-stage state: shader, non-bindless UBO, textures, and samplers -->
+		<bitfield name="VS_STATE" pos="0" type="boolean"/>
+		<bitfield name="HS_STATE" pos="1" type="boolean"/>
+		<bitfield name="DS_STATE" pos="2" type="boolean"/>
+		<bitfield name="GS_STATE" pos="3" type="boolean"/>
+		<bitfield name="FS_STATE" pos="4" type="boolean"/>
+		<bitfield name="CS_STATE" pos="5" type="boolean"/>
+
+		<bitfield name="CS_IBO" pos="6" type="boolean"/>
+		<bitfield name="GFX_IBO" pos="7" type="boolean"/>
+
+		<!-- SS6_BINDLESS: one bit per bindless base -->
+		<bitfield name="CS_BINDLESS" low="9" high="16" type="hex"/>
+		<bitfield name="GFX_BINDLESS" low="17" high="24" type="hex"/>
+	</reg32>
+
+	<reg32 offset="0xbb10" name="HLSQ_FS_CNTL" type="a6xx_hlsq_xs_cntl" variants="A6XX" usage="rp_blit"/>
+	<reg32 offset="0xab03" name="HLSQ_FS_CNTL" type="a6xx_hlsq_xs_cntl" variants="A7XX-" usage="rp_blit"/>
+
+	<array offset="0xab40" name="HLSQ_SHARED_CONSTS_IMM" stride="1" length="64" variants="A7XX-"/>
+
+	<reg32 offset="0xbb11" name="HLSQ_SHARED_CONSTS" variants="A6XX" usage="cmd">
+		<doc>
+			Shared constants are intended to be used for Vulkan push
+			constants. When enabled, 8 vec4's are reserved in the FS
+			const pool and 16 in the geometry const pool although
+			only 8 are actually used (why?) and they are mapped to
+			c504-c511 in each stage. Both VS and FS shared consts
+			are written using ST6_CONSTANTS/SB6_IBO, so that both
+			the geometry and FS shared consts can be written at once
+			by using CP_LOAD_STATE6 rather than
+			CP_LOAD_STATE6_FRAG/CP_LOAD_STATE6_GEOM. In addition
+			DST_OFF and NUM_UNIT are in units of dwords instead of
+			vec4's.
+
+			There is also a separate shared constant pool for CS,
+			which is loaded through CP_LOAD_STATE6_FRAG with
+			ST6_UBO/ST6_IBO. However the only real difference for CS
+			is the dword units.
+		</doc>
+		<bitfield name="ENABLE" pos="0" type="boolean"/>
+	</reg32>
+
+	<!-- mirror of SP_BINDLESS_BASE -->
+	<array offset="0xbb20" name="HLSQ_BINDLESS_BASE" stride="2" length="5" variants="A6XX" usage="cmd">
+		<reg64 offset="0" name="DESCRIPTOR">
+			<bitfield name="DESC_SIZE" low="0" high="1" type="a6xx_bindless_descriptor_size"/>
+			<bitfield name="ADDR" low="2" high="63" shr="2" type="address"/>
+		</reg64>
+	</array>
+
+	<reg32 offset="0xbd80" name="HLSQ_2D_EVENT_CMD">
+		<bitfield name="STATE_ID" low="8" high="15"/>
+		<bitfield name="EVENT" low="0" high="6" type="vgt_event_type"/>
+	</reg32>
+
+	<reg32 offset="0xbe00" name="HLSQ_UNKNOWN_BE00" variants="A6XX" usage="cmd"/> <!-- all bits valid except bit 29 -->
+	<reg32 offset="0xbe01" name="HLSQ_UNKNOWN_BE01" low="4" high="6" variants="A6XX" usage="cmd"/>
+	<reg32 offset="0xbe04" name="HLSQ_DBG_ECO_CNTL" variants="A6XX" usage="cmd"/>
+	<reg32 offset="0xbe05" name="HLSQ_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
+	<reg32 offset="0xbe08" name="HLSQ_UNKNOWN_BE08" low="0" high="15"/>
+	<array offset="0xbe10" name="HLSQ_PERFCTR_HLSQ_SEL" stride="1" length="6"/>
+
+	<!-- TODO: some valid registers between 0xbe20 and 0xbe33 -->
+	<reg32 offset="0xbe22" name="HLSQ_CONTEXT_SWITCH_GFX_PREEMPTION_SAFE_MODE"/>
+
+	<reg32 offset="0xc000" name="SP_AHB_READ_APERTURE" variants="A7XX-"/>
+
+	<!-- Don't know if these are SP, always 0 -->
+	<reg64 offset="0x0ce2" name="SP_UNKNOWN_0CE2" variants="A7XX-" usage="cmd"/>
+	<reg64 offset="0x0ce4" name="SP_UNKNOWN_0CE4" variants="A7XX-" usage="cmd"/>
+	<reg64 offset="0x0ce6" name="SP_UNKNOWN_0CE6" variants="A7XX-" usage="cmd"/>
+
+	<!--
+		These special registers signal the beginning/end of an event
+		sequence. The sequence used internally for an event looks like:
+		- write EVENT_CMD pipe register
+		- write CP_EVENT_START
+		- write HLSQ_EVENT_CMD with event or HLSQ_DRAW_CMD
+		- write PC_EVENT_CMD with event or PC_DRAW_CMD
+		- write HLSQ_EVENT_CMD(CONTEXT_DONE)
+		- write PC_EVENT_CMD(CONTEXT_DONE)
+		- write CP_EVENT_END
+		Writing to CP_EVENT_END seems to actually trigger the context roll
+	-->
+	<reg32 offset="0xd600" name="CP_EVENT_START">
+		<bitfield name="STATE_ID" low="0" high="7"/>
+	</reg32>
+	<reg32 offset="0xd601" name="CP_EVENT_END">
+		<bitfield name="STATE_ID" low="0" high="7"/>
+	</reg32>
+	<reg32 offset="0xd700" name="CP_2D_EVENT_START">
+		<bitfield name="STATE_ID" low="0" high="7"/>
+	</reg32>
+	<reg32 offset="0xd701" name="CP_2D_EVENT_END">
+		<bitfield name="STATE_ID" low="0" high="7"/>
+	</reg32>
+</domain>
+
+<!-- Seems basically the same as a5xx, maybe move to common.xml.. -->
+<domain name="A6XX_TEX_SAMP" width="32">
+	<doc>Texture sampler dwords</doc>
+	<enum name="a6xx_tex_filter"> <!-- same as a4xx? -->
+		<value name="A6XX_TEX_NEAREST" value="0"/>
+		<value name="A6XX_TEX_LINEAR" value="1"/>
+		<value name="A6XX_TEX_ANISO" value="2"/>
+		<value name="A6XX_TEX_CUBIC" value="3"/> <!-- a650 only -->
+	</enum>
+	<enum name="a6xx_tex_clamp"> <!-- same as a4xx? -->
+		<value name="A6XX_TEX_REPEAT" value="0"/>
+		<value name="A6XX_TEX_CLAMP_TO_EDGE" value="1"/>
+		<value name="A6XX_TEX_MIRROR_REPEAT" value="2"/>
+		<value name="A6XX_TEX_CLAMP_TO_BORDER" value="3"/>
+		<value name="A6XX_TEX_MIRROR_CLAMP" value="4"/>
+	</enum>
+	<enum name="a6xx_tex_aniso"> <!-- same as a4xx? -->
+		<value name="A6XX_TEX_ANISO_1" value="0"/>
+		<value name="A6XX_TEX_ANISO_2" value="1"/>
+		<value name="A6XX_TEX_ANISO_4" value="2"/>
+		<value name="A6XX_TEX_ANISO_8" value="3"/>
+		<value name="A6XX_TEX_ANISO_16" value="4"/>
+	</enum>
+	<enum name="a6xx_reduction_mode">
+		<value name="A6XX_REDUCTION_MODE_AVERAGE" value="0"/>
+		<value name="A6XX_REDUCTION_MODE_MIN" value="1"/>
+		<value name="A6XX_REDUCTION_MODE_MAX" value="2"/>
+	</enum>
+
+	<reg32 offset="0" name="0">
+		<bitfield name="MIPFILTER_LINEAR_NEAR" pos="0" type="boolean"/>
+		<bitfield name="XY_MAG" low="1" high="2" type="a6xx_tex_filter"/>
+		<bitfield name="XY_MIN" low="3" high="4" type="a6xx_tex_filter"/>
+		<bitfield name="WRAP_S" low="5" high="7" type="a6xx_tex_clamp"/>
+		<bitfield name="WRAP_T" low="8" high="10" type="a6xx_tex_clamp"/>
+		<bitfield name="WRAP_R" low="11" high="13" type="a6xx_tex_clamp"/>
+		<bitfield name="ANISO" low="14" high="16" type="a6xx_tex_aniso"/>
+		<bitfield name="LOD_BIAS" low="19" high="31" type="fixed" radix="8"/><!-- no idea how many bits for real -->
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="CLAMPENABLE" pos="0" type="boolean">
+			<doc>
+				clamp result to [0, 1] if the format is unorm or
+				[-1, 1] if the format is snorm, *after*
+				filtering. Has no effect for other formats.
+			</doc>
+		</bitfield>
+		<bitfield name="COMPARE_FUNC" low="1" high="3" type="adreno_compare_func"/>
+		<bitfield name="CUBEMAPSEAMLESSFILTOFF" pos="4" type="boolean"/>
+		<bitfield name="UNNORM_COORDS" pos="5" type="boolean"/>
+		<bitfield name="MIPFILTER_LINEAR_FAR" pos="6" type="boolean"/>
+		<bitfield name="MAX_LOD" low="8" high="19" type="ufixed" radix="8"/>
+		<bitfield name="MIN_LOD" low="20" high="31" type="ufixed" radix="8"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<bitfield name="REDUCTION_MODE" low="0" high="1" type="a6xx_reduction_mode"/>
+		<bitfield name="CHROMA_LINEAR" pos="5" type="boolean"/>
+		<bitfield name="BCOLOR" low="7" high="31"/>
+	</reg32>
+	<reg32 offset="3" name="3"/>
+</domain>
+
+<domain name="A6XX_TEX_CONST" width="32">
+	<doc>Texture constant dwords</doc>
+	<enum name="a6xx_tex_swiz"> <!-- same as a4xx? -->
+		<value name="A6XX_TEX_X" value="0"/>
+		<value name="A6XX_TEX_Y" value="1"/>
+		<value name="A6XX_TEX_Z" value="2"/>
+		<value name="A6XX_TEX_W" value="3"/>
+		<value name="A6XX_TEX_ZERO" value="4"/>
+		<value name="A6XX_TEX_ONE" value="5"/>
+	</enum>
+	<enum name="a6xx_tex_type"> <!-- same as a4xx? -->
+		<value name="A6XX_TEX_1D" value="0"/>
+		<value name="A6XX_TEX_2D" value="1"/>
+		<value name="A6XX_TEX_CUBE" value="2"/>
+		<value name="A6XX_TEX_3D" value="3"/>
+		<value name="A6XX_TEX_BUFFER" value="4"/>
+	</enum>
+	<reg32 offset="0" name="0">
+		<bitfield name="TILE_MODE" low="0" high="1" type="a6xx_tile_mode"/>
+		<bitfield name="SRGB" pos="2" type="boolean"/>
+		<bitfield name="SWIZ_X" low="4" high="6" type="a6xx_tex_swiz"/>
+		<bitfield name="SWIZ_Y" low="7" high="9" type="a6xx_tex_swiz"/>
+		<bitfield name="SWIZ_Z" low="10" high="12" type="a6xx_tex_swiz"/>
+		<bitfield name="SWIZ_W" low="13" high="15" type="a6xx_tex_swiz"/>
+		<bitfield name="MIPLVLS" low="16" high="19" type="uint"/>
+		<!-- overlaps with MIPLVLS -->
+		<bitfield name="CHROMA_MIDPOINT_X" pos="16" type="boolean"/>
+		<bitfield name="CHROMA_MIDPOINT_Y" pos="18" type="boolean"/>
+		<bitfield name="SAMPLES" low="20" high="21" type="a3xx_msaa_samples"/>
+		<bitfield name="FMT" low="22" high="29" type="a6xx_format"/>
+		<!--
+			Why is the swap needed in addition to SWIZ_*? The swap
+			is performed before border color replacement, while the
+			swizzle is applied after after it.
+		-->
+		<bitfield name="SWAP" low="30" high="31" type="a3xx_color_swap"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="WIDTH" low="0" high="14" type="uint"/>
+		<bitfield name="HEIGHT" low="15" high="29" type="uint"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<!--
+			These fields overlap PITCH, and are used instead of
+			PITCH/PITCHALIGN when TYPE is A6XX_TEX_BUFFER.
+		 -->
+		<doc> probably for D3D structured UAVs, normally set to 1 </doc>
+		<bitfield name="STRUCTSIZETEXELS" low="4" high="15" type="uint"/>
+		<bitfield name="STARTOFFSETTEXELS" low="16" high="21" type="uint"/>
+
+		<!-- minimum pitch (for mipmap levels): log2(pitchalign / 64) -->
+		<bitfield name="PITCHALIGN" low="0" high="3" type="uint"/>
+		<doc>Pitch in bytes (so actually stride)</doc>
+		<bitfield name="PITCH" low="7" high="28" type="uint"/>
+		<bitfield name="TYPE" low="29" high="31" type="a6xx_tex_type"/>
+	</reg32>
+	<reg32 offset="3" name="3">
+		<!--
+		ARRAY_PITCH is basically LAYERSZ for the first mipmap level, and
+		for 3d textures (laid out mipmap level first) MIN_LAYERSZ is the
+		layer size at the point that it stops being reduced moving to
+		higher (smaller) mipmap levels
+		 -->
+		<bitfield name="ARRAY_PITCH" low="0" high="22" shr="12" type="uint"/>
+		<bitfield name="MIN_LAYERSZ" low="23" high="26" shr="12"/>
+		<!--
+		by default levels with w < 16 are linear
+		TILE_ALL makes all levels have tiling
+		seems required when using UBWC, since all levels have UBWC (can possibly be disabled?)
+		 -->
+		<bitfield name="TILE_ALL" pos="27" type="boolean"/>
+		<bitfield name="FLAG" pos="28" type="boolean"/>
+	</reg32>
+	<!-- for 2-3 plane format, BASE is flag buffer address (if enabled)
+	     the address of the non-flag base buffer is determined automatically,
+	     and must follow the flag buffer
+	 -->
+	<reg32 offset="4" name="4">
+		<bitfield name="BASE_LO" low="5" high="31" shr="5"/>
+	</reg32>
+	<reg32 offset="5" name="5">
+		<bitfield name="BASE_HI" low="0" high="16"/>
+		<bitfield name="DEPTH" low="17" high="29" type="uint"/>
+	</reg32>
+	<reg32 offset="6" name="6">
+		<!-- overlaps with PLANE_PITCH -->
+		<bitfield name="MIN_LOD_CLAMP" low="0" high="11" type="ufixed" radix="8"/>
+		<!-- pitch for plane 2 / plane 3 -->
+		<bitfield name="PLANE_PITCH" low="8" high="31" type="uint"/>
+	</reg32>
+	<!-- 7/8 is plane 2 address for planar formats -->
+	<reg32 offset="7" name="7">
+		<bitfield name="FLAG_LO" low="5" high="31" shr="5"/>
+	</reg32>
+	<reg32 offset="8" name="8">
+		<bitfield name="FLAG_HI" low="0" high="16"/>
+	</reg32>
+	<!-- 9/10 is plane 3 address for planar formats -->
+	<reg32 offset="9" name="9">
+		<bitfield name="FLAG_BUFFER_ARRAY_PITCH" low="0" high="16" shr="4" type="uint"/>
+	</reg32>
+	<reg32 offset="10" name="10">
+		<bitfield name="FLAG_BUFFER_PITCH" low="0" high="6" shr="6" type="uint"/>
+		<!-- log2 size of the first level, required for mipmapping -->
+		<bitfield name="FLAG_BUFFER_LOGW" low="8" high="11" type="uint"/>
+		<bitfield name="FLAG_BUFFER_LOGH" low="12" high="15" type="uint"/>
+	</reg32>
+	<reg32 offset="11" name="11"/>
+	<reg32 offset="12" name="12"/>
+	<reg32 offset="13" name="13"/>
+	<reg32 offset="14" name="14"/>
+	<reg32 offset="15" name="15"/>
+</domain>
+
+<domain name="A6XX_UBO" width="32">
+	<reg32 offset="0" name="0">
+		<bitfield name="BASE_LO" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="BASE_HI" low="0" high="16"/>
+		<bitfield name="SIZE" low="17" high="31"/> <!-- size in vec4 (4xDWORD) units -->
+	</reg32>
+</domain>
+
+<domain name="A6XX_PDC" width="32">
+	<reg32 offset="0x1140" name="GPU_ENABLE_PDC"/>
+	<reg32 offset="0x1148" name="GPU_SEQ_START_ADDR"/>
+	<reg32 offset="0x1540" name="GPU_TCS0_CONTROL"/>
+	<reg32 offset="0x1541" name="GPU_TCS0_CMD_ENABLE_BANK"/>
+	<reg32 offset="0x1542" name="GPU_TCS0_CMD_WAIT_FOR_CMPL_BANK"/>
+	<reg32 offset="0x1543" name="GPU_TCS0_CMD0_MSGID"/>
+	<reg32 offset="0x1544" name="GPU_TCS0_CMD0_ADDR"/>
+	<reg32 offset="0x1545" name="GPU_TCS0_CMD0_DATA"/>
+	<reg32 offset="0x1572" name="GPU_TCS1_CONTROL"/>
+	<reg32 offset="0x1573" name="GPU_TCS1_CMD_ENABLE_BANK"/>
+	<reg32 offset="0x1574" name="GPU_TCS1_CMD_WAIT_FOR_CMPL_BANK"/>
+	<reg32 offset="0x1575" name="GPU_TCS1_CMD0_MSGID"/>
+	<reg32 offset="0x1576" name="GPU_TCS1_CMD0_ADDR"/>
+	<reg32 offset="0x1577" name="GPU_TCS1_CMD0_DATA"/>
+	<reg32 offset="0x15A4" name="GPU_TCS2_CONTROL"/>
+	<reg32 offset="0x15A5" name="GPU_TCS2_CMD_ENABLE_BANK"/>
+	<reg32 offset="0x15A6" name="GPU_TCS2_CMD_WAIT_FOR_CMPL_BANK"/>
+	<reg32 offset="0x15A7" name="GPU_TCS2_CMD0_MSGID"/>
+	<reg32 offset="0x15A8" name="GPU_TCS2_CMD0_ADDR"/>
+	<reg32 offset="0x15A9" name="GPU_TCS2_CMD0_DATA"/>
+	<reg32 offset="0x15D6" name="GPU_TCS3_CONTROL"/>
+	<reg32 offset="0x15D7" name="GPU_TCS3_CMD_ENABLE_BANK"/>
+	<reg32 offset="0x15D8" name="GPU_TCS3_CMD_WAIT_FOR_CMPL_BANK"/>
+	<reg32 offset="0x15D9" name="GPU_TCS3_CMD0_MSGID"/>
+	<reg32 offset="0x15DA" name="GPU_TCS3_CMD0_ADDR"/>
+	<reg32 offset="0x15DB" name="GPU_TCS3_CMD0_DATA"/>
+</domain>
+
+<domain name="A6XX_PDC_GPU_SEQ" width="32">
+	<reg32 offset="0x0" name="MEM_0"/>
+</domain>
+
+<domain name="A6XX_CX_DBGC" width="32">
+	<reg32 offset="0x0000" name="CFG_DBGBUS_SEL_A">
+		<bitfield high="7" low="0" name="PING_INDEX"/>
+		<bitfield high="15" low="8" name="PING_BLK_SEL"/>
+	</reg32>
+	<reg32 offset="0x0001" name="CFG_DBGBUS_SEL_B"/>
+	<reg32 offset="0x0002" name="CFG_DBGBUS_SEL_C"/>
+	<reg32 offset="0x0003" name="CFG_DBGBUS_SEL_D"/>
+	<reg32 offset="0x0004" name="CFG_DBGBUS_CNTLT">
+		<bitfield high="5" low="0" name="TRACEEN"/>
+		<bitfield high="14" low="12" name="GRANU"/>
+		<bitfield high="31" low="28" name="SEGT"/>
+	</reg32>
+	<reg32 offset="0x0005" name="CFG_DBGBUS_CNTLM">
+		<bitfield high="27" low="24" name="ENABLE"/>
+	</reg32>
+	<reg32 offset="0x0008" name="CFG_DBGBUS_IVTL_0"/>
+	<reg32 offset="0x0009" name="CFG_DBGBUS_IVTL_1"/>
+	<reg32 offset="0x000a" name="CFG_DBGBUS_IVTL_2"/>
+	<reg32 offset="0x000b" name="CFG_DBGBUS_IVTL_3"/>
+	<reg32 offset="0x000c" name="CFG_DBGBUS_MASKL_0"/>
+	<reg32 offset="0x000d" name="CFG_DBGBUS_MASKL_1"/>
+	<reg32 offset="0x000e" name="CFG_DBGBUS_MASKL_2"/>
+	<reg32 offset="0x000f" name="CFG_DBGBUS_MASKL_3"/>
+	<reg32 offset="0x0010" name="CFG_DBGBUS_BYTEL_0">
+		<bitfield high="3" low="0" name="BYTEL0"/>
+		<bitfield high="7" low="4" name="BYTEL1"/>
+		<bitfield high="11" low="8" name="BYTEL2"/>
+		<bitfield high="15" low="12" name="BYTEL3"/>
+		<bitfield high="19" low="16" name="BYTEL4"/>
+		<bitfield high="23" low="20" name="BYTEL5"/>
+		<bitfield high="27" low="24" name="BYTEL6"/>
+		<bitfield high="31" low="28" name="BYTEL7"/>
+	</reg32>
+	<reg32 offset="0x0011" name="CFG_DBGBUS_BYTEL_1">
+		<bitfield high="3" low="0" name="BYTEL8"/>
+		<bitfield high="7" low="4" name="BYTEL9"/>
+		<bitfield high="11" low="8" name="BYTEL10"/>
+		<bitfield high="15" low="12" name="BYTEL11"/>
+		<bitfield high="19" low="16" name="BYTEL12"/>
+		<bitfield high="23" low="20" name="BYTEL13"/>
+		<bitfield high="27" low="24" name="BYTEL14"/>
+		<bitfield high="31" low="28" name="BYTEL15"/>
+	</reg32>
+
+	<reg32 offset="0x002f" name="CFG_DBGBUS_TRACE_BUF1"/>
+	<reg32 offset="0x0030" name="CFG_DBGBUS_TRACE_BUF2"/>
+</domain>
+
+<domain name="A6XX_CX_MISC" width="32" prefix="variant" varset="chip">
+	<reg32 offset="0x0001" name="SYSTEM_CACHE_CNTL_0"/>
+	<reg32 offset="0x0002" name="SYSTEM_CACHE_CNTL_1"/>
+	<reg32 offset="0x0039" name="CX_MISC_TCM_RET_CNTL" variants="A7XX-"/>
+</domain>
+
+</database>
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
new file mode 100644
index 000000000000..6531749d30f4
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
@@ -0,0 +1,228 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<database xmlns="http://nouveau.freedesktop.org/"
+xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
+xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
+<import file="freedreno_copyright.xml"/>
+<import file="adreno/adreno_common.xml"/>
+
+<domain name="A6XX" width="32" prefix="variant" varset="chip">
+
+	<bitset name="A6XX_GMU_GPU_IDLE_STATUS">
+		<bitfield name="BUSY_IGN_AHB" pos="23"/>
+		<bitfield name="CX_GX_CPU_BUSY_IGN_AHB" pos="30"/>
+	</bitset>
+
+	<bitset name="A6XX_GMU_OOB">
+		<bitfield name="BOOT_SLUMBER_SET_MASK" pos="22"/>
+		<bitfield name="BOOT_SLUMBER_CHECK_MASK" pos="30"/>
+		<bitfield name="BOOT_SLUMBER_CLEAR_MASK" pos="30"/>
+		<bitfield name="DCVS_SET_MASK" pos="23"/>
+		<bitfield name="DCVS_CHECK_MASK" pos="31"/>
+		<bitfield name="DCVS_CLEAR_MASK" pos="31"/>
+		<bitfield name="GPU_SET_MASK" pos="18"/>
+		<bitfield name="GPU_CHECK_MASK" pos="26"/>
+		<bitfield name="GPU_CLEAR_MASK" pos="26"/>
+		<bitfield name="PERFCNTR_SET_MASK" pos="17"/>
+		<bitfield name="PERFCNTR_CHECK_MASK" pos="25"/>
+		<bitfield name="PERFCNTR_CLEAR_MASK" pos="25"/>
+	</bitset>
+
+	<bitset name="A6XX_HFI_IRQ">
+		<bitfield name="MSGQ_MASK" pos="0" />
+		<bitfield name="DSGQ_MASK" pos="1"/>
+		<bitfield name="BLOCKED_MSG_MASK" pos="2"/>
+		<bitfield name="CM3_FAULT_MASK" pos="23"/>
+		<bitfield name="GMU_ERR_MASK" low="16" high="22"/>
+		<bitfield name="OOB_MASK" low="24" high="31"/>
+	</bitset>
+
+	<bitset name="A6XX_HFI_H2F">
+		<bitfield name="IRQ_MASK_BIT" pos="0" />
+	</bitset>
+
+	<reg32 offset="0x80" name="GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL"/>
+	<reg32 offset="0x81" name="GMU_GX_SPTPRAC_POWER_CONTROL"/>
+	<reg32 offset="0xc00" name="GMU_CM3_ITCM_START"/>
+	<reg32 offset="0x1c00" name="GMU_CM3_DTCM_START"/>
+	<reg32 offset="0x23f0" name="GMU_NMI_CONTROL_STATUS"/>
+	<reg32 offset="0x23f8" name="GMU_BOOT_SLUMBER_OPTION"/>
+	<reg32 offset="0x23f9" name="GMU_GX_VOTE_IDX"/>
+	<reg32 offset="0x23fa" name="GMU_MX_VOTE_IDX"/>
+	<reg32 offset="0x23fc" name="GMU_DCVS_ACK_OPTION"/>
+	<reg32 offset="0x23fd" name="GMU_DCVS_PERF_SETTING"/>
+	<reg32 offset="0x23fe" name="GMU_DCVS_BW_SETTING"/>
+	<reg32 offset="0x23ff" name="GMU_DCVS_RETURN"/>
+	<reg32 offset="0x4c00" name="GMU_ICACHE_CONFIG"/>
+	<reg32 offset="0x4c01" name="GMU_DCACHE_CONFIG"/>
+	<reg32 offset="0x4c0f" name="GMU_SYS_BUS_CONFIG"/>
+	<reg32 offset="0x5000" name="GMU_CM3_SYSRESET"/>
+	<reg32 offset="0x5001" name="GMU_CM3_BOOT_CONFIG"/>
+	<reg32 offset="0x501a" name="GMU_CM3_FW_BUSY"/>
+	<reg32 offset="0x501c" name="GMU_CM3_FW_INIT_RESULT"/>
+	<reg32 offset="0x502d" name="GMU_CM3_CFG"/>
+	<reg32 offset="0x5040" name="GMU_CX_GMU_POWER_COUNTER_ENABLE"/>
+	<reg32 offset="0x5041" name="GMU_CX_GMU_POWER_COUNTER_SELECT_0"/>
+	<reg32 offset="0x5042" name="GMU_CX_GMU_POWER_COUNTER_SELECT_1"/>
+	<reg32 offset="0x5044" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_0_L"/>
+	<reg32 offset="0x5045" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_0_H"/>
+	<reg32 offset="0x5046" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_1_L"/>
+	<reg32 offset="0x5047" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_1_H"/>
+	<reg32 offset="0x5048" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_2_L"/>
+	<reg32 offset="0x5049" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_2_H"/>
+	<reg32 offset="0x504a" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_3_L"/>
+	<reg32 offset="0x504b" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_3_H"/>
+	<reg32 offset="0x504c" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_4_L"/>
+	<reg32 offset="0x504d" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_4_H"/>
+	<reg32 offset="0x504e" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_5_L"/>
+	<reg32 offset="0x504f" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_5_H"/>
+	<reg32 offset="0x50c0" name="GMU_PWR_COL_INTER_FRAME_CTRL">
+		<bitfield name="IFPC_ENABLE" pos="0" type="boolean"/>
+		<bitfield name="HM_POWER_COLLAPSE_ENABLE" pos="1" type="boolean"/>
+		<bitfield name="SPTPRAC_POWER_CONTROL_ENABLE" pos="2" type="boolean"/>
+		<bitfield name="NUM_PASS_SKIPS" low="10" high="13"/>
+		<bitfield name="MIN_PASS_LENGTH" low="14" high="31"/>
+	</reg32>
+	<reg32 offset="0x50c1" name="GMU_PWR_COL_INTER_FRAME_HYST"/>
+	<reg32 offset="0x50c2" name="GMU_PWR_COL_SPTPRAC_HYST"/>
+	<reg32 offset="0x50d0" name="GMU_SPTPRAC_PWR_CLK_STATUS">
+		<bitfield name="SPTPRAC_GDSC_POWERING_OFF" pos="0" type="boolean"/>
+		<bitfield name="SPTPRAC_GDSC_POWERING_ON" pos="1" type="boolean"/>
+		<bitfield name="SPTPRAC_GDSC_POWER_OFF" pos="2" type="boolean"/>
+		<bitfield name="SPTPRAC_GDSC_POWER_ON" pos="3" type="boolean"/>
+		<bitfield name="SP_CLOCK_OFF" pos="4" type="boolean"/>
+		<bitfield name="GMU_UP_POWER_STATE" pos="5" type="boolean"/>
+		<bitfield name="GX_HM_GDSC_POWER_OFF" pos="6" type="boolean"/>
+		<bitfield name="GX_HM_CLK_OFF" pos="7" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x50e4" name="GMU_GPU_NAP_CTRL">
+		<bitfield name="HW_NAP_ENABLE" pos="0"/>
+		<bitfield name="SID" low="4" high="8"/>
+	</reg32>
+	<reg32 offset="0x50e8" name="GMU_RPMH_CTRL">
+		<bitfield name="RPMH_INTERFACE_ENABLE" pos="0" type="boolean"/>
+		<bitfield name="LLC_VOTE_ENABLE" pos="4" type="boolean"/>
+		<bitfield name="DDR_VOTE_ENABLE" pos="8" type="boolean"/>
+		<bitfield name="MX_VOTE_ENABLE" pos="9" type="boolean"/>
+		<bitfield name="CX_VOTE_ENABLE" pos="10" type="boolean"/>
+		<bitfield name="GFX_VOTE_ENABLE" pos="11" type="boolean"/>
+		<bitfield name="DDR_MIN_VOTE_ENABLE" pos="12" type="boolean"/>
+		<bitfield name="MX_MIN_VOTE_ENABLE" pos="13" type="boolean"/>
+		<bitfield name="CX_MIN_VOTE_ENABLE" pos="14" type="boolean"/>
+		<bitfield name="GFX_MIN_VOTE_ENABLE" pos="15" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x50e9" name="GMU_RPMH_HYST_CTRL"/>
+	<reg32 offset="0x50ec" name="GPU_GMU_CX_GMU_RPMH_POWER_STATE"/>
+	<reg32 offset="0x50f0" name="GPU_GMU_CX_GMU_CX_FAL_INTF"/>
+	<reg32 offset="0x50f1" name="GPU_GMU_CX_GMU_CX_FALNEXT_INTF"/>
+	<reg32 offset="0x5100" name="GPU_GMU_CX_GMU_PWR_COL_CP_MSG"/>
+	<reg32 offset="0x5101" name="GPU_GMU_CX_GMU_PWR_COL_CP_RESP"/>
+	<reg32 offset="0x51f0" name="GMU_BOOT_KMD_LM_HANDSHAKE"/>
+	<reg32 offset="0x5157" name="GMU_LLM_GLM_SLEEP_CTRL"/>
+	<reg32 offset="0x5158" name="GMU_LLM_GLM_SLEEP_STATUS"/>
+	<reg32 offset="0x5088" name="GMU_ALWAYS_ON_COUNTER_L"/>
+	<reg32 offset="0x5089" name="GMU_ALWAYS_ON_COUNTER_H"/>
+	<reg32 offset="0x50c3" name="GMU_GMU_PWR_COL_KEEPALIVE"/>
+	<reg32 offset="0x5180" name="GMU_HFI_CTRL_STATUS"/>
+	<reg32 offset="0x5181" name="GMU_HFI_VERSION_INFO"/>
+	<reg32 offset="0x5182" name="GMU_HFI_SFR_ADDR"/>
+	<reg32 offset="0x5183" name="GMU_HFI_MMAP_ADDR"/>
+	<reg32 offset="0x5184" name="GMU_HFI_QTBL_INFO"/>
+	<reg32 offset="0x5185" name="GMU_HFI_QTBL_ADDR"/>
+	<reg32 offset="0x5186" name="GMU_HFI_CTRL_INIT"/>
+	<reg32 offset="0x5190" name="GMU_GMU2HOST_INTR_SET"/>
+	<reg32 offset="0x5191" name="GMU_GMU2HOST_INTR_CLR"/>
+	<reg32 offset="0x5192" name="GMU_GMU2HOST_INTR_INFO">
+		<bitfield name="MSGQ" pos="0" type="boolean"/>
+		<bitfield name="CM3_FAULT" pos="23" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x5193" name="GMU_GMU2HOST_INTR_MASK"/>
+	<reg32 offset="0x5194" name="GMU_HOST2GMU_INTR_SET"/>
+	<reg32 offset="0x5195" name="GMU_HOST2GMU_INTR_CLR"/>
+	<reg32 offset="0x5196" name="GMU_HOST2GMU_INTR_RAW_INFO"/>
+	<reg32 offset="0x5197" name="GMU_HOST2GMU_INTR_EN_0"/>
+	<reg32 offset="0x5198" name="GMU_HOST2GMU_INTR_EN_1"/>
+	<reg32 offset="0x5199" name="GMU_HOST2GMU_INTR_EN_2"/>
+	<reg32 offset="0x519a" name="GMU_HOST2GMU_INTR_EN_3"/>
+	<reg32 offset="0x519b" name="GMU_HOST2GMU_INTR_INFO_0"/>
+	<reg32 offset="0x519c" name="GMU_HOST2GMU_INTR_INFO_1"/>
+	<reg32 offset="0x519d" name="GMU_HOST2GMU_INTR_INFO_2"/>
+	<reg32 offset="0x519e" name="GMU_HOST2GMU_INTR_INFO_3"/>
+	<reg32 offset="0x51c5" name="GMU_GENERAL_0"/>
+	<reg32 offset="0x51c6" name="GMU_GENERAL_1"/>
+	<reg32 offset="0x51cb" name="GMU_GENERAL_6"/>
+	<reg32 offset="0x51cc" name="GMU_GENERAL_7"/>
+	<reg32 offset="0x51cd" name="GMU_GENERAL_8" variants="A7XX"/>
+	<reg32 offset="0x51ce" name="GMU_GENERAL_9" variants="A7XX"/>
+	<reg32 offset="0x51cf" name="GMU_GENERAL_10" variants="A7XX"/>
+	<reg32 offset="0x515d" name="GMU_ISENSE_CTRL"/>
+	<reg32 offset="0x8920" name="GPU_CS_ENABLE_REG"/>
+	<reg32 offset="0x515d" name="GPU_GMU_CX_GMU_ISENSE_CTRL"/>
+	<reg32 offset="0x8578" name="GPU_CS_AMP_CALIBRATION_CONTROL3"/>
+	<reg32 offset="0x8558" name="GPU_CS_AMP_CALIBRATION_CONTROL2"/>
+	<reg32 offset="0x8580" name="GPU_CS_A_SENSOR_CTRL_0"/>
+	<reg32 offset="0x27ada" name="GPU_CS_A_SENSOR_CTRL_2"/>
+	<reg32 offset="0x881a" name="GPU_CS_SENSOR_GENERAL_STATUS"/>
+	<reg32 offset="0x8957" name="GPU_CS_AMP_CALIBRATION_CONTROL1"/>
+	<reg32 offset="0x881a" name="GPU_CS_SENSOR_GENERAL_STATUS"/>
+	<reg32 offset="0x881d" name="GPU_CS_AMP_CALIBRATION_STATUS1_0"/>
+	<reg32 offset="0x881f" name="GPU_CS_AMP_CALIBRATION_STATUS1_2"/>
+	<reg32 offset="0x8821" name="GPU_CS_AMP_CALIBRATION_STATUS1_4"/>
+	<reg32 offset="0x8965" name="GPU_CS_AMP_CALIBRATION_DONE"/>
+	<reg32 offset="0x896d" name="GPU_CS_AMP_PERIOD_CTRL"/>
+	<reg32 offset="0x8965" name="GPU_CS_AMP_CALIBRATION_DONE"/>
+	<reg32 offset="0x514d" name="GPU_GMU_CX_GMU_PWR_THRESHOLD"/>
+	<reg32 offset="0x9303" name="GMU_AO_INTERRUPT_EN"/>
+	<reg32 offset="0x9304" name="GMU_AO_HOST_INTERRUPT_CLR"/>
+	<reg32 offset="0x9305" name="GMU_AO_HOST_INTERRUPT_STATUS">
+		<bitfield name="WDOG_BITE" pos="0" type="boolean"/>
+		<bitfield name="RSCC_COMP" pos="1" type="boolean"/>
+		<bitfield name="VDROOP" pos="2" type="boolean"/>
+		<bitfield name="FENCE_ERR" pos="3" type="boolean"/>
+		<bitfield name="DBD_WAKEUP" pos="4" type="boolean"/>
+		<bitfield name="HOST_AHB_BUS_ERROR" pos="5" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x9306" name="GMU_AO_HOST_INTERRUPT_MASK"/>
+	<reg32 offset="0x9309" name="GPU_GMU_AO_GMU_CGC_MODE_CNTL"/>
+	<reg32 offset="0x930a" name="GPU_GMU_AO_GMU_CGC_DELAY_CNTL"/>
+	<reg32 offset="0x930b" name="GPU_GMU_AO_GMU_CGC_HYST_CNTL"/>
+	<reg32 offset="0x930c" name="GPU_GMU_AO_GPU_CX_BUSY_STATUS">
+		<bitfield name = "GPUBUSYIGNAHB" pos="23" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x930d" name="GPU_GMU_AO_GPU_CX_BUSY_STATUS2"/>
+	<reg32 offset="0x930e" name="GPU_GMU_AO_GPU_CX_BUSY_MASK"/>
+	<reg32 offset="0x9310" name="GMU_AO_AHB_FENCE_CTRL"/>
+	<reg32 offset="0x9313" name="GMU_AHB_FENCE_STATUS"/>
+	<reg32 offset="0x9314" name="GMU_AHB_FENCE_STATUS_CLR"/>
+	<reg32 offset="0x9315" name="GMU_RBBM_INT_UNMASKED_STATUS"/>
+	<reg32 offset="0x9316" name="GMU_AO_SPARE_CNTL"/>
+	<reg32 offset="0x9307" name="GMU_RSCC_CONTROL_REQ"/>
+	<reg32 offset="0x9308" name="GMU_RSCC_CONTROL_ACK"/>
+	<reg32 offset="0x9311" name="GMU_AHB_FENCE_RANGE_0"/>
+	<reg32 offset="0x9312" name="GMU_AHB_FENCE_RANGE_1"/>
+	<reg32 offset="0x9c03" name="GPU_CC_GX_GDSCR"/>
+	<reg32 offset="0x9d42" name="GPU_CC_GX_DOMAIN_MISC"/>
+	<reg32 offset="0xc001" name="GPU_CPR_FSM_CTL"/>
+
+	<!-- starts at offset 0x8c00 on most gpus -->
+	<reg32 offset="0x0004" name="GPU_RSCC_RSC_STATUS0_DRV0"/>
+	<reg32 offset="0x0008" name="RSCC_PDC_SEQ_START_ADDR"/>
+	<reg32 offset="0x0009" name="RSCC_PDC_MATCH_VALUE_LO"/>
+	<reg32 offset="0x000a" name="RSCC_PDC_MATCH_VALUE_HI"/>
+	<reg32 offset="0x000b" name="RSCC_PDC_SLAVE_ID_DRV0"/>
+	<reg32 offset="0x000d" name="RSCC_HIDDEN_TCS_CMD0_ADDR"/>
+	<reg32 offset="0x000e" name="RSCC_HIDDEN_TCS_CMD0_DATA"/>
+	<reg32 offset="0x0082" name="RSCC_TIMESTAMP_UNIT0_TIMESTAMP_L_DRV0"/>
+	<reg32 offset="0x0083" name="RSCC_TIMESTAMP_UNIT0_TIMESTAMP_H_DRV0"/>
+	<reg32 offset="0x0089" name="RSCC_TIMESTAMP_UNIT1_EN_DRV0"/>
+	<reg32 offset="0x008c" name="RSCC_TIMESTAMP_UNIT1_OUTPUT_DRV0"/>
+	<reg32 offset="0x0100" name="RSCC_OVERRIDE_START_ADDR"/>
+	<reg32 offset="0x0101" name="RSCC_SEQ_BUSY_DRV0"/>
+	<reg32 offset="0x0154" name="RSCC_SEQ_MEM_0_DRV0_A740" variants="A7XX"/>
+	<reg32 offset="0x0180" name="RSCC_SEQ_MEM_0_DRV0"/>
+	<reg32 offset="0x0346" name="RSCC_TCS0_DRV0_STATUS"/>
+	<reg32 offset="0x03ee" name="RSCC_TCS1_DRV0_STATUS"/>
+	<reg32 offset="0x0496" name="RSCC_TCS2_DRV0_STATUS"/>
+	<reg32 offset="0x053e" name="RSCC_TCS3_DRV0_STATUS"/>
+</domain>
+
+</database>

-- 
2.39.2


