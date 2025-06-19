Return-Path: <linux-arm-msm+bounces-61801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C98AAE03DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 13:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6D3E3B333F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 11:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63629227E82;
	Thu, 19 Jun 2025 11:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNHgC1gX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B1922CBFC
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 11:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750332791; cv=none; b=dKP0ILuOz5awmCz+lZ+XAiTiZb+uXkO4FadpZSzmrN9FDGQZ9oWBC4ouJZT8/TXMS+q14qFOpz2F9b/BFlqu5EzMvkjl1x5f+ZMHjoLOIAL/halUvNyeDWIB9iqYmp/Ho2Cto0Ew7jCp8PGhWPP96gfPVg1g4S1ap/1syJDCF5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750332791; c=relaxed/simple;
	bh=J9G7rreB01Jf+4yKP7k7JOk0Qkflozlt8J/fw/7uS6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=aHwW15mz8H/qAj9YftLWn6GIS4OEdOaI5qsrskKNVNgJo+hF24dtPPVNPsoCFCpp4n9BwtI1Tzbm3dLWBn1sQelXUqoxY9KsLMQ6I7MIKt//H2ubD51iLPDDKr8RY6mD8fTfR9u3Z0FzAeX8HrD3gPs38iXgPgvRIcSlGq50/hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eNHgC1gX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JAYk8c007515
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 11:33:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fcGXlnMjHDod9u72ceg5F+gQT1oWTmXhCPpg0BGjbso=; b=eNHgC1gX31dG4fbi
	FiKuMvCY1/ou3rkhTQiT9vGUPqS06xt0g2cOMxZ69zaOUzi0k/83qAvjX6CCew5m
	+ew6nFN4NwB+WEGbNy3s9988XFY912W+s+XhKfC06f4LLL4WG4y3ecHIU4hG6j7D
	jb+3aVDOnv016JJ5dkZeqr9jxpJ2lNHH13JzA0V2VfVGJTeB1jiv9a8sxGtyhn0/
	o3Mz3fWI0WvPKDrH+9OgkFzJ9gA4jdSdoxgQn1ppeuBcAr0Lxm4YXvkz2fIX32C9
	L+pztlFfNMomeX6DBr+jg0T5zXxUVd2OTZwfZgt3JILnhp8wQvEtcxefFtAaf4vx
	SpSarA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47c9krsk81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 11:33:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5750ca8b2so106328785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 04:33:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750332787; x=1750937587;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fcGXlnMjHDod9u72ceg5F+gQT1oWTmXhCPpg0BGjbso=;
        b=FJG/Svy+z5pGqGhbJIvXilXzY0YoSDor4loM9LVTAQ+EwhMAtVaZTyFnYSSSVHNaEf
         FJgDQt94cZimlvCF3Kq05xLofpBrwgVeb20Z451J9uM0qjwcctm0bPJn8X+IeKEOEzaF
         AqO/eMLPnmlwa8NWpPjBYwiCASK7lrmngYzAZ6b3H3NTyD4xHgezEmQG6YT4ye6daGIM
         8tmyK/j2QG8yKS9ebtdx5DlkA/f5R0E5QmW3+oUH8ObJzlm68rl5aV5NtI9/V6ftfCV1
         UjteeL4PbqCynAnuOysO8tngcgf1fbZTjy1BCG6p1o+wXPcqSuvRQupBBqx8Zo4fr8gb
         IFxg==
X-Forwarded-Encrypted: i=1; AJvYcCUxY8EsB6YORkdi2uwaH83qvNeKeUNPCAKySwa0PLKdzgEOJNOaG/XeFtSobKSUKlo5Oh0ZYK/7mw77CuGB@vger.kernel.org
X-Gm-Message-State: AOJu0YzM8tiirMn3217wxn64X+vmI8HhWaTS7pvpjvNCuJBkSci1RAeI
	QATK/4jYdKNhh/OoGZIoSoO8tRHBG0l7wReeRKALii96aE++cQzPoD2zqhzkVmvw+kKvLTw4Pwt
	AMOtdLZEVjXKAcP2dOouJzJ63cDCM9/YUEQnqeAtLXP7aOvAZP978+qK7sJhsLx3Qd1BB
