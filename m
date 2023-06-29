Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99C9A742C70
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jun 2023 20:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232477AbjF2Swy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jun 2023 14:52:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232465AbjF2Swx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jun 2023 14:52:53 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9FA5A2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 11:52:51 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35TGQLDu004360;
        Thu, 29 Jun 2023 18:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=drE4UQHIiVRQZ4hLRKYCxMDm2+ayfGtKEs08w4G/xJQ=;
 b=ArWME2HCx85GwdIDg+p4cbdOs/m3McEBD+2ypkLlo0T6yvWEB/OIZ5lHsBJI6LK71pKB
 fwJH1d8ZwijJVFP82uJ6OOQd2rI/YYB+Tjlu5i46yhSHfJO0GILmhMtQO/Te+s+kH4Ng
 5ZGYgZgu9PbTY0CPwRIzNJ2eoXQTXZPHMg6h5KrERacWgvXuTL/07Anh4yz782z5KUTJ
 H4YmslkIZevzi+2g7z5ETVhRSkTIekF6EKW36N6nUae+7VFMevLTurB3Cit9j1OCA+ty
 0avLqjBSuFovxDK483tGh27DGkWNo90/bRDjwypI7NHJkQ1hgvKsnUsp/v8Ig7yCBrec EQ== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rgy1thy65-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Jun 2023 18:52:40 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35TIqdkU013795
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Jun 2023 18:52:39 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 29 Jun
 2023 11:52:38 -0700
Message-ID: <3df58d80-5544-ca63-5d83-1e2d7291b5ae@quicinc.com>
Date:   Thu, 29 Jun 2023 11:52:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [RFC PATCH 0/3] Support for Solid Fill Planes
Content-Language: en-US
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Pekka Paalanen <ppaalanen@gmail.com>
CC:     =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        <daniel.vetter@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
        <swboyd@chromium.org>, <seanpaul@chromium.org>,
        <laurent.pinchart@ideasonboard.com>,
        <linux-arm-msm@vger.kernel.org>,
        <wayland-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <Y2leZDfLj/5963wl@intel.com>
 <d0b5abdc-85ad-fee2-9760-866c32bab111@quicinc.com>
 <20230627105849.004050b3@eldfell>
 <5e60fe99-76d5-c242-608e-b74bf6f0e7bd@quicinc.com>
 <54f194fe-ab7b-247d-600b-6da8f5c57dbf@linaro.org>
 <1613cdd4-8d90-6589-97e8-c4e1810bde04@quicinc.com>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <1613cdd4-8d90-6589-97e8-c4e1810bde04@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QALEiAI5DjjxC8XCpssFN1YSS1awhSxJ
