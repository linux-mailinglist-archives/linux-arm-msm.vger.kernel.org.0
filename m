Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55210689B64
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 15:18:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233536AbjBCORz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 09:17:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233556AbjBCORh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 09:17:37 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F87CA4288
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Feb 2023 06:17:00 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id dr8so15632894ejc.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Feb 2023 06:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VSKlZtNoYJeq5Z8jeVTL5znAn0vVOxDOqQhyYoiyUHk=;
        b=O672AP499Mg2em52Ac0GHXX6QjPb7DLQr56c2s0V01n0ZnmGWibz0dd7y9XxVYb0lU
         Mr0npBBMuqC/ZZfx5gnLFGw9ZAk32e+ZaruW7p5Yk0LbOOXAPRKVlD6hxQd8qaebCcKK
         5HJKSMFSxU6x9piaS5dhTGpLbFXQxTRnJJO1kyqhsHkDpyzpZ55eQAe2MzzJLkZOZaJX
         x06k/lwsp1VeV7RmOY64qVNKvnDNS8JougsDxb2OSKsu5zS0VN+RMqybGQ6eEXq10G7X
         ws+vWdWcvAFFgWOJfD3O0vLLgwDgsn+RC5I+HC9rOVjoXid1qGx5lRMAbVSfa8eVa051
         686g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VSKlZtNoYJeq5Z8jeVTL5znAn0vVOxDOqQhyYoiyUHk=;
        b=xqpybEkNMefo4w1EVtoupq56qOrvFYjwRqJVBkK/RF6VOokoeg05Z3Ha6ASnWF77Vp
         oila+l8ET+36Zly59mRrNMe1M25QadNDHjWl5RDmaFCMynFIWEmtyMY6ziXSYYKAPfYK
         bREEP0RDcXZiRfU34C9Lk5rPsBmTcxrp4/Eh7mGDNfSbTSlZwrxDF8kbhugJz00WlMuB
         z5wYYSqfa98XUve7bX6QJA5mB/01zHlxgjPJnNU2mRyN6T7veF4v2cMZdQG4+2bM9QJa
         iaOmgEHry4LXu03Gjs4NL6lGS25+MaEArKqE2cFvr9l8gVQcClQ14ArHw1GLh6cV2ttf
         g24w==
X-Gm-Message-State: AO0yUKVLA859pZVrW0Wz184s1PYBYxbOxoAjP16BlK2dpy/5Pxktl/wy
        WXMQ8VpBjc9lLWg3rzZDzUZptxyjJtFEjbAy
X-Google-Smtp-Source: AK7set9p2PSXxpiPVO69F5zO4OKxSyIbbONHcykAbCIK/ULUaUBd9rN2wJOABKgeDmblxpYdJHXHlQ==
X-Received: by 2002:a17:907:6290:b0:88d:ba89:1853 with SMTP id nd16-20020a170907629000b0088dba891853mr6300275ejc.36.1675433818927;
        Fri, 03 Feb 2023 06:16:58 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id x10-20020a1709060a4a00b0088091cca1besm1422746ejf.134.2023.02.03.06.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 06:16:58 -0800 (PST)
Message-ID: <d000fec1-e24f-5a31-2484-98df672d8550@linaro.org>
Date:   Fri, 3 Feb 2023 16:16:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 05/27] drm/msm/dpu: drop EAGAIN check from
 dpu_format_populate_layout
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
 <20221229191856.3508092-6-dmitry.baryshkov@linaro.org>
 <aaeb287f-de41-3f63-fd93-b08532964d59@quicinc.com>
 <CAA8EJprHMyPDmHhqZF-AZpqiLNkK7QuoQz-sZu6kSabZ7y76Dw@mail.gmail.com>
 <e03f4fdc-75c1-dbc3-fb1a-05fc9e32d5cc@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <e03f4fdc-75c1-dbc3-fb1a-05fc9e32d5cc@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/01/2023 01:59, Abhinav Kumar wrote:
> 
> 
> On 1/26/2023 10:05 PM, Dmitry Baryshkov wrote:
>> On Fri, 27 Jan 2023 at 02:52, Abhinav Kumar 
>> <quic_abhinavk@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 12/29/2022 11:18 AM, Dmitry Baryshkov wrote:
>>>> The pipe's layout is not cached, corresponding data structure is zeroed
>>>> out each time in the dpu_plane_sspp_atomic_update(), right before the
>>>> call to _dpu_plane_set_scanout() -> dpu_format_populate_layout().
>>>>
>>>> Drop plane_addr comparison against previous layout and corresponding
>>>> EAGAIN handling.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> The change itself LGTM, hence
>>>
>>> But, shouldnt we add this EAGAIN validation or in other words fix this
>>> rather than drop this?
>>
>> What for? Does it really save us anything? What's the price of
>> re-programming the SSPP_SRC0_ADDR registers?
>>
> There are 4 Src registers being programmed per sspp.
> 
> With number of layers going up this will be 4x.
> 
> So lets say there are 5 layers and only one of their address has 
> changed, we need to reprogram only 4 regs but now will reprogram 20.

I think this was the original intention for this change, however the 
implementation ended up being written in a way when this condition 
doesn't trigger at all.

> 
> Thats why i thought this is a good optimization.
> 
> But still, that is a separate change so I am fine if this goes in first 
> as its just removing dead code anyway.
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
-- 
With best wishes
Dmitry

