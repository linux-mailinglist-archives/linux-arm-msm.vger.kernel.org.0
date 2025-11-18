Return-Path: <linux-arm-msm+bounces-82341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 789DEC6A171
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:49:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 2E8F52AF6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821E035BDBA;
	Tue, 18 Nov 2025 14:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JkJrik0F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OKgUxq4O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20A435B14E
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763477347; cv=none; b=ZdQx2+KW9gouRagAd2cPXiWti3QmT0i/A7y4cL8xjMq9V7M8iKO4CMBWOS+TOW6o7BPxQQQeGEnvEOaDH0/Fa3Nf8t9TvNTkKOVWO76afKlDx3QeTmPX1vdut65nX0IqIjdLUu44cUWTWkxNR5fpn000mmX9mInWe56lAw4znp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763477347; c=relaxed/simple;
	bh=0cml0rnk0Uwz5vGuT0N6RVpyBdL75FaXQOzj6ISDrio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SpCCDJwm3xwZuy1RSkbIAJCwMdh93wznvVIahSFLP3HIg1QQrWyrUAcPb8xLEmaOQ1cxd8P5wRE+3N1DKpyMR+aTWmFJkfyCeJZk0TAjf8+AaKHMxoCC0PE436wFFEnfJECr80Eo/A8XQ68K4ShzC0MjxHziotrQTK7Nn4N3zDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JkJrik0F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKgUxq4O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIAQrSP2926832
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uqVucf6VKd9stWpBFdYgb4rc/AtI1spyTRvrZdXaVj4=; b=JkJrik0FahcA53+0
	uV0cbu1TKx3dayDzX/nMfY0kL7TIAXLLjll6JunQWh1Ianu37kqw6iq1L/jSV8kd
	ASiFUVZMcKwc94NAXENklNZff493wrxQ3pLh8CvDCtxsYT+r1LSGB0sPgcukXJ7S
	ipkQqp/i5RtCdvHqY0vzBYrSMlDSen8WHcs8mIKItQLSCt7obTmwaD/vbbaCv72G
	Ao0HuPBHntnkev/gc0XOLvXPy1IIkCGSyUC/oh9C3c3zGW+Yfk54mSj93WSp5Sb+
	C+khTjxR5XNtHTHv9Dw/TOYsu8syBRCmvWJZKEJJnk0a35A3caaSdl+ruYWzG2XX
	0AmT8g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agq290nnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:49:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8adc67e5340so186265585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 06:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763477344; x=1764082144; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uqVucf6VKd9stWpBFdYgb4rc/AtI1spyTRvrZdXaVj4=;
        b=OKgUxq4OeFlAqL2h/gAXYaEJyw5QUhcNKQJiTsWTrdSS00bgLlsB81q2JltzvYP2mT
         SSMNwE6Kz9JMk4S19wlk/FE2IzRu/+tLv4OFTTWfIkSIBcXD9I7bpB3Hyl2d/LtvlAVz
         shoijn8rTJpNycF1DgX8M5epxq8Cu6gNnmP438BOqoUUo62UzJzRlEplzzLcb4gxUdYR
         ydQ2+FLkxvha/IhdsC9jl8UL9mF3etAq3e5ZCDGuGoo7CXiwSEMCiL2ve7jSHhdFZuD+
         UnnFKnvZjWYOYipWp8FhVdphyGsHTcmRe8L95z9ept5hofY3tKSZtbL4yLoU+GCzl9JO
         EpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763477344; x=1764082144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uqVucf6VKd9stWpBFdYgb4rc/AtI1spyTRvrZdXaVj4=;
        b=g+ZC5yKTs6POozNcXtszOzByZoOnpTGw8O8bSKv5LA5vX2y46gzfQrYZ5NLQ4f1zNC
         u2LfvFqpiH2zFSWGLx6rVOh0L47jmXH2JSMpGm9uj5euEOV2Fb4/7lQTzEgN0Vmq+81m
         eFV7sMPufduB+cWb9KJwMK00dd3XnaQ1y2L8snsJaNpGMR01lLioU9a6XPFHRN1fxio/
         9JSzvsmPLhz1oZIa664nTACJMne6CHhnYqGIKAYNkoMgr9T4qsUO3OJS59ty4BSGVoSR
         atV2z+RvOwt+ADXs9TMlhoIyD5Lg/zmuQZpcjbB7hL+BUWdjIGsGaEH5F1V8DzvBJfTT
         uGtw==
X-Gm-Message-State: AOJu0YxuaP9H6HygvZqdbLPr9shlIa0gzgxjBVBPahPZPIiuv7NkVSiB
	1FBXKMbXbeWWXD70JIO+YcJ62Bnf8X0t7lDyYSJRwq7K9xjdYgWM1aCpKWkgT59hOvTrDq/KFqG
	LtXkpAlbuv45zJtZ5+ZNyPkGMc54YFYmSfSF7MntNrQNQLLuEQXQejI23Zn0x8wOk3xY1
