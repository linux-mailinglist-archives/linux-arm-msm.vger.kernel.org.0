Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C74CF7CB781
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Oct 2023 02:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233549AbjJQAlt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Oct 2023 20:41:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232873AbjJQAls (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Oct 2023 20:41:48 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79B1092;
        Mon, 16 Oct 2023 17:41:46 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39GNGRQ0025543;
        Tue, 17 Oct 2023 00:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=3RET9ouFZUaeggz8kqSdC+fqV+R0n5+qMpj00eTouGk=;
 b=Mzi8EbDMxdZB4cziLAYPd2P2sk9TUdUjjvY++X6gESyr1KwcGsQoxzGKjaSdxW+UwMnH
 2if4/kOnl8sBbK8NMdWQoRiy4DGkvZbz5CaJWvd0M1wPISo8QhIR0qrTC0499YbTAd8l
 drgKnVvGaM3xFgX+jd0MrKz/AE5TJar2S2+uBStl+Kehrqep79PyVh8Vp3o6A0L7BfTs
 fHA6KQo5tksQtyF7SfxBy+JgCbjl0jHV2VrDRAG7DubkfifRXlIQao6LMwJdm8/Iz0wS
 zQsiQUfGkDjv/o2izuJwJ8/6bliFHMP2thUkIJpcC28lzelfeM2c8D6qDeoRLrOEjEgX RQ== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ts9jnrw6r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 17 Oct 2023 00:41:08 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39H0f7JM010862
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 17 Oct 2023 00:41:07 GMT
Received: from [10.71.110.254] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 16 Oct
 2023 17:41:07 -0700
Message-ID: <26585954-7c86-45fd-9190-f1109cbe9901@quicinc.com>
Date:   Mon, 16 Oct 2023 17:40:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Freedreno] [PATCH RFC v6 07/10] drm/atomic: Loosen FB atomic
 checks
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Pekka Paalanen <ppaalanen@gmail.com>
CC:     <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
        <sebastian.wick@redhat.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Sean Paul" <sean@poorly.run>, <dri-devel@lists.freedesktop.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        <quic_abhinavk@quicinc.com>, "Maxime Ripard" <mripard@kernel.org>,
        <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
        <laurent.pinchart@ideasonboard.com>,
        Daniel Vetter <daniel@ffwll.ch>, <contact@emersion.fr>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        <wayland-devel@lists.freedesktop.org>,
        "David Airlie" <airlied@gmail.com>, <ville.syrjala@linux.intel.com>
References: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
 <20230828-solid-fill-v6-7-a820efcce852@quicinc.com>
 <20230829112230.7106a8bf@eldfell>
 <752176d8-23f4-4689-8bf4-db27f153fd39@quicinc.com>
 <6851b864-447f-453f-8b34-1fbb6e97eefe@linaro.org>
