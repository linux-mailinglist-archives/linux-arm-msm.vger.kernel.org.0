Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E526B62BFA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 14:40:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233816AbiKPNkN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 08:40:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbiKPNkL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 08:40:11 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 692BE1D314
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 05:40:09 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id d3so21880142ljl.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 05:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FX8GOOnP8ZSHhFFHMXCztbsOldYRDIsb+WpAuI+TEYY=;
        b=G0sSQZ+ZXtWza2AMGO5KtIK3UUOSszCPt0Ds4x2tbPyvXoCP1N4XsDJajiJjAoPVz3
         S597ujYXmn7p1BIoDzoV7st9ACahbFha6DFkOwZHiT7UG8HvLqxwVSP2XvXpPCOkXTI7
         Cv2ApHXlWau+FpdOor2E4l3G5+gt7SiHyJ+muVXdBrmsJsQPwja0dlNn4LK9kEpXL237
         V9ov0VTesXcp4REzRPvKNuzrsBE3JQLzojsZVuX1XjQwYHYCnGNGir8DRVex9qNXg/x6
         dRWipbefTwIgPOq93TA5nf3ICzojrsgKd85962ypqbCpznOOZPrjUJKx/rtnvzhsEADU
         gItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FX8GOOnP8ZSHhFFHMXCztbsOldYRDIsb+WpAuI+TEYY=;
        b=y38qk0/G41fcfkV813bBvMi/vtzHh6zmdOtAkOb/4phIOBnFxl82/Fq6Wrr0OWG17L
         lM2b2A0GZSIiYtCxTi+D+tHjycEMrUWxuKgRf1e4WUHIPAUBzpgqTgKMe9Jf2wnGVBvG
         ugvFhvrhj4dUvK1gYhZuxjJq/wvK5Q+cAmciwUs4laKwSHnL0G/F7IOkq224pQXmh3yr
         tIsFfwZGmebpJJ4Phb5A9kOOBoZjsgTVfznjasFzTkBhL6NwsiMVUGQFln+cyVTlSBNp
         KQhEFEypMWu+qTM3hHj4tjoUzFjpXUUN5hUie/fdqC/tzEaMky+mOx1Ycb5vyNRaBKWZ
         w9Zg==
X-Gm-Message-State: ANoB5pnxZu5/hRKYSbZkiti6hRQdgSPPJv8NyzChQ+nQUdIA96X5aU2L
        ETtS3JDk/AAoThpUmWsbYpDjkA==
X-Google-Smtp-Source: AA0mqf4Xa+9O40J4HIpQQrKtCOdBgL3RPVHzmGhM1GxAcMR09YAelDkNslDme++FbVKiCuGubiRdHQ==
X-Received: by 2002:a2e:a30a:0:b0:277:6231:5a7 with SMTP id l10-20020a2ea30a000000b00277623105a7mr7166027lje.300.1668606007736;
        Wed, 16 Nov 2022 05:40:07 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v14-20020a056512096e00b0048af9576d30sm2596273lft.83.2022.11.16.05.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 05:40:07 -0800 (PST)
Message-ID: <e85245a8-480a-0b1f-0e10-6a6d64ae76ec@linaro.org>
Date:   Wed, 16 Nov 2022 16:40:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] drm/msm/dp: remove limitation of link rate at 5.4G to
 support HBR3
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Doug Anderson <dianders@chromium.org>
Cc:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, quic_abhinavk@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>
References: <1667237245-24988-1-git-send-email-quic_khsieh@quicinc.com>
 <94b507e8-5b94-12ae-4c81-95f5d36279d5@linaro.org>
 <deb60200-5a37-ec77-9515-0c0c89022174@quicinc.com>
 <CAD=FV=X_fs_4JYcRvAwkU9mAafOten9WdyzPfSVWdAU=ZMo8zg@mail.gmail.com>
 <155e4171-187c-4ecf-5a9b-12f0c2207524@linaro.org>
 <CAD=FV=Wk5rBSq9Mx1GCO0QFYckKV9KUFKL36Ld7dQX1ypHVcYw@mail.gmail.com>
 <CAD=FV=XTOUjVAGFWZ6xTkcNOrCT1p73aU-=KJNYUOxsS-BQsyA@mail.gmail.com>
 <c5aedb31-3881-50e7-f747-e75b18c3f4b8@linaro.org>
 <CAD=FV=WPde5wVOGCKQYGuGwgCwRebox4FF0MgV_2pPCTsfo_UA@mail.gmail.com>
 <60643572-4148-cea5-e64d-ec6534b0c407@linaro.org>
 <a4127ba2-5968-e8a9-da63-fd709aa01e7f@quicinc.com>
 <adf5f80a-17e5-1163-a93c-2759ae57d77d@linaro.org>
 <dcddd992-60e9-b802-b7a3-bab877545761@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <dcddd992-60e9-b802-b7a3-bab877545761@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/11/2022 21:43, Kuogee Hsieh wrote:
