Return-Path: <linux-arm-msm+bounces-79681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E08C1FF09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 13:10:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 284A43BE005
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 12:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF74320397;
	Thu, 30 Oct 2025 12:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ykoe9q8W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hgFbij1F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42DD2E336F
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 12:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761826213; cv=none; b=hF3Qq+w5dPunaIXnc8eutQS5mjUwSaIagfwMxh6ZXM5+0t2W3w5IjuGmDpihavFVwWT3fhyYeWW3H1otpIXRnoJcDguuVyZOe009zWMzJkgfuWrUo0NqPMyhebxdiNY53Ty2uCKmtoOBnThdvomlRxJBahogRV13lxutl2eA/mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761826213; c=relaxed/simple;
	bh=jd2TFwtT3m7YtuBRYt6916y0qzpLWozcDqOfSDITFEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ktv1NKtALsBc/DOtc+FMkP5rZgkWsGAiM1gfc4HS4w1zOUr01F7uo+74ZGkNEQ/MAh/Vk+vLNuVJkajyzbBunB8rDE0SPBonrPhyMWIfiT/YIBopBonb/pSjeB1TTzynHB2xKHr6QRkuX7iFqpZh0H6knOOioGJeaY5Hch6GvzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ykoe9q8W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hgFbij1F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UAPXvr3281633
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 12:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pxUEPdiXQ/pkRNp8hCBJVQjwahJhexoSWQ5nWiRefCQ=; b=Ykoe9q8WhrrjUlby
	aDghg3k3pRMGsxa750hEoqBzpkFGeLa6nGphqaXsi+5l2oGviPyfRjrsJ6/HKhGc
	PR42+M9y3aO1rRVRw7QNIcqNBLSrRmzLVZ6F4HOQTL7MR3mUTpmf6Td5l3rTg0J8
	Rvp96EhA2r1ddLrdtkaChvDngkCdcQsk9pXywtxH0/5joVI3IoHGxr1K+Kb/hpqF
	sWvEEIyrXoRZDMuKfVu9vTtmLlt5SFdMH+bNpEtKNZ0EpfXeqCl1gwJLYkoknbFx
	arPCZ7+NxY94tXt2qy35D8Y7KNOQgbTNR/y0s0HQ90/09GdyHXB3XkmD/CorCmnT
	CGEu0A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a468kg83g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 12:10:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e890deecf6so1547491cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 05:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761826210; x=1762431010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pxUEPdiXQ/pkRNp8hCBJVQjwahJhexoSWQ5nWiRefCQ=;
        b=hgFbij1FRIepEIj8A9S1edMTa2QKS5AiqiRUVCgaAYkopW7OR+fZp4e2JWI/sOLxcO
         ynyAQaIcO1CEgPG8sUlvMZWmPYs/uCCBe7YSD6v5eY6RFH8kqkSv1Ve32eVGnFK90e8S
         uF4qgkv/S0Nc/I1GMYcvb7V3WvI4Q+bwfcDuwElQLShheC3lCO3mtzOLQmqN6fG9bfPN
         k+tyQ/ND9L2PMlkvP1OElXfwHioVbaeejlDYcJClXeH3IlNwuz9iT/gzcMMn18pTJSmS
         NdyJFU3y5rXQOnY3dhISKE63RR44JefI5VngJIZLBh24GdE2N4+mOHHJn+23TyZls2nZ
         k5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761826210; x=1762431010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pxUEPdiXQ/pkRNp8hCBJVQjwahJhexoSWQ5nWiRefCQ=;
        b=bCrNsbkuRqzJhgOk/uENwY086otJi2T9enX8S8bxVatOFyj9vtAeKgFJnG/hbkfFKM
         eZvC4foPN7SKMExs9+Uy/yS4fL9imyxJMio5XHS1pnmmJEbOoaVtCKapKyMq2zE9mA09
         CoIJ1XqMU6Cd4wC+tH1Zeeg3DkKhlI5v5dIw+o29vudUR4/LrwytVZkU43wfBlBBwhNO
         evXyjFvNeQp2hs34hLMyvUSzyyl0W8MAbNvBaDxy/FGiDf8kKgU8wUyN5hniFi5cDMWt
         vw9rfblV7AH2CviBswHY/kkfcMUy3FH9ILeNWbKfiDmsjqkDNJcO+PaIRV0+Tjr6Awda
         qcAg==
X-Forwarded-Encrypted: i=1; AJvYcCWdbA+7DpJX1yphK3ZWZ9yWLfzccjZ4ZLH0kZylrcgefxQWXcSJdAIJjA0iEi8PBSkMQB0vuabgJKg0i7PH@vger.kernel.org
X-Gm-Message-State: AOJu0YzlXS9B1/PQt77Oq+8vcKFhSzD+55jIIuT70wP0e+lMIUcyAo++
	c9GQ+9rb6hEXVOTo2o6jwoX7vKVLZmDve5d/2X440mMLg8UCXgWl2umz546NyEHi8IgaJvSxrDd
	oEFnYBBiNYT3JX6RlqqQX3rMnJj+SmN37/S1TU1YFmH5q6urvjuYx0A7oiXY/Bf/21raR
