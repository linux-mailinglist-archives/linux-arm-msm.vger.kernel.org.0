Return-Path: <linux-arm-msm+bounces-67791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D20F5B1B4D0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 15:23:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF715183076
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 13:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D1B274B5B;
	Tue,  5 Aug 2025 13:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SUOyD6o9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974042749C4
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 13:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754400174; cv=none; b=l68jbea0K4tDqAaYvtmxQ/u5O0KKRLaGjrMWWzcOFHN6zWwiadS96MsKqR41ur3XNjNmoRJcAXfJ39VYttDQz3QfipVTWVGkkOaTfPebj73pC/O0sFoSlkVVQIkZMT+tB8vBJUjLbd9uN8LnD0q64RIGAjhnI4DgcS1JzELIGoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754400174; c=relaxed/simple;
	bh=vM69YlZ1vil1Kc6o0Mk0jcGWkrgMRscriQoGPfFNdic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qwUbEB0D90sPHURZHvLJIyMv8/wQ1DOQxuglgHEVAZeV6rNLB4RWG5edi851wXMyY5Z3XwXhYVK2pnVEseJkGTqMKcG1ILhCMw6Fhh4h9nnrQmYps7Ho9ptDaOj0xZdBNowlP9PzEI3gxdVQeDWfHfoU6RJ4ASCq6XDsFw6Xvl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SUOyD6o9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575AX90N015822
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 Aug 2025 13:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	szCBzR4GviCnbp8YCyWuodHs17KNEjfZFGcMBSEkhp4=; b=SUOyD6o9vp0ATFRw
	+BcD3UNJgebeKKlDmEfwtUF9XNGt9eeZQ72fzTPdrIZ6EnBrsiMqW6JQuIZ/QuRN
	xkCEdSTm43qqzkbwgcgNl/IcnFsyQ+FYNGt48catnX5w2g6K1aHX2+z2w3lqD4lB
	CUtzLNmHKciOXyFUa73mTeV/FlIfZOkEjC6nZzXnq5yOSaxyttljkUYALMswg9AY
	wTLYW/vcbIvrubEm+hzOn07YLH2jYYHMK03jITDbJrvqty4St/FsLEQg74U8s8R7
	99fQ2YR6uw/wJGxgM4x1CfuoOnL1p457qgP9/k9gFyNhlixb1g38+66mliYPYWQu
	5B5qIw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48aqyv4trw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 13:22:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e7f74bb018so39661685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 06:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754400169; x=1755004969;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=szCBzR4GviCnbp8YCyWuodHs17KNEjfZFGcMBSEkhp4=;
        b=NqnWdlnF+JUTGkrku7x/p5/XBGWZvdykrxijwLmygQ1GU2IiClxloSz8HUTycPjK63
         5dVtcaefgTlbf0bX7eekiIK2W0k8ACnUM3bMcjDmEXmzkZ5EInRUJ7BpD99L3A1DMdSX
         7xJSl9ex/ZRqk/sW+I0H5q6R+eNDmzV7nD8ou+WelazvvAOvzEZMZjJhHP3UvkqZfawr
         pw/p+CxWvKCWdGZdK3HXRb2qwrY/kKH2Kopbe+jh9+DKrk9+XhtVAx1lLIDCMmb9Tqku
         lr2km2iOl+B+6/vvWFmJK4aj+JUdNwjbTBq/659hwpBdps/KRgj8u3Itxsl1uRZ1KFUG
         /iAA==
X-Gm-Message-State: AOJu0YzKIFc9fr8a6cXnI4B06u46IszG/7AI2o0d0pT9bx3MMFJg6eGi
	wg+mPtME5o1EoG+b0tTj9N2J8eXlORs5YERe3vCHZXKnVXjegriQDFZfZmyUFMweAKmR1asnssy
	WDrSOefqKRq1yBx54yayBxr+7xGcU4EJoAc0eAsMTeairtV/2dGadJ6JpEDKBlGMmoGaR
X-Gm-Gg: ASbGncu9aZsr0iYDJbpACJ8OkuwyxUGhbZ4UsLaFFpH3x06HmZRuJ5D1rR1vRaZvpKV
	/JXqOJ6tavXhV9dsMCW0nfVl/SOK1Klb9ZcEw9Fyn/qC4Q9ZZPd1rLlOl4qSTqB8h/BZkObMdoc
	bB7tzoYar9Rqhx2huWqz/PbCa/07WjyozwBHj9LDaA8t/4VMzYg6z6XiVytWVROurP06WrDK22O
	SqaAUL3aMreBR424gLOIqeuTQV6gaetVwR64G+BF1h11jDdNSHefpGoKh6y3+3zlXsFAan7xVXS
	Bkhwfliq0WsBbSndWESs9SjIYiHVIksaAsXrSfgEClsdpWhlRuZyJkLlUGIjEwbiAVCXLs0FJtN
	RBtMcgZLmwE9TPf5GPw==
