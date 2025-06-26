Return-Path: <linux-arm-msm+bounces-62587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FD8AE9895
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 10:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAD87167C18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 08:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809EB26FA57;
	Thu, 26 Jun 2025 08:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G+jVVRcz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44EF1A254E
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 08:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750927087; cv=none; b=mOYDJGaHrimfxfcAgHg43AOKiQXLyyzBxhwu6gUeDEipehA0VrMK89CG/POeOZQlW6ig05OogX8Yg3sD5CTzPXfNQVQqW4x5NsREYxy4H/ca2WWVGvJDaUJ96lfkjORqzclXZFwpnlmreTBD/7vVduhqAT7WPMFe/wHPgWtIvxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750927087; c=relaxed/simple;
	bh=jx/K8tygJjGoas2i+iwGNVNUm3+ZqzRYN3QILlGvNsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R0jL0maeLDTHMFFiPSNKrk8K6bDLI5W9ZxHVQClpDyRLCY0lZdCif8EHJt5Z3k6KJ+g+6xqvIvUOJkOSSgc9E4hKl5LpY9UR+APG7NzSNjlz+2s/HFA2sL8mUU4Dd21fkhnfBJGH+tcsix9QT52vdMVweaC9SG9+AXIPe7Lloak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G+jVVRcz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q0FecG006382
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 08:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DN2gLQs/N6h7C/Maw6kExG3LolsSEMumqxKA8yzbDWk=; b=G+jVVRczn7E5t1VS
	BvsKRC8qcTsKEUeaXW0U0e/0JvKx3jEtD8QdM/lT1mgS5sKanN1sFYO/B8xAP+L/
	6zg5gmuwqNWubZ9MTy/Vh4GXo0hO/pZ4KpQL4/cYZ3FrTFTWp6IBSPw9yWoK7Omj
	Voqq71EXzalVwtTxQQDeTN2YJ+XKqizHO2xO2I3tvwUrHRK8vRtz9Cvq1Su2Hq8r
	UPd7ZeuOeUVjvW7WXbbI3OEAiYBW6D2gAPahmXTvW79Ww5PLwAXLFYEeCtIabsR3
	LFQAKph9B4oZFKPYUjgFX3Cb9bPzXXggRyxJ+34bHzGEUYLcatIRTloBj69f+nS4
	W3wm0w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmvb7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 08:38:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d09b74dc4bso17045985a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 01:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750927083; x=1751531883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DN2gLQs/N6h7C/Maw6kExG3LolsSEMumqxKA8yzbDWk=;
        b=vaEKtAQm2T3IWRZhim7IeEym3KgLG5jdxoTtsV8j51VW10mtCfyVV7YWouizmam0fA
         ktvSv1BN57kCK49XoryE5JxqAjWjswjTdAF1i6uh/H+siDHpbXVgcLmrZ2udf5C7xmvy
         xSRUNa8ZAI4ngerslj6zHDZWLWQUvYwEg+abgl1NsBojMhgaAUX117t2K229DV+/hGVr
         PsbhFC1bwh/WFGaFEuDPqvqwLp3Pplgt9FtJAJ4L/CuXp4Ai5gUCL4xGokXlzziu9iQh
         ggac8sneNLpU90t819XBRLA0mehVUYZ8ILmQwxK9X30q5bOZTJ+f2Zm+5swzLi00WXaz
         a6Iw==
X-Forwarded-Encrypted: i=1; AJvYcCWyO+sotUhlqUQwPzu319jLHgR3fjeretxqMQOZrVPvVXdyJfprR8r8vm6HmFKpNdXoMr2wK6FWhb+wQ6fw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/YiO232hikC9xTznxX88T3xlT/80063dUABWdYzABqaioWkmg
	13t3iNnEAO6UQHYjgrlGIbxPVtOOjLg37BXUXj/sknp08ek2qcP2axYGSihfKiVu4K3w5zdkHvz
	UKpjJezZkCPyE0M9rf7+8zkWu2CJLdfe4q2vqhWhBuV/SnGmNXaUwsmFW2+vZg+Q8llSC
X-Gm-Gg: ASbGncvISjsQjroFkjfXkd5ROontfIbz3F3kNyVjO683uSHSuohEYrR+KlmPI+Huaju
	1t/g4aIKZGh0UDXEyf2PzNlaAbOGyNgz6yuc06AgnV+OVvBW6P+wb2oeAvC7xS9df3bI1tcFhcf
	zrhFkvr/KvIupMPtdTgkmsbOzEe5ZLLCptPLoaS2ZXTBkVP1wRdE1iXYmvhmonumtARc2bw+m7/
	s1NI9R6IWV0Ru0Es81he36H/Gc3JuqC7zd7E8xNYzhFri74IZ4V2aJ3G0DBWd+uihbyNRmUsaH5
	lpiKfagnaNCfqbVCaUxQiJTbUkgjMIqsHocf1zg2fkGp5fEg3lM6nycQtnlqxe8glpVUvHkZZRe
	d8HQ=