> 
> On 11/9/2022 11:43 PM, Dmitry Baryshkov wrote:
>> On 10/11/2022 02:47, Kuogee Hsieh wrote:
>>>
>>> On 11/2/2022 11:04 AM, Dmitry Baryshkov wrote:
>>>> On 02/11/2022 20:28, Doug Anderson wrote:
>>>>> Hi,
>>>>>
>>>>> On Wed, Nov 2, 2022 at 10:23 AM Dmitry Baryshkov
>>>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>>>
>>>>>>> 1. Someone figures out how to model this with the bridge chain and
>>>>>>> then we only allow HBR3 if we detect we've got a TCPC that supports
>>>>>>> it. This seems like the cleanest / best but feels like a long pole.
>>>>>>> Not only have we been trying to get the TCPC-modeled-as-a-bridge 
>>>>>>> stuff
>>>>>>> landed for a long time but even when we do it we still don't have a
>>>>>>> solution for how to communicate the number of lanes and other stuff
>>>>>>> between the TCPC and the DP controller so we have to enrich the 
>>>>>>> bridge
>>>>>>> interface.
>>>>>>
>>>>>> I think we'd need some OOB interface. For example for DSI 
>>>>>> interfaces we
>>>>>> have mipi_dsi_device struct to communicate such OOB data.
>>>>>>
>>>>>> Also take a note regarding data-lanes from my previous email.
>>>>>
>>>>> Right, we can somehow communicate the max link rate through the bridge
>>>>> chain to the DP controller in an OOB manner that would work.
>>>>
>>>> I'd note that our dp_panel has some notion of such OOB data. So do 
>>>> AUX drivers including the panel-edp. My suggestion would be to 
>>>> consider both of them while modelling the OOB data.
>>>>
>>>>>
>>>>>
>>>>>>> 2. We add in a DT property to the display controller node that says
>>>>>>> the max link rate for use on this board. This feels like a hack, but
>>>>>>> maybe it's not too bad. Certainly it would be incredibly simple to
>>>>>>> implement. Actually... ...one could argue that even if we later 
>>>>>>> model
>>>>>>> the TCPC as a bridge that this property would still be valid / 
>>>>>>> useful!
>>>>>>> You could certainly imagine that the SoC supports HBR3 and the TCPC
>>>>>>> supports HBR3 but that the board routing between the SoC and the 
>>>>>>> TCPC
>>>>>>> is bad and only supports HBR2. In this case the only way out is
>>>>>>> essentially a "board constraint" AKA a DT property in the DP
>>>>>>> controller.
>>>>>>
>>>>>> We have been discussing similar topics with Abhinav. Krzysztof 
>>>>>> suggested
>>>>>> using link-frequencies property to provide max and min values.
>>>
>>> questions,
>>>
>>> 1)is Krzysztof suggested had been implemented?
>>
>> I can not parse this question, please excuse me.
>>
>> Yes, Krzysztof suggested this being implemented as a link property, 
>> see media/video-interfaces.txt.
>>
>> Moreover your implementation goes against both the existing definition 
>> (array with the list of frequencies) and Krzysztof's suggested 
>> extension (min and max). Listing just a single frequency goes against 
>> both these suggestions. In case of DP we have a fixed set of 
>> frequencies. Thus I'd suggest listing all supported frequencies instead.
> 
> I think this proposal is kind of strange.
> 
> According to DP spec, if a link support 5,4G, then it must support 1.6, 
> 2.7 and 5.4.
> 
> If it support 8.1G, then it must support 1.6 , 2.7 and 5.4.
> 
> There is no link can only support 2.7 and 5.4G without supporting 1.6G.

Let me quote the docs.

   link-frequencies:
     $ref: /schemas/types.yaml#/definitions/uint64-array
     description:
       Allowed data bus frequencies. For MIPI CSI-2, for instance, this 
is the
       actual frequency of the bus, not bits per clock per lane value. 
An array
       of 64-bit unsigned integers.

Note. 'allowed data bus frequencies'. So by listing only the max 
frequency you'd break this description.

-- 
With best wishes
Dmitry

