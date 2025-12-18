Return-Path: <linux-arm-msm+bounces-85683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEEDCCBB90
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 13:06:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 553E2301B62E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 12:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3360232E694;
	Thu, 18 Dec 2025 12:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EKl86Ush";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c41JSnEv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1C826F28F
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 12:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766059612; cv=none; b=LZvQ/diYMFeTDcJXncj7pXhwHgxmyEVoFhwgfv3WZgcLHXb5pNE31w2T6gVm+jn1V4mKInDQtHc3jiiWhzcjjg7L77eAn0oNl+MhXI5RtUv7zTdcFzNFg6q27caLje3m48Aos47JZCs9s3x/I4xVCpr1aMdF+dLWFruv4NXAeRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766059612; c=relaxed/simple;
	bh=XUQCtdy56jkLeN6CjpmFNuiQWWwM5ULplRmS1emubf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RMy88xBmN0umrZxo+wVgWq/sb7fNz7H/GrXIkiX6D9pLCJvIlLpR7wDIFfMOsoRXROYopbtiqOjnVoJIooJrwY/8btyTh6FP1htn/+soCkQ1twHr8rIdyqerQgZ06TBJYu2n6vKsqWWcCY9eXhcSrOjUPVSRzGTAoOtZuPcWscU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EKl86Ush; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c41JSnEv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI8rOHG3447759
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 12:06:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tZnUSUtwe2m6/hm5+PNmIW5JMIFSGKcxs4eESP2A6y4=; b=EKl86Ush7TKUOEgq
	831rDXftpYGxQKfCpMm5QhAzeTCqmdCiC+gzBoiWWOz+w3UMx7RIJj/OsqkgzuVd
	grc2v5dnLO0fRYd9Vgjd6I82fTp1p7B4zRpf7bFOvWwdNtCyKntSGYTwoaet5Og7
	Cf1u69vGNdHkzQs5FTe5fPkHykHVxyu5hlQonZNQMshGLoVn+TxuTyOuEfz6XmmA
	z2X6Qf5ggTNd02v1pt+NeP0bRWP3NcOf4y7UtWM8U0m5+G6X0pstqERy1MhP/zyd
	YcpZoj4lecOQgFJ9hzSwntDc2P9eh10Ode7zmYn2u94bee3i8oUnk74Sij5qONVe
	4INH8Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4egb8pv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 12:06:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f34b9ab702so1124261cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 04:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766059608; x=1766664408; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tZnUSUtwe2m6/hm5+PNmIW5JMIFSGKcxs4eESP2A6y4=;
        b=c41JSnEvubJEsKQUdqzSe2cXTYovNszy6DXzZUHfY+oP76dlyeoPYDkagTzxrA5R/d
         wnO5SY0A+hWet7Svf+/0lZUpjB1ZYOzqJwHwTqii/uqppsnV7Jv4JSQhcCv8Am96MgLG
         yRdQUsWymp2sM2EFwQoi5hk8cLWbMudvWcHd1JEqjtO9IWg13K4VVNu3pu8E5xu8FxFu
         4FhgjpM2BwWdWbIl6tbIpLjZJ4WoRX4x6mRR8CzZpGhdiQ8os4/LHN99Yu9k6MD+wxtN
         dRWzBZUxHl5iG6AF/xVh1I8yhaqa5WZC8oskrZ3XDDwL1cGd9CoElFGbbC7KeHFPoarF
         dF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766059608; x=1766664408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tZnUSUtwe2m6/hm5+PNmIW5JMIFSGKcxs4eESP2A6y4=;
        b=Dwuhvsae/sK7owLX4Qdzd0bsBJDg/Zd2h4ChCOiF59x7RDAE/+qHzBZ3EO+FZiWhP3
         OchVHyWACi82ZqdJ7WzfiWrUVQMN5cK+L0dZo4yz/Oe8sASu54jXfnYF4wmjZ6/iNYgK
         epZ1pVm4XgKqyCb6ewqhA0rlB5bWv3u7nM/rC/pVp4fmTQmXLMXF+Y3vNigj1uUGjGav
         6PDoxN7sXKUk0dPoiieobc9f7lt4RQf5yjFKTyWrLqx6NBv/lDvV85F4GXEfPPpX/pV/
         s8P8kWZU2fHMS5mqr76bjQaXy4qNVNUyE1Mkp9KExw12UMPvuMHJDVTKSY/SXiKeIVlQ
         WhoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQnlWGitYdxr1Vp8vZbkTX00RZZvJrefE3F3JsqZBoT88tatqRNt1QYiDGqDkBJYJCRc+4mT63eGzPQ/Pp@vger.kernel.org