X-Proofpoint-GUID: QALEiAI5DjjxC8XCpssFN1YSS1awhSxJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-29_06,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306290170
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/27/2023 3:10 PM, Abhinav Kumar wrote:
> 
> 
> On 6/27/2023 2:59 PM, Dmitry Baryshkov wrote:
>> On 28/06/2023 00:27, Jessica Zhang wrote:
>>>
>>>
>>> On 6/27/2023 12:58 AM, Pekka Paalanen wrote:
>>>> On Mon, 26 Jun 2023 16:02:50 -0700
>>>> Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>>>
>>>>> On 11/7/2022 11:37 AM, Ville Syrjälä wrote:
>>>>>> On Fri, Oct 28, 2022 at 03:59:49PM -0700, Jessica Zhang wrote:
>>>>>>> Introduce and add support for COLOR_FILL and COLOR_FILL_FORMAT
>>>>>>> properties. When the color fill value is set, and the framebuffer 
>>>>>>> is set
>>>>>>> to NULL, memory fetch will be disabled.
>>>>>>
>>>>>> Thinking a bit more universally I wonder if there should be
>>>>>> some kind of enum property:
>>>>>>
>>>>>> enum plane_pixel_source {
>>>>>>     FB,
>>>>>>     COLOR,
>>>>>>     LIVE_FOO,
>>>>>>     LIVE_BAR,
>>>>>>     ...
>>>>>> }
>>>>>
>>>>> Reviving this thread as this was the initial comment suggesting to
>>>>> implement pixel_source as an enum.
>>>>>
>>>>> I think the issue with having pixel_source as an enum is how to decide
>>>>> what counts as a NULL commit.
>>>>>
>>>>> Currently, setting the FB to NULL will disable the plane. So I'm
>>>>> guessing we will extend that logic to "if there's no pixel_source set
>>>>> for the plane, then it will be a NULL commit and disable the plane".
>>>>>
>>>>> In that case, the question then becomes when to set the 
>>>>> pixel_source to
>>>>> NONE. Because if we do that when setting a NULL FB (or NULL solid_fill
>>>>> blob), it then forces userspace to set one property before the other.
>>>>
>>>> Right, that won't work.
>>>>
>>>> There is no ordering between each property being set inside a single
>>>> atomic commit. They can all be applied to kernel-internal state
>>>> theoretically simultaneously, or any arbitrary random order, and the
>>>> end result must always be the same. Hence, setting one property cannot
>>>> change the state of another mutable property. I believe that doing
>>>> otherwise would make userspace fragile and hard to get right.
>>>>
>>>> I guess there might be an exception to that rule when the same property
>>>> is set multiple times in a single atomic commit; the last setting in
>>>> the array prevails. That's universal and not a special-case between two
>>>> specific properties.
>>>>
>>>>> Because of that, I'm thinking of having pixel_source be represented 
>>>>> by a
>>>>> bitmask instead. That way, we will simply unset the corresponding
>>>>> pixel_source bit when passing in a NULL FB/solid_fill blob. Then, in
>>>>> order to detect whether a commit is NULL or has a valid pixel 
>>>>> source, we
>>>>> can just check if pixel_source == 0.
>>>>
>>>> Sounds fine to me at first hand, but isn't there the enum property that
>>>> says if the kernel must look at solid_fill blob *or* FB_ID?
>>>>
>>>> If enum prop says "use solid_fill prop", the why would changes to FB_ID
>>>> do anything? Is it for backwards-compatibility with KMS clients that do
>>>> not know about the enum prop?
>>>>
>>>> It seems like that kind of backwards-compatiblity will cause problems
>>>> in trying to reason about the atomic state, as explained above, leading
>>>> to very delicate and fragile conditions where things work intuitively.
>>>> Hence, I'm not sure backwards-compatibility is wanted. This won't be
>>>> the first or the last KMS property where an unexpected value left over
>>>> will make old atomic KMS clients silently malfunction up to showing no
>>>> recognisable picture at all. *If* that problem needs solving, there
>>>> have been ideas floating around about resetting everything to nice
>>>> values so that userspace can ignore what it does not understand. So far
>>>> there has been no real interest in solving that problem in the kernel
>>>> though.
>>>>
>>>> Legacy non-atomic UAPI wrappers can do whatever they want, and program
>>>> any (new) properties they want in order to implement the legacy
>>>> expectations, so that does not seem to be a problem.
>>>
>>> Hi Pekka and Dmitry,
>>>
>>> After reading through both of your comments, I think I have a better 
>>> understanding of the pixel_source implementation now.
>>>
>>> So to summarize, we want to expose another property called 
>>> "pixel_source" to userspace that will default to FB (as to not break 
>>> legacy userspace).
>>>
>>> If userspace wants to use solid fill planes, it will set both the 
>>> solid_fill *and* pixel_source properties to a valid blob and COLOR 
>>> respectively. If it wants to use FB, it will set FB_ID and 
>>> pixel_source to a valid FB and FB.
>>>
>>> Here's a table illustrating what I've described above:
>>>
>>> +-----------------+-------------------------+-------------------------+
>>> | Use Case        | Legacy Userspace        | solid_fill-aware        |
>>> |                 |                         | Userspace               |
>>> +=================+=========================+=========================+
>>> | Valid FB        | pixel_source = FB       | pixel_source = FB       |
>>> |                 | FB_ID = valid FB        | FB_ID = valid FB        |
>>> +-----------------+-------------------------+-------------------------+
>>> | Valid           | pixel_source = COLOR    | N/A                     |
>>> | solid_fill blob | solid_fill = valid blob |                         |
>>
>> Probably these two cells were swapped.
>>
> 
> Ack, yes they were swapped.
> 
>>> +-----------------+-------------------------+-------------------------+
>>> | NULL commit     | pixel_source = FB       | pixel_source = FB       |
>>> |                 | FB_ID = NULL            | FB_ID = NULL            |
>>> +-----------------+-------------------------+-------------------------+
>>
>>                                                | or:
>>                                                | pixel_source = COLOR
>>                                                | solid_fill = NULL