X-Received: by 2002:a05:620a:394f:b0:7c0:c024:d5 with SMTP id af79cd13be357-7d4296f07camr348015485a.8.1750927083674;
        Thu, 26 Jun 2025 01:38:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEE8XRSLwrca8EjF9FheFZBFZEGiaUI959MuTBNXXt+9+gWR0YgIVeiXbqyruvrR19c3XdKiw==
X-Received: by 2002:a05:620a:394f:b0:7c0:c024:d5 with SMTP id af79cd13be357-7d4296f07camr348014285a.8.1750927083307;
        Thu, 26 Jun 2025 01:38:03 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209ac4sm1177132466b.169.2025.06.26.01.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 01:38:02 -0700 (PDT)
Message-ID: <39d6a38d-6728-4998-aca2-23138677123b@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 10:38:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add bindings for IQ8 EVK
 board
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20250623130420.3981916-1-umang.chheda@oss.qualcomm.com>
 <20250623130420.3981916-2-umang.chheda@oss.qualcomm.com>
 <aFy7wEmP0EzGUHX+@hu-bjorande-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aFy7wEmP0EzGUHX+@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rsSnQ8zKntq1yvqaqWUymX9J19y-20LG
X-Proofpoint-ORIG-GUID: rsSnQ8zKntq1yvqaqWUymX9J19y-20LG
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685d06ec cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=2leXWRGikYLyCpLsO-IA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA3MCBTYWx0ZWRfX5wwGZmk2ysoG
 CBGKOEvqqo1bpZNVgRnK7GeE77DNCaQ4p68RIWW2pwKlC1j+NK4e62/fgW0FNWXOO71VXYrvwxx
 9wcHCRZxwyFo7ry4BnzbU9Wc+lKefnqB64vBIoRFrbVx8X1wkXjTNRk3uFKaRLvTvL6+ZDuNBtP
 uF/ReHocWRbKEEA/iSRnXbLVdxfOMGKYpPn7XNiAugkBrNHd1CV5jL0Buz/D/WyWp8xEWhzHlhH
 AfhGczI23M2VTOZ2GdOPBGAXRoDBuqNb60FtxP18Rfz4vSAjzHyMxIKka8ctlnF+i0C+Fpi7dzs
 CZaOR4ls01eJG+mmIpJ63j9KJZEbaqQODQsUrvxo+l3Y1aW9V8EG+dEON4yUjgjEMJMfOVuLLXy
 amGy02nXrjCHCHhWS1PqZ+6Q52WjdeeajAPp86FPVrIs3PVvuSmdhC+dSJw8LL8oyu3OrrHu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260070



On 6/26/25 5:17 AM, Bjorn Andersson wrote:
> On Mon, Jun 23, 2025 at 06:34:19PM +0530, Umang Chheda wrote:
>> QCS8275 is another SoC under IQ8 series of SoCs. Unlike QCS8300
>> which has safety features, it doesn't have safety monitoring feature
>> of Safety-Island(SAIL) subsystem, which affects thermal management.
>>
> 
> QCS8300 and QCS8275 are both the "Monaco" SoC, with some differences in
> which nodes are "okay" and "disabled", and as you say here some side
> effects thereof.
> 
> Describing these as "Monaco" and "Monaco with Sail" would lend itself
> for a better structure.
> 
>> qcs8275-iq-8275-evk board is based on QCS8275 SOC.
>>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index b14206d11f8b..19823bc91a3b 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -54,6 +54,7 @@ description: |
>>          msm8998
>>          qcs404
>>          qcs615
>> +        qcs8275
> 
> Please add "monaco" instead.
> 
>>          qcs8300
>>          qcs8550
>>          qcm2290
>> @@ -935,6 +936,12 @@ properties:
>>            - const: qcom,qcs404-evb
>>            - const: qcom,qcs404
>>  
>> +      - items:
>> +          - enum:
>> +              - qcom,qcs8275-iq-8275-evk
> 
> Please use the qcom,monaco- prefix. Is qcom,monaco-evk unique enough?
> We can sync up offline on this.
> 
>> +          - const: qcom,qcs8275
>> +          - const: qcom,qcs8300
> 
> Please replace these two with just qcom,monaco.

We could in theory keep the SKU id as a penultimate entry in the top
level compatible, but I'm not sure it makes sense given what we want
to achieve (just thinking out loud) - exposing soc_id through
qcom_socinfo & sysfs seems to be enough, and if it's not, we can
handle the odd cases separately.

All in all, let's go with Monaco.

Konrad

