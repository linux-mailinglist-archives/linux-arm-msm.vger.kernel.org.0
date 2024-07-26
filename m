Return-Path: <linux-arm-msm+bounces-27088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8358A93D4D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 16:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08B841F23E1A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 14:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4174A171A5;
	Fri, 26 Jul 2024 14:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T8tlNpIh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696FB111A1
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jul 2024 14:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722003064; cv=none; b=GwJtOUVW/JdAe7BYMM4WGIdsnkzFLomKDbADPY/wpb0+lMt2n52r6Z1bbeii3htq6bZcXbAoLeDIexkApTx1cRY//qkR/Zv9OmYv1NaHfydzDB/n3KhS+x+fKc7ktO3dBnYPbXEfyOgpsq8Vdg1zXbJqnJ4dcQf055bkagdaeOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722003064; c=relaxed/simple;
	bh=dP7UEMsz7e5SQeBIvoJx2Y/Pic6CV31hwYtlba9OL/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AzeX7V/+2qTcNtuZpPXzugvm/1/mZ6qaWz/lYEBixmRACg/E9B/LlNRE0sy07dooMFXsNW9WpV+zk1yy6sT1yl9+yVk8bkZ6si4mVLbS759Y5vOH6jDvNOL3bZsUCc9A3jMhDf2+oseR00y+OGn1NNFMEbwdUXuw031AiDt7wHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T8tlNpIh; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4280b3a7efaso6766685e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jul 2024 07:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722003061; x=1722607861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wq5Zwrj0wwcriRSju7UpectgcbI2N6emEEV2p6g72bY=;
        b=T8tlNpIhJSFJ2tkUsbRhEjDU5OYi/ZG+4qhIsF8TrXR2re2sEV/hsGSejB2XtYFiMw
         nHFLBCUQIFAC3P04vZ9RV8lUsQ+J/SXmuq4a1k6SJV6Fs25hUHVSCqesCMcZAcOMhc10
         OxTVvUaxawJhhsjKpRsJtWeEHozDZ669LtEtY0cDgjBAmS7Sc+C8xen3ZdPpUY/5Kbx4
         g2fciMcIQL9NJuOvQgiCls4/2bs1EXRMio90YAnXGLdat0TNxKagjbMPwNZ6RS7qu3e8
         PfKM+sCZCYhVOqxWBpsl6UaXeP4aiCSFXhB5/EnDusreQC+LybrG5RxMr4Nr+uvt77w2
         1aKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722003061; x=1722607861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wq5Zwrj0wwcriRSju7UpectgcbI2N6emEEV2p6g72bY=;
        b=ScqHuOIbSa+2GUYjkXJkU5MB+LJqHbpAtbo9TY2q8kZzik/AuBbEb28blnfYpwPZQt
         ejXncrhio9ERHJoBgpASnoy7mBbn0rxNxLgU7hbEZWCxgq8CPI4r8OphK/G1eYD6KvDP
         FP7aR+GhVdEm+GxwjQrtJr3tlSFz3IlrlqAAhNNDsxcbpczb9FD+DM/6tbIZYZU+xrPM
         vXDXjJ2P3WbfnSTB3scPNfVZOJEjsmNH1vQyJwbDI3PDqGiWLmGHi4YlyCLHKm1xDzuW
         ANTuYOoxYAjuxc4+RZtGBhVc1IVL0yRXgCdaJFO6CprnWr624bzY2ThIpYa3ppNc67kF
         FILg==
X-Forwarded-Encrypted: i=1; AJvYcCXg6WEVIIg1fEpmbayvHN1bErZIZBDabrkVwQnh/PvSjq/9o3bnu2cch+BaNE9bKPSk5infyYm6VsgKF1BhbyzyAFe/gfw2io6P8kellQ==
X-Gm-Message-State: AOJu0Yx1YeciT77AOYbY0kBvddYyvWa7P3egCQ0g29NmzngXhyqq51DF
	gHPMb3ldiEjf/Yow3ASCuED/AaaY3EoUouQwDqxxqx8Bxph1hIgJtwuIqosU0kQ=
X-Google-Smtp-Source: AGHT+IEG7AI5NN6YZ75+21NHmNdxvxhxO5Szstl2Ms6b99fP/MAH4f9xbyIPABZDEYOTNcVmNiXk9Q==
X-Received: by 2002:a05:600c:3b87:b0:425:7974:2266 with SMTP id 5b1f17b1804b1-42806bd9f52mr39504875e9.24.1722003060682;
        Fri, 26 Jul 2024 07:11:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f941352asm120841115e9.41.2024.07.26.07.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 07:11:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 26 Jul 2024 16:10:43 +0200
