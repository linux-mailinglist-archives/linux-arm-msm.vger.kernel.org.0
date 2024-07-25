Return-Path: <linux-arm-msm+bounces-27042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB9593C0BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 13:25:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7710A282C58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 11:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218D819A291;
	Thu, 25 Jul 2024 11:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XkH2aDr9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E41199E91
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2024 11:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721906647; cv=none; b=qpO7QcBHdJONwoNJN1MrPmjULLDm5GMDYg5uwpWX/74XvwnbTNoBuwQuuf4IEkFzkcxgxcTSU2HQpgzDT9fDvy2AYeMTus06mO0zd8KDBdjs4yvVbityCZuqt7on1Cty2Db/HTGhjZIIPtpbDOVvnRDFFhYVPzJPnQWKZ8RQrGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721906647; c=relaxed/simple;
	bh=IezU2W8rytHN1+OJjzdCLOScjz5OOSUaMHzxu2FqxSk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b08Mekx2Pn0ai6Oz9kx/GRIHK6p01Hq5mNRVAe0z7+ijoB46vrMBVZIhECCoDqRFvvAef8BRHxUHe/VzSnpq4Oz4q8HWsqdwFGT8NJGiN3XsT4AAMSUDDsZ5FdigYhUaAnMf5/KGgkG4fu5twGZe+teF/6LH6YidqJECb8Srv+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XkH2aDr9; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3683f56b9bdso435812f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2024 04:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721906644; x=1722511444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fuc1obU/KvJR69EdA4JL3jyV+SdcVptiD/ClFtmUvzY=;
        b=XkH2aDr9HNOLJdQOaumUwwY+YYe/r55sg2VQkWcL0aQGwBpzd9YMfxik78XDHlokjW
         YR9p0JNd1ymN9VhtDRUb8dAZU6+09I3MNds2vi7RPZPv0wVUp0lP0y7B6sfIIhs4V9oM
         7VC4NDgxSBrKhw8PNV4+MeO8f5bKG7E1vBY+EgJiIH81e8Shz6J6IHtbNuWTNvV4dGP4
         UzwuTuKaJ+DcH8RynLb6OrMC0h4IMSn4zQQIeqN7+b3fWumDBerdvz2e/Wv/LFbhLsT6
         kHpq30q0lHC2zvU2yTIxlOO3yTnptxtB7fqbpJ0afuI9HgOgqJEslosW9lP5mUW+yo45
         +OYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721906644; x=1722511444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuc1obU/KvJR69EdA4JL3jyV+SdcVptiD/ClFtmUvzY=;
        b=MzCMT6IzcpN/VNHshaR61TGKZmmlT41tl7eU9GTF3H2jYQ9UqXE/Yo5I7iojM347eu
         6u+up+pGk5+grblgDos1zqvEmJTRYi1vOyQq+mY3OaoCPXjHpp+ZVvzYAMFLHk0vgj/Q
         q+6v0Nrg6d/th9drjCkacxQ4fhLvC1vY2dK/BioK+0RvIoY4KthnY2BOvah4U+UC9Zeb
         gO8C2cUmOIlpZGOdGHB4qZsUjbS4/bXOmPxIeSNX5R7NVbtxrP4dxfALW896WrGXmuYI
         oKDcP/dhX/E4X2yerz2spVs6v2Mki75DdzrE5PbmjvKyigK6xdP6XZzpfU7cOvjIyaDg
         0ZJw==
X-Forwarded-Encrypted: i=1; AJvYcCWfzTbdtahP6ikyWj7sDcMNJo4gEBiEpMs1V1dm6UY5bxe0mavNl65Wxxhkb19i+z2819r9l9oGJ2LarIe4dqT8PjTU9BBMUpYSgw0awg==
X-Gm-Message-State: AOJu0YwO2P9fXPDG/XHB/FCbM+l5LoQ8uKO209ZAACcYh0C3ENylHDkw
	+cEv96ecIopBdTllnKF+HT0WJQ+Ko856jnCmuf7HROkzHPcg21ma6HRH3HEaBow=
X-Google-Smtp-Source: AGHT+IEpQs3fxfrt410fx954ueUVYLvEFG6tI5ahSFyUrB+n2S+LTUldQrepCDb1PHiuZbAbge4L7Q==
X-Received: by 2002:adf:f64f:0:b0:367:9828:f42d with SMTP id ffacd0b85a97d-36b31a4acd9mr1754985f8f.53.1721906643810;
        Thu, 25 Jul 2024 04:24:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367e072asm1823607f8f.42.2024.07.25.04.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 04:24:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 25 Jul 2024 13:23:49 +0200
