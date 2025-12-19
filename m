Return-Path: <linux-arm-msm+bounces-85877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A6FCCFE70
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 13:54:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 807E8300995B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 12:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151DE18DB37;
	Fri, 19 Dec 2025 12:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lBZbUpuc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LGNg9A9A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8291D220F49
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766148844; cv=none; b=O6zYYqXQJvryR1vUFy5V98CzMiOZokWy+5DRqNrs8YlekdFgHGb6glRsDGUHZZ/OhZrbdqF1zxMllP5fttOmN1f+Kn20Tb3kDxnM1YG8Rkb1J+atXM0RX9WBtWnUHykGEdfU+NhBBeY1IjYcF8Smz1G1TtbMv8HaYp+omVk2sF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766148844; c=relaxed/simple;
	bh=A5GavDctwAB/XITHqdSkrfRmvaw70MYu4OaFJghrz8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pjLLHmYOA8myEKrzFsc0LcGpaDjiTqW4rRItvOwdaJUhgnqaAtytIRmUcHf0G2U0C44kezL+5gEcSTvel2Ae3EGu1G5i4EEu7qlvGDLUNTVKJ7UfSAvQ6rlJWlCXm1MlAyZ6A7Usd1sgvw+B2bv2uOUsXkp7xgyANzV0IxTFqgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lBZbUpuc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LGNg9A9A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBVXVX3319083
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uc0x8VaMjRUEZ4B+o1zl7TpXIPYi6c2EiV7fxfCNRW0=; b=lBZbUpuciYoS8I8l
	OxnIHhWGzNLoCNDn8ZfiwD7en+rVG6czJRRMktbpZEj4jAo4b7nhgKGE2kz606/s
	IDNDf0RjmImcm4EZAzYZ75K7vKe6PtGloW6N/jNXsPKAXXFi/L2Uwsgiq1IC+gay
	Jae1ptoUsZIaVNz9wQqK30OISy4JrXqsLjXd89KSt3sViyc+2m63q0CjvQMQQ63h
	Ij05fxDWJgaSqTGCGGs3Oeu2yjUlu72rn+pkVpOoBpOEkYwvWnFP+6EgXKUOYAJX
	sFps7F1xpA369kvGy6xHPwuo0m+V9YdGyCn2/cbFcFPFyk/6jYEDX4ayEhjRnQ2t
	pejJqw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2etmsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:54:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ede0bd2154so4215441cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 04:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766148840; x=1766753640; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uc0x8VaMjRUEZ4B+o1zl7TpXIPYi6c2EiV7fxfCNRW0=;
        b=LGNg9A9ArcIPNNdKntV2uL5aXsRRccwIf4a5SxAcUmg4ipsXohraVtSHtQP6kZXWI3
         Nm/UB/yY66e+xl5YLVfqYNL7LfcHv7SMaThID+tWpnntArhPBmpBpUdD+fmskun8lAhF
         8R3w/MM9ujHXzk5wC5W3pRs0J6HTTDgLe/ZxrR2wAR5LpMtf4E7R4Lv2powFx0L5nWIY
         coAI9YlSaceHWb9Wox9JISIeWkokaUcRQW/hqH1ReI0W2jr+fMAQ37YqerP5hYCPQOD2
         rAhPgOQ6qW5fLM3EbQsPxKlWBAMCnRZgw6L5lDN59VzjDvlxv3uiC6x9Rd2sMOf1/aAX
         mVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766148840; x=1766753640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uc0x8VaMjRUEZ4B+o1zl7TpXIPYi6c2EiV7fxfCNRW0=;
        b=R4g7XGiL82E3hJm9sbe2SLm1zsKMwz/5FOawoNLfcSjTuN6Hl1wFiaQBZB+cDDyYhU
         hguqiwFpnfkQjdOQnHWVN7bbeMpOhODOghPoAxK4Yv+2ABRWSX4kkvId+e9vUwurmt4U
         3meofl4ZDUK2GNTPHKB9hAvw72VbcIRyrays6iepUKEJ/1mNPQ4nwJEPvtHc1LlFNX8D
         E9NLC+g6Zx0enQNvM4xGJ8EzBfScelZkSv9jsQgTz5wUXjz0Rd6Qisy8kjCejLLmRUDa
         2UrnHJV0mNwsLkiAR/id/2LwpjrxxiK6qAvRGE2g4Gsl77j5ERMFaq4MNLqKmC7HsYFW
         zHZw==
X-Forwarded-Encrypted: i=1; AJvYcCW9rj3qr5ZTQc+BDG9IB8px4jXY1AgMTb/ICdF1fVOK/bKF9mtAVXb5oN5nZVjtmLuqJ6HbmWHTAhbtS05j@vger.kernel.org
X-Gm-Message-State: AOJu0YzEyoV8ylxE6Ce1Y3b1x/qwa3hqCdXKydsGCOOVyvvky4WZ6Ovi
	cUxoECqh4yzw4I5ihGqt8YTiJFDRYTg+oDxwKjZAjKqO3+HcC0U5T80HuR/SZpy9X54cPH0Y9fX
	eqarmchaLn200wZwXQQ1PMwJP4B08Wq5U2+ADZaUQy6UPz76sFG7X3SvOuZbYTcpTLdXJ
