Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D402776C87A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 10:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232508AbjHBIj6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 04:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232200AbjHBIj4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 04:39:56 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30317B2
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 01:39:55 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fbc12181b6so70180705e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Aug 2023 01:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690965593; x=1691570393;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WRAP0HWhn6g/kOzKMWD911kOSk1jcneyHwYZl0WYjRQ=;
        b=zjxvc+i/DMwy1ldffwestytA9zQ9YS0gCIeUp8PCaYqnMRm0KdoXXjQaiLjlmVNd4R
         V9MlqPOtLLrS5A8JldTm24Y4SUL3Q/fbST66sPcPKUa7FlLcnbHIstHpy1qKRAfzEIcH
         lWzUqvT4+c3diBNyjapbUqGjGLy+6J+B4XAysz/sviUq2oKPjjVzspVzhN5fkrsPO7S/
         gsrNFKoV3BUklHuINdw0XifiiigWRFl+oINrXKVd1P9v3qESnDUt8MmAsmnBiOBMPhA8
         tTG1VSsi4f5KTXhU1Jd22P/IB1ra3DG+yYW/39m6Ue2zFdFV8+PUgo8hjAnBqUjLIOCV
         LNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690965593; x=1691570393;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WRAP0HWhn6g/kOzKMWD911kOSk1jcneyHwYZl0WYjRQ=;
        b=l1pqUExILB5d01b5GLQwpqtAXnW2wH3Q66HPmZb+73vyyUaJQSWk6bKeon321PC0Xy
         OeVSASVlnLANn8LlrETpD4EdYg3PaILL4MVviKLqvKVxyk317okWvPgPZ7FWoqPY2Ao8
         O5ntIC1oqzw29C7mMlFr5KRSYgY7v7DYVlssncNO1dzsEc4BxHW9OGyVSI0yp86fPDpX
         03kVvuNkYF9se4wF3JIErkOEGsu6CK8wAhKbQTD0aeIdP0OsRMFkQ5KGv3cu/LYfFG+V
         PmVX5bF8iM8JhAoh6BoQkL0Q7p/vEJ1qNGoWvuUCZFbwv0Dzu1HY1d0ta1QyKBrugcw6
         9bQw==
X-Gm-Message-State: ABy/qLbp7mgYb8/tFqI+e3uwhKGniaglsY2BkQX1hcK/JZVTD6bURJkg
        SJWktS0V5dDxhVkWDLIo8AiOB2fzI40gkPzjj5MAAg==
X-Google-Smtp-Source: APBJJlGt/JMMR519d7Jukm0qKi7EMlBz8mwUobaLaXQQYxBaB55wp9ApOuo9C23hQVRgAF3YcFVuYA==
X-Received: by 2002:a5d:4e0a:0:b0:317:5747:b955 with SMTP id p10-20020a5d4e0a000000b003175747b955mr4465403wrt.17.1690965593557;
        Wed, 02 Aug 2023 01:39:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196? ([2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196])
        by smtp.gmail.com with ESMTPSA id r18-20020adfce92000000b0031272fced4dsm18264016wrn.52.2023.08.02.01.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 01:39:52 -0700 (PDT)
Message-ID: <51d782c4-3539-c3d3-6844-d6b9a39c09eb@linaro.org>
Date:   Wed, 2 Aug 2023 10:39:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
 EOT packet
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Amit Pundir <amit.pundir@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Jagan Teki <jagan@amarulasolutions.com>,
        dri-devel@lists.freedesktop.org, Robert Foss <rfoss@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Michael Walle <michael@walle.cc>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux regressions mailing list <regressions@lists.linux.dev>,
        freedreno <freedreno@lists.freedesktop.org>
References: <20230403221233.500485-1-marex@denx.de>
 <20230403221233.500485-2-marex@denx.de>
 <CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com>
 <CAMty3ZBNFu=f-FS4YFN4wfmiTuk=48nna-vub1eMYwidDt+msg@mail.gmail.com>
 <CAA8EJppbdiUz5m+9EAPnFb916DaS_VKWd30c7_EPWjuid8rtqQ@mail.gmail.com>
 <CAMi1Hd2G5PJmz4wpO1wbdqKd0FA8LBgvRDv2u5ZYAMb5s6Kt0A@mail.gmail.com>
 <d5fb8106-b8f3-0acf-1267-d4d6d0860e25@linaro.org>
 <d28b0090-bd1e-6737-d92b-348dc6c30750@linaro.org>
 <4396d197-f16f-92bd-727c-eb8c78016198@quicinc.com>
 <961b4747-c9f1-a31c-c33c-475b4803f832@denx.de>
 <64c3352f-c2aa-5260-c6ff-4a607ce219a2@quicinc.com>
 <f768950b-0406-1f03-86a5-50d5794bb060@denx.de>
