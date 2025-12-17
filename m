Return-Path: <linux-arm-msm+bounces-85500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B016CC797A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 13:26:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EA3A300F338
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 12:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC56325709;
	Wed, 17 Dec 2025 12:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hbPMXCUD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dW3qZRPH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D895724BBEE
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765974185; cv=none; b=DO+DBjX6ox0bfjAHZ/4Ai4CQ3vteUJGgR12B06g1vHOP2zZeY8TZdaMLQZlW7I1Ni4nFtDHPUMtHCC052Av5iau0aOgOrEnakBqSHCWs2X2WIt9/62a+ccAa516zcfiuXtd9mxj+k8SHq7pA77O+IUy5wX/zAjaXhB0LhkhibQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765974185; c=relaxed/simple;
	bh=Awp10APiIZ2kestKFq9vUIReq9xGXekkeKhyao0huTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bF7WzT09stlhtuxliUFDrVtRl7svRI6rl+QcMacOBfdBAjpvu3HyfEtf6TsfCjQKXkymZAsHqdgNhO+66FXx/3xSQcwgcHwk/kyKW2Jabv79pYQ/oiByZ87uEuJFIX9mRae4AIzV9UdhNQzh0HG2uoI4nnwSapS8O6wStEBILFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hbPMXCUD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dW3qZRPH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKr3V2390555
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wqoGlulHe/LdeEbzUkaTJCJOAGhK6MVWnCG9uWxJq3k=; b=hbPMXCUDDVcvXe+s
	airqtnpDWfn3n566upaC1v3NthlkOSxhViTg2u8IIOp1XzuSC8pAgqLyn4465cjW
	LpdQBTcaKX9qDGJ7nLfXwE+nyy3Q5ay3B/f8fHWaUKalxQPIPHBd6cfvWPTIlQYn
	jZwt+F2c72yx6Qna4p1bs2MDDmtdJj4RMsKxLpA4qtqNew4f4zRTOqp6ry05eT1U
	gTM3NbYyN/gnWqkfGk3Cso7w9A/R7SlgwqU9VT+ox1ejse3G1NsFEyAAk76FphfI
	PiOZCUctZLN3CAdKEDc7c/hGfKilr63pqaDWwQtswb+I67tNBUZAAoMTfrfthVPn
	iwlDig==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3b7g3705-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:23:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88882c9b4d0so22707036d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 04:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765974182; x=1766578982; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wqoGlulHe/LdeEbzUkaTJCJOAGhK6MVWnCG9uWxJq3k=;
        b=dW3qZRPHbyMPQRaPEONH8L3ZKUDJuJisD+53QViBzNQhbcI2CHb/zbua5arOa8jEIh
         uhjAtbqYPlDERnr4l/461+vKqBGmRlx6ycPGYIfSQ4aOLSH6dxumYexdU9T98w/P+837
         9XNta0YM4sHfrRkI/fRLinluELXxEWz843vzAJVifMP9kiF5VrCswNr1R69dSMragl26
         VumXPWMhXxETmMUmXCaY6prFLPPgs+WJW2ikFpWp5D1ci0k2JR5aLV0mYh31Kxgq+vLs
         UhjXtoo4fvFtdAcADNcm8T8Rc/NaO4zWHu+frM5ecQGMe73FbvoKFgNtvytNKZsK0sJ9
         2svA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765974182; x=1766578982;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqoGlulHe/LdeEbzUkaTJCJOAGhK6MVWnCG9uWxJq3k=;
        b=uaQXzLC0o5ivfWe+RE3N25yu4LFhWwV3LCcsdCJQJ4RumSgKGLpthztr1ntvwQLSSf
         V3xdlyQiSiEhNFta79eCJZcsQ+6quEy9R9Quhn77RMNiachflIVK2iJEZF8jwanM2InL
         PW2BskEpoBo0Trk4nFeNEEHRVc1WIj8ouodv/fLPEA+be9mGVTEF+j2tzgmrzaG2bVfl
         tc44IhfZDPAOop8YeixEvKUNn8ChtlCv9ggfqu3NecDe4YzlaLIuDqV/AKSLHCWgQbEx
         UugCBOcx/a9knkOLG28mZn1wc8RGqx5mGiiad+Wytj3iIsn/Cgo1y/QBCo9CXgZUR0Mc
         EESQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEBlN09146J/ClsBi2xOiFREQ3vx2VcvB4E6z3c+kaqoYyamf+401VhcUxpa4tAHkbQ2yimU8IkJtU7lNR@vger.kernel.org
X-Gm-Message-State: AOJu0YyeIVsIu42H4p9/4iBAsn9pX7LaV3vLpfWV6W0BwyvTJvhMebyp
	SBhL2xWDMig1y/mwJ/xvF8CG2CABb87mrUqC5cj/zy8BiuUBJU4vo5dhn4aJJgqcqw3dMxLDwy9
	kin29GBU3DzBMrPiKri/HBWaU88CxFR84vlIg96pn2zJZEuUUUmUuJ9m8he87Gs3fkJ3H
