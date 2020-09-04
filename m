Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4AFC25D90B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 14:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730178AbgIDM52 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Sep 2020 08:57:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729897AbgIDM50 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Sep 2020 08:57:26 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FDEEC061245
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2020 05:57:25 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id u27so3767937lfm.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2020 05:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8GlQkjXHe55LHZB2lHiYIu853ibpNGCiL6ph4EkjLC0=;
        b=PvzH0SIAklhtrU2bxnDv4DBvhoX5lQIH06mHJozoCeS/DbVrVoTQujCfZuoT7VKUVD
         eMe37vXZ9n3+fHtnbgpfft9T9TdrlVWU+yid1Hsy5e2VzlH+P6UXOOuEcilS+SQG47KI
         6a3OjvzyZkQLtV9lFHglPtEOkeAS11L2qJx1uCX8EAfnR6SLE7RO1mGfeXuHEHWJltgt
         eV/BTAG4EyM/Vn7aSpHYr0Mmt/dmo3mi0wKMFoeHATDrdJL725zjXxwgZYx2UBi5oFw2
         0foAZX13ZN3ujvmsznV7ZPKnoCgTTA/n5Z7Z1gu5jUP669/ZL1Ao2bRYrRBwgyAM0Rvg
         GJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8GlQkjXHe55LHZB2lHiYIu853ibpNGCiL6ph4EkjLC0=;
        b=a6vGgNcBdGCj4FzM562Io//BniGMMOLff859JRafV4fyZ7ZhZi9nhaq7ewCWXrnISh
         MI7iZxGDgd234hVsp9JpiRczdkMafnwYXbIPPix8cCyJdEWsJz3VACKLa5P8vYc7jny3
         LyLdXrYvbZhpWSiGgj2W6GghOCkABH24YPC5oG7XG2IZ5YpD0y89D6OD+R66SaUmNoMW
         NhnAsihR3Rou5tXcBL/BIgwqmD/zX3MBtAYz57VQVcH7J3/44ejfzEQMdUkOQZFaSbSi
         1keqRq847zS0J8mZrSpJDnias4I++mbS/tk3F5UbOXk621W0yUA30JpKSxNHRO0lnUdF
         1/lw==
X-Gm-Message-State: AOAM531IdIc91TmwfW8Z57xaf0ZufF8okQrurzJqZ+4jvU3+7mo6joVr
        dF7zxc6r1rmkfrsTK81wvwQr/Q==
X-Google-Smtp-Source: ABdhPJy6PvardLC1xge4MYT8+GmbaFkYE9Ni9x/dQ5tN07+HlVQ5IBLFCJlABr7P9PTxCwGg8zVy5A==
X-Received: by 2002:a05:6512:10d1:: with SMTP id k17mr3836894lfg.179.1599224242629;
        Fri, 04 Sep 2020 05:57:22 -0700 (PDT)
Received: from [192.168.1.211] ([188.162.64.166])
        by smtp.gmail.com with ESMTPSA id j28sm1288148lfk.97.2020.09.04.05.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2020 05:57:21 -0700 (PDT)
Subject: Re: [PATCH v2 07/10] phy: qcom-qmp: Add support for DP in USB3+DP
 combo phy
To:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <swboyd@chromium.org>,
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
        Rob Clark <robdclark@chromium.org>
References: <20200902230215.3452712-1-swboyd@chromium.org>
 <20200902230215.3452712-8-swboyd@chromium.org>
 <b6f80242-482d-b778-690b-8aefa4e8f23e@marek.ca>
 <9f99cc8b-2cfd-280f-e52a-23d098934a11@linaro.org>
 <4c0f59f8-b7fa-432f-2255-8d253f434a59@marek.ca>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <c8ca7193-67ae-e1d5-d36a-19655ca67d78@linaro.org>
