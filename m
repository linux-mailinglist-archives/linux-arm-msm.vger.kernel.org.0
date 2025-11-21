Return-Path: <linux-arm-msm+bounces-82778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DE201C77C55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 08:58:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 615E935BA22
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 07:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46AB7337BAE;
	Fri, 21 Nov 2025 07:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NI8T+MQL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MdHU8jwA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7952F7ABB
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 07:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763711899; cv=none; b=X9T0ADpQoIwxclr6HSfjbjhyXoVlgr10X6j+X/drH0eozesPGPmX01iWtll4IpE0rNgQw0Wmv/EWCWhBv/5T5e2CCm/kbuGlG+hBwuKHd4Ww0Au46sbskiy0Sga3a3sw5gP4Hz7F/pGNAdUU3iA/9/z+ckKlh2JjhJmoMnv9uMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763711899; c=relaxed/simple;
	bh=jeDCTy5CItHZIAsH2+22GN49JOtwibzV7pQrgH2Dyvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lLzd1UaIJ3Milop3HHDithp60WwtbIh/hEaQ4MwSZKfd9XySyjmYTCaB1xTfR1dIbUbnw85XTBtbGWRohNzlg3N1XIxm0M4x1Gm6uB593bSt0vF/35gqZq+4Nja4af+tkB58L14duFxoxZnyC0uskEebd7EN3kGblg/wITJvbws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NI8T+MQL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MdHU8jwA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKMKfmr1844472
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 07:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jeDCTy5CItHZIAsH2+22GN49JOtwibzV7pQrgH2Dyvw=; b=NI8T+MQLBjmm3H6x
	YyPqFDvaqF6uYEKuuXyFaYmBIVv7ft8DzZ+YVzf2Ska9qauCLcX5fhkdTjj2haIY
	IGq5RVBexvBX2b2cTc4PfYuo9kg5wbiBy6v0MuKm7nng9N893/S05C9FtYADA4sr
	n6lYmY9OxC4IZ5YkLB8JSeLH2UgSQnOkr3xNIsiJriX0yZn2dXwgc3L5hSj9m625
	CdyAg/aeLv7Ivrol6NG6oiocWbinZ7bJpxdvG9eRKcpWpq1OyhMtvnJ+UROoW0qx
	ThfIGlgSFNY86hoSo7+A651TYT0nq250LS6+D9uyDv59qWAjosEUSdwV/wl1zTDU
	sZtTrg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajbpnsckh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 07:58:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b9d73d57328so1737987a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 23:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763711896; x=1764316696; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jeDCTy5CItHZIAsH2+22GN49JOtwibzV7pQrgH2Dyvw=;
        b=MdHU8jwAMngPmjT6F7LtkooGeb90I+VW5nd1bTTRW11NbfGFudVi/GEOv6Tb3e1mEg
         7N8mgUL9qMkOpfNgzlxctflxvEH7QSovn15cifsp3ZbnTWuYv9VWpnzLJ2BOFEvCeCYh
         N4rmMVJVk+JEBqreM2fW++aEgvSQcQAyvcbJsrIcjjnzChQF5S0MuLhBjKZAG0D70+EZ
         yVeL+denpibf77XHVfC2uj+BQBxWBMnelZmxuJC2lIBp8a0khJH4+k5gwN33IWXk9wTj
         liN6FqNCJIPQCUGPNSXPrWZqeEaPI8DCx3Hfu6xzzrDGcEB1HNwhG3Nx+U8lbdA1lT3l
         oPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763711896; x=1764316696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jeDCTy5CItHZIAsH2+22GN49JOtwibzV7pQrgH2Dyvw=;
        b=S3FhY7sOGl56qUkJcbbGvJsK1t1Ko1EUMZf3XG0YjqI4DAKu/n1RL83saSMcoohOI5
         5UV/+hrvorB0cNQybR6Th8klSS3akbsJcexuvckJcN/DbWiz3a9Mq0AgHo5hD676gWYL
         B5oOfvt+uEuEmvtrsvaZALTpG91axBrkI6omIXqAohh3vJV++pF3GBQMW6fJIWFx4uk8
         /s2GbRQUbiKc7XnvAShpDXGYEaWpxM379qMgHWwQ5cO9JvzuXZoMO0dc47z69LjS2cmI
         mJNlo1+sj6CA3I4kAgcOowj3J2GMBIEL2rDsMwpuas/tjiCirmkM7StJxy8su+j/ZIFs
         KLIA==
