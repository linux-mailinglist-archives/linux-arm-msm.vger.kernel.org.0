Return-Path: <linux-arm-msm+bounces-77088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2998BD76C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 07:30:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93FD83A974C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 05:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5F11F1313;
	Tue, 14 Oct 2025 05:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CGuputJM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEA519C54F
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 05:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760419831; cv=none; b=PY1EmBqAnAPwZm888tPoWiuKIAYwNcCfbTC9zorrULi1eUKE5BMbAuWFpHdd/Iz3d6rPaReUuL0AD8F/5zsXkbap0e9YwLXhXVby990qrYc2CTuSCFCIvWfR66ZDbXHPSlus3wva2U5vbM9EhsWCF6IwSL14PNjfcTcMSF+vxYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760419831; c=relaxed/simple;
	bh=6C+0mVJBfwJ6eEKuKpzptD3vV13l/Xs2RlUk1P/FkIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HcLJTRG+Z3p34Nb1MZMLTAxJrOMy0pPWrTmAPVrwL1eE3i7LMsLCRLPreyAdwRhvA31NgvKP561A7Lj0NSEGEWQGVtqxAEG8XTv0u9g6G9uPSeKvqJ+1GRN4p0nxCkRLGEz4KntXAo7z0FN6go1Ju7cds48A0GLyeyOed6L2WiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CGuputJM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDBs2018959
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 05:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mGf+luYW4jgMb+B3RwqAY4OAaUUBYWHpzhztabveqmE=; b=CGuputJMqrAfvxoz
	AlWw35VONHpoCCW7a3fUEMDBGpJQZvbN4MVdgvsMUuto+Gl2TrZAK3cJh1uXLzRb
	YKc0bAG7MMROO9xz5jDF39LEv3K182ZzBV3sg78VVf3l1RLefrkWwmelI966gDFq
	oPxb1pJXbdnyi6UPIKTpMGtxLiKx3Nkm3Z9MBl+CCM6v9BorFz3r+nvPlGY+vi93
	bwAcDBLPzGdFKUNDDMPNyxDohyTxt2B+Hwt1ULKDMapCKXxQ2s/5VXn6+q5A1l4w
	rP8wkOuq74tVyEq68BF6r/wCZe6ujqjCgwgFT3gMuqmDat2bFz3JCdojbWnEDD3z
	o5TJog==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfery8k5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 05:30:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7810af03a63so15714628b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 22:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760419828; x=1761024628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mGf+luYW4jgMb+B3RwqAY4OAaUUBYWHpzhztabveqmE=;
        b=OShDvleSbjeAoFOGNFzrsVMoktFoYWbZW9zkJDBRM/Pap3VtR1MxtfROZowLYaNkel
         xTEfle+m/vYOZYNBh/kMvV7OnNdj4QdlGh24Jb4KOd/NaO6/aPovWLED+GO99y4Nr8O+
         Pc7/AeN80TMQ+RwI2pbzT54n40R2+6tG95+wb+rH1tEEharI5EY4HoA3jjJTxGNsjWIG
         WUJrw2IMwX5EJHgBOE/WZ+WlVgL7C1F1jGS8PLr6WXPE9IpmCsE3TOHoShHIEHHsOlvz
         CDRE1jTJY8QlG9cPDZQy1qPWc47tpzXrvCMEeLil8FxoG4Z8SFAhkjOqjAqNzLutcbgS
         DtbQ==
X-Gm-Message-State: AOJu0YzpOrW3DAcv4U+6NoHSvESf5fJR5018VwfUUSOl24t8KlBFZilL
	onLn+ztTaWnVUeeV9ZsF3fxS4+bs739LKZ7wyc9uheghjJrci2eldV9EUsz3msRPqalkOoq82j5
	1Cc5Wx10jQWnBEDrANcdpSFNEV06i3uSMHTeU+ucf+XnI28sv5SCaFLO2jaj8UD0MYiHC
X-Gm-Gg: ASbGncvQvPgYSjjqZPFxP8ZwzMEVc3xMzqvl1zajOsw0D9KrhxcWECbt1sLRm1sw+wd
	dtAuONkgK1Ow+jkiO/CEipw0HaFqA/UFWp97uXATyg7vUKzPgwe/+VsAufcBOgcris1WKZnmjh6
	Vfl6rwp5RNAyAGrQf/jHlr8VpdlMJIvL0ypN64ri/fheSMv9VEqA+iYakOS+skySlY8Rpx0AU8a
	aI16G7rpcx+9eveBs63gyfy0s70ASqTXIR5Iy1bCmu/ipuIiI0c4geb4cuAWH9lkVSZlZXFP8Xb
	6ARoCmSqY2s4xmE/8mT6bBCGApyZBjdVGVFdH9ZfS6e51Y9MpJVSJlFLls6I2emgeIEgHCYUYZx
	C/qL1VrllT7sz6F1PmHl1AceGjy5Ewni5DWs=
