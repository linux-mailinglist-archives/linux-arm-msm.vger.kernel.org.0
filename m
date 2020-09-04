Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 468B025D8D9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 14:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730247AbgIDMo7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Sep 2020 08:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730178AbgIDMo6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Sep 2020 08:44:58 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8B21C061245
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2020 05:44:57 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id g72so6079514qke.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2020 05:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=u/6aS+fO3f2HAZIX7yTyGp73Ryu5diAvL/a/HUNn8DM=;
        b=TB8jE4+Eq7MZJss2tf/lM7rK/rjrNtN7JdVwuhGnXRzCTnbNKvv8qgaXDfeX7QeDJ0
         DTCOrI+LyCa8Wk4xjgwhynfyh+whNAXiPvccAsovl6xhhuhFSNYBpBVdKcAVmSEHHPSD
         ADXCgTX2i7C1FzKNjqh3PVXbrbiwsuFomg/1BdAOp9I1fD6WCOddDXeSSJJJYItqkQvM
         Wp+tV0/FyoWprgDaqq5W/B4SrzKk8eQsCuf5BouBiED4plQZv9dMQgbBtZMXT4OEfQXe
         zb6okXrClZ1Jo5KNF+IvQXm/e/q2R7jukZdmcTofac83cFuYgOJdgGcsYzF963wz30wT
         vBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u/6aS+fO3f2HAZIX7yTyGp73Ryu5diAvL/a/HUNn8DM=;
        b=grT9cZVrnRNjWcUzihBl+tWn3baZjbWwh+Ue9fPhLPb+lFXX97I5wuhpZtGotg3FF8
         fYTwrdtd6zbfjWSKcO5VIxaoZGPscdOvHF2MvH6V5nWXb4Ds6+0kRL7GqrWoF6NbxQxK
         lfpKqHf0Xq+QOCOGzkrMny+UxkjH59Ik3SZzZiUE1MUz2VqJrPbXIL4Q+0zlDYpgsCB7
         oRBbMGY6iAN+uvheHfK+dB8+SHPBafzIZaAmNI2JU+yZm2RARYExnJwcxPOQdXC+yKKO
         oKdhGr83rku2p0vV3B56UrTQRmR2sLHagySScMjY+zuOkakCjyKIjk+yszJAc1jBg7u4
         9Azw==
X-Gm-Message-State: AOAM533tahiuymHUkCaeRbJIZsk146j2Bmzl62dDdy+2xK8Ek/0sfsLw
        KzEg3pijlwr624zV9++koN2OWw==
X-Google-Smtp-Source: ABdhPJwilpsizj8EN3MjJbMG/UWa8VBa+3DaTqyNqtWHTff/8XDRLxa0agzhi64X+ancstOq7aP/Bg==
X-Received: by 2002:a37:a1cd:: with SMTP id k196mr722274qke.409.1599223496665;
        Fri, 04 Sep 2020 05:44:56 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id q142sm4175070qke.48.2020.09.04.05.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2020 05:44:56 -0700 (PDT)
