Return-Path: <linux-arm-msm+bounces-59674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22104AC6646
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 11:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC16E1888904
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 09:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89FD227877B;
	Wed, 28 May 2025 09:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I4rKlkkc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2569278152;
	Wed, 28 May 2025 09:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748425911; cv=none; b=MJVj3+edQJ7BWHPsUPOtQ5JHXdykJTZi64LM2RAczzw70LmQvcWOBCkkyxlfxDaq37Bm0cWf0ufICjfyHRL5Okdm8nN+0wKyn9EA1pn9BVjcEdMUlOJ+/F1llXPMrYl5EWYpax+T1577SGjLScj8DBeDyAMMHxa7n8Z71k41QyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748425911; c=relaxed/simple;
	bh=tcQArO/ilw7koTVs+1Wqs9sPMLBSpYyfkvbgmUzFeXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ua6T/+skBZNZfg1i5Wl5/JZ8KtleE4SyDAnGnrvFgCdIFUdT2SnMxydzpqFwJ/X50iqnJu0mZkIfbzELG1rXChUFm5moG3pwtNnBz3qhi3o0nh9dzrxV+GIhZR0OgbjEdEg2FKeKqrD72p8Mbi0s7RLFzBwH9T4SShPmMRxAMs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I4rKlkkc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S8gG2x022962;
	Wed, 28 May 2025 09:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wp2KgjjSZKhPsd4HV/S8Rh5q5fv+5sUwsR45Qw85m0w=; b=I4rKlkkcmQDiKk/W
	roAjtfpLaewNNA49eTHjQZweV9TBXnAGfsa+eVlHNq+VgWL5HP+Jwf/Ow/u8ZNQu
	AnVjgDRDfQ7S2paykfKWtLtFQRrEb1o8aWgY1vO2ZDw3QDY3TZ5MqZz2RFdfMy8c
	Vkrq8weiTgHvfJAvSB1rLa3VL0+SWx/LnPuGeU3chfAaeOvcvKMcNcwyzU1FPinC
	ZY8nRQWAXNWntttSBD+IDFvfe1ZTsibauS9ljHPTXM2zhfoQCAxrxcHzIt+1vaik
	TfurmsZosej3S/gVr2QHQLN3oRPzBNmZIv8IGhgcA4oVSUdCzYg5LN1u4vqXcRBb
	COZkMA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmgcx8x3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 09:51:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54S9phOf020897
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 09:51:43 GMT
Received: from [10.218.22.7] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 May
 2025 02:51:36 -0700
Message-ID: <bb9f9498-5b24-4df8-923a-a54bc528799d@quicinc.com>
Date: Wed, 28 May 2025 15:21:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/18] dt-bindings: clock: qcom: Update sc8280xp camcc
 bindings
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-2-571c63297d01@quicinc.com>
 <20250519-barnacle-of-beautiful-enthusiasm-4e6af0@kuoka>
 <ec4ee2f5-162b-430d-aeb9-90ad4559707b@quicinc.com>
 <the3rt4gwb766u5tmzzugoozkyt3qw7kxvy6mlemxcqb5ibs37@szcq2rzbukma>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <the3rt4gwb766u5tmzzugoozkyt3qw7kxvy6mlemxcqb5ibs37@szcq2rzbukma>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _I-QgFM5UlQRHwcQjaVShaytowtLaBq5
X-Proofpoint-GUID: _I-QgFM5UlQRHwcQjaVShaytowtLaBq5
X-Authority-Analysis: v=2.4 cv=Ws4rMcfv c=1 sm=1 tr=0 ts=6836dcb0 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=P-IC7800AAAA:8
 a=qU0-ABsse5SAqXbbjgwA:9 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA4NSBTYWx0ZWRfX6UqsCeu+7/XO
 hkIKzHjiwbyPlYFVq8PwHgLZeBCOLcBfipX+yOLQakUw/F1sa1ICq1ftdhmn9Wxv1UhSiIzutps
 1i7OlNj3wxSsSTFo8IZyttP+A2Kr3ZiR3V/czOuASdomQ90VCkoPNNbEaW1XYKqA/5VihAERdrm
 zh7GI/vuZ0I1QOW8P+tR7ccRvhpuS0hdosPX8fcNHXelN/zXQS4t/RIJZvtnkXm3OTz5tAZzvyi
 vvQo/7ct/niem6TjHnLRwZW/5eaTiPaXzrXjJw1icxDdyGjUTzazVBu/uMS9kmAE3lJIgyDAoQR
 wsq+emi5P+yQd71vtDe+B/1VhGhjaF8UbtYomM9BuSkjPNgsgQa+blORcx1VseXjqsIQs3F5+NN
 k4IaiIocl5HT3t/KcdOkHb8BFVCktFHXxvsu31tGoUIgGZcVMg3vJm2jiYMTdazGBftWYGz+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280085



On 5/21/2025 6:16 PM, Dmitry Baryshkov wrote:
> On Wed, May 21, 2025 at 03:32:34PM +0530, Jagadeesh Kona wrote:
>>
>>
>> On 5/19/2025 1:48 PM, Krzysztof Kozlowski wrote:
>>> On Thu, May 15, 2025 at 12:38:47AM GMT, Jagadeesh Kona wrote:
>>>> SC8280XP camcc only requires the MMCX power domain, unlike
>>>> SM8450 camcc which will now support both MMCX and MXC power
>>>
>>> I do not see change to sm8450 here. This makes no sense on its own. You
>>> do not move compatibles - what is the point of such change?
>>>
>>
>> I did the SM8450 changes in next patch (3/18). But I agree with you, this needs to
>> be more structured. So I am planning to drop this patch and instead take care of
>> single power domain requirement for SC8280XP within SM8450 camcc bindings using
>> minItems and maxItems properties based on if check for sc8280xp compatible similar
>> to below snippet.
> 
> I think it is a bad idea. I liked the split that you've implemented:
> separate bindings for platforms that require MMCX (and MX), separate
> bindings for platforms which require MMCX and MXC (and MXA).
> 
> It might be better to start by changing SM8450 binding to support MXC
> and then adding SC8280XP to those bindings.
> 

Okay, I will reverse the order of patches 2 and 3 to support MXC for SM8450 camcc
bindings first and then move SC8280XP to have single power domain support. 

Thanks,
Jagadeesh

>>
>>    power-domains:
>> -    maxItems: 1
>> +    minItems: 1
>>      description:
>> -      A phandle and PM domain specifier for the MMCX power domain.
>> +      Power domains required for the clock controller to operate
>> +    items:
>> +      - description: MMCX power domain
>> +      - description: MXC power domain
>>
>> ......
>>
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,sc8280xp-camcc
>> +    then:
>> +      properties:
>> +        power-domains:
>> +          maxItems: 1
>> +        required-opps:
>> +          maxItems: 1
>> +
>>
>>
>>>> domains. Hence move SC8280XP camcc bindings from SM8450 to
>>>> SA8775P camcc.
>>>
>>> Subject: everything could be an update. Be specific.
>>>
>>> A nit, subject: drop second/last, redundant "bindings". The
>>> "dt-bindings" prefix is already stating that these are bindings.
>>> See also:
>>> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
>>>
>>
>> Sure, I will take care of above in next series.
>>
>> Thanks,
>> Jagadeesh
>>
>>>>
>>>> SA8775P camcc doesn't support required-opps property currently
>>>> but SC8280XP camcc need that property,  so add required-opps
>>>> based on SC8280XP camcc conditional check in SA8775P camcc
>>>> bindings.
>>>
>>> Best regards,
>>> Krzysztof
>>>
> 

