Return-Path: <linux-arm-msm+bounces-27041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E55393C0BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 13:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2E6D1F221C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 11:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D041A19A2A8;
	Thu, 25 Jul 2024 11:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JbpkpJTX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6F3199EB6
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2024 11:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721906645; cv=none; b=lrzUAWijSnNhaCn3g2jdjVAN4oqg3gAM9igKxZA+KPRteFRsbNMO8vJivtFIEx5yfGnlNHW3H5st4tJmNGXmvHP3uODLswYxwwXWoNdIdxGfa1AXE+z0cGtFvXcyZSj+pyYqYYKGma7uNXu+yoFnghIuKI3d26klb75VDN2qwtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721906645; c=relaxed/simple;
	bh=Z4sl3UsaDoDW0qIaCARjl/i/ur/SZTyjyXlvlMhISio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pb/HgsEzRw1YGiS6be/DG3On4kgOxvYEVusVWYS1kSjLxCkl/SRxxevoLP182klHWKQHiGg+P8rKnv/fEwvjfIrzXCe788lWSsi1dyqMfwuUjIq54crk1ilbwk9m0RgOW7zE5pKQaoUopy7kNMKTDZMakkIQaZt4i00STX1Wh4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JbpkpJTX; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-369f68f63b1so463012f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2024 04:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721906642; x=1722511442; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T8qPNmhqMV5uO1WWAeGcfg+Xje+HVJGnsDnxifCQEj4=;
        b=JbpkpJTXWan/nRQjHIHFXYwexKFJsDxsrWCurkJkD8EDtRkpUJ2AEbFiPvyzRKgaFp
         snoMjDsDnv9TDBmygSifP46Q5Y5zGz7ZQHr6Ilsp2fUNgBezCYVvzoo5SG8kcyu6by3/
         OpcQzmIQfVJjtHLWvFQSHBVZZb5gOeJlynfqg9GBZqBcqSZ0ciPmvTMWqBDy7jY5tN27
         eMfuI+fyVk9uAwe3ppZFN+P66X7DiqwrxTwBX+CskkeLzSQ5P1/aiZL5AA2NktgYJJ0F
         zs8P0TTgb+4CC6KL+k1ZGIIKl5I4vBZnR7x5fL7AoRj1e2oGZvmjN5HLewcGVL9Y4s9L
         uCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721906642; x=1722511442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8qPNmhqMV5uO1WWAeGcfg+Xje+HVJGnsDnxifCQEj4=;
        b=JKFBSFjdRJtf15pjuTplUH1lWHx+kyITf+Q9r3J12XIT2prRkRGx0zyYiwe1J2NrJw
         25MpF3YR9szFBU3k/UeQCuZxo4uG8lGxAuGeIUKNXMPjDbE+MYYLTF4H2HrXMY4Ogdcy
         1RH32VcORpCO5gS9EwmubJOLD1m8MASDkwSdo3VGazgYrV1/NqmD2H7/RP2RWc05+a43
         4MsJ49BLajHxgoXpmqpyGDZd5+6aJ9cl3WivyigMNkx31hRcwkuHz6gVlYq6HDUYuRKU
         SxMXrUhyP0LAm9VcDfZ88qogNeyGo1v/Ip8n7pImIXi8lebwO0hfCBkzkdC8sBBhugen
         fPcw==
X-Forwarded-Encrypted: i=1; AJvYcCWyIo50Gl3Btl+vUch/NWBSOmhfui9nYEvPBrXz0myBtZtnOW9Q+55upHtogy2SSzCSw3DzgfscByQj7cujFPaojhIbkMpJlp6a8MNJTQ==
X-Gm-Message-State: AOJu0Yzxc3Q+9pWgP8U4FpCIsCgarqhzvyGGIa1FEGLXg1nTMWko7KGY
	LETlbYLqqAsbJ8eexDVPl8P1Lg7V9M7UWtbN8RM8Y1BYIUH7hKD4VZo1sw5NDg8=