X-Gm-Gg: ASbGncsvEZYKd9EzHMUdZYLTu2Zmc5ctwGJvd9st5pzqcNXCffawbIf+U5Y0iQJ19lM
	GlqreVUza8K1bTYCfVTyQLC+v0XFL2p40eVZmmdRKJzl4IbDFcJdauDTMJSMyKU8A8ohWr/WPvl
	gTHtR8Rl/9R7ArhR8U//AslVUWrDTV1pjFJ90tFB1y1y2StNCiCme6iXIun/Ih+1HzcD5cURBKz
	hQ1JCUsizRzouQiObRCHTguwwUVR5PzeBwzdaaRtJ5bCvDT63JS7gYWWIhDPU3LwUOfII+7PTyV
	PBSquAeG6fK9nm3LnyZxLa4OOXgK87A/HfJwdt3Al0JXVac/15xaEokFxSt0RG384ZbKE8kJePt
	PnSdiB9HuMD7pa89EhCqRgwuKglgdvJQBG8353JmRh0QEGAt/F1jUxlXgER5DXA0i/34=
X-Received: by 2002:a05:620a:468d:b0:8b2:fea:21ad with SMTP id af79cd13be357-8b305fc8faamr225333785a.9.1763477344171;
        Tue, 18 Nov 2025 06:49:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrPZegBrppYw6zjJa/UisDtrpFEDf1keGfRJkV3PvaMM+nTIEKz0NkaeDCDrjaQJwlHJwc4g==
X-Received: by 2002:a05:620a:468d:b0:8b2:fea:21ad with SMTP id af79cd13be357-8b305fc8faamr225329485a.9.1763477343641;
        Tue, 18 Nov 2025 06:49:03 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fed80f0sm1371812466b.66.2025.11.18.06.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 06:49:03 -0800 (PST)
Message-ID: <cf53c848-f65e-4956-a8c3-3768818ad50d@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 15:49:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sdm845-oneplus: Don't keep panel
 regulator always on
To: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Casey Connolly <casey.connolly@linaro.org>
References: <20251118-dts-oneplus-regulators-v1-0-79fb2f0f253b@ixit.cz>
 <20251118-dts-oneplus-regulators-v1-2-79fb2f0f253b@ixit.cz>
 <4da03f13-1e45-472c-9435-95156389ba83@oss.qualcomm.com>
 <21c9a3eb-72d2-4fe2-a370-1824b811ced9@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <21c9a3eb-72d2-4fe2-a370-1824b811ced9@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FJgWBuos c=1 sm=1 tr=0 ts=691c8760 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=qdQ_x7Z2-qOnOb6oBeYA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 4Qt0Cp1gRKsidm7Vx98hJf7wBVajxKoR
X-Proofpoint-GUID: 4Qt0Cp1gRKsidm7Vx98hJf7wBVajxKoR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExOSBTYWx0ZWRfX1dHTghJVrCC4
 hPOtKrMMBjrkhL4KLn3gioO3DKWl8gELMmRzGiPdPpmozYlFr+tl7jzW9G9NaBonyrpXy+cZ1WX
 sFaB9ey3SOVDXESOZX3eZLh7mLOJIeZYG/eO0ctuTgFDZ9Gv5HvZfHKoZigsxdjmW0H1cSR0mst
 EFU/e7A11Oe1LpLs4VCQEMkQxywL22PH4G+sZjbYeGorkzpRCaVI6iD1HLLEpqs0UPqlYsKuaZz
 KTPTtBkh1azcvxcwiVrGPjD7rH4qT0ckPHfmeLlwuqU1+Po7jWD5EA8+lAZaFrVZdWvC83gPW7B
 gFoQln5f13iwr6LP/eZqyL1du+X9wfir9xWKg52NPFRqymexxZasD4hoslNCGOxzIteuGKsQvls
 x6l8KC5oTxIJStSlzDwI7NsKwSLl+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180119

On 11/18/25 3:44 PM, David Heidelberg wrote:
> On 18/11/2025 15:32, Konrad Dybcio wrote:
>> On 11/18/25 3:11 PM, David Heidelberg via B4 Relay wrote:
>>> From: Casey Connolly <casey.connolly@linaro.org>
>>>
>>> The panel regulator doesn't need to be always on, so remove this
>>> property.
>>>
>>> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>
>> Fixes?
> 
> I only know this works well at current next-202511xx, these patches we're also in sdm845-mainline downstream repo, but there was multiple different patches and hacks for panels and other stuff present, so it's hard for me verify that on clean mainline kernel these will work as expected (as older mainline versions also need the panel patched etc.)

Fixes != backports

Konrad

> 
> If you insist, I can append Fixes against when these properties we're or weren't introduced (talking about PATCH 3/3 too).
> 
>>
>> Konrad
> 

