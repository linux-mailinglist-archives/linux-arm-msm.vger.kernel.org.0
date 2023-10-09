Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 082C87BEA60
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 21:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346678AbjJITMH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 15:12:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346674AbjJITMH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 15:12:07 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74E9E9D
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 12:12:04 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 399Eiw7T022325;
        Mon, 9 Oct 2023 19:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Mk653FfIz83lZh4Fuqk7CbWHloUi71UDy/ahDd55its=;
 b=BpBZq77C/aWuzVyI91HqbAqlKsvtJLmg36APWX3t0ewLPaThhg2jlhPsIt0L6kdgtDtR
 Pb40DSAVw1ZxRaMqv4Nce8i/a+dSW5WPDJoC8OTKpaMG/vafjJur2Dwh6ahvDLfBcta/
 o7iWQEw0r8DS3DYpIz9B/2FKvmBtVym0ub5UrF7dO1ckmJsG+LlfSlVkklkCGx30JK3M
 /jQ7gf4MWZwfI44WBCDxRRw+Z7C0hhtUNKsZRS+51yjDAWhwD3WxTgII5VmEEcY7K3di
 zq+/6gf2I89N2XvjmiEwQWMOzZ0e5XDFPHKntt94Lc5a8rV84K3zquqQWSg7cnDgR28Y zw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tkhx2k912-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Oct 2023 19:11:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 399JBMj4031782
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 9 Oct 2023 19:11:22 GMT
Received: from [10.110.90.239] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 9 Oct
 2023 12:11:21 -0700
Message-ID: <8024e65c-1ad3-9c8d-c786-9f0421292c46@quicinc.com>
Date:   Mon, 9 Oct 2023 12:11:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 01/13] drm/msm/dsi: switch to devm_drm_bridge_add()
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
 <20231009181040.2743847-2-dmitry.baryshkov@linaro.org>
 <9cd7fcd1-19c3-ed9b-568d-4b67b3649e86@quicinc.com>
 <0b201558-d794-4675-a20f-58d00a8b1a53@linaro.org>
 <e3208975-84cb-5c44-2397-c6b31103659b@quicinc.com>
 <015b688e-836f-4cdb-a139-ed7ceb1489ef@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <015b688e-836f-4cdb-a139-ed7ceb1489ef@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: J7qM-JkP9Ju2dUoaEcqef56N0AMnRJHX
