Return-Path: <linux-arm-msm+bounces-62801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA06AEB958
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 15:58:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC3FF1C44792
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 13:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F492DBF4C;
	Fri, 27 Jun 2025 13:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p6mlJ+Z8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B2F2DA74F
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 13:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751032688; cv=none; b=VYHRPH3qkqoo0kgt7K7FLcCULed760pYxus42pZpEWTUUDeCgwkkW4V7Or959WUuLp6wS9Bm+98BReW9HfJNSN0oVahWlFhqE8LaPC1/tmTDwNzJPlX8jFVtqrBe4oAKkv0/UVF4aFclpuzhLakq8FSvASA2rUuXJM+jFZX9tRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751032688; c=relaxed/simple;
	bh=PbW+EBtMztzzi8ICMRD/REkIEiRuhchOsk7eMRuZuBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tl0lbfvRbGGruLJOb6n/ueYg4i0n0rmdDmcKrmak4XyFO9/sPwMLsZ0BN4nzjB0qASlplV+yWmZ5B1h3RPh73+0Wiy6h9qEWvBP1YLBBTvc7Sb64/PW1VutlwjnD+oN7u8gnw+ePNc+j48dEOkMJ1w/brOo3F438MXqHYIYXX0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p6mlJ+Z8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBtHYK003247
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 13:58:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8f9O0TugmOaHYNQ6bPlsLyE5Zw/b0P1alMxsrUiNUbk=; b=p6mlJ+Z8/Mn9RTiu
	zP89Q+yg5MlMjJgCTmhPia3MawoftVFvRTBG3Cbu6lTTeW3nSRmHLOfV/eAzBKJS
	l/z4dfdNOCuu/drw2CPhWpTiu6a2LIaBEk/oWRIIDNKRQzisZyR7owTrWqZLaTOl
	sOqnhG62sCoxduAS1OXEi9XA/2qsHiWc8QK4p9TGOaFVlWNYy2XhaRHQLiNsPK+V
	Y8AijlKN+LUb+3446GZImtZAwfpYtiS9n24FPRw7BLkxCL97biOxqR1Cxvj2oqJq
	mLyQWuecK1mxYDaPlrxdsHs6zQwxLgm/QDYEj/c3FCPKKUpi8GbyEDWbSCSrF0ip
	NdNnVA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdh267-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 13:58:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d097083cc3so47144785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 06:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751032684; x=1751637484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8f9O0TugmOaHYNQ6bPlsLyE5Zw/b0P1alMxsrUiNUbk=;
        b=taH7yZkU1I9bpULtzVP1Awq45pycD99Gz0ikIQA2cd21SXT9PjsYQPHs9d1sHezgQv
         s9vpvQbFK29NOMt/LfjXsze5m0gYZ7XnwrGXCcBmzdNDdFdHiHdqVcL3cqesWgw2dldZ
         /vMFVnjaIjLMikP2JoQAysHXQQeU8GUpV7Dy+iB32H9rgfjsN6dwQXxoD+WcghOvLZAc
         soHXe8tpMrxW7MKhZ6taOt42egyKaiZiThvwdwvmJ8gF9hJ469J1HLfhXFRmFQZJ01vh
         tSe/rz8nQ703k5CrFh7lDsUwmmRJQN80cDn3Pvmih9ZhGpohqAT5mhtkh6d6HqhU9WJl
         QcYg==
X-Forwarded-Encrypted: i=1; AJvYcCXjPulpyAYtqFVvpLuzBXLmHdh9ufBrIRqrMR/rvffWGnbT0iZQ2eZG72xuPFlH6jtYZvdtVRojul0pS7J3@vger.kernel.org
X-Gm-Message-State: AOJu0YzOFK59335Q+rW/WvSIscEXAUxv9NuO05PnxWaUh+B6p/eJkzv4
	BmYyyF1eBy8Km+Knfzj7V5VildjCXIamv8vcFj9CKrdDNNb5Kagnt+RUyJzoAuwhkJioPHHp9Yq
	oMNtWOfdM1JzYIzSnvum8GnpjAugQxt5c/pMrc1A4sotni382ufVywpWdUfvz1kaDqKtAMdFzpK
	M8
X-Gm-Gg: ASbGncvTlGX9xiOmAYVY/OMcEvPScBCfJMYhWgrkx5erksZuBJku/wxYyPTyJqSqIVK
	nrFPI/MNIVUxGqINtH3T+0YOcPEJVcPE1X8BTVdcPrsuWRX1qONRfwH5Qyn0m+76PKXrSAbOMol
	P++7Mv9cEENd1kbIYMAiY5dTMZ0X4gFc2EZ/iCNCMcqSWJBpMvZ0nbEM5WNBJivu6lnXFpKTqiK
	RrjPqwLlp4a3u2q0+l04ByVNNexNvwdr7fNyUaAgxzjihxQ1OA4MXHxg2BdTN7ZkT+gyxPfHiOC
	b/0AzCqMzJvERopOohrJxgqMamM1w4e5BgNWe2VaOojvlyuwLjWD2XPqi01fIX7mQHtKdS7FBjK
	G/J0=