X-Gm-Gg: AY/fxX7NtrFjr2bS9ezQTHDBzMTR1ZiV0iSuPNOkGkx5ehnTyRXKo2tmi/M554TwJYz
	i/6CaabCxye7ysSC4Ynk27lcmD4L1Jsc9G7rIbwAkOAcCXWnJCnvQR2ntUUmR3/RN8q4gQmuFaY
	TLXqr95DA6RGDtuBKxwl0t7mG85vV7mDaUijb6447QuV9fjDxXRf54npghOllDeZANHQi+bYucW
	JO7VQB+Zw2mer0rfOnwoKHYKKa4Pr0B9TCes0PoLD9PCevPQufSDO6ngn5gziqJgVjjH/z7JzWJ
	iJZgfv/bCVcTX8IS2DkT+Ozn747MfsV6gLsYMocGvh1XllZDdDDOmsZTvNtLS3tatdwAJHjWglM
	6uxmtL9AKZUOUdjFkYfg/mSNsr3j8ne3DD9YcjIAagNe0Yu2TsoOm2hVhw+GoVT+ylg==
X-Received: by 2002:ac8:7f49:0:b0:4ed:b7f0:c76e with SMTP id d75a77b69052e-4f1d06724b0mr189380971cf.8.1765974182091;
        Wed, 17 Dec 2025 04:23:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyq7grPMT0P/HGG/heSEzfTGD2xol79uE9Jw9iZP/Dkw8v81NVJJCfnvlj5oEWLFd3zBrYQA==
X-Received: by 2002:ac8:7f49:0:b0:4ed:b7f0:c76e with SMTP id d75a77b69052e-4f1d06724b0mr189380711cf.8.1765974181691;
        Wed, 17 Dec 2025 04:23:01 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa56be0bsm1883778166b.52.2025.12.17.04.22.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 04:23:01 -0800 (PST)
Message-ID: <f902ebd4-4b4a-47c3-afd7-2018facdaad6@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 13:22:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "clk: qcom: cpu-8996: simplify the
 cpu_clk_notifier_cb"
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251202-wip-obbardc-qcom-msm8096-clk-cpu-fix-downclock-v1-1-90208427e6b1@linaro.org>
 <8d769fb3-cd2a-492c-8aa3-064ebbc5eee4@oss.qualcomm.com>
 <CACr-zFD_Nd=r1Giu2A0h9GHgh-GYPbT1PrwBq7n7JN2AWkXMrw@mail.gmail.com>
 <CACr-zFA=4_wye-uf3NP6bOGTnV7_Cz3-S3eM_TYrg=HDShbkKg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACr-zFA=4_wye-uf3NP6bOGTnV7_Cz3-S3eM_TYrg=HDShbkKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: QDkvfc5O9pZnv7-76fijwQjvCxwUFn82
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA5NiBTYWx0ZWRfX72tci1GfEerh
 ZFJ7VGaEaExFif2WXh/bKNe5p2xLNr8DE5+MYANnfpxpILAl+8NKE1SznkfY7tkvNJ/gfzm3TOs
 yckT4qxAsKVGiK9h/N7uZPJ5ib7kb5DVoirhjJbm0CPDggF+bkZwy+jBwbsO+KOxAIxzBf8GN8J
 XM8gUq3Rfm/JX50I3LX8YXM6tKE6QLZO3kD/Xj2qDWLk4yfgl3ZgY6tjenX1eiagBvqItPywf2X
 CvRbmET9o42yS6A2sCrAuNnYhaeo9lZPm4qkNcTZxHkXFY8djKwxdsy0Dg4fadEIXgT7iZnL7Mv
 22IbPLb1fQL1MET6L8G1nCNGm+cEZ8GQV8V+OevIdbM8i3aDi9gJHcP+4kFUACXAD/fpZM7vfQi
 pCbG4zmw2SUteSeuhfwG2HfxVMH4jQ==
X-Proofpoint-GUID: QDkvfc5O9pZnv7-76fijwQjvCxwUFn82
X-Authority-Analysis: v=2.4 cv=PbLyRyhd c=1 sm=1 tr=0 ts=6942a0a6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=SGH9_1Kv1uoLAvHqms4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170096

On 12/14/25 8:26 PM, Christopher Obbard wrote:
> Hi Konrad,
> 
> On Mon, 8 Dec 2025 at 22:36, Christopher Obbard
> <christopher.obbard@linaro.org> wrote:
>> Apologies for the late response, I was in the process of setting some
>> more msm8096 boards up again in my new workspace to test this
>> properly.
>>
>>
>>> It may be that your board really has a MSM/APQ8x96*SG* which is another
>>> name for the PRO SKU, which happens to have a 2 times wider divider, try
>>>
>>> `cat /sys/bus/soc/devices/soc0/soc_id`
>>
>> I read the soc_id from both of the msm8096 boards I have:
>>
>> Open-Q™ 820 µSOM Development Kit (APQ8096)
>> ```
>> $ cat /sys/bus/soc/devices/soc0/soc_id
>> 291
>> ```
>> (FWIW this board is not in mainline yet; but boots with a DT similar
>> enough to the db820c. I have a patch in my upstream backlog enabling
>> that board; watch this space)
>>
>> DragonBoard™ 820c (APQ8096)
>> ```
>> $ cat /sys/bus/soc/devices/soc0/soc_id
>> 291
>> ```
> 
> Sorry to nag, but are you able to look into this soc_id and see if
> it's the PRO SKU ?

No, it's the "normal" one

Maybe Dmitry would know a little more what's going on

Konrad

