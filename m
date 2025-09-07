Return-Path: <linux-arm-msm+bounces-72433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2E0B47B70
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 14:48:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9666189FF9E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 12:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8881DE4CA;
	Sun,  7 Sep 2025 12:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iXCNPexG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9878DF9D6
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Sep 2025 12:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757249293; cv=none; b=tjJd+OhDaQzbj6l4zmngxCcwsM46f1QJecS8DA6XjzQuNl72YGqcfWfTBvVdG2iDB027YJluAJ1CM+3aKORiU8MHsXDieoTCxjAWtQuUxVAMQf+qlqjfum+lP9XsYkcYO5qbNOBs/xqcb6itF8P48Jl3yXLOpJPgX/V6GxSU0Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757249293; c=relaxed/simple;
	bh=fovseDpu+uBVSyhkPuz3suEFYJtmdGB3aLws1MqwV/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RmBplfzWMOLHPQwH8RDnd1KyZeXzQVjz9m20wyPNPMYuW95hAnCjM44EhE63dGSnIKjPqovCnsSczqYQpjyE5I7jLAj2nrv7X/pIP15m8eCcDuIH+fYYi2LXr6jo6HoIVkjCnpf09vCEGA+7HWA5i2kwlGQf0rSPbLD9sKcQR9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iXCNPexG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587C0FGm008303
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Sep 2025 12:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pfAmweq7JyBuIK2YLoea3uL1qJZjl0HZWJilg59gpOM=; b=iXCNPexGVnqjEcB5
	P527Jno7dswx6qeEqQNsuqyAM8ckrRJhKTDnflfzV7vgDmw9P2GUtv5u6bIN9vja
	8e5sYYjMwgUhas75XLDhK3PYL8N80ssjVLpJR2uh7kbiXLzBfYDuzWN6qkGn31cK
	PLMxu95wtcMla57HF/tmJubrn8kuMUiRL41kWKgQEpy4AGwRM5LJByIiYxF8koxY
	onu0KfDjSMOGTBqtViZli9I6vwXOvquICLqYtMcHgwKZ8lJzFDMc+iCzCt8XEgY6
	2geBnMQwmOz05n4EjXHTW3y97yVYiVnBjiwwCzbLoC7OY1Hpv0h2u45QXyi3HG11
	m2emAA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490anfa9p9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 12:48:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7723d779674so3131731b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 05:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757249290; x=1757854090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pfAmweq7JyBuIK2YLoea3uL1qJZjl0HZWJilg59gpOM=;
        b=K/kNiUjF2mTd6PJ2RrU4aGbHkQHI39a2dOYwrLfB0U2BqHrjuigjj22Ods9vqznQGw
         IzsRJLgk/s4Q3sh0RCD3NEoXjAyLaiVfDugTnpH9m4iXitnep1o/CTBX2CVG35lHIYkK
         /ytTCpD8LpjLct6g1/EOWepR0WX53zaT7xxfqYrQ0MnHZtPc36rc2K+5J/uXhY4OODoq
         hZI6XqEtTS/Gaodi5qkmxtLYbMPAkW4K4TZ7nK9tIp/C37JMPKCvgsSpvzfjX11qYUJS
         LBQ6l5tq3G8boYzDYVWrMROQT13KBb2lOiRbC+zLSUS5MaOuRinLML7YaAeEHobNY2wG
         Noig==
X-Forwarded-Encrypted: i=1; AJvYcCXHB1/UFy7yBJkiaYGmyf3wwW7CDDkp05Lclr691OysKg2Y1R84ojO1NqTFDjV3scN+uOqqUE7A0EIE0Hqa@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1cyw2BzZY1NhuBD1aramtjoHBnmTvVUoZHf2ei8Id65xS25J6
	f3YtmW1GyyOmrfIKRKkFx8WJBw7b+gAVGL1H7ugWlbpW84kN/d9lTNYODFFUH8DZjfQLSWqtSkV
	XS0xOZvh4PlFWsxBWFrDssYHp6ISy1wy9L2gCG576Cv7rt0CC7JEiNUnalYMXFW8r8Tof
X-Gm-Gg: ASbGnctwW9mjyyzCMhZfZwSCU34PnP7CCIk5TM9U75+u+SutsTYWUMke9rQADAAfOg+
	+EpenOMw89edhvgs7JZ90BE3swe/9Da7C5woAoKn4Wgxrt9qyMC/3kjNuNYdYuNZPHHMkEW8AWy
	bG60ypdypZoqjtP9Ybw04YOTAqXxXkkkz9K/f3jHWnjv5bG1Or/nnLfVSMzhXct03L/lRzAnFkq
	SUMk4eqtNXrze++DICd90/8wbeii1AeEKpAvEtncT3aRqsLVUGFhptrxEqJ6g7bc549dKWCk2Od
	4ABi/GT3VQvczmWHyhSfpE+PPvgINnHsFLdaqGMtz3U+sURUV1Oj8FYA7x+SdqBqF+7E3LyBUqi
	q+07l
