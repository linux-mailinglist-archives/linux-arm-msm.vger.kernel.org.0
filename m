Return-Path: <linux-arm-msm+bounces-83935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA04C96161
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 09:18:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AD2D6343A0F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 08:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 400C82E7178;
	Mon,  1 Dec 2025 08:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IbNgE091";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JqFzX3sw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157FA278753
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 08:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764577103; cv=none; b=b22ARTedPw6ApTvi7WjoDIbmdxqcGxtID0eJDJ2XwB9UW8ioNqpWHJ2NZ7HKU6kJ11TzKz6rCNOrVfTyCZhOwiwslZENuorEGJBZmdbab9QBLoHZbCPxXPs2eDRqens/T5ASb2oNvHoGbrVmLzc0uu37nIRUCP7n9G7n0wO/urw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764577103; c=relaxed/simple;
	bh=Ki1KES0nfEaG/8XT660Ob+zIrgtyaJBm2AHwfeNEEvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uEjrH8UlBO3G33oVAfPKt0Ltw8GZfbq9+oET+5rg/JZHEDGFoCoiC7d5bbWVv9S9KClxkRo8dqxX15ZczdqMzj20oCY1yFSlhWAK2OAaueprUzYuZbMal0cmVcr/HjyMbijvkH0r6WLGGKO8JefdSeFVXopfc8Xt+UiifvHfAmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IbNgE091; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JqFzX3sw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1882d52901352
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 08:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PiR8XQpRX7zr8x83jwupI4R37Ne98MRV6EnwDndA9x8=; b=IbNgE091PRScYFde
	w0ZnzYmIU9bfK1reOpfp/De7WMfGKGMOlMadN/dSVMpRcHyFLp6pAJQJYbDCVG4v
	iWpV911u73O+dXiyOe3HaW7AuEShwLPWD3hulMe1bqWCqKiYsK4LUXGRmsZP4/aB
	7wHw8l8qdV62xKNR2CWYWkR4BbYfCbSKeHMO5MOYz0tULmeluBonBh3Tt5crlkoD
	ttjkKucJbjs0g/PPsTsk3I8CWIRYE+5HQT6aXzr6P0Q0K2auVamC9JHi6vZXblKe
	d28FIRvAay3+tyhrKZI25uhz8kq+WDQ3l5qUgB7Fv5qO+m9xDf0DXz4o9tuzuBeE
	ze8z4A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqrwsv1e0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 08:18:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297e66542afso112043595ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 00:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764577098; x=1765181898; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PiR8XQpRX7zr8x83jwupI4R37Ne98MRV6EnwDndA9x8=;
        b=JqFzX3swEr3egRyptB6t+/E5/kdPjNZjDSpShsfrEUcZ8URNBLGppVxeo3fcYX3F+N
         EBivGAp6SUQ6T0qyP++BqZsTEVgYW8n6ShPobfq6uvJIA5/MDjsQQY8XzxNUJeXD+M7a
         uXFl2tI5AC764xZOMdEhoTNgrnAJxNF/rswHVunySXavcFctFGYT6Aqr8HKyPp0WdyiM
         sa6WHqJKyVfZXYZ6dJGGCUg8shCHPFRssEHZHsf2V3R0TmjA2HEui+PR/i+swyKcqx6Q
         erITFyU7+FOmhkfnGFZ9hojR7FWiE/aATqSQ+0c5qb6xU8LxtAWywHSjFDinbF4+mj3E
         G7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764577098; x=1765181898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PiR8XQpRX7zr8x83jwupI4R37Ne98MRV6EnwDndA9x8=;
        b=Ppztw2lodjcbBea/rKd2GrvgoBXRJNh0aLhvEcipTtHfyjjfMO5mF/3F5uezlBLafs
         vV8ISr6oaYl/wuZ0woWgsQMWtcZEFOjCsbOgO8Ncg9CVEGRsbqalPIm/cda2CWF/bUlU
         6veLTO3FfrFrQjlsfRBvGYrPl67Xvk2LVq+35hfb8bgnOhIKLUDxg2utAmB09+mZbpu3
         EEq7OnQvWm28wXx/b3KRU9f6y+/tUjYNVQbGc+iOFgfYAl81jyNQttZcA+D/go3d4l2/
         nsIHiULzsK5mVcRe5FR8WZQvcMUcNQuQmJC2qB3tViWBXMotvZSPKUCIrSpdtOwF/ijq
         CFYA==
X-Forwarded-Encrypted: i=1; AJvYcCXEAxaoKuG0qotSDqfjX6WDOh1uW7lOzKiLSYyThm9yhVmWRDCrtWrYuC8rfaA1Lg01RK4h58vgCTkkFtNZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwQv2pYdNpLSiNxQWJ6NUmFrcMevhZgccbNEQeNaDh+qa6oRtoI
	XmuqTUrNUbyKSyLk3MhdUCW+6aLMoO8YIrLZ3xDouqVHB99OfLU5yHCJdL2VkvOuEt15xD6/ber
	1XWFOut/XFtxUyju2yXtFQBx0UWneIKjxvuBoQYQX4rJyZztKkRZCdyh6Nh3J8rZp2/4J
X-Gm-Gg: ASbGncvH59MGxUhrs92pPxHCwP3wgYveH6m1kexB4zB1+pTbBKQ/vLrl0TgipVXHvh9
	JGMseZr0Rjdp2EGvnuFOn+FTbA2n58h3pOPyTBhMLH/fEwmYb/fk96MZryOkW/BLKvt9ERX5z/f
	RWoMh8sHqLWq6An/b/704g+Do8x6UqsCkcSPoKNuNFMEU1i+kBSOfdtKlhQggRPuhTDbZvKTkSU
	aEF7hsoeDt408CB2/pkFE6UmHpFFEPX/L+aIleW4Df7bqK8jsxd4dWPltKyGpjwevwsPAwp+m5T
	m45KoMg9dG0zVLRkLbyVlXaEna+0c4KIqN7k3KYLFJVQJAq5jIiLi7UfSBX02oBD4rUmrmsyG1Q
	k7z6EiXKcgEobNqWZlY0kN5sfO4JYSEqtSamGGalNrg==
