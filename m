Return-Path: <linux-arm-msm+bounces-46736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DE0A2584D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 12:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF7E33A357A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 11:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8895202F97;
	Mon,  3 Feb 2025 11:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="ywqLbPUa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="UdLSfGZx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="q2sjpkAc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback21.i.mail.ru (fallback21.i.mail.ru [79.137.243.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4EF1D618C;
	Mon,  3 Feb 2025 11:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738582767; cv=none; b=fcEXNFKanPoEcYhxyvi60zlyWm+ZPXJuNKJvRm9CcRMRf1fVbN9AMFF1jlcg19HEjB3VQ8BcBCiko1kmk45qdyfZ7uE1lyXnTGWwIH5KnnnnTxMWfqpxNrV90irK40MnsgKEqs3g9am7LoDZKDgstmBbV+KLNZpQpXOBJDpBSFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738582767; c=relaxed/simple;
	bh=uzQm9lr7G9aVprngTlgi2l/rsm9lHbu1PrevEWYOewQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MiEpafRoVjMLyUYbEW443p8O+zHYV+t311+hOWZTslziOF8J7mwhoKRBpcjKb5qBvx8Q9TDiZ8BZciVetucsxBV9P8Ln4I72L7wmILT3s1wdCKDY6xBAuFxb3Fs50RlFOCXf2j120J5wU9YdOrZhNHHfMhzASg9TjuZqhWkrm4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=ywqLbPUa; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=UdLSfGZx; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=q2sjpkAc; arc=none smtp.client-ip=79.137.243.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=LtgUQF6/DA3JmlXx/khljgwyBzY4Mpa3OgoQtWy2VrE=;
	t=1738582765;x=1738672765; 
	b=ywqLbPUazEuC4mPMCAfwheHEq69X/1rSZZ0/v3iaQcaQUnAxDw+VvNi9dBnkoGvRr/faiPjoOtDrtrP9MOwnGW8s6Wb499rP6oBsQwRmZ9GVUxNNQZG9fpeJMSALASAIDrl2Uq7DLMKDmfBdQwC0eg1UVfWQg6Y7rOiwlWTYFDA=;
Received: from [10.113.100.239] (port=50834 helo=send54.i.mail.ru)
	by fallback21.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1teunT-0067SV-4G; Mon, 03 Feb 2025 14:39:23 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=LtgUQF6/DA3JmlXx/khljgwyBzY4Mpa3OgoQtWy2VrE=; t=1738582763; x=1738672763; 
	b=UdLSfGZxyC0HcUX7uPs9IbC+brdE6x8Zkp7i2rGHm0VViv8VcG2RrEvPLp6OMU5xDTJuHhieT6e
	0JA4WxQwfjNhjUmY6JeupkTcC/LAY75D3aX8fP+XAgAnztRzfMPrsR8TZoYKQfSjgyfOpAQb/u3W2
	n5RBPU0Aq1TwctEfGTQ=;
Received: from [10.113.187.12] (port=51480 helo=send127.i.mail.ru)
	by exim-fallback-5fbdbdcb77-mqqb9 with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1teunK-00000000K3N-1BE8; Mon, 03 Feb 2025 14:39:14 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=LtgUQF6/DA3JmlXx/khljgwyBzY4Mpa3OgoQtWy2VrE=; t=1738582754; x=1738672754; 
	b=q2sjpkAcNp4lqRPOrmhnfHF47xZ6PtBKXU+56eiBjmk49B1xIIERiRDARvNznfBk0su3U9PYEzz
	1mWEXCJfjf3Yz4CI0MqysNbkwrqQqNRckQzEfhaJNu6t8ksZVeo4HzoFdurOkI9sVbgj1VPNJs40c
	5bakeGCwoWXwCClSEsA=;
Received: by exim-smtp-6d97ff8cf4-rrm92 with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1teun5-00000000DTK-2ZMn; Mon, 03 Feb 2025 14:39:00 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: srinivas.kandagatla@linaro.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@mainlining.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH] ASoC: qcom: sc8280xp: enable primary mi2s
Date: Mon,  3 Feb 2025 14:38:57 +0300
Message-ID: <20250203113857.34728-1-danila@jiaxyga.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9279F651DE5037A50CB9835DFB12218DF141C43C6B1DC11281313CFAB8367EF908E2BE116634AD74D9DAF345B830A31CEAC8EDD30083ED68EA8B434D654C51975D2A8E994D559ECF14DF7BC4678047644
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE796AEF990C7BF66FEEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063716A4A39B750036BB8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8473FBC76134777A80AFA6CDB8F0FBF6A1C463966C30DF1DACC7F00164DA146DAFE8445B8C89999728AA50765F790063783E00425F71A4181389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8D2DCF9CF1F528DBCF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CDA7BFA4571439BB2C0837EA9F3D197644AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3E43D663FACA9F152BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE78DD9044B304389D4731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5C0A99AB6759B11E45002B1117B3ED696A12BBD6F12FE8FE854BB1175C6E7DD94823CB91A9FED034534781492E4B8EEAD4ADCFBF7921B375DC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFC00CDE29973320DC63417E4FF87B1FC5A53A05AE1163B07BAA20AD324B7BB95D5C1052AD1686EE73D5D9813428A63F6CF719D10C52FB165BA2F385568FAC22F01FCBDEFD0A89EA51AF108DC32EA72A8402C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojODHyJtLJ2QgLTjYPv2Tk5w==
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275F0A64072CE9418C59AC4385294E02B5FB575A762C2041BEEA07ED6260DC71E4C12C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4A84B4964F946E17EB1A91FC540E416C1BDB3A1FA17F234B6049FFFDB7839CE9E5FC588583EA33AA135E0A86D076A310E070ACABD80DF30C8865C3644565E8059E1ED26BD90F949EF
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSrl3vZ7XAIcHbRFuIOw5Q1i
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4A84B4964F946E17EB1A91FC540E416C11582D74B19986F8F049FFFDB7839CE9E5FC588583EA33AA1CA8BF9D109371751F8F55B56E9ABC05A53C643781AA89585
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSpPtEiBfN5W1tyqHyU9iLcO
X-Mailru-MI: 20000000000000800
X-Mras: Ok

When using primary mi2s on sc8280xp-compatible SoCs, the correct clock
needs to get enabled to be able to use the mi2s interface.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 sound/soc/qcom/sc8280xp.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 311377317176..03687de1ebb0 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -14,6 +14,8 @@
 #include "common.h"
 #include "sdw.h"
 
+#define MI2S_BCLK_RATE	1536000
+
 struct sc8280xp_snd_data {
 	bool stream_prepared[AFE_PORT_MAX];
 	struct snd_soc_card *card;
@@ -25,13 +27,24 @@ struct sc8280xp_snd_data {
 
 static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
+	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_BC_FC;
+	unsigned int fmt = SND_SOC_DAIFMT_BP_FP;
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_jack *dp_jack  = NULL;
 	int dp_pcm_id = 0;
 
 	switch (cpu_dai->id) {
+	case PRIMARY_MI2S_RX:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
 		/*
-- 
2.48.1


