Return-Path: <linux-arm-msm+bounces-27554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63499943342
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 17:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FF2C2829EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 15:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21AD1BE235;
	Wed, 31 Jul 2024 15:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ETACI/z2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E281BD4FC;
	Wed, 31 Jul 2024 15:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722439577; cv=none; b=cxpVXF9Fdm6j03718Xsb9M9qnCp1e8P6jT+o598Ku/yN/xjXOM1o7CuLn/KwWd8MKmeK3fCF0pEdZSidkWpFTuECvy0gofOQNRzXZYZRVLxjq59TgPdrVnUmvK2R3tvUpsVkdtkUtEyzHyHs/q9m/SDTfBye5eGX2eYpu0YO7pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722439577; c=relaxed/simple;
	bh=ue+vpUOG4ZnyGYEi2iXto0ytfCqxL7uNzt6OO5tHUHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GDbmme9WFXCmGRQp1K0mpkNSeuN8he+AX2H5fRmo6WnCYq/j6DhNNtfl08Kub8J2cgBNMCo1merBiCaKsoprdcqMoOSI0tIwBaJIzrY3UgE+o4XJHwNIn76lNgUMM1VQYoiSD26Y/Q803lW8Z2EBmq+JHf84NtOKJgqgCSe7+G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ETACI/z2; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4281d812d3eso37151285e9.3;
        Wed, 31 Jul 2024 08:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722439574; x=1723044374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7acxoGv0kNGN7BdTg0LbHlXp+SwEqZuAjJ2EFuphzY=;
        b=ETACI/z2q6Z6Odnw8lj44SIW6rOnKmVk7VWznm7UrpzX3pq0RMBs+lG0R7G4M508x/
         J6Z1vu12aBXg2A2Z/eE9JgQWkfiaL8OxLd/YlKPeLbeKOoRJ4m585Vu6NSWdq/1zzcHF
         v7FYl1CT81cYh+YmqPNQSra+KWFGTjX9pjUyojs1UAIFuK8yD2E2kvErmxphYI05ssG5
         zKtix6PlunUTBAbZFA2HlOJ3aujb7Wc/UUP+2VCVL0aBaxJOKipoibmdSlHgAhwBC5zc
         3S2Ec3Xs7mivY0LRhXRhAj8vA25+anUveUBxwMfc3FAoL7q/+nUHlm1uUzdgMDszxJsw
         CGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722439574; x=1723044374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y7acxoGv0kNGN7BdTg0LbHlXp+SwEqZuAjJ2EFuphzY=;
        b=tznPFLETTP7HtbyEc7VCwtJ3+mt519wW5nQPIyaHb1It2daxdlY90Ov5ry9dIX6zeX
         ORFisCZ9qCWmuIhJf0KO6rsHVVhTicDy++UWgHfQzPxCkhW1MdDtpreHR8KZJotOjCpj
         HASZs+Y1ANxUEHsUlEGmFyNPhjV6hKWusRU+ZXvuvfOv0udIU+zzNfAGIusqpJIVHxCn
         UgmWoobVWSm57bsH3bECTY903GOyB1meExI0PBDwUkqvdB1/ufxgHoI3M11HqdXSc8jd
         r7NkJPDLf4wLSuA8HHZUdd/wdd3Z398FJN1RuAcsNzhXZwErRIiN3ZtuUFjvn4l8OwZz
         oU2g==
X-Forwarded-Encrypted: i=1; AJvYcCWZRyUAEqEbn+yNmCo50Es6yPPT21pQJ65WuHPg90mXYgqLsVCWvzW0PImZAklSvfA0PqB8kH/5RaA87FCsD7DqnIj/OpA4hLXpgi0qBTfCvhkAQkO0FnUYS00hV4gK1allvRwkXchKlBdr1FDRBTNdgq2GSNunl/Ntx99hbH331lJljBmpo5LC4jPIZLYhUgH5hz4wdcxH8YmGvE19wgPjYmWnsg==
X-Gm-Message-State: AOJu0YyZzpF3QNavQUQRxQE7A6iR/s/O4Yed9j6Mt41/lbIiySLoSUGK
	7QhV/gbsHe5K7HRDpjAvTS5S3AbyB1nm6HoQIjIKR7CVHaDmBM4J
X-Google-Smtp-Source: AGHT+IEudtEsD9vtF73wmt/UCZjRipmWNhTtdiBDvrtFMRz0YZRF3+kCI0jf70h7wmb2E3E950aO3g==
X-Received: by 2002:a05:600c:198b:b0:426:6b14:1839 with SMTP id 5b1f17b1804b1-42811a9886fmr139704645e9.0.1722439574189;
        Wed, 31 Jul 2024 08:26:14 -0700 (PDT)
