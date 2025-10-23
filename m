Return-Path: <linux-arm-msm+bounces-78610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 479B5C01C92
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 16:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10B8A3A03D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 14:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08271DFDA1;
	Thu, 23 Oct 2025 14:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L8K8R2Qz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7AB313E0F
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 14:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761229603; cv=none; b=VoaLOixQFh2XelqZZrmMez24S9YxnIphbtNCiHxjpByowXQkyHjrdxmwIRmVKyv2B3j2dTqjzIRCqZzGuq8B1oo9GXMUWQtE/KtuhSJUCLGjWdOS5Ql9YMCJ3wnlt5hELFtYGqbPN9qbC1C8Gp0aa4KceucygHkIIBMXhi3IBWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761229603; c=relaxed/simple;
	bh=6Dh7Yg0+vP21f+60Nq7W/bN/03nnTxIu+SP1Lecg8Ls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YuXvhqNQ49TLJTjSF7XujGnBsQkS85bR2rcFRQmUeIAKpJHvw9nRcXM2pFLXumu+hkUfbwLtjwEWbrcbbzdS/gBoo+b6BmGc845mf4fSV30Tex+wikYAacdiTurkvXEnHeGGcoUKfOOiHa2ozCaYQ7d/NogxoppgEC63jF60DcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L8K8R2Qz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7YlWY011871
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 14:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3WpAc+PUCG+PgTasZqEo6/+en3vqm4BKm8HG4lD3pyk=; b=L8K8R2QzWt5ejcux
	w6dtflrM4NxCFS6nDJqWNVleFx9XEbpxOoCma+8UvbOVsAG/ZbXKXNJr/OmdI+in
	N2E1QttneS0PlC1XkLkfAStjbqNFyBppQ+GfGEdUS7GSc0Kcg+SvkgTVoe1sk7ni
	coOp5rgkg4l0GJ15U2xKRqqbzx1fU6udTIYUkshywybrw2QUNyS10CIVrewIUKqF
	rxEjSZ+aRLsJyT20Ch+41JcoVB4Ef4rzyyI0xmv2UVMgXaxQbD4n3uq+Aob5ygP9
	ZN+54t4jgDgFNizM6y4ZENOSjipGQFwyF7vjLJwxmOCCSqlTPkXU/K8LqYcGQ9c6
	feAoJg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y524ax01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 14:26:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e886630291so2789331cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 07:26:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761229600; x=1761834400;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3WpAc+PUCG+PgTasZqEo6/+en3vqm4BKm8HG4lD3pyk=;
        b=axroc3Vs1grYD/gw6quA9d3zvNLjArKdtPwT1f9JqHa2CfkcVMO0rm7FuGwHFaXqLV
         1E5erWfj2czi7edfm2ukfolq8QHJRh0z9jyykIan1/tHWSTXnFruO7eqEbq3ToiTTQDn
         h77LycJiHJ0fUTmMJgpbxjWeBD22VTReQJpS2rPbnn7grXpVSfUbBMFeEIH13qlL0euN
         23l0iJ1RRkrjN1d/7sz5lpDDsLQ9i+34iP+godMSihY53e5rurE4xb7LI8bwlHadFtEP
         Em/uBvlGTJGnrQRi7JHX/TxQmtpTOazIg+5vC6L0NZKzXVx6JOd61YvUe1s4w7hICC/o
         l35A==
X-Forwarded-Encrypted: i=1; AJvYcCUoo8eUIoHNBezxawZNE8LN9y62RlyyQPbkhzlUm6R9qC3KokeZ1mUrRJkBKWArd3yBkTAiwkdSWnoPIHAo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6DJJnixgTwh3J25gO63gZb07fsUlb+nmfErFBIFqhR/ImrpRZ
	xNlR+DcYySpW6rylq8letgKfaY4f6k3VjjctOJbvhdUX93TtuoQSdq4dBmSCL5H7tOnfvTo0x0w
	NMh+HN939PHyDuUJYyUqOODVqznbY30JwYxg9ulGq6rdP/hXr478KUkCCVfsfkE/0SEzW
X-Gm-Gg: ASbGnct3PJdei1+iE/TuMqz4AtXQs3HPWKqx7T1sXYJPlGMWEN77Q5dZaztrbqaKd/p
	/Y4mDYIC1gJQ1NQL0zX/vAXpJ7O2LvHuNnhYsOMNVSpERiFh4YrRZrXCxp/P341z+UIskG0gixs
	UkLZeOYfptluTFCgQQvgjCyPbybKIRYoqdmH/3qqyzJWwZF+6KjXX+emafEaGudTky+/BfODq0g
	gf5oamZHQyFV9preO/4Rmd9JyzMuR7za1ObqfxW7jM/fHC8KgrLIzcRup4GZQlHU+fHVDPdP+Gb
	hlfAZOoep4ZZTVLYVAqIm4ukjLsSBuI28x/tZxVdg/6jLJC1YVyPd+u49B7tZS78/bRqowGk9T8
	eseyCEClZ+qVOu7tlGHjCVQHKbm+bAhSNW0iwQrBwCRx1IKM1eK9PUpGH