Content-Language: en-US
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <6851b864-447f-453f-8b34-1fbb6e97eefe@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QCU-Aw43O5SjvcqtE6It-mLC6vcuM1Uj
X-Proofpoint-ORIG-GUID: QCU-Aw43O5SjvcqtE6It-mLC6vcuM1Uj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-16_13,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxscore=0 clxscore=1011 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310170003
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/24/2023 3:23 AM, Dmitry Baryshkov wrote:
> On 22/09/2023 20:49, Jessica Zhang wrote:
>>
>>
>> On 8/29/2023 1:22 AM, Pekka Paalanen wrote:
>>> On Mon, 28 Aug 2023 17:05:13 -0700
>>> Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>>
>>>> Loosen the requirements for atomic and legacy commit so that, in cases
>>>> where pixel_source != FB, the commit can still go through.
>>>>
>>>> This includes adding framebuffer NULL checks in other areas to 
>>>> account for
>>>> FB being NULL when non-FB pixel sources are enabled.
>>>>
>>>> To disable a plane, the pixel_source must be NONE or the FB must be 
>>>> NULL
>>>> if pixel_source == FB.
>>>>
>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>> ---
>>>>   drivers/gpu/drm/drm_atomic.c        | 20 +++++++++++---------
>>>>   drivers/gpu/drm/drm_atomic_helper.c | 36 
>>>> ++++++++++++++++++++----------------
>>>>   include/drm/drm_atomic_helper.h     |  4 ++--
>>>>   include/drm/drm_plane.h             | 29 
>>>> +++++++++++++++++++++++++++++
>>>>   4 files changed, 62 insertions(+), 27 deletions(-)
>>>
>>> ...
>>>
>>>> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
>>>> index a58f84b6bd5e..4c5b7bcdb25c 100644
>>>> --- a/include/drm/drm_plane.h
>>>> +++ b/include/drm/drm_plane.h
>>>> @@ -992,6 +992,35 @@ static inline struct drm_plane 
>>>> *drm_plane_find(struct drm_device *dev,
>>>>   #define drm_for_each_plane(plane, dev) \
>>>>       list_for_each_entry(plane, &(dev)->mode_config.plane_list, head)
>>>> +/**
>>>> + * drm_plane_solid_fill_enabled - Check if solid fill is enabled on 
>>>> plane
>>>> + * @state: plane state
>>>> + *
>>>> + * Returns:
>>>> + * Whether the plane has been assigned a solid_fill_blob
>>>> + */
>>>> +static inline bool drm_plane_solid_fill_enabled(struct 
>>>> drm_plane_state *state)
>>>> +{
>>>> +    if (!state)
>>>> +        return false;
>>>> +    return state->pixel_source == DRM_PLANE_PIXEL_SOURCE_SOLID_FILL 
>>>> && state->solid_fill_blob;
>>>> +}
>>>> +
>>>> +static inline bool drm_plane_has_visible_data(const struct 
>>>> drm_plane_state *state)
>>>> +{
>>>> +    switch (state->pixel_source) {
>>>> +    case DRM_PLANE_PIXEL_SOURCE_NONE:
>>>> +        return false;
>>>> +    case DRM_PLANE_PIXEL_SOURCE_SOLID_FILL:
>>>> +        return state->solid_fill_blob != NULL;
>>>
>>> This reminds me, new UAPI docs did not say what the requirements are for
>>> choosing solid fill pixel source. Is the atomic commit rejected if
>>> pixel source is solid fill, but solid_fill property has no blob?
>>
>> Hi Pekka,
>>
>> Yes, if pixel_source is solid_fill and the solid_fill property blob 
>> isn't set, the atomic commit should throw an error.
>>
>> Will document this in the UAPI.
> 
> I don't see a corresponding error check in atomic_check() functions. 
> Could you please check that there is one, as you are updating the uAPI.

Hi Dmitry,

Sorry for the late response.

drm_plane_has_visible_data() is being called from 
drm_atomic_plane_check() which is called from drm_atomic_commit() (via 
drm_atomic_check_only()).

It's also called within the atomic_check() callstack in 
drm_atomic_helper_check_plane_state(), though that check will set 
plane.visible to false and return 0.

Would it be better to have a more explicit `if (source == solid_fill && 
!plane->solid_fill_blob) then return -EINVAL` check in atomic_check()?

Thanks,

Jessica Zhang

> 
>>
>> Thanks,
>>
>> Jessica Zhang
>>
>>>
>>> This should be doc'd.
>>>
>>>
>>> Thanks,
>>> pq
>>>
>>>> +    case DRM_PLANE_PIXEL_SOURCE_FB:
>>>> +    default:
>>>> +        WARN_ON(state->pixel_source != DRM_PLANE_PIXEL_SOURCE_FB);
>>>> +    }
>>>> +
>>>> +    return state->fb != NULL;
>>>> +}
>>>> +
>>>>   bool drm_any_plane_has_format(struct drm_device *dev,
>>>>                     u32 format, u64 modifier);
>>>>
>>>
> 
> -- 
> With best wishes
> Dmitry
> 