X-Gm-Message-State: AOJu0YzMYxnr7kS9G8zBYdjA7wbkQTsr62535h0XQnvC6Qxe6F2jYpNA
	V3DCP5jIM0iOzoyTiC0TAFs/l5Me81KgFNVFYAiVAq+4hdsGCzTUA4CLiARWuXVuI2xbsHINuKY
	d03jO3du4Z/wirWQ16+CKoL9KR57hlt8Z9+b69Zpcoxx+d0HuwqJ7/Fs/bAQGVJHfe8g4
X-Gm-Gg: AY/fxX5XVW69bxAoc4TMXrJMhkZUgVlGqsORlJ37YujA8e72qLef37bMLM0mn4MviCx
	OPihB+DG9vWlar1gQ0TDYUasbMCct0/WM7vSSKseaCtjNNgRXCia6+8qiSceMUflHX0xT5/o2Ly
	bsgVCYUpkFzFHw5BpT8W3HqjLQxdOGd7e2+ToCm/soYRcJ/SYOTbd0KdztzXPxN8V7N3sCEZ0On
	gU1EraQ2U0l7qaAuASY9bs0TGkuJKaDfonTRdVxWnGA+NYaP+1bscyHEEmgS0oLt4IOhZ4hYYh6
	YlTHDdjwHEZhfEYhGZ2n5VdDM7lGsVEBI3jLneqUklvi5dBymS7+DllM+kv97z2m3Cu+NcclCWy
	FgVfNkwOevuJRlxfEO8/0z9HoCfNtZz3qPjuFELxbDb/kfCDe7Jw9NGOIkxhYv16y3w==
X-Received: by 2002:ac8:5d07:0:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4f3610c2804mr17836221cf.4.1766059607883;
        Thu, 18 Dec 2025 04:06:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEF+09EZkGiN7a1LxeerZG2n1/FnP21wZ/oFt4W9TqyZh08+f+1E8eRBAr3bsry0SLvh5dWfA==
X-Received: by 2002:ac8:5d07:0:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4f3610c2804mr17835451cf.4.1766059607252;
        Thu, 18 Dec 2025 04:06:47 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80234a2ee4sm208657266b.57.2025.12.18.04.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 04:06:46 -0800 (PST)
Message-ID: <ba257b17-b026-4a12-aa3e-dab66a7aeaba@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 13:06:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 0/5] iommu/arm-smmu: introduction of ACTLR
 implementation for Qualcomm SoCs
To: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Enric Balletbo i Serra <eballetb@redhat.com>
Cc: robdclark@gmail.com, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org,
        krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
        dmitry.baryshkov@linaro.org, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Eric Chanudet <echanude@redhat.com>
