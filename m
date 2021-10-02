Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49DE741F8EE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Oct 2021 03:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231741AbhJBBGM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 21:06:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231175AbhJBBGM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 21:06:12 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5447C0613E5
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 18:04:26 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id e15so45109255lfr.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 18:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bBqFMnErG4GH3r+7O+ALCEzoJ/5HVSbS5xSothngSqU=;
        b=JBKXQAAsxFQDDJ/WDB4YgCwq2Ygg3SzXL8K+1grASm5k9WQwXCvTdOmeCHhaipaeYe
         BqxtYMUC64NSyCzlvn+WiombtjjwpPlZabb6f/Vjp/0/BQ3ZhFjpnKeSDk+DtYy46Opw
         dluAwQD52yJx15frVi4MUk9assLAKT1mUMWGfeXBwdojqUvhPE+1eV79IKt/JpRGeIao
         esv5hDCo0EXVxKkCXMDGIx8jQxrLBqHK/QIuqzJd6qSLk3mdO8MlObyVdxHLT7k0b4rg
         ERD/kgGSt12gXuT8sawpLfs9hkzy/2Hsr4CE+nchEi7siWm9ZcOLjHPOAzpzxp7CjoZ8
         aIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bBqFMnErG4GH3r+7O+ALCEzoJ/5HVSbS5xSothngSqU=;
        b=2PDU+/ppG8w/74W2nA/7IuITR0i6W5Q3YFk7hEuiWdD9tm1zNcZHHyhKZr7rr89ANQ
         mMOyPvq2O7odN7YBMElvbOzviBE6Pdx6+3rydkPJGbOuKxqTsXRUUrhGj6/sf/pALBXp
         Mk3mtjQxYgVG52Uy4Lfhc7419rqm0AhNduiNwMcjB/Yae4RTergB5SEXMV8LIfRmFh3o
         KbjhDGTS+2FySy+2ifBlHn4z9dDHMGCgUQnjYGbz7YIaQSdNkGABWqQ0dW4xDduz5oxA
         1RYs7u5nL7CT3Y+3AdVFC8beOIUGogyeJBQDFXZtL+KKX7rf5TufXNZX1oN9ZJndGm7s
         gDMQ==
X-Gm-Message-State: AOAM533KUj/YGN7Dr/1zXm39BHfWszPj3tU98AKm3a1eGpYgfhO7930C
        QvrVF7iADXFIkZK5GCcWUWdNc9xgl+RDZQ==
X-Google-Smtp-Source: ABdhPJwByXmufhaYBRr4CsuPoSbhdQN4oFOqSAGoZSx5nj+bWkNLOMFcS6yMQ364Mxopl0BfHUlorQ==
X-Received: by 2002:a05:6512:2396:: with SMTP id c22mr1164796lfv.55.1633136664604;
        Fri, 01 Oct 2021 18:04:24 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s8sm894150lfd.149.2021.10.01.18.04.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 18:04:24 -0700 (PDT)
Subject: Re: [PATCH] Revert "of: property: fw_devlink: Add support for
 remote-endpoint"
To:     Saravana Kannan <saravanak@google.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20210927204830.4018624-1-dmitry.baryshkov@linaro.org>
 <CAGETcx-3Y3rOSoXu3SbDa6BP_jcT8uSQA+MV55QCY4b0Oe7L-A@mail.gmail.com>
 <11fe1793-1455-ae44-b213-9afe47dfa370@linaro.org>
 <CAGETcx_HRmvDKuXQEJkMk7zBpedLGkQmvJ24tAWpCHFf4DPX_w@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <61ce03c1-1b31-bb56-8951-7b71ecdd66a9@linaro.org>
