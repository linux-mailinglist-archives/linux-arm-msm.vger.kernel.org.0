Return-Path: <linux-arm-msm+bounces-87535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAD2CF51BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 18:57:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C08B301559D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 17:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2E52D372D;
	Mon,  5 Jan 2026 17:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kBTYcP7G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WJfjdw3M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A3033F38C
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 17:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767635835; cv=none; b=sNdoD+AlXmoUYTDb4fL+fRlBkhXSiC4gw61N+jPh6lrGJEdAHgTlI+uiM3BdNzCC9bSPbWtCl2Nnwl6Xqvd3ODcS1d7JWDZlPKSnNXsIYhF1IHrFoHy5I3pBEqFHZ/ZL/2dW268DXYYkFdHAj8n23gUiQmA+O0yiLXNswvzk4XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767635835; c=relaxed/simple;
	bh=pyEGqOvXdHfsPS8mT2RifqqvTmsMWYWxCpCvhaasfpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AAkktpr3MRm/VHFMqTh/BiFX9f26mQBYR8py+R9pMQbCVbwcJC6bfGMYfUDfSC+heuUHOOyivjU8xI0juhy5epzBxWTUvFkYEeTSBVsfmZFg0e/YW7Ao3gBSsOxdPqpXabf17Swh7aSlTdCwLNdRkuJ3s6H3j28PH35QvL4e+3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBTYcP7G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WJfjdw3M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605GK2PY3337814
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 17:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	luFQohOzUtSfFErML01fuIAdonSt43+90znEjAeHo9g=; b=kBTYcP7GTT32LIEU
	jBm5osAqY0ijXTXPYf4V7qJnig8su9EKz6kSpKk2PesX+ZD1FBeCkablOidbsPHO
	w1KdIMiC3TfWpe6zwIbCTXdH0xcT/s0Jl255bjkd7wPl1pDazLuv0QwvqpvMc8tf
	C2hqMvvfkWbx1kwhkcanSzpcvZLX4D0kfM2yYIPPjhUpTKaCSd6Gw3kYkHx5xi8q
	C22fAqTOoV/55LT+S+ZhsuTlgHnfVa7XwNghcR0Ymxg4wh6dkqM/72Z92dOirAm9
	VeNVqxxfH0ZNRiMlNT0vWIfmDbvKv+7YavPKAVAL0QVXlwgYLK8WZ24Zb95L69OG
	FWMs7g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bggqu091s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 17:57:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c43f8ef9bso1791647a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 09:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767635832; x=1768240632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=luFQohOzUtSfFErML01fuIAdonSt43+90znEjAeHo9g=;
        b=WJfjdw3MFVbI9DtRp6FnfHX1Sq1dUnYRH0FHh16hqBpRBRCQNBfEoepPCsvn2gU7TX
         Jr/PM+X3CPWjTAE5wYfl4DSsicABNR9qov8vpov1rsi23SQV61dcANWYh41oIdY0LrdJ
         kdrvscQTrGVfK8A+/wLcZE88PMgu6IHVJz8Z0bS0YhOIY1wAS4FAVguWe9WsY0qG5qQ0
         Abv1uy/5yEfqSgEFy86Du1pb5pexmWEdejyDzRNNyUQ+J5JtijvWCYaVgx31nRv2wJlw
         Od7xGQVrGS7gZUV/i06DBImD5qfQs+oqG5Ixw3hOE2VLyOkjc5ap7uECcYrC6TNabnOr
         rbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767635832; x=1768240632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=luFQohOzUtSfFErML01fuIAdonSt43+90znEjAeHo9g=;
        b=wUorcP7CaGHb3zQFUmBYWsUhn0OuBk7jUuYbHFbi7A7ehkgPneukr8jPBx5sRrgFwN
         gX7D3EG6aIgB6+EMA+/ZhEhgT9pul4BHvL7yt/Bw5os2isc5ZuAVLnehXdeFLXbsK2u/
         GKcRnfTvRho4+d4Bt1ByuRuTvdVtLtYA9Wljrs0q/JLfO7vpXzANkT3ycZNxsVB6vsdt
         jPSdXtQ9qqJ69XqIvU5pG/O30ED6BnIMr8kt/UdtqR+zvImW56s2j2cD6yh6a0IXi1tY
         bGXizuJ7MMyrNV1pgWzdeS8w+L8gzlQpDvtetWb6vb8bOCMc1VFkdG02jAwVxBIPC41K
         xwVw==
