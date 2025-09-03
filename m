Return-Path: <linux-arm-msm+bounces-71904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A67B424D5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 17:17:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F762168F36
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 15:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4EF341651;
	Wed,  3 Sep 2025 15:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2ny0UHt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4771A340D8D
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 15:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912477; cv=none; b=WVek8Z8PYjfjbfUS8GJPXDLQFJa4jdudZLkOj3yBJC3Fo213A1wmSvPrK0mv1vpgdWDeSdGxF/Mnee9kUpesf9ArlgyPGmjRYnDOvadWjSKDEszeME/JARQMx7/lVI0BKBfRo40UrI5Vz++GfoOW65SqqZ5OKihfcqy1fShpFuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912477; c=relaxed/simple;
	bh=AmE3vN+qmvFJO55R8itzAjaA4PSPcgcddXsqYpwHxSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WmUHdn7Stw/NZCjXrnU1dWNaTwIr6mxZvib97/hemSe7Yq3OgqLz5JiZNmdAs6r/kvPeMgh3ZBQLnU9uVJNEjtXGp6nI5ZHkDQSQQC7qRVcgzxpsXKVLVN+U3F5/KiWZwo7N8zZL4cUuQoNaLnof/Xd7AgTR5mjoTW7CzY3Ugyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F2ny0UHt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Dx4IZ000375
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 15:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h4UktVIdm2c0x5SK3djoEMrvw4KVq2MmQq9SrdZVv5U=; b=F2ny0UHtZ4m8BKGP
	Xig1qKmRBm55LMfbgSdQU/9ufvvoqSL0dGVnZ+R69YKJsqnXPEr8wIFa17M/jUsT
	JYAcCik2Pqry6a8U7R3E+91GsDM1zuDt+6Z+iYeGVq60+1L8gAddxIrU5nMjMgf1
	KXiLc9MWmawjJFHpSqVdfJdYBEs9Bqzp6DL5Zwcmot388PPS6+6b2TZCG/yacbix
	K0Ke21bWkicUeZwFCzW5KusAfkdrrJUnXe/mjCPBDGB7DgMPGrVQD+LUcMiaU3/Y
	S4jdzdfMIr8MLQrCakVOYxvlSJmP9tafv0sOjPte4oPLP33bzWIzkrH7FQj9UsWx
	2fyPsQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush3425u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 15:14:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b31f744865so14021cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 08:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912474; x=1757517274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h4UktVIdm2c0x5SK3djoEMrvw4KVq2MmQq9SrdZVv5U=;
        b=qTWk3DHUQv9xIoXOSfPCQOeHslfq0EZ46rkFXLYTjmilks+IYHgyaYfxCfE+subNZj
         2OsQVC43ZOkFWF3MDdacAajwy93H6AHUjLjrBZn3wGl9oSRrSsAV9aaoc/zl2BvKOy5V
         3jGvfkh9zth5iZh3fD5YRdT/iGo3iDN4gO6GRXtpeVLs/dTI3MiggHnf/rApo+8FFBJg
         y7aEIvHYHuyijUdzIr/5J0lW2qifi5zvfh7AGf7zWBENQwSkXtZ6dJ7HBTt7EBv+XNMv
         I3Ab7IQKgPOsxZ24077tbg5m4wGpA4GXjdhHklv1vmtQu3fGGwT6KiWynbelhOrl02za
         nlmg==
X-Forwarded-Encrypted: i=1; AJvYcCVr9p3V+ZjJumjInrtTnBqeudClgXgL9zaobAaaDhzjrExal7qczVm8smq/vmj3mMeQFksra6Q31DicwX3s@vger.kernel.org
X-Gm-Message-State: AOJu0YxvhVJktwxIIji/BTkTTaurTgP4OiDNft358b4PQNFFJTyTxRFt
	zZzjtKuz4eBvbnwng2tUpnSb3wJSWgqbfb20oS/ouLpMzU9M2+eYMtzAxl3C36CzvYrSDZps6uh
	8ouSP4okpqXKz1tUnvut9pugvqJrLkb5kvd6WN/pNwmYGJW4Mwuc+1vbAVNmYvPfAiaAR
X-Gm-Gg: ASbGncsReVvRNINwEDXTJpgdfBXAf1tgSDhmL7xucUYksvcjpQ1E9GHuavlXWSPkMZ2
	f7oXQg8S3tfzt6lmCAWOZixiG7bBjecpMYdWmUIFHLr3iA3Mas2OfWYYgiQ9U3/IUK5meJB/nDA
	8DA2Nd/m40lUQKWbCiJuOmL80kG6zPfGG61Logfy7CiuzdOekMu6680bqpNGhacOZ+xKmdl/pGi
	dIGLJnbE8zYEGua3VhXuptbwqZ93g8YJR5zdGORQAyw9EaoklJlcceQC7P6QdpV5nw7vSFCee11
	+vG15U3VIDmeWjflZI3OHoLG8DKn8Baik0oA17PGQDKpytazqwixwGYtEQ81u5m/adg4PWlJyV0
	XpY/28B9TN/QViXS1iGdk3w==
