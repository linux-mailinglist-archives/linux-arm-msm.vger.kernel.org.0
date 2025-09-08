Return-Path: <linux-arm-msm+bounces-72603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A22B49424
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 17:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 727541887948
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 15:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 228CB30E0D2;
	Mon,  8 Sep 2025 15:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m3T5nNp0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B5230CD9F
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 15:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757346332; cv=none; b=ZfdxgKODFf+pr6evl2qP/S7pORgz+6U6Ic7y3iwgf4wuyXeWCvxJYEL0pqD3gGdEQfFWHGiiO1eQxVE9Etd3xGlGV2eKPP+3AzYEtAen0Xkx3TYi3ouFhmzf1w8lxRWNdrBKT3q42BFSZF5POf8ogI6GyCNVKYyOVE2fdPyZDdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757346332; c=relaxed/simple;
	bh=nJIebvcyngyJZ2+UfsCZceP9yS7NAjwxq6xcYNWN6dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r5QGbFeKt+5AoHrAxQzlfKLAak7Ly0kMNcGBKL0qqQXWQ4foNJOHm7vCSrd82vk7e5ZfPNsb0kyjhfoovm2xMuVGVv0HCcUsutdqZFHxVL73YG7d6YXUcgnRSux+pyWFynPWgp7RAskBHczKY7uToZdQ2c9/9iuCZZJ4KYWTQxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m3T5nNp0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5888xF04012802
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 15:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fMNRlKzBZ3IefkcX/KGz68yVL5VtqThtJH2q7iGmDA8=; b=m3T5nNp0HlxJj0Qv
	VkssrGVMFG/7TTFyE+uhTBdcNcA+x+0gG+bRZ+Hh8fZHQK9mUlH3T8L3hGBDowZ2
	p0LOg2aTbD00H6MgE7vQh06CR23yaAVHHtknSrsuNRapFfG6qjZIBKosM+n93kUC
	ozSkzuyrR4wq2kOzuPbjxxSxaot8DJfArcsI/OvXRBkHZeRabn0f9k8X+i6ZfT8x
	yKJ4FD0J4yzUWmeM/+61jW3hwKeF9ceIOSPB4R/nFLdj03vCSEY/WXBZHS3AlkNe
	Ctd7eaW0liAmqp6T2VJiNlQa1j9sdwJKRB0uoFxuW/tGNyBF97oWyuaWqQu05vEV
	aX7JNA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws56q8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 15:45:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7507804a7f7so13870956d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:45:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757346328; x=1757951128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fMNRlKzBZ3IefkcX/KGz68yVL5VtqThtJH2q7iGmDA8=;
        b=q3uGmUt4g1JNEIx+f04LZLJ1aHZgxDYEQJLgTNI5muSOyFnaBLZrGOx8BsB/0f1Bq4
         RTG9+pAFj4YUF8DJgVi3dikxLI6VXihQ0icJ8eC1Ba/uVHM/ts+3geXy0vA/7keqC+lS
         d6cjdxzcmVCU3uV/XKyriHEEV/1iG3U/DlEmqRPkcUQ1IRQ/+U5tNDfSmRUlQ4UMDscQ
         1xxPDoBW5tqAwlpACzhetv+IRQOR9BTtJVJukeiC41tE9PpmBQC77XSdZggolhiZsYbQ
         oDOhgY/+bby+xQzRSUbtUSCbAv7E2xR7NfNFG5RKSQ+3vSxvcA8ov4PLdCyZK4FXlulH
         nLMg==
X-Forwarded-Encrypted: i=1; AJvYcCVvSc//OGedudnJaQjHpq31O2kD6gXPou2wfeRxA/XjPGsl1siw6/eiEf4x0mKNePBRr63iL/S09njqnv1d@vger.kernel.org
X-Gm-Message-State: AOJu0YyY5+8chafNMoqXZ8WpMLjv1TULEOQt4C2EblZHBYFChc2xOaPA
	Ocb3rbTL2lcEGS2TIdiYx+9qkaj/SEtdpfj20O7O3APTsTgezv38eO7JgKytQhJ2waY524nijbg
	vJ971PoOoFmqSuxOgDtY8lfUFX3xcYQr9x9DeZMfEw01raAlzEK4Km37xJqLeiFWL1DWN
X-Gm-Gg: ASbGncsoZmAuuyM06fCH216gYqJVaB7O36Pfo5QIpcobXJNuWktuoG2zLB5IWRnI5nu
	pmNpe8nRBPfPpRhA1i9QFqQr3Ypd3sgXs3rhCv01Lit/wY7eNn+UG+3kIPJIbSaGakUSUpJmEMz
	gpjV0ddtj/NUd+kfGi+P6WXEYzYm7MhJfP0WCOxu6qdE+6OMII5DSs6uPZhda3VOLJ1NbIve3RA
	9/YVjPbBkkuHvXwscPXivYMT0mWbwvQ13fBF5vgFqFboQ7UWVgw4nmPv0dOE6sN5J3gUr+dtFn+
	H+GXj+GXWu/1YQzrEgHM6rmrBIr9BPuhSJTXHtu52mtV1tEBKSXtp/yMcTIz1e2N4zE=
X-Received: by 2002:a05:6214:1d24:b0:72a:2e5b:af2f with SMTP id 6a1803df08f44-72bc5746fd8mr136887816d6.30.1757346327974;
        Mon, 08 Sep 2025 08:45:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtI2W+SVe5jgIkKVJegNqUo/KHDwuBa+slvMvbAKTs7rlFU/MUiVUjxng1HuQHTtLbnh2XdA==
