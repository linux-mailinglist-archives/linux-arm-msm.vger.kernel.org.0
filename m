Return-Path: <linux-arm-msm+bounces-66664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEBEB11AC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 11:24:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C23E3561B8D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 09:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E718E2D0C9F;
	Fri, 25 Jul 2025 09:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgBC+3be"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96B82D0C78
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 09:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753435438; cv=none; b=BiWFO6CD7PQdIGj1mlOj9UZd4rEt78L/erth5+Epo2sZeMMllTBkqyYHpzjUDjgTM09jCjQs5i+Ylcn+NxUlYwAw365rNlQvl4TvaLE01AuAPe7fvKS3p5y8uR/NYnk7D1qI9aidBKIrxE8DGCm1nguHhowbwB4kGcu9GJ2azXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753435438; c=relaxed/simple;
	bh=Dloj46RLVL4mRBXYmPz0/KvEtFoPFJB/naJFsvdgGkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uc3E6NQPMoqIoOKgb8eyufXqWFsSxMyOazvFjqIVoQvNP4fqZ91HmQm0wh9NxeyhP23pnldjQwRwK2nnOwAy0SY2VtBHUrNYZhMIeRhReytull31O9pQvEvA/yyl86brFXSU5uTgjQBycsz3+XjLcehvok+QYMClLpwOEfXI8Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jgBC+3be; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P8sdU4017026
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 09:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dloj46RLVL4mRBXYmPz0/KvEtFoPFJB/naJFsvdgGkk=; b=jgBC+3be9f55Wejc
	gks88R3qugek5GEqHZ62QR539xCGy8pI/WecpsTt7WnvT9lHDhuSp2ffynAi5yll
	yTfff2L1rFUllvMA3nMfWgQozkCo/gy7P/LVsf3q3Brk/Sf06mh5hpPznZHnMX9s
	KYyqfhplTDXZSYhdIjN2j2NN0FQYEB6gElCLHc0i8lk6B4xxowevnBqYJMh3Y2YA
	vrBR45+vjuySZriyyc+xbvjZcuYoRPbml3iQ7rTZ1QRBEdQN7P7PycANS+nM8Hqy
	AnenL6Y5N6yZkjP2v/DjhiuePP8B9Xy7fI2AaIMSzf2cDgvbYKm2iYOsUwl+JS2l
	fI2SQg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2qhj3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 09:23:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ab3f1d1571so2188171cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 02:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753435435; x=1754040235;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dloj46RLVL4mRBXYmPz0/KvEtFoPFJB/naJFsvdgGkk=;
        b=Wo7jnXPOoA3P3BJM7PsmiSxbAIPaTxqQ7psNdmEBi820j9Ka0DqJoZLK6Ggk3EKj4f
         kQH3AUIE+Pv0z2UrjzfIWDIg7FOIg4rtbkPbgksHCosqxHJR3xXdxKE2WZ8avO5Jof83
         GOudSmoxsgiDwsM1SBfSBl5CqlNDpGrbHcz4mLj+bAwzynMnxZ8dKJ+1MIWXmSrHX+71
         NjV3eQ+0ybwBmwja6DEOOG439qXpgL8ImyMScn6H5Sw7UZRIcfGhzKDolCJOY5FDJPJr
         YnyLYvJXNv7meXDSdP4tJDA7dYEyFjoHmtYIeYBajTuaJ7C+bewIe56LHZC03GcbXKim
         sA2g==
X-Forwarded-Encrypted: i=1; AJvYcCV/k4d6XlZJXiyxzyGE+4aj4HMEOyydYc+/QY9aqlChzmW8pnaMD6xSoWt9dKQs4ZEP2mVwbWLc9LHU9jCs@vger.kernel.org
X-Gm-Message-State: AOJu0YzSCrsm9Q+NfYXIy3Up97q7EoHWLpsKuZZyAlVEZYKYp8kN+161
	emDM9ud6bETZ+lS6HyYRnqEj+LoctRbSM4TNGUohMadg1/vIFK6ZbU5Z4mRN0eCpBMxdYNx+e8G
	wCDx5R9otjN1Y3aEm3wK3cqscQl9RMWCvVaIa+DmgQE+8E1eAe8vtJwy+cbJYuxfROYEg