Subject: Re: [PATCH v2 07/10] phy: qcom-qmp: Add support for DP in USB3+DP
 combo phy
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <4c0f59f8-b7fa-432f-2255-8d253f434a59@marek.ca>
Date:   Fri, 4 Sep 2020 08:44:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <9f99cc8b-2cfd-280f-e52a-23d098934a11@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/4/20 8:29 AM, Dmitry Baryshkov wrote:
> On 03/09/2020 23:43, Jonathan Marek wrote:
>> On 9/2/20 7:02 PM, Stephen Boyd wrote:
>>> Add support for the USB3 + DisplayPort (DP) "combo" phy to the qmp phy
>>> driver. We already have support for the USB3 part of the combo phy, so
>>> most additions are for the DP phy.
>>>
>>> Split up the qcom_qmp_phy{enable,disable}() functions into the phy init,
>>> power on, power off, and exit functions that the common phy framework
>>> expects so that the DP phy can add even more phy ops like
>>> phy_calibrate() and phy_configure(). This allows us to initialize the DP
>>> PHY and configure the AUX channel before powering on the PHY at the link
>>> rate that was negotiated during link training.
>>>
>>> The general design is as follows:
>>>
>>>    1) DP controller calls phy_init() to initialize the PHY and configure
>>>    the dp_com register region.
>>>
>>>    2) DP controller calls phy_configure() to tune the link rate and
>>>    voltage swing and pre-emphasis settings.
>>>
>>>    3) DP controller calls phy_power_on() to enable the PLL and power on
>>>    the phy.
>>>
>>>    4) DP controller calls phy_configure() again to tune the voltage 
>>> swing
>>>    and pre-emphasis settings determind during link training.
>>>
>>>    5) DP controller calls phy_calibrate() some number of times to change
>>>    the aux settings if the aux channel times out during link training.
>>>
>>>    6) DP controller calls phy_power_off() if the link rate is to be
>>>    changed and goes back to step 2 to try again at a different link 
>>> rate.
>>>
>>>    5) DP controller calls phy_power_off() and then phy_exit() to power
>>>    down the PHY when it is done.
>>>
>>> The DP PHY contains a PLL that is different from the one used for the
>>> USB3 PHY. Instead of a pipe clk there is a link clk and a pixel clk
>>> output from the DP PLL after going through various dividers. Introduce
>>> clk ops for these two clks that just tell the child clks what the
>>> frequency of the pixel and link are. When the phy link rate is
>>> configured we call clk_set_rate() to update the child clks in the
>>> display clk controller on what rate is in use. The clk frequencies
>>> always differ based on the link rate (i.e. 1.6Gb/s 2.7Gb/s, 5.4Gb/s, or
>>> 8.1Gb/s corresponding to various transmission modes like HBR1, HBR2 or
>>> HBR3) so we simply store the link rate and use that to calculate the clk
>>> frequencies.
>>>
>>> The PLL enable sequence is a little different from other QMP phy PLLs so
>>> we power on the PLL in qcom_qmp_phy_configure_dp_phy() that gets called
>>> from phy_power_on(). This should probably be split out better so that
>>> each phy has a way to run the final PLL/PHY enable sequence.
>>>
>>> This code is based on a submission of this phy and PLL in the drm
>>> subsystem.
>>
>> I updated my upstream-based sm8150/sm8250 displayport stack [1] to use 
>> these patches.
> 
> I have tried your branch on my RB5 with two different dongles. Both 
> dongles provide the same behaviour:
>   - on first plug I see VDM Tx errors,
>   - after I unplug and replug the dongle, PD phy seems to be stuck on 
> sending capabilities.
> 
> See attached logs.
> 
> Also I had to add typec_unregister_port(port->typec_port); to 
> IS_ERR(alt) in your tcpm.c hack.
> 
> I'm currently finishing the driver for the mux/redriver, will retry 
> testing afterwards.
> 

As I mentioned the TCPM driver has a lot of issues. The "hard reset" 
isn't implemented correctly so going into that mode gets it stuck in a 
bad state. Note I am using this dongle [1], and it only works correctly 
in sink mode (with the dongle providing power), in source mode it does 
negotiate the alt mode, but never gets the HPD event that DP driver is 
waiting for.

https://www.amazon.ca/Cable-Matters-Multiport-DisplayPort-Ethernet/dp/B06Y5N3YCD

>> This commit [2] might interest you, so that you can consider what 
>> needs to change between v3 and v4 PHYs. Note some of the V4 registers 
>> have the same address as V3, so the diff could be smaller.
>>
>> Do you have any plan for dealing with the SS PHY and DP PHY 
>> conflicting with each other? For example, PHY_MODE_CTRL needs to be 
>> "DP_MODE" for 4-lane DP, "DP_MODE | USB3_MODE" for 2-lane DP + USB3, 
>> and (AFAIK) "USB3_MODE" for superspeedplus usb (and it seems this 
>> gates some clocks, so you can't read/write dp tx2 registers in 2-lane 
>> DP mode for example). From your cover letter it sounds like this isn't 
>> relevant to your hardware, but it looks like both PHYs are writing to 
>> the dp_com region which is still problematic. (in the branch I linked, 
>> I disabled the SS PHY to test the DP PHY)
>>
>> Also some issues I noticed:
>> - used QSERDES_COM_RESETSM_CNTRL instead of 
>> QSERDES_V3_COM_RESETSM_CNTRL2, which has different value
>> - in sc7180_dpphy_cfg, .regs is NULL, which results in NULL references
>>
>> [1] https://github.com/flto/linux/commits/sm8x50-hdk-display
>> [2] 
>> https://github.com/flto/linux/commit/ccf56912bd5e652b4daebec1300961a9d51342b1 
>>
> 
> 