Hi Dmitry and Abhinav,

Sorry, forgot to respond to this comment.
Yep, if pixel_source is set to COLOR, then a NULL solid_fill blob will 
count as a NULL commit.

>>>
>>> Is there anything I'm missing or needs to be clarified?
>>>
>>
>> LGTM otherwise
>>
> 
> LGTM too.

Thanks for the feedback!

BR,

Jessica Zhang

> 
>>> Thanks,
>>>
>>> Jessica Zhang
>>>
>>>>
>>>>
>>>> Thanks,
>>>> pq
>>>>
>>>>
>>>>>
>>>>> Would be interested in any feedback on this.
>>>>>
>>>>> Thanks,
>>>>>
>>>>> Jessica Zhang
>>>>>
>>>>>>> In addition, loosen the NULL FB checks within the atomic commit 
>>>>>>> callstack
>>>>>>> to allow a NULL FB when color_fill is nonzero and add FB checks in
>>>>>>> methods where the FB was previously assumed to be non-NULL.
>>>>>>>
>>>>>>> Finally, have the DPU driver use drm_plane_state.color_fill and
>>>>>>> drm_plane_state.color_fill_format instead of 
>>>>>>> dpu_plane_state.color_fill,
>>>>>>> and add extra checks in the DPU atomic commit callstack to 
>>>>>>> account for a
>>>>>>> NULL FB in cases where color_fill is set.
>>>>>>>
>>>>>>> Some drivers support hardware that have optimizations for solid fill
>>>>>>> planes. This series aims to expose these capabilities to 
>>>>>>> userspace as
>>>>>>> some compositors have a solid fill flag (ex. SOLID_COLOR in the 
>>>>>>> Android
>>>>>>> hardware composer HAL) that can be set by apps like the Android 
>>>>>>> Gears
>>>>>>> app.
>>>>>>>
>>>>>>> Userspace can set the color_fill value by setting 
>>>>>>> COLOR_FILL_FORMAT to a
>>>>>>> DRM format, setting COLOR_FILL to a color fill value, and setting 
>>>>>>> the
>>>>>>> framebuffer to NULL.
>>>>>>
>>>>>> Is there some real reason for the format property? Ie. why not
>>>>>> just do what was the plan for the crttc background color and
>>>>>> specify the color in full 16bpc format and just pick as many
>>>>>> msbs from that as the hw can use?
>>>>>>>
>>>>>>> Jessica Zhang (3):
>>>>>>>     drm: Introduce color fill properties for drm plane
>>>>>>>     drm: Adjust atomic checks for solid fill color
>>>>>>>     drm/msm/dpu: Use color_fill property for DPU planes
>>>>>>>
>>>>>>>    drivers/gpu/drm/drm_atomic.c              | 68 
>>>>>>> ++++++++++++-----------
>>>>>>>    drivers/gpu/drm/drm_atomic_helper.c       | 34 +++++++-----
>>>>>>>    drivers/gpu/drm/drm_atomic_uapi.c         |  8 +++
>>>>>>>    drivers/gpu/drm/drm_blend.c               | 38 +++++++++++++
>>>>>>>    drivers/gpu/drm/drm_plane.c               |  8 +--
>>>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  7 ++-
>>>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 66 
>>>>>>> ++++++++++++++--------
>>>>>>>    include/drm/drm_atomic_helper.h           |  5 +-
>>>>>>>    include/drm/drm_blend.h                   |  2 +
>>>>>>>    include/drm/drm_plane.h                   | 28 ++++++++++
>>>>>>>    10 files changed, 188 insertions(+), 76 deletions(-)
>>>>>>>
>>>>>>> -- 
>>>>>>> 2.38.0
>>>>>>
>>>>>> -- 
>>>>>> Ville Syrjälä
>>>>>> Intel
>>>>
>>
