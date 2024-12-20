Return-Path: <linux-arm-msm+bounces-42982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B219F92FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 14:20:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 153141881AF4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 13:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAA4A2153D0;
	Fri, 20 Dec 2024 13:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nbPKx//V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58040207A20
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 13:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734700811; cv=none; b=tiaK6WudxcabM9hnzwMTgw87w7Vq/AEKatzcSlip/FtIllUxXcU+baQoFjTkPIk6m2V+6a0wW1ENfsjKxXpr4NvUevfjtM4oNBdNJCIC3NCN4ISmU6zZ5qNTPsgUx0JCtFAL/zit49lePGVmgCaoQX4igfkEBoyGtrRbmyq8yBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734700811; c=relaxed/simple;
	bh=qSfbqqTeUsfrV921pSzv4rotULKHnoKWr6PwLctoD8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=blkpRwvQkkvdHdEVWsAUQL+/qVsXGQD6F8B4WgfUTPX+S1BTYNMMRaafndD/Wuizi9IY1tHvjgiyLynWCrAbxUkqw9ziMWhmaPa80yPO4/SOSFEdrViaJ+45iDBJIU1cuDcRnTRsNqjQjxanROekfxZgFOVCsPkeo26OsEY2dYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nbPKx//V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKDHWK1017496
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 13:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3vU055oJIDpMQcbkPsF3SDZEF+lNsh9exzRg03WdMHM=; b=nbPKx//V0ggFPhqO
	qta1Sa2dKDWtrgmvCkSazJQVl9LL1kNKMzkBgAA6jRqVMopfw1EhZWUMrp4wcrxL
	sjYqgpOzwoqHL0fbXosCD9xhFRztahIQvWdRrjEKOvRPOrIu62gb3EgpeqKi/v+m
	Ze4uiZ3Oqn16BHXxeKEyD/zSqxKSv1Bzu2CFvDkglsd1UrnGIMPqclBvJXBWYKiZ
	oFbi1TLHzDj5X+/1Jj6XOBBDvvET0lnJ/l7J4OZYZKqeyn7RC9Cjg51ycNnt+VDz
	fRUeFeE5iU+ccpeZyakC9Wp7dXErNSWCxIHD5yUaAEZmD7B1fA8J9BsxnFwEG2ZQ
	oUsyFA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n9b9g0cy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 13:20:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-467975f1b53so4730921cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 05:20:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734700808; x=1735305608;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3vU055oJIDpMQcbkPsF3SDZEF+lNsh9exzRg03WdMHM=;
        b=AhW0D5J6p4YIJNAjsePeAoofcw69z3n2OuqjcFuOvLYsz8Sy1tvna291A1IRyoDVCw
         kc392pBXm41gYLsm9UbL8cmUi6s9UqBMkBm7mT6aSEfZhiEJ5LYD4gkcgaSN2br6b9Nf
         59GPvsh5SbWINquh8rA0jtvjn09Ph6yXIdPUBO8VANmKFOZFY5DFy8WDK9sr+DDMGU4l
         YdzxdFy1Tof/+0J7yCbqrhSPSfsQGFrHhNc0PdnEpFKfWQRFjk0dkVx3R3E71+Ev6eeq
         6UdhNa8/BrOY6DDOBvmlgHCMDuzoxFUa0cXwLqACkT4XzEd9q6OntsBiA77C7m8lK8qN
         qrOg==
X-Forwarded-Encrypted: i=1; AJvYcCXtXBYEJ3gZ0/WZq6IVtB0EYoeDeaNK8BN6CkddPOCwrOJ4Bmw0QaWp7GPwsMONt/9m+CY7qgMLbTxOEqwO@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf+BCwrdG6jKz+rN2Sd1y9rcQXO4gterid9c/zE3o7IYbdKqRp
	fKkFrBQzqPsiKUPIr1L/r+kq0n24oRWnqCKOL7OWT3pufjOdXqLcEI2EkVgPSga0aPNQXezQ2gq
	b1M2/1BP+Xnptt+aEOeEmrCQNwi797Xz3kTRdBZoPNMQao1xmJf7q3xH6wZulKlmg
X-Gm-Gg: ASbGnctE+hvrF6V4XzmVpDh3qkQ1DRymCFAUpyRJntiqJhZukOSpkAbbguL0ZQgHj2t
	3r46NHRsQTfbbb3sdzYFdfAnaA7o2icYgDoRbA4gXnx67QNse4L0pcq/6nWrcomehK2MEpKGfO7
	JYPcM5IrtDw7Dx5zjTcAi/34sgdmTC6Mh3154ez1Z2lr+tX+4ZIDMnPiEsJrRM8zTkaAX0HzEmn
	a7eldrRF73i7XAQ23WszDcm8bigZhbdWxsBbEtLkL4q48R2agSa57HOcDF6XwtZOGPBu3cIPcpw
	Ai97pP2jiG9NmRiA5WNrlTeri7ROQThlzYw=
X-Received: by 2002:a05:622a:64d:b0:467:742e:f07e with SMTP id d75a77b69052e-46a4a8f60afmr16227991cf.7.1734700808199;
        Fri, 20 Dec 2024 05:20:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkbtzvc/Ed5Ft0Yr+bncoaYDNLU16j3bsvHg4I5KI43NWq7dEYspuWnuZKSy6DmnCGEvS7wg==
X-Received: by 2002:a05:622a:64d:b0:467:742e:f07e with SMTP id d75a77b69052e-46a4a8f60afmr16227781cf.7.1734700807708;
        Fri, 20 Dec 2024 05:20:07 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f05fd7csm175668166b.172.2024.12.20.05.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 05:20:07 -0800 (PST)
Message-ID: <fb4ddc73-545c-48b6-aefd-fdc83005ec07@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 14:20:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: pd_mapper: Add SM7225 compatible
To: Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241220-pd-mapper-sm7225-v1-1-68f85a87288d@fairphone.com>
 <2ee51e35-da7d-42c6-a868-bd8f8700d617@oss.qualcomm.com>
 <D6GG70FQ29ZB.PEJZ4TE4HWQV@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <D6GG70FQ29ZB.PEJZ4TE4HWQV@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FMdALaoSWWULyI55tcHdLBgF0O6k9Mq2
X-Proofpoint-GUID: FMdALaoSWWULyI55tcHdLBgF0O6k9Mq2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200110

On 20.12.2024 11:15 AM, Luca Weiss wrote:
> On Fri Dec 20, 2024 at 10:39 AM CET, Konrad Dybcio wrote:
>> On 20.12.2024 9:39 AM, Luca Weiss wrote:
>>> The Qualcomm SM7225 is practically identical to SM6350, so add an entry
>>> using that data.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>
>> I think we should instead add the fallback compatible, like
>>
>> - enum:
>>       - asdf,asdf
>> - const: qcom,sm7225
>> - const: qcom,sm6350
>>
>> as we've done for speedbin/rename variants of SoCs lately, with separate
>> entries being added for "actually different" sillicon.
> 
> We also have currently for example sm7325=sc7280=qcm6490, would that
> fall into this category as well for you, or are they more different?
> 
> But do you think it's worth trying to also change existing platforms
> like that? We also have basically the same list in
> drivers/cpufreq/cpufreq-dt-platdev.c where we have both sm6350 and
> sm7225 right now.

Hm, with existing boards, I guess that's a question for dt-bindings folks

Konrad