Date:   Fri, 4 Sep 2020 15:57:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <4c0f59f8-b7fa-432f-2255-8d253f434a59@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/09/2020 15:44, Jonathan Marek wrote:
> On 9/4/20 8:29 AM, Dmitry Baryshkov wrote:
>> On 03/09/2020 23:43, Jonathan Marek wrote:
>>> On 9/2/20 7:02 PM, Stephen Boyd wrote:
>>>> Add support for the USB3 + DisplayPort (DP) "combo" phy to the qmp phy
>>>> driver. We already have support for the USB3 part of the combo phy, so
>>>> most additions are for the DP phy.
>>>>
>>>> Split up the qcom_qmp_phy{enable,disable}() functions into the phy 
>>>> init,
>>>> power on, power off, and exit functions that the common phy framework
>>>> expects so that the DP phy can add even more phy ops like
>>>> phy_calibrate() and phy_configure(). This allows us to initialize 
>>>> the DP
>>>> PHY and configure the AUX channel before powering on the PHY at the 
>>>> link
>>>> rate that was negotiated during link training.
>>>>
>>>> The general design is as follows:
>>>>
>>>>    1) DP controller calls phy_init() to initialize the PHY and 
>>>> configure
>>>>    the dp_com register region.
>>>>
>>>>    2) DP controller calls phy_configure() to tune the link rate and
>>>>    voltage swing and pre-emphasis settings.
>>>>
>>>>    3) DP controller calls phy_power_on() to enable the PLL and power on
>>>>    the phy.
>>>>
>>>>    4) DP controller calls phy_configure() again to tune the voltage 
>>>> swing
>>>>    and pre-emphasis settings determind during link training.
>>>>
>>>>    5) DP controller calls phy_calibrate() some number of times to 
>>>> change
>>>>    the aux settings if the aux channel times out during link training.
>>>>
>>>>    6) DP controller calls phy_power_off() if the link rate is to be
>>>>    changed and goes back to step 2 to try again at a different link 
>>>> rate.
>>>>
>>>>    5) DP controller calls phy_power_off() and then phy_exit() to power
>>>>    down the PHY when it is done.
>>>>
>>>> The DP PHY contains a PLL that is different from the one used for the
>>>> USB3 PHY. Instead of a pipe clk there is a link clk and a pixel clk
>>>> output from the DP PLL after going through various dividers. Introduce
>>>> clk ops for these two clks that just tell the child clks what the
>>>> frequency of the pixel and link are. When the phy link rate is
>>>> configured we call clk_set_rate() to update the child clks in the
>>>> display clk controller on what rate is in use. The clk frequencies
>>>> always differ based on the link rate (i.e. 1.6Gb/s 2.7Gb/s, 5.4Gb/s, or
>>>> 8.1Gb/s corresponding to various transmission modes like HBR1, HBR2 or
>>>> HBR3) so we simply store the link rate and use that to calculate the 
>>>> clk
>>>> frequencies.
>>>>
>>>> The PLL enable sequence is a little different from other QMP phy 
>>>> PLLs so
>>>> we power on the PLL in qcom_qmp_phy_configure_dp_phy() that gets called
>>>> from phy_power_on(). This should probably be split out better so that
>>>> each phy has a way to run the final PLL/PHY enable sequence.
>>>>
>>>> This code is based on a submission of this phy and PLL in the drm
>>>> subsystem.
>>>
>>> I updated my upstream-based sm8150/sm8250 displayport stack [1] to 
>>> use these patches.
>>
>> I have tried your branch on my RB5 with two different dongles. Both 
>> dongles provide the same behaviour:
>>   - on first plug I see VDM Tx errors,
>>   - after I unplug and replug the dongle, PD phy seems to be stuck on 
>> sending capabilities.
>>
>> See attached logs.
>>
>> Also I had to add typec_unregister_port(port->typec_port); to 
>> IS_ERR(alt) in your tcpm.c hack.
>>
>> I'm currently finishing the driver for the mux/redriver, will retry 
>> testing afterwards.
>>
> 
> As I mentioned the TCPM driver has a lot of issues. The "hard reset" 
> isn't implemented correctly so going into that mode gets it stuck in a 
> bad state. Note I am using this dongle [1], and it only works correctly 
> in sink mode (with the dongle providing power), in source mode it does 
> negotiate the alt mode, but never gets the HPD event that DP driver is 
> waiting for.
> 
> https://www.amazon.ca/Cable-Matters-Multiport-DisplayPort-Ethernet/dp/B06Y5N3YCD 

I'll take a look for dongles that work in source mode (with RB5 being 
the sink). Reset being not fully implemented would answer on questions 
about replug. Any idea about VDM Tx errors?


-- 
With best wishes
Dmitry
