Return-Path: <linux-arm-msm+bounces-29515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0324395FA95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 22:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78F0B1F21EDB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 20:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CCFD199EA6;
	Mon, 26 Aug 2024 20:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="z8fyGVDa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="oE2JdHhe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback22.i.mail.ru (fallback22.i.mail.ru [79.137.243.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCC919A288;
	Mon, 26 Aug 2024 20:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724703931; cv=none; b=Q+Q4u3OJnV008HkRlfsSknROx97Vj2ueOvW0PdnYZwHQL92MQc+6rA4hlteg/p9T0SdEUodDagGZ8Dtr3TJU8B59laTmwQdCjvWKtmndpaC4cPCRW34e5vnfRUl2AkVnd7XwR2Ca6xLvWgPcAvvBVQfa6DIIcKsP+xLacA0h0hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724703931; c=relaxed/simple;
	bh=Qn3M3vmRZzraCJP1PyOXHTgq9SDzr8WdswahhXJn/J4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kfw7LsG8m2ABGELa7gaGezBXmH57iwE3KlMlmTMHTbLQOhedPCC9Ln/u0xyyhMsGlpA07SCt6GA/5nAH4dMIyFUWZdPHCEicuQ8d7RUnrvdkx8RwUWCfoJu0ClKPe1JmORAV6sTBO1ElVnb2+iJYMJFNpygKodj5Y0cuh5UPhdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=z8fyGVDa; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=oE2JdHhe; arc=none smtp.client-ip=79.137.243.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=ilmNAnKKxEeweg3uWm2brVCV7sOH91NkrbsL8Az54xs=;
	t=1724703926;x=1724793926; 
	b=z8fyGVDae9t1nK8gh2133Oon/RMSInjjVGdurf4XeXnNIMnKqQeXT1m6jf4YkTyv9GIQMUt05YbVQwCv1RAtGkTak/iDNfBx3U0TEiWH76A4U+4EY7sEh092/44d/aYZrdxp+qmZ24qTNPzhnNQ5kYxATgw5AISkA0kGV7spsRk=;
Received: from [10.12.4.21] (port=56940 helo=smtp42.i.mail.ru)
	by fallback22.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1sig2B-00Fu8N-Cd; Mon, 26 Aug 2024 23:09:51 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To
	:Cc:Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=ilmNAnKKxEeweg3uWm2brVCV7sOH91NkrbsL8Az54xs=; t=1724702991; x=1724792991; 
	b=oE2JdHheHwBIF50iJ6I4cLDUaJdYUPGC+sZCXgZVQdicapFz2Kf9HzmfErEBaQk/a2jy8ilDAcX
	U0e+p0pzZeUnSGOfGZfHnGQiKhRe/4oml+T1c/S0n/tjB/T6kSnoPT+PCtOqAb66lInEJq53z0qaL
	lGlri7SZCJjMgVnjLUo=;
Received: by smtp42.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sig1u-0000000DUOL-29qg; Mon, 26 Aug 2024 23:09:35 +0300
Message-ID: <d31553a0-b132-4766-ac9a-482c9741279d@jiaxyga.com>
Date: Mon, 26 Aug 2024 23:09:10 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] ASoC: qcom: sm8250: enable primary mi2s
To: Jens Reidel <adrian@travitia.xyz>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@mainlining.org, danila@jiaxyga.com
References: <20240826134920.55148-1-adrian@travitia.xyz>
 <20240826134920.55148-2-adrian@travitia.xyz>
Content-Language: en-US
From: Danila Tikhonov <danila@jiaxyga.com>
In-Reply-To: <20240826134920.55148-2-adrian@travitia.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9B598A67DFB323527D48FFF5EF22321F878691CF7956759E8182A05F538085040C4F1C46E9BE3493DAC8EDD30083ED68E52CAA46F094D7EF06387C59B9F8F67A3CC29A3283896A6B0
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE743A67C3F703598BFEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637D24CDE3D695BBBC6EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B043BF0FB74779F36FC7603D7D7DA14629B0EB3E6C23E510AC614157694A2C2EAA471835C12D1D9774AD6D5ED66289B5259CC434672EE6371117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE70F3DDF2BBF19B93A9FA2833FD35BB23DF004C90652538430302FCEF25BFAB3454AD6D5ED66289B5278DA827A17800CE70C93C844AB25B962D32BA5DBAC0009BE395957E7521B51C2330BD67F2E7D9AF1090A508E0FED6299176DF2183F8FC7C0FD819E82F1CB4899CD04E86FAF290E2DB606B96278B59C421DD303D21008E29813377AFFFEAFD269176DF2183F8FC7C088D2E8BEBF93D4B068655334FD4449CB33AC447995A7AD18262FEC7FBD7D1F5BD5E8D9A59859A8B6F82A78844E5C6993089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: 0D63561A33F958A5E9988FBB8A8C66425002B1117B3ED69627A8CAB2A2024D76466072E6821086B3823CB91A9FED034534781492E4B8EEAD8D8BB953E4894305BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFF5F1E4C4F712246222B7216557DFBFA7D0D8DF8E3C4E7E7803E8075B400D3F03506ED036F265C5428CBD875B35315F9A8B23EECF961B6CB091A3EDCF40A9E60E2F85287069806F0C42BF32D1DA1046D202C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj/M7/1rzOD9un0x4JxBuqlg==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981FA4D19B1A53E9A3AA7CF1FCFAF80C0E94883779FF0B09D57E7C767D26902A0D02C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 78E4E2B564C1792B
X-77F55803: 6242723A09DB00B4E352C08110291256EB698700D5CD5493965B77B4ADB569D9049FFFDB7839CE9EDDD06FDA38415CFF53DD720F8F2F7ACAB66926C3599D367FAAF2756BD0131C69
X-7FA49CB5: 0D63561A33F958A52BFEE871C33970129030361B7581A5160E0E99AB9833E5EE8941B15DA834481FA18204E546F3947C629BAC65E8BCEBC0F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637EDB6B411A17B440E389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C325AE611EB865B371089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj/M7/1rzOD9sUNTBP4WUakw==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

On 8/26/24 16:49, Jens Reidel wrote:
> When using primary mi2s on sm8250-compatible SoCs, the correct clock
> needs to get enabled to be able to use the mi2s interface.
>
> Signed-off-by: Jens Reidel <adrian@travitia.xyz>
> ---
>   sound/soc/qcom/sm8250.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index a15dafb99b33..274bab28209a 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -55,6 +55,14 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>   	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
>   
>   	switch (cpu_dai->id) {
> +	case PRIMARY_MI2S_RX:
> +		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> +		snd_soc_dai_set_sysclk(cpu_dai,
> +			Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
> +			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		snd_soc_dai_set_fmt(cpu_dai, fmt);
> +		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		break;
>   	case TERTIARY_MI2S_RX:
>   		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
>   		snd_soc_dai_set_sysclk(cpu_dai,
Thank you. I use sm8250-sndcard on sm7325 and it works for me:
https://github.com/mainlining/linux/commit/292a1ac9f093c639363f257e92d313489ec5a394

Let the maintainers decide whether it is really fair to add this tag.

Tested-by: Danila Tikhonov <danila@jiaxyga.com> # sm7325-nothing-spacewar

---
Best wishes,
Danila

