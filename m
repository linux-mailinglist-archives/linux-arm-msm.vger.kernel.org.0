Return-Path: <linux-arm-msm+bounces-69345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 026B5B27CDC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 11:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64452B02CAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 09:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06BD2E9EB4;
	Fri, 15 Aug 2025 09:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="srnib/1B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80992E5421
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 09:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755248988; cv=none; b=tsUQHx9PX86sUBrnEVmzxBG+NC2usNpCDTLBfWcwHLMXG5ZOeDLLgsYwGwl5bBKU84BaXAsvGO5C/H/k7vk4UnW5YKYxR+FjQLU16zNE843kAiAPznTF/PIra/GZqy01cB1aut879KVFvYtqalqZZ7x7eX3jW1lzK89VbjEc4Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755248988; c=relaxed/simple;
	bh=d+pkakvHisIo5B7fnb5foS5HS7QjQMAp1P2iWKiGNdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=guSICP3XuWqwq7iEzhPHWGwW5zh4YHj1h5huaVVul88TZAEhy4HbhD98kI44FxX8wDioMABbiJ/ucHeNsRm0hdqLzC4jEHIstMrvPMmYH43rvjTa7gjJGc8O4Z5GDee/3yq9rguooCTaP9ErP9uspYvhwd+TOmWGZiWCeXJZh0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=srnib/1B; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b9a342e8ffso1267810f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 02:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248978; x=1755853778; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JThKrLTPuFVwzCwJhKd4fJmIEtCxHnGrNzSYzGU4KrU=;
        b=srnib/1BvaF0uy9WI33yxEDKIJJFMWHr9tgtrIPbDT1vBDXkcc9M58SZUb26xkCrWG
         RGLa8Kztd6pywSqq93ZPZYCfpPHBAkdm0EbZm4Pj1esgHm7AnRSaaqS4ItkgjVvFGPA1
         al8sAec0qOOzIyuI2ppGIMISxLpx1WEuWa8MgbtWTMn0Gv+Mcf6hAUNkw3nPu29Cit8r
         DaYSwtgb6rEvH3DGsb97F2Z4EVhyoIXnhBfwA14kuXSofxVzrkn/USVEyl0KyqVOC3ay
         4PKjgh1/QK2lokqU4yPBo7GOASab3yLvwliAyosVH9nBX1GZ97O0rvdP2ayGNb6aHI+H
         dMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248978; x=1755853778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JThKrLTPuFVwzCwJhKd4fJmIEtCxHnGrNzSYzGU4KrU=;
        b=MjOjXGtqzTBV7rgPWC8zTF7z0jGov3q0k/mH55iFyfk5vmg4o6xpD4c+kguNzEoV2/
         xkE8aFAlFdpyH4RuHRyOpK7ElTEmfbjiL9A79wNWREoJ6PD73L3/nqWOvmm7jsZNHyPd
         4iSEBnMcHS88XSXtfc4U2xX8ZR/m6/Mi6SCwOXbHijyvwdSY5AMUmBXp7+5tuqZFqb0g
         wUhTO/lKWsDjiZq7bwNr+VWJ0WAFijkBPk9TAepImZXnPLdjelqEqfLQ74oithWRfpxU
         /poAnAXeQKJ42e3VsCwrtaz0ujCvp+AMSbY5j4q2WitbP6vtp5Y8OWALQTEEHRwJsl4I
         4r1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4B2i5/gdF9sa2A2BLZtIFQt2OS4g3tuLt+LhFzegR/3ZPwVvtlV3eHxeH9S6uJUXoutB1L1y44dFB00Ho@vger.kernel.org
X-Gm-Message-State: AOJu0YzBNFcIXlzRSbC0u1Nk0724FkOfnT3K/6vZAhVMJHi0f1Oc+kFt
	DnbgXqYXgUr1oNZ5pUmq/XCbbeJxpfqyCBlQrkjJ73Qqcy8+AqivY/kKvVV5+AOqyE8=
X-Gm-Gg: ASbGncuvx7o2HoSZh+xY6AFhuptjpMszgNtAS3rg3lPTgXekEgXQBcbmvBa0RvWyT9I
	vLF71OC4bNJUjj4iQtPLYCCCecdlFgU52bbyt1xb/HeGjGcpc+/T3KqtmgWioK3DiOvkYjmWcLn
	bENVN4POh9rwyE7yvv4XHv/ex6EOxj9+D1dZVIwcq57M+ciEbbYlfv6pB1LOqnxvGtdVDWe80x5
	9iHj09DAy21co86+S2pWaJiKI3s/d+cfCvAYIfiEAE9/638I3tS/teYFjJlpcBgsivMx7KylRK0
	oQivC1CoflQG9W/odx4cLE8AWTWr8/B3wVU6sb0p1AwhaxZGCjixscLh2CaLXPSU9oWyQxDGdAW
	OAPRe6TG1UO7Nw+Phrg==
