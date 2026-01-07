Return-Path: <linux-arm-msm+bounces-87838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E84CFD1C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 11:08:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B80F0302C868
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 10:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DDD7308F26;
	Wed,  7 Jan 2026 10:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ypk1jSHw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Une8yqh+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB1330CDB5
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 10:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767780488; cv=none; b=Zs3f+7QyRldSK+mG/RM2+NYojvQT8R++HvCVYvoCmjpVmenoOYVqxjDkmfC9SWAR+7mN7DT80MX6dSCdQsQTebanK6CgrTBnzZpQq4OWXsHurX1o4olakurbv3ZGwDYqlOy5x+uW1DIGZVbuFRiHQTwcjIqaoBgkjOFzDl7RW4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767780488; c=relaxed/simple;
	bh=L69VkYdJmsTIClgxVnQFqU6KGnt9Tyfdb9oAJudyy7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PtCcIZpTH+zV5rn0xWM/+ThoHZgnSVyquWR82HUNXCrmcm4iP+3rCsDVeW/ui+NG4KCTl5K2Rwo4OD+eEzxNOoyIimkP/D9taJMZ3R6x0AU2tBhh5TiWYACu+rfUhxMZeRiawoqIdEW6NxdCr7jauykWEIrSt3aVfhia+GJEbGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ypk1jSHw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Une8yqh+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6078m09I1981267
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 10:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iCZy5ZimfodLcwbOaVLFHW7iZbjkqH8ixo5lKjkcUd8=; b=Ypk1jSHwl/b00Pfk
	2AOrICYvkLZD5SxoBmRjodjR59meIdRymT11tyO6PLPzHHDfYptjq25kVnf17a3t
	vm58JPvgWMlm5At1d3rhW0pgnN3QgWSPFl7tzpUIFoDK5QhId7dmn0VCxefXqyaj
	2+Jnm+kW2OuX5V0PjyYiunkEg7aQVeBv7zbNO0T2MW5B6X8pOlLG6+KNqZflbqgK
	U2lH/zUfGhrg3D44O/coBCe+B+Al8BWnPNnAXbbbiUtYemzAuIvltnhITH3MRWFv
	HdP61BcSANtI5mTgQNwGSi1GNT/Q6xs7zuk/sTbVUrbVR+VqKDrQw75NWry0C5F0
	DQynHA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhdavhm2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 10:08:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb0ae16a63so222727685a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 02:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767780483; x=1768385283; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iCZy5ZimfodLcwbOaVLFHW7iZbjkqH8ixo5lKjkcUd8=;
        b=Une8yqh+WD/C5bg8CpP3Mzj3aL1KzV/eUx19vWVqyAIIryLD580oqo787wp56Y4JqH
         HlmpacHF6uogs5ShylLo8EiKyQVQSp8IL5pOrkCgz8TzQ7ETQ6njgzYP7p/CqQsKQBuy
         tlMm7kAcxOT5Zzx0Ohtn4CJ6J6sxEm/kXRiO9K+eEtxmPHZkP/hgXmyLNuTDaQmv3gyk
         w/FFiqUpnRwVVWsp79swFrwrOzRVkpvrziQfz0c9KwsE+v+3LiZd5zXpd/WE2UKWZDLF
         Kx+FhCiU/OBI+ZlT8iyTr/SCcYgKNnnMqGfGYE15yR7UxmkcCvyr47fmXIhAPtinVkji
         FBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767780483; x=1768385283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iCZy5ZimfodLcwbOaVLFHW7iZbjkqH8ixo5lKjkcUd8=;
        b=aVajqdhN/nNT5Pk/fCe+S3k1X6WvtOTYWVlTRMs16Ina8pfFjRUGox/vgAqhpfr29U
         B/OUPSDiL8E2E34xYkwAqP4oTqssBre3oCcLl9dbxP/0B/OYcLbzuKAMwIBJfdZMvXlT
         KSMPTj2bQtrncbhTNiWd4nlGHsrfHxngQHSfyZD24bsdZcYaGbg6+ADamv/o+kNidr+W
         SKm8uGTzrRZ55b12uTxmFaDUQdenOA/Oq6WFk47yoxxX2OLq+jp1l5mH1Bcd2iHtgQvJ
         dxmdSTXeYteCc7Cr7e4+LeyzQ5UkdyEDmxc6hYV0nfVUEPlLnVh7ZWw34hDvnmZWjwje
         GFGw==
X-Forwarded-Encrypted: i=1; AJvYcCXqWPqG4QsbfZJUhaBMBV5dLH6pxTUuZ/8xGJrdYIvSVsd955Pds7T4u97yORV2QpgJ9fcd/NrOFcfDlejw@vger.kernel.org
X-Gm-Message-State: AOJu0YyphTdO2+p+BsgKafbMjelMcvkChJvNIwO32fmCwMI+U3RMVXoe
	rlU0Qt1yzkEahCdMguHs6Emq48BA3zPyzQSa2Pfy0oW9f6qrM1prmF8DmfVK7xi2L8N2DU681k8
	8zbw0IxlHSesdhSnxjDCWxPpcBZu/Htbq1ak34dyZlAqmk2Tzdc6coMN5JbFFAJGPHEkT