X-Gm-Gg: ASbGncsnPHIpRph+dMGD+rW/j+S2mA3hHS2fWqcBBi94q4rydXw13Asxdh086i+w9gF
	ptVgdxhcwITndKiESg2IqRkgj7tPCsFVGFZwPN3hXvSFLyVAGv2cPdPD1K1+yhnoJbDNymwl2vT
	fu2ex6EOlgNbpGh6gaQHYwj5zlHSp8HuFsHduQ1Id4lcVlLFqNF4TZmmwEiuouvnzVtiJomW4Mi
	2F1IC3PBNGQk3RQqU/bJ5SslCzEPJaYiEJ1L5xur/nvbArohxPMPn/TjB+BeZegzUejjPamgNCc
	rSNjn+Pu/loU70LQ+cWsz9YkNVLu3WwoGtX6Pspe5AOXglPEReMFllPY7segeEQhwixBUb44iJf
	Ff5mbRsBz7pEiMMcYNBsmWDKhKJV4ohi2vKUukkdvKdztjAfgrMm022ku
X-Received: by 2002:a05:622a:93:b0:4eb:7dac:7b8d with SMTP id d75a77b69052e-4ed15b96605mr51174481cf.6.1761826210253;
        Thu, 30 Oct 2025 05:10:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjKUftHKD5iwZFIXvL+cWkh3af7aBrfhPO7Rvee3DX5GRrSJ9Lhh0HGntfL2AaDfHVn8TupA==
X-Received: by 2002:a05:622a:93:b0:4eb:7dac:7b8d with SMTP id d75a77b69052e-4ed15b96605mr51174011cf.6.1761826209522;
        Thu, 30 Oct 2025 05:10:09 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85398444sm1707115466b.35.2025.10.30.05.10.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 05:10:08 -0700 (PDT)
Message-ID: <259477b9-0e14-4785-91d4-67c5a94331eb@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 13:10:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add support for Pixel 3 and
 Pixel 3 XL
To: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>,
        Casey Connolly <casey@connolly.tech>,
        Joel Selvaraj <foss@joelselvaraj.com>,
        Sumit Semwal <sumit.semwal@linaro.org>, Vinod Koul <vkoul@kernel.org>
References: <20251030-pixel-3-v2-0-8caddbe072c9@ixit.cz>
 <20251030-pixel-3-v2-2-8caddbe072c9@ixit.cz>
 <8d32460d-894b-472a-a262-4c6a60fbcef1@oss.qualcomm.com>
 <7f686f1b-7cc7-428d-941d-82883decee49@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7f686f1b-7cc7-428d-941d-82883decee49@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA5OCBTYWx0ZWRfX7oWfngOBS2TQ
 Uy7bOXcBhiZcUpNbm1OgOj5wJVyBlhNzg+TaIcq+9NDBPWv2+I+gAdaXD5Hj2J7pJSfCoCIRiob
 9cjgwC+u0r61TycFpyU2HcZvnL7SIiV11xr5O7VMth4aQ2TuZ5evkgZIVzGqhYYPTNk6rRi/iKr
 6vLauJIQ8IROdae4kiWF+cextltMYX3WM6TQImErLy3c5w59VzKy/ray8kerTu//wL6S1FcPvul
 WXx/+oeo6p5lFDVGsvtwZjjHmIa7UMU8pAMJ15mnoALN3d6pNkoXB4oe9DYLRpewjxNmD3JeFoF
 NvohQs6iohiZz7FhBY6ilEpZO5u0Z0Fw6hjyXZ2qmKevlc440h4+09lciFmnvt/CuhfRPIteL6l
 FB8w4KQR8a1gVwwJyDnpX3219lMUyw==
X-Proofpoint-ORIG-GUID: x4bWlDjU0shLQpAwo8mHo-alkR5rUXkw
X-Authority-Analysis: v=2.4 cv=LoWfC3dc c=1 sm=1 tr=0 ts=690355a2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=doW-QTn4H8VJJv8t0iIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: x4bWlDjU0shLQpAwo8mHo-alkR5rUXkw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300098

On 10/30/25 1:03 PM, David Heidelberg wrote:
> On 30/10/2025 12:32, Konrad Dybcio wrote:
>> On 10/30/25 8:24 AM, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>

[...]

>>> +    battery: battery {
>>> +        compatible = "simple-battery";
>>> +
>>> +        status = "disabled";
>>
>> You added support for both non-proto boards based on this platform,
>> there is no usecase for you to disable the battery, remove this line
> 
> Should I keep the status = "okay" in the board files or drop it too?

Drop it, nodes are enabled unless they're explicitly disabled

[...]

>>> +&tlmm {
>>> +    gpio-reserved-ranges = <0 4>, <81 4>;
>>
>> Could you add a comment (like in x1-crd.dtsi) mentioning what these
>> pins correspond to? Usually it's a fingerprint scanner or things like
>> that
> 
> Sure, I looked into it, but I haven't found (so far) information about the assigned blocks. In next revision it'll be addressed :)>

Thanks, you can usually correlate them to a QUP instance based on the pinctrl

Konrad

