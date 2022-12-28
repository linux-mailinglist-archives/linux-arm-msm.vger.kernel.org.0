Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43420657499
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 10:24:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbiL1JY0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 04:24:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbiL1JYY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 04:24:24 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27CFA11C;
        Wed, 28 Dec 2022 01:24:23 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BS9AWDl008099;
        Wed, 28 Dec 2022 09:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=wqnp/Zz3ChamwpPISILn0xGSqz+pMjdp8dxD6yhvXoo=;
 b=acN5zosH35utvFJeR5qAkY1U21QExzDJtZDzgAqmTtkwrravcGfb/3oSgqECjcZqYoS1
 Eh52uPu3F7zVhqWQlF4yBsk7WxVvWitq37qNI7e6JZFvy9SVQw96ElH/8vC0zOtwly0G
 WXk0sFtvM+P9txMHBvDyF1khJ66xU/5K/XamaAYryAZ4RwsUKmpnI9C9iUvfzvi1gxv2
 X187XUedCR5RpBaq+ZX707nqnNBjqNEQ6xPZNm4dFP2rpPKZkj9laDfXGM0cAEN3u3fE
 Kuh0RUcDvlp9t20elKqIlz+R2ujQYAFOBX8jzIhiFUmGB1Metp17F9oXfTrVFLCm7wkW xg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mr1r1hrqf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 28 Dec 2022 09:23:43 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BS9NgqM026202
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 28 Dec 2022 09:23:42 GMT
Received: from [10.216.37.144] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 28 Dec
 2022 01:23:34 -0800
Message-ID: <32617d7e-fc1f-8c69-78fc-a0a704c45e76@quicinc.com>
Date:   Wed, 28 Dec 2022 14:53:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v7 0/6] clk/qcom: Support gdsc collapse polling using
 'reset' interface
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
CC:     freedreno <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Douglas Anderson <dianders@chromium.org>,
        <krzysztof.kozlowski@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        "Konrad Dybcio" <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <sboyd@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1664960824-20951-1-git-send-email-quic_akhilpo@quicinc.com>
 <20221201225705.46r2m35ketvzipox@builder.lan>
 <CAPDyKFofsqcoFbYt-9BcisbPdreLGqAAMWorqHi0_D1kwCdYhg@mail.gmail.com>
 <20221207165457.kwdwwiycbwjpogxl@builder.lan>
 <CAPDyKFpYgYkDdJ79xxkwr-Mqnj5CoBrV+ZZe6Xz4hGLNR4zUVw@mail.gmail.com>
 <20221208210622.x656vbf7rum5hrl7@builder.lan>
 <CAPDyKFpSXjcJZ=H491s74BChAV89pQ1Wm8PSdU0nVRfroK1=4A@mail.gmail.com>
 <CAPDyKFrTY8exxFCxXG_ptnRvECYggBBrC2q=MewuEkSj+mxwug@mail.gmail.com>
 <20221227182406.oott4qnxjel25pmf@builder.lan>
