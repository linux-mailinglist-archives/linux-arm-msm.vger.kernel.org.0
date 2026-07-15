Return-Path: <linux-arm-msm+bounces-119196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fmLVKjNXV2pxKAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 11:47:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F37B675CAD4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 11:47:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="C/Y5Vh9G";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BRdegl71;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119196-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119196-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5D743009142
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A811C43A805;
	Wed, 15 Jul 2026 09:46:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CB242BC58
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 09:46:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784108815; cv=none; b=cLnoa5m6X/1jSjfh9bQ6WK5PS/k/7Nh1lXw4bilf9F3eG4gdzJjbiH2PhofeonLIdRD2TyWphhwVXxi6m+s6pjoIAFqiAjoVF2Hx4PKF+gP6BSNB+CF16rTIHeCezTJxSguKqpcy8E4PFTs7Bh5iYBJFTWkEYl4MTxgx7Bn6zqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784108815; c=relaxed/simple;
	bh=DVHlqR13RKKSicyNlmQLuQKCabNOtP0RQfhHOijiZ/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g1nGgfnO+cf5xiaGs+Sz6apZixdD5thAqhSI35hEYBDd1yfnLuTl0SsdePLB2Zf7U//BxeJENYHs603lff/cPlKCwurOOM2yTY/SXY42aVDmr9S55SYsX7Jz7GRO4ken9yyddUn2K/m3j8586rFeeyqZNcGa71qjuYT4s9AxlLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C/Y5Vh9G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BRdegl71; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F7mQxW3142983
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 09:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5U2dKNr880n5H4mqNL7E/1ba8CM5ns5ZA6U85j4NUqA=; b=C/Y5Vh9GLv2p8A7z
	yEEjzzhODb8g3+dXWTV2EkTieNoNpUj2TyEUbLzGCt5K9SmjPep97sNqWYQ0+2/3
	GTgEsSRj3ryR2IV7N8d3N3SSWtvIuTNXTBjGMpZ+3wAEdOCrKrZo9RIGCqRmvBtI
	r+VrC6sLQLa+YKhud/sjqwB8gbG3YciBHiiIopLf2omc98QgYRBT2hCCcaDcQj9u
	SrYW6Pmi1nDfxYLYuHjJEE7Qmv3Hj5B57aQ+X+tV57251Uj9m7PwxMnKumO59C1N
	T577cEv/MEMN0sfZ4fMa7yb6lmBEqdFEMJsfsnVhw/7mJ9LFjAnXdluRFNpT/w8a
	JQlTUQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe6528e77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 09:46:48 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso12641250a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 02:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784108808; x=1784713608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5U2dKNr880n5H4mqNL7E/1ba8CM5ns5ZA6U85j4NUqA=;
        b=BRdegl71T6wOulYbxLtNjGerfKE90f6aPhp+fenrRbdG55iLm9/P73BczLuSmAJsGb
         YgZWDzNQodcSHIZ1lfZgapMuHNLYdyVQEC0Fuxfc4OOWl5khbtxvny6VrJqHJnom6aZk
         OvkPoWHZpcosjSFWqHMPDM7VOnTIXtKPSUx3XxAMeAFi3ArlXhAISj2n7GyeMYvGplap
         xrx16hAua+ukn33pTY1KMKux5g8L5l0oI2JaXiuHQ28sNmrHcoXWZ0yxln946KKt4dgL
         Rt9uRJUO97iW4gcor8pWB4LG9OWfe4CInedtxAdnLGXRt0+0p/mPKczm82bbmulraB7E
         K5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784108808; x=1784713608;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5U2dKNr880n5H4mqNL7E/1ba8CM5ns5ZA6U85j4NUqA=;
        b=lx7WbwT5Shr2kVkw7d5jkz6v/CskntmB1WsIQgvwrTHLPOosHFQUeGtAIERBWw0saB
         oZFpptELI1YilIe14T++1RXCXxTVEcGctgLR+9CX4GQlJAgsWFAyPHl3ON7mergJkpKX
         r8Hff5AMKb0WJVInR7VYEDblcV+kjzJjUIoHpelz4L0NWWTr00S8/+bJBhECISrpcTjq
         jhXaR/LSJCmkm7vwQETIMsYkgsHkupwTBU0TdDmolpiwoyUw/I2ZiQiZu6SP/XXzhzHL
         mvC1ACVVJoUKa/VXe2L3f66m8PKKA7SmjropaKED4iROE487ThLitDMYXBrPXuHKzkqk
         ETIQ==
