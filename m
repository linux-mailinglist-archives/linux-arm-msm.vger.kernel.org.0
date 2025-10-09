Return-Path: <linux-arm-msm+bounces-76596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BC107BC858E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 11:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 477014F1AAA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 09:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D55C2D7804;
	Thu,  9 Oct 2025 09:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dLuQV1FK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEABE2D73B1
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 09:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760002879; cv=none; b=cBEGaMMKWvMW4IqMMMrMZJE/tYJvf5woz3HDWgIJSXCEMaEjqRddN21PeBdbNF0sOwmcBG0Ru5lv7LuJEqZR8Z4cyYLVoTPbOOB4Mn+t+SNPm/KhVqMGRaiPHwDvVSt2pzWgmYrpi5mOmkE4yjP9BrDgUYjvXa8RkQ4kHe6n97g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760002879; c=relaxed/simple;
	bh=cUHx9qgZFQYGZ/HN+MbTOeqQQ1J5kKxuW1Jd5pKcnEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hQ0UoH1jv2XzLzXKDy6DLJ9fck5RWqzJgsAHRZgGegBbpwybDC0iTOeXnsebGiC1lneqpx0FJ+EpBUxWRmvYvH25G554xaGEfkAqDvl1DB3mBmRwVcbqVOC6qUcYSLks6LRObENt1GjVJ8gLHc7RXNoWOhAP22qfM92xICc3Jr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dLuQV1FK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996Eg4p022541
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 09:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HifFETgbzrd86Mja8ubAMcZowhzvoZfzV3gSLqhMB/k=; b=dLuQV1FKz6rJlEi8
	k482NDgHQgwX1JIVXe+T0mgfdWCpEFVuAGd2P8FeMYvcHlMaJfFx5PYX5kHWEIue
	DZct4qToTOiZDO1p2AxZGJd3ghTiPu1fCudxHu5V9c701yuHKv9s100hftyyKxXC
	DoKav/eeZ4AAxV0B0i/e/ir1WFeorOlCSAF+EzmcrSp2BPe4yH5aHiAoE2YiZgcQ
	bw/k7GWFrmvV6FNtRl4U8RdgzIFDguMtvE82QsQeZSPtpRPIOADvH/fcW66aibcr
	jvD3EvHVJzJGY9QpmqqEQ0EGmG0e0QvlSE67ubfHEuCcfy5GKGOV40zPRfzuGemZ
	igSZtg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4sj8wa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 09:41:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-85db8cb38ccso28997285a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 02:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760002875; x=1760607675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HifFETgbzrd86Mja8ubAMcZowhzvoZfzV3gSLqhMB/k=;
        b=w2oIeZJ8sLAVLvR6EpPignAli4WSw8j7xz7gGzRKV63WxxiGyYpoLjjW8PfyHu26Um
         BG0b84Bvo2iqd2b5PM8uEQlfPlQyMwl370KWRVvkNqcW0ScCI6g7AscaxDJZXkp2Gqeh
         PWfuXzMgtUtWNcBgmqGnP7Nm1LXovEWAUym5hUk7l7wL6O8T3BxwxXzH33m2xns6zJri
         uW7b4w/zK0L01+zqeF+dsZerZB6gV3dMbmYbWNdNUYEjniI5ssdDYxSvVLOg1xTts0X2
         V2y/VXBCUSgHykxKFSkWZujoHuajCpi5D7Gq4QgqBMuTyaPrdZPv2QgUS5/dAtP82LPt
         fLnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOhPOWMqniKm9fiQVI2MlTYRonZWIzCghnulieuQBfjIPlsL2a9psD0Xum0Y+w3rEZ+7XM2lwbz9CoZ1Dv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Qji1GEwf2t2hgtPty+cMGPsS06UnlTMXKUcY+6mmznOu89pX
	2xr1apZDK4uAokwXU4iWZXYaIQuBe9T1QPs7yWWgC+vkAjuAj7qlCr1jz28YWqo1lW2R0XpnugZ
	lwI56yfOUXzdFiTYvtXYqDlq34mErcAFWhZF4fPn57OVyS8HQ50JBTOvVSl9rgr7hxwpC