X-Gm-Gg: AY/fxX7MEasHa+qgBsWwLCayUUNVApySPa7WFPxx8bvh0/2+Scb8MiV0/G5EmS3C9JQ
	GgDWvecTBLNRNIeQnIS1tSHgqJcw9CNUrlmal0zW7nnY7idgLiJP7MnG7ertXS0vWMm5FCoFFR2
	v+7SnTnV4KOGLtwSeQdLyb40thF/y6kRbA2E7ff9YSkLiKlYupiaqTwFfkuq8mR9BwLzFj6Lc9i
	EDx15L0noQeviN+U0aM6V50GjSKnsgbKWKTkOoEvf8H4rOicMcyvGFb6jfwJBHGkgUpAmQfbQlT
	pBAX346t7n4CSxb2nv1yl+UgvONEcRNY+WVgsOt/OaAMnWENh9MG6KCDjSOzcj5YhZiWbXR0ee0
	1swjbqa7qJmR776SeKdRnjXCYQr90ZglK9vX+eZvBOyOfogARNVBZU2VbOCAZ0v9te6dAcDSC
X-Received: by 2002:a05:620a:290d:b0:8b2:edc8:13cc with SMTP id af79cd13be357-8c38938b5d4mr225852085a.40.1767780483233;
        Wed, 07 Jan 2026 02:08:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYzNjbE4AMTRaewbQHl+ZKSYZkDqR+2I4qrIYfJq5OvqY9hClxKzkE7h9e9jyTqreaqFI0Xw==
X-Received: by 2002:a05:620a:290d:b0:8b2:edc8:13cc with SMTP id af79cd13be357-8c38938b5d4mr225848585a.40.1767780482751;
        Wed, 07 Jan 2026 02:08:02 -0800 (PST)
Received: from [10.38.247.225] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f540650sm347290185a.47.2026.01.07.02.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 02:08:02 -0800 (PST)
Message-ID: <674b8615-dcd3-4ae8-8433-cda6e8347048@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 18:07:54 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-1-bb112cb83d74@oss.qualcomm.com>
 <20260107-tungsten-barracuda-of-management-5edb0b@quoll>
 <6a74e675-b011-4e1d-860c-4c3232beb2a2@oss.qualcomm.com>
 <7fc7c14c-a305-422e-8755-22e7c28bcfb3@kernel.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <7fc7c14c-a305-422e-8755-22e7c28bcfb3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA4MSBTYWx0ZWRfX2sYN35zyw+J1
 kPDn6biLViLDyBAyOlEYVSiSr3UnHaDHCo6Y4JgY4aPl4w86UJIsua4jvCHeR7LI/P7bTvFlD8K
 13j4MYmWGFPC9JLrMPmPR1eaAaTYG9Lf56qHEU5GwpIl1/qF4bxQHirbsS8iSeqM56drRtSV71z
 B8rBcj6gsn/xqCvtH249DBOlYiFu63yu5CaJWjU5hPpwvQ5C+6MjwJByrUtRYzN089MKlERmHqS
 jFCWIvMiien72O90VEMwuccVX3C7PqcpqM5iQtbKTfA3QUvPfHoe+BI8gB+O9xI/KFKkX8hPILD
 /imvCFvxb8RZbTDHgxF0oikal3MO7wbn6hqeY36HwwzX4dcRWc9oH2ovQhDHkPrlinj753YSka7
 QPsFmt2CSBom9fBtWjw5xqmwc+pJWkgcXTZhW6WQtAtT9SQ7caVEFQm6wiePEbX8XKUpxetPpAg
 AGWmmpxsyna7ZgCZ8Dw==
X-Proofpoint-ORIG-GUID: 52r3nkAVlgw2Xw5zNWNKBhnK4YSlla2M
X-Authority-Analysis: v=2.4 cv=comWUl4i c=1 sm=1 tr=0 ts=695e3083 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tqjSdkmDS9pqd0uHxZsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 52r3nkAVlgw2Xw5zNWNKBhnK4YSlla2M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070081



On 1/7/2026 4:34 PM, Krzysztof Kozlowski wrote:
> On 07/01/2026 09:17, Wenmeng Liu wrote:
>>
>>
>> On 1/7/2026 4:00 PM, Krzysztof Kozlowski wrote:
>>> On Tue, Jan 06, 2026 at 05:39:53PM +0800, Wenmeng Liu wrote:
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            enum:
>>>> +              - qcom,sm6150-cci
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>> +          minItems: 3
>>>> +          maxItems: 3
>>>> +        clock-names:
>>>> +          items:
>>>> +            - const: soc_ahb
>>>
>>> Same question as before. I did not see any resolution of this in
>>> changelog or commit msg.
>>>
>> Will update commit msg in next version:
>>
>> For this platform, it uses soc_ahb instead of camnoc_axi.
> 
> That was not my question from v1. AHB and AXI are both bus clocks,
> meaning for this device the same. You again name the clocks how you
> called them in clock controller which is wrong. You name here CLOCK
> INPUTS. What is the role of this clock FOR THIS DEVICE?
> 
> I already asked to pay attention to this difference.
> 
> Best regards,
> Krzysztof

Ok, i got it, just feel a bit confused.

+			clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";


	clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
	clock-names = "camnoc_axi";

If this is acceptable, I will update it this way in the next version.

Thanks,
Wenmeng