X-Proofpoint-ORIG-GUID: J7qM-JkP9Ju2dUoaEcqef56N0AMnRJHX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_17,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310090157
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/9/2023 12:01 PM, Dmitry Baryshkov wrote:
> On 09/10/2023 21:51, Abhinav Kumar wrote:
>>
>>
>> On 10/9/2023 11:46 AM, Dmitry Baryshkov wrote:
>>> On 09/10/2023 21:39, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 10/9/2023 11:10 AM, Dmitry Baryshkov wrote:
>>>>> Make MSM DSI driver use devm_drm_bridge_add() instead of plain
>>>>> drm_bridge_add(). As the driver doesn't require any additional 
>>>>> cleanup,
>>>>> stop adding created bridge to the priv->bridges array.
>>>>>
>>>>> Reviewed-by: Rob Clark <robdclark@gmail.com>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>   drivers/gpu/drm/msm/dsi/dsi.c         | 28 +++++--------------------
>>>>>   drivers/gpu/drm/msm/dsi/dsi.h         |  3 +--
>>>>>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 30 
>>>>> +++++++++------------------
>>>>>   3 files changed, 16 insertions(+), 45 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c 
>>>>> b/drivers/gpu/drm/msm/dsi/dsi.c
>>>>> index d45e43024802..47f327e68471 100644
>>>>> --- a/drivers/gpu/drm/msm/dsi/dsi.c
>>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
>>>>> @@ -215,20 +215,14 @@ void __exit msm_dsi_unregister(void)
>>>>>   int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct 
>>>>> drm_device *dev,
>>>>>                struct drm_encoder *encoder)
>>>>>   {
>>>>> -    struct msm_drm_private *priv = dev->dev_private;
>>>>>       int ret;
>>>>> -    if (priv->num_bridges == ARRAY_SIZE(priv->bridges)) {
>>>>> -        DRM_DEV_ERROR(dev->dev, "too many bridges\n");
>>>>> -        return -ENOSPC;
>>>>> -    }
>>>>> -
>>>>>       msm_dsi->dev = dev;
>>>>>       ret = msm_dsi_host_modeset_init(msm_dsi->host, dev);
>>>>>       if (ret) {
>>>>>           DRM_DEV_ERROR(dev->dev, "failed to modeset init host: 
>>>>> %d\n", ret);
>>>>> -        goto fail;
>>>>> +        return ret;
>>>>>       }
>>>>>       if (msm_dsi_is_bonded_dsi(msm_dsi) &&
>>>>> @@ -242,32 +236,20 @@ int msm_dsi_modeset_init(struct msm_dsi 
>>>>> *msm_dsi, struct drm_device *dev,
>>>>>       msm_dsi->encoder = encoder;
>>>>> -    msm_dsi->bridge = msm_dsi_manager_bridge_init(msm_dsi->id);
>>>>> -    if (IS_ERR(msm_dsi->bridge)) {
>>>>> -        ret = PTR_ERR(msm_dsi->bridge);
>>>>> +    ret = msm_dsi_manager_bridge_init(msm_dsi);
>>>>> +    if (ret) {
>>>>>           DRM_DEV_ERROR(dev->dev, "failed to create dsi bridge: 
>>>>> %d\n", ret);
>>>>> -        msm_dsi->bridge = NULL;
>>>>> -        goto fail;
>>>>> +        return ret;
>>>>>       }
>>>>>       ret = msm_dsi_manager_ext_bridge_init(msm_dsi->id);
>>>>>       if (ret) {
>>>>>           DRM_DEV_ERROR(dev->dev,
>>>>>               "failed to create dsi connector: %d\n", ret);
>>>>> -        goto fail;
>>>>> +        return ret;
>>>>>       }
>>>>> -    priv->bridges[priv->num_bridges++]       = msm_dsi->bridge;
>>>>> -
>>>>>       return 0;
>>>>> -fail:
>>>>> -    /* bridge/connector are normally destroyed by drm: */
>>>>> -    if (msm_dsi->bridge) {
>>>>> -        msm_dsi_manager_bridge_destroy(msm_dsi->bridge);
>>>>> -        msm_dsi->bridge = NULL;
>>>>> -    }
>>>>
>>>> We can drop msm_dsi_manager_bridge_destroy() now but dont we need to 
>>>> keep the part to reset msm_dsi->bridge to NULL in the fail tag if 
>>>> msm_dsi_manager_ext_bridge_init() fails?
>>>
>>> What for? This field is not read in the error /unbinding path.
>>> I'll send a followup that drops msm_dsi->bridge completely.
>>>
>>
>> Not used in the error path. The behavior before this patch was, if 
>> msm_dsi_manager_ext_bridge_init failed, it was marking msm_dsi->bridge 
>> as NULL. Thats what I thought you would want to retain till you drop 
>> the msm_dsi->bridge.
> 
> Why would you like to keep the useless behaviour?
> 

Not sure whether to call it useless. So 
msm_dsi_manager_ext_bridge_init() is referencing msm_dsi->bridge.
msm_dsi_manager_ext_bridge_init() is an exported API. If someone tries 
to call it outside of where its called now, this was the only protection 
against the access?

I guess, you could counter argue that noone calls it that way today.

In that sense, I am fine with this, just wanted to report the gap after 
this patch before I ack.

>> OR you can even add that line in the if (ret) of 
>> msm_dsi_manager_ext_bridge_init(msm_dsi->id); failure.
>>
>>>>
>>>>> -
>>>>> -    return ret;
>>>>>   }
>>>>>   void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct 
>>>>> msm_dsi *msm_dsi)
>>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
>>>>> b/drivers/gpu/drm/msm/dsi/dsi.h
>>>>> index d21867da78b8..a01c326774a6 100644
>>>>> --- a/drivers/gpu/drm/msm/dsi/dsi.h
>>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
>>>>> @@ -56,8 +56,7 @@ struct msm_dsi {
>>>>>   };
>>>>>   /* dsi manager */
>>>>> -struct drm_bridge *msm_dsi_manager_bridge_init(u8 id);
>>>>> -void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge);
>>>>> +int msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi);
>>>>>   int msm_dsi_manager_ext_bridge_init(u8 id);
>>>>>   int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg 
>>>>> *msg);
>>>>>   bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 
>>>>> len);
>>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c 
>>>>> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>>>> index 28b8012a21f2..17aa19bb6510 100644
>>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>>>> @@ -466,9 +466,8 @@ static const struct drm_bridge_funcs 
>>>>> dsi_mgr_bridge_funcs = {
>>>>>   };
>>>>>   /* initialize bridge */
>>>>> -struct drm_bridge *msm_dsi_manager_bridge_init(u8 id)
>>>>> +int msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi)
>>>>>   {
>>>>> -    struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>>>>       struct drm_bridge *bridge = NULL;
>>>>>       struct dsi_bridge *dsi_bridge;
>>>>>       struct drm_encoder *encoder;
>>>>> @@ -476,31 +475,27 @@ struct drm_bridge 
>>>>> *msm_dsi_manager_bridge_init(u8 id)
>>>>>       dsi_bridge = devm_kzalloc(msm_dsi->dev->dev,
>>>>>                   sizeof(*dsi_bridge), GFP_KERNEL);
>>>>> -    if (!dsi_bridge) {
>>>>> -        ret = -ENOMEM;
>>>>> -        goto fail;
>>>>> -    }
>>>>> +    if (!dsi_bridge)
>>>>> +        return -ENOMEM;
>>>>> -    dsi_bridge->id = id;
>>>>> +    dsi_bridge->id = msm_dsi->id;
>>>>>       encoder = msm_dsi->encoder;
>>>>>       bridge = &dsi_bridge->base;
>>>>>       bridge->funcs = &dsi_mgr_bridge_funcs;
>>>>> -    drm_bridge_add(bridge);
>>>>> +    ret = devm_drm_bridge_add(&msm_dsi->pdev->dev, bridge);
>>>>> +    if (ret)
>>>>> +        return ret;
>>>>>       ret = drm_bridge_attach(encoder, bridge, NULL, 0);
>>>>>       if (ret)
>>>>> -        goto fail;
>>>>> +        return ret;
>>>>> -    return bridge;
>>>>> +    msm_dsi->bridge = bridge;
>>>>> -fail:
>>>>> -    if (bridge)
>>>>> -        msm_dsi_manager_bridge_destroy(bridge);
>>>>> -
>>>>> -    return ERR_PTR(ret);
>>>>> +    return 0;
>>>>>   }
>>>>>   int msm_dsi_manager_ext_bridge_init(u8 id)
>>>>> @@ -557,11 +552,6 @@ int msm_dsi_manager_ext_bridge_init(u8 id)
>>>>>       return 0;
>>>>>   }
>>>>> -void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge)
>>>>> -{
>>>>> -    drm_bridge_remove(bridge);
>>>>> -}
>>>>> -
>>>>>   int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg)
>>>>>   {
>>>>>       struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>>
> 
