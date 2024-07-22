Return-Path: <linux-arm-msm+bounces-26751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F576938CA3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 11:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E1DD283F14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2014316CD32;
	Mon, 22 Jul 2024 09:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rswypx2g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4AB16CD0F;
	Mon, 22 Jul 2024 09:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721641940; cv=none; b=oCKRMT1kkn4/nJ+/BAZMfqo2H2xPpPLGMKbyvIoXQrt+E50fuhRLdy+uaATcj386UcaCxi0/e45vHw7wwmsfz4hvzQN/xV96xtpHmPb33N9WshmK4mxB+OIqGrzGIK6uDJ5egEbmnJDyrYYexITnkx48mNVZJNsKz5oT821zvsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721641940; c=relaxed/simple;
	bh=ElxwyvAYRep8iP0erjBmNwM65GYITd2Altmm3t3OTiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JGkUPa3/yce08OS2l3ouVLkO1oFbBYN15Furt9w7A1UHLwNxEhlT3BLrfgDfXvLGORxKP1jiX6i1tSpYuFgKJD2pNHTHDv/NiqnxZe6de5P+eXJaDzygpQ5GtbhYN9ZEnZ7WPKUz006R5kl6bwS2RTxAR2pUNAQK7flnq89O/gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rswypx2g; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52efd8807aaso1824654e87.3;
        Mon, 22 Jul 2024 02:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721641936; x=1722246736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4l/632voSz6mCh2TqLV6xqS8GDhLDgECY3Nfdz+lQQ=;
        b=Rswypx2g/C14AnGP6lxAU/wRNgpuLzuL0nLH4BKuUPn7SMkxAT3zC1wvkw/X9VChmV
         kmNv6aY9v8NBq40/fUC3OIZX+RIBqdcI5Z0jSLtiPdhuH/oGBhuH4d0qcPZk0d7byqQ8
         K4FAwNaKFMxPOZNfutf00VA/RBp1IB/dL8T33XYau+WXdr8Pk8N7KgkjfTJ6EXvS3LJ1
         2fV0cTwAti7P6dXl9fhLnlc9RSSAt2PN/4JQO2hK9T6C8Mmz+QQTZFDY4m1EQGRn8GrM
         5FeFgS7sPpmA7SB1IMRNp9a/ObGuNOB/TNhlZxN8A3KJd5NqCTwCPzJbI0MleNnAAoC4
         mTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721641936; x=1722246736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4l/632voSz6mCh2TqLV6xqS8GDhLDgECY3Nfdz+lQQ=;
        b=AeCzMXLYc/ifK1ynvNiqDEGTwyiH8shzTKPEGg1i3rSbT8DTP/tleo0o+ZHrIJM4ug
         xmWIbJvtqfL6lucdo2Vr9REo8bnO08cbRD19Vj42gdKkpPYU4uE2QXDxYlMCMVV5Gjr2
         3tBaUL04JLDYYoXE1cBTyUo/3u2u5tKEYIqb0mHy+uBfUjTLkyCH3gdMCx1Z5RLbzgP8
         PmcB/DxFr96u9FOeK1MLJuSNq9goUbbcPPJqMu2p1W81gN44KWVC5AAhndmihYHU2yTO
         a59DkCzMOV6knvQLwDzhVaMLdrTr8wcJkY1dJmjRmzuXGg3D74gTwsAGLty3OH6lj3f1
         M1eQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9AfVXfmTvcUJAJhXrmWDa1TPlTqikmXRHlLajdJKKeyHZr6sFCx9JmRyCb34SukzGEu74WmWdn7sEaIVtBhgaMP5zgKpzldAo9lnVkE0wn4k56wiYb4pEKhLfaHphhVUDxnDR8iAUUOY6zbioQ8YAzfdgvJl1I+9qs3YYvR+3jTRAkIKJx3IaSEIdJf0YQg5qFbRcsFsUvaJ+E16+F/mCL63ZZQ==
