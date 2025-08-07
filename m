Return-Path: <linux-arm-msm+bounces-67991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E03AAB1D5DF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 12:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0949A167A52
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 10:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCAC926738D;
	Thu,  7 Aug 2025 10:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ddF2XvkY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BE823815D
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 10:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754562825; cv=none; b=NdfzOfvkvfF4JwQHiiaDLFBL8fSO/typGwxgnLvBNYJl99+Sr/jjyCAWw/PQGtfZCKpqiQlHfo7wWw85SAkrHGFNnGM49NXe4d6f3g4hwD57TupmXnCiHhTJFfVCkRmIgC0pEASEK3gSawmSJIWMqTq3epQO7WiYUzwxhqP51CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754562825; c=relaxed/simple;
	bh=aRfkNpM//pBU+oYZRnw2Z6WAeGX51uxS/BOb0CAPA6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s8hC41RFT4nWOYa89WFew6yH9/bqQmvuaEkAHV/JsRiNthRS7vCr6PNlNLcEPNeWoAlXke17NQ65cjwUY2YFmZy6j3SicCaO7RyeydcEZogavHCv3oHwCWtFW7hJvq9hYvybhj5lrBb6bA9aCWSMINu32wtX5YhSzjOIr27ePcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ddF2XvkY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779CwFh032598
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 Aug 2025 10:33:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yj4wYlTbCwxe2PSZY7rFcU9tQhw7WtnXz4t6GtIJ6mA=; b=ddF2XvkYouSbD/jW
	I9Gfw8ecfrNOno3xqLGPTcI7vIADoEwAIucXcHMemYaKY3xtPVNzO9gXQwWSOCjP
	Fu04Ld7vQUm3h1Bv5fcB9qBTKCaUsKsuhaa96r2Urc6tvQLfbEXE9GVUcupG9rG7
	QcyaPmDB3kyQV2GlLrARQUd9ygcjirEmq4yGzm9CSdWEaf+g5Ps2SVRU3Upj9KH+
	oiLMs9H3jaJQE0OvkTaW1eu1vwpnbAKXN7W+o8sQYtY9hUNeuVlyAfNsJjR2A59A
	WiOydk0b35h3AlEC4VBV1ab1HCfD/O1hmD/hBJ/NLeaKrFK452wNLq3QRg0ZSqgH
	x2y1iw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw35yk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 10:33:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76bfab12672so1902422b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 03:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754562821; x=1755167621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yj4wYlTbCwxe2PSZY7rFcU9tQhw7WtnXz4t6GtIJ6mA=;
        b=MMl80Ypz5K91S4lzsu26OQ3q95AUHSUZK/kNj2PxtyU1LUhL0AEQgVYT+UXrakDJjg
         gVdN89cSP9miA38Lx5jL4FLxzv6GBbNJZX/Z4MlXiMgqH1CXUbyZbu+zYfap3SNHBTGK
         3tWfulbOWPwB2Hv2ECmVfMKf5fDOK7OXO54rSpUmlhVbtepCrjyeRTm4QM/sWhFmiPia
         sBl8yGOfmDbijiZ1cgkxhVduQeGKrydwNXPcSq/jp4Czjf0/yC4UylTgp5seiJmKzZuk
         fc9ibGL3pCHZ1LjRQQaDAUHU81LsfJRZLcdrFFC1SQDGvbn8mDFGX8HjVFbHgXt6JqKd
         gVUw==
X-Gm-Message-State: AOJu0YyTIQiKwrJ3f64A+Px5LLN0RC8RBB6FCDI5+cek5HrML5YfJewC
	/ScJBi85BH9kVjdPxmPejwcFErbL8ctjZ546C2gXjqGhzqGvxKLQHAyaKzqopkR8ef6zaEgvEJU
	XsHF8CEiEKIhAIHWZqMwNzAWmnuYhAf/jVgrG0qdzAmyMCg+tXmqGyU1d0U7tkqQ1ZOoI