X-Forwarded-Encrypted: i=1; AJvYcCW87s3mtmjmdKwpRUtNKh/5AAhA+PqNzI3x9m33X048fhkj1pmZ49Erb2Or+8XlCa6OG/vXnWEeqeR2XWyy@vger.kernel.org
X-Gm-Message-State: AOJu0YytY0EmIPIf0QWrg12m4Zcr9AvcH8BpOlC1lWXrizBrxc00bzLz
	TEKzrHQ/In82faU/bu62yGM7ym1yNg34INFlpivQAQCdVLI29MgXcxO4iPHztTmJm/3eQYt5XTb
	o9HZRMvYKsS6YmhItzIhJZWLk3SEbR/eLEgT0Aex+R/oJTxROAQBSoAjWxgFAZnZ+g89N
X-Gm-Gg: AY/fxX7Y5vC/yqcf4CfQH7Atmb0rwZc7/X9OZxjHsNSN8HmQ+SPQBgzWoc79mGESGXD
	iSXYGQS1BWWJoa2/1xl9O7rioVbz51keqU1jF9cJnLSy4HOm1oKnDTIsfxtzJKR+qnUNCj3dl9n
	AvK8pqyM4SjlCpYYp2gGhqGNJDdGO+CAjp4GDRfjXFcbCt0eyDdfUQsaEIoLFWMfocW06b2hcp6
	jpiGRlUt86BvpK7WN9Xl15LEd/C7lq2kLWVjuC7jmGBRVpPWGXvxx9Nqia+cU1Ws5LXkgFG+Qoq
	xzqcmVf7omfL9dX3GtyNEVonppcwUni9ACGFsk04nv+q35iNUf7M5UKIXQKLj1JgDH2woNWQhIH
	MGYsmQMaOWZRNmX6Jx9uVvpU7AL7B05R8Dq9p9ef8uvw+KSJ/cQ==
X-Received: by 2002:a17:90b:5825:b0:34a:a16d:77c3 with SMTP id 98e67ed59e1d1-34f5f83ddc3mr14791a91.2.1767635831922;
        Mon, 05 Jan 2026 09:57:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElruqKiFOG7DhNDu5zJlxmkqXIl8agGfM9DEGHevp6QtmhWxaqcdqCqo8PIRXDBYKFtHOY+Q==
X-Received: by 2002:a17:90b:5825:b0:34a:a16d:77c3 with SMTP id 98e67ed59e1d1-34f5f83ddc3mr14767a91.2.1767635831388;
        Mon, 05 Jan 2026 09:57:11 -0800 (PST)