X-Google-Smtp-Source: AGHT+IFHswFHg9qmycJf/sCn7iOfKPi40kcr6NaDof8fg3mdrjY/DuoYO/J2eafkoWqxIU+1HxAapA==
X-Received: by 2002:a5d:5491:0:b0:367:94a7:12c8 with SMTP id ffacd0b85a97d-36b3637efaemr1166676f8f.6.1721906642614;
        Thu, 25 Jul 2024 04:24:02 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367e072asm1823607f8f.42.2024.07.25.04.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 04:24:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 25 Jul 2024 13:23:48 +0200
Subject: [PATCH 6/7] ASoC: codecs: wcd938x: Move max port number defines to
 enum
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-asoc-wsa88xx-port-arrays-v1-6-80a03f440c72@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1409;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Z4sl3UsaDoDW0qIaCARjl/i/ur/SZTyjyXlvlMhISio=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmojXHFok6viGl1t4tqCGW8JGde7k+DNzVVWwgU
 3NqGUpxprCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZqI1xwAKCRDBN2bmhouD
 1wdtD/9b3CBdXYwVtROD9UQpPesni0OskgB0SQJW7DEily9DHVNcaKvnwyguS7HHt6uoRedT09y
 0w2vb7l1TxEms5pi1ntoFI05ZHtU12m23kxLITMfYOFshfCL/4rz38IFgstCyWEJOY7qvecqC0m
 bPMv0eynywhZdWD/kn6z+IzdtRfUmxVL6ann7pvf+ELOmn5xl2Dui4YwAFzIPwhwV4M8G96MLj7
 NF3cvmIbE1tNr2eJbGIlJV8aZJkcV9eaGVFwUdeHxQ1kQMGhmvlbbzGJfgCHCiZfi3tf4XDECPe
 BGP+VhExGXM7DzhrMlHG3cg7H6dE8lrg4222cgvDiE7r5QwO2MTKVpwW2H4h+2Es5yEOafabJ3C
 vcUxFmpkZmfaQIu1O/NpjGyX2Z2NQLmYjDhFJYyL7W6IYVAEajpWoU/QLA+7Gn23WrJH9wfs7IW
 emOew4ct4ILK46h4qCLfGXtIiiGEpHMD9gIig4HvVxiKcTw3ZyrWjA1SNMkV4/igeHVzbj4ycei
 LmOjWh3I9P/QAD7KIsSPg0uEtcJFdiGvWAywG2BtrudfE/SaIivPaiPBq6umH7A9f7Fj1xhidQr
 eBFyBvYxheeshYPAH+/5GIGP8hePYktBgEPoV6nBXuM8rUXCHwoxSztqMZPf8ZKcynUCDLW7tlG
 iMZ7OHWB8i8ZzaQ==
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
 sound/soc/codecs/wcd938x.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.h b/sound/soc/codecs/wcd938x.h
index b2ad98026ae2..fb6a0e4ef337 100644
--- a/sound/soc/codecs/wcd938x.h
+++ b/sound/soc/codecs/wcd938x.h
@@ -585,8 +585,6 @@
 #define WCD938X_DIGITAL_DEM_BYPASS_DATA3        (0x34D8)
 #define WCD938X_MAX_REGISTER			(WCD938X_DIGITAL_DEM_BYPASS_DATA3)
 
-#define WCD938X_MAX_SWR_PORTS	5
-#define WCD938X_MAX_TX_SWR_PORTS 4
 #define WCD938X_MAX_SWR_CH_IDS	15
 
 struct wcd938x_sdw_ch_info {
@@ -606,6 +604,7 @@ enum wcd938x_tx_sdw_ports {
 	/* DMIC0_0, DMIC0_1, DMIC1_0, DMIC1_1 */
 	WCD938X_DMIC_0_3_MBHC_PORT,
 	WCD938X_DMIC_4_7_PORT,
+	WCD938X_MAX_TX_SWR_PORTS = WCD938X_DMIC_4_7_PORT,
 };
 
 enum wcd938x_tx_sdw_channels {
@@ -630,6 +629,7 @@ enum wcd938x_rx_sdw_ports {
 	WCD938X_COMP_PORT,
 	WCD938X_LO_PORT,
 	WCD938X_DSD_PORT,
+	WCD938X_MAX_SWR_PORTS = WCD938X_DSD_PORT,
 };
 
 enum wcd938x_rx_sdw_channels {

-- 
2.43.0


