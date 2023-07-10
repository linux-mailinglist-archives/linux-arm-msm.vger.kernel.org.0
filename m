Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6D6974DAF5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jul 2023 18:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbjGJQWr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jul 2023 12:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbjGJQWq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jul 2023 12:22:46 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBE26106;
        Mon, 10 Jul 2023 09:22:44 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36A9ndEF026772;
        Mon, 10 Jul 2023 16:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=5f0NyYcp18N4xEc2s8J7ha/uXezZRB+laAE2NRY6SUU=;
 b=a5OwDYiZvgy9Ev/julQxQp40lGkEDzIj3uKEgePJXuNEIhf6yP1t2Rw9A59N2vMKzlRZ
 k1qjuMz+qV+fYasWF7DQdCReuE2i+kze3tImVXGQOKZ4IGcou8IxgC+mhoM6QSFB3OJx
 BOocn8Y0EwP4RT87pd6lZjyNm0i65cVEbVwSG2hM/YTx6gAMuw8TQVGkB2hsuzaCezLn
 oXLb/0F4hvtEQa4zQPebtX5/CLoKplhEbJgkM79kz1/uIB7xlXrRZpYpQkgasEAI+08Z
 artLo4yFTGFI7xCOXu4Q1ny/c1vpyXPVlUXtcT1wnJCCWldh1VmIasRQHgytlKiEXuqC 4Q== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rpwgm4brw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Jul 2023 16:22:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36AGMWUm006911
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Jul 2023 16:22:32 GMT
Received: from [10.110.55.196] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 10 Jul
 2023 09:22:30 -0700
