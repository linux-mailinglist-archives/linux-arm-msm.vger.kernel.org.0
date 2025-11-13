Return-Path: <linux-arm-msm+bounces-81594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE501C56FE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 11:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29CBC3B8E1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 10:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C597C331A73;
	Thu, 13 Nov 2025 10:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BZ/mzdf8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V/igIplb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD5C2DCF44
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 10:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763030522; cv=none; b=nrAzxExbw6NDQLkFPCaR/jEMVPbHyzq5zkxvCbAhxCZf7S8mY/kYleioAcfgeNFY/TQCh3vDt/939iuwmCznj1tzx3vfhtYDW62QFRIzHwnALPLaQvEkENLp3LY6kLehuWw3oSKEOP2kIVZntiuaHAheicVwB4flqUwyjDZuZoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763030522; c=relaxed/simple;
	bh=hXnD6LTmh4guVB4bmTUA8Fa8BRB+LUsKMsPfTIUEKcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m4sgMl2zio60yo7u395QAgIqxxyK1ghzoICII9Ck6S85nauVDruHyzbLx7bG6wPSm45FbH/vIdj1rcz3wkFNUWxouyh9iS/WjFP13rAfTc3g3oRWWdQ9r7Gv8vilx8cz0ppTk0ROllZnBk6o89DIp9TnogLjA6dseEMzIi3lyN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BZ/mzdf8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V/igIplb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD8vJB43113231
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 10:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E/2GHGKMHH3/peG1/WgTL/Kznds7LnX+Rx8aV6ZmG/8=; b=BZ/mzdf8FsUTa5S8
	S2PuVk1AwG5OQRuzNiulTYOFRsh+hNX0yI3ePguikeODvXjPfGiTR72vgNNBCfb3
	WMycOihk6RzTTlbriof7ZTKm+8uf6u065W8fgzog5tty1v31cKnED+257k9XcGhv
	AsiF3gMiTlzFRn3ADtScIoeuXtG/ZCDQc8S1NDfdoo/YpE7N4VbA3NZfTN+VUmzG
	tTTk6PLKJCqpNmabG7T6qybBT3IK2BCJyq1fvm8MlE8mWkSv1QHgSoKJa2wjbZej
	RIl8i8/PVOsaL0QVr+WhOzgifa4xnrPN90jbZoX2D8xpqAC/PX6/Ldn2dF8u0r/G
	SY7RRw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acuw4bgjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 10:42:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edaa289e0dso1996281cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 02:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763030519; x=1763635319; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E/2GHGKMHH3/peG1/WgTL/Kznds7LnX+Rx8aV6ZmG/8=;
        b=V/igIplbnyJkCBteF40UyjJ4zYpfKq+J/ZiU//itJZwAdPdDLIcz7FIskjke+NT/YL
         2RbVPaTfusguIsjOf+/XsyzYEiqwGTlaQyEH337lXJb/KioBUzgI6TM7V3LJDSr2XFMx
         Wex9wa9/gLDd0aWKYeuyFki4vT+gm8/RbTzQdOJrgoHIm5e/X0Y5s8xOcnxlUrwteJ6u
         +/ksSja7fFbqPUoqR+E2uNAQUgTl6Cs3B9xk2YDXLQvyzlTbyFdryZdsA8qJKfnrK9KD
         Cga71tIEtW84cpc4T7TPfrVNVTkdTiy2Awww3471lJjNswEYprdXV/x7CwOVLQtvHUAu
         5+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763030519; x=1763635319;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/2GHGKMHH3/peG1/WgTL/Kznds7LnX+Rx8aV6ZmG/8=;
        b=LumACkP2gi5BOxz4aNorGrmyedQaoH327OViH/FEwSBgeS2dACWY5XQIrCNXzPxRjJ
         TMZb6S3aBhZCvlcMmDw8fR2uk0hlhwqSJYRkfPHDmF9WZvxtvueUlclI3Vmj++HdjzJG
         DzMElWxk2226+w9ahlySOjISCVtYwUg6jhrbjYrGXBVwif4fILrK2qkJKz9g9gH2zRaE
         d8ReHmXmX63MMvRcf0Kom27uupD6aMn3KLR5rPO8SyrX3Jvu5rJZ/am3otaFQTKqWn5p
         OA0k+3emCvGNM24CRzMJ9SpqCiN1PO/X1us9scs4dny2xDQfNI1ydpv80JLrDxgYmjYX
         4AkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwP9FWqO0vO2SRgBYdwHINbP3UjmQPiu+c+donSOE7hVr4u3M43f1C7UsRIHVeyVK6+4Z5KMXSRq4pp+O/@vger.kernel.org
