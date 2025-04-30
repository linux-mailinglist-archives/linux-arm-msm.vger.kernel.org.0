Return-Path: <linux-arm-msm+bounces-56293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4923CAA4D16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 15:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67FB21BA17B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 13:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10CB625D1FF;
	Wed, 30 Apr 2025 13:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TdPTRbew"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2F125A2B0
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 13:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018589; cv=none; b=UeKftT6tAb801P2Xjb1kp2MdKXTMm3QPuBL2bXje5G4LaV9LbgVXDwdobhtNpkLmzbxQdZBAUv3FpdbHlZFxr+co4eVsXWn8kTAyzFVR9PtaztkdIkGpcfov/ztxDCfeLwWwD3vbjCEMTLUTHE7YnYBmlhj4KbWYqxyWxnnF8L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018589; c=relaxed/simple;
	bh=nV185XwheoKL1ckDAuc6YrAB/FExadH5PepDm4c2j8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=poZlphTFDuskTziNB8qz9r7KTCya1mTZZ/MGbI9jZipu6lVPRwrfjBxRFeaS4hOAvGRfrUTcW1rWAktIPe6Zyo8zDzZMmpEQJw3Whg00RIDcwADwYCD4D4IV0h6qqV/ioPLQER6oZ8E2flR9lQOl3tRonVwiASeU7EAafBQ4/bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TdPTRbew; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9RV8P001219
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 13:09:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vRMOzQ1+a8EQloSooTZ1VPQWAuenrRDcnTPBGwn0XDk=; b=TdPTRbewAN+TNHGe
	NxnkUu8cl0q+5/I3KAw4TNDDFaIwyp6ja6iYQjo/dcbF7M2ZgapbqAw/H5dyN3iI
	VQex1vfjt+ogLMbv9q7yyFrTPbRhIOvSiDB5kQP1kE4mWkIIp/geLeT7Ifbc7VG0
	wLIgT07RMsu9I/+9m/bO76jk3zYPrSC3ONZd9EmtdmiKvogGZpDMvG+UORF+sxQw
	XnZM+IoXtcz+vduJPvPN5ckLfWNxX1k78wy28emvabbeMxJ7mNxmJrjrGRaaLiwV
	0l4xRDGklngle0GNSdXfGPJie1Q5hIImVQN7cry34YwqVA8D5SJysTQ3QFH/Ro/V
	iE0zhA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u9t7pf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 13:09:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5af539464so126847885a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 06:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018585; x=1746623385;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vRMOzQ1+a8EQloSooTZ1VPQWAuenrRDcnTPBGwn0XDk=;
        b=HcH6cebYQmEJeRgRlIVsvdI8cc5Yu4+Xlz0nvMWLOsbA/U/d8FKkNBrj7SHr/2O12J
         ojzSL7so3ZkU8oOZ7xp/ax0nwt/0mkT43KnVqUrCHdPGwxOjugNmCwehOm2v+sTa/aO8
         vZ6JAOV5iUp5wbNiC0lETpq5iW9yXNFwwdX+Pwalfmf5SiucFSEg3FOyEawXC52rs48q
         br1r9UNZog2fuSmPg4ReaSC+3AeQj+jREfurtyZ67Z8Ga8Ceflc0PzH9dQ+S31sEjy8v
         fidqApkUr/gkF8fanofrDp5rR3+QPhsXqkkx4S5ypHcn4h5hdRB4vY+QSjUuty/GEJmu
         yEVw==
X-Forwarded-Encrypted: i=1; AJvYcCV4I97ji1lYPTks8FTGWJua60pqC2Gaxb+VXT0fO00SRcYQ1Q3WQvUgiCSni97WbCVdNZbbMyHHARgAzV0J@vger.kernel.org
X-Gm-Message-State: AOJu0YyTAh7ja9i+LHdspceKyocNTL/0mI84tcWO1dL80pKVZc2j3UeH
	51neUxVztZxypPbZWAEoNY40753Tmwel2UMSkcwg0kTOJz3oOE3TtaYNKmIp7BclvmzqyJ8GKmh
	OnMjnJC/6141IQfxdxKEvLgYfwJ/hpJqcHUeePH94b09IlNyARNOlj9RpT8d7YEvK
X-Gm-Gg: ASbGncva1hp9H6PKX+QJHW/w28L0jQl2AdftkxA//EbB9Tdh4cfMYuod1VC3yRZKs1e
	UQ6xKvbpScBjREj9j9RalcWXUjyV1zDiPNHJlB0pFolzRDh+r1fDkILJF3A81rKbZ+/5RrhrHZj
	DY8Rgp0mf4gSztBK2aVVCeuJFq4Tnl34f+yXDpNjKBxyJC1kH1+GeB9qqXDSApnmEwUrr8rsJ0P
	3R2oT/PWN/N/BFE05b/r+tHcvT9vTnLPsg8q/uP6T509ha4ktRp31N3lai3Mx+O+/1IMbPtPljN
	tG7ZXbWEeO7kv/0e9+Vj4syHNeCckcI6zuQKtS3qYwILmO0+9/T0h/qfvdffgTksYxY=
X-Received: by 2002:a05:620a:4494:b0:7c0:af16:b4a8 with SMTP id af79cd13be357-7cacc172af5mr26594085a.3.1746018584840;
        Wed, 30 Apr 2025 06:09:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO097WTrfuIxU7CNWA83CThbCdCAbQ6J4gL7u3jo8Kby/5gjdIscRtpOeE3Q1bQkyisdevfw==
