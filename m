Return-Path: <linux-arm-msm+bounces-41841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F02F19EFBF1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 19:59:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 057A516C498
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 18:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573981DE3BF;
	Thu, 12 Dec 2024 18:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fvlgoC84"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0F11DE2CD;
	Thu, 12 Dec 2024 18:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734029784; cv=none; b=q3FzTThNfyLMd0q/QenEZ2lfqlVe5V5tiTIt+nb4lmzCVkWy+MVJ2x4d/rv2WxThSM0u86/VDaSwcxGJdxhhwFGPFzzrA9I7m//FnQsNoTWpTbgtGK+UQP1SyXtlG10KeE9liq4+mtKka0WCJlKjLL2Qn2b83L22zxUUeMT6zwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734029784; c=relaxed/simple;
	bh=4+s3U93gbD6zCS777sLuIKF2gbK/vgKXZeAqYaOZfyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GrwOx8wft6xD+sgnqHIuuVWwJK1etYOEv0N0Pp/m5ub8ow++kt9DGo8xnpIGlatdw1Glt2KKl+P7i1bl1P2kX4XSjebmszZ5OXbsH+dFlIL67EyVbcZmOO7zRlEikBjHSg/yzYoVmnLDy3GINtbEzB6XzdRQ5TmrwNPL3KKYA9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fvlgoC84; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCICeHO022791;
	Thu, 12 Dec 2024 18:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eHPUIVDs5n/Gl5GXexFw9AKnGU1HBb2QBrWPPNCrp3s=; b=fvlgoC84WQe/6sjS
	5LEcdEWlaneg66rOQb4kA9Y0H6R5Ml1RPhutlTIPA3tq4kQi6JHEc6W21kbA6c9o
	Zjo2RturTJogtBCZH85vsr0JY7XzpRseZCN33C/i1MYoDDS7QqwaQy/1p18d2FsE
	oCos1dVk1vLwcGDjHDjI2Jpwl0rQDaE67BzFccUQNph3Xe3eA8wrqRg80L18ovtT
	WnUkoXYadwmxvZaT6nfGm8R/xMxjdP2WP7hjPRx0KPXsm2rmB1tveMsvqEL4GFy/
	iuRjt49eh6oipc5JdtUedByikwZ7VTA3mJO0EVbBH5NEvbllXv38o6suqtLqyYJh
	j9ih4g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43g4wn83aw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 18:56:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BCIu8hs026719
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 18:56:08 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Dec
 2024 10:56:07 -0800
Message-ID: <3d7a82d5-3c7f-40dc-a896-daf1e564bdb0@quicinc.com>
Date: Thu, 12 Dec 2024 10:56:06 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/14] drm/msm/dp: drop struct msm_dp_panel_in
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Paloma Arellano <quic_parellan@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
 <20241212-fd-dp-audio-fixup-v3-13-0b1c65e7dba3@linaro.org>
 <3346b2fb-1366-476b-bb52-e42a2170d719@quicinc.com>
 <CAA8EJppthF3aVq0T2FmjLRNySP2pW36QnEXoWt5fFAKh+Nmz5A@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJppthF3aVq0T2FmjLRNySP2pW36QnEXoWt5fFAKh+Nmz5A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sDJnQmMVbzxYWel2XUlylzPKonssNJev
X-Proofpoint-GUID: sDJnQmMVbzxYWel2XUlylzPKonssNJev
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=702 spamscore=0
 mlxscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412120137



On 12/12/2024 12:53 AM, Dmitry Baryshkov wrote:
> On Thu, 12 Dec 2024 at 05:26, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 12/11/2024 3:41 PM, Dmitry Baryshkov wrote:
>>> All other submodules pass arguments directly. Drop struct
>>> msm_dp_panel_in that is used to wrap dp_panel's submodule args and pass
>>> all data to msm_dp_panel_get() directly.
>>>
>>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/dp/dp_display.c |  9 +--------
>>>    drivers/gpu/drm/msm/dp/dp_panel.c   | 15 ++++++++-------
>>>    drivers/gpu/drm/msm/dp/dp_panel.h   | 10 ++--------
>>>    3 files changed, 11 insertions(+), 23 deletions(-)
>>>
>>
>> Change not necessarily tied to catalog cleanup, and can be sent
>> independently IMO.
>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>>> index cb02d5d5b404925707c737ed75e9e83fbec34f83..a2cdcdac042d63a59ff71aefcecb7f8b22f01167 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>> @@ -722,9 +722,6 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
>>>    {
>>>        int rc = 0;
>>>        struct device *dev = &dp->msm_dp_display.pdev->dev;
>>> -     struct msm_dp_panel_in panel_in = {
>>> -             .dev = dev,
>>> -     };
>>>        struct phy *phy;
>>>
>>>        phy = devm_phy_get(dev, "dp");
>>> @@ -765,11 +762,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
>>>                goto error_link;
>>>        }
>>>
>>> -     panel_in.aux = dp->aux;
>>> -     panel_in.catalog = dp->catalog;
>>> -     panel_in.link = dp->link;
>>> -
>>> -     dp->panel = msm_dp_panel_get(&panel_in);
>>> +     dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->catalog);
>>>        if (IS_ERR(dp->panel)) {
>>>                rc = PTR_ERR(dp->panel);
>>>                DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
>>> index 25869e2ac93aba0bffeddae9f95917d81870d8cb..49bbcde8cf60ac1b297310a50191135d79b092fb 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>>> @@ -659,25 +659,26 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
>>>        return 0;
>>>    }
>>>
>>> -struct msm_dp_panel *msm_dp_panel_get(struct msm_dp_panel_in *in)
>>> +struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
>>> +                           struct msm_dp_link *link, struct msm_dp_catalog *catalog)
>>>    {
>>
>> so this API, takes a filled input panel, makes a msm_dp_panel out of it
>> by filling out more information on top of what was already passed in and
>> returns a msm_dp_panel.
>>
>> So IOW, converts a msm_dp_panel_in to msm_dp_panel.
>>
>> What is the gain by passing individual params rather than passing them
>> as a struct instead? Isnt it better to have it within that struct to
>> show the conversion and moreover we dont have to pass in 4 arguments
>> instead of 1.
> 
> We gain uniformity. All other modules use params. And, as pointed out
> by Maxime during HDMI Codec reviews, it's easier to handle function
> params - it makes it more obvious that one of the params got missing.
> 

Point noted but a very long param list also makes it harder to manage. 
So we should really evaluate on a case-by-case basis and not generalize 
here.

Here its only 4, so i would say its kindof okay. If it goes beyond it, 
then msm_dp_panel_in is probably going to come back.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

