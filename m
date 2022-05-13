Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAE4B526171
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 13:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380070AbiEMLzk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 07:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344951AbiEMLzj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 07:55:39 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0047285AFE
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 04:55:36 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id s27so10015964ljd.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 04:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=BWXjdtjDXNb6ni/GTLm4b+m6ctcJfNLEzZiRu6oBfwM=;
        b=aqKuiX154is7FJUpi1R8IdvDaiFB++QSQOS2uocvXsO4hWXuYurrmUCNjxy9IJ5gt2
         VUWWj78Czlnfq9WVsGIm2gMu0s5vTzLeGHyssh/j3aWt/puHX5rCaU2dNyhQa6PfeULI
         2MKJ2o/vCtem0eyof+MXzrdDHk5Uj+HASc7geNabhwZIF9JxXsL/rderzp4Zhq8H3/90
         28Oo+VNrFEJcgrPF74O3UdXSewE5M0juY7xYf9DHO4yOftNzl0VyWDFE7fKw1GrVEPbO
         7SsmaoWZZAQkdXPaxVzvqaQYd1OZRPgfLUZW1foLe2pvAPCkoqRDMjf77OHGRpzKOZiP
         DivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BWXjdtjDXNb6ni/GTLm4b+m6ctcJfNLEzZiRu6oBfwM=;
        b=Swa7Q8IsOFspwfMuvmh3xVjnjMlZONuNRlQk+D7z9eZ6ECy2xNDIWiVGe+tAo4vW7Q
         xjGsLH3OiNM2TGQNA/RCO7Aum3+poJwptmS6g95fdJlFEkAaG/lnUkVaMYDqsrnTZ0wS
         x+iJ+zlT19USp0AY8a2/96OCEjIABRMxC7OCXd0+oxzpdZ0UKFTbbnk8UdIg2i5FkOeg
         ryUsnghGFhRu6/5C6m/5Gl+nTsc39qQ+VC6JlOqTL27KgpM0j/xH5/iuWOaQMuQQSrxr
         afTxxHgztNVL8L/ZooC398p+6rlaW1uoy4Qfad9umLYfNpvhPGORRnbATaM1J4Sllo24
         7OGg==
X-Gm-Message-State: AOAM5312PFj46I6b4Zv2l3yqbS/SQUo93i6P2xei5yLHLPO0YIypDpjX
        e8tPwfuiXblcvxY7/Fp1FPyGXA==
X-Google-Smtp-Source: ABdhPJyihsUNwQrrmSPPzo9FASu6qH3wwhsjygHdujD9u/4JkFplSQLT/gDF0qzTtCSPKA2xHJoeew==
X-Received: by 2002:a2e:91c7:0:b0:24f:1114:86fd with SMTP id u7-20020a2e91c7000000b0024f111486fdmr2873427ljg.147.1652442935109;
        Fri, 13 May 2022 04:55:35 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d15-20020ac25ecf000000b0047255d210f7sm356326lfq.38.2022.05.13.04.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 04:55:34 -0700 (PDT)
Message-ID: <5c659924-0272-d262-86f1-543a0d01127f@linaro.org>
Date:   Fri, 13 May 2022 14:55:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] drm/msm: don't free the IRQ if it was not requested
Content-Language: en-GB
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220507010021.1667700-1-dmitry.baryshkov@linaro.org>
 <CAE-0n50tgiNj6j8+90xNw2Sku7rHKOGQYrHRjHCHb8-rqnOAxg@mail.gmail.com>
 <CAA8EJpqFksVc+Lj4-G81z26GH-WbQ3CKOUwgsx0Xar-F+EMNRg@mail.gmail.com>
 <CAE-0n51KAdQHvpgon6-qpLXZT7X8ghZ+9bSeTji-duMOG2wYiQ@mail.gmail.com>
 <d6509c64-3a3e-f13b-6a3f-06f50c427eaf@linaro.org>
 <CAE-0n51Bt6VKJb4RjFfNUJVpWu=3jZs7Ym++7oa+-uvMf=hfWA@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n51Bt6VKJb4RjFfNUJVpWu=3jZs7Ym++7oa+-uvMf=hfWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/05/2022 04:41, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-05-11 18:30:55)
>> On 12/05/2022 04:29, Stephen Boyd wrote:
>>> Quoting Dmitry Baryshkov (2022-05-11 18:01:31)
>>>> On Thu, 12 May 2022 at 03:54, Stephen Boyd <swboyd@chromium.org> wrote:
>>>>>
>>>>> Quoting Dmitry Baryshkov (2022-05-06 18:00:20)
>>>>>
>>>>> Does this supersede commit 01013ba9bbdd ("drm/msm/disp/dpu1: avoid
>>>>> clearing hw interrupts if hw_intr is null during drm uninit")? I mean
>>>>> that with this patch applied kms->irq_requested makes the check in
>>>>> dpu_core_irq_uninstall() irrelevant because it isn't called anymore?
>>>>
>>>> Yes.
>>>>
>>>
>>> I didn't see it deleted in the second patch so is a revert going to be
>>> sent?
>>
>> No need to. They are separate checks. The older one is superseded (as it
>> will be never hit),  but it is still valid and useful (to protect from
>> the crash if this code changes again).
>>
> 
> Ew, gross. The extra conditionals everywhere really makes it hard to
> follow along.

With the second patch being dropped I'd prefer to leave both conditions 
in place.

-- 
With best wishes
Dmitry