X-Received: by 2002:a17:903:3b86:b0:297:e59c:63cc with SMTP id d9443c01a7336-29bab148c59mr300080615ad.35.1764577097788;
        Mon, 01 Dec 2025 00:18:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsiVEfrFH3pUI8q/uZ984B5P6TWerQwXXhXGFirlVDNU4iuFqXc/WiueRo6Vodl/fEKd1ujw==
X-Received: by 2002:a17:903:3b86:b0:297:e59c:63cc with SMTP id d9443c01a7336-29bab148c59mr300080285ad.35.1764577097319;
        Mon, 01 Dec 2025 00:18:17 -0800 (PST)
Received: from [10.204.86.123] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40ab81sm115121585ad.3.2025.12.01.00.18.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 00:18:08 -0800 (PST)
Message-ID: <733afe4f-51d8-4c5e-8c18-9843a316523e@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 13:48:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: misc: qcom,fastrpc: Add compatible
 for Kaanapali
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ktadakam@qti.qualcomm.com
References: <20251126094545.2139376-1-kumari.pallavi@oss.qualcomm.com>
 <20251126094545.2139376-2-kumari.pallavi@oss.qualcomm.com>
 <20251127-prehistoric-sponge-of-faith-efde44@kuoka>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <20251127-prehistoric-sponge-of-faith-efde44@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA2NiBTYWx0ZWRfX89RS584DprGZ
 W7pe7WJRPW+DXknsD5oaAZV4B8hTAbo4xoDAXxS3heF7qXf1esIP2+gXYTxSvKKtq6WbVnHzZP1
 rIZEpHupzPEloqBxVakS3OvahQ+d3BOW+QKk0J5YvRIOhTxNyZAUg49FsFTs4j2405SdPVpPWJt
 afLDfXdJ7/g/8WsXWyDzILInkhyQ9nD8S7jTldqB/D7cmWEFX3I9LUXlL+HLiwa/ouEf1qYcp6S
 ieQCBojtTWPpxoAYZbDTG/1CD1zTGAlg/pUcfBe8aALCpBbUFEMkVlJsY0Ela/yMJANeeHKO5O3
 xn/RfRsJQXyqo46RVxmEHo0I9jAkuheHwPCdquhf+681BZE7inTVT9fFaeba5i2/U6jiFTNYSd3
 u5pDENOknwXwzzXbSTQJj111ztGGXQ==
X-Proofpoint-ORIG-GUID: 6y-gLKO9rOcwZ9Qh03xbM2kW8FhJm9ef
X-Authority-Analysis: v=2.4 cv=WONyn3sR c=1 sm=1 tr=0 ts=692d4f4a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=f9DLRBmgI0KZ56IV6akA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 6y-gLKO9rOcwZ9Qh03xbM2kW8FhJm9ef
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512010066



On 11/27/2025 1:00 PM, Krzysztof Kozlowski wrote:
> On Wed, Nov 26, 2025 at 03:15:42PM +0530, Kumari Pallavi wrote:
>> Add a new compatible string "qcom,kaanapali-fastrpc" to support
>> for Kaanapali SoC.
> 
> ... and here you write WHY or provide background about hardware
> differences, instead of writing what you did. We see what you did easily
> - we can read the diff. Additionally your subject already said this, so
> basically your commit msg is redundant...
> 
> I still do not know why Kaanapali needs this.
> 

Thank you for the feedback. Let me clarify the hardware differences that 
require this change:
Kaanapali introduces a new DSP IOVA formatting scheme and a hardware 
revision in CDSP that expands the DMA addressable range. On previous 
SoCs, DSPs used a 32-bit physical address plus a 4-bit Stream ID (SID). 
Kaanapali changes:

SID placement: The SID field moves within the physical address, so the 
driver must know the new sid_pos to correctly form IOVA for ADSP/CDSP.
Expanded DMA range: CDSP now supports a 34-bit physical address plus the 
4-bit SID, requiring an updated DMA mask to avoid truncating valid 
addresses.
To apply these changes only on Kaanapali, I introduce a SoC-specific 
compatible string "qcom,kaanapali-fastrpc".

Older DTs using "qcom,fastrpc" remain valid and unchanged; the new 
behavior is applied only when the Kaanapali-specific compatible is present.

https://lore.kernel.org/all/542f84ce-b840-44f9-bdf8-09611369e6bb@kernel.org/

>>
>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> index 3f6199fc9ae6..6c19217d63a6 100644
>> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> @@ -18,7 +18,10 @@ description: |
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,fastrpc
>> +    items:
> 
> No need to introduce items, wasn't here before. Just enum directly.
> 

If I use enum directly, the schema will only validate a single 
string—either "qcom,fastrpc" or "qcom,kaanapali-fastrpc". However, my 
DTS changes introduce a compatible property with two strings: the 
SoC-specific string followed by the generic fallback.
That’s why I used items in the schema—to allow an array of strings where 
the first entry is "qcom,kaanapali-fastrpc" and the second is "qcom,fastrpc"

Thanks,
Pallavi>> +      - enum:
>> +          - qcom,kaanapali-fastrpc
>> +          - qcom,fastrpc
>>   
>>     label:
>>       enum:
>> -- 
>> 2.34.1
>>