X-Google-Smtp-Source: AGHT+IG6tpzUVovgoQkKFLGI9UZEr33h0FppCamYKXGjED9LEMcOygc6BNR53lxBsyNw3EXRvTetsA==
X-Received: by 2002:a05:6000:4007:b0:3b7:8071:f902 with SMTP id ffacd0b85a97d-3bb4c5b80bcmr1159773f8f.13.1755248978027;
        Fri, 15 Aug 2025 02:09:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9a67sm1205210f8f.35.2025.08.15.02.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:09:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 11:09:15 +0200
Subject: [PATCH v5 13/15] pinctrl: qcom: add infrastructure for marking pin
 functions as GPIOs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-pinctrl-gpio-pinfuncs-v5-13-955de9fd91db@linaro.org>
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
In-Reply-To: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
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
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=1TtCXH0c1SnNyHC+v6gZsytFHMfkLN/q6H3Fm9nBNlI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvk5msNNj4Ca68fb7+G6bZ73KBx3fzutVpC0Z
 9VENfY/MhyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ75OQAKCRARpy6gFHHX
 cqCREAC7WpcFRL2Sb/Hk+HNXVI+dbXjLvxVLapxOlsBcpesaDrR/NahYb6p/G62D/kWHKA2KVii
 lU/tMlPBnJHukaRydH6794HwaY5/+/S9wFa5rDdnOyj2dBp6a9S3jbED/+o43IIUf+rOrPuqibD
 NVr66kEWQYaOLX/t81nHetyX+Dd+P/d++xBXan8oWhwtXd9zHLda05S+jw/RrBxcx3fSK6UTtD7
 dNW9MUo9bAY1tlkU51qsjDfW+eRq5dAzdNdeURgAreCH162KFT+bIIAZQtswc6RS1AsC5M1kj6o
 S9cX5AF5K0XMaIorq5coITsfpWq/OxWi4L4P1TMTB6ctqiL01wOF/z3BSefdpr0MjAr5GsnAf/y
 LqKsz5hniCLTvZjgU1Ayvwq8usXkT8xaUY2zb9GfGdgGgmBRJSoleQR4XHmpHYNi5542R1lj46O
 y4qPwttgalxFYhy/FBpTsvlflTrGhicrlq+7hSDpjlvSXR6CYWn1w7gkVRb1cuHFR+Xj0BNYXvG
 A4i7Og4mKksF2x88F+5NOrW5SRklexTs4SBPGNo8Rz5cp+tYslwZmceoum3xCfLAbf0CVyMRym/
 +eQd0GP5pUkNj2Jtjub8fvLlUFd542dMVBls5yK0Vw2zFC/nKbLCz36IRltDZCXJlsYgs5j0tVX
 dAwrcGCy/BjpcWA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a helper macro that wraps PINCTRL_GPIO_PINFUNCTION() for pinctrl-msm
pin functions and assign the .function_is_gpio() callback in pinmux_ops.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
 drivers/pinctrl/qcom/pinctrl-msm.h | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 96e40c2342bdedb8857629e503897f171a80e579..a5f69464827119dfe2a7781b558094b283fca215 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -265,6 +265,7 @@ static const struct pinmux_ops msm_pinmux_ops = {
 	.get_functions_count	= pinmux_generic_get_function_count,
 	.get_function_name	= pinmux_generic_get_function_name,
 	.get_function_groups	= pinmux_generic_get_function_groups,
+	.function_is_gpio	= pinmux_generic_function_is_gpio,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
 };
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index d7dc0947bb161868c8f433dc2536719b8afc8bd8..4625fa5320a95a4d24e3a0c98a249e4f163dd4c7 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -29,6 +29,11 @@ struct pinctrl_pin_desc;
 					fname##_groups,		\
 					ARRAY_SIZE(fname##_groups))
 
+#define MSM_GPIO_PIN_FUNCTION(fname)				\
+	[msm_mux_##fname] = PINCTRL_GPIO_PINFUNCTION(#fname,	\
+					fname##_groups,		\
+					ARRAY_SIZE(fname##_groups))
+
 #define QCA_PIN_FUNCTION(fname)					\
 	[qca_mux_##fname] = PINCTRL_PINFUNCTION(#fname,		\
 					fname##_groups,		\

-- 
2.48.1


