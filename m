Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3064B3E8642
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 00:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235196AbhHJW77 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 18:59:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235192AbhHJW77 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 18:59:59 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74667C061765
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 15:59:36 -0700 (PDT)
Received: from [10.0.20.6] (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id CB30B1F562;
        Wed, 11 Aug 2021 00:59:30 +0200 (CEST)
Subject: Re: [PATCH] drm/msm/dsi: add support for dsi test pattern generator
To:     abhinavk@codeaurora.org
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        swboyd@chromium.org, khsieh@codeaurora.org, seanpaul@chromium.org,
        dmitry.baryshkov@linaro.org, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org
References: <1624993464-20447-1-git-send-email-abhinavk@codeaurora.org>
 <61cdcd07-5bff-a8ae-7156-b85b9c6c8801@somainline.org>
 <f6235d170811ad02bf6321dcb5ef3568@codeaurora.org>
From:   Marijn Suijten <marijn.suijten@somainline.org>
Message-ID: <1cc300dc-7647-0431-fe05-d5504c337652@somainline.org>
Date:   Wed, 11 Aug 2021 00:59:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <f6235d170811ad02bf6321dcb5ef3568@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Abhinav,

On 7/16/21 2:01 AM, abhinavk@codeaurora.org wrote:
> Hi Marijn
> 
> Sorry for the late response.


Apologies from my side as well.

[...]

>>> +static void msm_dsi_host_cmd_test_pattern_setup(struct msm_dsi_host
>>> *msm_host)
>>> +{
>>> +	u32 reg;
>>> +
>>> +	reg = dsi_read(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL);
>>> +
>>> +	dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CMD_MDP_INIT_VAL0,
>>> 0xff);
>>> +
>>> +	reg |= (0x3 << 0x8);
>>> +	dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL, reg);
>>> +	/* draw checkered rectangle pattern */
>>> +	dsi_write(msm_host, REG_DSI_TPG_MAIN_CONTROL2, (0x1 << 0x7));
>>
>>
>> How about BIT(7)?
> 
> You mean BIT(7) of REG_DSI_TPG_MAIN_CONTROL2? Thats what this is right?
> Did you mean some other bit?


I meant to replace (0x1 << 0x7) with BIT(7), but replacing it with 
DSI_TPG_MAIN_CONTROL2_CMD_MDP0_CHECKERED_RECTANGLE_PATTERN is even 
better, thanks.

> 
>>
>> On SM6125 this seems to change the color intensity of the pattern; it
>> is always colored lines of a few pixels wide alternating R, B and G
>> from left to right.  Is it possible to document the meaning and
>> available values of these registers, especially if they differ between
>> SoC / DSI block?
>>
> 
> I have requested access for SM6125, will check this register on that to
> see if there
> is any difference.
> 
> Are you saying you are not seeing a rectangular checkered pattern while
> testing?


Correct.  It's fixed now, and this patch already proves its usefulness! 
  We had two minor configuration issues, and are now seeing the squares 
just like on the other SoCs.  Meaning we can finally move on to 
configuring the DPU, thanks!

> Also are you testing on command mode or video mode?


Command mode, if it's still worth anything.

> As requested by Rob, I will add the bit definitions and update the
> dsi.xml.h in the
> next patchset for the registers and the bits which I am using here.
> 
> With that the meaning of these bits will be more clear.
> 
> I dont think I will be able to document all the bits because the goal of
> this patch
> was only to draw a test pattern to help with validation. Different bits
> of the REG_DSI_TPG_MAIN_CONTROL2
> register only draw different patterns so the goal wasnt that we can draw
> any pattern, it was just to
> draw some pattern on the screen.
> 
> When we add support for all other patterns, we can expose those bits as
> well but it should not
> be required in my opinion.


Understandable.  I'm curious if other patterns are useful in certain 
situations, like DSC?  Other than that, knowing that the DSI and PHY is 
correct is good enough for us.

> 
>> Kind regards,
>> Marijn
>>
>>> +	DBG("Cmd test pattern setup done\n");
>>> +}
>> [...]


Thanks!
Marijn
