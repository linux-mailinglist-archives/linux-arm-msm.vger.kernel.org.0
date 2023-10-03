Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E37B37B6ECE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Oct 2023 18:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbjJCQoW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Oct 2023 12:44:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230207AbjJCQoU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Oct 2023 12:44:20 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CAB49E;
        Tue,  3 Oct 2023 09:44:17 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 393E0d8V010510;
        Tue, 3 Oct 2023 16:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=M3EgibbGHl0JH+WCJCAweVGyoXe1yl9zM3upiIVq4Ko=;
 b=fpiNDDNf2s9mXq7LS8sRhASOQoVClpk8yvqMdzeEQW3VTW3OKK0lzBs96a204EfZFH+j
 IHRxfem/s5OLI8YNwlOe3N2DfedqSZq6WMZm7xEH3QTABw+C6eBuR61LcZPdd8yXnOCr
 tVkqp85MZ0BBdLdrJsr5nYW/8LCvVikhaJbCGfQ0kNhjH0RWND0sIn+dh1DNqOJvsr7y
 LVgVJcBMCvDdPVsDjYEBOOSAG62fMKQKDxhweFXA34BGgfCV3etmfsq8UyiefS3PXlCC
 0HCcBerHK09IrAKov47aEQBlPgaDfy62ftVFEXjbm/aFyaTLm4q5tJ+c/CGSRpm365dF /w== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tgaw5hmwm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 03 Oct 2023 16:44:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 393Ghw9K029764
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 3 Oct 2023 16:43:58 GMT
Received: from [10.110.36.217] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 3 Oct
 2023 09:43:57 -0700
