Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23F36501C5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Apr 2022 22:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346046AbiDNUGG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Apr 2022 16:06:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346049AbiDNUGF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Apr 2022 16:06:05 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0B4ADD958
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 13:03:36 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id v13so1263303ljg.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 13:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=beqqQMdRDQ9RUWQqne39QWiVSV/dlCi62JNsxM9+crs=;
        b=tGi1B2Kx0rNnAyl3InWnsf/q3MTIoRbgwNYozMzh2/GDAhUhX/iPuUhSdKNqcjl8ym
         WaKCTbUIkFORkXGPAUaiv82SDHUJWmhW1y1Y8RpXig6VzkNG2Xyjey+SVAKCWDfLR8zZ
         lUC3CGaxZI28q+i9ZxPHo7Ig8ELXwRRIL7MSA2BuLlUDnFJ3EzjyqMV3Z/hZ9/hVlEaL
         QnXBqnlKWI3+kZHauGmY1NQLScQoC1GgSONcDo9VQr4bp3GohNPlX/+UeYOZd+uVXVNC
         t9ap9ngZR4yFUKz+o7v8NgtZJ6lFtF8++cBrJva0onfGV01qYph3tGbiSiA8psbX6R4t
         Kxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=beqqQMdRDQ9RUWQqne39QWiVSV/dlCi62JNsxM9+crs=;
        b=oROwjUmBuktzN32K8BwsQ7RWgXQ4wKVViUr0hLZ7vKuWn8B6eHTvgy3DhgX0O+N31U
         wdcbAI7PcF8ixz1vwIOZiNe62uOmOjIm+l9bQBleSj4KEHc4g9Wxx7PR/8rNLLx4xj6U
         DgOy0kH7CtzSSzkcoeWC+Y/kPDJ0npsIYUpce/5Bqqu8xz+hCgv89SaswAsDWfhzfDNo
         RO7opkcPEjRLoy8TYKnKW0Wpyk1IOmjK+vYThDNPGZJvco7wrlhEgHBAcMa0Q7jLFKba
         W8sxNbqGlJgMN5X3sAkgdBN90FLWWwJL/ODDvrVQASYz+Bj/IVIpho0vr8OXZ0IqT4TX
         M4Pw==
X-Gm-Message-State: AOAM533SzobBEQZga3C0/VcWA95UoggV5dFrIksY/Hj6gihuQ4WYqdBF
        CkPpWTsy81BQlgilAqnAd8ClVA==
X-Google-Smtp-Source: ABdhPJwAs9fOjjGshqLg5XWviayRGs5Tm3QRuhmlg02hwi9L+QMiaB5VyBAX43z8HwLdTai9w0U2FA==
X-Received: by 2002:a2e:302:0:b0:24a:c997:d34c with SMTP id 2-20020a2e0302000000b0024ac997d34cmr2538120ljd.445.1649966615179;
        Thu, 14 Apr 2022 13:03:35 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b19-20020a196713000000b0046b911a2ccdsm93716lfc.214.2022.04.14.13.03.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Apr 2022 13:03:34 -0700 (PDT)
Message-ID: <2fd4a157-a9de-ca0e-7a47-7bb85199ae91@linaro.org>
Date:   Thu, 14 Apr 2022 23:03:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [Freedreno] [PATCH v7 0/4] Add support for the eDP panel over
 aux_bus
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     quic_kalyant <quic_kalyant@quicinc.com>,
        devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        quic_vproddut <quic_vproddut@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Aravind Venkateswaran <quic_aravindh@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        freedreno <freedreno@lists.freedesktop.org>
References: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=Ui6BAsnTaJ2_TMh1Tnjtaw7FR92aWoUysS+UT=c0qB3Q@mail.gmail.com>
 <20afcd97-4b8d-f770-151a-268b893b7c5a@linaro.org>
 <CAE-0n51fc-b-8VF7XP29=o8Xi86HQALGB-1u8n3b_3NjVyyJYw@mail.gmail.com>
 <e3154f3b-aea4-6961-b409-6b20ff8bf18e@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <e3154f3b-aea4-6961-b409-6b20ff8bf18e@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/04/2022 23:00, Abhinav Kumar wrote:
> Hi Dmitry
> 
> On 4/14/2022 12:43 PM, Stephen Boyd wrote:
>> Quoting Dmitry Baryshkov (2022-04-14 12:20:31)
>>> On 14/04/2022 19:40, Doug Anderson wrote:
>>>> Hi,
>>>>
>>>> On Thu, Apr 14, 2022 at 5:19 AM Sankeerth Billakanti
>>>> <quic_sbillaka@quicinc.com> wrote:
>>>>>
>>>>> This series adds support for generic eDP panel over aux_bus.
>>>>>
>>>>> These changes are dependent on the following series:
>>>>> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=613654&state=* 
>>>>>
>>>>
>>>> You're basically depending on the last two patches of that series.
>>>> What's the plan there? In patchwork they're marked as "Not
>>>> Applicable". If they're good to go, maybe we should land them? If not,
>>>> maybe you should include them (with Dmitry as the author, of course)
>>>> at the beginning of your series?
>>>
>>> No, please do not resend patches. The patches in question are marked as
>>> 'Not applicable' as they are really not applicable to Bjorn's tree.
>>> It would be better to point to the correct patchwork:
>>>
>>> https://patchwork.freedesktop.org/series/98585/
>>>
>>> Note those patches still lack the R-B tag. I can include them anyway,
>>> basing on Sankeerth's Tested-by tag, but the formal R-B would also be 
>>> good.
>>>
>>
>> Can you resend those as not RFC?
> 
> Yes, please resend these, I can ack them.
> 
> Previously I held off my ack, as kuogee ran into some issues testing 
> them which was later concluded to be a mismatch in QC internal trees due 
> to different versions of the changes.( another reason why we should get 
> these landed ).
> 
> Now, that Sankeerth has tested these, if you can remove RFC and post 
> them, I can ack the.

Well, you can ack those patches without them being resent. You have 
already added your Reviewed-by to first three patches (which were merged 
during last window).


-- 
With best wishes
Dmitry