X-Gm-Gg: ASbGncvzG9eYW6MTOOjNyRdeT4Njauslmmop3GmHPAFUe0pG/yPCBuaDFY1zfCzb5Ho
	aBEDiRB2qA+YQP567DrVk4VolD7P0hNP6ai+mbgDt5g7euY4DrBEX1afQHCx78MMAITlD891PRt
	W/9PLOykQ++nIoU4iFvU13ag8N1jY7YUDJ+TZGB1xW1My1Bz2HSf/nBZaqyfQbnucen6IVpIyrS
	vhqU734mpKhCM2kbvXW73S22H5PTrILGAZM1EjxlzAXcG+vQ+XWhL0W7YV7GCV+mkhcLOHWh7Va
	lO8aQAAVvTyNyaQC7feaab7ESJ391eaDp2M3IxO9rGTU5hrd6liup6e7p3txXfIj6CUyB6ymcHh
	8tCEhYK7va1HrLkp45dZ2PAc0Z74=
X-Received: by 2002:a05:620a:269a:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-883541153abmr646448585a.8.1760002875424;
        Thu, 09 Oct 2025 02:41:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9TW5+PphA9Jk49AdyjnYbWQHthAzam3yq3zLm797shLwnfsPjaDRo3Y89qy+Sz47r2yOFPA==
X-Received: by 2002:a05:620a:269a:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-883541153abmr646445885a.8.1760002874779;
        Thu, 09 Oct 2025 02:41:14 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865e7e8cdsm1867720966b.38.2025.10.09.02.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 02:41:14 -0700 (PDT)
Message-ID: <630bb2b0-0ab4-4083-96a2-9aa485041797@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 11:41:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 3/6] ASoC: soc: qcom: sc8280xp: add support for I2S
 clocks
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251008-topic-sm8x50-next-hdk-i2s-v2-0-6b7d38d4ad5e@linaro.org>
 <20251008-topic-sm8x50-next-hdk-i2s-v2-3-6b7d38d4ad5e@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251008-topic-sm8x50-next-hdk-i2s-v2-3-6b7d38d4ad5e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oOpI3dkA3N-r0ytJgDQkqTYPv6qcChqq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX8zAgE6hQTE/F
 sIyRQugY1y10kgsfl7GezbUovu6fXkf72hakrLMF+7v10b6BVRUZ1eZR7Yu4UzbMnFL4uEqHV8U
 nRIpeIJgesHuyBVcy7wAH/XapJQjNrcLvOAu9kgtXFA4EO3WiNE2snyWMlCHledvR+6BPa1FVZU
 HeZ6UcdYys6Ofo0TzwDqAYUZMg4LnR82BPnexlvYzgUUS+KyS7XMgWsWxmekagKb/WN8HQt4LbH
 SvDZy5TslXffkBT0aUI+R+YBlkIRW4dCiOcolZDd0JRW2nHSs2pqvdcYWYKQKuQF2qi0rjzbgGK
 yS6GyIVltr3XEJc1ea4i0I+uzxfUOyTTGPNuD5xhQ/EQ9/KkPvpXeAb4mgEUzkC5x9Q29UdSIe4
 Fn5Jzs+Jb9bWucUpwda8vRIqHB/v5Q==
X-Authority-Analysis: v=2.4 cv=SfL6t/Ru c=1 sm=1 tr=0 ts=68e7833c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=hmOrbv2CecBtpEyMAQYA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: oOpI3dkA3N-r0ytJgDQkqTYPv6qcChqq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/8/25 8:56 PM, Neil Armstrong wrote:
> Add support for getting the I2S clocks used for the MI2S
> interfaces, and enable/disable the clocks on the PCM
> startup and shutdown card callbacks.
> 
> The rate can be easily calculated since the card forces 48Hz,
> 2 channels at 16bit slot size.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

[...]

> +static int sc8280xp_snd_i2s_index(struct snd_soc_dai *dai)
> +{
> +	switch (dai->id) {
> +	case PRIMARY_MI2S_RX...PRIMARY_MI2S_TX:

I have mixed feelings about the range syntax here.. it's only 2 entries
per and it's quite error-prone (no errors in this case, but it
encourages the thinking that things are always contiguous)..

[...]

>  	switch (cpu_dai->id) {
>  	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
>  	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:

whereas e.g. here we see that it's not really the case, but it's
tempting for someone trying to 'clean up' the code to change it to:

case PRIMARY_MI2S_RX...QUINARY_MI2S_TX 

and the reviewers may not catch it

Konrad