From:   Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20221227182406.oott4qnxjel25pmf@builder.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CyZmHFzcOUwf37HyFjworrZaTaRLA1pN
X-Proofpoint-ORIG-GUID: CyZmHFzcOUwf37HyFjworrZaTaRLA1pN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-28_06,2022-12-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212280077
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/27/2022 11:54 PM, Bjorn Andersson wrote:
> On Mon, Dec 12, 2022 at 04:39:09PM +0100, Ulf Hansson wrote:
>> On Fri, 9 Dec 2022 at 18:36, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>>> On Thu, 8 Dec 2022 at 22:06, Bjorn Andersson <andersson@kernel.org> wrote:
>>>> On Thu, Dec 08, 2022 at 02:40:55PM +0100, Ulf Hansson wrote:
>>>>> On Wed, 7 Dec 2022 at 17:55, Bjorn Andersson <andersson@kernel.org> wrote:
>>>>>> On Wed, Dec 07, 2022 at 05:00:51PM +0100, Ulf Hansson wrote:
>>>>>>> On Thu, 1 Dec 2022 at 23:57, Bjorn Andersson <andersson@kernel.org> wrote:
>>>>>>>> On Wed, Oct 05, 2022 at 02:36:58PM +0530, Akhil P Oommen wrote:
>>>>>>>> @Ulf, Akhil has a power-domain for a piece of hardware which may be
>>>>>>>> voted active by multiple different subsystems (co-processors/execution
>>>>>>>> contexts) in the system.
>>>>>>>>
>>>>>>>> As such, during the powering down sequence we don't wait for the
>>>>>>>> power-domain to turn off. But in the event of an error, the recovery
>>>>>>>> mechanism relies on waiting for the hardware to settle in a powered off
>>>>>>>> state.
>>>>>>>>
>>>>>>>> The proposal here is to use the reset framework to wait for this state
>>>>>>>> to be reached, before continuing with the recovery mechanism in the
>>>>>>>> client driver.
>>>>>>> I tried to review the series (see my other replies), but I am not sure
>>>>>>> I fully understand the consumer part.
>>>>>>>
>>>>>>> More exactly, when and who is going to pull the reset and at what point?
>>>>>>>
>>>>>>>> Given our other discussions on quirky behavior, do you have any
>>>>>>>> input/suggestions on this?
>>>>>>>>
>>>>>>>>> Some clients like adreno gpu driver would like to ensure that its gdsc
>>>>>>>>> is collapsed at hardware during a gpu reset sequence. This is because it
>>>>>>>>> has a votable gdsc which could be ON due to a vote from another subsystem
>>>>>>>>> like tz, hyp etc or due to an internal hardware signal. To allow
>>>>>>>>> this, gpucc driver can expose an interface to the client driver using
>>>>>>>>> reset framework. Using this the client driver can trigger a polling within
>>>>>>>>> the gdsc driver.
>>>>>>>> @Akhil, this description is fairly generic. As we've reached the state
>>>>>>>> where the hardware has settled and we return to the client, what
>>>>>>>> prevents it from being powered up again?
>>>>>>>>
>>>>>>>> Or is it simply a question of it hitting the powered-off state, not
>>>>>>>> necessarily staying there?
>>>>>>> Okay, so it's indeed the GPU driver that is going to assert/de-assert
>>>>>>> the reset at some point. Right?
>>>>>>>
>>>>>>> That seems like a reasonable approach to me, even if it's a bit
>>>>>>> unclear under what conditions that could happen.
>>>>>>>
>>>>>> Generally the disable-path of the power-domain does not check that the
>>>>>> power-domain is actually turned off, because the status might indicate
>>>>>> that the hardware is voting for the power-domain to be on.
>>>>> Is there a good reason why the HW needs to vote too, when the GPU
>>>>> driver is already in control?
>>>>>
>>>>> Or perhaps that depends on the running use case?
>>>>>
>>>>>> As part of the recovery of the GPU after some fatal fault, the GPU
>>>>>> driver does something which will cause the hardware votes for the
>>>>>> power-domain to be let go, and then the driver does pm_runtime_put().
>>>>> Okay. That "something", sounds like a device specific setting for the
>>>>> corresponding gdsc, right?
>>>>>
>>>>> So somehow the GPU driver needs to manage that setting, right?
>>>>>
>>>>>> But in this case the GPU driver wants to ensure that the power-domain is
>>>>>> actually powered down, before it does pm_runtime_get() again. To ensure
>>>>>> that the hardware lost its state...
>>>>> I see.
>>>>>
>>>>>> The proposal here is to use a reset to reach into the power-domain
>>>>>> provider and wait for the hardware to be turned off, before the GPU
>>>>>> driver attempts turning the power-domain on again.
>>>>>>
>>>>>>
>>>>>> In other words, there is no reset. This is a hack to make a normally
>>>>>> asynchronous pd.power_off() to be synchronous in this particular case.
>>>>> Alright, assuming I understood your clarifications above correctly
>>>>> (thanks!), I think I have got a much better picture now.
>>>>>
>>>>> Rather than abusing the reset interface, I think we should manage this
>>>>> through the genpd's power on/off notifiers (GENPD_NOTIFY_OFF). The GPU
>>>>> driver should register its corresponding device for them
>>>>> (dev_pm_genpd_add_notifier()).
>>>>>
>>>>> The trick however, is to make the behaviour of the power-domain for
>>>>> the gdsc (the genpd->power_off() callback) conditional on whether the
>>>>> HW is configured to vote or not. If the HW can vote, it should not
>>>>> poll for the state - and vice versa when the HW can't vote.
>>>>>
>>>> Per Akhil's description I misunderstood who the other voters are; but
>>>> either way it's not the same "HW configured" mechanism as the one we're
>>>> already discussing.
>>> Okay, so this is another thing then.
>>>
>>>>
>>>> But if we based on similar means could control if the power_off() ops
>>>> should be blocking, waiting for the status indication to show that the
>>>> hardware is indeed powered down, I think this would meet the needs.
>>> Right.
>>>
>>>> And GENPD_NOTIFY_OFF seems to provide the notification that it was
>>>> successful (i.e. happened within the timeout etc).
>>>>
>>>>> Would this work?
>>>>>
>>>> If we can control the behavior of the genpd, I think it would.
>>> Okay, it seems like we need a new dev_pm_genpd_* interface that
>>> consumers can call to instruct the genpd provider, that its
>>> ->power_off() callback needs to temporarily switch to become
>>> synchronous.
>>>
>>> I guess this could be useful for other similar cases too, where the
>>> corresponding PM domain isn't actually being powered off, but rather
>>> just voted for to become powered off, thus relying on the HW to do the
>>> aggregation.
>>>
>>> In any case, I am still a bit skeptical of the reset approach, as is
>>> being suggested in the $subject series. Even if it's rather nice and
>>> clean (but somewhat abusing the interface), it looks like there will
>>> be synchronization problems between the calls to the
>>> pm_runtime_put_sync() and reset_control_reset() in the GPU driver. The
>>> "reset" may actually already have happened when the call to
>>> reset_control_reset() is done, so we may fail to detect the power
>>> collapse, right!?
>>>
>>> Let me cook a patch for the new genpd interface that I have in mind,
>>> then we can see how that plays out together with the other parts. I
>>> will post it on Monday!
>> Below is the genpd patch that I had in mind.
>>
>> As I stated above, the GPU driver would need to register for genpd's
>> power on/off notificers (GENPD_NOTIFY_OFF). Then it should call the
>> new dev_pm_genpd_synced_poweroff() and finally pm_runtime_put().
>> Moreover, when the GPU driver receives the GENPD_NOTIFY_OFF
>> notification, it should probably just kick a completion variable,
>> allowing the path that calls pm_runtime_put() to wait for the
>> notification to arrive.
>>
>> On the genpd provider side, the ->power_off() callback should be
>> updated to check the new genpd->synced_poweroff variable, to indicate
>> whether it should poll for power collapse or not.
>>
>> I think this should work, but if you still prefer to use the "reset"
>> approach, that's entirely up to you to decide.
>>
> I find this to be conceptually much cleaner. Thanks for the proposal!
>
> Regards,
> Bjorn
https://patchwork.freedesktop.org/series/111966/
Bjorn, this is the new series based on this proposal.