X-Received: by 2002:a05:6a20:3943:b0:243:f5ba:aa9c with SMTP id adf61e73a8af0-2534073ed6cmr7506767637.25.1757249289780;
        Sun, 07 Sep 2025 05:48:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENWjF4ugvYWq1kcweui34vJDpxHEqv2vVeVqYw4aUXOwqNAELGDOT7480x/k7bScPoBqYfsg==
X-Received: by 2002:a05:6a20:3943:b0:243:f5ba:aa9c with SMTP id adf61e73a8af0-2534073ed6cmr7506730637.25.1757249289290;
        Sun, 07 Sep 2025 05:48:09 -0700 (PDT)
Received: from [192.168.1.5] ([122.169.129.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4d6cde2f0fsm22929103a12.13.2025.09.07.05.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Sep 2025 05:48:08 -0700 (PDT)
Message-ID: <eaa235f2-b6be-46e9-bee2-1a4818736d42@oss.qualcomm.com>
Date: Sun, 7 Sep 2025 18:18:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] ASoC: qcom: sc8280xp: Fix DAI format setting for
 MI2S interfaces
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        kernel@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20250905150445.2596140-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250905150445.2596140-4-mohammad.rafi.shaik@oss.qualcomm.com>
 <899db9f0-27f5-4404-8357-4985e084ac99@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <899db9f0-27f5-4404-8357-4985e084ac99@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wxv1MB933ohiLbbQYHBhdHDlMtDvv6RB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwNCBTYWx0ZWRfX6A4JSEW8IPqf
 Y3nv4F8yeZmASxXJljF61jQY9d4h5Oe8p4q6wi+OvZN7Sie6VbAhpIV6sITs4jV6scoVEiJgptM
 Og6z4H8bmvAXdOYZRR4wdap5Y3m7RAJUmjGPbJtc1mEnchrEu9szzZhepmDHJPKPDMbJbV87lTq
 AkmOwYghtm0jLS9Ocr38yQaEs34+9Sltw53LZ1bKNAaajV8tMK+C5KXvzTSvRfk20gAJXETEvNg
 vUMjQozMJWtJCxvYy0u9jhjKmZbeWVQ9w7HXxTF0gjiyN62Xfau5Xa/pBMt4LaZgGBQNVLJbAFg
 z7GdgmYwHwr+bOzxpXDdWxOTosZo+5b0ABJyzq4y/kTxJU7F45HHe5El5gsjepX2DZP5hsurfjp
 9HmtQmfT
X-Proofpoint-GUID: wxv1MB933ohiLbbQYHBhdHDlMtDvv6RB
X-Authority-Analysis: v=2.4 cv=CaoI5Krl c=1 sm=1 tr=0 ts=68bd7f0a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=/ZFYPCvVo1eZwIJTb8k6Sw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=YKXIHFROM69d4h8Ztm0A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060004



On 9/7/2025 3:30 PM, Srinivas Kandagatla wrote:
> On 9/5/25 4:04 PM, Mohammad Rafi Shaik wrote:
>> The current implementation does not configure the CPU DAI format for
>> MI2S interfaces, resulting in -EIO errors during audio playback and
>> capture. This prevents the correct clock from being enabled for the
>> MI2S interface. Configure the required DAI format to enable proper
>> clock settings. Tested on Lemans evk platform.
>>
>> Fixes: 295aeea6646ad ("ASoC: qcom: add machine driver for sc8280xp")
> 
> Am really not sure if this is a fix, because sc8280xp does not have any
> Mi2S support. If you have added support for MI2S on any other platform
> that uses sc8280xp machine driver, then that is the right fixes tag.
> 

ACK.

You're right, thanks for the clarification.

I'll update the patch based on the inputs provided.

Thanks & Regards,
Rafi.

> --srini
>> Cc: <stable@vger.kernel.org>
>> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   sound/soc/qcom/sc8280xp.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
>> index 73f9f82c4e25..3067b95bcdbb 100644
>> --- a/sound/soc/qcom/sc8280xp.c
>> +++ b/sound/soc/qcom/sc8280xp.c
>> @@ -32,6 +32,10 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>>   	int dp_pcm_id = 0;
>>   
>>   	switch (cpu_dai->id) {
>> +	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
>> +	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
>> +		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
>> +		break;
>>   	case WSA_CODEC_DMA_RX_0:
>>   	case WSA_CODEC_DMA_RX_1:
>>   		/*
> 