X-Gm-Message-State: AOJu0Yy8i55aws8CygYRhTlh2FcEZadv8zzdPC6G/tfvsLEjQ8mXjIyR
	cOduMMVtb6/3EcShb/KPV4WDd926TD5V4CUA3JLhk/QpaQ4Oio/dYQUq52cm6oAMot6P+7+T6N7
	no75bokmQ1euwTnEX8etwTUVIlVk0DQ4NuDbKiM6j029XhYgB32PNRrGd0w1Sfy00ICIU
X-Gm-Gg: ASbGncutxNiL5X4+c8uPWyXzUQ1nZf3mR7+9oVlRzKJz1+q5hHpFW5pZlf1qGc3idUi
	jltOu9eI1eTO03od12vFlGwRoMrJXsi9969+7fLqVAIL/V4rHDlOT5qQL8f30q5oEePVpm/iKq1
	V/XNdwcvz6rTLoYGex4znGHKxRFqAIVLU2elmPtQ6to22bdXtwBDLkbfYeIaGumKxny+brvS6Lu
	q4ZeIe8p+Nv8OM109NF9Tznaphlop7DmH1vVD0XBqqqTT4NwmW2ZOCj+dldgNUsTl7cghuKmKFp
	D1zHweOdgkHWqOMmzzZDuhsYSQ+AX1rlhCBmb21ZzNMaLfuByqRUdv0MNfOk8tupdPJwAXfJwX/
	TO23yjDxKDKXWo/wQnJgMLx/5cyEc2KAMcd47CrQ=
X-Received: by 2002:a05:6a21:4ed5:20b0:35d:d477:a7ea with SMTP id adf61e73a8af0-3614ecd2f67mr1636721637.19.1763711895753;
        Thu, 20 Nov 2025 23:58:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyjLtaQLBEGaZm2Ur42/KqItW/LqfnfBWEZ2bGbEg+OISKo3TJXr0ALrMMV2s5oZTTRmIS5g==
X-Received: by 2002:a05:6a21:4ed5:20b0:35d:d477:a7ea with SMTP id adf61e73a8af0-3614ecd2f67mr1636692637.19.1763711895213;
        Thu, 20 Nov 2025 23:58:15 -0800 (PST)
Received: from [10.204.78.148] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0b63aefsm5103018b3a.52.2025.11.20.23.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 23:58:14 -0800 (PST)
Message-ID: <d5972f14-6558-4e7a-9b1e-8e899ef72fcd@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 13:28:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sdm630/660: Add CDSP-related
 nodes
To: Nickolay Goppen <setotau@mainlining.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org, Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Bharath Kumar <bkumar@qti.qualcomm.com>
References: <20251023-qcom-sdm660-cdsp-adsp-dts-v2-0-895ffe50ab5f@mainlining.org>
 <20251023-qcom-sdm660-cdsp-adsp-dts-v2-1-895ffe50ab5f@mainlining.org>
 <07066c46-4121-48da-846a-3a180d245589@oss.qualcomm.com>
 <47b40a91-8365-4431-9fd9-1e48fad2a4e1@mainlining.org>
 <a3cb6633-1595-41e7-8e87-ca48a98f822c@mainlining.org>
 <83c3aea5-764e-4e60-8b16-67b474f19357@oss.qualcomm.com>
 <d17548bb-ddce-4d60-8dc4-2c0633989299@oss.qualcomm.com>
 <f5c7eb1c-28b1-4cf1-afb0-b993384b7712@oss.qualcomm.com>
 <80836b8f-16a8-4520-ad11-5ca0abb3403e@oss.qualcomm.com>
 <99c22e73-797c-4a30-92ba-bc3bd8cf70f0@oss.qualcomm.com>
 <eddc16cb-d951-401c-8fb8-fccfcf600143@mainlining.org>
 <0b06f744-b695-43d9-8da3-4424e2b53a5e@oss.qualcomm.com>
 <ab054cf7-83bb-452d-aa52-d431672c63e3@mainlining.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <ab054cf7-83bb-452d-aa52-d431672c63e3@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I9Vohdgg c=1 sm=1 tr=0 ts=69201b98 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=OuZLqq7tAAAA:8
 a=-v0Gm8E9aN-zKP_vqnUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: j7dwxPqKVuKvKryTNlfA0YuAaODyTY_a
