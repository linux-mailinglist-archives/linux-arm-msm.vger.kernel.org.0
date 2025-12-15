Return-Path: <linux-arm-msm+bounces-85254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCE9CBDF46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 14:10:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4D5330495BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 13:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6AFD28C864;
	Mon, 15 Dec 2025 13:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y9FvoFQd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MORJTOyU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2C6286A9
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 13:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765803664; cv=none; b=CsEzbL7I3HUCurSRQ3mxIHaIFTSV594+zcBlaUurdrPUe8ldxvgbMcUzBmO+QQ+f8we2GwXXiKZpApiYaoQc6uGljXEP530VpSRfOF5tEqNzLJaxrB+dtBqcIPBf9Gie9+aS6QjLtAw/XAnHUBesx57QeozIhiK3QcVMoiNwRXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765803664; c=relaxed/simple;
	bh=bGeFX1PHslKb/I6pp2SZh4itUTZljDjY9CVtNtdVlOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FASVjXBikwZqrUKDRkihGoP9LngSKWTetlTperZBMeHmgjfHXOMXqpuQvI/z55BlDV0oXNYqn097DyDhAo6SezUKpGGHPy4S571rntt28At2qrJgrvaBVCvPEDEfYOmJqpMopr3h6qZPOQzLeP6W3McSKVdZF5hjMnCKI91UFuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y9FvoFQd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MORJTOyU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFANpRs675843
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 13:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eWzLoZ3fbNna6oDTvHfwwszm/4c1bM5VeFkwVbiDZzU=; b=Y9FvoFQd/34/h/6T
	Pthljz6NOcdqHikjysir2IHRMBRSHxuaoftJLndZtTXjOwWI09iy+torM6j18f4i
	iIN9Z+W01shbR6w81z5V0j2Q5FTMR2LQ9daZaoK9A8CbjPdylLC7Xo4cinjor1lF
	nXdTSu0FI4EV1Y3aslTN7JLR4TtpVAhQn+ra+g3lHcNkkljp0PSYFVRE+gC6MnfW
	dkhuTAQvArpdp8b32bz/43DB48ntIF/uZC23NLArNbQjZWhBrpehxopXrtCwtTYn
	GYYBcQHGdPRLsRxtbdSZgTx9O348bKTHAWywByg+fnJSJTct3B7sz3svP2yVMn3T
	svDjQA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11cymk5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 13:00:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f1f69eec6so32835515ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 05:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765803655; x=1766408455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eWzLoZ3fbNna6oDTvHfwwszm/4c1bM5VeFkwVbiDZzU=;
        b=MORJTOyUy1Uv6mGDy9k4ddf1B3ULTVnuWiXCZ4mCLpE23JGR2dhxvWZNNySTT9YB95
         GcUBCC+ejSXZ4nhj8rAK08gUZKv939dmK4UFACkZeQJsrlCrnfbCj/5KGtK8V3UkQ3IB
         ad455EtSVMyvU9czHS2LYvLN7VTylhbfjHW6qkOmJ7/9GUXyep0XeORyTjQA0rl4Htq+
         6r3fC4N4xXlBiSxX949j0o6VogNF9RHaJbRxlbUhHWhqFyfAyh3Oc1tyOa5iL56MFQ1d
         5WMy7QVQunifkAxQROplCER2K+1l2iG5gqHkrZ9dVv0QS9Oeir3mH4URaB9maT76ndTy
         T27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765803655; x=1766408455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eWzLoZ3fbNna6oDTvHfwwszm/4c1bM5VeFkwVbiDZzU=;
        b=FfBnB+aRtIMDhX+g3PkGofbkbj+cP/XWvKj3UEhSPHh8QIkqDmykc8/fTw+jdQryCL
         9sWvuAXanRnF1HBgml1P9rB0NITQg/Vt1oc/uIsZ4sstWRvmAUo5sRDTJRsTVM4gD0Vp
         pjrsqA0OSDKJywsLdKClwUb/yg/L5MAg9GTImMXNtWmYmvf7Tiam1qjtlLQ//tujUBhR
         w+SWXuvRDHsqvJKL7AOPtk3B9qpcq9ydbL/RameHNLgQDenB7liCjYd8/KYEyrujXNG/
         9EYYAMLk/yToHhncjCQG/kIq0Oeo8bHzkckWY+SJlS0FHAmjClj/mIX8IBoJ21H97Xzt
         dyXQ==
X-Gm-Message-State: AOJu0Yzi6hcU/iwRrXDyVKjFaIgYrqQDgSwfmd+udV3ofMKh5xHe5wDQ
	nTe39BCoQ6K9IdLIVVWov1dMuzm3tT0Qj6Z8qANOgjH7HNJIpdWqKJjVBqcY20GGjkkWb57WYAh
	R0q7EqZlPpfxxS1foxDJIqnW1WIngv0c2zvkF2NfqcNvr3t89AS6LdGvcXHNH+yHTg8bf
X-Gm-Gg: AY/fxX6ETLLbf8j4unvysvxTlL/WcoHbDjZseImcTnckYm4or+/4/BUw7tiwPBwb/mG
	GQ72UV8hsVOyY+dhPvh2KCkvXI6Z3OmcQxBApvBNxHi0ZJRoMqsSK6vd0MpRzowwu6iLowZmTaP
	pyjFRkZ/Z+vaO+uBBhgjV+flT6CRqRmMT+fIMxAse0obr5FEmHghgoAmLAo1DFqrkC1/eT26Iyf
	t8nyxhs6uTzDMo1HBrqsGRrToaJV0PfJTV1f6AfuX7ASaizu1Fj6WX+AqjQrfihDtcLMO8xEBdV
	7zNRw8XvKYBadVVeyWlWQvVpAD8rhhhXB3q513CkIxpPL43zgNzE7+NO4SIbYrlV6WpHiRZzo0/
	CflSM4oDQn8PkRQVjmWB7mL9EpqlvLz/CEBxswgMibbQDv+CEnaepESnckfMhMcq3Res1VXy1B1
	Ly3FM9p+gAbSxr3IRBvSePur7uaVLQXsWs