Received: from [127.0.1.1] (byv161.neoplus.adsl.tpnet.pl. [83.30.41.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb64755sm25430985e9.36.2024.07.31.08.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 08:26:13 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Wed, 31 Jul 2024 17:25:30 +0200
Subject: [PATCH v3 6/8] ASoC: qcom: apq8016_sbc: Add support for msm8953
 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-msm8953-msm8976-asoc-v3-6-163f23c3a28d@gmail.com>
References: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
In-Reply-To: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Stephan Gerhold <stephan@gerhold.net>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>, 
 Vladimir Lypak <vladimir.lypak@gmail.com>
X-Mailer: b4 0.14.0

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Introduce support for audio card on MSM8953 platform.
Main difference between MSM8953 and MSM8916 is Q6AFE CLK API
supported by firmware which influence way we set codec clocks.
SoCs shipping on at least msm-3.18 should use v2 clocks.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
[Adam: rename functions, add msg]
Co-developed-by: Adam Skladowski <a39.skl@gmail.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 sound/soc/qcom/apq8016_sbc.c | 43 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index 5a29adbd3f82..3ed35beb671a 100644
--- a/sound/soc/qcom/apq8016_sbc.c
+++ b/sound/soc/qcom/apq8016_sbc.c
@@ -22,6 +22,11 @@
 
 #define MI2S_COUNT  (MI2S_QUINARY + 1)
 
+enum afe_clk_api {
+	Q6AFE_CLK_V1,
+	Q6AFE_CLK_V2
+};
+
 struct apq8016_sbc_data {
 	struct snd_soc_card card;
 	void __iomem *mic_iomux;
@@ -29,6 +34,7 @@ struct apq8016_sbc_data {
 	void __iomem *quin_iomux;
 	struct snd_soc_jack jack;
 	bool jack_setup;
+	enum afe_clk_api q6afe_clk_ver;
 	int mi2s_clk_count[MI2S_COUNT];
 };
 
@@ -192,6 +198,28 @@ static int qdsp6_dai_get_lpass_id(struct snd_soc_dai *cpu_dai)
 	}
 }
 
+static int qdsp6_get_clk_id(struct apq8016_sbc_data *data, int mi2s_id)
+{
+	if (data->q6afe_clk_ver == Q6AFE_CLK_V2) {
+		switch (mi2s_id) {
+		case MI2S_PRIMARY:
+			return Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT;
+		case MI2S_SECONDARY:
+			return Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT;
+		case MI2S_TERTIARY:
+			return Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT;
+		case MI2S_QUATERNARY:
+			return Q6AFE_LPASS_CLK_ID_QUAD_MI2S_IBIT;
+		case MI2S_QUINARY:
+			return Q6AFE_LPASS_CLK_ID_QUI_MI2S_IBIT;
+		default:
+			break;
+		}
+	}
+	/* If AFE CLK isn't V2 return V1 */
+	return LPAIF_BIT_CLK;
+}
+
 static int msm8916_qdsp6_dai_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
@@ -215,7 +243,7 @@ static int msm8916_qdsp6_startup(struct snd_pcm_substream *substream)
 	if (++data->mi2s_clk_count[mi2s] > 1)
 		return 0;
 
-	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, MI2S_BCLK_RATE, 0);
+	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), MI2S_BCLK_RATE, 0);
 	if (ret)
 		dev_err(card->dev, "Failed to enable LPAIF bit clk: %d\n", ret);
 	return ret;
@@ -236,7 +264,7 @@ static void msm8916_qdsp6_shutdown(struct snd_pcm_substream *substream)
 	if (--data->mi2s_clk_count[mi2s] > 0)
 		return;
 
-	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, 0, 0);
+	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), 0, 0);
 	if (ret)
 		dev_err(card->dev, "Failed to disable LPAIF bit clk: %d\n", ret);
 }
@@ -265,10 +293,12 @@ static int msm8916_qdsp6_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 static void msm8916_qdsp6_add_ops(struct snd_soc_card *card)
 {
 	struct snd_soc_dai_link *link;
+	struct apq8016_sbc_data *pdata = snd_soc_card_get_drvdata(card);
 	int i;
 
 	/* Make it obvious to userspace that QDSP6 is used */
 	card->components = "qdsp6";
+	pdata->q6afe_clk_ver = Q6AFE_CLK_V1;
 
 	for_each_card_prelinks(card, i, link) {
 		if (link->no_pcm) {
@@ -279,6 +309,14 @@ static void msm8916_qdsp6_add_ops(struct snd_soc_card *card)
 	}
 }
 
+static void msm8953_qdsp6_add_ops(struct snd_soc_card *card)
+{
+	struct apq8016_sbc_data *pdata = snd_soc_card_get_drvdata(card);
+
+	msm8916_qdsp6_add_ops(card);
+	pdata->q6afe_clk_ver = Q6AFE_CLK_V2;
+}
+
 static const struct snd_kcontrol_new apq8016_sbc_snd_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Mic Jack"),
@@ -344,6 +382,7 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
 static const struct of_device_id apq8016_sbc_device_id[] __maybe_unused = {
 	{ .compatible = "qcom,apq8016-sbc-sndcard", .data = apq8016_sbc_add_ops },
 	{ .compatible = "qcom,msm8916-qdsp6-sndcard", .data = msm8916_qdsp6_add_ops },
+	{ .compatible = "qcom,msm8953-qdsp6-sndcard", .data = msm8953_qdsp6_add_ops },
 	{},
 };
 MODULE_DEVICE_TABLE(of, apq8016_sbc_device_id);

-- 
2.45.2


