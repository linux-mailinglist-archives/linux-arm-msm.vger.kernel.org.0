Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 877307BEC46
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 23:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377975AbjJIVFL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 17:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378207AbjJIVFI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 17:05:08 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46C599E
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 14:05:04 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 399L0CKE001360;
        Mon, 9 Oct 2023 21:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ChMcju+pTifVyziqoNB0tRDKzIbAvwByZj4c6UGk4Qk=;
 b=joPsYxsgbl+Hanz95iRRL83pNE/Lhmj8KNy4O4IMkjDmuzslfEDKGUhskJK14vu80gCK
 elQ5yqNpXZDXVMd7BKrVOlZuzu2U0IIy2HwDiEj2xczO8htRHDym++GaCTbbCxQx/wXl
 GlMKjp1oKZv1WUv881UDJOH0MD4tHnlin5W7nIEgIglEJ7/yblayynwW9k7M9Y3vI9yw
 cgpB+r+4IjeYo4wJS1Efux2XiKm+b2PLkFRAwgjD6jqDvKUqDlZO2igPd45uKEDvS+1M
 vyt/aZfyNVbPzIrWNv91tsZho9Eh2/dRUurJGhOdWb7XhML61To7GCTt6riLxVNOsVHl Qw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tkhx2kf4d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Oct 2023 21:04:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 399L4qFR029232
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 9 Oct 2023 21:04:52 GMT
Received: from [10.110.90.239] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 9 Oct
 2023 14:04:52 -0700
Message-ID: <836a86ea-4a91-c649-fd3d-a9848eb8ecae@quicinc.com>
Date:   Mon, 9 Oct 2023 14:04:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH v2 02/13] drm/msm/hdmi: switch to
 devm_drm_bridge_add()
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC:     <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
 <20231009181040.2743847-3-dmitry.baryshkov@linaro.org>
 <d56daed9-35ac-0ee3-a0b4-f8596b0490fc@quicinc.com>
 <aafb04ea-fde3-4c1b-aae4-5e7e50a945d6@linaro.org>
 <8ef34ba0-f30a-45b0-991e-0a7eb573956d@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <8ef34ba0-f30a-45b0-991e-0a7eb573956d@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: awhEC9PUCDlYHrPFusMd7QQ71VObzRdU
X-Proofpoint-ORIG-GUID: awhEC9PUCDlYHrPFusMd7QQ71VObzRdU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_19,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=853
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310090168
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/9/2023 1:53 PM, Dmitry Baryshkov wrote:
> On 09/10/2023 22:21, Dmitry Baryshkov wrote:
>> On 09/10/2023 22:19, Abhinav Kumar wrote:
>>>
>>>
>>> On 10/9/2023 11:10 AM, Dmitry Baryshkov wrote:
>>>> Make MSM HDMI driver use devm_drm_bridge_add() instead of plain
>>>> drm_bridge_add(). As the driver doesn't require any additional cleanup,
>>>> stop adding created bridge to the priv->bridges array.
>>>>
>>>> Reviewed-by: Rob Clark <robdclark@gmail.com>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>   drivers/gpu/drm/msm/hdmi/hdmi.c        | 22 +++++--------------
>>>>   drivers/gpu/drm/msm/hdmi/hdmi.h        |  5 ++---
>>>>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 30 
>>>> ++++++++------------------
>>>>   drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    |  3 +--
>>>>   4 files changed, 17 insertions(+), 43 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c 
>>>> b/drivers/gpu/drm/msm/hdmi/hdmi.c
>>>> index b6bcb9f675fe..c8ebd75176bb 100644
>>>> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
>>>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
>>>> @@ -160,24 +160,16 @@ static int msm_hdmi_init(struct hdmi *hdmi)
>>>>   int msm_hdmi_modeset_init(struct hdmi *hdmi,
>>>>           struct drm_device *dev, struct drm_encoder *encoder)
>>>>   {
>>>> -    struct msm_drm_private *priv = dev->dev_private;
>>>>       int ret;
>>>> -    if (priv->num_bridges == ARRAY_SIZE(priv->bridges)) {
>>>> -        DRM_DEV_ERROR(dev->dev, "too many bridges\n");
>>>> -        return -ENOSPC;
>>>> -    }
>>>> -
>>>>       hdmi->dev = dev;
>>>>       hdmi->encoder = encoder;
>>>>       hdmi_audio_infoframe_init(&hdmi->audio.infoframe);
>>>> -    hdmi->bridge = msm_hdmi_bridge_init(hdmi);
>>>> -    if (IS_ERR(hdmi->bridge)) {
>>>> -        ret = PTR_ERR(hdmi->bridge);
>>>> +    ret = msm_hdmi_bridge_init(hdmi);
>>>> +    if (ret) {
>>>>           DRM_DEV_ERROR(dev->dev, "failed to create HDMI bridge: 
>>>> %d\n", ret);
>>>> -        hdmi->bridge = NULL;
>>>>           goto fail;
>>>>       }
>>>> @@ -215,16 +207,9 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>>>>           goto fail;
>>>>       }
>>>> -    priv->bridges[priv->num_bridges++]       = hdmi->bridge;
>>>> -
>>>>       return 0;
>>>>   fail:
>>>> -    /* bridge is normally destroyed by drm: */
>>>> -    if (hdmi->bridge) {
>>>> -        msm_hdmi_bridge_destroy(hdmi->bridge);
>>>> -        hdmi->bridge = NULL;
>>>> -    }
>>>>       if (hdmi->connector) {
>>>>           hdmi->connector->funcs->destroy(hdmi->connector);
>>>>           hdmi->connector = NULL;
>>>> @@ -395,6 +380,9 @@ static void msm_hdmi_unbind(struct device *dev, 
>>>> struct device *master,
>>>>           if (priv->hdmi->audio_pdev)
>>>>               platform_device_unregister(priv->hdmi->audio_pdev);
>>>> +        if (priv->hdmi->bridge)
>>>> +            msm_hdmi_hpd_disable(priv->hdmi);
>>>> +
>>>
>>> Now is this the only place where hdmi->bridge is used?
>>>
>>> Why cant we just keep msm_hdmi_hpd_disable(priv->hdmi) here since its 
>>> anyway protected by if (priv->hdmi) and drop hdmi->bridge completely?
>>
>> Sure, sounds like a good idea, same followup as for the DSI.
> 
> I was wrong here. hdmi::bridge is used by the driver (e.g. for HPD 
> reporting).
> 

hmmm, I thought HPD module uses hdmi_bridge->hdmi. here we are talking 
about hdmi->bridge?