X-Received: by 2002:a17:903:1988:b0:2a0:ccee:b354 with SMTP id d9443c01a7336-2a0cceebca3mr46641855ad.35.1765803654156;
        Mon, 15 Dec 2025 05:00:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrz1GbG2GulNcHY2p0JDhisa9h4HGD51A2Jm2Vs7BYkvVj/IS8tR0gt8HDA+qn2x76f6/Cbw==
X-Received: by 2002:a17:903:1988:b0:2a0:ccee:b354 with SMTP id d9443c01a7336-2a0cceebca3mr46641205ad.35.1765803653570;
        Mon, 15 Dec 2025 05:00:53 -0800 (PST)
Received: from [10.190.210.122] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea04101esm133447405ad.70.2025.12.15.05.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 05:00:53 -0800 (PST)
Message-ID: <43e48560-2848-4474-b858-a3d15944e2ee@oss.qualcomm.com>
Date: Mon, 15 Dec 2025 18:30:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/2] Add support for Gunyah Watchdog
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20251118-gunyah_watchdog-v8-0-e5de12e2eef5@oss.qualcomm.com>
 <6a8f5d62-f6ea-44b3-9baf-acfbc1e58efe@oss.qualcomm.com>
 <992d46b7-b053-4a9e-ba04-f5653525a891@kernel.org>
Content-Language: en-US
From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
In-Reply-To: <992d46b7-b053-4a9e-ba04-f5653525a891@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDExMiBTYWx0ZWRfX0JEOt32SLXmy
 VtiFztbBJGPWTtWcHKzHHFP6W/S/o01cSSTmcWKvHOeYvP5yiGMIHaSrAuPcklYEwfPkqKWBoep
 lXhlZ24WnT+J0jYZzzpYZi/7Of2Ti3QrO6se60u/6LXo9FEDE03u19pTxw8BFFq+IlJqvjd8sJI
 lHqDjR5cLw5ZsX+Dt5dWN5DMaJjX2DJktQj3Yy4GSWNcg9NrH/B2zSR7/mTJvJ7MANUlaxYwmdt
 Qs5LpmNGpuQP20IsXsm+7mmnGWyts4/aQ2VVI8UYuJI5dic4ABLTOc5Ngsmk6J5QfiQLQSVH2ZO
 cbXgkwiXC+Gb0lqUzJmtdXKSvndlgnkPiJ3SnD/vxwUuzl7dBypXxjoqSMDrIkfcXNV3SGe/Wnt
 QB2shVDFpULEJNUxN5BOY5wbaoLOEg==
X-Proofpoint-GUID: 52iHVaf_mZPdz564tFEdtivNKk24OqZx
X-Authority-Analysis: v=2.4 cv=Afq83nXG c=1 sm=1 tr=0 ts=69400687 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=S4oPqir27zQB1GLfsjsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 52iHVaf_mZPdz564tFEdtivNKk24OqZx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_02,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150112



On 12/2/2025 9:29 PM, Krzysztof Kozlowski wrote:
> On 02/12/2025 12:23, Hrishabh Rajput wrote:
>> Hi Bjorn, Guenter, and Wim,
>>
>> Just a gentle ping on this series.
> 
> It's merge window. There was no point in pinging just before merge
> window and is even worse to ping now. Nothing can happen with this
> patchset and such pings is only noise.
> 

Thanks for the guidance and apologies for the noise created during the 
merge window.

>>
>> Since the patches have received Reviewed-by tags from Dmitry and
>> Guenter, I wanted to confirm the merge strategy.
>>
>> Bjorn: Are you planning to pick the QCOM SCM changes separately through
>> your tree, or would you prefer the whole series go through the Watchdog
>> tree?
>> If the latter, do we need an explicit Acked-by from you for QCOM SCM patch?
> 
> Where did you document dependencies between patches and any non-obvious
> merging? I open cover letter and there is NOTHING. I look at patch
> changelog and also NOTHING.
> 
> So if you tell us nothing, why would we care to think we need to do
> anything special here?
> 
> You must explicitly document every dependency, both external and between
> patches, in the cover letter. At least cover letter, some people (e.g.
> mostly me) don't even read them...
> 

This is a miss from my end. The following information should have been 
the part of the cover letter:
```
This series spans 2 subsystems and is split as follows:
- Patch 1: QCOM SCM - Register Gunyah Watchdog Platform device
- Patch 2: Watchdog - Add Gunyah Watchdog driver

Dependency:
There is no build-time dependency between the patches, but Patch 1 is 
required for Patch 2 to function.

Merge strategies:
- Strategy 1: Take both patches via the Watchdog tree.
- Strategy 2: Take Patch 1 via QCM SCM maintainter's tree, Patch 2 via 
Watchdog tree.

Since the patches concern primarily with the Watchdog, I suggest we go 
ahead with Strategy 1. If this is acceptable, I request an Acked-by from 
QCOM SCM maintainer for Patch 1.
```

I understand that this should have been a part of the cover letter. If 
it helps the process, I can add the above information in the cover 
letter and resend as v9. Since there are no other fixes, v9 would only 
contain the cover letter changes.

Thanks,
Hrishabh

