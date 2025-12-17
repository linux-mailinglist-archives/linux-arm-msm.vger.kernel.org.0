Return-Path: <linux-arm-msm+bounces-85508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B19CC7C22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 14:08:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD42E3048E73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 13:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4414433FE36;
	Wed, 17 Dec 2025 12:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DKVjtI5o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vjdv73ca"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47C8339710
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765976168; cv=none; b=ptXlQcmbD01+htAvdAac8rskF0xmkR1ooYWEA8U5/S4rKGKYia99A7yrGNdn9TUF20Ii6faKTu0vkXDrce5Tdxen5iMMXgRuMYhw3vMAjZVYynKGYJJVRSQ3a3ukHUcwEWlEC727P2AfNqRfUqsg43MZzthdJrT4Hog4hEaQrJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765976168; c=relaxed/simple;
	bh=FxLM0KclIpi3ogEq/ocYeS8TWQmxPiqLN+3j26Yf23k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CenOwciO6bti/tSEPsL/regJLACtTWqhsK0fZNBfZPFEZ3p3i92gNsi8Aj9Q5oGEF3YitTL+J3itvwnV7cR8T8SrVV4H9QfMPQdDWon9sjP+2biy0gZwYnRoZr5FmKo6A5Kox4eN0EdFdJLWOcHgXt1WRBApKzqbZIrCayAeSTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DKVjtI5o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vjdv73ca; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKnB32465103
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WOPiNKiqFA0h11hftXo+Ki9WeMXiJkxt+xJYpeMO3iQ=; b=DKVjtI5okDRDUXPV
	JCqfmrCgI082GURlpjtedhuDxtRzwb5LEAbleYuoS2QCmyQ7wAyc3071zWqjG722
	2PyFpv2dk6Sr+jZtpc/cf2jJwjCFYn4gd57Nw0iQNaXU/sKreCwzRxdvVKeErV7y
	hODjKmhYvaIAYCka05knlnX+2e5gsRiNhVO3PDvz/+7etN4LvHgd7DaowVHjNdqI
	ceFnRPVAQ+e6QWgvG3n2fCIgyfObBdiquKNMj6fJOk1cDeMcHhvvno4ZqGbgBFA2
	dwend92NOd0zrXzpHFIk+E0Z9uYXSHA1lEySpSEORmMH/KGFGP6WkyR+SAu5rcpW
	JICRtQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fe2aecd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:56:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1d7ac8339so173776351cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 04:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765976165; x=1766580965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WOPiNKiqFA0h11hftXo+Ki9WeMXiJkxt+xJYpeMO3iQ=;
        b=Vjdv73caS3dl1j2TFKvbYrXYaWoHmcCf0UojJy5jr/fvLSxIRRM2BTCgjWOgdhC36X
         iN7Gb97PHymnlOGiPhfUT5wV8vfEyuzeFWtoQWEHQMiEQ9CGs1XxSwQph/8/e8S/rWbj
         1HxHGajRx1yimRB9H66DsF59cnhbC3iDX1R1cLwP4tHy+TsokKXihY9iEWivQyM7XY9G
         qVkZtillxIg/1J306kW8rXCEAUn+ILSxOzkrZvpOfJfmefrScCxdriWDS98it34Y1Xzv
         ZHBUHvMok23oGC6e2bDSFMgOEjqJQrRjJwL0xfLdzpPKXqR78xXiRj5iotrZ8OvRLGxk
         8zJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765976165; x=1766580965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOPiNKiqFA0h11hftXo+Ki9WeMXiJkxt+xJYpeMO3iQ=;
        b=bG0tAMBsJse1Yd7PtsTL7Klm45lPb/oKhDg6In9Y7tYoq606+Z9gaV/qmIl06uenVU
         rrN8hL+ChO6aXHMS5GWEdNsMAm4w8UohUnGmmkfYeAyMBLxubs+c2kf0VCEEzIMc2I3R
         eIO3OxHK/Ij46kqQ8w4Wcs/X8K8uXAa9IK9egjD80pKHcyutWlRAvCQnavTfpTG+HVSZ
         kWYBFdXPFBHsKOksWr3pvOFQVQ8f4y9mrKf5z5gemYFpJEjX0R8OLxvi3QxIHOgm84Ux
         LhxT32pjXap2SfmQE0y6eLG374I2h9lh9gbbeMjdBlS78DtBfUFMdr68KHnbkjnSdZTo
         x2sQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWGziY3n+BVBM3vj4RY+i6AFHlSEfMB3umue5eSh639vEmP0PurDSUyndcQdffnIOTmrGjQtcPZFITiDu9@vger.kernel.org
X-Gm-Message-State: AOJu0YwUOQuT5aJ5JniEGgMS3VgX6TyN4uL0lnwUCvwjyqSBbgIHQMiA
	rN1GYGddsvIFN67+dECYgHQPqhyoDb+MJAoTRSTyP3sjOxqa7Nj3wsEh1espgkJX2QZahp5kXCX
	XD2DsnyC4CPiVse5rzMPNszGNDJP5pPIvomBupn3viRi+QjfcG9Wq77EzztNYBooYITc/