X-Received: by 2002:a05:622a:1a04:b0:4b4:95d0:ffd3 with SMTP id d75a77b69052e-4b495d11860mr13068641cf.1.1756912473907;
        Wed, 03 Sep 2025 08:14:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3ugZbdxH7Mywin5NR6XHzSclz/+UkkqzuW+1UkBm9a3K2qRCxgaknMn8ihcTkzrrBdvAapg==
X-Received: by 2002:a05:622a:1a04:b0:4b4:95d0:ffd3 with SMTP id d75a77b69052e-4b495d11860mr13068051cf.1.1756912473181;
        Wed, 03 Sep 2025 08:14:33 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b040a410817sm1034669266b.101.2025.09.03.08.14.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 08:14:32 -0700 (PDT)
Message-ID: <c3de911c-e80a-429d-8a5c-c693546d4abf@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 17:14:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-3-97d26bb2144e@oss.qualcomm.com>
 <f11b778d-eba1-4712-81c7-b83f2cb38b46@oss.qualcomm.com>
 <exkrgx6rdotfrrsnklsd7zk4ydehsk5vaoevibpqisyq2dwbd4@sa4kgnuexlna>
 <f169be5a-faa5-4824-861e-27bd2083b9cf@oss.qualcomm.com>
 <t5pxum74q3fwf6wgcbaeaginjvtjfn357pkfswvafsggtmvxfv@jl5qjfhpmmow>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <t5pxum74q3fwf6wgcbaeaginjvtjfn357pkfswvafsggtmvxfv@jl5qjfhpmmow>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX5UHTx9Oks9b2
 MH/WcCj7jdkrR/EwCqpWYHDg9oIueEz6FOtOW00ZaiZ2tHCYwfOfwfEgJEiHU/eM2wimuKLNHxl
 fHImK1x5uWnbXinReHMvwH198yLQKGdRul6U7nzufPAjnVR8binCjsAAOsw2JGMdcR5df7yNtCZ
 6da3CXsmAmDNUxvg5WUBTXsmnkqnvUYs+6fSDfMsOoD1nDKc9RCv9Zp9UClck0edZHkShfKrF0+
 pL92F2JvV+N4Ycb0RqmeaHos2MDFg6Pq/gD6W1fANit4r9ru4vWMZZsmG+c9vnvlOnJorm3xnKx
 tuESlzlAUJ1BHLEJlpclvYDJQS2oMjrHhi0gPHuCBxorIPmaxqwx5/Wiptx5o4W8QOLX4eeNKOK
 7Js5Gqs5
X-Proofpoint-ORIG-GUID: fE2yNptFu-CEHj9hnXlLTtAPLzsplVlv
X-Proofpoint-GUID: fE2yNptFu-CEHj9hnXlLTtAPLzsplVlv
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b85b5b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=dNECfGFYMPGvbPEIsa0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032

On 9/3/25 4:00 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 03, 2025 at 03:36:34PM +0200, Konrad Dybcio wrote:
>> On 9/3/25 2:39 PM, Dmitry Baryshkov wrote:
>>> On Wed, Sep 03, 2025 at 02:26:30PM +0200, Konrad Dybcio wrote:
>>>> On 8/21/25 8:55 PM, Akhil P Oommen wrote:
>>>>> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>>>>>
>>>>> Add gpu and gmu nodes for sa8775p chipset. As of now all
>>>>> SKUs have the same GPU fmax, so there is no requirement of
>>>>> speed bin support.
>>>>>
>>>>> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/lemans.dtsi | 116 +++++++++++++++++++++++++++++++++++
>>>>>  1 file changed, 116 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
>>>>> index 8ceb59742a9fc6562b2c38731ddabe3a549f7f35..8eac8d4719db9230105ad93ac22287850b6b007c 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
>>>>> @@ -1097,6 +1097,18 @@ ipcc: mailbox@408000 {
>>>>>  			#mbox-cells = <2>;
>>>>>  		};
>>>>>  
>>>>> +		qfprom: efuse@784000 {
>>>>> +			compatible = "qcom,sa8775p-qfprom", "qcom,qfprom";
>>>>> +			reg = <0x0 0x00784000 0x0 0x2410>;
>>>>
>>>> len = 0x3000
>>>>
>>>> [...]
>>>>
>>>>> +		gmu: gmu@3d6a000 {
>>>>> +			compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
>>>>> +			reg = <0x0 0x03d6a000 0x0 0x34000>,
>>>>
>>>> This bleeds into GPU_CC, len should be 0x26000
>>>
>>> gpucc is in the middle of GMU, see other platforms.
>>
>> This is not the case here
> 
> Why? I think GPU CC is a part of the GMU by design: GMU accesses GPU CC
> registers directly from the firmware.

Correct, however this is only a similarly sounding argument - the DT
describes the hardware from the main Arm cluster POV. The GMU Cortex-M
core has its own address map etc.

Konrad