X-Gm-Gg: ASbGnctLkFBVs+AR6wD0bWN6Grv+uflOujazPk3+pypbR5D960w4c+3gE1F6jshzBhr
	F89b6sNecA1qpfoFHc34joOCBP4QnEBBgZZARwlvzCapRe2mBPXdtl37uUK2j5ni8FL7Fm/SWl6
	VP1xX/qPdveHC9fx1ax1/W+aobka0kxAfpVMNmUF4oamtXKFQob01iywkNnx8O3VZwxz3sJGm0/
	H0bWholo/XAHmEGTil0ZG+0c5XSaMfXnrPPVu3XhWl13K9qFmzOyGRV0lTjU+0kP9yqNKe8MCaZ
	35GABxC49YP5SNTE1ay7Z2R274IxRegiCyzB34xYGw==
X-Received: by 2002:a05:620a:40c1:b0:7cd:5b2a:979e with SMTP id af79cd13be357-7d3c6cd4d6dmr2922835485a.30.1750332786826;
        Thu, 19 Jun 2025 04:33:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWetNboUqAGLhrBfHugtMOOGqPRsVfQYsYoK7lpt/ZYcIXMp812DfqJsWR8spMzupoU9s7Jw==
X-Received: by 2002:a05:620a:40c1:b0:7cd:5b2a:979e with SMTP id af79cd13be357-7d3c6cd4d6dmr2922828685a.30.1750332786199;
        Thu, 19 Jun 2025 04:33:06 -0700 (PDT)
Received: from [10.92.240.160] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b48f2d72sm11208409a12.24.2025.06.19.04.33.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 04:33:05 -0700 (PDT)
Message-ID: <997c2a3a-44e7-4169-8664-7b600deaa618@oss.qualcomm.com>
Date: Thu, 19 Jun 2025 14:33:03 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 29/38] drm/msm/dp: add connector abstraction for DP MST
To: Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-29-a54d8902a23d@quicinc.com>
 <bmzte2ywtlygl4rru73efnfb4vpi3vkveeq32jhonrmxbogp5h@kqaukhzvcxx3>
 <2ab43ae7-12b6-4d41-9ffd-dbea70e2a662@quicinc.com>
 <njz3apifgcv2k3kzlmti5rjgqpl43v5yvjqpu6qhpe2kw3bzlu@pqvnrh6ff2um>
 <35527541-30dc-44dd-a108-79f599ace831@quicinc.com>
 <bd0fba5c-9e38-4a40-adf9-cc70fa2d0f57@oss.qualcomm.com>
 <ad1db558-c33e-4788-9f25-cac6c21713f1@quicinc.com>
Content-Language: en-US
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <ad1db558-c33e-4788-9f25-cac6c21713f1@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oqo1ZqZLsyT2XxY3YKlRYhOQJ8BxhW5F
X-Authority-Analysis: v=2.4 cv=UPTdHDfy c=1 sm=1 tr=0 ts=6853f574 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=WsE5oTcdHMgl6o9M-NEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDA5NiBTYWx0ZWRfX9IcBQdw3pYYp
 aCitwiIBltQbLakWnzbo68rjEuRswIgcXBaSEhaCtWyUfFfWNsznq6QpN5a3FL772hPLoK9VPxo
 hKavG3sVUc0ggOWbXoiUX/o4pdFjveUrtOf7RHBRi/WfSa+fWN1tObc8MdY6K5eIClquecN4wXM
 UGGFjUBQug043KwevGoo7PQLJZ19oYiIrougKrTaOHrQHR69zsmeans56TVcUSMPQDD4HZ7S7+J
 xUlEr8v0aCKK6wCbjbujvriG5a2h0gQ1dTttaiGyC5i80rET3qXaeozD5zo9Peeu6/TKAJTSsgL
 AL+bgUR61Ov8+cyQu8MOM0b2RdAO1aTUWSssJ4HYYSf2ASgMo7q0pyL2PmHi5E32JgtEsl3lbGF
 N6xxRkH9P22KvFWYlWPsKLCZ+zPOOiWwyEmPsh5dKXMe7+EWN4iikM3CB+WJwZjW/LPYnxor