X-Gm-Gg: ASbGncsy/DKXXivTuzJMk8nJMpWPx83V0fdXpJW9+aHRRURl0OXiRyxG+CuXCTHwdpR
	ONpS6AzT9Gq2nPhOhOobLl9BshO2Yqf9ERKrVItNMRX3g1eZb3wulXJQNgf/YZt64D3gf0mjqTK
	9NUhRP9xPqBEsyj8c/Wctug/n1AcK1r0/cZgF4sJooDi5bC+M1Zf0SYBLpt0QY5WabsuGV2y302
	ey2mxSyXAKIK/VCRo+QU1F4+3gmmeNWj8d0AMmUBn5IWaHGnKmnXSelPaG3LL7aJ8Ryig+Pzmc+
	AxO1JH4T3C1T4gYR2pOCjXZnjtSHnW8fUhIodBaHU+CGTyMwxgM04Xruzrum2yNseOqci7uAOTN
	3iqP1odXt
X-Received: by 2002:a05:6300:218f:b0:240:160b:81bf with SMTP id adf61e73a8af0-240330504demr8438054637.19.1754562820809;
        Thu, 07 Aug 2025 03:33:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhYvbZOVRKIjkflKJ6i4gZ1vDxK7SFCJ8tqdD4ynpxPyraozOCdxExCiCicXthuRRWP2JZtA==
X-Received: by 2002:a05:6300:218f:b0:240:160b:81bf with SMTP id adf61e73a8af0-240330504demr8438021637.19.1754562820406;
        Thu, 07 Aug 2025 03:33:40 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bdd2725c9sm15502209b3a.6.2025.08.07.03.33.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 03:33:39 -0700 (PDT)
Message-ID: <8b262389-3c1c-4618-9670-8de86751c83e@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 16:03:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5424: Add reserved memory for TF-A
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <95959a89-655b-4ac9-86ba-d8d943809b6b@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <95959a89-655b-4ac9-86ba-d8d943809b6b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfXzPdjLltWDdp9
 xV6uqXsm0F023Pr6HRxJ0bm2BRLaQ0bJ6QtlyORjx9xmtGKk4c+YXDOr8IYXYJaxSIDwnpohKeA
 w99nYn/gyfge552sMf0gve6HhUvguhKgA0rBGTRxI3mp/vf+i0b0Dye3ZzuztDajGt8oONReBN6
 orqxWYhdnbMAyuqsEl9VIhwRNkct4R/250aTpKQA9P8kuQBwv21nYD077nUZmDqr9S00PHDmgeV
 4ifgjaUEjHjlACVE7vTHOsgt+xB5AhgoU2sSIlG7DgxLCNPXXoS1iwducgotrEUTDNRZpEutBLY
 n8CSWiTaaWjD4nI4xsjZXgJ+c4O2bSZzAa5CV4q5Wm/Ddkkrt6wxCj85JvnOOSvlSMi98jWdn4U
 gRMcP2GI
X-Authority-Analysis: v=2.4 cv=J8Cq7BnS c=1 sm=1 tr=0 ts=68948106 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=OAahIlVLQCIYRdnnqX8A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: O7o9ozbzTdamLkkuR4y7IUfAupQqXCyD
X-Proofpoint-ORIG-GUID: O7o9ozbzTdamLkkuR4y7IUfAupQqXCyD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008


On 8/5/2025 6:52 PM, Konrad Dybcio wrote:
> On 7/23/25 9:04 AM, Kathiravan Thirumoorthy wrote:
>> On 6/25/2025 10:20 AM, Kathiravan Thirumoorthy wrote:
>>> On 6/24/2025 6:57 PM, Konrad Dybcio wrote:
>>>> On 6/24/25 12:36 PM, Kathiravan Thirumoorthy wrote:
>>>>> From: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>>>>>
>>>>> IPQ5424 supports both TZ and TF-A as secure software options and various
>>>>> DDR sizes. In most cases, TF-A or TZ is loaded at the same memory
>>>>> location, but in the 256MB DDR configuration TF-A is loaded at a different
>>>>> region.
>>>>>
>>>>> So, add the reserved memory node for TF-A and keep it disabled by default.
>>>>> During bootup, U-Boot will detect which secure software is running and
>>>>> enable or disable the node accordingly.
>>>>>
>>>>> Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>>>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>>> ---
>>>> Can the said u-boot simply dynamically add the reservation then?
>>> Yeah it could have been done in U-Boot itself but it wasn't. 256MB DDR configuration solution is already shipped out and the stock U-Boot enable this node to avoid the random issues.
>>
>> Konrad, Do you have any further comments on this?
> I really don't like it, but fine, I won't be blocking this either..
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Please make sure that the next time around the bootloader reserves
> its own memory and doesn't depend on what the OS decides to do


Thanks Konrad, yeah we have a plan to mitigate this one for the upcoming 
projects.


>
> Konrad