X-Gm-Gg: AY/fxX4juz/2BUW4/kZSgApXFDOYc3YpLzEIfNY3eRXaIYa6UK/2vb3Qq89MOUJcXlv
	iTPRLulLr7VV9Q+YuZdKqz2Z2rF8+0gktS3k6h0aLruIkQu2Zyjzp4fvlqAebhfAxWMBdwP5m6H
	wBWSLoNLFsRCxH4ml99cuBR2cBy5vp9gSsrPv0yYB76bOizF3ESVX2Uk4sBqduhl6iR3ChdgrrA
	xUwFeQtGKaaa5aCGabWRdDnOTkykb/iC8lyXx51mpVBzvoq5qAXE7NdYMaT7cB9VavDx5lDKzRW
	1mSBrSlSwpKJRqU49uwrX+Q4g8EV3qU9hlOb3SS6wNkAEIcsOksUpHZWc6so3+4FFW0Rz8tSXOq
	iw8NPex/wkMbW6/+W3dL1BnvVCMqtztfD1I3m
X-Received: by 2002:a05:622a:2286:b0:4ee:19d6:fadd with SMTP id d75a77b69052e-4f1d04770a6mr262595121cf.4.1765976164856;
        Wed, 17 Dec 2025 04:56:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMUuNr17Mfyov5u2N+6wQXww6mFEqvNtFZsN6hnrLUNMAp9We7iRc0kZfQeruCjmGbm5NMTg==
X-Received: by 2002:a05:622a:2286:b0:4ee:19d6:fadd with SMTP id d75a77b69052e-4f1d04770a6mr262594811cf.4.1765976164463;
        Wed, 17 Dec 2025 04:56:04 -0800 (PST)
Received: from [192.168.68.107] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4310ade8063sm4664963f8f.23.2025.12.17.04.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 04:56:03 -0800 (PST)
Message-ID: <d9e64bd0-7ccf-490c-a6be-d9cc9484475d@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 12:56:02 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] ASoC: qcom: q6dsp-lpass-ports: Expand sampling
 rate and PCM format constraints
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
References: <20251210065157.2775514-1-ravi.hothi@oss.qualcomm.com>
 <DEUL786WEYBY.3502XZKMTYTN3@linaro.org>
 <370a9d69-1706-438a-bb36-01a22e5cf540@oss.qualcomm.com>
 <DF0GN7VV4R2W.2E3U1LMOF0JPG@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <DF0GN7VV4R2W.2E3U1LMOF0JPG@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WnDBPG7k1BzcBHVaa2ovYHs-VbpgFwoH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEwMCBTYWx0ZWRfXz45WnfKzjivL
 95siIoOHzT80M2HSKktKhps1AajMqu8f4++Wmc3LnW94pks3J4eKcxU6wD3NC77UwmlFsYWO6aS
 eIfF+76Qm0/42pItAu5JCjV07XYYb7KHor2WneA+bRTn5yyDokeHO/gIWtklAw19Znmeo6PNdB6
 Tsa4dDrUBl8IXn5889NyajCP4Glkut6FvCVlLwUcwKsoiscZLnGDse5EnQtRcwSKayyry7WWk3F
 O9xWv16MWJJLov94vx/x+Q+Q9Yt2YaD3OTHQ0RYWfVLpN6khDIgNvBZkruT7Gye3YzhocOlLmT4
 yzqozdjcd5zwVs9jWejoiUIw8cZdCfDDuprmmZ+lOInTiNtjZkGKK5+sI3ztsfbFnmyQRvBlKTZ
 UbZCg1W0nG50xOLWUoRS4H5E/LeBDw==
X-Proofpoint-ORIG-GUID: WnDBPG7k1BzcBHVaa2ovYHs-VbpgFwoH
X-Authority-Analysis: v=2.4 cv=HpN72kTS c=1 sm=1 tr=0 ts=6942a865 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Ee-W4yJ1yma90M8iBOkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170100



On 12/17/25 11:38 AM, Alexey Klimov wrote:
> On Mon Dec 15, 2025 at 7:29 AM GMT, Ravi Hothi wrote:
>>
>>
>> On 12/10/2025 7:26 PM, Alexey Klimov wrote:
>>> On Wed Dec 10, 2025 at 6:51 AM GMT, Ravi Hothi wrote:
>>>> This patch series expands the existing constraints in
>>>> the q6dsp-lpass-ports driver to improve compatibility
>>>> and flexibility for audio stream configurations.
>>>>
>>>> The first patch extends the supported sampling rates to cover a wider
>>>> range, from 8000 Hz to 192000 Hz, ensuring better compatibility with
>>>> diverse audio hardware and allowing more flexible audio stream setups.
>>>>
>>>> The second patch adds support for the 32-bit PCM format
>>>> (SNDRV_PCM_FMTBIT_S32_LE) alongside the existing 16-bit
>>>> and 24-bit formats, enabling handling of high-resolution
>>>> audio streams and improving audio quality for supported hardware.
>>>
>>> Is q6dsp-lpass-ports involved in compress offloaded playback on
>>> existing devices? If yes, then how is it gonna play with
>>> explicitly setting format/sampling rate to s16le/48k in sndcards drivers?

be_hw_params_fixup callback in machine drivers can select any format
that fits the usecase. currently this is hardcoded for s16le samples and
48K rate, but its not limited to this. This patch is expanding the
allowed range in the dais so that machine drivers should be able to
select other options, ex: for HDMI its better to be at S24LE or S32LE.

>>>
>> Support for s16le/48k is already available; these patch will expand the 
>> existing constraint so that customers can use a wider range.
> 
> Unfortunately, you didn't answer any of my questions or answered
> a different one.
> 
> Perhaps the main one: is q6dsp-lpass-ports involved in compress offloaded
> playback on existing devices?

lpass-ports are the Backend DAI ports, So yes, they will be involved in
all the usecases that deal with handling sinks or sources irrespective
of pcm or compressed content.


--srini>
> Thanks,
> Alexey
> 