X-Received: by 2002:a05:620a:4494:b0:7c0:af16:b4a8 with SMTP id af79cd13be357-7cacc172af5mr26591185a.3.1746018584214;
        Wed, 30 Apr 2025 06:09:44 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4cd79dsm920573466b.38.2025.04.30.06.09.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 06:09:43 -0700 (PDT)
Message-ID: <98a4ad20-c141-4280-801e-015dafd1fb39@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 15:09:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v6 2/5] drm/msm/adreno: Add speedbin data for SM8550 /
 A740
To: neil.armstrong@linaro.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
 <20250430-topic-smem_speedbin_respin-v6-2-954ff66061cf@oss.qualcomm.com>
 <13cd20c6-f758-45ff-82d1-4fd663d1698c@linaro.org>
 <886d979d-c513-4ab8-829e-4a885953079a@oss.qualcomm.com>
 <b838f9bd-0537-4f8d-b24b-d96700d566c8@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b838f9bd-0537-4f8d-b24b-d96700d566c8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UPeSwWKPKITviM9FhNLXGoyYixpZLXTG
X-Proofpoint-ORIG-GUID: UPeSwWKPKITviM9FhNLXGoyYixpZLXTG
X-Authority-Analysis: v=2.4 cv=UZZRSLSN c=1 sm=1 tr=0 ts=68122119 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=aak9J4RPMLM6hOP-xocA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA5NCBTYWx0ZWRfX6Xq7mn+bcTOw iKG+rC9D9wbBqL4n0ZAE/9tNlw8wOknFoXHBhnAACTsskHkrzJKCSRFKJ405wD/FcaOy/J4XL68 pdZRlWQC6aejWnLN1p34PyLsRsWKBOeMNjeNQVW7xPQAxngqHDPfAFCu/F3Q+vgOjxDFMKvSs+p
 TwIzZfjHDYtpDa3nZ59RK5h5Tll6TRWEyMnfDN2BhJfRc30aWVvZGJgtQeORar+0MxmV3YPcqlA GBRx4G8x+AyJaYde+BJIh6OnGVM5RDInqMB9vgEpMueTn2LUX5dbGQ4WHImfNBVj+KcfTkTrssO nXklVdcpyAXpaucrup2KzkVntDQ7IBFuAhtMsxLyOn2zM4qfDXCq5wKsMJ53rmvrnyQ6bFFvmaG
 +SmIEwfWw/zdae8OKcRL1OPcNICDwUrgFQRHoE/HriCVu9BvQmrud+ceaQ2YmmaofJMzzKfv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300094

On 4/30/25 2:49 PM, neil.armstrong@linaro.org wrote:
> On 30/04/2025 14:35, Konrad Dybcio wrote:
>> On 4/30/25 2:26 PM, neil.armstrong@linaro.org wrote:
>>> Hi,
>>>
>>> On 30/04/2025 13:34, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>
>>>> Add speebin data for A740, as found on SM8550 and derivative SoCs.
>>>>
>>>> For non-development SoCs it seems that "everything except FC_AC, FC_AF
>>>> should be speedbin 1", but what the values are for said "everything" are
>>>> not known, so that's an exercise left to the user..
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
>>>>    drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 8 ++++++++
>>>>    1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> index 53e2ff4406d8f0afe474aaafbf0e459ef8f4577d..61daa331567925e529deae5e25d6fb63a8ba8375 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> @@ -11,6 +11,9 @@
>>>>    #include "a6xx.xml.h"
>>>>    #include "a6xx_gmu.xml.h"
>>>>    +#include <linux/soc/qcom/smem.h>
>>>> +#include <linux/soc/qcom/socinfo.h>
>>>> +
>>>>    static const struct adreno_reglist a612_hwcg[] = {
>>>>        {REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
>>>>        {REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
>>>> @@ -1431,6 +1434,11 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>            },
>>>>            .address_space_size = SZ_16G,
>>>>            .preempt_record_size = 4192 * SZ_1K,
>>>> +        .speedbins = ADRENO_SPEEDBINS(
>>>> +            { ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
>>>> +            { ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
>>>> +            /* Other feature codes (on prod SoCs) should match to speedbin 1 */
>>>
>>> I'm trying to understand this sentence. because reading patch 4, when there's no match
>>> devm_pm_opp_set_supported_hw() is simply never called so how can it match speedbin 1 ?
>>
>> What I'm saying is that all other entries that happen to be possibly
>> added down the line are expected to be speedbin 1 (i.e. BIT(1))
>>
>>> Before this change the fallback was speedbin = BIT(0), but this disappeared.
>>
>> No, the default was to allow speedbin mask ~(0U)
> 
> Hmm no:
> 
>     supp_hw = fuse_to_supp_hw(info, speedbin);
> 
>     if (supp_hw == UINT_MAX) {
>         DRM_DEV_ERROR(dev,
>             "missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",
>             speedbin);
>         supp_hw = BIT(0); /* Default */
>     }
> 
>     ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
>     if (ret)
>         return ret;

Right, that's my own code even..

in any case, the kernel can't know about the speed bins that aren't
defined and here we only define bin0, which doesn't break things

the kernel isn't aware about hw with bin1 with or without this change
so it effectively doesn't matter

Konrad

