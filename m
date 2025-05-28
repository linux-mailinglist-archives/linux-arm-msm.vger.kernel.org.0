Return-Path: <linux-arm-msm+bounces-59742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8D0AC71EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 22:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A022216391F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 20:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29E2E221F2D;
	Wed, 28 May 2025 20:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a31gCKQZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D412221277
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 20:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748462418; cv=none; b=OIu9GPI2XBEV3VA3q3JSlqj+o9UgxZawwj38IYxXXnSA8UiGzo6GjYkrhKwLzaezTl8CD+GJVYQdAegVh4WuPkttGnjOgS4A9jd1upoY52mBSm+rzl/6j0q6jFubCjiaybbkeUVolHE21pBujq8OJXrQ64dCqEHaxbITYqU6QB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748462418; c=relaxed/simple;
	bh=bE4AstDjnvFxLFE0Ha1Csaz7+vgcKuDvPOFc39zCH/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gHhcb1O/Dyb8DIca7Wc+eqSrrWTeJW0P3/lhb799YX1+knWs0anuMeJkD78njVkH0aRifiyLlhbhg5ClhJwnVtOHfGU9S+bnk/G3KJLoOvf+YtiVRU1qiVQR/GSax2AEDOTTBmPvGReRUuzZ94fAOueNLEtcd+lnnV7CAlp7nXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a31gCKQZ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4e57d018cso34086f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 13:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462414; x=1749067214; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mUSrmQGzRLm1yXmwpcZ6EHzpQ97NUziF5cyDbhiDKYw=;
        b=a31gCKQZFfrFBhW/sLn5IAo96f007/uhu0a74KALSGiC8uLKHJ8LfjQ2J7YMepW86X
         caeLHrmylAmpgp4FWTfdgOphXvdMG03uOHVE/sBBbDZq7RC45uDhxWmMhczrB+wLdKU+
         VCJ4k5UEnp3lweRhr4zM5FIxo2Ost59oZFYqpTQIoQgrLQrYc9Gph0eeHhXSSaM7LLD6
         89sfaqYv8PrwDhDZa9MXY+gmXTPU3mzvFEYWcWWAm+OlmGAyI6fMBrsaOKi5ikW5Th7z
         7DXec7KNoaAUTJv6cXHiF9FsaPm4KEWTBSLJPTj3ze09lOY1oZx0eajyHPJZM76gtOM2
         qh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462414; x=1749067214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mUSrmQGzRLm1yXmwpcZ6EHzpQ97NUziF5cyDbhiDKYw=;
        b=vzlbRYmHS30kS+tOSfPNDLJruwsRH2RS4on16ZNq7aBOtVL21AnZOEkd9RwS8BDp2k
         hE/+e3j99/fDlhOEx2kSXSAHX7aJyyWqCiQdwkNDPq/zBHVwSVkGHaEqtxoFd7aUs9Ob
         gfXLSFkJsExk0oEoWUrHrr/XLb19YjlHxgXAP1Ta7jA7omUPOInEXQ96D4MucHT1XpyI
         FiPMDdT/i4Dzxeo6pM0uIr/vg8UBw2R3E3pnax+DonQmqvyHCdH2bKMhRxf3GPxoLJ++
         XCZ7u+oHUr19LIIrw7K0aKFuSQKGfK2AHAeed9r6qJFAtB0y+bOzJ+FSgVFNn5/IZtQk
         LmeA==
X-Forwarded-Encrypted: i=1; AJvYcCWs5hCATaDz94pZX2L4rVTlr5zUTj8cIbXgs2XVE3uJtX1cIKonivja3TRqkvz8yhJ2Bqa2UJ20cW/coNbB@vger.kernel.org
X-Gm-Message-State: AOJu0YxiBYimBqNRVNYEkE78hCNb/NQ3+wxRrD0SgeJzq2XxrzrRSiGm
	klfiX+muf3kJu6vvIrLKZlqqbefIKoi9LU5HImw6ABay8edjEewm5wCRsA5z+pfLFvWJsiGR07r
	Eakth
