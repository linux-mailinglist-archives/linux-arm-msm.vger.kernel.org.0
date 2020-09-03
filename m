Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1E4625CE47
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 01:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728697AbgICXZd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 19:25:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729270AbgICXZL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 19:25:11 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A930C061247
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2020 16:25:11 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id 92so3333076qtb.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 16:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CpIM1vivLGzOLkg2coJ9MKu5jBPaDdQiymauIKRU90I=;
        b=hjMrVcf/HWZjuosu4QG0j6BBgJS51vZoP3ffeIvYP7UxIzFTjjobvv7VJIYz+YDMgf
         YehgtUxoeLnY6L5a76UvY3QrdjGFjp3iorJxhkmXxrRV9hk8QyLMqSCDahkorhyEfkVz
         JMRC594IihbkmbpshO7AocOKJco3HWgK9TGPvgc9HV9s62TurLnTaJsk/qDNPOWhTJ/t
         YNblHOM95DB9wXQnyHHWxyJGw/9S9A7WIdYh5ILo6vf37cTOphuuK9eR3E+vBiZXYQgC
         3w46PkP+1jkJo8Uwv7NRP2d2ttY0RLAejlkt/7mAVlDeYreoSkK4fIaA+u0A18W1QDNg
         NpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CpIM1vivLGzOLkg2coJ9MKu5jBPaDdQiymauIKRU90I=;
        b=OjPgkAO83iZRg2t3Ngg7dk7//M2Q66AAN5ZXMZqNio8S2gwsWvkJ0e82petsmwFxSu
         01O5jXIJ+SMtCkszSXEll1Gh1YkEqP6tJTtAbQPBVMJNYNF/AYEnHUDgI/idFGYlsA49
         xrutghW1rFiw5bWs4HTveX6JTwrEmDpmVjoGyMiQMToNv9/Tyx/kQM3mwZLmh4onoq6U
         s/lbG27U+89HbDhd4ZKoGXq2/wLH4Cl4xpqPCbe0aqZuatwAURttI7RhNrJ4ceWCjFOa
         fqB48ATBQADQtl9Lgc9AbZz+bkej5xA2KPR8PXlouIE5tsomWP8VKO/alTiTmoPULc0e
         eVhA==
X-Gm-Message-State: AOAM532uif4AAsuq6pzt270bFfBMl72h5voiyd077FLWQbTGHIZSbaDF
        MaWjVzC7sU9Tq4DIQa23eed/uw==
X-Google-Smtp-Source: ABdhPJyy8QS6W7hRKA79lufueRD9aNPrALoyUJvwiGtauVl1gDdogpQGhbfPM37w2mYIENqhEa69oA==
X-Received: by 2002:aed:3e2e:: with SMTP id l43mr6217308qtf.392.1599175510429;
        Thu, 03 Sep 2020 16:25:10 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id v202sm3397009qka.5.2020.09.03.16.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 16:25:10 -0700 (PDT)
Subject: Re: [PATCH v2 07/10] phy: qcom-qmp: Add support for DP in USB3+DP
 combo phy
To:     Stephen Boyd <swboyd@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Wesley Cheng <wcheng@codeaurora.org>
References: <20200902230215.3452712-1-swboyd@chromium.org>
 <20200902230215.3452712-8-swboyd@chromium.org>
 <b6f80242-482d-b778-690b-8aefa4e8f23e@marek.ca>
 <159917286975.334488.16684252260287652678@swboyd.mtv.corp.google.com>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <7cf46574-569d-c69d-cfed-0fa20057b4d5@marek.ca>