Received: from [192.168.0.107] ([183.82.31.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f7a557asm14022a91.3.2026.01.05.09.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 09:57:11 -0800 (PST)
Message-ID: <19b2dd07-ed70-4eaa-8395-6a62d52ec862@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 23:27:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] remoteproc: qcom_q6v5_wcss: support IPQ9574
To: mr.nuke.me@gmail.com, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org,
        linux-kernel@vger.kernel.org
Cc: krzk+dt@kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <20251219043425.888585-6-mr.nuke.me@gmail.com>
 <a14e40b7-b70b-4658-9dee-7e5e6265ad5f@oss.qualcomm.com>
 <12223416.nUPlyArG6x@nukework.gtech>
 <55d70e0b-7a6b-4979-9ae9-4443e54ab584@oss.qualcomm.com>
 <7f6754a4-4a3b-4b6f-9220-a1790a9ba393@gmail.com>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <7f6754a4-4a3b-4b6f-9220-a1790a9ba393@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDE1NiBTYWx0ZWRfXznhW0wrmz85x
 7a+cBLr065y3xsny3V4oS71rJ2fnzCaTHgdXG83oNVkpcQj3RgmJ59vOQ/BJBMljeUsyZowpnMO
 3k4Q7jQbzXQONEtKXrNH2kF9aknNCCmjb4Ko+e1MoraUnwkAs1++dvVCVfH2A0YiNRihuH2iori
 YPjENQFpnQQBhI0Lg55suHfodNjTXyvwqCll++Rt7fFzNDG3GNqrKAeVzH5LBfbkSVFhV/W6OWj
 +6PsKs6CPc7Ui5snZYT8946HQpYatBjJFUTiZIYg0K4BW1yZ3JrV/7XKbcLjmE3RUzfYocLTV4Z
 +T8bm662t3R73ocwHlAoNMxX38jgpffiLtmkW4jCeqBpHUdmnFoJc98vA3Nc0xpnHwnTqFZRcVh
 uuu+dGRGtadoxQTVWN+74dDzoPSM8uM+NNbwYQclGi46/fUQ6oakqaaj6SJiOdzPve3JsyUyRu1
 TupjIihuBHzsUhWIlYA==
X-Proofpoint-ORIG-GUID: c0I_Kn27QAOvnt94ldoTIQbDXFyI9kST
X-Authority-Analysis: v=2.4 cv=fr/RpV4f c=1 sm=1 tr=0 ts=695bfb79 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=V6Ol1F/91haf34TWKFX4Fg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=pGLkceISAAAA:8
 a=CDNBFjyWLGXVnZMhk_0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: c0I_Kn27QAOvnt94ldoTIQbDXFyI9kST
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050156



On 1/5/2026 9:39 PM, mr.nuke.me@gmail.com wrote:
> 
> 
> On 12/29/25 6:35 AM, Konrad Dybcio wrote:
>> On 12/23/25 9:21 PM, Alex G. wrote:
>>> On Friday, December 19, 2025 7:20:04 AM CST Konrad Dybcio wrote:
>>>> On 12/19/25 5:34 AM, Alexandru Gagniuc wrote:
>>>>> Q6 based firmware loading is also present on IPQ9574, when coupled
>>>>> with a wifi-6 device, such as QCN5024. Populate driver data for
>>>>> IPQ9574 with values from the downstream 5.4 kerrnel.
>>>>>
>>>>> Add the new sequences for the WCSS reset and stop. The downstream
>>>>> 5.4 kernel calls these "Q6V7", so keep the name. This is still worth
>>>>> using with the "q6v5" driver because all other parts of the driver
>>>>> can be seamlessly reused.
>>>>>
>>>>> The IPQ9574 uses two sets of clocks. the first, dubbed "q6_clocks"
>>>>> must be enabled before the Q6 is started by writing the Q6SS_RST_EVB
>>>>> register. The second set of clocks, "clks" should only be enabled
>>>>> after the Q6 is placed out of reset. Otherwise, the host CPU core that
>>>>> tries to start the remoteproc will hang.
>>>>>
>>>>> The downstream kernel had a funny comment, "Pray god and wait for
>>>>> reset to complete", which I decided to keep for entertainment value.
>>>>>
>>>>> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> @@ -128,6 +137,12 @@ struct q6v5_wcss {
>>>>>
>>>>>       struct clk *qdsp6ss_xo_cbcr;
>>>>>       struct clk *qdsp6ss_core_gfmux;
>>>>>       struct clk *lcc_bcr_sleep;
>>>>>
>>>>> +    struct clk_bulk_data *clks;
>>>>> +    /* clocks that must be started before the Q6 is booted */
>>>>> +    struct clk_bulk_data *q6_clks;
>>>>
>>>> "pre_boot_clks" or something along those lines?
>>>
>>> I like "pre_boot_clocks".
>>>
>>>> In general i'm not super stoked to see another platform where manual and
>>>> through-TZ bringup of remoteprocs is supposed to be supported in parallel..
>>>>
>>>> Are you sure your firmware doesn't allow you to just do a simple
>>>> qcom_scm_pas_auth_and_reset() like in the multipd series?
>>>
>>> I am approaching this from the perspective of an aftermarket OS, like OpenWRT.
>>> I don't know if the firmware will do the right thing. I can mitigate this for
>>> OS-loaded firmware, like ath11k 16/m3 firmware, because I can test the driver
>>> and firmware together. I can't do that for bootloader-loaded firmware, so I try
>>> to depend on it as little as possible. I hope that native remoterproc loading
>>> for IPQ9574 will be allowed.
>>
>> These are two parallel questions. I didn't even know that the bootloader
>> preloaded firmware on these platforms (are you sure that's the case?)
>>
>> qcom_scm_pas_auth_and_reset() is usually preceded by qcom_mdt_pas_init() +
>> qcom_mdt_load_no_init() where *you* supply the loadable firmware for the
>> remote processor.
> 
> What I mean is that the init sequence is implemented in the trustzone firmware which is loaded at boot time. Irrespective of what Q6 and M3 firmware I supply, if trustzone doesn't cooperate, I can't start the remoteproc. I don't have that problem when the init sequence is implemented in the kernel.
> 
>> The init sequence provided by this interface will be at worst identical to
>> what you're proposing here (except abstracted out), and at best containing
>> some fixes and/or workarounds that may be necessary.
> 
> I think this portrays the TZ path as somehow superior. That's not how things work in my use casee.

Adding my 2 cents here, in some platforms, the regions which you are accessing
as part of the init sequence might be access protected by Trustzone.
This might lead to the kernel bringup failing due to an access violation.

This was the motivation behind me asking if this worked in my previous email.
Using the TZ interface, as suggested by Konrad, should work in any case.

Thanks,
Vignesh

> 
> The bootloader/FW versions depends on when and who made the device. So while the newest TZ from upstream may have the latest fixes, I have no guarantee that they will be present on a given device at runtime. The best solution I found to get consistent behavior across devices is to do these sequences from the kernel. Is there something incomplete in my init sequence that I can fix?
> 
>  > Please try using PAS and see if that works.
> 
> I found the v6 of the multipd series [1]. It needed some minor adjustments to compile. I went as far as loading the Q6 firmware and starting the remoteproc without error. I did not test any further.
> 
> Alex
> 
> [1] https://patchwork.kernel.org/project/linux-remoteproc/patch/20231110091939.3025413-1-quic_mmanikan@quicinc.com/
> 
> 


