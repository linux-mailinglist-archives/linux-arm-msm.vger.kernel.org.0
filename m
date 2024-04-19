Return-Path: <linux-arm-msm+bounces-17995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA748AB6B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 23:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33297B21598
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 21:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036832B9B0;
	Fri, 19 Apr 2024 21:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hoGIi07B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714F129D08
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 21:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713563834; cv=none; b=NFmTo+SSaxWRSAUq0CZL1DWyJtUtyjpVjVn7sBUQpWoMFLv56letM98OKagYwGE80WZImPpAk9fsTdW5Q7KSIJdIFj95ph0QG/FBTThUgzTvkySZvn8lnB6LI/gAgAw4Q0+l8yU8vKak++G6S58hp674oj+YC3RtyQvgYwr4+ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713563834; c=relaxed/simple;
	bh=DIBh5ZkgA9Ji4rI2z7dmF6ObZU6vD9+h0ZNP/JXc+OA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aHOQkqkRHV55APEkElGXmmJ/Xy2y1mSUM2rfTsaUKZ5w5h4IHda0FqoDoLwAQebOPcusG/1Hm5DATgbwkZC80dJA/qhp8e8nyFys9KopmKIyiILe11Vqsj0pZbjoD8bM1NHcPqAcEGK68ZvF2tyiUry9UwgKNGeS0fo+8xfaaz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hoGIi07B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43JLmWkW024114;
	Fri, 19 Apr 2024 21:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=ZcDqihkgLQ4NgIY2rXSJFMrv011uA7mgABw9/62h1ms=; b=ho
	GIi07BhDboQDAK+UXrWYSVUk/yKdkNHf+8hm8WfzitKsszapkIAIlfHDXcVWsAiQ
	9ciR/C3CaCPqOdYuHa3CuHsM0PAYcuf6xIpXglD5/O/tV4sfsno0lt1u6542SUE+
	sAUNamlM3ZLt5iKklCK72ROokkfqeK0P0N4TDMe+LCVqPGboKvC/QiCd92kapN7P
	qvzlaIy2hLEaEVcJP3SYSF+b9z2BEGFZd+Qa27IVhGpxrEc81bMpP1Ttaiol5vG3
	uJV1N1nAj/YiuVogHIrje3UKc5k4+3cuHGCki69EvbsQ/2kq9YioK9D0eLqV/Sc/
	IgabNOLNM/p4qiH12lgQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xksuvrxb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 21:57:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43JLv2Fu007956
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 21:57:02 GMT
Received: from [10.110.104.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Apr
 2024 14:57:01 -0700
Message-ID: <c01f00f6-f385-b034-f7fc-a174f770fdb9@quicinc.com>
Date: Fri, 19 Apr 2024 14:57:00 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 04/12] drm/msm: add arrays listing formats supported by
 MDP4/MDP5 hardware
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn
 Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn
 Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
 <20231202214016.1257621-5-dmitry.baryshkov@linaro.org>
 <b4e725ad-19c3-a344-9504-674ae17f7027@quicinc.com>
 <CAA8EJpqGjJSKqggN3KyTTVog7rZx6pjekr=mOcvneKYcG7_Lrg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpqGjJSKqggN3KyTTVog7rZx6pjekr=mOcvneKYcG7_Lrg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _6eEGM9MPu7Z3rMjjWm0k6hqi22BdU6T
X-Proofpoint-ORIG-GUID: _6eEGM9MPu7Z3rMjjWm0k6hqi22BdU6T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_15,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404190170



