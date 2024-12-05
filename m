Return-Path: <linux-arm-msm+bounces-40460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BE49E50B0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 10:07:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 458B616273B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 09:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF401D54F4;
	Thu,  5 Dec 2024 09:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pd3ksXdW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1C61DE8AC;
	Thu,  5 Dec 2024 09:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733389483; cv=none; b=SD8xQGoB5Po1KZaA1sSFu2Lg8+a+h9zTyXSGfHRXnGwhF+mYMJ7ahGZsB56n3ZhyyfVj0OoYf4x+PQNdgnFaTh9TU4s+fPvaRvrJCXT9ce6+20yCsEUBMIZZJiL05ysNzfzLbMW8M3mw5U3IUV1BEq2d7dandPjcfvmKt7h65Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733389483; c=relaxed/simple;
	bh=kgBANOzb+Cgsph6petpYIaTtoNr7Xq3+VWt9lJcVBzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XPx/Bwx+sWqsntPmTEIggWdY+QJmlbq8FI3VkaaP5S32Rr6ve6poLbYp2drx6iQJ2bjQ0wQxx+YgufOVU05VanBvZob7/Hv2IQB76Vv57F3lFRhoDFPUC+3UyDVm/SkS8WKeC7GBX5UNPA+7EskD5wv7lBrEjc9//+2NoTbbfss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pd3ksXdW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B55uG46032002;
	Thu, 5 Dec 2024 09:04:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vt9LxIX51h8QvjMIh+Xq/Wsh+7C5FCdnQRgiUjwuqtc=; b=pd3ksXdWpBHUkloq
	5p3QOy0KwlG8n/Ovit9wQStZsCN1LxKzLg9Ll1m6Yf3up1FCEFl5X2C9lLwALTst
	nq6QUf6mFKCq8ONURn+KV5Ej2JfjLvYSpgeMQQ5Sz30XWurM+s8yvOxWXW2BhGK6
	o2W7U7fnxrlsYSgR2t/3yxkAPcNVf5Ybb86c0B+3AvFQFkRYI7YqQdoPFITcnO/M
	P0dshz2t7Xc+41LJxKTzJ17ir79A+Bg5ak9fsBhRB9KSV+tqFBUT9MEonWLcjrKw
	cAN4gAc5nCJV1Qe7Z3zAuu0UuO9LjdvAnTE+NjVf8kQ+przwaqxTxgloq74ZF7hy
	xE0chw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43a3fawvca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 09:04:23 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B594N7F002266
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 09:04:23 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 01:04:17 -0800
Message-ID: <d1964ab8-ddcc-4e15-9c34-7a62a959037c@quicinc.com>
Date: Thu, 5 Dec 2024 17:04:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/msm: mdss: Add QCS8300 support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Ritesh Kumar <quic_riteshk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <20241127-mdss_qcs8300-v1-3-29b2c3ee95b8@quicinc.com>
 <nllulh3vskl3hm3hvjux4khxtanqj7cpoytodwkzphwn4ajmo7@g46rgnhp637b>
 <4b4a7609-0d9e-4b52-9193-a79583419902@quicinc.com>
 <CAA8EJprGLfa2H1VMAG7uYJOEUyf9aMbC9-V6Q_J-pDz4pGV1yQ@mail.gmail.com>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <CAA8EJprGLfa2H1VMAG7uYJOEUyf9aMbC9-V6Q_J-pDz4pGV1yQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GmlTl1JdR3r7VzviQjG7DZSxaXhWi2in
X-Proofpoint-GUID: GmlTl1JdR3r7VzviQjG7DZSxaXhWi2in
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050064



On 2024/11/29 21:37, Dmitry Baryshkov wrote:
> On Fri, 29 Nov 2024 at 11:56, Yongxing Mou <quic_yongmou@quicinc.com> wrote:
>>
>>
>>
>> On 2024/11/27 21:46, Dmitry Baryshkov wrote:
>>> On Wed, Nov 27, 2024 at 03:05:03PM +0800, Yongxing Mou wrote:
>>>> Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.
>>>
>>> Please mention, why do you need it at all. I see that the UBWC swizzle
>>> and HBB settings are different. Is this really the case? Is it because
>>> of the different memory being used on those platforms?
>>>
>> Thanks, will modify the comment to add more information .QCS8300 UBWC
>> setting is quite different with SA8775P,it use different memory,so their
>> recommended configurations are not quite the same.this is really setting.
> 
> We had several cases where the platform should be using different HBB
> if it uses different memory type. Is that the case here? If so, rather
> than adding another compat entry please extend the msm_mdss to read
> memory type and select HBB based on that. This will also fix several
> TODO items in the driver.
> 
> As a side note, I see that your config has different ubwc_swizzle. If
> that's actually different, then maybe you are right and there should
> be a separate entry.
> 
yes,ubwc_swizzle is also different with sa8775p for there recommended 
setting are different.
>>>>
>>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
>>>>    1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
>>>> index b7bd899ead44bf86998e7295bccb31a334fa6811..90d8fe469d3134ec73f386153509ac257d75930a 100644
>>>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>>>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>>>> @@ -568,6 +568,16 @@ static const struct msm_mdss_data qcm2290_data = {
>>>>       .reg_bus_bw = 76800,
>>>>    };
>>>>
>>>> +static const struct msm_mdss_data qcs8300_data = {
>>>> +    .ubwc_enc_version = UBWC_4_0,
>>>> +    .ubwc_dec_version = UBWC_4_0,
>>>> +    .ubwc_swizzle = 6,
>>>> +    .ubwc_static = 1,
>>>> +    .highest_bank_bit = 3,
>>>> +    .macrotile_mode = 1,
>>>> +    .reg_bus_bw = 74000,
>>>> +};
>>>> +
>>>>    static const struct msm_mdss_data sa8775p_data = {
>>>>       .ubwc_enc_version = UBWC_4_0,
>>>>       .ubwc_dec_version = UBWC_4_0,
>>>> @@ -715,6 +725,7 @@ static const struct of_device_id mdss_dt_match[] = {
>>>>       { .compatible = "qcom,mdss" },
>>>>       { .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
>>>>       { .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
>>>> +    { .compatible = "qcom,qcs8300-mdss", .data = &qcs8300_data },
>>>>       { .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
>>>>       { .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
>>>>       { .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>>
>>
> 
> 