X-Proofpoint-ORIG-GUID: oqo1ZqZLsyT2XxY3YKlRYhOQJ8BxhW5F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_04,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506190096

[initially I responded off-list by mistake, sorry for the confusion and 
possible duplicates]

On 19/06/2025 12:26, Yongxing Mou wrote:
> 
> 
> On 2025/6/16 22:41, Dmitry Baryshkov wrote:
>> On 16/06/2025 17:09, Yongxing Mou wrote:
>>>
>>>
>>> On 2025/6/11 22:31, Dmitry Baryshkov wrote:
>>>> On Wed, Jun 11, 2025 at 08:06:28PM +0800, Yongxing Mou wrote:
>>>>>
>>>>>
>>>>> On 2025/6/9 23:44, Dmitry Baryshkov wrote:
>>>>>> On Mon, Jun 09, 2025 at 08:21:48PM +0800, Yongxing Mou wrote:
>>>>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>>>
>>>>>>> Add connector abstraction for the DP MST. Each MST encoder
>>>>>>> is connected through a DRM bridge to a MST connector and each
>>>>>>> MST connector has a DP panel abstraction attached to it.
>>>>>>>
>>>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/msm/dp/dp_mst_drm.c | 515 ++++++++++++++++++++ 
>>>>>>> + + ++++++++++++++
>>>>>>>    drivers/gpu/drm/msm/dp/dp_mst_drm.h |   3 +
>>>>>>>    2 files changed, 518 insertions(+)
>>>>>>
>>>>>> It generally feels liks 80% of this patch is a generic code. Please
>>>>>> extract generic DP MST connector and push it under drm/display. 
>>>>>> Other DP
>>>>>> MST drivers should be able to use it.
>>>>>>
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/ 
>>>>>>> drm/ msm/dp/dp_mst_drm.c
>>>>>>> index 
>>>>>>> a3ea34ae63511db0ac920cbeebe30c4e2320b8c4..489fa46aa518ff1cc5f4769b2153fc5153c4cb41 100644
>>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
>>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
>>>>>>> @@ -25,8 +25,12 @@
>>>>>>>     * OF THIS SOFTWARE.
>>>>>>>     */
>>>>>>> +#include <drm/drm_edid.h>
>>>>>>> +#include <drm/drm_managed.h>
>>>>>>>    #include "dp_mst_drm.h"
>>>>>>> +#define MAX_DPCD_TRANSACTION_BYTES 16
>>>>>>> +
>>>>>>>    static struct drm_private_state 
>>>>>>> *msm_dp_mst_duplicate_bridge_state(struct drm_private_obj *obj)
>>>>>>>    {
>>>>>>>        struct msm_dp_mst_bridge_state *state;
>>>>>>> @@ -79,6 +83,61 @@ static int msm_dp_mst_find_vcpi_slots(struct 
>>>>>>> drm_dp_mst_topology_mgr *mgr, int p
>>>>>>>        return num_slots;
>>>>>>>    }
>>>>>>> +static int msm_dp_mst_get_mst_pbn_div(struct msm_dp_panel 
>>>>>>> *msm_dp_panel)
>>>>>>> +{
>>>>>>> +    struct msm_dp_link_info *link_info;
>>>>>>> +
>>>>>>> +    link_info = &msm_dp_panel->link_info;
>>>>>>> +
>>>>>>> +    return link_info->rate * link_info->num_lanes / 54000;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static int msm_dp_mst_compute_config(struct drm_atomic_state 
>>>>>>> *state,
>>>>>>> +                      struct msm_dp_mst *mst, struct 
>>>>>>> drm_connector *connector,
>>>>>>> +                      struct drm_display_mode *mode)
>>>>>>> +{
>>>>>>> +    int slots = 0, pbn;
>>>>>>> +    struct msm_dp_mst_connector *mst_conn = 
>>>>>>> to_msm_dp_mst_connector(connector);
>>>>>>> +    int rc = 0;
>>>>>>> +    struct drm_dp_mst_topology_state *mst_state;
>>>>>>> +    int pbn_div;
>>>>>>> +    struct msm_dp *dp_display = mst->msm_dp;
>>>>>>> +    u32 bpp;
>>>>>>> +
>>>>>>> +    bpp = connector->display_info.bpc * 3;
>>>>>>> +
>>>>>>> +    pbn = drm_dp_calc_pbn_mode(mode->clock, bpp << 4);
>>>>>>
>>>>>> Is this going to change if DSC is in place? Will it bring 
>>>>>> fractional BPP
>>>>>> here?
>>>>>>
>>>>> Actually, in this patch series, MST not support DSC. So we just don't
>>>>> consider this scenario.
>>>>
>>>> But you still can answer the question.
>>>>
>>>>
>>>> [...]
>>>>
>>> 1.Emm, for my current understanding, if DSC is enabled, the BPP 
>>> should change and recaculated.
>>> Will it bring fractional BPP here?
>>
>> That's what I am asking
>>
>>>  >>>I'm not entirely sure about this answer. I checked how other 
>>> drivers call this function, and they all use bpp << 4, so can we 
>>> assume that this way of calling it is valid?
>>
>> It is valid. I'm trying to understand the implications and future 
>> changes.
>>
>>>>>>> +
>>>>>>> +    return msm_dp_display_mode_valid(dp_display, &dp_display- 
>>>>>>> >connector->display_info, mode);
>>>>>>> +}
>>>>>>> +
>>>>>>> +static struct drm_encoder *
>>>>>>> +msm_dp_mst_atomic_best_encoder(struct drm_connector *connector, 
>>>>>>> struct drm_atomic_state *state)
>>>>>>
>>>>>> Do we need this callback? Don't we have a fixed relationship between
>>>>>> connectors and encoders?
>>>>
>>>> This was left unanswered.
>>>>
>>> Sorry, I didn't mean to skip any questions — I just planned to reply 
>>> a bit later. Apologies for the confusion.
>>> For this question, yes , we don't have the fixed relationship between 
>>> them. Under the current codes, the Connector selects the available 
>>> encoder and bridge in order from index 0 to 4 (up to max_streams) 
>>> when the connector's status changes to 'connected'.
>>
>> Why? Can we have 1:1 relationship as we do with other bridges?
>>
> Emm, It may be because the number of MST connectors is not fixed, but 
> rather determined by the number of output ports on the dongle. For 
> example, in a 2-MST case, there are 2 encoders, but there could be four 
> MST connectors if the dongle has four DP output ports. add_connector() 
> creates MST connectors based on the number of outputs on the dongle, 
> rather than the actual number of connected devices.

Ack, this should be a part of the commit message.

>>>>>>
>>>>>>> +{
>>>>>>> +    struct msm_dp_mst_connector *mst_conn = 
>>>>>>> to_msm_dp_mst_connector(connector);
>>>>>>> +    struct msm_dp *dp_display = mst_conn->msm_dp;
>>>>>>> +    struct msm_dp_mst *mst = dp_display->msm_dp_mst;
>>>>>>> +    struct drm_encoder *enc = NULL;
>>>>>>> +    struct msm_dp_mst_bridge_state *bridge_state;
>>>>>>> +    u32 i;
>>>>>>> +    struct drm_connector_state *conn_state = 
>>>>>>> drm_atomic_get_new_connector_state(state,
>>>>>>> +                                            connector);
>>>>>>> +
>>>>>>
>>>>
>>>> [...]
>>>>
>>>>>>> +    if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>>>>>>> +        if (WARN_ON(!old_conn_state->best_encoder)) {
>>>>>>> +            rc = -EINVAL;
>>>>>>> +            goto end;
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        drm_bridge = 
>>>>>>> drm_bridge_chain_get_first_bridge(old_conn_state->best_encoder);
>>>>>>
>>>>>> This really looks like this should be a bridge's callback.
>>>>
>>>> And this one
>>>>
>>> Emm, the bridge does not implement atomic_check(). All MST-related 
>>> checks (such as drm_dp_atomic_release_time_slots, 
>>> drm_dp_mst_atomic_check, or others) are performed in the connector's 
>>> atomic_check function. I believe this is because both num_slots and 
>>> pbn are stored in the bridge, and we call this to get the drm_bridge..
>>
>> So, please split them into connector and bridge checks, calling them 
>> from corresponding hooks. It might be easier to migrate completely to 
>> the bridge's atomic_check(). At least it will save us from this clumsy 
>> code getting the bridge for the connector.
>>
> Maybe we don't need to move to bridge's atomic_check(). Connector's 
> atomic_check() do 2 things: 1.Call drm_dp_atomic_release_time_slots when 
> unplug, 2. Call drm_dp_atomic_find_time_slots and 
> drm_dp_mst_atomic_check when plug in.

Actually... I don't think you are calling it in a correct way. It should 
be called from the drm_mode_config.atomic_check, not from connector's 
atomic_check(). See how nouveau driver does it. Even documentation 
insists that it should be called _after_ checking the rest of the state.

> 3 functions need drm_atomic_state, 
> but it seems that drm_bridge_funcs.atomic_check() does not pass in 
> drm_atomic_state. 

You can get drm_atomic_state from bridge_state->base.state, 
crtc_state->state, connector_state->state, that's not really an issue.

> Actually both 2 actions only occur when need modeset. 
> Maybe we can optimize this function in the following ways: (1) reduce 
> unnecessary references to drm_bridge, especially since bridge_state- 
>  >num_slots can replace with payload->time_slots; (2)As your comments, 
> split the function into smaller parts to better reflect the logic.

Yes, please. Getting rid of bridge_state->num_slots is a good path forward.

>>
>>>>>>
>>>>>>> +        if (WARN_ON(!drm_bridge)) {
>>>>>>> +            rc = -EINVAL;
>>>>>>> +            goto end;
>>>>>>> +        }
>>>>>>> +        bridge = to_msm_dp_mst_bridge(drm_bridge);
>>>>>>> +
>>>>>>> +        bridge_state = msm_dp_mst_br_priv_state(state, bridge);
>>>>>>> +        if (IS_ERR(bridge_state)) {
>>>>>>> +            rc = PTR_ERR(bridge_state);
>>>>>>> +            goto end;
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        if (WARN_ON(bridge_state->connector != connector)) {
>>>>>>> +            rc = -EINVAL;
>>>>>>> +            goto end;
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        slots = bridge_state->num_slots;
>>>>>>> +        if (slots > 0) {
>>>>>>> +            rc = drm_dp_atomic_release_time_slots(state,
>>>>>>> +                                  &mst->mst_mgr,
>>>>>>> +                                  mst_conn->mst_port);
>>>>>>> +            if (rc) {
>>>>>>> +                DRM_ERROR("failed releasing %d vcpi slots %d\n", 
>>>>>>> slots, rc);
>>>>>>> +                goto end;
>>>>>>> +            }
>>>>>>> +            vcpi_released = true;
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        if (!new_conn_state->crtc) {
>>>>>>> +            /* for cases where crtc is not disabled the slots 
>>>>>>> are not
>>>>>>> +             * freed by drm_dp_atomic_release_time_slots. this 
>>>>>>> results
>>>>>>> +             * in subsequent atomic_check failing since internal 
>>>>>>> slots
>>>>>>> +             * were freed but not the dp mst mgr's
>>>>>>> +             */
>>>>>>> +            bridge_state->num_slots = 0;
>>>>>>> +            bridge_state->connector = NULL;
>>>>>>> +            bridge_state->msm_dp_panel = NULL;
>>>>>>> +
>>>>>>> +            drm_dbg_dp(dp_display->drm_dev, "clear best encoder: 
>>>>>>> %d\n", bridge->id);
>>>>>>> +        }
>>>>>>> +    }
>>>>>>
>>>>>> This looks like there are several functions fused together. Please
>>>>>> unfuse those into small and neat code blocks.
>>>>
>>>> And this :-D
>>>>
>>> Got it.. this code only do one thing, check and try to release 
>>> time_slots.. we can try to package it into small functions..
>>
>> I still don't understand, why do we need to release time_slots here 
>> instead of using MST helpers.
>>
> Emm , just as above reply.. when we need modeset, call 
> drm_dp_atomic_release_time_slots to release payload and then clear 
> bridge_state cached ..

I don't see other drivers limiting drm_dp_atomic_release_time_slots() to 
the modeset case. Any reason for MSM driver to deviate from that?



>>>>>>
>>>>>>> +
>>>>>>> +mode_set:
>>>>>>> +    if (!new_conn_state->crtc)
>>>>>>> +        goto end;
>>>>>>> +
>>>>>>> +    crtc_state = drm_atomic_get_new_crtc_state(state, 
>>>>>>> new_conn_state->crtc);
>>>>>>> +
>>>>>>> +    if (drm_atomic_crtc_needs_modeset(crtc_state) && crtc_state- 
>>>>>>> >active) {
>>>>>>
>>>>>> Use of crtc_state->active doesn't look correct.
>>>>
>>>>
>>>> ...
>>>>
>>> Sorry, I'm still not quite sure where the issue is. Could you please 
>>> help point it out? Thanks~~
>>
>>
>> Please refer to the documentation for drm_crtc_state::active. The 
>> drivers are not supposed to use this field in checks.
>>
> Got it , so maybe drm_crtc_state::enable might more appropriate here..

Well, why do you need it in the first place? This will determine a 
correct set of conditions.


>>>>>>
>>>>>>> +        if (WARN_ON(!new_conn_state->best_encoder)) {
>>>>>>> +            rc = -EINVAL;
>>>>>>> +            goto end;
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        drm_bridge = 
>>>>>>> drm_bridge_chain_get_first_bridge(new_conn_state->best_encoder);
>>>>>>> +        if (WARN_ON(!drm_bridge)) {
>>>>>>> +            rc = -EINVAL;
>>>>>>> +            goto end;
>>>>>>> +        }
>>>>>>> +        bridge = to_msm_dp_mst_bridge(drm_bridge);
>>>>>>> +
>>>>>>> +        bridge_state = msm_dp_mst_br_priv_state(state, bridge);
>>>>>>> +        if (IS_ERR(bridge_state)) {
>>>>>>> +            rc = PTR_ERR(bridge_state);
>>>>>>> +            goto end;
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        if (WARN_ON(bridge_state->connector != connector)) {
>>>>>>> +            rc = -EINVAL;
>>>>>>> +            goto end;
>>>>>>> +        }
>>>>>>
>>>>>> Can all of this actually happen?
>>>>
>>>> ...
>>>>
>>> Actually not, I haven't encountered it yet. I'm not sure how to 
>>> trigger it, but it might occur under race conditions? Or we just 
>>> remove it untill some case it really happen..
>>
>> No. You actually think whether this condition can happen, then keep it 
>> if it can (and drop it if it can not happen).
>>
> Got it. Let me test a few different cases to see if these scenarios occur.

No. It's not about testing. It's about asserting if the scenario can 
occur or not per your call stacks and per the design / contract.


-- 
With best wishes
Dmitry