On 4/19/2024 2:21 PM, Dmitry Baryshkov wrote:
> On Sat, 20 Apr 2024 at 00:06, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
>>> MDP4 and MDP5 drivers enumerate supported formats each time the plane is
>>> created. In preparation to merger of MDP DPU format databases, define
>>> precise formats list, so that changes to the database do not cause the
>>> driver to add unsupported format to the list.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c | 57 ++++++++++++++++++++--
>>>    drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 36 +++++++++++---
>>>    drivers/gpu/drm/msm/disp/mdp_format.c      | 28 -----------
>>>    drivers/gpu/drm/msm/disp/mdp_kms.h         |  1 -
>>>    4 files changed, 80 insertions(+), 42 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
>>> index b689b618da78..cebe20c82a54 100644
>>> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
>>> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
>>> @@ -371,6 +371,47 @@ static const uint64_t supported_format_modifiers[] = {
>>>        DRM_FORMAT_MOD_INVALID
>>>    };
>>>
>>> +const uint32_t mdp4_rgb_formats[] = {
>>> +     DRM_FORMAT_ARGB8888,
>>> +     DRM_FORMAT_ABGR8888,
>>> +     DRM_FORMAT_RGBA8888,
>>> +     DRM_FORMAT_BGRA8888,
>>> +     DRM_FORMAT_XRGB8888,
>>> +     DRM_FORMAT_XBGR8888,
>>> +     DRM_FORMAT_RGBX8888,
>>> +     DRM_FORMAT_BGRX8888,
>>> +     DRM_FORMAT_RGB888,
>>> +     DRM_FORMAT_BGR888,
>>> +     DRM_FORMAT_RGB565,
>>> +     DRM_FORMAT_BGR565,
>>> +};
>>> +
>>> +const uint32_t mdp4_rgb_yuv_formats[] = {
>>> +     DRM_FORMAT_ARGB8888,
>>> +     DRM_FORMAT_ABGR8888,
>>> +     DRM_FORMAT_RGBA8888,
>>> +     DRM_FORMAT_BGRA8888,
>>> +     DRM_FORMAT_XRGB8888,
>>> +     DRM_FORMAT_XBGR8888,
>>> +     DRM_FORMAT_RGBX8888,
>>> +     DRM_FORMAT_BGRX8888,
>>> +     DRM_FORMAT_RGB888,
>>> +     DRM_FORMAT_BGR888,
>>> +     DRM_FORMAT_RGB565,
>>> +     DRM_FORMAT_BGR565,
>>> +
>>> +     DRM_FORMAT_NV12,
>>> +     DRM_FORMAT_NV21,
>>> +     DRM_FORMAT_NV16,
>>> +     DRM_FORMAT_NV61,
>>> +     DRM_FORMAT_VYUY,
>>> +     DRM_FORMAT_UYVY,
>>> +     DRM_FORMAT_YUYV,
>>> +     DRM_FORMAT_YVYU,
>>> +     DRM_FORMAT_YUV420,
>>> +     DRM_FORMAT_YVU420,
>>> +};
>>> +
>>>    /* initialize plane */
>>>    struct drm_plane *mdp4_plane_init(struct drm_device *dev,
>>>                enum mdp4_pipe pipe_id, bool private_plane)
>>> @@ -379,6 +420,8 @@ struct drm_plane *mdp4_plane_init(struct drm_device *dev,
>>>        struct mdp4_plane *mdp4_plane;
>>>        int ret;
>>>        enum drm_plane_type type;
>>> +     const uint32_t *formats;
>>> +     unsigned int nformats;
>>>
>>>        mdp4_plane = kzalloc(sizeof(*mdp4_plane), GFP_KERNEL);
>>>        if (!mdp4_plane) {
>>> @@ -392,13 +435,17 @@ struct drm_plane *mdp4_plane_init(struct drm_device *dev,
>>>        mdp4_plane->name = pipe_names[pipe_id];
>>>        mdp4_plane->caps = mdp4_pipe_caps(pipe_id);
>>>
>>> -     mdp4_plane->nformats = mdp_get_formats(mdp4_plane->formats,
>>> -                     ARRAY_SIZE(mdp4_plane->formats),
>>> -                     !pipe_supports_yuv(mdp4_plane->caps));
>>> -
>>>        type = private_plane ? DRM_PLANE_TYPE_PRIMARY : DRM_PLANE_TYPE_OVERLAY;
>>> +
>>> +     if (pipe_supports_yuv(mdp4_plane->caps)) {
>>> +             formats = mdp4_rgb_yuv_formats;
>>> +             nformats = ARRAY_SIZE(mdp4_rgb_yuv_formats);
>>> +     } else {
>>> +             formats = mdp4_rgb_formats;
>>> +             nformats = ARRAY_SIZE(mdp4_rgb_formats);
>>> +     }
>>>        ret = drm_universal_plane_init(dev, plane, 0xff, &mdp4_plane_funcs,
>>> -                              mdp4_plane->formats, mdp4_plane->nformats,
>>> +                              formats, nformats,
>>>                                 supported_format_modifiers, type, NULL);
>>>        if (ret)
>>>                goto fail;
>>> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
>>> index 0d5ff03cb091..aa8342d93393 100644
>>> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
>>> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
>>> @@ -17,9 +17,6 @@
>>>
>>>    struct mdp5_plane {
>>>        struct drm_plane base;
>>> -
>>> -     uint32_t nformats;
>>> -     uint32_t formats[32];
>>>    };
>>>    #define to_mdp5_plane(x) container_of(x, struct mdp5_plane, base)
>>>
>>> @@ -1007,6 +1004,32 @@ uint32_t mdp5_plane_get_flush(struct drm_plane *plane)
>>>        return mask;
>>>    }
>>>
>>> +const uint32_t mdp5_plane_formats[] = {
>>> +     DRM_FORMAT_ARGB8888,
>>> +     DRM_FORMAT_ABGR8888,
>>> +     DRM_FORMAT_RGBA8888,
>>> +     DRM_FORMAT_BGRA8888,
>>> +     DRM_FORMAT_XRGB8888,
>>> +     DRM_FORMAT_XBGR8888,
>>> +     DRM_FORMAT_RGBX8888,
>>> +     DRM_FORMAT_BGRX8888,
>>> +     DRM_FORMAT_RGB888,
>>> +     DRM_FORMAT_BGR888,
>>> +     DRM_FORMAT_RGB565,
>>> +     DRM_FORMAT_BGR565,
>>> +
>>> +     DRM_FORMAT_NV12,
>>> +     DRM_FORMAT_NV21,
>>> +     DRM_FORMAT_NV16,
>>> +     DRM_FORMAT_NV61,
>>> +     DRM_FORMAT_VYUY,
>>> +     DRM_FORMAT_UYVY,
>>> +     DRM_FORMAT_YUYV,
>>> +     DRM_FORMAT_YVYU,
>>> +     DRM_FORMAT_YUV420,
>>> +     DRM_FORMAT_YVU420,
>>> +};
>>> +
>>>    /* initialize plane */
>>>    struct drm_plane *mdp5_plane_init(struct drm_device *dev,
>>>                                  enum drm_plane_type type)
>>> @@ -1023,12 +1046,9 @@ struct drm_plane *mdp5_plane_init(struct drm_device *dev,
>>>
>>>        plane = &mdp5_plane->base;
>>>
>>> -     mdp5_plane->nformats = mdp_get_formats(mdp5_plane->formats,
>>> -             ARRAY_SIZE(mdp5_plane->formats), false);
>>> -
>>>        ret = drm_universal_plane_init(dev, plane, 0xff, &mdp5_plane_funcs,
>>> -                     mdp5_plane->formats, mdp5_plane->nformats,
>>> -                     NULL, type, NULL);
>>> +                                    mdp5_plane_formats, ARRAY_SIZE(mdp5_plane_formats),
>>> +                                    NULL, type, NULL);
>>>        if (ret)
>>>                goto fail;
>>>
>>
>> Did you accidentally drop checking for YUV format cap before adding the
>> formats for the plane similar to
> 
> No. MDP5 driver asks RGB+YUV planes see the mdp_get_formats() arguments.
> 

Ack.

>>
>>   > +    if (pipe_supports_yuv(mdp4_plane->caps)) {
>>   > +            formats = mdp4_rgb_yuv_formats;
>>   > +            nformats = ARRAY_SIZE(mdp4_rgb_yuv_formats);
>>   > +    } else {
>>   > +            formats = mdp4_rgb_formats;
>>   > +            nformats = ARRAY_SIZE(mdp4_rgb_formats);
>>   > +    }
>>
>>
>> Also, from what I checked the format table is identical between mdp4 and
>> mdp5. Even if we cannot unify mdp4/5 and dpu tables, we can atleast have
>> mdp_4_5_rgb and mdp_4_5_rgb_yuv?
> 
> I'd rather not do that. If we are to change mdp4 or mdp5 planes at
> some point, I don't want to think about the second driver. The amount
> of duplication is minimal compared to the burden of thinking about the
> second driver.
> 

Ok, I dont expect them to change tbh as it has not happened last few 
years now.

Anyway, that part is fine. Hence


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