Organization: Linaro Developer Services
In-Reply-To: <f768950b-0406-1f03-86a5-50d5794bb060@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Marek,

On 13/07/2023 20:28, Marek Vasut wrote:

<snip>

>>>
>>> MIPI_DSI_MODE_VIDEO_NO_HFP means the HBP period is just skipped by DSIM.
>>>
>>> Maybe there is a need for new set of flags which differentiate between HBP skipped (i.e. NO HBP) and HBP LP11 ?
>>>
>>
>> No, the section of the MIPI DSI spec I posted below clearly states there are two options:
>>
>> 1) send blanking packets during those periods
>> 2) transition to LP11 during those periods
>>
>> There is no 3rd option in the spec of not doing both like what you are suggesting. So DSIM should also be only transitioning to LP11 during those periods if its not sending the blanking packets with those flags set.
>>
>> So, there is no need for any new set of flags to differentiate.
>>
>> The flags and their interpretation is correct in MSM driver. I cannot comment on what exactly DSIM does with those flags.
> 
> How do you explain the comment in include/drm/drm_mipi_dsi.h:
> 
> 128 /* disable hback-porch area */
> 129 #define MIPI_DSI_MODE_VIDEO_NO_HBP      BIT(6)

Can you specify how you determined those flags were needed on DSIM ? a vendor tree ? a datasheet ?

In the meantime, we should revert this patch because it regresses some Qcom
based platforms until we figure out what's missing to make DSIM based boards
happy.

I'll send a revert change afterwards.

Neil

> 
> Esp. the "disable" part. That to me reads as "don't send HBP packet".
> 
> Where do you see that quote above in the DSI spec (which chapter and which version do you read) ?
> 
>>>> It should be replacing those periods with LP11 too.
>>>>
>>>> The traffic mode being used on this bridge is MIPI_DSI_MODE_VIDEO_SYNC_PULSE which is "Non-Burst Mode with Sync Pulses".
>>>>
>>>> As per this traffic mode in the DSI spec,
>>>>
>>>> "Normally, periods shown as HSA (Horizontal Sync Active), HBP (Horizontal Back Porch) and HFP (Horizontal Front Porch) are filled by Blanking Packets, with lengths (including packet overhead) calculated to match the period specified by the peripheral’s data sheet. Alternatively, if there is sufficient time to transition from HS to LP mode and back again, a timed interval in LP mode may substitute for a Blanking Packet, thus saving power. During HSA, HBP and HFP periods, the bus should stay in the LP-11 state."
>>>>
>>>> So we can either send the blanking packets or transition to LP state and those 3 flags are controlling exactly that during those periods for MSM driver.
>>>>
>>>> If you stop sending the blanking packets, you need to replace that gap with LP.
>>>
>>> I don't think that's what MIPI_DSI_MODE_VIDEO_NO_HBP means, the way I understand MIPI_DSI_MODE_VIDEO_NO_HBP is that it skips the HBP completely. So if you want HBP, then do not set MIPI_DSI_MODE_VIDEO_NO_HBP . And if you want LP11 during HBP, that is I think up to the controller (or maybe another new flag?).
>>>
>>
>> No, there is no need of another new flag. There are only two options as per the spec.
>>
>> In fact, as per my checking with more folks, requiring LP11 during those periods is something very rare.
>>
>> Because usually horizontal period is usually a very short period, most of the time we do not use the LP11 option and send the blanking packets instead.
>>
>> So its something very unusual for DSIM.
>>
>> That being said, I still think my previous question is important.
>>
>> 1) What is the difference between the resolution you are trying Vs what Amit is trying?
>>
>> 2) Are you both using just standard HDMI monitors?
> 
> What is a "standard HDMI monitor" ?
> I use DELL U2713HM .
> 
> [...]