X-Gm-Message-State: AOJu0YyHSA7sksV1T3kYAwcJuvD1w6som1FmuYxc90reYVuy6yNXYlm7
	VTjeGW1tLk2TWWKCuqFtUvyFQ/pSYLVb/aehQCQ7NynHY6+uv0EZEYiPJdnY
X-Google-Smtp-Source: AGHT+IEkUCQN4xvNexHQBngyKo1Jr+lRR08xYuntYXjmUoolBteeZ3Gzo1t7dPmmD02D9Nfl7fIeHw==
X-Received: by 2002:a05:6512:1289:b0:52c:80f6:d384 with SMTP id 2adb3069b0e04-52ef8d85836mr4304130e87.3.1721641935595;
        Mon, 22 Jul 2024 02:52:15 -0700 (PDT)
Received: from localhost.localdomain (byy214.neoplus.adsl.tpnet.pl. [83.30.44.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fc226cdccsm91552e87.164.2024.07.22.02.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 02:52:15 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Adam Skladowski <a39.skl@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: [PATCH 1/4] ASoC: qcom: apq8016_sbc.c: Add Quinary support
Date: Mon, 22 Jul 2024 11:51:05 +0200
Message-ID: <20240722095147.3372-2-a39.skl@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240722095147.3372-1-a39.skl@gmail.com>
References: <20240722095147.3372-1-a39.skl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Add support for configuring Quinary Mi2S interface
it will be used on MSM8953 and MSM8976 platform.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
[Adam: Split from MSM8953 support patch,add msg]
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 sound/soc/qcom/apq8016_sbc.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index 3023cf180a75..8971f4f5d339 100644
--- a/sound/soc/qcom/apq8016_sbc.c
+++ b/sound/soc/qcom/apq8016_sbc.c
@@ -20,12 +20,13 @@
 #include "common.h"
 #include "qdsp6/q6afe.h"
 
-#define MI2S_COUNT  (MI2S_QUATERNARY + 1)
+#define MI2S_COUNT  (MI2S_QUINARY + 1)
 
 struct apq8016_sbc_data {
 	struct snd_soc_card card;
 	void __iomem *mic_iomux;
 	void __iomem *spkr_iomux;
+	void __iomem *quin_iomux;
 	struct snd_soc_jack jack;
 	bool jack_setup;
 	int mi2s_clk_count[MI2S_COUNT];
@@ -86,6 +87,12 @@ static int apq8016_dai_init(struct snd_soc_pcm_runtime *rtd, int mi2s)
 			SPKR_CTL_TLMM_DATA1_EN | SPKR_CTL_TLMM_WS_OUT_SEL_SEC |
 			SPKR_CTL_TLMM_WS_EN_SEL_SEC, pdata->spkr_iomux);
 		break;
+	case MI2S_QUINARY:
+		/* Configure Quinary MI2S */
+		if (!pdata->quin_iomux)
+			return -ENOENT;
+		writel(readl(pdata->quin_iomux) | 0x01, pdata->quin_iomux);
+		break;
 	case MI2S_TERTIARY:
 		writel(readl(pdata->mic_iomux) | MIC_CTRL_TER_WS_SLAVE_SEL |
 			MIC_CTRL_TLMM_SCLK_EN,
@@ -177,6 +184,9 @@ static int qdsp6_dai_get_lpass_id(struct snd_soc_dai *cpu_dai)
 	case QUATERNARY_MI2S_RX:
 	case QUATERNARY_MI2S_TX:
 		return MI2S_QUATERNARY;
+	case QUINARY_MI2S_RX:
+	case QUINARY_MI2S_TX:
+		return MI2S_QUINARY;
 	default:
 		return -EINVAL;
 	}
@@ -320,6 +330,10 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
 	if (IS_ERR(data->spkr_iomux))
 		return PTR_ERR(data->spkr_iomux);
 
+	data->quin_iomux = devm_platform_ioremap_resource_byname(pdev, "quin-iomux");
+	if (IS_ERR(data->quin_iomux))
+		return PTR_ERR(data->quin_iomux);
+
 	snd_soc_card_set_drvdata(card, data);
 
 	add_ops(card);
-- 
2.45.2