X-Gm-Gg: ASbGnct98DJhZtxrjbS5KFarVtOvz+ZNagO65bEmS3JNkMGzsw5BoBkPWzt4YOeZMTS
	4fGtUDtMtF+IqEaclb5vAeBRiRE9h3cE0HLVWAviftafYWl/FYx1FXZby5nzkuH5D9A10JqU1+Y
	7Mi9z+wYY+cb8GLwIpXGk1bvxxVnm/x/INDXGAEK9VfM8uwgXyXEQrNKdBFeJLFLO96MVtGu6sV
	rBsd41ZEPjehqxxl8kb5Wxal6KYvKCjGZfhoPI8rIVoEEUMpimxNEZwcvHnsGOT7TotP/DFfW0l
	w8B6FknkgK2KsYTiw7ICHBLQ2BHcapcMg2mfXaBUGG7Bn6r+u6WjX1mkt/Zb/Gt2TeWn0xOzI04
	cdPEibNUOWHEstBVZyw==
X-Received: by 2002:a05:622a:11d3:b0:4a5:aaeb:dce2 with SMTP id d75a77b69052e-4ae8f015169mr5405571cf.10.1753435434578;
        Fri, 25 Jul 2025 02:23:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgulUkKqOz4bY42aroheUkGoGh4nZBDDpLlQeXSeqH6w6hf4y0ytwWggsRf8Lzc3sqtruYOg==
X-Received: by 2002:a05:622a:11d3:b0:4a5:aaeb:dce2 with SMTP id d75a77b69052e-4ae8f015169mr5405431cf.10.1753435434080;
        Fri, 25 Jul 2025 02:23:54 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47cd650basm239257966b.58.2025.07.25.02.23.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 02:23:52 -0700 (PDT)
Message-ID: <adffdc2f-7dbc-41ea-ac9a-015af251b43b@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 11:23:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: qcom: Add SM8750 GPU clocks
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250723-topic-8750_gpucc-v2-0-56c93b84c390@oss.qualcomm.com>
 <20250723-topic-8750_gpucc-v2-1-56c93b84c390@oss.qualcomm.com>
 <20250724-blazing-therapeutic-python-1e96ca@kuoka>
 <7d444f4c-fa1f-4436-b93a-f2d2b6d49de2@oss.qualcomm.com>
 <a3846433-f1f8-4b83-a965-baec24ee5159@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a3846433-f1f8-4b83-a965-baec24ee5159@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RbqQC0tv c=1 sm=1 tr=0 ts=68834d2c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=S94FfrcSPokYo2a8pT4A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA3OSBTYWx0ZWRfXybZaiQtgya1j
 miEtOqFpLDf4pZ6nVUakl6NMhpdahNAr8qc4xyMeJpLeZ2alUr/OprHk6ioDKkI2uoEO/KwmsUj
 au8E02SWWqGQlCeh1242uXdgAEQzLwinJ/9o7to5sXSe0XSgFT0tjqBUQ7yCxc5D9wx2lyTad0w
 YYAfQoQukI56m5SdBBYbeuxPZ1HjuEyTvgVOyIS5PVsVmIeLlqqH0qufP0DVvVGnZUyI4znro6q
 y4MvPx6RKFCYDvI6xZAXqKUv3mI0IfrZp5Ghe3DIgChxTv7hvtqqdO4iLK5weSH/tmC4JfjbINy
 9wUV2snb9UFFaWB8Eet7GW153oeyrZL8upIM73g5Z1LTKEOBgA/jbq8AT8JmLhUdAH6iFIKP3h7
 PYZqI+tGaJSagu9JmdKuGJBuwHIeM5mrviHk6aDQuG2YrTjG/1u7Ea45Ae6cTVSqpB36hlKw
X-Proofpoint-GUID: 6ZcTRplJ199UKpdei-z7y1xCOJkUIOQ0
X-Proofpoint-ORIG-GUID: 6ZcTRplJ199UKpdei-z7y1xCOJkUIOQ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250079

On 7/24/25 4:42 PM, Krzysztof Kozlowski wrote:
> On 24/07/2025 12:53, Konrad Dybcio wrote:
>> On 7/24/25 10:18 AM, Krzysztof Kozlowski wrote:
>>> On Wed, Jul 23, 2025 at 10:38:48PM +0200, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> The SM8750 features a "traditional" GPU_CC block, much of which is
>>>> controlled through the GMU microcontroller. Additionally, there's
>>>> an separate GX_CC block, where the GX GDSC is moved.
>>>>
>>>> Add bindings to accommodate for that.
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> ---

[...]

> Yes, qcom,gcc. If that was missing intentionally, it is fine assuming
> you implement the rest of comments.

With the description addition that you suggested above, should I keep
this file in clocks/ after all?

Konrad