X-Gm-Gg: AY/fxX5IlHFPyMkcaw+Cm8exkG4lNgQS8FEU2k8YIfJICBxH6krfnOPR4hfpoy2s9wN
	fb2GfxQf9tlLzKAfxk3H+NFHhFwB4w9zipBVbk15eV5Vz0k0dSiW8M9Hp+khXNWRE7/pjlju+8k
	Pev3spkZoKLadn9AmOgcYM5h4e03KOK3qjVDl2/wLv+J66lETX/zUn60QFP4COLYzGZKoETnp/3
	z7JTq9/UBoGZg1bvBbViJBDMXX7TB4mljOkFPa1jRxvNn61WFVS8SGaKEKrMd0nS2eKb9B01m5m
	T6WIX01cZZUfcBowAO1g/hVVYchT3x8hS1jp/bJMKJqglXmM2Refn94DzK/Q63Xs0ytFZ2vBpwc
	sYpc9ni7WhwzDYtb8SA8GVO97nfaCvky0csUyw9davuBCV+v6AEGUrqBCxMrNZxGYsg==
X-Received: by 2002:ac8:7c52:0:b0:4f3:616f:150 with SMTP id d75a77b69052e-4f4abbdff03mr27396251cf.0.1766148840344;
        Fri, 19 Dec 2025 04:54:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETJwazkVhVLNAOvDcL9re7kMjF36XivSzx/P+vqZuX1/+RnZc/020kDrJfnq9yqyv7Wk3hRg==
X-Received: by 2002:ac8:7c52:0:b0:4f3:616f:150 with SMTP id d75a77b69052e-4f4abbdff03mr27396111cf.0.1766148839915;
        Fri, 19 Dec 2025 04:53:59 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b803d3cea32sm163553966b.34.2025.12.19.04.53.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 04:53:59 -0800 (PST)
Message-ID: <455edd55-132d-423d-b0c0-afc7fa40aa30@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 13:53:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: x1e78100-t14s: Add audio
 playback over DisplayPort
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Abel Vesa <abel.vesa@linaro.org>
References: <20251217120051.98198-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20251217120051.98198-4-krzysztof.kozlowski@oss.qualcomm.com>
 <2d4953c6-184d-423b-80e9-871c6e00da35@oss.qualcomm.com>
 <564732e7-2c86-417d-8568-69f40ea7d4da@kernel.org>
 <47758ce9-5ec6-4ed6-9f84-13cbdd444d75@oss.qualcomm.com>
 <487ff592-e67c-41c8-a398-f79aa6e5f69c@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <487ff592-e67c-41c8-a398-f79aa6e5f69c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TQdLfBtl1t0jcT2xMkbIu0je0EbdVOY0
X-Proofpoint-ORIG-GUID: TQdLfBtl1t0jcT2xMkbIu0je0EbdVOY0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwNiBTYWx0ZWRfX9/qWgAoKRAj1
 5Pkjrhem5+BdljD3AH5wo5Nggl1EIyFiU7EEoVIsJq4PV7GKKcHgBg8SyP/ki/5IYv/5lVS0Yoz
 eW5OPlw9Q/wbmIMesYjW4DY3Wzh99SdUa7yuA/cr7y3aBkzLtFZ7wxmNOSmgPkE3u5UQxsmiZfm
 O3niQf+jaK8U7Pg+2KyvoYGALa8MRhc0SudjKqTHJ2k02vTPMijSh7SJhqEneLs3MRyBsaTcBeZ
 vHZZhr9WLOi9mVsKzdJvx8BnTelJWJNLfGGKVqZ02KivFHDrF5uiewtwBG5TKEzEPZE1ejyW0no
 6GXjvjAMyw0lC4ZotZ50U90WQp3G1eChBk87+T7wVgff2MZxaG5NF9hnsw8DfQsllczbpu7dgHf
 0K/duIH+maQmnPH+3A5/G5pXMxnZV5XliyqdOuOHXktp3wkCvxMdwUiSYFwjG7njt17J5Zf/x1x
 E2H7BDngMFvu/bwRiyg==
X-Authority-Analysis: v=2.4 cv=Tp7rRTXh c=1 sm=1 tr=0 ts=69454ae9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=vCpk0QvsQUMgD7SpnysA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190106

On 12/17/25 2:00 PM, Krzysztof Kozlowski wrote:
> On 17/12/2025 13:51, Konrad Dybcio wrote:
>> On 12/17/25 1:38 PM, Krzysztof Kozlowski wrote:
>>> On 17/12/2025 13:33, Konrad Dybcio wrote:
>>>> On 12/17/25 1:00 PM, Krzysztof Kozlowski wrote:
>>>>> Add necessary DAI links and DAI name prefixes to enable audio playback
>>>>> over USB/DisplayPort and HDMI.  The HDMI port is not yet enabled, but it
>>>>> should carry respective DAI name prefix regardless.
>>>>>
>>>>> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>>
>>>>> ---
>>>>
>>>> (something's inserting a \n before --- in your latest patches but I
>>>
>>> No, it is not. It was always like that and only recently git started
>>> dropping it, but it is irrelevant.
>>>
>>>> don't know if this is a problem)
>>>>
>>>> [...]
>>>>
>>>>> +		displayport-2-dai-link {
>>>>> +			link-name = "DisplayPort2 Playback";
>>>>> +
>>>>> +			codec {
>>>>> +				sound-dai = <&mdss_dp2>;
>>>>
>>>> How does this work out with fw_devlink?
>>>
>>> How is this related to this patchset? Please stop nit-picking irrelevant
>>> things.
>>
>> I'm asking whether this is going to break sync_state because you're not
>> enabling mdss_dp2 - I believe that's a fair question..
> 
> DTS description is independent of driver, thus this is correct code
> regardless whether there is interconnect involved anywhere or not. I
> don't have the answer how this affects interconnect, but I see no reason
> anyone would create such ICC path - between hardware and fake SW construct.

sync_state isn't exclusive to the interconnect framework

In any case, could you please confirm/deny that sound still works as
expected with linux-next/master + this patch alone and we move on?

Konrad

