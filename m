Return-Path: <linux-arm-msm+bounces-79444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F049C1A1AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 12:47:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5BA4B4ECEF3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 11:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A739334C2E;
	Wed, 29 Oct 2025 11:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NxBezuy8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zdm687jO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1706288530
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 11:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761738445; cv=none; b=cFF9YNHzecRAWJR4zjzuSGWuagt2NSu3Ith3Thn4hk97TxO+foWQmh1RiO9zchvErgoU9Dl2O///zNhZ/z3nCHLNn0oB2U8vF43hiaI24zHnqEy5p+FCGRfoB5VS3WFDf5rUnUQHI0cECUlFhy2YlKdETNEqrD0/N0/lho3TUpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761738445; c=relaxed/simple;
	bh=zQW56MY8/fmoEjo3YSWmEiuHao1YlEBqdj1faZ3VTIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nsew5Nk6k1B8dn6bw9q1PsvAErFO7mQtH57hZS4z6kvB3/J5FDDmOFwBDQfCr2pEws+Opw71nUl13OFBBvW2UDglKv3TOsCY4qZvjav/CXnJBcirML6UHUFsDEFGaZBt/5RzK3BqwFhQk3xyCMi2oVV4MFwyoBy51jqZRR5oGh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NxBezuy8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zdm687jO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4uqOE3642844
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 11:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eWIVaztRJnGDpziqVI3cUWs9sstpy2ewlY1U9XBu3GU=; b=NxBezuy8pPfWRack
	LZdgSs8D9iEEwyDzVGDe7q/wonepwFHT1+QFjbCwDvZpngqVQUsnAMOVs/MNa2aN
	EfWvRffKjvLCZM06AmKZTUuz9LMMMhiKp+iqvSoxC2Llm6f52sSCfTcPu154RQtJ
	bqIqFlw+UGyC6wQGCltj9/QyObeLaBPpeQc09infOa59KkImjZiMINg+dumgiPdU
	ZPPm0S/EA4E9wNB2Oc2qwFc5IHdp6OdKH2g0v8hU+96q+gEd/vRHOPcINhJZUag1
	5I+clmzeY+VwBBx7boTPAp6KLvV1yjY3oDCC21hX+OpVLlMEvxpomttSGvF5zbCD
	QwGjtg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1jdyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 11:47:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-28e970be282so23625475ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 04:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761738440; x=1762343240; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eWIVaztRJnGDpziqVI3cUWs9sstpy2ewlY1U9XBu3GU=;
        b=Zdm687jOfjgCwDEnunnKpORGD0LfQeyoTV0IVTBa8Y5Nv2e6eZQags3AB0kaR19xvh
         d9StlL/8KCr3GQKtOBkKLkZmYtCP7Mh4RDnmfASy3n1GWHx9RZMyySrHW7iUw44EEDMe
         J8zrQXHXPVdM/LHe+F8CpU6td23r2KFx0LwgBEpSmqPs9YDVgk+JckSFiTuvO6l54KV9
         3F9tC+bhrYYPv2OpvKdaQpkljDzlTz/Gs6ivEj+jbb8WQ4VF+rJg2LrLr2rcvFaK3NZQ
         KgQAbJBivETyzxBcqYQ2P8CMYyW/75y6UVxoAgxFCvSK3Eq2vOn/RErvv4zZM5fHWUm6
         Hm2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761738440; x=1762343240;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eWIVaztRJnGDpziqVI3cUWs9sstpy2ewlY1U9XBu3GU=;
        b=fz7dUHrooSkhdjlvWcoTMTqlmAwjuBdgoxx0sVYaHf4jxwq46zs71p80AF7vHV3q9M
         EPvo176a19Iw2mLN/wXF4ZT11DnsXoXKTbH2HAOobJQjmp40EvZTPjjaxF/5RALu9Utp
         99FsMLb2Cdmnf1SiSXfx68QBYg+q2z5+iXOAvHCHlAEGSZoPhGk5OCPywB1gwWahwe3v
         fKJvteYbo1bCoUrvm6iaFG6p96soQVV6IuSnWK1t5HNDcCzV1FUEdu1+/iL3lgW48ee/
         zm9SUqWiRwz73cKKaihd7WCvwdIBLqDDyXHtQlrAyWAN4rRAOn7g05mkoxuBVUu5n8O6
         o66w==
X-Forwarded-Encrypted: i=1; AJvYcCUC4kTgdXqdj6G5cSxnt9H1KGGKeISPrLNN6Nb9xGAeJTCw4Np+LCJjMI5JbfLE21YjkNyj7BjlFJAQvaAd@vger.kernel.org
X-Gm-Message-State: AOJu0YwqdvrsVJL5RQuT3XD53cmih8bpsKd4Z8eHcdn+oKmDW/8+6+pd
	cjt/VirifCo/0eN8f7vaEHcf+P2rqfEsBBx56wxlwgWLQ8hbFPmOBm7WT1rwfF8UHhdGq3F1cdz
	ml0eLXepPbmxWKgYtcpwnCqE/71hxQqOKWiB1F4LBtvEam+4XMui2g3HsshZ2jDuA17O7