Date:   Sat, 2 Oct 2021 04:04:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAGETcx_HRmvDKuXQEJkMk7zBpedLGkQmvJ24tAWpCHFf4DPX_w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/09/2021 04:13, Saravana Kannan wrote:
> On Mon, Sep 27, 2021 at 5:56 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> [Adding Stephen and linux-arm-msm to the CC list, missed on the patch Cc
>> list]
>>
>> On 28/09/2021 00:58, Saravana Kannan wrote:
>>> On Mon, Sep 27, 2021 at 1:48 PM Dmitry Baryshkov
>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>
>>>> Since the commit f7514a663016 ("of: property: fw_devlink: Add support
>>>> for remote-endpoint") Linux kernel started parsing and adding devlinks
>>>> for the remote-endpoint properties. However this brings more harm than
>>>> good.
>>>>
>>>> For all the remote-endpoints in the graph two links are created. Thus
>>>> each and every remote-endpoint ends up in the cyclic graph (instead of
>>>> the original intent of catching a cycle of graph + non-graph link):
>>>
>>> Yes, I'm well aware of this. I even called this out in the commit
>>> text. This creating of cycles and then catching and relaxing it is
>>> intentional.
>>> https://lore.kernel.org/all/20210330185056.1022008-1-saravanak@google.com/
>>
>> What would be the reason two always create a cycle which gives no
>> additional information? Maybe I'm just misunderstanding this piece of code.
> 
> It's basically a tiny bit of busy work. Ulf and I planned to fix it
> and we know how to. Just haven't gotten around to it since it doesn't
> really break anything.
> 
>> Regarding your commit message. Even if there is a non-remote-endpoint
>> dependency, it will be hidden by the remote-endpoint cycle.
> 
> That's the point. Because there's no way to tell without the driver
> involvement, we basically need to ignore all dependencies between
> those two devices pointing at each other.
> 
>>
>> And another consequence of remote-endpoint loops.
>>
>> Consider this part part of dmesg. One warning is correct (real cyclic
>> dependency). Others are remote-endpoint spam. Can you spot, which ones?
>>
>> [    7.032225] platform 1d87000.phy: Fixing up cyclic dependency with
>> 1d84000.ufshc
>> [   21.760326] platform c440000.spmi:pmic@2:typec@1500: Fixing up cyclic
>> dependency with c440000.spmi:pmic@2:pmic-tcpm
>> [   21.944849] platform c440000.spmi:pmic@2:pdphy@1700: Fixing up cyclic
>> dependency with c440000.spmi:pmic@2:pmic-tcpm
>> [   23.541968] platform a600000.usb: Fixing up cyclic dependency with
>> c440000.spmi:pmic@2:pmic-tcpm
>> [   30.354170] i2c 5-002b: Fixing up cyclic dependency with hdmi-out
> 
> It's info, not warning if I'm not mistaken. If that's really a problem
> we can make it a debug log. Not the end of the world.
> 
>>
>>
>>>>
>>>> [    0.381057] OF: remote-endpoint linking /soc@0/geniqup@9c0000/i2c@994000/hdmi-bridge@2b to /soc@0/mdss@ae00000/dsi@ae94000/ports/port@1/endpoint
>>>> [    0.394421] OF: remote-endpoint linking /soc@0/geniqup@9c0000/i2c@994000/hdmi-bridge@2b to /hdmi-out/port/endpoint
>>>> [    0.407007] OF: remote-endpoint linking /soc@0/phy@88e9000 to /soc@0/spmi@c440000/pmic@2/pmic-tcpm/connector/ports/port@0/endpoint@0
>>>> [    0.419648] OF: remote-endpoint linking /soc@0/usb@a6f8800/usb@a600000 to /soc@0/spmi@c440000/pmic@2/pmic-tcpm/ports/port@2/endpoint@0
>>>> [    0.432578] OF: remote-endpoint linking /soc@0/cci@ac4f000/i2c-bus@1/cam1@c0 to /soc@0/camss@ac6a000/ports/port@1/endpoint
>>>> [    0.444450] OF: remote-endpoint linking /soc@0/camss@ac6a000 to /soc@0/cci@ac4f000/i2c-bus@1/cam1@c0/port/endpoint
>>>> [    0.455292] OF: remote-endpoint linking /soc@0/mdss@ae00000/mdp@ae01000 to /soc@0/mdss@ae00000/dsi@ae94000/ports/port@0/endpoint
>>>> [    0.467210] OF: remote-endpoint linking /soc@0/mdss@ae00000/mdp@ae01000 to /soc@0/mdss@ae00000/dsi@ae96000/ports/port@0/endpoint
>>>> [    0.479239] OF: remote-endpoint linking /soc@0/mdss@ae00000/dsi@ae94000 to /soc@0/mdss@ae00000/mdp@ae01000/ports/port@0/endpoint
>>>> [    0.491147] OF: remote-endpoint linking /soc@0/mdss@ae00000/dsi@ae94000 to /soc@0/geniqup@9c0000/i2c@994000/hdmi-bridge@2b/ports/port@0/endpoint
>>>> [    0.504979] OF: remote-endpoint linking /soc@0/spmi@c440000/pmic@2/typec@1500 to /soc@0/spmi@c440000/pmic@2/pmic-tcpm/ports/port@0/endpoint
>>>> [    0.517958] OF: remote-endpoint linking /soc@0/spmi@c440000/pmic@2/pdphy@1700 to /soc@0/spmi@c440000/pmic@2/pmic-tcpm/ports/port@1/endpoint
>>>> [    0.565326] OF: remote-endpoint linking /hdmi-out to /soc@0/geniqup@9c0000/i2c@994000/hdmi-bridge@2b/ports/port@2/endpoint
>>>>
>>>> Under some conditions the device can become it's own supplier,
>>>> preventing this device to be probed at all:
>>>
>>> I'm not sure this analysis is correct -- this shouldn't be happening.
>>> If you go to the device link folder and cat "sync_state_only", I
>>> expect it to be "1" in this case. Can you confirm that?
>>
>> It is "1".
> 
> Thanks for confirming.
> 
>>
>>> Which means it won't block probing. Yes, the link itself is useless
>>> and it'll get auto deleted once mdss probes and it's easy to not
>>> create it in the first place. But this is definitely not your issue.
>>>
>>>> $ ls -l /sys/bus/platform/devices/ae00000.mdss/
>>>> lrwxrwxrwx    1 root     root             0 Aug  4 15:13 consumer:platform:ae00000.mdss -> ../../../virtual/devlink/platform:ae00000.mdss--platform:ae00000.mdss
>>>>
>>>> I think that until of_link can be tought to handle bi-directional links
>>>> on its own, we should not parse remote-endpoint properties. Thus the
>>>> aforementioned commit should be reverted.
>>>
>>> Nak. remote-endpoint parsing is working as intended. I don't think the
>>> analysis is correct.
>>>
>>> Can you please enable the logs in all these functions and attach the
>>> log so we can see why it's not probing mdss?
>>> device_link_add
>>> device_links_check_suppliers
>>> func fw_devlink_relax_link
>>> fw_devlink_create_devlink
>>
>> After doing the analysis, I can confirm that I was too quick regarding
>> the mdss links preventing it from being probed. Sorry about that.
>>
>> It all went up to the DP phy having a link with usb-c-connector. I was
>> running the kernel 5.15-rc1, so your tcpm fix is already present.
>> However my colleague has disabled the tcpm device (which I did not
>> notice). So the driver did not call fw_devlink_purge_absent_suppliers().
>> The devlink still exists:
> 
> Let me take a closer look at this before the end of this week. Can you
> point me to the exact DT changes that were made that's causing this
> issue? It should help me debug the issue. I have a guess on what the
> issue might be.

Here is the kernel source: 
https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=5.15-rc1-camss-v2

The change that causes PHY driver to silently stop probing, causing an 
avalanche of devices not being probed:

https://git.linaro.org/people/bryan.odonoghue/kernel.git/commit/?h=5.15-rc1-camss-v2&id=d0bf3fc47c132968c302965154eeb5c88007fa73

> 
>>
>> [   53.426446] platform 88e9000.phy: probe deferral - wait for supplier
>> connector
>>
>> However it is not present in the sysfs:
> 
> Right, because it's not a device link yet. It's waiting for the device
> to show up to create the device link (it has to for the grand scheme
> of things to work correctly).

Could you please make it somehow visible that there is a 
pending/blocking device link which is not visible yet (or even better 
where it is pointing)?

> 
>>
>> root@qcom-armv8a:~# ls -l /sys/bus/platform/devices/88e9000.phy/
>> lrwxrwxrwx    1 root     root             0 Aug  4 15:13
>> consumer:platform:a600000.usb ->
>> ../../../virtual/devlink/platform:88e9000.phy--platform:a600000.usb
>> lrwxrwxrwx    1 root     root             0 Aug  4 15:13
>> consumer:platform:af00000.clock-controller ->
>> ../../../virtual/devlink/platform:88e9000.phy--platform:af00000.clock-controller
>> -rw-r--r--    1 root     root          4096 Aug  4 15:13 driver_override
>> -r--r--r--    1 root     root          4096 Aug  4 15:13 modalias
>> lrwxrwxrwx    1 root     root             0 Aug  4 15:13 of_node ->
>> ../../../../firmware/devicetree/base/soc@0/phy@88e9000
>> drwxr-xr-x    2 root     root             0 Aug  4 15:13 power
>> lrwxrwxrwx    1 root     root             0 Aug  4 15:10 subsystem ->
>> ../../../../bus/platform
>> lrwxrwxrwx    1 root     root             0 Aug  4 15:13
>> supplier:platform:100000.clock-controller ->
>> ../../../virtual/devlink/platform:100000.clock-controller--platform:88e9000.phy
>> lrwxrwxrwx    1 root     root             0 Aug  4 15:13
>> supplier:platform:18200000.rsc:clock-controller ->
>> ../../../virtual/devlink/platform:18200000.rsc:clock-controller--platform:88e9000.phy
>> lrwxrwxrwx    1 root     root             0 Aug  4 15:13
>> supplier:platform:18200000.rsc:pm8150-rpmh-regulators ->
>> ../../../virtual/devlink/platform:18200000.rsc:pm8150-rpmh-regulators--platform:88e9000.phy
>> -rw-r--r--    1 root     root          4096 Aug  4 15:10 uevent
>> -r--r--r--    1 root     root          4096 Aug  4 15:13
>> waiting_for_supplier
>>
>> Thus it is not possible to spot this device link without
>> CONFIG_DEBUG_DRIVER=y (or any similar debugging technique).
> 
> I sent out some patches to make this easier. But doesn't look like
> it'll land in 5.15.
> https://lore.kernel.org/lkml/20210915172808.620546-1-saravanak@google.com/

Thank you, I'll take a look.

> 
>> If I re-enabled tcpm device or if I reverted remote-endpoint parsing, DP
>> PHY probing would go fine. The DP PHY does not really depend on the
>> connector (or TCPM) being present in the system. The driver will
>> continue working w/o it. However it does not have a change to declare that.
>>
>> Furthermore I went back to the original case that caused you to add
>> remote-endpoint support. The DSI-eDP bridge and eDP panel using the GPIO
>> provided by that bridge. I think the proper fix for the original problem
>> was implemented by the commit bf73537f411b ("drm/bridge: ti-sn65dsi86:
>> Break GPIO and MIPI-to-eDP bridge into sub-drivers"). It split the
>> DSI-eDP bridge driver into functional parts (devices), so that GPIO part
>> and eDP parts are independent, thus breaking this cyclic dependency in a
>> functional way. The remote-endpoint parsing is no longer necessary in
>> this case (Stephen, please correct me if I'm wrong).
> 
> Even if the original case doesn't need remote-endpoint to work
> correctly and the cycle has been broken, that doesn't remove the need
> for parsing remote-endpoint. There could be other cases like the
> original case.
> 
>> I still think that remote endpoint parsing does more harm and noise than
>> good and thus should be reverted.
> 
> I'll agree to disagree. I'm sure your issue can be fixed without
> removing support for remote-endpoint parsing -- let's work on that
> (I've asked for more details above).
> 
> -Saravana
> 


-- 
With best wishes
Dmitry
