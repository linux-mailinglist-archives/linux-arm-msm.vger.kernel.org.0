Return-Path: <linux-arm-msm+bounces-61630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B98ADDC23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 21:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F5C7170A58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 19:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D432E7654;
	Tue, 17 Jun 2025 19:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TJidAwEP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525502580E1
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 19:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750188037; cv=none; b=hQ6qc7Q0jCQ0wK0/uTtV3F7B5BQlsIxpQdRbh4RruXk0H7TpczstXu9oN9dYOu89fwteeHeOQzSpNRB3xvorxhFwAXiswUSj5fdIF9r2dGjeVJnwZZPGPDcREhrybUcTiN2z98ILPsApZNcUDXxM7m38NXZHU04vOcNhSwoU8+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750188037; c=relaxed/simple;
	bh=7ZxuX5qNH/g7aYt9vwHTYrn1wT+rYHgFlMjsAb+VBQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ROXVI4sgNb2k76QSz77Edm8q6lwA17+0vU6NCOFHndtGDIGfw1YyHdWkLDsW/7B8RFSAPKXi/ZDuFcw0nBWBnSm6Y2IEWTloqHpt3VQTS70loFLlW8DEySpfhmgkwv4jGIukq5Ha7zOBD7c/7Fa/eMv7/xJzblDEJLL33/GBbBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TJidAwEP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HDCV55026662
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 19:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p+uy4aSZAA+0y4I7Dl8zbOucbgS77E3xujWHGvUgk7Q=; b=TJidAwEPidk0NAbU
	DFCYPDHsTpExJf0tdyyFN8Ys6W5xErXtJtwP0GdXla7aLRmsJ+VKE0ozUruyYHjb
	aGbyu5eSXFZTpSotQxp370XyHPKqf6Um4DNaI0QaypIyuDD/IsJMss53wGstcoE9
	z2WKmwPWWH/4ZVZ0r3uouTBCzhvZjrD3vbbOIbNjLbWI4VgNM8pZjJ2/hx/pzWuo
	75CHcj+ZfZ74NpeAGjMdbaoMUWsHEk/e98kr+CAccRs28T2EPw4mSSNAVCqpfjLX
	39/m3ousyfVBX7N/xYqdaUwTfS1rvl+r4XvEh5iFRn3tIvbPxD6KoCaF3SXtCrRq
	gRqWXA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mhgun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 19:20:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a6f14b5119so1311051cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 12:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750188033; x=1750792833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p+uy4aSZAA+0y4I7Dl8zbOucbgS77E3xujWHGvUgk7Q=;
        b=gymKEeTAyc188pSxOBTTjKPfZ42kEZdOo90GxoHB7pA6FS/y2gpkM7Yv8iFDfKV3bc
         IIsNsD3PrhXGCRCE2QXB+YUirq+lNr14OwfcfM9H59Hio86N0Q5yGzkD6UPpY7Wevjrz
         gE23QybFqseGnkaFIZP2nyLJZI3vSVueo/otMcZg01ms63EQf4IxBuyBjkNO36RVKd5f
         qXE+BoCsifJT7pkUb6q27J9cMmGt43MxeSPgr4WV2NphUGP9qe5/P2bNix9zF9HXMsxT
         wklVXonCdV1Q2EcC7UCgis8Lg0UfoQm6N8oAhrDbv5hpK0i6d7sZtXlDtv+0WMQ5DEcR
         rmnA==
X-Forwarded-Encrypted: i=1; AJvYcCUM76+O0nHzXgTSEbzaY1xosEKoHKYeVvmPydX7oZYCdgrSgHmuXZmTI8gJ39SzbnTgu8za6VMPMKJoto+N@vger.kernel.org
X-Gm-Message-State: AOJu0YyfqL5vqID8sak/7MboA+KytVzC0AkAtkP9rQWvh6GfKKpqmWhy
	cei/v3NI2fIKJ5an6gzPgjTWhfmgqZAgSNYGpZkrnJDF1bm0rBbp5hpIN2yLQmElNu1S4wh2Iqc
	V5hkEkgs5zPb0fwuNDb9U+UXrK7ZP7rQZHNaMzO8lm4hT82hBZszhd+jAgydGm4xKC2YB
X-Gm-Gg: ASbGncuquX7Kl74HXA6nlVdQEACAnWN+7AWRGEmKattjSvSdSaKqVcGyCZqunm1NMg9
	FVdLj182FHJ2mJEk8O8Yt4qJG4y7i42+HHehMBYdtOgazP1w3a4QHGEG5UmllqWYdmpln1GY05N
	J/MdUuP7DGBIRjzkV2nXEBobt5SR7fsXzs95RJAaYRzrRO5c0HzwcbG2IS3fCT5wYWxe0j/BnIw
	64rQxP4swH24CDoAAiBvPPlJ2x+RzQNOUKh3xQN6g1i28qk0hhwouFpAJiYA7dq+xhUapcenef6
	ZuwxS01AOwuEOkiaokJCaF/JucM8h/8yHB6+j8ycoLIi7En43/Og2CVJ9uwAOj7kxmXExGGGlTM
	IbZE=