X-Forwarded-Encrypted: i=1; AHgh+RrM118JAw7G+L/DT8Iy6PqCpIIGlusZvOpmRpxM8nKmbdAQ7L3o6fouBf8X8vo/Y/aBQRGh56s8Ch5/z5Ty@vger.kernel.org
X-Gm-Message-State: AOJu0YzWNClhFFKx1U7O/GNGvCl+Ar+aqLgjyu/HTYS1SmhrishpHK9A
	rfIuBaNgd+KCccMUk3yMsED6kTnjIhbog2RxEbxdl9Mk+HudZ1toL8DN3XShEf5ttgRpp/d1sHZ
	+gisBU3GaqR9Kx5Ttoh3i6nCCv5RBDy4hZ1MSc8USnxdorzqBqk5i0Sz037ETBEmZZmj1
X-Gm-Gg: AfdE7cmcd5KiNGpr2eQBlx8zGtTf7xAdlbQ5X1ySzlJUB5IdyzEfm3J2fkiwEHYiOSc
	g2umW4lHmvdLnvCckTiU+ooDtDVHaWSWqE0HUTRNTYFJcwuWHGAgU6IqSgx8MCUIq8dRVV8MKoy
	ZiRRejRPBQ07xQbisvK5yNWYGQiT85cLRJzt+jCrpaIjQHweXS/HflXu+I4ZVT3WEGuifsJJCAr
	CRmINI10iqOLbI8E6hNN3U5Ug/ywb4o1GLIU7qkcQI5bHi9Tdjvrt49KbZOT+2M6cT1qmBvLcEF
	Zy4JLWSzpzY8o6GYYRedN2zBMc026cwDn/wEuUrO5qkzTZPMXAcYOeou9a9rc7oAA0Y+e8zfJpt
	4bk/DemGzC9CeI1U4FYwD9OyF8x85iiJqgs8z+1e+BisA
X-Received: by 2002:a05:6a21:3a43:b0:3bf:a638:4376 with SMTP id adf61e73a8af0-3c357001859mr6662622637.21.1784108808135;
        Wed, 15 Jul 2026 02:46:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a43:b0:3bf:a638:4376 with SMTP id adf61e73a8af0-3c357001859mr6662586637.21.1784108807661;
        Wed, 15 Jul 2026 02:46:47 -0700 (PDT)
Received: from [10.219.49.235] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118ee6091dsm109927379eec.14.2026.07.15.02.46.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 02:46:47 -0700 (PDT)
Message-ID: <48ba26cb-ada9-4639-8b77-d8cba2b31e22@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 15:16:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] ASoC: qcom: q6apm-lpass-dais: add TDM DAI
 operations
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com>
 <20260712134110.3306763-3-prasad.kumpatla@oss.qualcomm.com>
 <d104da3e-036f-4681-b9b1-dc3e44ea20fe@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <d104da3e-036f-4681-b9b1-dc3e44ea20fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA5MyBTYWx0ZWRfX0hp1t4oBvh0r
 3dZ/92pShqupgdQ605Z/TR9Zn+aQBxuZiyaLS83O/x/SYBxilwrIAr6GS59B9W5YFRL5SwJ+FDz
 AP9d3g3pF0e+Bu4xlQ6OrOtYjTqssImkDTZLZI/3/fdvb3GnMMxyb1iZo1um1j7LS5Jup4Lg0tZ
 c08isvenUQlVbC75VyFwMiUtrhBDekNVnzohDkwhSOQM2RctZSgHXUgJCcuqLudB/79KwvclH0/
 TV06y4rpyqBc+i+6l+3M9wLY5gPEqPK2ruMo3uaToMCnAQXVPwuMof5y628boDS+oxb9d+blOw/
 7pimsSh2BZU6QnHEZy2nBNBfvh4mMz7b89aSPPIbMHd8lVOLl05aH75vmPNaStho0kjNRQy4Bhv
 MnBfNnpXVBD6n+QGiJ7kqF7LHi+hrZQzHAxXwtbKnx1kcRrz4z2T55LDzHe1i40FAI5E1veBt9q
 NWYqEoQlb/fuRlPCexg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA5MyBTYWx0ZWRfXwV9RkyRgCBQe
 a8VOxbZ9t2Bg4WArZFpzqrLjXgSWueA/fB96pPlZ1k8FC02CyoLLmwSsOHZUtg2zFbLDaeZqKue
 /NKvjQQ1vsF8QrOTP95WuFKJ4HKB6e8=
