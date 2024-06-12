Return-Path: <linux-arm-msm+bounces-22474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 491AB90587A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 18:20:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F4761C2222D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 16:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4914181BA1;
	Wed, 12 Jun 2024 16:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LpUh/aEU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B8F18754B
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 16:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718208972; cv=none; b=UIKyBQ8bbovXJBP+S7iW2zS0NveTtjtQozeWF40Mvcan38dEHdOjSS3SHBE4rmyQi8jia2N7Eldinr8RMFklEOg0vGAVGkGqGRV02mfPKDXxNheUmEaRZFg9EZ1pS3jLZkU0cgAVApsPd6+sPTRhH+gqXRSoeS6FYuZsYVOeWwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718208972; c=relaxed/simple;
	bh=j1T2EZc5hy8lhjfjDFFJirW2r0PITpoz1SZidS75cJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mgp3dGW7Y0ZQTzwV31fvPMEPsvr9Z1GYlIOZhJtDMhYn6BhuxXSSXyJF+VKlOWUIS7eOaMpg7wGboluBkV27K0a+i/DQT4SwYL9D4VWJSrJ2yKiBVb54LM3aF5/wi76L3SCHsBQ5EMN7SJXnBnmvwRYrviGIqFo/ykGssMTP2Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LpUh/aEU; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52bc27cfb14so105096e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 09:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208968; x=1718813768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rn1wCxSzpGhMj3lz649lAS7ysUYN5adwkzVT1CE950E=;
        b=LpUh/aEU8FQl5jTNjMJrSoRSItfZesqTfByPVkyUzD/NdQzGfrZtRD/WNl/CFPCiYe
         DD0HWqhsoopU4AeyBiH540moIW35nqSDzNKYIcy8rCPRMmgEYMJfsTWYh3T2sEkg45tv
         koTFdk/0kVmXUy/Qw0blNbIPKgD/HNvVwnCH/PvmbLM9yN4NnsCOw1mqWvvWvxGRCZNw
         5EiEngJw7xR3n8X3xz9UWNozW1zHnJVEf6ZxzsNwWmOA5jnNOMYCg5lkUAA3TMl+yuPG
         1DW4laReXzU3RqlgAQ79hZhJidNDQN3xVMNiWaFG6cxs7gHE/uS6dYF234GsUgmIYUN4
         f8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208968; x=1718813768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rn1wCxSzpGhMj3lz649lAS7ysUYN5adwkzVT1CE950E=;
        b=SeyuIuBT/SlwE5Ph/k8/5QwgeO5wih0SQ3KnRcb7MLrc8oPVGhZbKenrIU+0JcEXgI
         aLXtopSs2Mew2Hxe83Ze4dtehDfFo00WiPSRLbuP/wPuIHXTS0D6lsZ55Qk5l+KLw0R5
         M3WCcxXNy9zQ6ovYFpPyulYleRUtU8w4Ogu7mhhaN378/9eZN0lrEeI3g7GKzFYAqlY7
         prh8bRyNITIxBQwebOG50EQb77Jho6lLKP7lkStFPGRMfeWzas1gxUv/B9vP4s0g7mDY
         kvgooijeF0VwwaHznXqbnkkfxuQQk5oCyHZyGuc92hWU84OlJFNK88AGjwXml897kgBE
         t4yg==
X-Forwarded-Encrypted: i=1; AJvYcCVwe50eq5vjtmnR8U4sTQIma7kS7T+d9zo1JNN1rBidWupZpbZizBNWZrf8QiERavX4sSyjCXy9wNXXtfiUoVaNvU8kZ0IXh2QOT6ZssQ==
X-Gm-Message-State: AOJu0YxO7NKxsNPOJa4xU6GG+bexwpHw//P6h4veYhqGTkMvaRSqVm93
	l6MSj41z0Md4erp8tNxM8RDLh8BosUVMGMaEgS9C5UsFLxyKE1y3he6vYngsdVA=
X-Google-Smtp-Source: AGHT+IGF8tDc6fkHQhj8N0hBjM0u1nGROYuT7Ky5zocWTWK4ZZ4FhkHBtm3BgA4jMGwDrmWzo/tEWw==
X-Received: by 2002:a05:6512:3045:b0:52c:8909:bd35 with SMTP id 2adb3069b0e04-52c9a3bfb2amr2359349e87.10.1718208968108;
        Wed, 12 Jun 2024 09:16:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:16:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:30 +0200