X-Gm-Gg: ASbGncte4DLqF1seDGBmNRZHhtbTy0tijkjpptTmh8pnmvY8O7Ll+Dl6DOLYdPTSNIs
	rGxYlDAu4iVnXQzAdJp9fevrBHNcpPrdFrL/avqtRLLlEVg284/oe3aVbGCbLr8zSeK+1eiDKer
	xGic0Ly904UVJLTDiZCj7fH6lLwHAVwNxGp2mkuyWCMbBFfBZR3I4yMVmMXgMQl+fGU7YB8kpl+
	QGcUoSMhzmVcH/HYZtvNeoESAQjq7VPlLwSve/bFe5RVADvpXPZUUqQJs5fmrfa8YMqsSwZ+Jpd
	F9HFzgnG0SiFTXqxh8XlHW9UO4No/nVExW81sNoFM2LGbznZZp7ui/JBHg4jUZrY024g9kdm0gH
	3dy6xzNetp9fS5cQva5nA5NvJEZe17fHHC7V7U6qAkv6I2jh8pqo1eeYF9xz9oyUX
X-Received: by 2002:a17:902:e0c3:b0:27a:186f:53ec with SMTP id d9443c01a7336-294def4777emr10974825ad.9.1761738439912;
        Wed, 29 Oct 2025 04:47:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGV2MUUUkmmFjRBk1T4Mw8HQRwufvyCSapJ8Hglp9lTk963xdOkVLK/H5Zn4FZRsX5XZBO4Cw==
X-Received: by 2002:a17:902:e0c3:b0:27a:186f:53ec with SMTP id d9443c01a7336-294def4777emr10974595ad.9.1761738439235;
        Wed, 29 Oct 2025 04:47:19 -0700 (PDT)
Received: from [10.133.33.95] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d2317csm149794305ad.48.2025.10.29.04.47.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 04:47:18 -0700 (PDT)
Message-ID: <a7cdd2b3-6097-4a8c-a639-af974292cc8b@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 19:47:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: soc: qcom: Add qcom,kaanapali-imem
 compatible
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Eugen Hristev <eugen.hristev@linaro.org>
References: <20251022-knp-soc-binding-v2-0-3cd3f390f3e2@oss.qualcomm.com>
 <20251022-knp-soc-binding-v2-1-3cd3f390f3e2@oss.qualcomm.com>
 <g2iviaqetgxf5ycz2otzkpmmc4goo7xuyjmttuu254bfzqqvkf@4vybjh4eghpm>
 <4eebcb7d-1eca-4914-915a-d42232233f9f@oss.qualcomm.com>
 <dwfvko3hszsoh4ihnz3qdpsugmocbkrbhosijdw5q3bxh64kuo@o74as2li74px>
 <lz4sbvzfiij3qsa4d7jeblmi2vfubc4ltf435sh6tcs53l6fbq@7f3tfm7yiyjc>
 <mwin3lfvpcwxxhsub2whcpibuayk36f4ljrodvithfygqad5w4@cg4h6peh4v4a>
 <ygqgzflpavwgd43e5zedgcijm3lz27nqlzprttalgcroedz45u@ztqkppajpyry>
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ygqgzflpavwgd43e5zedgcijm3lz27nqlzprttalgcroedz45u@ztqkppajpyry>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=6901fec9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=PIc2Ezaej9RGvccHy-YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: dHGThPCYB6D-VVN-dzJh62Yl9jsp5KZb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA4OSBTYWx0ZWRfX/1nUx3h9n2TB
 hUngL7kcUC7IfncOBN85UsVVPyRuyOP1UoeMDAL68SholWVwFoxPTiB0F5h+NxJXE4R3rMiSNM1
 z+T3nDb7JkgaCXHOgNJeEumo9lxgLvUQsQw2ASLH4yqye7E03v2+nhavbBTFIAbPc5gwFs/siX1
 tNo7y8Ey5f6/q6kb5mDNp0nGaZWjQ0RCjwi/7cPs9ryUE/9HuhDCzHDysldZquYI36bnSClUen2
 7DBj/0NPuV9aTRZAJmcMy34ZtkN2HjcPK2gsAXJ1saJ7TUp+FSmxhjvxghBPPEk6H3nJPT3haIf
 A+an3QGNXQ9i/f6dBKzx1ouz/wXhcsg3/8C+pfO3EHkikWKSNl23w+HfPalyEkAamcahycrXckS
 VNUTpl24s4WXjl2/FljsXLrksdCXWg==
X-Proofpoint-GUID: dHGThPCYB6D-VVN-dzJh62Yl9jsp5KZb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_05,2025-10-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290089