X-Received: by 2002:a05:6214:1d24:b0:72a:2e5b:af2f with SMTP id 6a1803df08f44-72bc5746fd8mr136887186d6.30.1757346327206;
        Mon, 08 Sep 2025 08:45:27 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b7e92a42asm447523425e9.20.2025.09.08.08.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 08:45:26 -0700 (PDT)
Message-ID: <690423ac-4283-47a0-9250-4c740978ccac@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 16:45:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] ASoC: codecs: add new pm4125 audio codec driver
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        christophe.jaillet@wanadoo.fr
References: <20250814-pm4125_audio_codec_v1-v3-0-31a6ea0b368b@linaro.org>
 <20250814-pm4125_audio_codec_v1-v3-2-31a6ea0b368b@linaro.org>
 <df884334-c850-4ae9-b5e8-63cb834ae259@kernel.org>
 <DCNIVW9XSSY3.3H7TSNFDH7TKT@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <DCNIVW9XSSY3.3H7TSNFDH7TKT@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FjeY-wR7F9TtsTLLdwTrpfHoCM3VEr6j
X-Proofpoint-GUID: FjeY-wR7F9TtsTLLdwTrpfHoCM3VEr6j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX8zi3miazdTKm
 KcRIeXbkRkkgVVsvvyph3CnOx9HxgbSEjeFBBqN2mJ3KDYnkloio5voFuhkvRCzVPxIhC81qwHK
 CmG8C2xmHWuV054i9MMry0zfy9DhUfby7fsa2+p9bkhOltfLBEqzq0HqPyXivHg+MMG0rWdWTaV
 mcop17jWGQUCFIUtnpYXhmajivzV8vGT0V5z6ORL94Ysl1cf2EzoiEkHRJeAc+ANkBPMRUzA6Bi
 7BEsrFgKlKOCBJVazi9HujOIsDIi/FXTiBAGuLzNrH0IfwKgJh71LTCscavdxS/S/bC12tcpQp2
 Ntdtkx1YERT34tFMbiqh5bN9sevZewaJsEGr7x5Q38Fz6PrNPxsFt1YJi2+u1xnsn/DpFLR+TxX
 ZSCJjiBy
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68befa19 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=ENUQA5pCW4QF4dO5OUwA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_05,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

On 9/8/25 4:26 PM, Alexey Klimov wrote:
> Hi Srini,
> 
> On Fri Aug 15, 2025 at 4:36 PM BST, Srinivas Kandagatla wrote:


>>> +static int pm4125_codec_enable_rxclk(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol,
>>> +				     int event)
>>> +{
>>> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
>>> +
>>> +	switch (event) {
>>> +	case SND_SOC_DAPM_PRE_PMU:
>>>
>>> +static const struct snd_kcontrol_new pm4125_snd_controls[] = {
>>> +	SOC_SINGLE_EXT("HPHL_COMP Switch", SND_SOC_NOPM, 0, 1, 0,
>>
>>     SOC_SINGLE_EXT("HPHL_COMP Switch", PM4125_COMP_L, 0, 1, 0, ?
>>
>>> +		       pm4125_get_compander, pm4125_set_compander),
>>> +	SOC_SINGLE_EXT("HPHR_COMP Switch", SND_SOC_NOPM, 1, 1, 0,
>>
>>        SOC_SINGLE_EXT("HPHR_COMP Switch", PM4125_COMP_R, 1, 1, 0,?
>>
>>> +		       pm4125_get_compander, pm4125_set_compander),
>>
>> This is same issue in one of the WCD codec, which am going to send fixes
>> along with my original wcd fixes series.
> 
> So this was in other codecs for years, right?

only in wcd937x since it was added.

> 
>>> +
>>> +	SOC_SINGLE_TLV("HPHL Volume", PM4125_ANA_HPHPA_L_GAIN, 0, 20, 1,
>>> +		       line_gain),
>>> +	SOC_SINGLE_TLV("HPHR Volume", PM4125_ANA_HPHPA_R_GAIN, 0, 20, 1,
>>> +		       line_gain),
...
                          PM4125_ANA_HPHPA_FSM_DIV_RATIO_MASK,
>>                                       PM4125_ANA_HPHPA_FSM_DIV_RATIO_68);
>> @@ -309,8 +307,6 @@ static int pm4125_rx_clk_disable(struct
>> snd_soc_component *component)
>>         snd_soc_component_write_field(component,
>> PM4125_DIG_SWR_CDC_RX_CLK_CTL,
>>                                       PM4125_DIG_SWR_ANA_RX_CLK_EN_MASK,
>>                                       PM4125_DIG_SWR_RX_CLK_DISABLE);
>> -       pm4125_global_mbias_disable(component);
>> -
>>         return 0;
>>  }
> 
> This doesn't work. Playback has two issues: 1) volume is very low and probably
> not adjustable and 2) sound during playback dies after a couple of seconds.
> 
> Returning these global_mbias() calls restores the good behaviour.

What is global micbias to do with rx playback? Maybe something is missing.

Which RX path are you testing?

I am testing this with Headphone and Lineout, it works for me.

> 
> Maybe let's make a widget out of it? In such case I am not sure about
> routing meaning that I not sure which paths do require mbias enable.
Not sure why RX would need mic bias?


--srini
> 
> Best regards,
> Alexey