X-Gm-Message-State: AOJu0YzORd6odf26JijvR7amce9HwENQiXmYjdLF6CbDYR2/VAhw89Q/
	QH8CSEWtZkOl7umbodT7/8MWG4aV9lyEOMHZFnhQkt26Kv6TcudXDQJHk4xShcml9nenMY02+8O
	jRpg1cWG4POD8rszT0mVIG182lh7JgG2FAqdjKYEpvDE/s5Lmn/vTJLBzhlPScvl8eM5V
X-Gm-Gg: ASbGncv9sazfXXy1yXM2FByUncO4xa/g/h4EssaDATnL4H7OwDQCGIhSAE87f99h4KF
	vRM7x/9xDAoLNn5fQCbEP4wAc7LCUVvLd3xnenamNL7bZW+VpgH/6LmwN1KraZNoho2o8nooIk4
	j9YUAG6w0ctYS2E1dWHMTvaWQm0oae7BGc+dlP2TOgqHoC58UDZhwFtKJEUoTFINB26Gp6U+s5b
	/uJXHBwxd1QG9hvmLAftqXKGS4qXbItdo+4Q0Un2vwKW/eRoZCmLGKZ3ey1quceyyrIH5o7leP/
	jcNRjds0IV/82uive8Q/6IsHXIfMQ5b91E8p+MQNEFunMX134aTHcOjjwUTWsF8PDGGiM1gw22W
	O4/ht68YELJe6nVyMtjnGbAQiZXUph4uzHb5jdaPTyIeiw2eqZcOxwZau
X-Received: by 2002:ac8:5dc7:0:b0:4eb:9cb1:c290 with SMTP id d75a77b69052e-4eddbc9b895mr53790301cf.4.1763030519290;
        Thu, 13 Nov 2025 02:41:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrcl4+qTqOk0GNCNMWbcWMtXYz2d4n4q2FotMPgIrNQP9oX8JoqbWJTtwwS/ePssboaTi9sA==
X-Received: by 2002:ac8:5dc7:0:b0:4eb:9cb1:c290 with SMTP id d75a77b69052e-4eddbc9b895mr53790161cf.4.1763030518787;
        Thu, 13 Nov 2025 02:41:58 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad41e5sm136107866b.19.2025.11.13.02.41.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 02:41:58 -0800 (PST)
Message-ID: <f0dc9c49-93af-45d3-90a1-6f098a036afa@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 11:41:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for Kaanapali
To: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-mfd-v1-1-6c8a98760e95@oss.qualcomm.com>
 <b623c7f6-f28f-49ba-b6f6-25084117a6b3@oss.qualcomm.com>
 <l4mb5pi7kz7uuq6o3eueoxl2ngt2sdd6dv3kyudw6i54co5v5h@w6ya2nuas322>
 <ad00835e-bc20-4f97-aba6-e1b4f5e97191@oss.qualcomm.com>
 <f2q7a7r7quq6pplcn3kklwrhdc6hxa5zvc7osygshtyurwyvi4@t5iyragt7irh>
 <b5ecf5e7-4dc4-41ac-9b56-7c52afacb950@oss.qualcomm.com>
 <01de9616-825b-4fbb-83cf-e0bf91e8cf39@oss.qualcomm.com>
 <81174278-c3c4-4dc6-856e-b58aa2cb6fea@oss.qualcomm.com>
 <br3fmilhh7fihv4atnf4olvy4w66z4p7sh4ypicuc3766ky6tb@pppfdynfhfz7>
 <bf706156-1413-42cb-a463-803063c347fc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bf706156-1413-42cb-a463-803063c347fc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sf7z7HVaRLVEYFdfty0EeoNWweadMcDx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA3OSBTYWx0ZWRfX5lajhBd1M/cp
 BXHFUdn7wbEBk8tP3zxoHOVyL4VINm9vD/qLoqB4M9wi/jkODhBv5nmOCksIaLv8IUXc5NOKbhh
 nNy5xaUFDMS2rQKqfQEq1K3k7NUA5pVMJsIPVPgsoknvHmZfoyuVKsedRctYfiXA0qHb5+ckaEf
 rwn57xOG/a7gahRgBYPj6SNnkJDZtnl0hDSbQOjy9jzzIOcSU6il/sf2hfMx95B59FgN8MCylEb
 w1luAAWDve01hlhKuIEfGzgcP/SZ48s0iwBRHZl3dO1omSiYutTb3j0W6EERU70HHqWgsC9QV5q
 3fzKSRLcSHe0YHAcTBrMa5gyNTsaFRZ4/gWvg2lRPYR5diORwi0s/C/TCIFBIsSMGXyyTJf/op/
 3bwlVMUEKZxQz35P1fBcqxx/LPEaUw==