X-Proofpoint-GUID: j7dwxPqKVuKvKryTNlfA0YuAaODyTY_a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA2MCBTYWx0ZWRfX6rOcHEIupi1S
 JSYXqeTKJ2607T8lRuB/rdApii3YtRKhp72/rKcXn+DlAR9GjK6+qJkXOfJjRHKMvWhVvRKEtb+
 UnFp3I5E2eizm0gjZ7GE7BH7FEfOWbOWs3iAs0BG9cvbiaTsvS3uo7Qv0HMJ72ftfdrSPYMWkRR
 EJc1qraotBepfdGPuh5zK3VThyPQkMiDgu7Led5NSVOYJKfdrzhB23zcs5smrHoKCYWo9uFNAiX
 9VkykeQT7cqbG7OYpKPqyCc/lTZ3VQBxU0svPcvxOd0ALG3g1me3wzfYIvaG8wmaCsBt/Xkh2mG
 lI9E+hhnIOb6mAu1XmF2mxwKV/+UIghKECI/Dp+ZaRqbehYJyQCRHplNjqRvq9eBdLRHhL9xKLY
 PRgXbPHlpvUgmNdc0tNTFMpfn3b0tA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_02,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210060



On 11/20/2025 4:52 PM, Nickolay Goppen wrote:
> 20.11.2025 13:54, Ekansh Gupta пишет:
>>
>> On 11/20/2025 1:27 PM, Nickolay Goppen wrote:
>>> 20.11.2025 07:55, Ekansh Gupta пишет:
>>>> On 11/20/2025 1:58 AM, Srinivas Kandagatla wrote:
>>>>> On 11/12/25 1:52 PM, Konrad Dybcio wrote:
>>>>>> On 11/10/25 6:41 PM, Srinivas Kandagatla wrote:
>>>>>>> On 11/3/25 12:52 PM, Konrad Dybcio wrote:
>>>>>>>> On 10/31/25 12:30 PM, Nickolay Goppen wrote:
>>>>>>>>> 24.10.2025 16:58, Nickolay Goppen пишет:
>>>>>>>>>> 24.10.2025 11:28, Konrad Dybcio пишет:
>>>>>>>>>>> On 10/23/25 9:51 PM, Nickolay Goppen wrote:
>>>>>>>>>>>> In order to enable CDSP support for SDM660 SoC:
>>>>>>>>>>>>     * add shared memory p2p nodes for CDSP
>>>>>>>>>>>>     * add CDSP-specific smmu node
>>>>>>>>>>>>     * add CDSP peripheral image loader node
>>>>>>>>>>>>
>>>>>>>>>>>> Memory region for CDSP in SDM660 occupies the same spot as
>>>>>>>>>>>> TZ buffer mem defined in sdm630.dtsi (which does not have CDSP).
>>>>>>>>>>>> In sdm660.dtsi replace buffer_mem inherited from SDM630 with
>>>>>>>>>>>> cdsp_region, which is also larger in size.
>>>>>>>>>>>>
>>>>>>>>>>>> SDM636 also doesn't have CDSP, so remove inherited from sdm660.dtsi
>>>>>>>>>>>> related nodes and add buffer_mem back.
>>>>>>>>>>>>
>>>>>>>>>>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>>>>>>>>>>> ---
>>>>>>>>>>> [...]
>>>>>>>>>>>
>>>>>>>>>>>> +            label = "turing";
>>>>>>>>>>> "cdsp"
>>>>>>>>>> Ok, I'll change this in the next revision.
>>>>>>>>>>>> +            mboxes = <&apcs_glb 29>;
>>>>>>>>>>>> +            qcom,remote-pid = <5>;
>>>>>>>>>>>> +
>>>>>>>>>>>> +            fastrpc {
>>>>>>>>>>>> +                compatible = "qcom,fastrpc";
>>>>>>>>>>>> +                qcom,glink-channels = "fastrpcglink-apps-dsp";
>>>>>>>>>>>> +                label = "cdsp";
>>>>>>>>>>>> +                qcom,non-secure-domain;
>>>>>>>>>>> This shouldn't matter, both a secure and a non-secure device is
>>>>>>>>>>> created for CDSP
>>>>>>>>>> I've added this property, because it is used in other SoC's, such as SDM845 and SM6115 for both ADSP and CDSP
>>>>>>>>> Is this property not neccessary anymore?
>>>>>>>> +Srini?
>>>>>>> That is true, we do not require this for CDSP, as CDSP allows both
>>>>>>> unsigned and signed loading, we create both secured and non-secure node
>>>>>>> by default. May be we can provide that clarity in yaml bindings so that
>>>>>>> it gets caught during dtb checks.
>>>>>>>
>>>>>>>
>>>>>>> However in ADSP case, we only support singed modules, due to historical
>>>>>>> reasons how this driver evolved over years, we have this flag to allow
>>>>>>> compatiblity for such users.
>>>>>> Does that mean that we can only load signed modules on the ADSP, but
>>>>>> the driver behavior was previously such that unsigned modules were
>>>>>> allowed (which was presumably fine on devboards, but not on fused
>>>>>> devices)?
>>>>> Yes, its true that we allowed full access to adsp device nodes when we
>>>>> first started upstreaming fastrpc driver.
>>>>>
>>>>> irrespective of the board only signed modules are supported on the ADSP.
>>>>> I think there was one version of SoC i think 8016 or some older one
>>>>> which had adsp with hvx which can load unsigned modules for compute
>>>>> usecase only.
>>>>>
>>>>> I have added @Ekansh for more clarity.
>>>>>
>>>>> --srini
>>>> For all the available platforms, ADSP supports only signed modules. Unsigned
>>>> modules(as well as signed) are supported by CDSP and GDSP subsystems.
>>>>
>>>> qcom,non-secure-domain property marks the corresponding DSP as non-secure DSP.
>>>> The implications of adding this property would be the following:
>>>> on ADSP, SDSP, MDSP:
>>>> - Only non-secure device node(/dev/fastrpc-Xdsp) is created.
>>>> - Non-secure device node can be used for signed DSP PD offload.
>>>>
>>>> on CDSP, GDSP:
>>>> - Both secure(/dev/fastrpc-Xdsp-secure) and non-secure(/dev/fastrpc-Xdsp) devices
>>>>     are created, regardless of this property.
>>>> - Both the nodes can be used for signed and unsigned DSP PD offload.
>>>>
>>>> Note: If the property is not added for CDSP/GDSP, only secure device node can
>>>> be used for signed PD offload, if non-secure device is used, the request gets
>>>> rejected[1].
>>>>
>>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1245
>>>>
>>>> //Ekansh
>>> Does this mean that the qcom,non-secure-domain property should be dropped from both nodes?
>> I checked again and found that unsigned module support for CDSP is
>> not available on this platform. Given this, the safest approach would
>> be to add the property for both ADSP and CDSP, ensuring that all
>> created device nodes can be used for signed PD offload. I can provide
>> a more definitive recommendation once I know the specific use cases
>> you plan to run.
>
> It would be nice to have some testing instructions or how-to, something simple as "hello world" to be able to test it, to see if it works at all 
There are some test pre-builts available here along with how-to instructions:
https://github.com/qualcomm/fastrpc/tree/development/test

You can try running calculator from here for basic offload testing. 
>
>
>> //Ekansh
>>>>>> Konrad
>


