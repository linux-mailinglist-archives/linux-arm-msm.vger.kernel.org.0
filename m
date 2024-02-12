Return-Path: <linux-arm-msm+bounces-10746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38000851F48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 22:13:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A17F71F2187F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 21:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1AB54C61B;
	Mon, 12 Feb 2024 21:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HdZP9eWX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043064C61D
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 21:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707772429; cv=none; b=cR9Yf1JQe6N2KerUVdsC+k8P4VwQ38OmQRNtIbKT6cy1vGSLVi4pzAa0c4E3o0sBI/c/BOTIkkCgGdBynJeIEx0oOHU5lBiVqiWSnYx/EzQTyzdkvnwtexf0ckQ2VuXwwpP8PIuM9xKJZduz/5lZ9fCaCbFIPIVTqQLOwDZqagM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707772429; c=relaxed/simple;
	bh=yePYXFcbifZnkYQ7OR/KZhH52z7oJm+Xl53SUUHgF5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sm8OCVTEu7x+AYRQ+w76GeXrFf8T+xsOjb2TyV2nGG92RkOoK9Dh5hO7QE/fTZKdpUAp0awFrV6gTPodysBW7cXTJCApoksbXu4oOMpsY5ezY5zRRdB5ZTEInIg/G3wXld3R9f5+bYMudxqSQFP7CJD9wrq+AxBsvelsBavGmCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HdZP9eWX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41CJ09e9000678;
	Mon, 12 Feb 2024 21:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=dqVmm3pBAhEns04UFo6H2VS6wl1oYOeegL/1Xdq6Lts=; b=Hd
	ZP9eWX+m9GIeZEedobdjRWIuhs141rg1Zx6OtGVnNf2FAkjuC6QeMPNDYgs8L7AM
	niZOS6ihAGJqdxqtnnv5uXqLBluuMHcznqHhAgLsAX1fzu4PV55Lo4iQ+WVNko1c
	c3xoWEHCsYki9n5iYG7lQZZM8hqnvMvXmkIeh322dgdQzyDHpkZrfyfhZYtNokA0
	SkrkDEi40laylfDCPOvo5XXQO/ySI6pYXTsU4FcC7KfQsqunBr/YUiLW3BYNES9a
	3y2/SW4t/+VsM1IOVld2Gz/8iARn0tqlHduq3+2agOtkzZvk40CTYtnw06IChMz0
	jIXTxCkoPwUFqoeOtxgA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w7ju79880-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 21:13:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41CLDaFE002811
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 21:13:36 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 12 Feb
 2024 13:13:36 -0800
Message-ID: <04df55f1-9430-727b-426b-81d762b3b2e6@quicinc.com>
Date: Mon, 12 Feb 2024 13:13:35 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 19/19] drm/msm/dp: allow YUV420 mode for DP connector
 when CDM available
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-20-quic_parellan@quicinc.com>
 <CAA8EJpq15w_Gjx+rPzN8vBg5Z8PGzABAztqmLpfnafuvNVLmRw@mail.gmail.com>
 <56e521ab-ae57-9296-59a1-0bdbad60f882@quicinc.com>
 <CAA8EJprUeJvL_mP0x19YQCdTbErzy-RRF6GmSOK_eApsRiTALw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJprUeJvL_mP0x19YQCdTbErzy-RRF6GmSOK_eApsRiTALw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: d5nEktbuKIA0eH7fp28CPtbVWIPVcDP7
X-Proofpoint-GUID: d5nEktbuKIA0eH7fp28CPtbVWIPVcDP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_16,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0 phishscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402120164



