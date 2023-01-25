Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 042F767BA87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 20:16:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235370AbjAYTQh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 14:16:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjAYTQg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 14:16:36 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6B06C157
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 11:16:34 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30PGbBKh015477;
        Wed, 25 Jan 2023 19:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=5+5qZQ0E1YBtUcOmknuD21ctAvsyA1FZhCROZ3AlGs4=;
 b=BP6OxmMAVJHiM7y5Nw3GpnPcK0UJ4S4Hm5GY9rkpl7n19p4keX2BYrwkudtII0IhuM2g
 s/OOWK1dc7Eelx8y11zYVivef57GNu8fXFuVoYvwANSrXsKGWR7yrDVcKuHU56cnhzvh
 2msSXFDLpO400cDeHG3cKDRWnSOVWcKW0U1EtzhyaClkEjv/Q6YihkQF8OEEjzonVrsv
 4HwRgGjh7ZMpGWCTvTgMGgOnZaitLcy2cjOXFIteirX0ei2pya5atvt3eDp3Xcrzw5Si
 hSjSH2DNYJt6IMwhRqeirag8CU98QTBOqIjUy3vf6UapGsTn9dWaNRT/l7vNqEmHt/6l Yw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nak7jjgkc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 25 Jan 2023 19:16:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30PJGS8E031969
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 25 Jan 2023 19:16:28 GMT
Received: from [10.110.33.211] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 25 Jan
 2023 11:16:27 -0800
Message-ID: <bc2b860d-515e-9def-685f-585c34599c47@quicinc.com>
Date:   Wed, 25 Jan 2023 11:16:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v6 4/4] drm/msm: stop storing the array of CRTCs in struct
 msm_drm_private
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>,
        kernel test robot <lkp@intel.com>
References: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
 <20220617233328.1143665-5-dmitry.baryshkov@linaro.org>
 <37cf7080-8c4c-556c-a97c-ef0b0db1db11@quicinc.com>
 <CAA8EJpod2r1VKVxG7Tf409+T7FQR4VPFmUudxhD+cs8_y3Go+w@mail.gmail.com>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpod2r1VKVxG7Tf409+T7FQR4VPFmUudxhD+cs8_y3Go+w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0ApstegmscfM_wDWhL2eHBN7K75EkvUh