On 10/28/2025 2:44 AM, Bjorn Andersson wrote:
> On Thu, Oct 23, 2025 at 03:06:00AM +0300, Dmitry Baryshkov wrote:
>> On Wed, Oct 22, 2025 at 05:42:58PM -0500, Bjorn Andersson wrote:
>>> On Wed, Oct 22, 2025 at 12:34:58PM +0300, Dmitry Baryshkov wrote:
>>>> On Wed, Oct 22, 2025 at 05:05:30PM +0800, Jingyi Wang wrote:
>>>>>
>>>>>
>>>>> On 10/22/2025 4:49 PM, Dmitry Baryshkov wrote:
>>>>>> On Wed, Oct 22, 2025 at 12:28:41AM -0700, Jingyi Wang wrote:
>>>>>>> Document qcom,kaanapali-imem compatible.
>>>>>>>
>>>>>>> Reviewed-by: Eugen Hristev <eugen.hristev@linaro.org>
>>>>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>  Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
>>>>>>>  1 file changed, 1 insertion(+)
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>>>>>>> index 6a627c57ae2f..1e29a8ff287f 100644
>>>>>>> --- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>>>>>>> +++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>>>>>>> @@ -19,6 +19,7 @@ properties:
>>>>>>>        - enum:
>>>>>>>            - qcom,apq8064-imem
>>>>>>>            - qcom,ipq5424-imem
>>>>>>> +          - qcom,kaanapali-imem
>>>>>>
>>>>>> Can you use mmio-sram instead?
>>>>>>
>>>>>
>>>>> Here is the node: 
>>>>>
>>>>> 		sram@14680000 {
>>>>> 			compatible = "qcom,kaanapali-imem", "syscon", "simple-mfd";
>>>>> 			reg = <0x0 0x14680000 0x0 0x1000>;
>>>>> 			ranges = <0 0 0x14680000 0x1000>;
>>>>>
>>>>> 			#address-cells = <1>;
>>>>> 			#size-cells = <1>;
>>>>>
>>>>> 			pil-reloc@94c {
>>>>> 				compatible = "qcom,pil-reloc-info";
>>>>> 				reg = <0x94c 0xc8>;
>>>>> 			};
>>>>> 		};
>>>>>
>>>>> other qualcomm are also using imem, could you please give more details on why
>>>>> we should use mmio-sram here?
>>>>
>>>> https://lore.kernel.org/linux-arm-msm/e4c5ecc3-fd97-4b13-a057-bb1a3b7f9207@kernel.org/
>>>>
>>>
>>> I considered exactly this when I wrote the binding back then...
>>>
>>> But the binding defines mmio-sram as "Simple IO memory regions to be
>>> managed by the genalloc API." and the Linux sram driver follows that and
>>> registers a gen_pool across the sram memory region.
>>>
>>> I believe IMEM is SRAM (it's at least not registers), but its memory
>>> layout is fixed, so it's not a pool in any form.
>>>
>>>
>>> What Krzysztof says makes sense, but rather than just throwing a yak at
>>> Jingyi, it would be nice if you provided some guidance on how you would
>>> like to see this turn out.
>>
>> I tested, pretty same approach seems to work:
>>
> 
> Now you're shaving at random ;)
> 
>> 	sram@14680000 {
>> 		compatible = "mmio-sram";
> 
> You can put "pil-reloc-sram" wherever, because it will perform a
> of_find_compatible_node() to dig up some node with the compatible
> "qcom,pil-reloc-info" .
> 
> In other words, this line created a genpool for something that really
> isn't a genpool, but luckily that didn't have any side effects.
> 
> 
> There are however other users of IMEM, such as the "reboot-mode", which
> relies on the "sram" device probing child devices, and is implemented by
> "syscon-reboot-mode".
> 
> Perhaps the solution is to not support any new users of that?
> 
> 
> But no matter what, the definition "Simple IO memory regions to be
> managed by the genalloc API" will never be true for IMEM.
> 
> And as this isn't a syscon, simple-mfd, or mmio-sram...how about making
> the fallback "qcom,imem" (in this same binding) and omitting any
> implementation until we need one)?


Totally agree. We can remove the "syscon" and "simple-mfd" compatibles
for Kaanapali.
For Kaanapali, the reboot reason does not rely on imem at all—it uses
nvmem cells instead.
Previously, the syscon-reboot-mode required "syscon" and "simple-mfd"
compatibles for older targets like APQ8064, which used imem as the
reboot mode solution.


> 
> Regards,
> Bjorn
> 
>> 		reg = <0x0 0x14680000 0x0 0x1000>;
>> 		ranges = <0 0 0x14680000 0x1000>;
>>
>> 		#address-cells = <1>;
>> 		#size-cells = <1>;
>>
>> 		pil-reloc-sram@94c {
>> 			compatible = "qcom,pil-reloc-info";
>> 			reg = <0x94c 0xc8>;
>> 		};
>> 	};
>>
>>
>> -- 
>> With best wishes
>> Dmitry


-- 
Thx and BRs,
Aiqun(Maria) Yu

