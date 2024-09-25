Return-Path: <linux-arm-msm+bounces-32525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 756839868A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 23:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8AB01F252F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 21:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AAF31534FB;
	Wed, 25 Sep 2024 21:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VqAEz1wF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B12F4C91;
	Wed, 25 Sep 2024 21:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727301016; cv=none; b=a5G04kJiJKKe8dlTgEKB2RFtgjdVIadRz4g2NQAWgrUa+yQqrFofkgQUDruzuO+DVfCaAB3tmcWRmZHpDKG4xPUq0yEn7LWznXId9TQlXf31aYKe9xfGDLH7cTnKK7+eprFW4FGM+y2VtpZ4COGZzqCPaHm0MQ43WgCdkh1FUJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727301016; c=relaxed/simple;
	bh=EFCd0hY+WQcVPDGPgHTKBF7gS4SpzfNZSvk8p6BkQ6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=u+g4/+R/yJD/uNVW4iECJyFf56BQEUynxlcZxMAqrR8/VgBhlddBjjw8UnBRgLPSisU4aCVI9rKS0qh/vaMKZ+UxVhQcSsFmZsveOcIJdxiWfpYea/qziwdzU6cahQd0tmdYqMwBY0AdtUD54avBEljWf7CbGRtAejK9KgXfPoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VqAEz1wF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48PH5VEm003273;
	Wed, 25 Sep 2024 21:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cUo2xnrZPZytmmedqxe3w7UxThlQk1ZAm+U9dTIDcvo=; b=VqAEz1wFCrobFtss
	CmglPNmdc9HijPDOUP4Zru19aHRUVEmODLeyAD8XgPka6ZiF1qZppCz2hP4AaYdk
	DC/W/xNuTTnFqfp4ioEngrOop/fyd5mL5vxFheoEGzpeLOZkUvl06AQngH86EdSC
	KeNPUmPW6e4VRglf+67UsDLp3ftaJVMGSb07IupIMrrGYSYJAgEeDVWI1G9Gzvqo
	yKFrMj1jt5EWalryweYuB9oI47O0bu3kxSmziRYnbfYa/XmuMcZMGsMj65UbJxuy
	eD6V5/69O+5yHOBUKyZMxn5WSvNiOgEOz1C876sJwYBeJte/0WRivB8c4aoUfDpV
	6BruGw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sn5bwn3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 21:49:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48PLnt67020845
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 21:49:55 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Sep
 2024 14:49:53 -0700
Message-ID: <b3830573-1f39-4729-be58-c2659a37d689@quicinc.com>
Date: Wed, 25 Sep 2024 14:49:48 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/22] drm/msm/dpu: move resource allocation to CRTC
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jessica Zhang
	<quic_jesszhan@quicinc.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, <quic_ebharadw@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Rob Clark
	<robdclark@chromium.org>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
	<ville.syrjala@linux.intel.com>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-5-7849f900e863@quicinc.com>
 <dv5iij6v76ieprfckdjo4yksrjrgqw73v2lh7u4xffpu7rdrf3@zgjcp3a2hlxo>
 <24a11f4c-d848-4f1b-afbd-35b135fa3105@quicinc.com>
 <CAA8EJpraspHpgGvJxe7dXx-hN+yirs_+AacjkrHvPWuEvrLJ-w@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpraspHpgGvJxe7dXx-hN+yirs_+AacjkrHvPWuEvrLJ-w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hN5KCY7DiitFrvWgxg5Ynov_mKy_xXVd
X-Proofpoint-GUID: hN5KCY7DiitFrvWgxg5Ynov_mKy_xXVd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250155



