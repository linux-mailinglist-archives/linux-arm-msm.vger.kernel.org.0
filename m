Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 975437A8D17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Sep 2023 21:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbjITTtz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Sep 2023 15:49:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjITTty (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Sep 2023 15:49:54 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 812D29E;
        Wed, 20 Sep 2023 12:49:47 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38KIEwvg020193;
        Wed, 20 Sep 2023 19:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=WeywDlCOIdwYl34bVTgy3VkUkdmS227lBW5hfd2vf9s=;
 b=C0gInY75Ewi75AdQUy2oqTdnaVMkFoa5ycIpifEWyjSQ5pFLmXkic9yT7TSg756uGWJF
 GTmEuXS5uWSasfAgQxWHQXouygpWjXNeETIiOat9s06X9+ED0Y5BdXMXl8fFo6f9JlxP
 GNQsATHM7OmmfdpMCaBr1ZJOqsba7Pz0IbBbHVSYQSCQmIw9Wv8tbkriAFr90eLjtQlh
 cgbqjZ4ADSAJylNiXNrVNNJISYqZrQPL0VVWSyMuVLp1b/PMG3u8mH3Lk3Gx7XlpLxQJ
 DrUVMqHrG/62siAoBiVSU3jWxZzT4E/km74jFboR16hqptbYwMpGgFyXndWQ8Wx0gLbi fA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t7sh3t19p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 20 Sep 2023 19:49:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38KJnMFt005660
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 20 Sep 2023 19:49:22 GMT
Received: from [10.110.124.221] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 20 Sep
 2023 12:49:20 -0700
Message-ID: <cc9d09f1-2f59-19ae-8c69-15caaadf264a@quicinc.com>
Date:   Wed, 20 Sep 2023 12:49:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 6/7] drm/msm/dp: add
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
References: <1694813901-26952-1-git-send-email-quic_khsieh@quicinc.com>
 <1694813901-26952-7-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpqPXoFX4LXyXYgfh07Vpxg-KgD8VBR6x5bXf4GOJmbOtw@mail.gmail.com>
 <2f98d5f1-57c1-d9fe-cb1c-b975db057287@quicinc.com>
 <CAA8EJpr2wRq6Txi7YAQpJKa_9UGqH_nmHzvVOaAPkwOrtDg4Tw@mail.gmail.com>
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJpr2wRq6Txi7YAQpJKa_9UGqH_nmHzvVOaAPkwOrtDg4Tw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: v8-4G4iyIqSJyx0Kdmmcrc340zaj0COa
X-Proofpoint-GUID: v8-4G4iyIqSJyx0Kdmmcrc340zaj0COa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-20_09,2023-09-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 spamscore=0 adultscore=0 mlxscore=0 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309200165
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/19/2023 2:50 AM, Dmitry Baryshkov wrote:
> On Mon, 18 Sept 2023 at 20:48, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>
>> On 9/15/2023 6:21 PM, Dmitry Baryshkov wrote:
>>> On Sat, 16 Sept 2023 at 00:38, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>>> Add pm_runtime_force_suspend()/resume() to complete incorporating pm
>>>> runtime framework into DP driver. Both dp_pm_prepare() and dp_pm_complete()
>>>> are added to set hpd_state to correct state. After resume, DP driver will
>>>> re training its main link after .hpd_enable() callback enabled HPD
>>>> interrupts and bring up display accordingly.
>>> How will it re-train the main link? What is the code path for that?
>> 1) for edp, dp_bridge_atomic_enable(), called from framework, to start
>> link training and bring up display.
> And this path doesn't use .hpd_enable() which you have mentioned in
> the commit message. Please don't try to shorten the commit message.
> You see, I have had questions to several of them, which means that
> they were not verbose enough.

ok, my bad,

I will add more explain to commit text.

