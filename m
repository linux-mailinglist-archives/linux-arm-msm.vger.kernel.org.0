Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED0B959C51C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Aug 2022 19:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236694AbiHVRiR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Aug 2022 13:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235410AbiHVRiP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Aug 2022 13:38:15 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C2B1110;
        Mon, 22 Aug 2022 10:38:12 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27MGeVit025666;
        Mon, 22 Aug 2022 17:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Cpq/ix/oYD3ocVt+6D6DZU0b87AtIZu3p/OQDBnTwyQ=;
 b=AlcTbd17m511Iaen+w+HugICU07QHbn6nKawWjbK/3Am529Dg+KlGwFBPniWzPIYQ1A0
 O/mCFOhlh7PbZTaDK7kAb5xcA/uw19Mx9n26CmXKIDTOW/qFktwSjiurBTDlQ+Uzf1fS
 rMQFqtAL7hd12TOWbGnTuReKXaIdlHqo82I/EMimG+OikUh1OvErKvukickkTn57Zvsc
 6ofq1KnBTpPXYHJ2Rt4i6dJkYVLa1gWMuBg+vMJ2OqY04JRbEiv10BdM02QaKl5a69Dt
 4Lz/JZ0Rq0QazpBWSIcnQCoKW8mBTamwwlF6wUnLcfyL4Xey9uXTksDrvVf+PlWyB5nC 5g== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j4dgy04x5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 Aug 2022 17:38:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27MHX4Za028378
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 Aug 2022 17:33:04 GMT
Received: from [10.111.171.135] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 22 Aug
 2022 10:33:00 -0700
Message-ID: <724d695d-0293-db81-7014-57cb96bd6d4b@quicinc.com>
Date:   Mon, 22 Aug 2022 10:32:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dp: add atomic_check to bridge ops
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
        <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
        <agross@kernel.org>, <bjorn.andersson@linaro.org>
CC:     <quic_sbillaka@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <quic_aravindh@quicinc.com>, <freedreno@lists.freedesktop.org>
References: <1660759314-28088-1-git-send-email-quic_khsieh@quicinc.com>
 <f211520a-cb9c-1202-0752-7bb200726ae8@linaro.org>
 <d4b3c303-fc20-537d-0e69-6e19826b6e59@quicinc.com>
 <266c0531-344e-5589-2143-02ab1fe9b276@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <266c0531-344e-5589-2143-02ab1fe9b276@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7OtSuzIJ0Ep6KAs1LRMbv4guMg6nNk4F
X-Proofpoint-GUID: 7OtSuzIJ0Ep6KAs1LRMbv4guMg6nNk4F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-22_10,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208220073
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8/22/2022 9:49 AM, Dmitry Baryshkov wrote:
> On 22/08/2022 19:38, Abhinav Kumar wrote:
>> Hi Dmitry
>>
>> On 8/22/2022 9:18 AM, Dmitry Baryshkov wrote:
>>> On 17/08/2022 21:01, Kuogee Hsieh wrote:
>>>> DRM commit_tails() will disable downstream crtc/encoder/bridge if
>>>> both disable crtc is required and crtc->active is set before pushing
>>>> a new frame downstream.
>>>>
>>>> There is a rare case that user space display manager issue an extra
>>>> screen update immediately followed by close DRM device while down
>>>> stream display interface is disabled. This extra screen update will
>>>> timeout due to the downstream interface is disabled but will cause
>>>> crtc->active be set. Hence the followed commit_tails() called by
>>>> drm_release() will pass the disable downstream crtc/encoder/bridge
>>>> conditions checking even downstream interface is disabled.
>>>> This cause the crash to happen at dp_bridge_disable() due to it trying
>>>> to access the main link register to push the idle pattern out while 
>>>> main
>>>> link clocks is disabled.
>>>>
>>>> This patch adds atomic_check to prevent the extra frame will not
>>>> be pushed down if display interface is down so that crtc->active
>>>> will not be set neither. This will fail the conditions checking
>>>> of disabling down stream crtc/encoder/bridge which prevent
>>>> drm_release() from calling dp_bridge_disable() so that crash
>>>> at dp_bridge_disable() prevented.
>>>
>>> I must admit I had troubles parsing this description. However if I 
>>> got you right, I think the check that the main link clock is running 
>>> in the dp_bridge_disable() or dp_ctrl_push_idle() would be a better fix.
>>
>> Originally, thats what was posted 
>> https://patchwork.freedesktop.org/patch/496984/.
> 
> This patch is also not so correct from my POV. It checks for the hpd 
> status, while in reality it should check for main link clocks being 
> enabled.
> 

We can push another fix to check for the clk state instead of the hpd 
status. But I must say we are again just masking something which the fwk 
should have avoided isnt it?

As per the doc in the include/drm/drm_bridge.h it says,

