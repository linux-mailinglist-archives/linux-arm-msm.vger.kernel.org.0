Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3C48524214
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 May 2022 03:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231279AbiELBbI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 21:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233371AbiELBbG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 21:31:06 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 591752A701
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 18:30:58 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id t25so6469686lfg.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 18:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZpnNREMqXrGizQWJD1QlgIKnhRMzjLbf/0mlxcPUNoY=;
        b=ubJMdDXJ5EZ1iKA+Zi4FaQCbOMhqLtGXLqQNQDYlQykXje9JVXVG1TBe8VOiIz+9UG
         ZLl0/Tg9qZmpr2wfWAXllTDJSX/IrR9tmSkA50GJyI1USWumZWgE9Ysu53HFKZZgeOk4
         NFOjCTmF1wFU+/A0IhLZ+ghRW406T7EoHfETAHMV7PZCZIUUwMyCo/TzAha44ot+FFgZ
         ZM1ZJKUE+AROwB5f2vOoscHXLR/B9SvSqOaa9g8RivX2NlZci7fWo+xWn/5UBHhY0yUo
         S5TvpnkJPNQmQenT96T0EJz4M18jwjsTHgtyfaC+F3al7hmyjNMOrgzxf54Wo5RKMdlr
         zUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZpnNREMqXrGizQWJD1QlgIKnhRMzjLbf/0mlxcPUNoY=;
        b=p55MtKTuFMS7jEu5c3Yw/D/a0Li0842J1s+mffgd9BhGOXqT7ODOwjLZZQJBhocsHz
         JE0h4V2evD4DtuG94BcQthtnPSuHQY4wWUsyqZm99U9OZ5CbrrSN5tjW2oy9OXUQ6qNw
         p1C6w6PXaU1aV7PNaM8NSpVqfi3EMX0xc3afVK76Hc8KS25OFstO+RQTsPhzZ6qv2S4C
         bQDz35NwL1mFQPkbd0fIpn3B3ZEJj/0Q1tvRBo37Xm3WaLZYtP5aqzZfvebQ9atChJUZ
         p0YuDR1eZwmNH36lr5dCeegSfrROcF53vvH1ksQBu/wSdgxaQXis4GAcNOOpKKB5iAbk
         yYrQ==
X-Gm-Message-State: AOAM531a5WagTPL0gVYFeRSEeccO2ShhTrIuQx8sanjzaBHX/i1tNPhg
        XxVg3B2Xg60wyCUAfVSqAReN9TbvVZdIVA==
X-Google-Smtp-Source: ABdhPJxz17HVXDGHrRDxjhowtM7J2TMXaJUPSrh389/cSdrGgYk75oaZeDPixbSwCmszFF1acZCX+w==
X-Received: by 2002:a05:6512:3f8c:b0:45d:cb2a:8779 with SMTP id x12-20020a0565123f8c00b0045dcb2a8779mr23112877lfa.499.1652319056668;
        Wed, 11 May 2022 18:30:56 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 1-20020ac25681000000b0047255d2110asm535897lfr.57.2022.05.11.18.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 18:30:56 -0700 (PDT)
Message-ID: <d6509c64-3a3e-f13b-6a3f-06f50c427eaf@linaro.org>
Date:   Thu, 12 May 2022 04:30:55 +0300
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
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n51KAdQHvpgon6-qpLXZT7X8ghZ+9bSeTji-duMOG2wYiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/05/2022 04:29, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-05-11 18:01:31)
>> On Thu, 12 May 2022 at 03:54, Stephen Boyd <swboyd@chromium.org> wrote:
>>>
>>> Quoting Dmitry Baryshkov (2022-05-06 18:00:20)
>>>
>>> Does this supersede commit 01013ba9bbdd ("drm/msm/disp/dpu1: avoid
>>> clearing hw interrupts if hw_intr is null during drm uninit")? I mean
>>> that with this patch applied kms->irq_requested makes the check in
>>> dpu_core_irq_uninstall() irrelevant because it isn't called anymore?
>>
>> Yes.
>>
> 
> I didn't see it deleted in the second patch so is a revert going to be
> sent?

No need to. They are separate checks. The older one is superseded (as it 
will be never hit),  but it is still valid and useful (to protect from 
the crash if this code changes again).


-- 
With best wishes
Dmitry