Subject: [PATCH 17/23] ASoC: codecs: wcd938x: Constify wcd938x_sdw_ch_info
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-asoc-wcd9xxx-wide-cleanups-v1-17-0d15885b2a06@linaro.org>
References: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
In-Reply-To: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2444;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=j1T2EZc5hy8lhjfjDFFJirW2r0PITpoz1SZidS75cJA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmmYxa/plx5aUYu0Ka2ucFGIRTRrFo7Zs0gg
 7Q9/bMif+uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJpgAKCRDBN2bmhouD
 11tkEACYAHc9bdHHeVS2Gv1XjeucTe9X7Oo2WPwk6KJYcaNsU2AiC9XpS12sBTLgeH2jxck69ON
 ENyisZlJPK6YD7pIj6ZMCVrYz8wwURZD9ude5K8SbcL2I4vldJgFAZrb4L6SdQhbQ7fzJGl9rJG
 v4OLP9QG4IYMPYyGzvYCFv4aHDfRJ3/0aYCi51mL0BwAlzfwLYO0/kFQDXx82PO0MqpJ0KUDq3Z
 9sLczZ0XAEODYAoMGn8pnRMqxeliLNlY88AerigAwL4jDwpA8gKG7rFFyJSaRc3OHUNZ6NDUOO8
 VCk/lWCtLumTJHzUuL/1PEQ7Bc45I4hq+9OIONgD2YFfI1HjkaE7VH7+qiNqfcScDPN5qLiiYev
 ZkYbFf4gbmn0wmVAnbxPCT1C8WmaUATtVghp/P1/uI0C0A7JfoRtDqewr3/qyOEbSgqTTs4t09R
 8/xA2VwxD0Z96StDjow5IL8yp9sSJQIW4agyeog0qrBVbn+LHHEQnfR7FaTbZpE9eZu7XV8d2gh
 6ynIgcvHcUh4BAKO4+GgRyMewsUl8UDTkfyqztiHEidhz3yKMKmB78Zl9ldXv+1DFdQ9eb8MY+B
 vgbNO0b3GslqnljwB6pCcjbNPFaHP0DLmJRJm3Pi3vTuIBNvMIspwaBr3Bsa0txzjJcz7oETcIn
 5ZIrsZyzehWULHA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver does not modify static wcd938x_sdw_ch_info array, so it can be
made const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd938x-sdw.c | 4 ++--
 sound/soc/codecs/wcd938x.c     | 2 +-
 sound/soc/codecs/wcd938x.h     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index a1f04010da95..c995bcc59ead 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -21,7 +21,7 @@
 
 #define SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(m) (0xE0 + 0x10 * (m))
 
-static struct wcd938x_sdw_ch_info wcd938x_sdw_rx_ch_info[] = {
+static const struct wcd938x_sdw_ch_info wcd938x_sdw_rx_ch_info[] = {
 	WCD_SDW_CH(WCD938X_HPH_L, WCD938X_HPH_PORT, BIT(0)),
 	WCD_SDW_CH(WCD938X_HPH_R, WCD938X_HPH_PORT, BIT(1)),
 	WCD_SDW_CH(WCD938X_CLSH, WCD938X_CLSH_PORT, BIT(0)),
@@ -32,7 +32,7 @@ static struct wcd938x_sdw_ch_info wcd938x_sdw_rx_ch_info[] = {
 	WCD_SDW_CH(WCD938X_DSD_R, WCD938X_DSD_PORT, BIT(1)),
 };
 
-static struct wcd938x_sdw_ch_info wcd938x_sdw_tx_ch_info[] = {
+static const struct wcd938x_sdw_ch_info wcd938x_sdw_tx_ch_info[] = {
 	WCD_SDW_CH(WCD938X_ADC1, WCD938X_ADC_1_2_PORT, BIT(0)),
 	WCD_SDW_CH(WCD938X_ADC2, WCD938X_ADC_1_2_PORT, BIT(1)),
 	WCD_SDW_CH(WCD938X_ADC3, WCD938X_ADC_3_4_PORT, BIT(0)),
diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 124c18712422..12b32d5dc580 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -418,7 +418,7 @@ static int wcd938x_io_init(struct wcd938x_priv *wcd938x)
 
 }
 
-static int wcd938x_sdw_connect_port(struct wcd938x_sdw_ch_info *ch_info,
+static int wcd938x_sdw_connect_port(const struct wcd938x_sdw_ch_info *ch_info,
 				    struct sdw_port_config *port_config,
 				    u8 enable)
 {
diff --git a/sound/soc/codecs/wcd938x.h b/sound/soc/codecs/wcd938x.h
index 0d332cb555ac..09e39a19fbe4 100644
--- a/sound/soc/codecs/wcd938x.h
+++ b/sound/soc/codecs/wcd938x.h
@@ -653,7 +653,7 @@ struct wcd938x_sdw_priv {
 	struct sdw_stream_config sconfig;
 	struct sdw_stream_runtime *sruntime;
 	struct sdw_port_config port_config[WCD938X_MAX_SWR_PORTS];
-	struct wcd938x_sdw_ch_info *ch_info;
+	const struct wcd938x_sdw_ch_info *ch_info;
 	bool port_enable[WCD938X_MAX_SWR_CH_IDS];
 	int active_ports;
 	int num_ports;

-- 
2.43.0