Subject: [PATCH 3/6] ASoC: codecs: wcd939x-sdw: Correct Soundwire ports
 mask
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240726-asoc-wcd-wsa-swr-ports-genmask-v1-3-d4d7a8b56f05@linaro.org>
References: <20240726-asoc-wcd-wsa-swr-ports-genmask-v1-0-d4d7a8b56f05@linaro.org>
In-Reply-To: <20240726-asoc-wcd-wsa-swr-ports-genmask-v1-0-d4d7a8b56f05@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Mohammad Rafi Shaik <quic_mohs@quicinc.com>, 
 Prasad Kumpatla <quic_pkumpatl@quicinc.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1877;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=dP7UEMsz7e5SQeBIvoJx2Y/Pic6CV31hwYtlba9OL/E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmo65qRbZcLLRSFDbSoF0d0nw+PnV31kip12ewV
 IsrK0K2QvOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZqOuagAKCRDBN2bmhouD
 15q/D/93LrXG6IqxDSqzRNmqwo2E/ibyo4QxN+fHgz4wRiqe0TlnGGeEQ+gxtN/TsToXPtd14uQ
 KsnEb7dGNIRHFGSGUnLB6k+n6OSaIPy/1L5YoiXcLbiWJJyBvzexvmE2kYckW7bBn820xkFNOqm
 iZk/vRMqxFoq33FNv5JpRqufH+Icg21of5p9NIuYgDT/C9SOUGiOl0kzRn7XMnZDMwW8c1/jkpq
 5gI7Hg7mzfdABuXkenHnQq7phecWnB+ip+MJfFhjQ4bDImdcvIy9PRY/1qi1brwy+ofE7mb+aIs
 YufA3koh/4r+90fO9XyRVTOYtEWhbsncegZ0Mc5UiOngqgCkMO/7OMh6BHNnJH71Q8qh08t3v7J
 aQJAR3DbMiwVYep3/GnS4VzdzPG92SwjznHisLCgMMwBF9vCZnzue1/N3dLip9I10C2O/cmRMas
 C4y5aP/lVKJjKVzuPANynpmAS0uR1uvOQdbJ3qo/HvHgfABrIiC/AeZjPqdnnGF9DaOTl+CZL65
 YhtnBlSv3xvc59opcNjQBWH2aZlMW+NNhj/Y51fqm+OhXsuvBIm+18fV+5hbMhouDABvpc5SBBq
 VUvYNShK+k6XncLytZh5zYSqGEnCa3TRqwYgNXjF1tu6SUg+DcmdbVUC65YT5Irn4klnHrZIt0R
 0Uu946k19b4UFAw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device has up to WCD939X_MAX_TX_SWR_PORTS (or WCD939X_MAX_RX_SWR_PORTS
for sink) number of ports and the array assigned to prop.src_dpn_prop
and prop.sink_dpn_prop has 0..WCD939X_MAX_TX_SWR_PORTS-1 elements.  On
the other hand, GENMASK(high, low) creates an inclusive mask between
<high, low>, so we need the mask from 0 up to WCD939X_MAX_TX_SWR_PORTS-1.

Theoretically, too wide mask could cause an out of bounds read in
sdw_get_slave_dpn_prop() in stream.c, however only in the case of buggy
driver, e.g. adding incorrect number of ports via
sdw_stream_add_slave().

Fixes: be2af391cea0 ("ASoC: codecs: Add WCD939x Soundwire devices driver")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not adding Cc-stable because I don't think the issue can lead to real
out-of-bounds read.
---
 sound/soc/codecs/wcd939x-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd939x-sdw.c b/sound/soc/codecs/wcd939x-sdw.c
index 94b1e99a3ca0..fca95777a75a 100644
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@ -1453,12 +1453,12 @@ static int wcd9390_probe(struct sdw_slave *pdev, const struct sdw_device_id *id)
 	pdev->prop.lane_control_support = true;
 	pdev->prop.simple_clk_stop_capable = true;
 	if (wcd->is_tx) {
-		pdev->prop.source_ports = GENMASK(WCD939X_MAX_TX_SWR_PORTS, 0);
+		pdev->prop.source_ports = GENMASK(WCD939X_MAX_TX_SWR_PORTS - 1, 0);
 		pdev->prop.src_dpn_prop = wcd939x_tx_dpn_prop;
 		wcd->ch_info = &wcd939x_sdw_tx_ch_info[0];
 		pdev->prop.wake_capable = true;
 	} else {
-		pdev->prop.sink_ports = GENMASK(WCD939X_MAX_RX_SWR_PORTS, 0);
+		pdev->prop.sink_ports = GENMASK(WCD939X_MAX_RX_SWR_PORTS - 1, 0);
 		pdev->prop.sink_dpn_prop = wcd939x_rx_dpn_prop;
 		wcd->ch_info = &wcd939x_sdw_rx_ch_info[0];
 	}

-- 
2.43.0