X-Received: by 2002:a05:6a00:189e:b0:782:cc55:be67 with SMTP id d2e1a72fcca58-793870520a0mr25278558b3a.20.1760419827729;
        Mon, 13 Oct 2025 22:30:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoPKUcolh2erT/HShMlQQ9jq2kdIFbjddsu/zl8eo5idfZCP8/onE7f7VcV98H1IJ153XAOA==
X-Received: by 2002:a05:6a00:189e:b0:782:cc55:be67 with SMTP id d2e1a72fcca58-793870520a0mr25278521b3a.20.1760419827279;
        Mon, 13 Oct 2025 22:30:27 -0700 (PDT)
Received: from [10.133.33.138] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b63d90asm13463745b3a.24.2025.10.13.22.30.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 22:30:26 -0700 (PDT)
Message-ID: <0f0969e8-8668-411e-8ddb-a124703c9584@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 13:30:17 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] dt-bindings: remoteproc: qcom,pas: Document pas for
 Kaanapali SoCCP
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
 <20250924-knp-remoteproc-v1-4-611bf7be8329@oss.qualcomm.com>
 <a8796335-bec3-4c1f-afea-b5b7909d8ba3@kernel.org>
 <e9813a47-c40b-475a-8faf-de0811c9066e@oss.qualcomm.com>
 <40af8d13-1bee-49f7-946e-043b920d83fe@kernel.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <40af8d13-1bee-49f7-946e-043b920d83fe@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R64O2NRX c=1 sm=1 tr=0 ts=68eddff4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u80fgmE9l9i9TYFULvgA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: eetpbQc_kVuhs8QHO3eFLkfWM40fX15Q
X-Proofpoint-ORIG-GUID: eetpbQc_kVuhs8QHO3eFLkfWM40fX15Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX9gCB5SqqtJ9h
 2ZXY5BZ4f9zF83d95Zg9Lhl6XxAtzKnxPQCbiu5+1Lhg3JRTcM5l5e/4RVNU5pk72/TWTDkTAb8
 18LWz/rOApf41kLC100bd2tTc5vrNG2zW14U/rwuKikKGXQZpSy5e1KVm9uVrMQFbQjHB4UW3KL
 B6a/8nXyexuibPzXcOP+jEJO+ND3cTxaRNCFqfaxy7uTPVilyi6UTrlYK3RxTkrTY0xw3E0qu5/
 B0WPgNUgDHyUCsy/nWEJaYxM3Bj98LVayV8YOdEJ0EKh6Gyl4/hEOe0Y5yDnbKjjd71GBWrT2cb
 XE6MgozE9PPPVBZbLZr+fkycuIVRbDH1rR0TcaD3/Mqdl+ARIesnsdjILYmh9T6LRDkXJMwkwkT
 SkhiIDPqo3x8iKZI4DLGYZ6eRqPQ4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_09,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018



On 10/14/2025 12:47 PM, Krzysztof Kozlowski wrote:
> On 14/10/2025 06:28, Jingyi Wang wrote:
>>
>>
>> On 10/9/2025 6:27 PM, Krzysztof Kozlowski wrote:
>>> On 25/09/2025 08:37, Jingyi Wang wrote:
>>>> +
>>>> +  glink-edge:
>>>> +    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
>>>> +    unevaluatedProperties: false
>>>> +    description: |
>>>
>>> Drop |
>>>
>>>
>>
>> Will fix
>>
>>>> +      Qualcomm G-Link subnode which represents communication edge, channels
>>>> +      and devices related to the Remoteproc.
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - memory-region
>>>> +  - clocks
>>>> +  - clock-names
>>>> +  - interrupts
>>>> +  - interrupt-names
>>>> +  - qcom,smem-states
>>>> +  - qcom,smem-state-names
>>>> +
>>>> +unevaluatedProperties: false
>>>
>>> That's wrong in this context. But if you add missing (and corrected
>>> pas-common) then it would make sense.
>>>
>>
>> Sorry I didn't get this point, could you make it more clear?
>>
>> The property for Kaanapali SoCCP doesn't follow qcom,pas-common.yaml
>> (the interrupts are different) so it was not included here, like
>> "qcom,qcs404-cdsp-pil.yaml"
> 
> 
> It should follow. We want the common properties to be common. You cannot
> have new binding not using common properties, because you duplicate
> property definition.
> 
>>
>> So I think just adding the missing "power-domains","power-domain-names"
>> under "required" will be okay?
> 
> 
> You need to adjust pas-common.yaml, all other bindings and this binding
> so there is a common part.
> 

Do you mean remove the interrupts property from the pas-common.yaml then
define it in separate bindings?

Thanks,
Jingyi

> Best regards,
> Krzysztof