X-Gm-Gg: ASbGncuk2k6mAJ3YzDhTjY05teSZh68fkOlx3z7EUCFEt+Mft59prBR49Q4/P5saEXy
	PAXyCFs7mp23koXQam2RfG5KLspRcNulOPifx6bkgESrzB5+rv22/b+Yfrbl6VQJob+FvFP0sCG
	+4TkEe2bh3Gfeo5Zo2urUQnPBaooEavn1bXgomOP9dsMXLcbY6dwhv3bcEakUBDhwAPJZ0NWG38
	WrKP1vsB2DOo3WO9SYzC/fOZFKeARof18CicXZXUMi7s0vNaAQYB8sUVK0VKDIvdTXrhdjt0KB8
	Uew21YYuCjKxJ5YkX6wi/rbJD/s6W80S9ESxQjN7obBO2uC7GmxotCzH30NTh0HQ4N3NMVA=
X-Google-Smtp-Source: AGHT+IGfU8NFt+DqotOkDnTjGF7XzJKz4InJeaeMrRliPYDudRhDJYMTWxE+7D8L8v2uiJmW/9+V8Q==
X-Received: by 2002:a05:6000:22c7:b0:3a4:d924:e650 with SMTP id ffacd0b85a97d-3a4d924e7acmr4088338f8f.3.1748462414106;
        Wed, 28 May 2025 13:00:14 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44fcbd61553sm53347665e9.0.2025.05.28.13.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:00:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 21:59:58 +0200
Subject: [PATCH 4/8] ASoC: codecs: wcd934x: Drop unused
 num_rx_port/num_tx_port fields
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-asoc-const-unused-v1-4-19a5d07b9d5c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=bE4AstDjnvFxLFE0Ha1Csaz7+vgcKuDvPOFc39zCH/Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoN2tAPg4TdSpzrnusk8/T1AviguPqy8H5ac0sf
 fUwz2vi3r6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDdrQAAKCRDBN2bmhouD
 12gcEACIIAskqI79X3CWPeeqtkbf389joGRl9j0Z3/TBo+YE0zAGoLygLCjCxovWSIp4Q9+9bjz
 tjAG5P4m70aauB0+sUTBy9aS7+sTiY0mxrReQKzqh4FtHSZIorAt5e81IzP8h18ONx4o61A2NW1
 ON5zm5321mfYDFeephAO5g+ISQutxjHEbR4Q4QYzIKSHPVJCac1N3gV/xHXRXgCP5TVrBSVbRkZ
 ugKzBhxgXw8KcMB69mnoHWypcP4AB1GxrDirlql+IywJg9fcBaxe+OhandyVmJaBfqpEW3s6Ce7
 2SDdVPdkZhIIPFFwGfcR9gzyW+PhM8l1/m5rq/Tz4/RidVls1Kg8U7woejgDsUakrQsrp2Eia5a
 MRdps9hdh4dIkJhbUsaQGIrLFKD9d7IvuDTKbLWSA7FWuVt7mVd2aXG+SWTX6sIx6uENZLM/nPq
 cy114SC/Fq4zEwoLoLbSkgeLj0BXVuJcfm62aSfQFrYCjyZqtHsyEZ5M8VdHZGBffs1eNRo5cue
 oSSiji8mfSjxawQokubfc+UO99Sr2R65oDtarSkXLjlZtQecJ8yd1WwfobzB96nG8BrQxpsLEDd
 ArCTD9P0YGhujSOt7JL8FDNkD6Um8WbDDWebxCC6foNi1fKypNRnAZFhdGUrY0nZpclACByimX9
 RqKKAUwNqaF8ZcQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Members wcd934x_codec.num_rx_port and num_tx_port are not read anywhere
after assignment, so they can be safely dropped.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index fa69817c97eaf1bf226b140f3a89095a50a128b2..1bb7e1dc7e6b0a5528cbdb7ada943a7d417fb684 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -537,8 +537,6 @@ struct wcd934x_codec {
 	int rate;
 	u32 version;
 	u32 hph_mode;
-	int num_rx_port;
-	int num_tx_port;
 	u32 tx_port_value[WCD934X_TX_MAX];
 	u32 rx_port_value[WCD934X_RX_MAX];
 	int sido_input_src;
@@ -1928,13 +1926,11 @@ static int wcd934x_set_channel_map(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	wcd->num_rx_port = rx_num;
 	for (i = 0; i < rx_num; i++) {
 		wcd->rx_chs[i].ch_num = rx_slot[i];
 		INIT_LIST_HEAD(&wcd->rx_chs[i].list);
 	}
 
-	wcd->num_tx_port = tx_num;
 	for (i = 0; i < tx_num; i++) {
 		wcd->tx_chs[i].ch_num = tx_slot[i];
 		INIT_LIST_HEAD(&wcd->tx_chs[i].list);

-- 
2.45.2