X-Received: by 2002:a05:620a:404f:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7e696346fefmr816815785a.10.1754400169160;
        Tue, 05 Aug 2025 06:22:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFXEmIee6IbP26kuAnbrZ1NnF5HlWu3jLRuHodegxh1SfCqr3ws+7CGE6x21Dl6JbNvMNXMw==
X-Received: by 2002:a05:620a:404f:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7e696346fefmr816813585a.10.1754400168652;
        Tue, 05 Aug 2025 06:22:48 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c099sm892748566b.108.2025.08.05.06.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 06:22:47 -0700 (PDT)
Message-ID: <95959a89-655b-4ac9-86ba-d8d943809b6b@oss.qualcomm.com>
Date: Tue, 5 Aug 2025 15:22:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5424: Add reserved memory for TF-A
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vignesh Viswanathan <quic_viswanat@quicinc.com>
References: <20250624-atf-reserved-mem-v1-1-43b1940e2853@oss.qualcomm.com>
 <0826de9f-0125-44d9-84cd-1c52ba199a4a@oss.qualcomm.com>
 <7d641576-7ec7-46f2-ad53-e0b8b36351d1@oss.qualcomm.com>
 <64febbd6-abca-4ab2-abe9-93812bc115cb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <64febbd6-abca-4ab2-abe9-93812bc115cb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: j9wuw4FsNun90nZZSgj2ms58WvLKooNP
X-Authority-Analysis: v=2.4 cv=F/xXdrhN c=1 sm=1 tr=0 ts=689205aa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=ZhiXV8X_0r9cGbBKTBIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: j9wuw4FsNun90nZZSgj2ms58WvLKooNP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA5NiBTYWx0ZWRfX+l4nC8MgdMid
 vIGe9s59VjO9GZWFf56CsIGd87sSHU7tm86DlrgW8zZj/qjNCQEC4QT5WcJ3V4YJ30ZIJ4aCqLp
 3RaKN/MFg5qKWDnSlI9IJgDHkX14uUU3gKjW9TrakA8/CXdkjveqSAGRSMdYSPxr1+aS79xjSDB
 D4/qbkGZHSwzoQiRaDkp4feG/RWk0JQZekFMn0lsqW4RygWmRbVNV2/zST9iXVZbdK5y4ey2wrQ
 kfBku0hcArv3MxrrZB4lchcG/fdCBAA5R8bDjjwKAyQ1g/XyOHhF+/4eiapAyOzN8v6DFfSGv+H
 GvxIJrjNFNR4z2rGjtR3AVv165yMf+XWHgYctWUe1Fy9cJzk9AC/J8ZHpeTLQc7E5yIFQ30uucp
 8mypM30uYFe8jGnd2sNDkJhVfVr0Ki9jfvTm/QwSUUO6KJwAEDAtUn1B/d7bBbvbd9zPMOXR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_03,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 mlxlogscore=543 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508050096

On 7/23/25 9:04 AM, Kathiravan Thirumoorthy wrote:
> 
> On 6/25/2025 10:20 AM, Kathiravan Thirumoorthy wrote:
>>
>> On 6/24/2025 6:57 PM, Konrad Dybcio wrote:
>>> On 6/24/25 12:36 PM, Kathiravan Thirumoorthy wrote:
>>>> From: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>>>>
>>>> IPQ5424 supports both TZ and TF-A as secure software options and various
>>>> DDR sizes. In most cases, TF-A or TZ is loaded at the same memory
>>>> location, but in the 256MB DDR configuration TF-A is loaded at a different
>>>> region.
>>>>
>>>> So, add the reserved memory node for TF-A and keep it disabled by default.
>>>> During bootup, U-Boot will detect which secure software is running and
>>>> enable or disable the node accordingly.
>>>>
>>>> Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>> ---
>>> Can the said u-boot simply dynamically add the reservation then?
>>
>> Yeah it could have been done in U-Boot itself but it wasn't. 256MB DDR configuration solution is already shipped out and the stock U-Boot enable this node to avoid the random issues.
> 
> 
> Konrad, Do you have any further comments on this?

I really don't like it, but fine, I won't be blocking this either..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Please make sure that the next time around the bootloader reserves
its own memory and doesn't depend on what the OS decides to do

Konrad