X-Authority-Analysis: v=2.4 cv=F+Bat6hN c=1 sm=1 tr=0 ts=6915b5f8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=q7Qu6pG9dnr7vhMOZxIA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: sf7z7HVaRLVEYFdfty0EeoNWweadMcDx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130079

On 11/13/25 11:03 AM, Aiqun(Maria) Yu wrote:
> On 11/12/2025 12:05 AM, Bjorn Andersson wrote:
>> On Tue, Nov 11, 2025 at 08:27:17PM +0800, Aiqun(Maria) Yu wrote:
>>> On 11/7/2025 12:24 AM, Konrad Dybcio wrote:
>>>> On 11/6/25 11:16 AM, Aiqun(Maria) Yu wrote:
>>>>> On 11/6/2025 5:06 AM, Bjorn Andersson wrote:
>>>>>> On Tue, Nov 04, 2025 at 01:35:01PM +0800, Jingyi Wang wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 11/4/2025 12:02 PM, Bjorn Andersson wrote:
>>>>>>>> On Tue, Nov 04, 2025 at 11:34:25AM +0800, Aiqun(Maria) Yu wrote:
>>>>>>>>> On 9/25/2025 7:23 AM, Jingyi Wang wrote:
>>>>>>>>>> Document the qcom,tcsr-kaanapali compatible, tcsr will provide various
>>>>>>>>>> control and status functions for their peripherals.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>>>>>>>> ---
>>>>>>>>>>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>>>>>>>>>>  1 file changed, 1 insertion(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
>>>>>>>>>> index 14ae3f00ef7e..ae55b0a70766 100644
>>>>>>>>>> --- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
>>>>>>>>>> +++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
>>>>>>>>>> @@ -48,6 +48,7 @@ properties:
>>>>>>>>>>            - qcom,tcsr-ipq8064
>>>>>>>>>>            - qcom,tcsr-ipq8074
>>>>>>>>>>            - qcom,tcsr-ipq9574
>>>>>>>>>> +          - qcom,tcsr-kaanapali
>>>>>>>>>
>>>>>>>>> It looks good to me. Glymur didn't have this functionality verified yet.
>>>>>>>>
>>>>>>>> You spelled Reviewed-by: Aiqun Yu <..> wrong.
>>>>>>>>
>>>>>>>>> Remind for review.
>>>>>>>>
>>>>>>>> No need for that, reviewers will review when they have time.
>>>>>>>>
>>>>>>>>>
>>>>>>>
>>>>>>> Hi Bjorn,
>>>>>>>
>>>>>>>>
>>>>>>>> But that said, most modern additions to this binding follow the common
>>>>>>>> format of qcom,<soc>-<block>.
>>>>>>>>
>>>>>>>> So I would prefer this to be qcom,kaanapali-tcsr.
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>> Bjorn
>>>>>>>>
>>>>>>>
>>>>>>> qcom,tcsr-kaanapali is used to distinguish with binding for GCC:
>>>>>>> https://lore.kernel.org/all/20251030-gcc_kaanapali-v2-v2-2-a774a587af6f@oss.qualcomm.com/
>>>>>>>
>>>>>>
>>>>>> So, qcom,kaanapali-tcsr is the clock controller region of TCSR and
>>>>>> qcom,tcsr-kaanapali is the non-clock controller region of TCSR?
>>>>>>
>>>>>> Sorry for not understanding that earlier, but this doesn't work for me.
>>>>>>
>>>>>> It's a bit of a lie that TCSR_MUTEX is a separate node in devicetree,
>>>>>> but it's always an nice chunk of 256K in the beginning (or end in some
>>>>>> cases?) of TCSR. But for the rest, there should be a single tcsr node in
>>>>>> DeviceTree and that one node should be a syscon and a clock controller.
>>>>>
>>>>> I've been dive deeply on this tcsr block. And actually the tcsr clock
>>>>> controller part is a very small trunk size(0x1c) of the tcsr block. And
>>>>> this block have contain other multiple purposed sys registers. So maybe
>>>>> we can have a more discussion on how to have device tree node describe
>>>>> this situation? It is not straight forward that to have a non-tcsrcc
>>>>> related area being described in tcsrcc.
>>>>>
>>>>> What about option 1 (tcsr_mutex + tcsr_dload_syscon + tcsrcc):>> tcsr_mutex: hwlock@1f40000 {
>>>>> 	compatible = "qcom,tcsr-mutex";
>>>>> 	reg = <0x0 0x01f40000 0x0 0x20000>;
>>>>> 	#hwlock-cells = <1>;
>>>>> };
>>>>>
>>>>> tcsr_dload: syscon@1fc0000 {
>>>>> 	compatible = "qcom,tcsr-kaanapali", "syscon";
>>>>> 	reg = <0x0 0x1fc0000 0x0 0x30000>;
>>>>> };
>>>>>
>>>>> tcsrcc: clock-controller@1fd5044 {
>>>>> 	compatible = "qcom,kaanapali-tcsr", "syscon";
>>>
>>> Remove "syscon" here. Not need for tcsrcc fallback to "syscon".
>>>
>>>>> 	reg = <0x0 0x01fd5044 0x0 0x1c>;
>>>>> ...
>>>>> };
>>>>>
>>>>> What about option 2 (tcsr whole block + tcsr_mutex  + tcsrcc):
>>>>>
>>>>> tcsr: syscon@1f40000 {
>>>>> 	compatible = "qcom,tcsr-kaanapali", "syscon";
>>>>> 	reg = <0x0 0x1f40000 0x0 0xC0000>; //align with the whole hardware
>>>>> block design.
>>>>> };
>>>>>
>>>>> tcsr_mutex: hwlock@1f40000 {
>>>>> 	compatible = "qcom,tcsr-mutex";
>>>>> 	reg = <0x0 0x01f40000 0x0 0x20000>;
>>>>> 	#hwlock-cells = <1>;
>>>>> };
>>>>>
>>>>> tcsrcc: clock-controller@1fd5044 {
>>>>> 	compatible = "qcom,kaanapali-tcsr", "syscon";
>>>
>>> Same here, don't need to have "syscon" here.
>>>
>>>>> 	reg = <0x0 0x01fd5044 0x0 0x1c>;
>>>>> ...
>>>>> };
>>>>
>>>> Is there anything wrong with what we have done for x1e80100?
>>>> ______________________
>>>> |             |       |
>>>> | TCSR_MUTEX  | mutex |
>>>> |_____________|_______|
>>>> |	      |       |
>>>> | RANDOM_REGS |       |
>>>> |_____________|       |
>>>> |	      |       |
>>>> | TCSR_CLKS   | tcsr  |
>>>> |_____________|       |
>>>> |	      |       |
>>>> | RANDOM_REGS |       |
>>>> |_____________|_______|
>>>>
>>>
>>> Second you! We can firstly have a option selected for kaanapali, and
>>> then other platform can be followed or fixed afterwards.
>>>
>>> Here suggest to have option 2 which is remove "syscon" from tcsr clocks,
>>> and only add the whole "syscon" to "tcsr" whole block.
>>>
>>
>> I think you misunderstood Konrad, or perhaps I misunderstand you.
> 
> Maybe let Konrad help to explain more here. I thought the chart below is
> very clearly indicate the tcsr_clks is only part of the tcsr block.
> 
>>
>> This is what we have for Hamoa:
>>
>> tcsr_mutex: hwlock@1f40000 {
>>         compatible = "qcom,tcsr-mutex";
>>         reg = <0 0x01f40000 0 0x20000>;
>>         #hwlock-cells = <1>;
>> };
>>
>> tcsr: clock-controller@1fc0000 {
> 
> 
> It is not a clock-controller start from 0x1fc0000.
> 
>>         compatible = "qcom,x1e80100-tcsr", "syscon";
>>         reg = <0 0x01fc0000 0 0x30000>;
> 
> This is what we have a discussion initialized here:
> "qcom,<platform>-tcsr" is only a tcsr clock controller binder, reference
> from [1].
> "qcom,tcsr-<platform>" is a common tcsr block. reference current binding
> patch.
> 
> For below hardware block information, is it really a recommendation to
> combine the tscr block with tcsr clock controller all together?
> ______________________
> |             |       |
> | TCSR_MUTEX  | mutex |
> |_____________|_______|
> |	      |       |
> | RANDOM_REGS |       |
> |_____________|       |
> |	      |       |
> | TCSR_CLKS   | tcsr  |
> |_____________|       |
> |	      |       |
> | RANDOM_REGS |       |
> |_____________|_______|
> 
> [1]https://lore.kernel.org/all/20251030-gcc_kaanapali-v2-v2-2-a774a587af6f@oss.qualcomm.com/
> 
> 
>>         clocks = <&rpmhcc RPMH_CXO_CLK>;
>>         #clock-cells = <1>;
>>         #reset-cells = <1>;
>> };
>>
>> This is exactly what I suggested above and Konrad is asking you why
>> this doesn't work for Kaanapali. The addresses are even the same, what
>> is the problem?
> 
> The problem is the current patchset document a separate tcsr block as a
> mfd. While the suggestion here is to use the tcsr clock controller
> binding to document the whole tcsr block which is not belonged to tcsr
> clock controller.

Neither Bjorn nor I see an issue with this. Clock controllers are usually
not just clock controllers anyway. For example, all of our XX_CC blocks
also include resets, power-domains and various tunables which are often
not used by Linux

Konrad