Subject: [PATCH 7/7] ASoC: codecs: wcd939x: Move max port number defines to
 enum
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-asoc-wsa88xx-port-arrays-v1-7-80a03f440c72@linaro.org>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1490;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=IezU2W8rytHN1+OJjzdCLOScjz5OOSUaMHzxu2FqxSk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmojXIk1Qbl0Iz5KBaJYKuj2Qh1UtAtZ0R+L4Iu
 QPHwZbXeJyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZqI1yAAKCRDBN2bmhouD
 1zGvD/9lV+y+SrlBfQ7yOLDLv7oPdnM38VM/viNyVIT0BCtBO1cQIqak1MpJ+VzgJFg7wxm45xJ
 rzbYHIQXM4rVzd6z3x4i7KjJqs/tW7gB4UyuLT173BKU0ScNuU01SaoIQvzkGJT7Xs8v4M2ht40
 jQR1xGzufBOfFmJwMgiArP58KcGok2mjx2PHdu3WScEqxlbPCPPovxjQwIyutXPNUMx0PaTsDOK
 33605E8o9Gt4i+E2tTBYCTzJcH5LQjdIFFSySsx8MY6s5vyKbytntCyxaahQZV9Qf8J7dBFX6ug
 RzPLtwP2/LfnGFvngYU64mDvC38Dv4rpl+T7Ufrae4K7Lq4kFkiCa8rRdY3/ActDCYaIVHuG+Hn
 oUS5UvvtETkK0B2oiu1nxWO0U6yR4PWthV+F1KGLANunnSvQio25Pus7sp5PVTHRzbTkC4ngEeG
 tQ6NPBnqrmeOEoQK/v0I0q/FaRAWB3+hGMvUPreQQwKJ0ajNnLDCrQzRXqihzFW0CQf+P6Tpu6D
 RjGbwC/retdTGBnZV03iQKXOAjBuqaGCT6v27jWvCA2d/RT1ven4liULuTqlkWL/lgTFKoTVf7Y
 9ZTfJ3LezBmVls/gHDRczKT3Djr23nUwoIVomyLCZg6OpBtBUD3FLswFdKVX3V5QNXIV8r2Eukw
 g2PsqiVBMnqYuTA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Instead of having separate define to indicate number of TX and RX
Soundwire ports, move it to the enums defining actual port
indices/values.  This makes it more obvious why such value was chosen as
number of TX/RX ports.
Note: the enums start from 1, thus number of ports equals to the last
vaue in the enum.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd939x.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.h b/sound/soc/codecs/wcd939x.h
index 1571c2120cfc..3204fb10b58d 100644
--- a/sound/soc/codecs/wcd939x.h
+++ b/sound/soc/codecs/wcd939x.h
@@ -842,9 +842,6 @@
 #define WCD939X_DSD_HPHR_CFG5				   (0x35a6)
 #define WCD939X_MAX_REGISTER				   (WCD939X_DSD_HPHR_CFG5)
 
-#define WCD939X_MAX_SWR_PORTS		(6)
-#define WCD939X_MAX_RX_SWR_PORTS	(6)
-#define WCD939X_MAX_TX_SWR_PORTS	(4)
 #define WCD939X_MAX_SWR_CH_IDS		(15)
 
 struct wcd939x_sdw_ch_info {
@@ -863,6 +860,7 @@ enum wcd939x_tx_sdw_ports {
 	WCD939X_ADC_DMIC_1_2_PORT,
 	WCD939X_DMIC_0_3_MBHC_PORT,
 	WCD939X_DMIC_3_7_PORT,
+	WCD939X_MAX_TX_SWR_PORTS = WCD939X_DMIC_3_7_PORT,
 };
 
 enum wcd939x_tx_sdw_channels {
@@ -888,6 +886,8 @@ enum wcd939x_rx_sdw_ports {
 	WCD939X_LO_PORT,
 	WCD939X_DSD_PORT,
 	WCD939X_HIFI_PCM_PORT,
+	WCD939X_MAX_RX_SWR_PORTS = WCD939X_HIFI_PCM_PORT,
+	WCD939X_MAX_SWR_PORTS = WCD939X_MAX_RX_SWR_PORTS,
 };
 
 enum wcd939x_rx_sdw_channels {

-- 
2.43.0