References: <20241212151402.159102-1-quic_bibekkum@quicinc.com>
 <CALE0LRupg93WsBVc62Lqt-T9qmK5MdEYoScxyP7=ttKJYXAsUA@mail.gmail.com>
 <33826089-54b5-47bc-8a5b-6004c7a276b8@oss.qualcomm.com>
 <5a1aaf4a-c5d5-42e1-9044-d12a6c231904@oss.qualcomm.com>
 <1db3d7f5-0cdf-449c-bbc3-dc40c89ab27f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1db3d7f5-0cdf-449c-bbc3-dc40c89ab27f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEwMCBTYWx0ZWRfXyHh7AbzEv8ex
 Ocv8bYEltyrOYyDQ7i0vqBPs7uZPmdqfoWBDkR/Dt0LGR99y+Iu65Zt0EAmYMORQGx5a0X8mEhZ
 LBmJiClHYQ7YHH7+LiPub0nKMI3ZToEP2KGw2Rmmo1Am2wi8tnl3Lu/DqPdFWnmXJrCfJK2hY2W
 RmEAt1UqAS9ybWQHc7778POV919IIUHOOX/FL6F0mQ1E0P0lMveRcQEXkGW257+2JF7qspiqJKD
 zpcc2ogUEVOCoefX7qlLgprmvkjronILnRYSP8zZINKQatDn79Bc/MyM0ALlJvpBc1xz835TMeh
 PyhurLF6ZC/aEvFCK1fMChSrFtlvBtwAssip7dgTI7Ju2Gig2NuoE4yJ0aX8fvCmErjMYSuIjdj
 4Uv7JFBd6OHJYgMNQhIGo+lwUL0PLw==
X-Authority-Analysis: v=2.4 cv=M9tA6iws c=1 sm=1 tr=0 ts=6943ee59 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=GtmQsnjonZUfJvkuU48A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Ja7q05IUbP2VOaVf5G9lg4qVHQu8VzCh
X-Proofpoint-ORIG-GUID: Ja7q05IUbP2VOaVf5G9lg4qVHQu8VzCh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180100

On 11/13/25 2:55 PM, Charan Teja Kalla wrote:
> 
> 
> On 11/12/2025 7:04 PM, Konrad Dybcio wrote:
>>> Hi Eric,
>>>
>>> If a device has multiple SIDs, all serving the same functionality and grouped under the same "iommus" field, for example:
>>>
>>> iommus = <&apps_smmu, 0x2141, 0x0>,
>>>           <&apps_smmu, 0x25c1, 0x0>,
>>>           <&apps_smmu, 0x2161, 0x0>;
>>>
>>> In this case, all the SIDs will be associated with the same context bank. Even if the three SIDs have different ACTLR settings, since SMMU_CB_ACTLR is per CB setting, all SIDs attached to that bank will share the same ACTLR configuration. This is why we designed it to be "per device / per compatible".
>> Does that suggest the settings may be slightly suboptimal?

I don't understand your question

> Or it is limitation to use the ACTLR?
> 
>> There's some work being done to allow more granular association of
>> the passed SIDs:
>>
>> https://lore.kernel.org/linux-arm-msm/20250928171718.436440-1-
>> charan.kalla@oss.qualcomm.com/
> Sorry, I am unable to link this limitation for actlr setting with the
> work. Can you elaborate please?

Because your email client is misconfigured and it broke the line.. If
it's thunderbird, pretty sure we have a "change these configs" type
section on go/upstream, please take a look

> IIUC, unless the SIDs are totally separated per actlr settings and
> attached to CB(which are limited), this can't be achieved...but may be a
> question here to check is it really a __valid__ to associate a different
> actlr settings SID to use the same CB?

The last question you asked is certainly a valid one

But I was wondering if iommu-map could be useful to resolve this, where
we choose an abstract set of function IDs and then handle the IOMMU
configuration manually, based on the func_id-delimited sets:

iommu-map = <FUNC_ID0 &iommu_phandle CELL0 ... CELLN-1>,
	    <FUNC_ID0 &iommu_phandle CELL0 ... CELLN-1>,
	    <FUNC_ID1 &iommu_phandle CELL0 ... CELLN-1>,
	    <FUNC_ID2 &iommu_phandle CELL0 ... CELLN-1>;

But perhaps that's more useful from the driver-that-handles-the-device
perspective

Konrad