X-Received: by 2002:a05:622a:1b8b:b0:4d8:8b29:228a with SMTP id d75a77b69052e-4ea116853e4mr97534801cf.3.1761229600079;
        Thu, 23 Oct 2025 07:26:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5ZP14A8wZovVdz+EeQ60VU6uSydX3ml/L46LeJtOIXp78YopylnEKIB1ItmdcpXxyu8VsNQ==
X-Received: by 2002:a05:622a:1b8b:b0:4d8:8b29:228a with SMTP id d75a77b69052e-4ea116853e4mr97534421cf.3.1761229599431;
        Thu, 23 Oct 2025 07:26:39 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e3f322e30sm1795042a12.27.2025.10.23.07.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 07:26:38 -0700 (PDT)
Message-ID: <a58956a3-b9cd-408f-98af-7ec31f2277dd@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 16:26:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: ipq5424: add cooling maps for CPU
 thermal zones
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com,
        kathiravan.thirumoorthy@oss.qualcomm.com
References: <20251023043838.1603673-1-quic_mmanikan@quicinc.com>
 <1039aea3-47c6-4205-826a-636e595f127d@oss.qualcomm.com>
 <053cdafd-1abd-4f1c-8f48-9da38591fcaa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <053cdafd-1abd-4f1c-8f48-9da38591fcaa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfX72quM3MzrUyv
 PsSF4IB58lG/d5RjmxmMCEQ+cvdb6cH47WMxEA9XAWcoyJA4+aysAPsBIpxBS3O6lchY86WslZf
 Tzi4Stui0lFlFpawZkncWurB717VZ4pJEmbjLkwPZlxgXaptZMqKGBIrBtNzcm59dNPl3BjjcOh
 7I1t7xZrzbxuAbK2ogiXfpl/iOeAPjCb/n/cWEDofcY6SRu6swdE0o9oMizJSzpokWm+XoEOm4U
 JVf9c0xMtuVOb/iJPpPMiSYTHqOw7yue2Xq/yCQI5RSbUgtk1Ba98foX13LqaCmmgJJNRQEyF0b
 cEfIoQMDr9d3FmBP8XgeQ+gl0JjJNJ5YzqzWd1ZS/d6v1h5jM6KoVy1VmTCc3P4ZoFwdef4p6fW
 NOhP7iK7KLk4u0GkPehr9+4iaN9+pw==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68fa3b21 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=b9mZcHlmi3zSiLOk7sAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 5tTWaRN2bOM7ioyOJWa3aIDvZJ-pmBZQ
X-Proofpoint-ORIG-GUID: 5tTWaRN2bOM7ioyOJWa3aIDvZJ-pmBZQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155

On 10/23/25 2:21 PM, Manikanta Mylavarapu wrote:
> 
> 
> On 10/23/2025 2:09 PM, Konrad Dybcio wrote:
>> On 10/23/25 6:38 AM, Manikanta Mylavarapu wrote:
>>> Add cooling-maps to the cpu1, cpu2, and cpu3 thermal zones to associate
>>> passive trip points with CPU cooling devices. This enables proper
>>> thermal mitigation by allowing the thermal framework to throttle CPUs
>>> based on temperature thresholds. Also, label the trip points to allow
>>> referencing them in the cooling maps.
>>>
>>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>> ---
>>
>> [...]
>>
>>>  		cpu1-thermal {
>>> @@ -1254,18 +1269,28 @@ cpu1-thermal {
>>>  			thermal-sensors = <&tsens 12>;
>>>  
>>>  			trips {
>>> -				cpu-critical {
>>> +				cpu1_crit: cpu-critical {
>>>  					temperature = <120000>;
>>>  					hysteresis = <9000>;
>>>  					type = "critical";
>>>  				};
>>>  
>>> -				cpu-passive {
>>> +				cpu1_alert: cpu-passive {
>>>  					temperature = <110000>;
>>>  					hysteresis = <9000>;
>>>  					type = "passive";
>>>  				};
>>
>> This means "software will start throttling the cpufreq at 110C"
>>
>> Is this what you want?
>>
> 
> Hi Konrad,
> 
> Thank you for reviewing the patch.
> 
> Yes, the intent is to initiate software-based cpufreq throttling at 110°C.
> 
>> Also, is there nothing like LMH on this platform that throttles the
>> device way earlier, without OS intervention?
>>
> 
> IPQ5424 platform does not support LMH.

Thanks for confirming

Usually it seems like the trips are ordered by temperature but I don't
think there's a strong preference

The hysteresis value is a little high, but I'm assuming that came out of
some internal tuning

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