Date:   Thu, 3 Sep 2020 19:24:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <159917286975.334488.16684252260287652678@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/3/20 6:41 PM, Stephen Boyd wrote:
> Quoting Jonathan Marek (2020-09-03 13:43:10)
>> On 9/2/20 7:02 PM, Stephen Boyd wrote:
>>>
>>> This code is based on a submission of this phy and PLL in the drm
>>> subsystem.
>>
>> I updated my upstream-based sm8150/sm8250 displayport stack [1] to use
>> these patches.
> 
> Great!
> 
>>
>> This commit [2] might interest you, so that you can consider what needs
>> to change between v3 and v4 PHYs. Note some of the V4 registers have the
>> same address as V3, so the diff could be smaller.
> 
> Looks like v4 will need to introduce a register indirection table for
> the differences. Also need to add a table for the aux initial table
> values and the calibration values for aux_cfg1. Seems like it won't be
> too bad.
> 
> Does DP work with those patches with v4? You should make yourself the
> author of commit d3c6da6f87eedb20ea1591aaae1ea4e63d7bd777 ;-)
> 

Yes, it works, although the PHY is hardcoded to CC2 orientation and 4 
lanes, SS PHY disabled, and hotplugging/TCPM doesn't work in all cases.

>>
>> Do you have any plan for dealing with the SS PHY and DP PHY conflicting
>> with each other? For example, PHY_MODE_CTRL needs to be "DP_MODE" for
>> 4-lane DP, "DP_MODE | USB3_MODE" for 2-lane DP + USB3, and (AFAIK)
>> "USB3_MODE" for superspeedplus usb (and it seems this gates some clocks,
>> so you can't read/write dp tx2 registers in 2-lane DP mode for example).
> 
> Right. I've seen that behavior as well.
> 
>>   From your cover letter it sounds like this isn't relevant to your
>> hardware, but it looks like both PHYs are writing to the dp_com region
>> which is still problematic. (in the branch I linked, I disabled the SS
>> PHY to test the DP PHY)
> 
> Right. I mentioned in the cover letter that this needs to hook into the
> type-c subsystem somehow. I haven't done any of that work because I
> don't have a configuration that is as dynamic. As long as the type-c
> stuff can express my static configuration it will be fine. If you have
> done any work there I'm happy to review the code and test it out on my
> configuration.
> 
> The driver is setup for DP_MODE | USB3_MODE (i.e. concurrent mode) so it
> is already hardcoded for the 2-lane use case that I have. If I didn't
> connect two lanes from the phy to a USB hub I could support all the
> different combinations but that isn't the case. On phones it is
> basically the only case though because the pins from the usb3+dp phy go
> straight to the type-c connector.
> 
> qcom_qmp_phy_com_init() is the only place I see the driver writing to it
> and it is refcounted so basically the first phy to get initialized will
> set things up in the common area. I suppose for supporting various use
> cases like 4 lanes DP or 2 lanes DP and USB then that refcounting logic
> will need to be changed. I'm not sure what is supposed to happen though.
> I guess the USB host controller, i.e. dwc3, will have to know to stop
> trying to use the phy and then power down and let the DP controller take
> over the phy? It's a dance of three or four drivers.
> 
The solution could be that the DP PHY has priority over the SS PHY. If 
the DP PHY is enabled with 4 lanes then it should go into DP_MODE, 1-2 
lanes it goes into concurrent mode, and USB3_MODE if disabled. The 
problem then is that the SS PHY can't be enabled while the DP PHY is 
enabled (since it will be clock gated), so enabling the SS PHY needs to 
be deferred to when the DP PHY is disabled. I think that is reasonable?

Note I have a TCPM (typec + USB PD) driver [1] which is required to 
negotiate the DP altmode (and provides altmode events to the DP driver 
so it can enable/disable the PHY). My problem is the qcom PMIC doesn't 
provide exactly what TCPM wants, and I don't have access to PMIC 
documentation, so its difficult for me to make a fully working TCPM 
driver. Also conflicts with [2] since both drivers use the typec PMIC 
block...

[1] 
https://github.com/flto/linux/commit/820265ce8535c6396083c5a884870f0f44603a72
[2] https://patchwork.kernel.org/cover/11710371/

>>
>> Also some issues I noticed:
>> - used QSERDES_COM_RESETSM_CNTRL instead of
>> QSERDES_V3_COM_RESETSM_CNTRL2, which has different value
>> - in sc7180_dpphy_cfg, .regs is NULL, which results in NULL references
> 
> Can you add these as inline review comments? Would help me understand
> what you're talking about. Thanks for the review!
>