-Akhil.
>> Kind regards
>> Uffe
>>
>> -----
>>
>> From: Ulf Hansson <ulf.hansson@linaro.org>
>> Date: Mon, 12 Dec 2022 16:08:05 +0100
>> Subject: [PATCH] PM: domains: Allow a genpd consumer to require a synced power
>>  off
>>
>> TODO: Write commit message
>>
>> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
>> ---
>>  drivers/base/power/domain.c | 22 ++++++++++++++++++++++
>>  include/linux/pm_domain.h   |  1 +
>>  2 files changed, 23 insertions(+)
>>
>> diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
>> index b46aa490b4cd..3402b2ea7f61 100644
>> --- a/drivers/base/power/domain.c
>> +++ b/drivers/base/power/domain.c
>> @@ -494,6 +494,27 @@ void dev_pm_genpd_set_next_wakeup(struct device
>> *dev, ktime_t next)
>>  }
>>  EXPORT_SYMBOL_GPL(dev_pm_genpd_set_next_wakeup);
>>
>> +/**
>> + * dev_pm_genpd_synced_poweroff - Next power off should be synchronous
>> + *
>> + * @dev: Device to handle
>> + *
>> + * TODO: Add description
>> + */
>> +void dev_pm_genpd_synced_poweroff(struct device *dev)
>> +{
>> +       struct generic_pm_domain *genpd;
>> +
>> +       genpd = dev_to_genpd_safe(dev);
>> +       if (!genpd)
>> +               return;
>> +
>> +       genpd_lock(genpd);
>> +               genpd->synced_poweroff = true;
>> +       genpd_unlock(genpd);
>> +}
>> +EXPORT_SYMBOL_GPL(dev_pm_genpd_synced_poweroff);
>> +
>>  static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
>>  {
>>         unsigned int state_idx = genpd->state_idx;
>> @@ -588,6 +609,7 @@ static int _genpd_power_off(struct
>> generic_pm_domain *genpd, bool timed)
>>  out:
>>         raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_OFF,
>>                                 NULL);
>> +       genpd->synced_poweroff = false;
>>         return 0;
>>  busy:
>>         raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_ON, NULL);
>> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
>> index ebc351698090..09c6c67a4896 100644
>> --- a/include/linux/pm_domain.h
>> +++ b/include/linux/pm_domain.h
>> @@ -134,6 +134,7 @@ struct generic_pm_domain {
>>         unsigned int prepared_count;    /* Suspend counter of prepared
>> devices */
>>         unsigned int performance_state; /* Aggregated max performance state */
>>         cpumask_var_t cpus;             /* A cpumask of the attached CPUs */
>> +       bool synced_poweroff;           /* A consumer needs a synced poweroff */
>>         int (*power_off)(struct generic_pm_domain *domain);
>>         int (*power_on)(struct generic_pm_domain *domain);
>>         struct raw_notifier_head power_notifiers; /* Power on/off notifiers */
>> -- 
>> 2.34.1