X-Received: by 2002:a05:622a:1991:b0:475:820:9f6f with SMTP id d75a77b69052e-4a73c5f40c7mr83359271cf.9.1750188032850;
        Tue, 17 Jun 2025 12:20:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE56rx7QKGhve9dr+onwzo1W0p7twcfmKBnjkPfzZsI/+eXaqjKebmbfZD6IJVOwX8voyrpbA==
X-Received: by 2002:a05:622a:1991:b0:475:820:9f6f with SMTP id d75a77b69052e-4a73c5f40c7mr83359051cf.9.1750188032339;
        Tue, 17 Jun 2025 12:20:32 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae01623f2a7sm36025666b.170.2025.06.17.12.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 12:20:31 -0700 (PDT)
Message-ID: <1fba505c-bd01-4d36-9efe-17172e11fb1a@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 21:20:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] dt-bindings: media: qcom: Add Qualcomm MIPI
 C-/D-PHY schema for CSIPHY IPs
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-9-vladimir.zapolskiy@linaro.org>
 <6e411e89-ce1e-4d6a-8d48-b800554f830e@kernel.org>
 <e9afdd0f-7842-4780-9044-d5afa6a09d7f@linaro.org>
 <b96f9cca-cdd4-4456-8ced-f4a8fd810ff1@kernel.org>
 <9e383935-a10c-40ec-a63a-243cd028374e@oss.qualcomm.com>
 <4f7225ee-fbb4-472e-8e14-a98f4cef9fc3@kernel.org>
 <83769dc1-9000-4074-bba2-d1bd465b77a2@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <83769dc1-9000-4074-bba2-d1bd465b77a2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDE1NSBTYWx0ZWRfX8gfRmusuZYSx
 aXZfCIfadbqKh7T/2d02SigX8GttJxeoHvRU6dm34IFLsQpG322rrsG4tKtpR29kcw0JmUkTSng
 dEwx6VmzESV8hktyKf33sp8Uo97OdLzk2rpfHpHGIdTd/6NeCZ6G7XcYjo1M25iowD2RP3HlUhl
 iU4S/xeGBSDKhpyQhpOjq8hQIIJLrJaIYUxhv8eXpPoXYZDQcKGhtTeXqZncQLA3wmhiTrMPWRV
 5joRGXFzqNRga2vmfe5bwsHpnUrphZuGFsLve4AvrLRofl4ILohC9qCKmX0/n87ZgyEvXpA0uU/
 sMy5N55l6DR7DJxeiF38gxqIaPFk82PNuA/laOKEOwzctWQQxgqzFZY3Vy01V/zVMgtsBenJjXn
 DmAE9th1Y66KQF18mJnfM3UB4aPeg50B5dhSe04lTqcYCSrQ5gNzhYZAo0LBeevM+MvU/rGa
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=6851c002 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=wbO4eoeOqdvOmasGwY4A:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: TL7E3bHxdrF5hElxu7uc5qVwtnZDaekl
X-Proofpoint-ORIG-GUID: TL7E3bHxdrF5hElxu7uc5qVwtnZDaekl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=922 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170155

On 6/17/25 11:51 AM, Vladimir Zapolskiy wrote:
> On 6/17/25 09:32, Krzysztof Kozlowski wrote:
>> On 14/06/2025 21:31, Konrad Dybcio wrote:
>>> On 6/13/25 8:28 AM, Krzysztof Kozlowski wrote:
>>>> On 12/06/2025 19:13, Vladimir Zapolskiy wrote:
>>>>> On 6/12/25 10:38, Krzysztof Kozlowski wrote:
>>>>>> On 12/06/2025 03:15, Vladimir Zapolskiy wrote:
>>>>>>> Add dt-binding schema for Qualcomm CAMSS CSIPHY IP, which provides
>>>>>>> MIPI C-PHY/D-PHY interfaces on Qualcomm SoCs.
>>>>>>>
>>>>>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>>>>> ---

[...]


>>> I don't have the docs before my eyes right now, but I would not be
>>> surprised if it's also called "csiphy" in there..
>>
>> Let's check that first.
> 
> Here only someone with the access to the specs can help, when I rely
> on downstream code, and it says the right clock name here is 'csiphy'.

Unfortunately, I can't find anything more descriptive than that.

Konrad