"*
  * The bridge can assume that the display pipe (i.e. clocks and timing
  * signals) feeding it is still running when this callback is called.
  *"

By adding an extra layers of protection in the driver, we are just 
avoiding another issue but the commit should not have been issued in the 
first place.

So shouldnt we do both then? That is add protection to check if clock is 
ON and also, reject commits when display is disconnected.

>>
>> Then it seemed like we were just protecting against an issue in the 
>> framework which was allowing the frames to be pushed even after the 
>> display was disconnected. The DP driver did send out the disconnect 
>> event correctly and as per the logs, this frame came down after that 
>> and the DRM fwk did allow it.
>>
>> So after discussing on IRC with Rob, we came up with this approach that
>> if the display is not connected, then atomic_check should fail. That 
>> way the commit will not happen.
>>
>> Just seemed a bit cleaner instead of adding all our protections.
> 
> The check to fail atomic_check if display is not connected seems out of 
> place. In its current way it begs go to the upper layer, forbidding 
> using disconnected sinks for all the drivers. There is nothing special 
> in the MSM DP driver with respect to the HPD events processing and 
> failing atomic_check() based on that.
> 

Why all the drivers? This is only for MSM DP bridge.

>>
>>>
>>>>
>>>> SError Interrupt on CPU7, code 0x00000000be000411 -- SError
>>>> CPU: 7 PID: 3878 Comm: Xorg Not tainted 5.19.0-stb-cbq #19
>>>> Hardware name: Google Lazor (rev3 - 8) (DT)
>>>> pstate: a04000c9 (NzCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>>> pc : __cmpxchg_case_acq_32+0x14/0x2c
>>>> lr : do_raw_spin_lock+0xa4/0xdc
>>>> sp : ffffffc01092b6a0
>>>> x29: ffffffc01092b6a0 x28: 0000000000000028 x27: 0000000000000038
>>>> x26: 0000000000000004 x25: ffffffd2973dce48 x24: 0000000000000000
>>>> x23: 00000000ffffffff x22: 00000000ffffffff x21: ffffffd2978d0008
>>>> x20: ffffffd2978d0008 x19: ffffff80ff759fc0 x18: 0000000000000000
>>>> x17: 004800a501260460 x16: 0441043b04600438 x15: 04380000089807d0
>>>> x14: 07b0089807800780 x13: 0000000000000000 x12: 0000000000000000
>>>> x11: 0000000000000438 x10: 00000000000007d0 x9 : ffffffd2973e09e4
>>>> x8 : ffffff8092d53300 x7 : ffffff808902e8b8 x6 : 0000000000000001
>>>> x5 : ffffff808902e880 x4 : 0000000000000000 x3 : ffffff80ff759fc0
>>>> x2 : 0000000000000001 x1 : 0000000000000000 x0 : ffffff80ff759fc0
>>>> Kernel panic - not syncing: Asynchronous SError Interrupt
>>>> CPU: 7 PID: 3878 Comm: Xorg Not tainted 5.19.0-stb-cbq #19
>>>> Hardware name: Google Lazor (rev3 - 8) (DT)
>>>> Call trace:
>>>>   dump_backtrace.part.0+0xbc/0xe4
>>>>   show_stack+0x24/0x70
>>>>   dump_stack_lvl+0x68/0x84
>>>>   dump_stack+0x18/0x34
>>>>   panic+0x14c/0x32c
>>>>   nmi_panic+0x58/0x7c
>>>>   arm64_serror_panic+0x78/0x84
>>>>   do_serror+0x40/0x64
>>>>   el1h_64_error_handler+0x30/0x48
>>>>   el1h_64_error+0x68/0x6c
>>>>   __cmpxchg_case_acq_32+0x14/0x2c
>>>>   _raw_spin_lock_irqsave+0x38/0x4c
>>>>   lock_timer_base+0x40/0x78
>>>>   __mod_timer+0xf4/0x25c
>>>>   schedule_timeout+0xd4/0xfc
>>>>   __wait_for_common+0xac/0x140
>>>>   wait_for_completion_timeout+0x2c/0x54
>>>>   dp_ctrl_push_idle+0x40/0x88
>>>>   dp_bridge_disable+0x24/0x30
>>>>   drm_atomic_bridge_chain_disable+0x90/0xbc
>>>>   drm_atomic_helper_commit_modeset_disables+0x198/0x444
>>>>   msm_atomic_commit_tail+0x1d0/0x374
>>>>   commit_tail+0x80/0x108
>>>>   drm_atomic_helper_commit+0x118/0x11c
>>>>   drm_atomic_commit+0xb4/0xe0
>>>>   drm_client_modeset_commit_atomic+0x184/0x224
>>>>   drm_client_modeset_commit_locked+0x58/0x160
>>>>   drm_client_modeset_commit+0x3c/0x64
>>>>   __drm_fb_helper_restore_fbdev_mode_unlocked+0x98/0xac
>>>>   drm_fb_helper_set_par+0x74/0x80
>>>>   drm_fb_helper_hotplug_event+0xdc/0xe0
>>>>   __drm_fb_helper_restore_fbdev_mode_unlocked+0x7c/0xac
>>>>   drm_fb_helper_restore_fbdev_mode_unlocked+0x20/0x2c
>>>>   drm_fb_helper_lastclose+0x20/0x2c
>>>>   drm_lastclose+0x44/0x6c
>>>>   drm_release+0x88/0xd4
>>>>   __fput+0x104/0x220
>>>>   ____fput+0x1c/0x28
>>>>   task_work_run+0x8c/0x100
>>>>   do_exit+0x450/0x8d0
>>>>   do_group_exit+0x40/0xac
>>>>   __wake_up_parent+0x0/0x38
>>>>   invoke_syscall+0x84/0x11c
>>>>   el0_svc_common.constprop.0+0xb8/0xe4
>>>>   do_el0_svc+0x8c/0xb8
>>>>   el0_svc+0x2c/0x54
>>>>   el0t_64_sync_handler+0x120/0x1c0
>>>>   el0t_64_sync+0x190/0x194
>>>> SMP: stopping secondary CPUs
>>>> Kernel Offset: 0x128e800000 from 0xffffffc008000000
>>>> PHYS_OFFSET: 0x80000000
>>>> CPU features: 0x800,00c2a015,19801c82
>>>> Memory Limit: none
>>>>
>>>> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for 
>>>> display enable and disable")
>>>> Reported-by: Leonard Lausen <leonard@lausen.nl>
>>>> Suggested-by: Rob Clark <robdclark@gmail.com>
>>>> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/17
>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/dp/dp_drm.c | 23 +++++++++++++++++++++++
>>>>   1 file changed, 23 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c 
>>>> b/drivers/gpu/drm/msm/dp/dp_drm.c
>>>> index 6df25f7..c682588 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
>>>> @@ -31,6 +31,25 @@ static enum drm_connector_status 
>>>> dp_bridge_detect(struct drm_bridge *bridge)
>>>>                       connector_status_disconnected;
>>>>   }
>>>> +static int dp_bridge_atomic_check(struct drm_bridge *bridge,
>>>> +                struct drm_bridge_state *bridge_state,
>>>> +                struct drm_crtc_state *crtc_state,
>>>> +                struct drm_connector_state *conn_state)
>>>> +{
>>>> +    struct msm_dp *dp;
>>>> +
>>>> +    dp = to_dp_bridge(bridge)->dp_display;
>>>> +
>>>> +    drm_dbg_dp(dp->drm_dev, "is_connected = %s\n",
>>>> +        (dp->is_connected) ? "true" : "false");
>>>> +
>>>> +    if (bridge->ops & DRM_BRIDGE_OP_HPD)
>>>> +        return (dp->is_connected) ? 0 : -ENOTCONN;
> 
> This raises questions if this will work for the configurations when 
> other bridge is used for HPD events.
> 
> Let's not mix the levels of processing. If we should not disable the 
> link because it is already disabled, let's just do so rather than 
> failing the atomic_check().
> 

This is only for MSM DP's bridge. If we use another bridge which is 
capable of handling its own HPD, then that time MSM DP's bridge shouldnt 
set this flag.

We can even replace this check with just checking if connector_type is 
DP but that would again open the discussion of having DP/eDP specific 
checks so we did it this way.


>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +
>>>>   /**
>>>>    * dp_bridge_get_modes - callback to add drm modes via 
>>>> drm_mode_probed_add()
>>>>    * @bridge: Poiner to drm bridge
>>>> @@ -61,6 +80,9 @@ static int dp_bridge_get_modes(struct drm_bridge 
>>>> *bridge, struct drm_connector *
>>>>   }
>>>>   static const struct drm_bridge_funcs dp_bridge_ops = {
>>>> +    .atomic_duplicate_state = 
>>>> drm_atomic_helper_bridge_duplicate_state,
>>>> +    .atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
>>>> +    .atomic_reset           = drm_atomic_helper_bridge_reset,
>>>>       .enable       = dp_bridge_enable,
>>>>       .disable      = dp_bridge_disable,
>>>>       .post_disable = dp_bridge_post_disable,
>>>> @@ -68,6 +90,7 @@ static const struct drm_bridge_funcs dp_bridge_ops 
>>>> = {
>>>>       .mode_valid   = dp_bridge_mode_valid,
>>>>       .get_modes    = dp_bridge_get_modes,
>>>>       .detect       = dp_bridge_detect,
>>>> +    .atomic_check = dp_bridge_atomic_check,
>>>>   };
>>>>   struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, 
>>>> struct drm_device *dev,
>>>
> 