>> 2) for external DP, HPD_PLUG_INT will be generated to start link
>> training and bring up display.
> This should be hpd_notify, who starts link training, not some event.
>
>>> I think this is a misuse for prepare/complete callbacks, at least
>>> judging from their documentation.
>> 1) dp_pm_prepare() is called to make sure eDP/DP related power/clocks
>> are off and set hpd_state  to ST_SUSPENDED and nothing else.
>>
>> 2) dp_pm_completed() is called to set hpd_state to ST_ST_DISCONNECTED
>> (default state) and nothing else.
>>
>> I think both are doing proper action.
> Have you read the prepare() / complete() documentation? Does your
> usage follow the documented use case?
I think I can just remove both dp_pm_prepare and dp_pm_complete fro 
this  patch.
>
>>
>>>> Changes in v3:
>>>> -- replace dp_pm_suspend() with pm_runtime_force_suspend()
>>>> -- replace dp_pm_resume() with pm_runtime_force_resume()
>>>>
>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_display.c | 87 +++++--------------------------------
>>>>    1 file changed, 10 insertions(+), 77 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> index b6992202..b58cb02 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> @@ -1333,101 +1333,35 @@ static int dp_pm_runtime_resume(struct device *dev)
>>>>           return 0;
>>>>    }
>>>>
>>>> -static int dp_pm_resume(struct device *dev)
>>>> +static void dp_pm_complete(struct device *dev)
>>>>    {
>>>> -       struct platform_device *pdev = to_platform_device(dev);
>>>> -       struct msm_dp *dp_display = platform_get_drvdata(pdev);
>>>> -       struct dp_display_private *dp;
>>>> -       int sink_count = 0;
>>>> -
>>>> -       dp = container_of(dp_display, struct dp_display_private, dp_display);
>>>> +       struct dp_display_private *dp = dev_get_dp_display_private(dev);
>>>>
>>>>           mutex_lock(&dp->event_mutex);
>>>>
>>>>           drm_dbg_dp(dp->drm_dev,
>>>> -               "Before, type=%d core_inited=%d phy_inited=%d power_on=%d\n",
>>>> +               "type=%d core_inited=%d phy_inited=%d power_on=%d\n",
>>>>                   dp->dp_display.connector_type, dp->core_initialized,
>>>> -               dp->phy_initialized, dp_display->power_on);
>>>> +               dp->phy_initialized, dp->dp_display.power_on);
>>>>
>>>>           /* start from disconnected state */
>>>>           dp->hpd_state = ST_DISCONNECTED;
>>>>
>>>> -       /* turn on dp ctrl/phy */
>>>> -       dp_display_host_init(dp);
>>>> -
>>>> -       if (dp_display->is_edp)
>>>> -               dp_catalog_ctrl_hpd_enable(dp->catalog);
>>>> -
>>>> -       if (dp_catalog_link_is_connected(dp->catalog)) {
>>>> -               /*
>>>> -                * set sink to normal operation mode -- D0
>>>> -                * before dpcd read
>>>> -                */
>>>> -               dp_display_host_phy_init(dp);
>>>> -               dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>>>> -               sink_count = drm_dp_read_sink_count(dp->aux);
>>>> -               if (sink_count < 0)
>>>> -                       sink_count = 0;
>>>> -
>>>> -               dp_display_host_phy_exit(dp);
>>>> -       }
>>>> -
>>>> -       dp->link->sink_count = sink_count;
>>>> -       /*
>>>> -        * can not declared display is connected unless
>>>> -        * HDMI cable is plugged in and sink_count of
>>>> -        * dongle become 1
>>>> -        * also only signal audio when disconnected
>>>> -        */
>>>> -       if (dp->link->sink_count) {
>>>> -               dp->dp_display.link_ready = true;
>>>> -       } else {
>>>> -               dp->dp_display.link_ready = false;
>>>> -               dp_display_handle_plugged_change(dp_display, false);
>>>> -       }
>>>> -
>>>> -       drm_dbg_dp(dp->drm_dev,
>>>> -               "After, type=%d sink=%d conn=%d core_init=%d phy_init=%d power=%d\n",
>>>> -               dp->dp_display.connector_type, dp->link->sink_count,
>>>> -               dp->dp_display.link_ready, dp->core_initialized,
>>>> -               dp->phy_initialized, dp_display->power_on);
>>>> -
>>>>           mutex_unlock(&dp->event_mutex);
>>>> -
>>>> -       return 0;
>>>>    }
>>>>
>>>> -static int dp_pm_suspend(struct device *dev)
>>>> +static int dp_pm_prepare(struct device *dev)
>>>>    {
>>>> -       struct platform_device *pdev = to_platform_device(dev);
>>>> -       struct msm_dp *dp_display = platform_get_drvdata(pdev);
>>>> -       struct dp_display_private *dp;
>>>> -
>>>> -       dp = container_of(dp_display, struct dp_display_private, dp_display);
>>>> +       struct dp_display_private *dp = dev_get_dp_display_private(dev);
>>>>
>>>>           mutex_lock(&dp->event_mutex);
>>>>
>>>> -       drm_dbg_dp(dp->drm_dev,
>>>> -               "Before, type=%d core_inited=%d  phy_inited=%d power_on=%d\n",
>>>> -               dp->dp_display.connector_type, dp->core_initialized,
>>>> -               dp->phy_initialized, dp_display->power_on);
>>>> -
>>>>           /* mainlink enabled */
>>>>           if (dp_power_clk_status(dp->power, DP_CTRL_PM))
>>>>                   dp_ctrl_off_link_stream(dp->ctrl);
>>>>
>>>> -       dp_display_host_phy_exit(dp);
>>>> -
>>>> -       /* host_init will be called at pm_resume */
>>>> -       dp_display_host_deinit(dp);
>>>> -
>>>>           dp->hpd_state = ST_SUSPENDED;
>>>>
>>>> -       drm_dbg_dp(dp->drm_dev,
>>>> -               "After, type=%d core_inited=%d phy_inited=%d power_on=%d\n",
>>>> -               dp->dp_display.connector_type, dp->core_initialized,
>>>> -               dp->phy_initialized, dp_display->power_on);
>>>> -
>>>>           mutex_unlock(&dp->event_mutex);
>>>>
>>>>           return 0;
>>>> @@ -1435,8 +1369,10 @@ static int dp_pm_suspend(struct device *dev)
>>>>
>>>>    static const struct dev_pm_ops dp_pm_ops = {
>>>>           SET_RUNTIME_PM_OPS(dp_pm_runtime_suspend, dp_pm_runtime_resume, NULL)
>>>> -       .suspend = dp_pm_suspend,
>>>> -       .resume =  dp_pm_resume,
>>>> +       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>>>> +                                pm_runtime_force_resume)
>>>> +       .prepare = dp_pm_prepare,
>>>> +       .complete = dp_pm_complete,
>>>>    };
>>>>
>>>>    static struct platform_driver dp_display_driver = {
>>>> @@ -1670,9 +1606,6 @@ void dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>>>>
>>>>           dp_display = container_of(dp, struct dp_display_private, dp_display);
>>>>
>>>> -       if (dp->is_edp)
>>>> -               dp_hpd_unplug_handle(dp_display, 0);
>>>> -
>>>>           mutex_lock(&dp_display->event_mutex);
>>>>
>>>>           state = dp_display->hpd_state;
>>>> --
>>>> 2.7.4
>>>>
>
>