X-Authority-Analysis: v=2.4 cv=bKcm5v+Z c=1 sm=1 tr=0 ts=6a575708 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1NWjRULo-yTEZTBn0VQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: zJU9-YbXIpD3_37mvnoHj2I-0UvpZGPu
X-Proofpoint-GUID: zJU9-YbXIpD3_37mvnoHj2I-0UvpZGPu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150093
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-119196-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_RECIPIENTS(0.00)[m:srinivas.kandagatla@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F37B675CAD4


On 7/14/2026 2:02 PM, Srinivas Kandagatla wrote:
>
> On 7/12/26 2:41 PM, Prasad Kumpatla wrote:
>> Add TDM DAI operations to q6apm-lpass-dais so AudioReach TDM
>> backends can be configured through the normal ASoC hw_params and DAI
>> setup flow.
>>
>> The TDM set_tdm_slot() callback validates the supported slot width and
>> slot count, stores the active slot mask in the AudioReach module
>> configuration, and leaves existing DMA, I2S and HDMI paths unchanged.
>>
>> Reuse the existing LPASS child-clock handling for TDM nodes as well as
>> MI2S nodes, since TDM backends also request optional backend clocks
>> through the machine driver set_sysclk() path.
>>
>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>> ---
>>   sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 57 +++++++++++++++++++++++++
>>   1 file changed, 57 insertions(+)
>>
>> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
>> index 5743586ff..672189625 100644
>> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
>> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
>> @@ -372,6 +372,50 @@ static int q6i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>>   	return 0;
>>   }
>>   
>> +static int q6tdm_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
>> +			      unsigned int rx_mask, int slots, int slot_width)
>> +{
>> +	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
>> +	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
>> +	unsigned int cap_mask;
>> +
>> +	if (slot_width != 16 && slot_width != 32) {
>> +		dev_err(dai->dev, "%s: invalid slot_width %d\n", __func__, slot_width);
>> +		return -EINVAL;
>> +	}
>> +
>> +	switch (slots) {
>> +	case 2:
>> +		cap_mask = 0x03;
>> +		break;
>> +	case 4:
>> +		cap_mask = 0x0f;
>> +		break;
>> +	case 8:
>> +		cap_mask = 0xff;
>> +		break;
>> +	case 16:
>> +		cap_mask = 0xffff;
>> +		break;
> switch (slots) {
> 	case 2:
> 	case 4:
> 	case 8:
> 	case 16:
> 		cap_mask = GENMASK(slots - 1, 0);
> 		break;
> ?

Hi Srini,

Thanks for review.

Good suggestion. The mask is derived directly from the number of
slots, so using GENMASK(slots - 1, 0) is cleaner and avoids
maintaining hardcoded values. I'll update this in the next revision.

>> +	default:
>> +		dev_err(dai->dev, "%s: invalid slots %d\n", __func__, slots);
>> +		return -EINVAL;
>> +	}
>> +
>> +	switch (dai->id) {
>> +	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
>> +		cfg->nslots_per_frame = slots;
>> +		cfg->slot_width = slot_width;
>> +		cfg->slot_mask = ((dai->id & 0x1) ? tx_mask : rx_mask) & cap_mask;
> Should we validate the tx/rx mask here if its with in cap_mask range?
That's a good point. The current implementation silently truncates
any bits outside the valid slot range through & cap_mask. I'll add
validation to reject masks containing bits beyond the configured
number of slots and return -EINVAL instead of silently modifying
the requested configuration.

Thanks,
Prasad
>> +		break;
>> +	default:
>> +		dev_err(dai->dev, "%s: invalid dai id 0x%x\n", __func__, dai->id);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static const struct snd_soc_dai_ops q6dma_ops = {
>>   	.prepare	= q6apm_lpass_dai_prepare,
>>   	.startup	= q6apm_lpass_dai_startup,
>> @@ -401,6 +445,17 @@ static const struct snd_soc_dai_ops q6hdmi_ops = {
>>   	.trigger	= q6apm_lpass_dai_trigger,
>>   };
>>   
>> +static const struct snd_soc_dai_ops q6tdm_ops = {
>> +	.prepare	= q6apm_lpass_dai_prepare,
>> +	.startup	= q6apm_lpass_dai_startup,
>> +	.shutdown	= q6i2s_lpass_dai_shutdown,
>> +	.set_tdm_slot	= q6tdm_set_tdm_slot,
>> +	.hw_params	= q6dma_hw_params,
>> +	.set_fmt	= q6i2s_set_fmt,
>> +	.set_sysclk	= q6i2s_set_sysclk,
>> +	.trigger	= q6apm_lpass_dai_trigger,
>> +};
>> +
>>   static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
>>   	.name = "q6apm-be-dai-component",
>>   	.of_xlate_dai_name = q6dsp_audio_ports_of_xlate_dai_name,
>> @@ -429,6 +484,7 @@ static int of_q6apm_parse_dai_data(struct device *dev,
>>   		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
>>   		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
>>   		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
>> +		case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
>>   			priv = &data->priv[id];
>>   			priv->mclk = of_clk_get_by_name(node, "mclk");
>>   			if (IS_ERR(priv->mclk)) {
>> @@ -490,6 +546,7 @@ static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
>>   	cfg.q6i2s_ops = &q6i2s_ops;
>>   	cfg.q6dma_ops = &q6dma_ops;
>>   	cfg.q6hdmi_ops = &q6hdmi_ops;
>> +	cfg.q6tdm_ops = &q6tdm_ops;
>>   	dais = q6dsp_audio_ports_set_config(dev, &cfg, &num_dais);
>>   
>>   	ret = devm_snd_soc_register_component(dev, &q6apm_lpass_dai_component, dais, num_dais);