Message-ID: <e72ae247-459d-9f23-0583-ce6da1a30336@quicinc.com>
Date:   Tue, 3 Oct 2023 09:43:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 7/8] drm/msm/dp: add
 pm_runtime_force_suspend()/resume()
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
        <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <quic_abhinavk@quicinc.com>, <quic_jesszhan@quicinc.com>,
        <quic_sbillaka@quicinc.com>, <marijn.suijten@somainline.org>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1695848028-18023-1-git-send-email-quic_khsieh@quicinc.com>
 <1695848028-18023-8-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpor3WEYmN=hQJQPFyjZGdr4j8F-XAB=2BDVRFCTNioEiA@mail.gmail.com>
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJpor3WEYmN=hQJQPFyjZGdr4j8F-XAB=2BDVRFCTNioEiA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CVmUA8p3xgoxXVsAwGnwwaugMs5z2RGd
X-Proofpoint-GUID: CVmUA8p3xgoxXVsAwGnwwaugMs5z2RGd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-03_13,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310030125
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/27/2023 3:00 PM, Dmitry Baryshkov wrote:
> On Wed, 27 Sept 2023 at 23:54, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>> After incorporated pm_runtime framework into eDP/DP driver, the
> incorporating
>
>
>> original dp_pm_suspend() to handle power off both DP phy and
>> controller during suspend and dp_pm_resume() to handle power on
>> both DP phy and controller during resume are not necessary since
>> those function are replaced by dp_pm_runtime_suspend() and
>> dp_pm_runtime_resume() through pm runtime framework.
>> Therefore add pm framework provides functions,
>> pm_runtime_force_suspend()/resume() to complete incorporating pm
>> runtime framework into DP driver.
>>
>> Changes in v4:
>> -- drop both dp_pm_prepare() and dp_pm_compete() from this change
>> -- delete ST_SUSPENDED state
>> -- rewording commit text to add more details regrading the purpose
>>     of this change
>>
>> Changes in v3:
>> -- replace dp_pm_suspend() with pm_runtime_force_suspend()
>> -- replace dp_pm_resume() with pm_runtime_force_resume()
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 113 ++----------------------------------
>>   1 file changed, 5 insertions(+), 108 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 9158a2c..711d262 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -49,7 +49,6 @@ enum {
>>          ST_CONNECTED,
>>          ST_DISCONNECT_PENDING,
>>          ST_DISPLAY_OFF,
>> -       ST_SUSPENDED,
>>   };
>>
>>   enum {
>> @@ -560,7 +559,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>>          drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
>>                          dp->dp_display.connector_type, state);
>>
>> -       if (state == ST_DISPLAY_OFF || state == ST_SUSPENDED) {
>> +       if (state == ST_DISPLAY_OFF) {
>>                  mutex_unlock(&dp->event_mutex);
>>                  return 0;
>>          }
>> @@ -674,7 +673,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
>>          drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
>>                          dp->dp_display.connector_type, state);
>>
>> -       if (state == ST_DISPLAY_OFF || state == ST_SUSPENDED) {
>> +       if (state == ST_DISPLAY_OFF) {
>>                  mutex_unlock(&dp->event_mutex);
>>                  return 0;
>>          }
>> @@ -1321,110 +1320,10 @@ static int dp_pm_runtime_resume(struct device *dev)
>>          return 0;
>>   }
>>
>> -static int dp_pm_resume(struct device *dev)
>> -{
>> -       struct platform_device *pdev = to_platform_device(dev);
>> -       struct msm_dp *dp_display = platform_get_drvdata(pdev);
>> -       struct dp_display_private *dp;
>> -       int sink_count = 0;
>> -
>> -       dp = container_of(dp_display, struct dp_display_private, dp_display);
>> -
>> -       mutex_lock(&dp->event_mutex);
>> -
>> -       drm_dbg_dp(dp->drm_dev,
>> -               "Before, type=%d core_inited=%d phy_inited=%d power_on=%d\n",
>> -               dp->dp_display.connector_type, dp->core_initialized,
>> -               dp->phy_initialized, dp_display->power_on);
>> -
>> -       /* start from disconnected state */
>> -       dp->hpd_state = ST_DISCONNECTED;
>> -
>> -       /* turn on dp ctrl/phy */
>> -       dp_display_host_init(dp);
>> -
>> -       if (dp_display->is_edp)
>> -               dp_catalog_ctrl_hpd_enable(dp->catalog);
>> -
>> -       if (dp_catalog_link_is_connected(dp->catalog)) {
>> -               /*
>> -                * set sink to normal operation mode -- D0
>> -                * before dpcd read
>> -                */
>> -               dp_display_host_phy_init(dp);
>> -               dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>> -               sink_count = drm_dp_read_sink_count(dp->aux);
>> -               if (sink_count < 0)
>> -                       sink_count = 0;
>> -
>> -               dp_display_host_phy_exit(dp);
>> -       }
>> -
>> -       dp->link->sink_count = sink_count;
>> -       /*
>> -        * can not declared display is connected unless
>> -        * HDMI cable is plugged in and sink_count of
>> -        * dongle become 1
>> -        * also only signal audio when disconnected
>> -        */
>> -       if (dp->link->sink_count) {
>> -               dp->dp_display.link_ready = true;
>> -       } else {
>> -               dp->dp_display.link_ready = false;
>> -               dp_display_handle_plugged_change(dp_display, false);
>> -       }
>> -
>> -       drm_dbg_dp(dp->drm_dev,
>> -               "After, type=%d sink=%d conn=%d core_init=%d phy_init=%d power=%d\n",
>> -               dp->dp_display.connector_type, dp->link->sink_count,
>> -               dp->dp_display.link_ready, dp->core_initialized,
>> -               dp->phy_initialized, dp_display->power_on);
>> -
>> -       mutex_unlock(&dp->event_mutex);
>> -
>> -       return 0;
>> -}
>> -
>> -static int dp_pm_suspend(struct device *dev)
>> -{
>> -       struct platform_device *pdev = to_platform_device(dev);
>> -       struct msm_dp *dp_display = platform_get_drvdata(pdev);
>> -       struct dp_display_private *dp;
>> -
>> -       dp = container_of(dp_display, struct dp_display_private, dp_display);
>> -
>> -       mutex_lock(&dp->event_mutex);
>> -
>> -       drm_dbg_dp(dp->drm_dev,
>> -               "Before, type=%d core_inited=%d  phy_inited=%d power_on=%d\n",
>> -               dp->dp_display.connector_type, dp->core_initialized,
>> -               dp->phy_initialized, dp_display->power_on);
>> -
>> -       /* mainlink enabled */
>> -       if (dp_power_clk_status(dp->power, DP_CTRL_PM))
>> -               dp_ctrl_off_link_stream(dp->ctrl);
>> -
>> -       dp_display_host_phy_exit(dp);
> I was under the impression that dp_pm_runtime_suspend / _resume
> functions perform phy init/exit only in eDP cases. Can we really drop
> the main suspend/resume functions?

yes on eDP case since it is embedded.

for external DP case, there are two steps

step 1: enable DP controller's  hpd block and start waiting for hpd 
interrupts at dp_display_hpd_enable()

step 2:  at plugin interrupts,  dp_display_host_phy_init()

step 3: at unplug interrupt: dp_bridge_atomic_post_disable() 
dp_display_host_phy_exi()

at runtime, there is loop between step 2 and step 3

step  4: disable DP controller's  hpd block

>
>> -
>> -       /* host_init will be called at pm_resume */
>> -       dp_display_host_deinit(dp);
>> -
>> -       dp->hpd_state = ST_SUSPENDED;
>> -
>> -       drm_dbg_dp(dp->drm_dev,
>> -               "After, type=%d core_inited=%d phy_inited=%d power_on=%d\n",
>> -               dp->dp_display.connector_type, dp->core_initialized,
>> -               dp->phy_initialized, dp_display->power_on);
>> -
>> -       mutex_unlock(&dp->event_mutex);
>> -
>> -       return 0;
>> -}
>> -
>>   static const struct dev_pm_ops dp_pm_ops = {
>>          SET_RUNTIME_PM_OPS(dp_pm_runtime_suspend, dp_pm_runtime_resume, NULL)
>> -       .suspend = dp_pm_suspend,
>> -       .resume =  dp_pm_resume,
>> +       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>> +                                pm_runtime_force_resume)
>>   };
>>
>>   static struct platform_driver dp_display_driver = {
>> @@ -1658,9 +1557,6 @@ void dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>>
>>          dp_display = container_of(dp, struct dp_display_private, dp_display);
>>
>> -       if (dp->is_edp)
>> -               dp_hpd_unplug_handle(dp_display, 0);
> Why?

dp_hpd_unplug_handle() does not tear down phy.

Therefore eDP does not need to call unplug handle.



>> -
>>          mutex_lock(&dp_display->event_mutex);
>>
>>          state = dp_display->hpd_state;
>> @@ -1748,6 +1644,7 @@ void dp_bridge_hpd_disable(struct drm_bridge *bridge)
>>          dp_catalog_ctrl_hpd_disable(dp->catalog);
>>
>>          dp_display->internal_hpd = false;
>> +       dp->hpd_state = ST_DISCONNECTED;
> Why? We have only disabled sending of the HPD events. The dongle might
> still be connected.

dp_bridge_hpd_disable() disable dp controller hpd block (no more hpd 
interrupt will be received).

dp_bridge_hpd_disable() should happen after DP main link had been teared 
down already.

Therefore hpd_state need to be in default state so that next plugin 
handle will be start with correct state.


>
>>          pm_runtime_mark_last_busy(&dp->pdev->dev);
>>          pm_runtime_put_autosuspend(&dp->pdev->dev);
>> --
>> 2.7.4
>>
>
> --
> With best wishes
>
> Dmitry