On 2/10/2024 1:17 PM, Dmitry Baryshkov wrote:
> On Sat, 10 Feb 2024 at 21:19, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 2/10/2024 3:33 AM, Dmitry Baryshkov wrote:
>>> On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>>>>
>>>> All the components of YUV420 over DP are added. Therefore, let's mark the
>>>> connector property as true for DP connector when the DP type is not eDP
>>>> and when there is a CDM block available.
>>>>
>>>> Changes in v2:
>>>>           - Check for if dp_catalog has a CDM block available instead of
>>>>             checking if VSC SDP is allowed when setting the dp connector's
>>>>             ycbcr_420_allowed parameter
>>>>
>>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 +++-
>>>>    drivers/gpu/drm/msm/dp/dp_display.c     | 4 ++--
>>>>    drivers/gpu/drm/msm/dp/dp_drm.c         | 8 ++++++--
>>>>    drivers/gpu/drm/msm/dp/dp_drm.h         | 3 ++-
>>>>    drivers/gpu/drm/msm/msm_drv.h           | 5 +++--
>>>>    5 files changed, 16 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> index 723cc1d821431..beeaabe499abf 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> @@ -565,6 +565,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>>>>    {
>>>>           struct drm_encoder *encoder = NULL;
>>>>           struct msm_display_info info;
>>>> +       bool yuv_supported;
>>>>           int rc;
>>>>           int i;
>>>>
>>>> @@ -583,7 +584,8 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>>>>                           return PTR_ERR(encoder);
>>>>                   }
>>>>
>>>> -               rc = msm_dp_modeset_init(priv->dp[i], dev, encoder);
>>>> +               yuv_supported = !!(dpu_kms->catalog->cdm);
>>>
>>> Drop parentheses please.
>>>
>>>> +               rc = msm_dp_modeset_init(priv->dp[i], dev, encoder, yuv_supported);
>>>>                   if (rc) {
>>>>                           DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
>>>>                           return rc;
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> index ebcc76ef1d590..9b9f5f2921903 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> @@ -1471,7 +1471,7 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
>>>>    }
>>>>
>>>>    int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>>>> -                       struct drm_encoder *encoder)
>>>> +                       struct drm_encoder *encoder, bool yuv_supported)
>>>>    {
>>>>           struct dp_display_private *dp_priv;
>>>>           int ret;
>>>> @@ -1487,7 +1487,7 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>>>>                   return ret;
>>>>           }
>>>>
>>>> -       dp_display->connector = dp_drm_connector_init(dp_display, encoder);
>>>> +       dp_display->connector = dp_drm_connector_init(dp_display, encoder, yuv_supported);
>>>>           if (IS_ERR(dp_display->connector)) {
>>>>                   ret = PTR_ERR(dp_display->connector);
>>>>                   DRM_DEV_ERROR(dev->dev,
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
>>>> index 46e6889037e88..ab0d0d13b5e2c 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
>>>> @@ -353,7 +353,8 @@ int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
>>>>    }
>>>>
>>>>    /* connector initialization */
>>>> -struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
>>>> +struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder,
>>>> +                                           bool yuv_supported)
>>>>    {
>>>>           struct drm_connector *connector = NULL;
>>>>
>>>> @@ -361,8 +362,11 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct dr
>>>>           if (IS_ERR(connector))
>>>>                   return connector;
>>>>
>>>> -       if (!dp_display->is_edp)
>>>> +       if (!dp_display->is_edp) {
>>>>                   drm_connector_attach_dp_subconnector_property(connector);
>>>> +               if (yuv_supported)
>>>> +                       connector->ycbcr_420_allowed = true;
>>>
>>> Is there any reason to disallow YUV420 for eDP connectors?
>>>
>>>> +       }
>>>>
>>
>> Major reason was certainly validation but thinking about it more
>> closely, I need to check whether CDM over eDP is even possible.
>>
>> Historically, CDM could output only to HDMI OR WB using the bit we
>> program while setting up CDM and the same HDMI path is being used by DP
>> as well. But I need to check whether CDM can even output to eDP with the
>> same DP path. I dont have any documentation on this part yet.
> 
> I had the feeling that the DP / eDP difference on the chips is mostly
> on the PHY and software side. So I assumed that it should be possible
> to output YUV data to the eDP port in the same way as it is done for
> the DP port.
> 

This is true. I was not worried about DP / eDP controller but mostly 
whether eDP spec really allows YUV. From what I can read, it does.

So this check shall remain only because CDM has not been validated with eDP.

Do you need a TODO here and if we ever get a eDP panel which supports 
that, we can validate and relax this.