X-Received: by 2002:a05:620a:4606:b0:7cd:14b:554b with SMTP id af79cd13be357-7d4439a5828mr185946885a.10.1751032683935;
        Fri, 27 Jun 2025 06:58:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsqCNx5b/ikeBt7ufEGaLEu1rBhGNo0bQDVX9XSB7OyW/vrELCoJjxuw9x+u5urdhndBoKUA==
X-Received: by 2002:a05:620a:4606:b0:7cd:14b:554b with SMTP id af79cd13be357-7d4439a5828mr185943185a.10.1751032683377;
        Fri, 27 Jun 2025 06:58:03 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b1fdsm131221366b.14.2025.06.27.06.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 06:58:02 -0700 (PDT)
Message-ID: <99b9e6aa-36b4-456c-ba46-6e1207cc1019@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 15:57:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/4] dt-bindings: mmc: Add dll-hsr-list for HS400 and
 HS200 modes
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Ram Prakash Gupta <quic_rampraka@quicinc.com>,
        Sachin Gupta <quic_sachgupt@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_mapa@quicinc.com,
        quic_narepall@quicinc.com, quic_nitirawa@quicinc.com,
        quic_sartgarg@quicinc.com
References: <20250122094707.24859-1-quic_sachgupt@quicinc.com>
 <20250122094707.24859-2-quic_sachgupt@quicinc.com>
 <72b02fd1-5195-4bb0-b01d-5481b49a5680@kernel.org>
 <379e9199-4a9e-cd38-20cb-0fbd76fa33b3@quicinc.com>
 <abdde4ff-eae2-44c4-8608-89c762790549@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <abdde4ff-eae2-44c4-8608-89c762790549@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685ea36d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=v25VQKkRDONtiw5Uw7IA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDExNSBTYWx0ZWRfXwhT8A+aY8s82
 xas2JJTyG8kwSDQ9ixNFQTqXRQuXEl6tLymHkGc5NP2zIdrd2iwuZsvZk+MLtj8PfchXWYfaw8f
 m7QXyeAcolBqwVwk3mONVGsYetUB7jJ19l0yOveatgmtthv1bTBJP0s8iR6lf3EgfDuih5jeRmL
 vNfuqX052A8dkIwsgUEKMcyrQjjtoQdumiSEV0lE06Z4Wio2YzXiAGcEozuLANcN4M90FcP8DhV
 GUvr86JWMx5NFXpQmm3YBw9WYZ1XL6I2aT/tCYXCadEVQ9koleCtZNDv0tAM3twlpYFywIoiE2/
 T8+0k1EuR86Gv1MoLB++9bFmm1Ez8sOpjF7l4zavct+z/UGF4s6H9GAJSZRIKTfTtrN0j35xSOn
 doBw6lpU729X46U2V/BR8jG2xaN4I6TkvK1Z/g11pX4tdVylPU14ffWzwBP3hH3OAy58W/6q
X-Proofpoint-GUID: 8e9LPsmwR3YHQP6b3R5OAglK1CBOc9iD
X-Proofpoint-ORIG-GUID: 8e9LPsmwR3YHQP6b3R5OAglK1CBOc9iD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270115

On 6/26/25 7:42 PM, Krzysztof Kozlowski wrote:
> On 26/06/2025 16:16, Ram Prakash Gupta wrote:
>> On 1/22/2025 3:56 PM, Krzysztof Kozlowski wrote:
>>> On 22/01/2025 10:47, Sachin Gupta wrote:
>>>> Document the 'dll-hsr-list' property for MMC device tree bindings.
>>>> The 'dll-hsr-list' property defines the DLL configurations for HS400
>>>> and HS200 modes.
>>>>
>>>> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 5 +++++
>>>>  1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>>> index 8b393e26e025..65dc3053df75 100644
>>>> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>>> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>>> @@ -133,6 +133,11 @@ properties:
>>>>      $ref: /schemas/types.yaml#/definitions/uint32
>>>>      description: platform specific settings for DLL_CONFIG reg.
>>>>  
>>>> +  qcom,dll-hsr-list:
>>>> +    maxItems: 10
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> uint32 has only one item. Anyway, there is already DLL there, so don't
>>> duplicate or explain why this is different. Explain also why this is not
>>> deducible from the compatible.
>>
> 
> 
> Timeline still amazes me. I will be grumpy on this thread.
> 
>> I will change it to reflect array from uint32.
>> There is change with artanis DLL hw addition where it need total of 5 entries
>> (dll_config, dll_config_2, dll_config_3, dll_usr_ctl, ddr_config)
>> for each HS400 and HS200 modes, hence the new addition in dt. And these values
>> are not fixed and varies for every SoC, hence this needs to be passed through
>> dt like it was passed earlier for qcom,dll-config & qcom,ddr-config.
> 
> 
> Eh, no. That's not a valid reason. It's still SoC deducible. Don't bring
> your downstream practices here, but remove EVERYTHING from downstream
> and start doing things like upstream is doing.

QC SoCs have between 0 and 4 SDHCI instances, each one potentially requiring
different tuning, let's keep this data in DT

Konrad

