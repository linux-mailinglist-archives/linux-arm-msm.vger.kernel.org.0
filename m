Return-Path: <linux-arm-msm+bounces-46803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09158A260E8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 18:07:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91AF63A28D2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 17:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F5420E703;
	Mon,  3 Feb 2025 17:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="YrFguoTy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="UPJ+wA11";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="LVUMQffq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback13.i.mail.ru (fallback13.i.mail.ru [79.137.243.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95ACC20C487;
	Mon,  3 Feb 2025 17:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738602322; cv=none; b=WRkKYlIonl1rav1DsygPliB4/IVaELq72VcH5JxrqAZkq79bQ6GtkauXUNTZN5eqyP9rC2ZcwNaFcpyhSQhMowdYY1YCKqmGzTP9p9nBBTYVF0if/Zo6eD6NhkdHj338xlw/Qlu71hERmZCwSNhhOKeN/lz0G8Kl+B7Ly+GftuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738602322; c=relaxed/simple;
	bh=8gqbgWOmSIBEARTO27ip87rU4VgZH2sbu3CT6o5OjOU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Mf8xgPVpJlhy1wxspM7ok2iL1uc5fExNgY0lAiEp2dFW5B24OAe+vDbnKP0y0IChaYJDhBA46B4zrvHU+WGYA/bqBKAxH0toYO4MlP8+4Z0cAG4VXWGcsxT5PTbR2/JKyRrG2XkcLov2oORSczgsv5xhnAsqS2vO3QIu9n1OXS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=YrFguoTy; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=UPJ+wA11; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=LVUMQffq; arc=none smtp.client-ip=79.137.243.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=Oc0ENgSqjmeWDMEndqE9U5ZbdFvgAeBd0Bm1eWusQgg=;
	t=1738602318;x=1738692318; 
	b=YrFguoTymDgXmVifN9y4tdaeFk3WFlwARfTcYwYhzfQPcKikILOJOd+Jo+mxfLJvhdUhltr8M3nkq47vD7WMwGGjl1zQHzq93W1uh1XBmDRNC4nRvAQlyvKlfPjLVK7SAk0lsctJyQljqptyacQWoB7mZQ7shQEy2/qWomdVp3w=;
Received: from [10.113.236.251] (port=49106 helo=send100.i.mail.ru)
	by fallback13.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1tezOh-006BQS-Ky; Mon, 03 Feb 2025 19:34:07 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
	Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=Oc0ENgSqjmeWDMEndqE9U5ZbdFvgAeBd0Bm1eWusQgg=; t=1738600447; x=1738690447; 
	b=UPJ+wA11rtUDZF6195bRpH51V6Cr5Vv+iu6m6TVx4z6kwsfHnO8rJXT5EX1oBPqzF655NgZjaUQ
	5tgkOznlGdhkd5vlb9rMN7+lA0iQoP9IKn8yuFWenfyWozhzPqYYpwCv4PUsqh63ZUjorOemQvcxn
	JF+2Av2a6Y9vubB4zUg=;
Received: from [10.113.42.5] (port=47510 helo=send218.i.mail.ru)
	by exim-fallback-5fbdbdcb77-9m2qh with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1tezOY-000000002St-2fDQ; Mon, 03 Feb 2025 19:33:58 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
	Cc:To:Subject:From:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=Oc0ENgSqjmeWDMEndqE9U5ZbdFvgAeBd0Bm1eWusQgg=; t=1738600438; x=1738690438; 
	b=LVUMQffqvQLWYEbquk7MvNwtDAyYS7YnfnFYcmO+45WJQQCkuAo+u8SKu7Ac82B2wZGm4Jhr38S
	prBJPHgk7ZXzLaqBxz0sjB7iNtUGnZ9eQR4zaR0g3460aeTxL9nilqae3XrLAdnFpqK6zkEjS9LfH
	t05LADpQJymMVjgBHFM=;
Received: by exim-smtp-6d97ff8cf4-c2q8q with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1tezOG-00000000Bid-3hsm; Mon, 03 Feb 2025 19:33:41 +0300
Message-ID: <bcb4585e-1426-444a-9112-6cd95a81f8bc@jiaxyga.com>
Date: Mon, 3 Feb 2025 19:33:03 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Danila Tikhonov <danila@jiaxyga.com>
Subject: Re: [PATCH] ASoC: qcom: sc8280xp: enable primary mi2s
To: neil.armstrong@linaro.org
Cc: srinivas.kandagatla@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@mainlining.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250203113857.34728-1-danila@jiaxyga.com>
 <df4580ff-7b45-4485-9664-4cae731b7c53@linaro.org>
Content-Language: en-US
In-Reply-To: <df4580ff-7b45-4485-9664-4cae731b7c53@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD985D89FF3B425BBEF3311F799C379094114788A9DC669AB30CD62213F67905E7A52BDBCB3AF353612AE5D5214B3CC02C5CD0DDB71F2C6CED4D114EA56B83F6F8EADAB024B4846C063
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7AD1D4C299A0C172BEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063799A9E55CA76E18AB8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8D1F1014CD9BE45803FEB45B70830D2FB8F423DB12F6E5EAECC7F00164DA146DAFE8445B8C89999728AA50765F79006377C70927E34808485389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC82D01283D1ACF37BAF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C4E7D9683544204AF302FCEF25BFAB3454AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C371330ADC0232E4BBBA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE72958EBC9E2F10130731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A522E9BFF82EC77C5C5002B1117B3ED696A56F052CFC1B078F33EE06AFCD964888823CB91A9FED034534781492E4B8EEADED8273DE7764599ABDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFF3BEBA836B2E3740FF7D52B332CBCE45A25F9EBFD7DEEAB545E9CEA3E5A152365585C02E945303B3D5D9813428A63F6C40AE7E41D7BFB5D486C71B71A95C9D3BF10D72E4390CC318AF108DC32EA72A8402C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojks+hT+CyYL1mE2yEaxmlVQ==
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275F2B0E683A5B33089691CF6C6A8F7D6EF6AAA0D715B9D1AC84DD061ED7731D9D332C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4A84B4964F946E17EB1A91FC540E416C1A519103FDE1F1C48049FFFDB7839CE9E5FC588583EA33AA183C8434838D9F29B0053BCA51B4F6F62C4D8A00869997E7D8D85ACB4134BC086
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSqB3zHZ+sTLSQD/ql6jfy+t
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4A84B4964F946E17EB1A91FC540E416C1BDB3A1FA17F234B6049FFFDB7839CE9E5FC588583EA33AA137EB1A771EABE40D6A0344CDC25970403A2B75E079988BF2
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSoN3LTRFN6h9ZzUdJfQ/bjz
X-Mailru-MI: 20000000000000800
X-Mras: Ok

On 03/02/2025 17:23, neil.armstrong@linaro.org wrote:
> On 03/02/2025 12:38, Danila Tikhonov wrote:
>> When using primary mi2s on sc8280xp-compatible SoCs, the correct clock
>> needs to get enabled to be able to use the mi2s interface.
>>
>> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
>> ---
>>   sound/soc/qcom/sc8280xp.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
>> index 311377317176..03687de1ebb0 100644
>> --- a/sound/soc/qcom/sc8280xp.c
>> +++ b/sound/soc/qcom/sc8280xp.c
>> @@ -14,6 +14,8 @@
>>   #include "common.h"
>>   #include "sdw.h"
>>   +#define MI2S_BCLK_RATE    1536000
>> +
>>   struct sc8280xp_snd_data {
>>       bool stream_prepared[AFE_PORT_MAX];
>>       struct snd_soc_card *card;
>> @@ -25,13 +27,24 @@ struct sc8280xp_snd_data {
>>     static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>>   {
>> +    unsigned int codec_dai_fmt = SND_SOC_DAIFMT_BC_FC;
>> +    unsigned int fmt = SND_SOC_DAIFMT_BP_FP;
>>       struct sc8280xp_snd_data *data = 
>> snd_soc_card_get_drvdata(rtd->card);
>> +    struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
>>       struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>>       struct snd_soc_card *card = rtd->card;
>>       struct snd_soc_jack *dp_jack  = NULL;
>>       int dp_pcm_id = 0;
>>         switch (cpu_dai->id) {
>> +    case PRIMARY_MI2S_RX:
>> +        codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
>> +        snd_soc_dai_set_sysclk(cpu_dai,
>> +            Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
>> +            MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>
> How is this possible ? sc8280xp uses the q6prm clock driver, and 
> there's no
> way this call sets the Q6PRM_LPASS_CLK_ID_PRI_MI2S_IBIT, or I totally 
> missed
> something.
>
> And prm is neither a dai nor has the set_sysclk callback.
>
> Neil
>
Oh, thanks for the answer.

This comes from qcm6490 compatibility. Actually it is needed for
Nothing Phone (1) and Luca Weiss just suggested me to use
qcom,qcm6490-idp-sndcard like do they do it for FP5. (SM7325 is the
closest to QCM6490):
https://github.com/sc7280-mainline/linux/pull/5#discussion_r1848984788
Actually I also think it is a bit incorrect.

---
Regards,
Danila
>> +        snd_soc_dai_set_fmt(cpu_dai, fmt);
>> +        snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>> +        break;
>>       case WSA_CODEC_DMA_RX_0:
>>       case WSA_CODEC_DMA_RX_1:
>>           /*
>