On 9/25/2024 2:11 PM, Dmitry Baryshkov wrote:
> On Wed, 25 Sept 2024 at 22:39, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>
>>
>>
>> On 9/24/2024 4:13 PM, Dmitry Baryshkov wrote:
>>> On Tue, Sep 24, 2024 at 03:59:21PM GMT, Jessica Zhang wrote:
>>>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>
>>>> All resource allocation is centered around the LMs. Then other blocks
>>>> (except DSCs) are allocated basing on the LMs that was selected, and LM
>>>> powers up the CRTC rather than the encoder.
>>>>
>>>> Moreover if at some point the driver supports encoder cloning,
>>>> allocating resources from the encoder will be incorrect, as all clones
>>>> will have different encoder IDs, while LMs are to be shared by these
>>>> encoders.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> [quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> [quic_jesszhan@quicinc.com: Changed to grabbing exising global state]
>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  86 ++++++++++++
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 201 +++++++++++-----------------
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  19 +++
>>>>    3 files changed, 183 insertions(+), 123 deletions(-)
>>>>
>>>> @@ -544,159 +542,117 @@ void dpu_encoder_helper_split_config(
>>>>       }
>>>>    }
>>>>
>>>> -bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>>>> +void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
>>>> +                             struct msm_display_topology *topology,
>>>> +                             struct drm_atomic_state *state,
>>>> +                             const struct drm_display_mode *adj_mode)
>>>>    {
>>>>       struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
>>>> -    int i, intf_count = 0, num_dsc = 0;
>>>> +    struct drm_connector *connector;
>>>> +    struct drm_connector_state *conn_state;
>>>> +    struct msm_display_info *disp_info;
>>>> +    struct drm_framebuffer *fb;
>>>> +    struct msm_drm_private *priv;
>>>> +    int i;
>>>>
>>>>       for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
>>>>               if (dpu_enc->phys_encs[i])
>>>> -                    intf_count++;
>>>> +                    topology->num_intf++;
>>>>
>>>> -    /* See dpu_encoder_get_topology, we only support 2:2:1 topology */
>>>> +    /* We only support 2 DSC mode (with 2 LM and 1 INTF) */
>>>>       if (dpu_enc->dsc)
>>>> -            num_dsc = 2;
>>>> +            topology->num_dsc += 2;
>>>>
>>>> -    return (num_dsc > 0) && (num_dsc > intf_count);
>>>> -}
>>>> +    connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
>>>> +    if (!connector)
>>>> +            return;
>>>> +    conn_state = drm_atomic_get_new_connector_state(state, connector);
>>>> +    if (!conn_state)
>>>> +            return;
>>>>
>>>> -struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
>>>> -{
>>>> -    struct msm_drm_private *priv = drm_enc->dev->dev_private;
>>>> -    struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
>>>> -    int index = dpu_enc->disp_info.h_tile_instance[0];
>>>> +    disp_info = &dpu_enc->disp_info;
>>>>
>>>> -    if (dpu_enc->disp_info.intf_type == INTF_DSI)
>>>> -            return msm_dsi_get_dsc_config(priv->dsi[index]);
>>>> +    priv = drm_enc->dev->dev_private;
>>>>
>>>> -    return NULL;
>>>> +    /*
>>>> +     * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
>>>> +     * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
>>>> +     * earlier.
>>>> +     */
>>>> +    if (disp_info->intf_type == INTF_WB && conn_state->writeback_job) {
>>>> +            fb = conn_state->writeback_job->fb;
>>>> +
>>>> +            if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
>>>> +                    topology->needs_cdm = true;
>>>> +    } else if (disp_info->intf_type == INTF_DP) {
>>>> +            if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
>>>> +                    topology->needs_cdm = true;
>>>> +    }
>>>
>>> Just to note, the needs_cdm is not enough once you introduce CWB
>>> support. E.g. DP/YUV420 + WB/YUV case requires two CDM blocks (which we
>>> don't have), but this doesn't get reflected in the topology.
>>
>> Hi Dmitry,
>>
>> Ack. I can add something to make atomic_check fail if the input FB is
>> YUV format and CWB is enabled.
> 
> I'd prefer for this to be more natural rather than just checking for
> the DP && DP_YUV420 && WB && WB_FMT_YUV. In the worst case, count CDM
> requests and then in RM check them against the catalog. But I had a
> more logical (although more intrusive) implementation on my mind:
> 
> struct msm_display_topology {
>      struct {
>        u32 num_intf;
>        u32 num_wb;
>        u32 num_dsc;
>        bool needs_cdm;
>      } outputs[MAX_OUTPUTS];
>      u32 num_lm;
> };
> 
> WDYT?
> 

the struct msm_display_topology was originally designed as a per-encoder 
struct (dpu_encoder_get_topology() indicates the same). Making this an 
array of outputs was not needed as there is expected to be one struct 
msm_display_topology for each virt encoder's requested topology and the 
blocks inside of it other than LM, are "encoder" hw blocks.

needs_cdm was made a boolean instead of a num_cdm_count like other 
hardware blocks because till the most recent chipset, we have only one 
CDM block. Whenever we do have more CDM blocks why will introducing 
num_cdm to the topology struct not solve your problem rather than making 
it an array of outputs?

Because then, RM will know that the request exceeds the max blocks.

I think what you are trying to do now is make struct 
msm_display_topology's encoder parts per-encoder and rest like num_lm 
per "RM session".

The thought is not wrong but at the same time seems a bit of an overkill 
because its mostly already like that. Apart from CDM for which I have no 
indication of another one getting added, rest of the blocks are already 
aligned towards a per-encoder model and not a "RM session" model.

Even if we end up doing it this way, most of the model is kind of unused 
really because each encoder will request its own topology anyway, there 
is just no aggregation for CDM which at this point is not needed as 
there is no HW we are aware of needing this.

I think the atomic_check validation is needed either way because if two 
encoders request cdm, we cannot do clone mode as there is only one cdm 
block today. Its just that we are not tracking num_cdm today due to 
reasons explained above but basically doing something like below seems 
right to me:

if (enc_is_in_clone_mode && needs_cdm)
	return -ENOTSUPPORTED;

When we add more cdm_blocks, we can drop this check and making needs_cdm 
a num_cdm will make it naturally fail.

>>
>> Thanks,
>>
>> Jessica Zhang
>>
>>>
>>>>    }
>>>>
>>> --
>>> With best wishes
>>> Dmitry
>>
> 
> 