X-Proofpoint-ORIG-GUID: 0ApstegmscfM_wDWhL2eHBN7K75EkvUh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_12,2023-01-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301250168
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/24/2023 11:29 PM, Dmitry Baryshkov wrote:
> On Wed, 25 Jan 2023 at 04:14, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 6/17/2022 4:33 PM, Dmitry Baryshkov wrote:
>>> The array of CRTC in the struct msm_drm_private duplicates a list of
>>> CRTCs in the drm_device. Drop it and use the existing list for CRTC
>>> enumeration.
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  2 +-
>>>    drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  2 +-
>>>    drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  2 +-
>>>    drivers/gpu/drm/msm/msm_drv.c            | 44 +++++++++++++-----------
>>>    drivers/gpu/drm/msm/msm_drv.h            |  3 +-
>>>    5 files changed, 27 insertions(+), 26 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index e23e2552e802..e79f0a8817ac 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -806,7 +806,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>>>                        ret = PTR_ERR(crtc);
>>>                        return ret;
>>>                }
>>> -             priv->crtcs[priv->num_crtcs++] = crtc;
>>> +             priv->num_crtcs++;
>>>        }
>>>
>>>        /* All CRTCs are compatible with all encoders */
>>> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
>>> index fb48c8c19ec3..7449c1693e45 100644
>>> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
>>> @@ -337,7 +337,7 @@ static int modeset_init(struct mdp4_kms *mdp4_kms)
>>>                        goto fail;
>>>                }
>>>
>>> -             priv->crtcs[priv->num_crtcs++] = crtc;
>>> +             priv->num_crtcs++;
>>>        }
>>>
>>>        /*
>>> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>>> index 3d5621a68f85..36808990f840 100644
>>> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>>> @@ -497,7 +497,7 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
>>>                        DRM_DEV_ERROR(dev->dev, "failed to construct crtc %d (%d)\n", i, ret);
>>>                        goto fail;
>>>                }
>>> -             priv->crtcs[priv->num_crtcs++] = crtc;
>>> +             priv->num_crtcs++;
>>>        }
>>>
>>>        /*
>>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
>>> index 1aab6bf86278..567e77dae43b 100644
>>> --- a/drivers/gpu/drm/msm/msm_drv.c
>>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>>> @@ -149,7 +149,7 @@ static void msm_irq_uninstall(struct drm_device *dev)
>>>
>>>    struct msm_vblank_work {
>>>        struct work_struct work;
>>> -     int crtc_id;
>>> +     struct drm_crtc *crtc;
>>>        bool enable;
>>>        struct msm_drm_private *priv;
>>>    };
>>> @@ -162,15 +162,15 @@ static void vblank_ctrl_worker(struct work_struct *work)
>>>        struct msm_kms *kms = priv->kms;
>>>
>>
>> Is there any chance of vbl_work->crtc becoming NULL before this gets
>> executed?
> 
> No. The worker is created in vblank_ctrl_queue_work. The
> vbl_work->crtc is filled at the time of creation.
> 
>> So do we need to protect this like
>>
>> if (vbl_work->enable && vbl_work->crtc)
>>
>> Because the layers below this dont seem to have NULL protection.
>>
>>
>>>        if (vbl_work->enable)
>>> -             kms->funcs->enable_vblank(kms, priv->crtcs[vbl_work->crtc_id]);
>>> +             kms->funcs->enable_vblank(kms, vbl_work->crtc);
>>>        else
>>> -             kms->funcs->disable_vblank(kms, priv->crtcs[vbl_work->crtc_id]);
>>> +             kms->funcs->disable_vblank(kms, vbl_work->crtc);
>>>
>>>        kfree(vbl_work);
>>>    }
>>>
>>>    static int vblank_ctrl_queue_work(struct msm_drm_private *priv,
>>> -                                     int crtc_id, bool enable)
>>> +                                     struct drm_crtc *crtc, bool enable)
>>>    {
>>>        struct msm_vblank_work *vbl_work;
>>>
>>> @@ -180,7 +180,7 @@ static int vblank_ctrl_queue_work(struct msm_drm_private *priv,
>>>
>>>        INIT_WORK(&vbl_work->work, vblank_ctrl_worker);
>>>
>>> -     vbl_work->crtc_id = crtc_id;
>>> +     vbl_work->crtc = crtc;
>>>        vbl_work->enable = enable;
>>>        vbl_work->priv = priv;
>>>
>>> @@ -354,7 +354,8 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>>>        struct msm_drm_private *priv = dev_get_drvdata(dev);
>>>        struct drm_device *ddev;
>>>        struct msm_kms *kms;
>>> -     int ret, i;
>>> +     struct drm_crtc *crtc;
>>> +     int ret;
>>>
>>>        if (drm_firmware_drivers_only())
>>>                return -ENODEV;
>>> @@ -427,20 +428,23 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>>>        ddev->mode_config.funcs = &mode_config_funcs;
>>>        ddev->mode_config.helper_private = &mode_config_helper_funcs;
>>>
>>> -     for (i = 0; i < priv->num_crtcs; i++) {
>>> +     drm_for_each_crtc(crtc, ddev) {
>>> +             struct msm_drm_thread *ev_thread;
>>> +
>>>                /* initialize event thread */
>>> -             priv->event_thread[i].crtc_id = priv->crtcs[i]->base.id;
>>> -             priv->event_thread[i].dev = ddev;
>>> -             priv->event_thread[i].worker = kthread_create_worker(0,
>>> -                     "crtc_event:%d", priv->event_thread[i].crtc_id);
>>> -             if (IS_ERR(priv->event_thread[i].worker)) {
>>> -                     ret = PTR_ERR(priv->event_thread[i].worker);
>>> +             ev_thread = &priv->event_thread[drm_crtc_index(crtc)];
>>> +             ev_thread->crtc = crtc;
>>> +             ev_thread->dev = ddev;
>>> +             ev_thread->worker = kthread_create_worker(0,
>>> +                     "crtc_event:%d", ev_thread->crtc->base.id);
>>
>> Please correct me if wrong.
>>
>> Today, other than just populating the name for the worker is the
>> ev_thread->crtc used anywhere?
>>
>> If so, can we just drop crtc from msm_drm_thread and while creating the
>> worker just use kthread_create_worker(0, "crtc_event:%d", crtc->base.id);
> 
> It seems so. I'll take a look for v2.
> 
> However your questions actually raised another question in my head. I
> went on looking for the reason for such complex vblank handling. It
> was added by Hai Li in the commit 78b1d470d57d ("drm/msm: Enable
> clocks during enable/disable_vblank() callbacks"). However I don't
> fully understand why the code will toggle vblank handling while the
> DPU/MDP5/MDP4 device is not resumed already. Maybe I just missed
> something here. Do you know the story behind the change?
> 
I dont know the history as it pre-dates my work in upstream.
But one use-case I can think of is for command mode panel.

Typically, command mode panel will disable the clocks during idle screen.

Now, if usermode wants to enable vsync, it will crash in the driver.

So driver needs to make sure what whenever hw vsync is toggled on/off, 
the required clocks need to be enabled.
>>
>>> +             if (IS_ERR(ev_thread->worker)) {
>>> +                     ret = PTR_ERR(ev_thread->worker);
>>>                        DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
>>> -                     priv->event_thread[i].worker = NULL;
>>> +                     ev_thread->worker = NULL;
>>>                        goto err_msm_uninit;
>>>                }
>>>
>>> -             sched_set_fifo(priv->event_thread[i].worker->task);
>>> +             sched_set_fifo(ev_thread->worker->task);
>>>        }
>>>
>>>        ret = drm_vblank_init(ddev, priv->num_crtcs);
>>> @@ -563,25 +567,23 @@ static void msm_postclose(struct drm_device *dev, struct drm_file *file)
>>>    int msm_crtc_enable_vblank(struct drm_crtc *crtc)
>>>    {
>>>        struct drm_device *dev = crtc->dev;
>>> -     unsigned int pipe = crtc->index;
>>>        struct msm_drm_private *priv = dev->dev_private;
>>>        struct msm_kms *kms = priv->kms;
>>>        if (!kms)
>>>                return -ENXIO;
>>> -     drm_dbg_vbl(dev, "crtc=%u", pipe);
>>> -     return vblank_ctrl_queue_work(priv, pipe, true);
>>> +     drm_dbg_vbl(dev, "crtc=%u", crtc->base.id);
>>> +     return vblank_ctrl_queue_work(priv, crtc, true);
>>>    }
>>>
>>>    void msm_crtc_disable_vblank(struct drm_crtc *crtc)
>>>    {
>>>        struct drm_device *dev = crtc->dev;
>>> -     unsigned int pipe = crtc->index;
>>>        struct msm_drm_private *priv = dev->dev_private;
>>>        struct msm_kms *kms = priv->kms;
>>>        if (!kms)
>>>                return;
>>> -     drm_dbg_vbl(dev, "crtc=%u", pipe);
>>> -     vblank_ctrl_queue_work(priv, pipe, false);
>>> +     drm_dbg_vbl(dev, "crtc=%u", crtc->base.id);
>>> +     vblank_ctrl_queue_work(priv, crtc, false);
>>>    }
>>>
>>>    /*
>>> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
>>> index 08388d742d65..0e98b6f161df 100644
>>> --- a/drivers/gpu/drm/msm/msm_drv.h
>>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>>> @@ -102,7 +102,7 @@ struct msm_display_topology {
>>>    /* Commit/Event thread specific structure */
>>>    struct msm_drm_thread {
>>>        struct drm_device *dev;
>>> -     unsigned int crtc_id;
>>> +     struct drm_crtc *crtc;
>>>        struct kthread_worker *worker;
>>>    };
>>>
>>> @@ -178,7 +178,6 @@ struct msm_drm_private {
>>>        struct workqueue_struct *wq;
>>>
>>>        unsigned int num_crtcs;
>>> -     struct drm_crtc *crtcs[MAX_CRTCS];
>>>
>>>        struct msm_drm_thread event_thread[MAX_CRTCS];
>>>
> 
> 
> 