Message-ID: <0ac305d2-d0a9-cdfb-9be8-243402d865e7@quicinc.com>
Date:   Mon, 10 Jul 2023 09:22:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 2/5] drm/msm/dp: incorporate pm_runtime framework into
 DP driver
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>
CC:     <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
        <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
        <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <quic_abhinavk@quicinc.com>, <quic_jesszhan@quicinc.com>,
        <quic_sbillaka@quicinc.com>, <marijn.suijten@somainline.org>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1688773943-3887-1-git-send-email-quic_khsieh@quicinc.com>
 <1688773943-3887-3-git-send-email-quic_khsieh@quicinc.com>
 <oc6cohs6pbiuyirdxgepoharuzdra2hzy3kwfqjmdfcq36y367@ah3bal2jqncb>
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <oc6cohs6pbiuyirdxgepoharuzdra2hzy3kwfqjmdfcq36y367@ah3bal2jqncb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xMf6-iS4GFBdz_RW8pGQidPD_UQtYbhA
X-Proofpoint-ORIG-GUID: xMf6-iS4GFBdz_RW8pGQidPD_UQtYbhA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-10_12,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307100148
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/8/2023 7:52 PM, Bjorn Andersson wrote:
> On Fri, Jul 07, 2023 at 04:52:20PM -0700, Kuogee Hsieh wrote:
>> Incorporating pm runtime framework into DP driver so that power
>> and clock resource handling can be centralized allowing easier
>> control of these resources in preparation of registering aux bus
>> uring probe.
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_aux.c     |  3 ++
>>   drivers/gpu/drm/msm/dp/dp_display.c | 75 +++++++++++++++++++++++++++++--------
>>   2 files changed, 63 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
>> index 8e3b677..c592064 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
>> @@ -291,6 +291,7 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>>   		return -EINVAL;
>>   	}
>>   
>> +	pm_runtime_get_sync(dp_aux->dev);
>>   	mutex_lock(&aux->mutex);
>>   	if (!aux->initted) {
>>   		ret = -EIO;
>> @@ -364,6 +365,8 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>>   
>>   exit:
>>   	mutex_unlock(&aux->mutex);
>> +	pm_runtime_mark_last_busy(dp_aux->dev);
>> +	pm_runtime_put_autosuspend(dp_aux->dev);
>>   
>>   	return ret;
>>   }
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 76f1395..2c5706a 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -309,6 +309,10 @@ static int dp_display_bind(struct device *dev, struct device *master,
>>   		goto end;
>>   	}
>>   
>> +	pm_runtime_enable(dev);
>> +	pm_runtime_set_autosuspend_delay(dev, 1000);
>> +	pm_runtime_use_autosuspend(dev);
>> +
>>   	return 0;
>>   end:
>>   	return rc;
>> @@ -320,9 +324,8 @@ static void dp_display_unbind(struct device *dev, struct device *master,
>>   	struct dp_display_private *dp = dev_get_dp_display_private(dev);
>>   	struct msm_drm_private *priv = dev_get_drvdata(master);
>>   
>> -	/* disable all HPD interrupts */
>> -	if (dp->core_initialized)
>> -		dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, false);
>> +	pm_runtime_dont_use_autosuspend(dev);
>> +	pm_runtime_disable(dev);
>>   
>>   	kthread_stop(dp->ev_tsk);
>>   
>> @@ -466,10 +469,12 @@ static void dp_display_host_init(struct dp_display_private *dp)
>>   		dp->dp_display.connector_type, dp->core_initialized,
>>   		dp->phy_initialized);
>>   
>> -	dp_power_init(dp->power);
>> -	dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
>> -	dp_aux_init(dp->aux);
>> -	dp->core_initialized = true;
>> +	if (!dp->core_initialized) {
>> +		dp_power_init(dp->power);
>> +		dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
>> +		dp_aux_init(dp->aux);
>> +		dp->core_initialized = true;
> There are two cases that queries core_initialized, both of those are
> done to avoid accessing the DP block without it first being powered up.
> With the introduction of runtime PM, it seems reasonable to just power
> up the block in those two code paths (and remove the variable).
>
>> +	}
>>   }
>>   
>>   static void dp_display_host_deinit(struct dp_display_private *dp)
>> @@ -478,10 +483,12 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
>>   		dp->dp_display.connector_type, dp->core_initialized,
>>   		dp->phy_initialized);
>>   
>> -	dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
>> -	dp_aux_deinit(dp->aux);
>> -	dp_power_deinit(dp->power);
>> -	dp->core_initialized = false;
>> +	if (dp->core_initialized) {
>> +		dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
>> +		dp_aux_deinit(dp->aux);
>> +		dp_power_deinit(dp->power);
>> +		dp->core_initialized = false;
>> +	}
>>   }
>>   
>>   static int dp_display_usbpd_configure_cb(struct device *dev)
>> @@ -1304,6 +1311,39 @@ static int dp_display_remove(struct platform_device *pdev)
>>   	dp_display_deinit_sub_modules(dp);
>>   
>>   	platform_set_drvdata(pdev, NULL);
>> +	pm_runtime_put_sync_suspend(&pdev->dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static int dp_pm_runtime_suspend(struct device *dev)
>> +{
>> +	struct platform_device *pdev = to_platform_device(dev);
>> +	struct msm_dp *dp_display = platform_get_drvdata(pdev);
> platform_get_drvdata() is a wrapper for dev_get_drvdata(&pdev->dev), so
> there's no need to resolve the platform_device first...
>
>> +	struct dp_display_private *dp;
>> +
>> +	dp = container_of(dp_display, struct dp_display_private, dp_display);
>> +
>> +	dp_display_host_phy_exit(dp);
>> +	dp_catalog_ctrl_hpd_enable(dp->catalog);
>> +	dp_display_host_deinit(dp);
>> +
>> +	return 0;
>> +}
>> +
>> +static int dp_pm_runtime_resume(struct device *dev)
>> +{
>> +	struct platform_device *pdev = to_platform_device(dev);
>> +	struct msm_dp *dp_display = platform_get_drvdata(pdev);
>> +	struct dp_display_private *dp;
>> +
>> +	dp = container_of(dp_display, struct dp_display_private, dp_display);
>> +
>> +	dp_display_host_init(dp);
>> +	if (dp_display->is_edp) {
>> +		dp_catalog_ctrl_hpd_enable(dp->catalog);
>> +		dp_display_host_phy_init(dp);
>> +	}
>>   
>>   	return 0;
>>   }
>> @@ -1409,6 +1449,7 @@ static int dp_pm_suspend(struct device *dev)
>>   }
>>   
>>   static const struct dev_pm_ops dp_pm_ops = {
>> +	SET_RUNTIME_PM_OPS(dp_pm_runtime_suspend, dp_pm_runtime_resume, NULL)
>>   	.suspend = dp_pm_suspend,
>>   	.resume =  dp_pm_resume,
>>   };
>> @@ -1493,10 +1534,6 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
>>   	aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
>>   
>>   	if (aux_bus && dp->is_edp) {
>> -		dp_display_host_init(dp_priv);
>> -		dp_catalog_ctrl_hpd_enable(dp_priv->catalog);
>> -		dp_display_host_phy_init(dp_priv);
> I'm probably just missing it, but how do we get here with the host
> powered up and the phy initialized?

if (!dp->core_initialized)  is at dp_display_host_init()

>
>> -
>>   		/*
>>   		 * The code below assumes that the panel will finish probing
>>   		 * by the time devm_of_dp_aux_populate_ep_devices() returns.
>> @@ -1604,6 +1641,7 @@ void dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>>   		dp_hpd_plug_handle(dp_display, 0);
>>   
>>   	mutex_lock(&dp_display->event_mutex);
>> +	pm_runtime_get_sync(&dp_display->pdev->dev);
>>   
>>   	state = dp_display->hpd_state;
>>   	if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) {
>> @@ -1684,6 +1722,8 @@ void dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>>   	}
>>   
>>   	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
>> +
>> +	pm_runtime_put_sync(&dp_display->pdev->dev);
>>   	mutex_unlock(&dp_display->event_mutex);
>>   }
>>   
>> @@ -1723,6 +1763,8 @@ void dp_bridge_hpd_enable(struct drm_bridge *bridge)
>>   	struct dp_display_private *dp = container_of(dp_display, struct dp_display_private, dp_display);
>>   
>>   	mutex_lock(&dp->event_mutex);
>> +	pm_runtime_get_sync(&dp->pdev->dev);
>> +
>>   	dp_catalog_ctrl_hpd_enable(dp->catalog);
>>   
>>   	/* enable HDP interrupts */
>> @@ -1744,6 +1786,9 @@ void dp_bridge_hpd_disable(struct drm_bridge *bridge)
>>   	dp_catalog_ctrl_hpd_disable(dp->catalog);
>>   
>>   	dp_display->internal_hpd = false;
>> +
>> +	pm_runtime_mark_last_busy(&dp->pdev->dev);
>> +	pm_runtime_put_autosuspend(&dp->pdev->dev);
>>   	mutex_unlock(&dp->event_mutex);
>>   }
> The runtime_get/put in dp_bridge_hpd_enable() and disable matches my
> expectations. But in the case that we have an external HPD source, where
> will the power be turned on?
>
> Note that you can test this on your device by routing the HPD GPIO to a
> display-connector instance and wiring this to the DP node. In the same
> way it's done here:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/sa8295p-adp.dts#n28
>
> Regards,
> Bjorn
>
>>   
>> -- 
>> 2.7.4
>>
